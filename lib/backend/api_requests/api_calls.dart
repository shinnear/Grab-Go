import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateStripeCheckoutCall {
  static Future<ApiCallResponse> call({
    int? amount,
    String? product = '',
    int? quantity,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createStripeCheckout',
      apiUrl: 'https://api.stripe.com/v1/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51T4ohjLenN9WjLv2DcLEEyDzNTstf8Kl5FQ6UEl2Cp3HGylxiiYIFSK1cZkMtcD3erLP1VJbAovjE1pVsIqyGfNK00kpd9Q5UP',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'payment_method_types[0]': "card",
        'line_items[0][price_data][currency]': "eur",
        'line_items[0][price_data][unit_amount]': amount,
        'line_items[0][price_data][product_data][name]': product,
        'line_items[0][quantity]': quantity,
        'mode': "payment",
        'success_url': "myapp://payment/success",
        'cancel_url': "myapp://payment/cancel",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateStripePaymentIntentCall {
  static Future<ApiCallResponse> call({
    String? amount = '',
    String? currency = '',
    String? description = '',
    List<String>? paymentMethodTypesList,
  }) async {
    final paymentMethodTypes = _serializeList(paymentMethodTypesList);

    return ApiManager.instance.makeApiCall(
      callName: 'CreateStripePaymentIntent',
      apiUrl: 'https://api.stripe.com/v1/payment_intents',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51T4ohjLenN9WjLv2DcLEEyDzNTstf8Kl5FQ6UEl2Cp3HGylxiiYIFSK1cZkMtcD3erLP1VJbAovjE1pVsIqyGfNK00kpd9Q5UP',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'amount': amount,
        'currency': currency,
        'description': description,
        'payment_method_types[]': "card",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateImage',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=58e5462d272f5443da52a05a70a4cf86',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendReservationEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? status = '',
  }) async {
    final ffApiRequestBody = '''
''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendReservationEmail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
