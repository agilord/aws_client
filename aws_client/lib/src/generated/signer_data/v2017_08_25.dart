// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2017_08_25.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS Signer Data Plane service provides APIs for checking revocation status
/// of signed artifacts.
class SignerData {
  final _s.RestJsonProtocol _protocol;
  factory SignerData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'data-signer',
      signingName: 'signer',
    );
    return SignerData._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  SignerData._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Retrieves the revocation status for a signed artifact by checking if the
  /// signing profile, job, or certificate has been revoked.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [certificateHashes] :
  /// List of certificate hashes to check for revocation.
  ///
  /// Parameter [jobArn] :
  /// The ARN of the signing job that produced the signature.
  ///
  /// Parameter [platformId] :
  /// The platform identifier for the signing platform used.
  ///
  /// Parameter [profileVersionArn] :
  /// The ARN of the signing profile version used to sign the artifact.
  ///
  /// Parameter [signatureTimestamp] :
  /// The timestamp when the artifact was signed, in ISO 8601 format.
  Future<GetRevocationStatusResponse> getRevocationStatus({
    required List<String> certificateHashes,
    required String jobArn,
    required String platformId,
    required String profileVersionArn,
    required DateTime signatureTimestamp,
  }) async {
    final $query = <String, List<String>>{
      'certificateHashes': certificateHashes,
      'jobArn': [jobArn],
      'platformId': [platformId],
      'profileVersionArn': [profileVersionArn],
      'signatureTimestamp': [_s.iso8601ToJson(signatureTimestamp).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/revocations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRevocationStatusResponse.fromJson(response);
  }
}

/// Response containing the list of revoked entities.
///
/// @nodoc
class GetRevocationStatusResponse {
  /// List of entity identifiers that have been revoked. Empty if no revocations
  /// found.
  final List<String>? revokedEntities;

  GetRevocationStatusResponse({
    this.revokedEntities,
  });

  factory GetRevocationStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetRevocationStatusResponse(
      revokedEntities: (json['revokedEntities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final revokedEntities = this.revokedEntities;
    return {
      if (revokedEntities != null) 'revokedEntities': revokedEntities,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

/// @nodoc
class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
