import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PairListsRecord extends FirestoreRecord {
  PairListsRecord._(
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

  // "system_symbol" field.
  String? _systemSymbol;
  String get systemSymbol => _systemSymbol ?? '';
  bool hasSystemSymbol() => _systemSymbol != null;

  // "tv_symbol" field.
  String? _tvSymbol;
  String get tvSymbol => _tvSymbol ?? '';
  bool hasTvSymbol() => _tvSymbol != null;

  // "category_id" field.
  int? _categoryId;
  int get categoryId => _categoryId ?? 0;
  bool hasCategoryId() => _categoryId != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  // "direction" field.
  String? _direction;
  String get direction => _direction ?? '';
  bool hasDirection() => _direction != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  bool hasSortOrder() => _sortOrder != null;

  // "digits" field.
  int? _digits;
  int get digits => _digits ?? 0;
  bool hasDigits() => _digits != null;

  // "bid" field.
  String? _bid;
  String get bid => _bid ?? '';
  bool hasBid() => _bid != null;

  // "ask" field.
  String? _ask;
  String get ask => _ask ?? '';
  bool hasAsk() => _ask != null;

  // "daily" field.
  String? _daily;
  String get daily => _daily ?? '';
  bool hasDaily() => _daily != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _banner = snapshotData['banner'] as String?;
    _icon = snapshotData['icon'] as String?;
    _systemSymbol = snapshotData['system_symbol'] as String?;
    _tvSymbol = snapshotData['tv_symbol'] as String?;
    _categoryId = castToType<int>(snapshotData['category_id']);
    _slug = snapshotData['slug'] as String?;
    _direction = snapshotData['direction'] as String?;
    _sortOrder = castToType<int>(snapshotData['sort_order']);
    _digits = castToType<int>(snapshotData['digits']);
    _bid = snapshotData['bid'] as String?;
    _ask = snapshotData['ask'] as String?;
    _daily = snapshotData['daily'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PairLists');

  static Stream<PairListsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PairListsRecord.fromSnapshot(s));

  static Future<PairListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PairListsRecord.fromSnapshot(s));

  static PairListsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PairListsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PairListsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PairListsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PairListsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PairListsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPairListsRecordData({
  String? name,
  String? description,
  int? id,
  String? banner,
  String? icon,
  String? systemSymbol,
  String? tvSymbol,
  int? categoryId,
  String? slug,
  String? direction,
  int? sortOrder,
  int? digits,
  String? bid,
  String? ask,
  String? daily,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'id': id,
      'banner': banner,
      'icon': icon,
      'system_symbol': systemSymbol,
      'tv_symbol': tvSymbol,
      'category_id': categoryId,
      'slug': slug,
      'direction': direction,
      'sort_order': sortOrder,
      'digits': digits,
      'bid': bid,
      'ask': ask,
      'daily': daily,
    }.withoutNulls,
  );

  return firestoreData;
}

class PairListsRecordDocumentEquality implements Equality<PairListsRecord> {
  const PairListsRecordDocumentEquality();

  @override
  bool equals(PairListsRecord? e1, PairListsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.id == e2?.id &&
        e1?.banner == e2?.banner &&
        e1?.icon == e2?.icon &&
        e1?.systemSymbol == e2?.systemSymbol &&
        e1?.tvSymbol == e2?.tvSymbol &&
        e1?.categoryId == e2?.categoryId &&
        e1?.slug == e2?.slug &&
        e1?.direction == e2?.direction &&
        e1?.sortOrder == e2?.sortOrder &&
        e1?.digits == e2?.digits &&
        e1?.bid == e2?.bid &&
        e1?.ask == e2?.ask &&
        e1?.daily == e2?.daily;
  }

  @override
  int hash(PairListsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.id,
        e?.banner,
        e?.icon,
        e?.systemSymbol,
        e?.tvSymbol,
        e?.categoryId,
        e?.slug,
        e?.direction,
        e?.sortOrder,
        e?.digits,
        e?.bid,
        e?.ask,
        e?.daily
      ]);

  @override
  bool isValidKey(Object? o) => o is PairListsRecord;
}
