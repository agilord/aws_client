// ignore_for_file: deprecated_member_use_from_same_package
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
            signingName: 'inspector-scan',
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
  /// resources using the <a href="">Amazon Inspector SBOM generator</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [sbom] :
  /// The JSON file for the SBOM you want to scan. The SBOM must be in CycloneDX
  /// 1.5 format.
  ///
  /// Parameter [outputFormat] :
  /// The output format for the vulnerability report.
  Future<ScanSbomResponse> scanSbom({
    required Sbom sbom,
    OutputFormat? outputFormat,
  }) async {
    final $payload = <String, dynamic>{
      'sbom': sbom,
      if (outputFormat != null) 'outputFormat': outputFormat.toValue(),
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

enum OutputFormat {
  cycloneDx_1_5,
  inspector,
}

extension OutputFormatValueExtension on OutputFormat {
  String toValue() {
    switch (this) {
      case OutputFormat.cycloneDx_1_5:
        return 'CYCLONE_DX_1_5';
      case OutputFormat.inspector:
        return 'INSPECTOR';
    }
  }
}

extension OutputFormatFromString on String {
  OutputFormat toOutputFormat() {
    switch (this) {
      case 'CYCLONE_DX_1_5':
        return OutputFormat.cycloneDx_1_5;
      case 'INSPECTOR':
        return OutputFormat.inspector;
    }
    throw Exception('$this is not known in enum OutputFormat');
  }
}

class Sbom {
  Sbom();

  factory Sbom.fromJson(Map<String, dynamic> _) {
    return Sbom();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ScanSbomResponse {
  /// The vulnerability report for the scanned SBOM.
  final Sbom? sbom;

  ScanSbomResponse({
    this.sbom,
  });

  factory ScanSbomResponse.fromJson(Map<String, dynamic> json) {
    return ScanSbomResponse(
      sbom: json['sbom'] != null
          ? Sbom.fromJson(json['sbom'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sbom = this.sbom;
    return {
      if (sbom != null) 'sbom': sbom,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

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
