import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PairCategoriesRecord extends FirestoreRecord {
  PairCategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _banner = snapshotData['banner'] as String?;
    _icon = snapshotData['icon'] as String?;
    _slug = snapshotData['slug'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PairCategories');

  static Stream<PairCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PairCategoriesRecord.fromSnapshot(s));

  static Future<PairCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PairCategoriesRecord.fromSnapshot(s));

  static PairCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PairCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PairCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PairCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PairCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PairCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPairCategoriesRecordData({
  String? name,
  String? description,
  int? id,
  String? banner,
  String? icon,
  String? slug,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'id': id,
      'banner': banner,
      'icon': icon,
      'slug': slug,
    }.withoutNulls,
  );

  return firestoreData;
}

class PairCategoriesRecordDocumentEquality
    implements Equality<PairCategoriesRecord> {
  const PairCategoriesRecordDocumentEquality();

  @override
  bool equals(PairCategoriesRecord? e1, PairCategoriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.id == e2?.id &&
        e1?.banner == e2?.banner &&
        e1?.icon == e2?.icon &&
        e1?.slug == e2?.slug;
  }

  @override
  int hash(PairCategoriesRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.id, e?.banner, e?.icon, e?.slug]);

  @override
  bool isValidKey(Object? o) => o is PairCategoriesRecord;
}
