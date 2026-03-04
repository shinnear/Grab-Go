// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong2;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class OpenStreetMap extends StatefulWidget {
  const OpenStreetMap({
    Key? key,
    this.width,
    this.height,
    this.latitude = 36.8065,
    this.longitude = 10.1815,
    this.zoom = 13.0,
    this.onAddressSelected,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double latitude;
  final double longitude;
  final double zoom;
  final Future<dynamic> Function(String address)? onAddressSelected;

  @override
  State<OpenStreetMap> createState() => _OpenStreetMapState();
}

class _OpenStreetMapState extends State<OpenStreetMap> {
  late MapController _mapController;
  late latlong2.LatLng _markerPosition;

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _suggestions = [];
  Timer? _debounce;
  bool _isSearching = false;
  bool _isLocating = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _markerPosition = latlong2.LatLng(widget.latitude, widget.longitude);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    if (query.length < 3) {
      setState(() => _suggestions = []);
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 600), () => _search(query));
  }

  Future<void> _search(String query) async {
    setState(() => _isSearching = true);
    try {
      final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search'
        '?q=${Uri.encodeComponent(query)}'
        '&format=json&addressdetails=1&limit=5&countrycodes=tn',
      );
      final res = await http.get(uri, headers: {
        'Accept-Language': 'fr',
        'User-Agent': 'com.mycompany.sportproject/1.0 (contact@monapp.com)',
      });
      if (res.statusCode == 200) {
        final List data = json.decode(res.body);
        setState(() {
          _suggestions = data
              .map<Map<String, dynamic>>((e) => {
                    'display_name': e['display_name'],
                    'lat': double.parse(e['lat']),
                    'lon': double.parse(e['lon']),
                  })
              .toList();
        });
      }
    } catch (_) {}
    setState(() => _isSearching = false);
  }

  void _selectSuggestion(Map<String, dynamic> place) {
    final pos = latlong2.LatLng(place['lat'], place['lon']);
    final address = place['display_name'] as String;
    _searchController.text = address;
    setState(() {
      _markerPosition = pos;
      _suggestions = [];
    });
    _mapController.move(pos, 15.0);
    _notifyFlutterFlow(address);
  }

  Future<void> _goToMyLocation() async {
    setState(() => _isLocating = true);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showSnack('Activez le GPS sur votre appareil');
        setState(() => _isLocating = false);
        return;
      }
      LocationPermission perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
      }
      if (perm == LocationPermission.deniedForever) {
        _showSnack('Permission de localisation refusée');
        setState(() => _isLocating = false);
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final latlng = latlong2.LatLng(pos.latitude, pos.longitude);
      setState(() => _markerPosition = latlng);
      _mapController.move(latlng, 16.0);
      await _reverseGeocode(latlng);
    } catch (e) {
      _showSnack('Impossible d\'obtenir la position');
    }
    setState(() => _isLocating = false);
  }

  Future<void> _reverseGeocode(latlong2.LatLng pos) async {
    try {
      final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse'
        '?lat=${pos.latitude}&lon=${pos.longitude}&format=json',
      );
      final res = await http.get(uri, headers: {
        'Accept-Language': 'fr',
        'User-Agent': 'com.mycompany.sportproject/1.0 (contact@monapp.com)',
      });
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        final address = (data['display_name'] ?? '') as String;
        setState(() {
          _searchController.text = address;
          _suggestions = [];
        });
        _notifyFlutterFlow(address);
      }
    } catch (_) {}
  }

  void _notifyFlutterFlow(String address) {
    widget.onAddressSelected?.call(address);
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 380,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            hintText: 'Rechercher une adresse…',
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear,
                                        color: Colors.grey),
                                    onPressed: () {
                                      _searchController.clear();
                                      setState(() => _suggestions = []);
                                    },
                                  )
                                : null,
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: _isLocating ? null : _goToMyLocation,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: _isLocating
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.my_location,
                                color: Colors.white, size: 22),
                      ),
                    ),
                  ],
                ),
                if (_isSearching) const LinearProgressIndicator(minHeight: 2),
                if (_suggestions.isNotEmpty)
                  Container(
                    constraints: const BoxConstraints(maxHeight: 180),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _suggestions.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, color: Colors.black12),
                      itemBuilder: (context, i) {
                        final s = _suggestions[i];
                        return ListTile(
                          dense: true,
                          leading: const Icon(Icons.place_outlined,
                              color: Colors.redAccent),
                          title: Text(
                            s['display_name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          ),
                          onTap: () => _selectSuggestion(s),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: _markerPosition,
                  zoom: widget.zoom,
                  onTap: (tapPosition, latlng) async {
                    setState(() => _markerPosition = latlng);
                    await _reverseGeocode(latlng);
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png',
                    subdomains: const ['a', 'b', 'c', 'd'],
                    userAgentPackageName: 'com.mycompany.sportproject',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: _markerPosition,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
