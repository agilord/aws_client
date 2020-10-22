// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqs-2012-11-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ChangeMessageVisibilityBatchRequestEntryToJson(
    ChangeMessageVisibilityBatchRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('ReceiptHandle', instance.receiptHandle);
  writeNotNull('VisibilityTimeout', instance.visibilityTimeout);
  return val;
}

Map<String, dynamic> _$DeleteMessageBatchRequestEntryToJson(
    DeleteMessageBatchRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('ReceiptHandle', instance.receiptHandle);
  return val;
}

Map<String, dynamic> _$MessageAttributeValueToJson(
    MessageAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataType', instance.dataType);
  writeNotNull('BinaryListValue', instance.binaryListValues);
  writeNotNull('BinaryValue', instance.binaryValue);
  writeNotNull('StringListValue', instance.stringListValues);
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

Map<String, dynamic> _$MessageSystemAttributeValueToJson(
    MessageSystemAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataType', instance.dataType);
  writeNotNull('BinaryListValue', instance.binaryListValues);
  writeNotNull('BinaryValue', instance.binaryValue);
  writeNotNull('StringListValue', instance.stringListValues);
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

Map<String, dynamic> _$SendMessageBatchRequestEntryToJson(
    SendMessageBatchRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('MessageBody', instance.messageBody);
  writeNotNull('DelaySeconds', instance.delaySeconds);
  writeNotNull('MessageAttribute',
      instance.messageAttributes?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('MessageDeduplicationId', instance.messageDeduplicationId);
  writeNotNull('MessageGroupId', instance.messageGroupId);
  writeNotNull(
      'MessageSystemAttribute',
      instance.messageSystemAttributes
          ?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}
