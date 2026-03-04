// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> createStripeSession(
  String amountInCents,
  String currency,
  String productName,
) async {
  final response = await http.post(
    Uri.parse('https://api.stripe.com/v1/checkout/sessions'),
    headers: {
      'Authorization': 'Bearer sk_test_VOTRE_CLE_STRIPE',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'payment_method_types[0]': 'card',
      'line_items[0][price_data][currency]': currency,
      'line_items[0][price_data][unit_amount]': amountInCents.toString(),
      'line_items[0][price_data][product_data][name]': productName,
      'line_items[0][quantity]': '1',
      'mode': 'payment',
      'success_url': 'myapp://payment/success',
      'cancel_url': 'myapp://payment/cancel',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['url'] as String;
  }
  return '';
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
