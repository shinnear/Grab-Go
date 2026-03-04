import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantFeedbackRecord extends FirestoreRecord {
  RestaurantFeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "rating_food" field.
  int? _ratingFood;
  int get ratingFood => _ratingFood ?? 0;
  bool hasRatingFood() => _ratingFood != null;

  // "rating_service" field.
  int? _ratingService;
  int get ratingService => _ratingService ?? 0;
  bool hasRatingService() => _ratingService != null;

  // "created_ait" field.
  DateTime? _createdAit;
  DateTime? get createdAit => _createdAit;
  bool hasCreatedAit() => _createdAit != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _ratingFood = castToType<int>(snapshotData['rating_food']);
    _ratingService = castToType<int>(snapshotData['rating_service']);
    _createdAit = snapshotData['created_ait'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurant_feedback');

  static Stream<RestaurantFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantFeedbackRecord.fromSnapshot(s));

  static Future<RestaurantFeedbackRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RestaurantFeedbackRecord.fromSnapshot(s));

  static RestaurantFeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantFeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantFeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantFeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantFeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantFeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantFeedbackRecordData({
  String? description,
  String? image,
  int? ratingFood,
  int? ratingService,
  DateTime? createdAit,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'image': image,
      'rating_food': ratingFood,
      'rating_service': ratingService,
      'created_ait': createdAit,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantFeedbackRecordDocumentEquality
    implements Equality<RestaurantFeedbackRecord> {
  const RestaurantFeedbackRecordDocumentEquality();

  @override
  bool equals(RestaurantFeedbackRecord? e1, RestaurantFeedbackRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.ratingFood == e2?.ratingFood &&
        e1?.ratingService == e2?.ratingService &&
        e1?.createdAit == e2?.createdAit &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(RestaurantFeedbackRecord? e) => const ListEquality().hash([
        e?.description,
        e?.image,
        e?.ratingFood,
        e?.ratingService,
        e?.createdAit,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantFeedbackRecord;
}
