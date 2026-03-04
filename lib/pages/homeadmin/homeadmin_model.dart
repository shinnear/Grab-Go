import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homeadmin_widget.dart' show HomeadminWidget;
import 'package:flutter/material.dart';

class HomeadminModel extends FlutterFlowModel<HomeadminWidget> {
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
