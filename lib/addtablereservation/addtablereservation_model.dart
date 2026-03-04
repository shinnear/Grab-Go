import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'addtablereservation_widget.dart' show AddtablereservationWidget;
import 'package:flutter/material.dart';

class AddtablereservationModel
    extends FlutterFlowModel<AddtablereservationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for descreservation widget.
  FocusNode? descreservationFocusNode;
  TextEditingController? descreservationTextController;
  String? Function(BuildContext, String?)?
      descreservationTextControllerValidator;
  String? _descreservationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    if (val.length < 10) {
      return 'Description must have 10 caracters at least';
    }
    if (val.length > 30) {
      return 'Description must have maximum 30 caracters ';
    }

    return null;
  }

  // State field(s) for nbrpersonne widget.
  String? nbrpersonneValue;
  FormFieldController<String>? nbrpersonneValueController;
  // State field(s) for occasion widget.
  String? occasionValue;
  FormFieldController<String>? occasionValueController;
  // State field(s) for tabletype widget.
  String? tabletypeValue;
  FormFieldController<String>? tabletypeValueController;

  @override
  void initState(BuildContext context) {
    descreservationTextControllerValidator =
        _descreservationTextControllerValidator;
  }

  @override
  void dispose() {
    descreservationFocusNode?.dispose();
    descreservationTextController?.dispose();
  }
}
