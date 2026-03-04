import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableReservationRecord extends FirestoreRecord {
  TableReservationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "occasion" field.
  String? _occasion;
  String get occasion => _occasion ?? '';
  bool hasOccasion() => _occasion != null;

  // "table_type" field.
  String? _tableType;
  String get tableType => _tableType ?? '';
  bool hasTableType() => _tableType != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "date_reservation" field.
  DateTime? _dateReservation;
  DateTime? get dateReservation => _dateReservation;
  bool hasDateReservation() => _dateReservation != null;

  // "number_perso" field.
  String? _numberPerso;
  String get numberPerso => _numberPerso ?? '';
  bool hasNumberPerso() => _numberPerso != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _occasion = snapshotData['occasion'] as String?;
    _tableType = snapshotData['table_type'] as String?;
    _status = snapshotData['status'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _dateReservation = snapshotData['date_reservation'] as DateTime?;
    _numberPerso = snapshotData['number_perso'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('table_reservation');

  static Stream<TableReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TableReservationRecord.fromSnapshot(s));

  static Future<TableReservationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TableReservationRecord.fromSnapshot(s));

  static TableReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TableReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TableReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TableReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TableReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TableReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTableReservationRecordData({
  String? description,
  String? occasion,
  String? tableType,
  String? status,
  DocumentReference? userRef,
  DateTime? dateReservation,
  String? numberPerso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'occasion': occasion,
      'table_type': tableType,
      'status': status,
      'user_ref': userRef,
      'date_reservation': dateReservation,
      'number_perso': numberPerso,
    }.withoutNulls,
  );

  return firestoreData;
}

class TableReservationRecordDocumentEquality
    implements Equality<TableReservationRecord> {
  const TableReservationRecordDocumentEquality();

  @override
  bool equals(TableReservationRecord? e1, TableReservationRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.occasion == e2?.occasion &&
        e1?.tableType == e2?.tableType &&
        e1?.status == e2?.status &&
        e1?.userRef == e2?.userRef &&
        e1?.dateReservation == e2?.dateReservation &&
        e1?.numberPerso == e2?.numberPerso;
  }

  @override
  int hash(TableReservationRecord? e) => const ListEquality().hash([
        e?.description,
        e?.occasion,
        e?.tableType,
        e?.status,
        e?.userRef,
        e?.dateReservation,
        e?.numberPerso
      ]);

  @override
  bool isValidKey(Object? o) => o is TableReservationRecord;
}
