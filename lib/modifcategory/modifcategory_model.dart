import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'modifcategory_widget.dart' show ModifcategoryWidget;
import 'package:flutter/material.dart';

class ModifcategoryModel extends FlutterFlowModel<ModifcategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for categoryname widget.
  FocusNode? categorynameFocusNode;
  TextEditingController? categorynameTextController;
  String? Function(BuildContext, String?)? categorynameTextControllerValidator;
  // State field(s) for desccategory widget.
  FocusNode? desccategoryFocusNode;
  TextEditingController? desccategoryTextController;
  String? Function(BuildContext, String?)? desccategoryTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    categorynameFocusNode?.dispose();
    categorynameTextController?.dispose();

    desccategoryFocusNode?.dispose();
    desccategoryTextController?.dispose();
  }
}
