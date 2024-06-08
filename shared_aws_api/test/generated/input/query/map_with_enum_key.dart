// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Map with enum key
class MapWithEnumKey {
  final _s.QueryProtocol _protocol;

  MapWithEnumKey({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'MapWithEnumKey',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> createQueue0({
    required String queueName,
    Map<QueueAttributeName, String>? attributes,
  }) async {
    final $request = <String, String>{
      'QueueName': queueName,
      if (attributes != null)
        for (var e1 in attributes.entries.toList().asMap().entries) ...{
          'Attributes.${e1.key + 1}.Name': e1.value.key.toValue(),
          'Attributes.${e1.key + 1}.Value': e1.value.value,
        },
    };
    await _protocol.send(
      $request,
      action: 'CreateQueue',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum QueueAttributeName {
  all,
  policy,
}

extension QueueAttributeNameValueExtension on QueueAttributeName {
  String toValue() {
    switch (this) {
      case QueueAttributeName.all:
        return 'All';
      case QueueAttributeName.policy:
        return 'Policy';
    }
  }
}

extension QueueAttributeNameFromString on String {
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
