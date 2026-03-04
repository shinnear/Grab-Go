import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'addcategory_widget.dart' show AddcategoryWidget;
import 'package:flutter/material.dart';

class AddcategoryModel extends FlutterFlowModel<AddcategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for categoryname widget.
  FocusNode? categorynameFocusNode;
  TextEditingController? categorynameTextController;
  String? Function(BuildContext, String?)? categorynameTextControllerValidator;
  String? _categorynameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Category Name * is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 15) {
      return 'Maximum 15 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for desccategory widget.
  FocusNode? desccategoryFocusNode;
  TextEditingController? desccategoryTextController;
  String? Function(BuildContext, String?)? desccategoryTextControllerValidator;
  String? _desccategoryTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    categorynameTextControllerValidator = _categorynameTextControllerValidator;
    desccategoryTextControllerValidator = _desccategoryTextControllerValidator;
  }

  @override
  void dispose() {
    categorynameFocusNode?.dispose();
    categorynameTextController?.dispose();

    desccategoryFocusNode?.dispose();
    desccategoryTextController?.dispose();
  }
}
