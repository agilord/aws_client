// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;
import 'map_with_enum_key.meta.dart';

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Map with enum key
class MapWithEnumKey {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  MapWithEnumKey({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'MapWithEnumKey',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<void> createQueue0({
    required String queueName,
    Map<QueueAttributeName, String>? attributes,
  }) async {
    ArgumentError.checkNotNull(queueName, 'queueName');
    final $request = <String, dynamic>{};
    $request['QueueName'] = queueName;
    attributes?.also((arg) =>
        $request['Attributes'] = arg.map((k, v) => MapEntry(k.toValue(), v)));
    await _protocol.send(
      $request,
      action: 'CreateQueue',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateQueueRequest'],
      shapes: shapes,
    );
  }
}

enum QueueAttributeName {
  all,
  policy,
}

extension on QueueAttributeName {
  String toValue() {
    switch (this) {
      case QueueAttributeName.all:
        return 'All';
      case QueueAttributeName.policy:
        return 'Policy';
    }
  }
}

extension on String {
  QueueAttributeName toQueueAttributeName() {
    switch (this) {
      case 'All':
        return QueueAttributeName.all;
      case 'Policy':
        return QueueAttributeName.policy;
    }
    throw Exception('$this is not known in enum QueueAttributeName');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
