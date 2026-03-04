import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'addproduct_widget.dart' show AddproductWidget;
import 'package:flutter/material.dart';

class AddproductModel extends FlutterFlowModel<AddproductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameproduct widget.
  FocusNode? nameproductFocusNode;
  TextEditingController? nameproductTextController;
  String? Function(BuildContext, String?)? nameproductTextControllerValidator;
  // State field(s) for descproduct widget.
  FocusNode? descproductFocusNode;
  TextEditingController? descproductTextController;
  String? Function(BuildContext, String?)? descproductTextControllerValidator;
  // State field(s) for priceproduct widget.
  FocusNode? priceproductFocusNode;
  TextEditingController? priceproductTextController;
  String? Function(BuildContext, String?)? priceproductTextControllerValidator;
  bool isDataUploading_uploadData5x31 = false;
  FFUploadedFile uploadedLocalFile_uploadData5x31 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (CreateImage)] action in Upload1 widget.
  ApiCallResponse? apiResult8vg;
  // State field(s) for categoryproduct widget.
  String? categoryproductValue;
  FormFieldController<String>? categoryproductValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameproductFocusNode?.dispose();
    nameproductTextController?.dispose();

    descproductFocusNode?.dispose();
    descproductTextController?.dispose();

    priceproductFocusNode?.dispose();
    priceproductTextController?.dispose();
  }
}
