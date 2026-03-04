import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'modiftablereservation_widget.dart' show ModiftablereservationWidget;
import 'package:flutter/material.dart';

class ModiftablereservationModel
    extends FlutterFlowModel<ModiftablereservationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in modiftablereservation widget.
  TableReservationRecord? reservationDoc;
  DateTime? datePicked;
  // State field(s) for descreservation widget.
  FocusNode? descreservationFocusNode;
  TextEditingController? descreservationTextController;
  String? Function(BuildContext, String?)?
      descreservationTextControllerValidator;
  String? _descreservationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'description is required';
    }

    if (val.length < 10) {
      return 'Description must have 10 caracters at least';
    }
    if (val.length > 30) {
      return 'Description must have  maximum 30 caracters';
    }

    return null;
  }

  // State field(s) for nbrpersonne widget.
  String? nbrpersonneValue;
  FormFieldController<String>? nbrpersonneValueController;
  // State field(s) for occasion widget.
  String? occasionValue;
  FormFieldController<String>? occasionValueController;
  // State field(s) for typetable widget.
  String? typetableValue;
  FormFieldController<String>? typetableValueController;

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
