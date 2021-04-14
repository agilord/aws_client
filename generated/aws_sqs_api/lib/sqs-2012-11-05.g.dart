// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqs-2012-11-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ChangeMessageVisibilityBatchRequestEntryToJson(
    ChangeMessageVisibilityBatchRequestEntry instance) {
  final val = <String, dynamic>{
    'Id': instance.id,
    'ReceiptHandle': instance.receiptHandle,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VisibilityTimeout', instance.visibilityTimeout);
  return val;
}

Map<String, dynamic> _$DeleteMessageBatchRequestEntryToJson(
        DeleteMessageBatchRequestEntry instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ReceiptHandle': instance.receiptHandle,
    };

Map<String, dynamic> _$MessageAttributeValueToJson(
    MessageAttributeValue instance) {
  final val = <String, dynamic>{
    'DataType': instance.dataType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'BinaryListValue',
      instance.binaryListValues
          ?.map(const Uint8ListConverter().toJson)
          .toList());
  writeNotNull('BinaryValue',
      const Uint8ListNullableConverter().toJson(instance.binaryValue));
  writeNotNull('StringListValue', instance.stringListValues);
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

Map<String, dynamic> _$MessageSystemAttributeValueToJson(
    MessageSystemAttributeValue instance) {
  final val = <String, dynamic>{
    'DataType': instance.dataType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'BinaryListValue',
      instance.binaryListValues
          ?.map(const Uint8ListConverter().toJson)
          .toList());
  writeNotNull('BinaryValue',
      const Uint8ListNullableConverter().toJson(instance.binaryValue));
  writeNotNull('StringListValue', instance.stringListValues);
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

Map<String, dynamic> _$SendMessageBatchRequestEntryToJson(
    SendMessageBatchRequestEntry instance) {
  final val = <String, dynamic>{
    'Id': instance.id,
    'MessageBody': instance.messageBody,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DelaySeconds', instance.delaySeconds);
  writeNotNull('MessageAttribute',
      instance.messageAttributes?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('MessageDeduplicationId', instance.messageDeduplicationId);
  writeNotNull('MessageGroupId', instance.messageGroupId);
  writeNotNull(
      'MessageSystemAttribute',
      instance.messageSystemAttributes?.map((k, e) => MapEntry(
          _$MessageSystemAttributeNameForSendsEnumMap[k], e.toJson())));
  return val;
}

const _$MessageSystemAttributeNameForSendsEnumMap = {
  MessageSystemAttributeNameForSends.awsTraceHeader: 'AWSTraceHeader',
};
