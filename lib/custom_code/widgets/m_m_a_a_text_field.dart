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

import 'package:flutter/services.dart';

class MMAATextField extends StatefulWidget {
  const MMAATextField({
    Key? key,
    this.width,
    this.height,
    required this.onChanged,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future Function(String valeur) onChanged;

  @override
  State<MMAATextField> createState() => _MMAATextFieldState();
}

class _MMAATextFieldState extends State<MMAATextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        maxLength: 5,
        decoration: InputDecoration(
          hintText: 'MM/AA',
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          counterText: '',
          // ✅ Fill color #f5f5f5
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          // ✅ Icon calendrier à droite
          suffixIcon: Icon(
            Icons.calendar_today_outlined,
            color: Colors.grey.shade500,
            size: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _MMAAFormatter(),
        ],
        onChanged: (value) async {
          await widget.onChanged(value);
        },
      ),
    );
  }
}

class _MMAAFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll('/', '');

    if (text.length > 4) text = text.substring(0, 4);

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(text[i]);
    }

    String formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
