// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Inspector Scan is a vulnerability discovery service that scans a
/// provided Software Bill of Materials (SBOM) for security vulnerabilities.
class InspectorScan {
  final _s.RestJsonProtocol _protocol;
  InspectorScan({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'inspector-scan',
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

  /// Scans a provided CycloneDX 1.5 SBOM and reports on any vulnerabilities
  /// discovered in that SBOM. You can generate compatible SBOMs for your
  /// resources using the <a
  /// href="https://docs.aws.amazon.com/inspector/latest/user/sbom-generator.html">Amazon
  /// Inspector SBOM generator</a>.
  /// <note>
  /// The output of this action reports NVD and CVSS scores when NVD and CVSS
  /// scores are available. Because the output reports both scores, you might
  /// notice a discrepency between them. However, you can triage the severity of
  /// either score depending on the vendor of your choosing.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sbom] :
  /// The JSON file for the SBOM you want to scan. The SBOM must be in CycloneDX
  /// 1.5 format. This format limits you to passing 2000 components before
  /// throwing a <code>ValidException</code> error.
  ///
  /// Parameter [outputFormat] :
  /// The output format for the vulnerability report.
  Future<ScanSbomResponse> scanSbom({
    required Object sbom,
    OutputFormat? outputFormat,
  }) async {
    final $payload = <String, dynamic>{
      'sbom': sbom,
      if (outputFormat != null) 'outputFormat': outputFormat.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/scan/sbom',
      exceptionFnMap: _exceptionFns,
    );
    return ScanSbomResponse.fromJson(response);
  }
}

/// @nodoc
class ScanSbomResponse {
  /// The vulnerability report for the scanned SBOM.
  final Object? sbom;

  ScanSbomResponse({
    this.sbom,
  });

  factory ScanSbomResponse.fromJson(Map<String, dynamic> json) {
    return ScanSbomResponse(
      sbom: json['sbom'],
    );
  }

  Map<String, dynamic> toJson() {
    final sbom = this.sbom;
    return {
      if (sbom != null) 'sbom': sbom,
    };
  }
}

/// @nodoc
class OutputFormat {
  static const cycloneDx_1_5 = OutputFormat._('CYCLONE_DX_1_5');
  static const inspector = OutputFormat._('INSPECTOR');
  static const inspectorAlt = OutputFormat._('INSPECTOR_ALT');

  final String value;

  const OutputFormat._(this.value);

  static const values = [cycloneDx_1_5, inspector, inspectorAlt];

  static OutputFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OutputFormat._(value));

  @override
  bool operator ==(other) => other is OutputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
