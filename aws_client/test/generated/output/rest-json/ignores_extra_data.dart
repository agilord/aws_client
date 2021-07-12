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

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Ignores extra data
class IgnoresExtraData {
  final _s.RestJsonProtocol _protocol;
  IgnoresExtraData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'IgnoresExtraData',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromJson(response);
  }
}

class OutputShape {
  final String? strType;

  OutputShape({
    this.strType,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      strType: json['StrType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final strType = this.strType;
    return {
      if (strType != null) 'StrType': strType,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
