import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'productmanagement_widget.dart' show ProductmanagementWidget;
import 'package:flutter/material.dart';

class ProductmanagementModel extends FlutterFlowModel<ProductmanagementWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
