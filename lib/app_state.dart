import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _orderType = '';
  String get orderType => _orderType;
  set orderType(String value) {
    _orderType = value;
  }

  String _stripeCheckoutUrl = '';
  String get stripeCheckoutUrl => _stripeCheckoutUrl;
  set stripeCheckoutUrl(String value) {
    _stripeCheckoutUrl = value;
  }

  String _numtlf = '';
  String get numtlf => _numtlf;
  set numtlf(String value) {
    _numtlf = value;
  }

  String _addr = '';
  String get addr => _addr;
  set addr(String value) {
    _addr = value;
  }

  String _addrliv = '';
  String get addrliv => _addrliv;
  set addrliv(String value) {
    _addrliv = value;
  }

  bool _showCartpanier = false;
  bool get showCartpanier => _showCartpanier;
  set showCartpanier(bool value) {
    _showCartpanier = value;
  }

  bool _sidebarhomeclient = false;
  bool get sidebarhomeclient => _sidebarhomeclient;
  set sidebarhomeclient(bool value) {
    _sidebarhomeclient = value;
  }

  String _ImageProd = '';
  String get ImageProd => _ImageProd;
  set ImageProd(String value) {
    _ImageProd = value;
  }

  DocumentReference? _selectedCategoryRef;
  DocumentReference? get selectedCategoryRef => _selectedCategoryRef;
  set selectedCategoryRef(DocumentReference? value) {
    _selectedCategoryRef = value;
  }

  String _selectedTri = '';
  String get selectedTri => _selectedTri;
  set selectedTri(String value) {
    _selectedTri = value;
  }
}
