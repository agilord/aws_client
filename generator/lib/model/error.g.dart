// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpError _$HttpErrorFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      allowedKeys: const ['code', 'httpStatusCode', 'senderFault']);
  return HttpError(
    json['code'] as String,
    json['httpStatusCode'] as int,
    json['senderFault'] as bool ?? false,
  );
}
