import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'viewfeedback_widget.dart' show ViewfeedbackWidget;
import 'package:flutter/material.dart';

class ViewfeedbackModel extends FlutterFlowModel<ViewfeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for descproduct widget.
  FocusNode? descproductFocusNode;
  TextEditingController? descproductTextController;
  String? Function(BuildContext, String?)? descproductTextControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descproductFocusNode?.dispose();
    descproductTextController?.dispose();
  }
}
