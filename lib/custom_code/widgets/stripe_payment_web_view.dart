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

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui_web' as ui_web;
import 'dart:html' as html;

class StripePaymentWebView extends StatefulWidget {
  final String? checkoutUrl;
  final double width;
  final double height;
  final Future Function()? onPaymentSuccess;
  final Future Function()? onPaymentCancel;

  const StripePaymentWebView({
    Key? key,
    this.checkoutUrl,
    required this.width,
    required this.height,
    this.onPaymentSuccess,
    this.onPaymentCancel,
  }) : super(key: key);

  @override
  State<StripePaymentWebView> createState() => _StripePaymentWebViewState();
}

class _StripePaymentWebViewState extends State<StripePaymentWebView> {
  bool _isLoading = true;
  late final String _viewId;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      _viewId = 'stripe-webview-${DateTime.now().millisecondsSinceEpoch}';

      // Écouter les messages depuis l'iframe
      html.window.onMessage.listen((event) {
        final data = event.data.toString();
        if (data == 'payment_success') {
          widget.onPaymentSuccess?.call();
        } else if (data == 'payment_cancel') {
          widget.onPaymentCancel?.call();
        }
      });

      // Créer l'iframe HTML
      final iframe = html.IFrameElement()
        ..src = widget.checkoutUrl ?? ''
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..onLoad.listen((_) => setState(() => _isLoading = false));

      ui_web.platformViewRegistry.registerViewFactory(
        _viewId,
        (int viewId) => iframe,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            HtmlElementView(viewType: _viewId),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF635BFF),
                ),
              ),
          ],
        ),
      );
    }

    // Mobile : webview_flutter classique
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) => setState(() => _isLoading = true),
        onPageFinished: (_) => setState(() => _isLoading = false),
        onNavigationRequest: (request) {
          if (request.url.contains('myapp://payment/success')) {
            widget.onPaymentSuccess?.call();
            return NavigationDecision.prevent;
          }
          if (request.url.contains('myapp://payment/cancel')) {
            widget.onPaymentCancel?.call();
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onWebResourceError: (error) =>
            debugPrint('Error: ${error.description}'),
      ))
      ..loadRequest(Uri.parse(widget.checkoutUrl ?? ''));

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF635BFF),
              ),
            ),
        ],
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
