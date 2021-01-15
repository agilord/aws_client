// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-09-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteObjectResponse _$DeleteObjectResponseFromJson(Map<String, dynamic> json) {
  return DeleteObjectResponse();
}

DescribeObjectResponse _$DescribeObjectResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeObjectResponse(
    cacheControl: json['Cache-Control'] as String,
    contentLength: json['Content-Length'] as int,
    contentType: json['Content-Type'] as String,
    eTag: json['ETag'] as String,
    lastModified: const RfcDateTimeConverter().fromJson(json['Last-Modified']),
  );
}

GetObjectResponse _$GetObjectResponseFromJson(Map<String, dynamic> json) {
  return GetObjectResponse(
    statusCode: json['StatusCode'] as int,
    body: const Uint8ListConverter().fromJson(json['Body'] as String),
    cacheControl: json['Cache-Control'] as String,
    contentLength: json['Content-Length'] as int,
    contentRange: json['Content-Range'] as String,
    contentType: json['Content-Type'] as String,
    eTag: json['ETag'] as String,
    lastModified: const RfcDateTimeConverter().fromJson(json['Last-Modified']),
  );
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    contentLength: json['ContentLength'] as int,
    contentType: json['ContentType'] as String,
    eTag: json['ETag'] as String,
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$ItemTypeEnumMap, json['Type']),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ItemTypeEnumMap = {
  ItemType.object: 'OBJECT',
  ItemType.folder: 'FOLDER',
};

ListItemsResponse _$ListItemsResponseFromJson(Map<String, dynamic> json) {
  return ListItemsResponse(
    items: (json['Items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

PutObjectResponse _$PutObjectResponseFromJson(Map<String, dynamic> json) {
  return PutObjectResponse(
    contentSHA256: json['ContentSHA256'] as String,
    eTag: json['ETag'] as String,
    storageClass:
        _$enumDecodeNullable(_$StorageClassEnumMap, json['StorageClass']),
  );
}

const _$StorageClassEnumMap = {
  StorageClass.temporal: 'TEMPORAL',
};
