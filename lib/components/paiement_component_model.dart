import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'paiement_component_widget.dart' show PaiementComponentWidget;
import 'package:flutter/material.dart';

class PaiementComponentModel extends FlutterFlowModel<PaiementComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for carte widget.
  FocusNode? carteFocusNode;
  TextEditingController? carteTextController;
  String? Function(BuildContext, String?)? carteTextControllerValidator;
  String? _carteTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Numero de la carte obligatoire';
    }

    if (val.length < 16) {
      return 'La carte doit contenir 16 chiffres';
    }
    if (val.length > 16) {
      return 'La carte doit contenir 16 chiffres';
    }
    if (!RegExp('^\\d{16}\$').hasMatch(val)) {
      return 'numero de carte invalide';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'CVC is required';
    }

    if (!RegExp('^\\d{3}\$').hasMatch(val)) {
      return 'cvc invalide';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nom de Détenteur is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (CreateStripePaymentIntent)] action in Button widget.
  ApiCallResponse? stripeResponse;
  // Stores action output result for [Custom Action - extractNomsProduits] action in Button widget.
  List<String>? extractNomsProduits;

  @override
  void initState(BuildContext context) {
    carteTextControllerValidator = _carteTextControllerValidator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    carteFocusNode?.dispose();
    carteTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
