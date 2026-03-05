import '/flutter_flow/flutter_flow_util.dart';
import 'modifyfeedback_widget.dart' show ModifyfeedbackWidget;
import 'package:flutter/material.dart';

class ModifyfeedbackModel extends FlutterFlowModel<ModifyfeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for descproduct widget.
  FocusNode? descproductFocusNode;
  TextEditingController? descproductTextController;
  String? Function(BuildContext, String?)? descproductTextControllerValidator;
  String? _descproductTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 500) {
      return 'Maximum 500 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  bool isDataUploading_uploadDataBex = false;
  FFUploadedFile uploadedLocalFile_uploadDataBex =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataBex = '';

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;

  @override
  void initState(BuildContext context) {
    descproductTextControllerValidator = _descproductTextControllerValidator;
  }

  @override
  void dispose() {
    descproductFocusNode?.dispose();
    descproductTextController?.dispose();
  }
}
