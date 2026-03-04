import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderQueueRecord extends FirestoreRecord {
  OrderQueueRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order" field.
  DocumentReference? _order;
  DocumentReference? get order => _order;
  bool hasOrder() => _order != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  bool hasTotal() => _total != null;

  void _initializeFields() {
    _order = snapshotData['order'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _total = castToType<int>(snapshotData['total']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_queue');

  static Stream<OrderQueueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderQueueRecord.fromSnapshot(s));

  static Future<OrderQueueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderQueueRecord.fromSnapshot(s));

  static OrderQueueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderQueueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderQueueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderQueueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderQueueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderQueueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderQueueRecordData({
  DocumentReference? order,
  DocumentReference? user,
  String? status,
  DateTime? time,
  int? total,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'user': user,
      'status': status,
      'time': time,
      'total': total,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderQueueRecordDocumentEquality implements Equality<OrderQueueRecord> {
  const OrderQueueRecordDocumentEquality();

  @override
  bool equals(OrderQueueRecord? e1, OrderQueueRecord? e2) {
    return e1?.order == e2?.order &&
        e1?.user == e2?.user &&
        e1?.status == e2?.status &&
        e1?.time == e2?.time &&
        e1?.total == e2?.total;
  }

  @override
  int hash(OrderQueueRecord? e) => const ListEquality()
      .hash([e?.order, e?.user, e?.status, e?.time, e?.total]);

  @override
  bool isValidKey(Object? o) => o is OrderQueueRecord;
}
