import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommandesRecord extends FirestoreRecord {
  CommandesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "iduser" field.
  DocumentReference? _iduser;
  DocumentReference? get iduser => _iduser;
  bool hasIduser() => _iduser != null;

  // "addresse" field.
  String? _addresse;
  String get addresse => _addresse ?? '';
  bool hasAddresse() => _addresse != null;

  // "numtlf" field.
  String? _numtlf;
  String get numtlf => _numtlf ?? '';
  bool hasNumtlf() => _numtlf != null;

  // "montant" field.
  String? _montant;
  String get montant => _montant ?? '';
  bool hasMontant() => _montant != null;

  // "idpanier" field.
  DocumentReference? _idpanier;
  DocumentReference? get idpanier => _idpanier;
  bool hasIdpanier() => _idpanier != null;

  void _initializeFields() {
    _iduser = snapshotData['iduser'] as DocumentReference?;
    _addresse = snapshotData['addresse'] as String?;
    _numtlf = snapshotData['numtlf'] as String?;
    _montant = snapshotData['montant'] as String?;
    _idpanier = snapshotData['idpanier'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commandes');

  static Stream<CommandesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommandesRecord.fromSnapshot(s));

  static Future<CommandesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommandesRecord.fromSnapshot(s));

  static CommandesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommandesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommandesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommandesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommandesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommandesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommandesRecordData({
  DocumentReference? iduser,
  String? addresse,
  String? numtlf,
  String? montant,
  DocumentReference? idpanier,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'iduser': iduser,
      'addresse': addresse,
      'numtlf': numtlf,
      'montant': montant,
      'idpanier': idpanier,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommandesRecordDocumentEquality implements Equality<CommandesRecord> {
  const CommandesRecordDocumentEquality();

  @override
  bool equals(CommandesRecord? e1, CommandesRecord? e2) {
    return e1?.iduser == e2?.iduser &&
        e1?.addresse == e2?.addresse &&
        e1?.numtlf == e2?.numtlf &&
        e1?.montant == e2?.montant &&
        e1?.idpanier == e2?.idpanier;
  }

  @override
  int hash(CommandesRecord? e) => const ListEquality()
      .hash([e?.iduser, e?.addresse, e?.numtlf, e?.montant, e?.idpanier]);

  @override
  bool isValidKey(Object? o) => o is CommandesRecord;
}
