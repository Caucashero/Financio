import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryListRecord extends FirestoreRecord {
  CountryListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "phone_code" field.
  String? _phoneCode;
  String get phoneCode => _phoneCode ?? '';
  bool hasPhoneCode() => _phoneCode != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _countryCode = snapshotData['country_code'] as String?;
    _title = snapshotData['title'] as String?;
    _phoneCode = snapshotData['phone_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CountryList');

  static Stream<CountryListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountryListRecord.fromSnapshot(s));

  static Future<CountryListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountryListRecord.fromSnapshot(s));

  static CountryListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountryListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountryListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountryListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountryListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountryListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountryListRecordData({
  int? id,
  String? countryCode,
  String? title,
  String? phoneCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'country_code': countryCode,
      'title': title,
      'phone_code': phoneCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountryListRecordDocumentEquality implements Equality<CountryListRecord> {
  const CountryListRecordDocumentEquality();

  @override
  bool equals(CountryListRecord? e1, CountryListRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.countryCode == e2?.countryCode &&
        e1?.title == e2?.title &&
        e1?.phoneCode == e2?.phoneCode;
  }

  @override
  int hash(CountryListRecord? e) => const ListEquality()
      .hash([e?.id, e?.countryCode, e?.title, e?.phoneCode]);

  @override
  bool isValidKey(Object? o) => o is CountryListRecord;
}
