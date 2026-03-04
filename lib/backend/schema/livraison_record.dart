import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LivraisonRecord extends FirestoreRecord {
  LivraisonRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "estimated_time" field.
  DateTime? _estimatedTime;
  DateTime? get estimatedTime => _estimatedTime;
  bool hasEstimatedTime() => _estimatedTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _location = snapshotData['location'] as String?;
    _status = snapshotData['status'] as String?;
    _estimatedTime = snapshotData['estimated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('livraison');

  static Stream<LivraisonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LivraisonRecord.fromSnapshot(s));

  static Future<LivraisonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LivraisonRecord.fromSnapshot(s));

  static LivraisonRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LivraisonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LivraisonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LivraisonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LivraisonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LivraisonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLivraisonRecordData({
  String? location,
  String? status,
  DateTime? estimatedTime,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'status': status,
      'estimated_time': estimatedTime,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class LivraisonRecordDocumentEquality implements Equality<LivraisonRecord> {
  const LivraisonRecordDocumentEquality();

  @override
  bool equals(LivraisonRecord? e1, LivraisonRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.status == e2?.status &&
        e1?.estimatedTime == e2?.estimatedTime &&
        e1?.user == e2?.user;
  }

  @override
  int hash(LivraisonRecord? e) => const ListEquality()
      .hash([e?.location, e?.status, e?.estimatedTime, e?.user]);

  @override
  bool isValidKey(Object? o) => o is LivraisonRecord;
}
