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

/// Systems Manager GUI Connect, a component of Fleet Manager, lets you connect
/// to your Window Server-type Amazon Elastic Compute Cloud (Amazon EC2)
/// instances using the Remote Desktop Protocol (RDP). GUI Connect, which is
/// powered by <a
/// href="https://docs.aws.amazon.com/dcv/latest/adminguide/what-is-dcv.html">Amazon
/// DCV</a>, provides you with secure connectivity to your Windows Server
/// instances directly from the Systems Manager console. You can have up to four
/// simultaneous connections in a single browser window. In the console, GUI
/// Connect is also referred to as Fleet Manager Remote Desktop.
class SsmGuiConnect {
  final _s.RestJsonProtocol _protocol;
  SsmGuiConnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ssm-guiconnect',
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

  /// Returns the preferences specified for recording RDP connections in the
  /// requesting Amazon Web Services account and Amazon Web Services Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetConnectionRecordingPreferencesResponse>
      getConnectionRecordingPreferences() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetConnectionRecordingPreferences',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectionRecordingPreferencesResponse.fromJson(response);
  }

  /// Deletes the preferences for recording RDP connections.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token.
  Future<DeleteConnectionRecordingPreferencesResponse>
      deleteConnectionRecordingPreferences({
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteConnectionRecordingPreferences',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConnectionRecordingPreferencesResponse.fromJson(response);
  }

  /// Updates the preferences for recording RDP connections.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectionRecordingPreferences] :
  /// The set of preferences used for recording RDP connections in the
  /// requesting Amazon Web Services account and Amazon Web Services Region.
  /// This includes details such as which S3 bucket recordings are stored in.
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token.
  Future<UpdateConnectionRecordingPreferencesResponse>
      updateConnectionRecordingPreferences({
    required ConnectionRecordingPreferences connectionRecordingPreferences,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectionRecordingPreferences': connectionRecordingPreferences,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateConnectionRecordingPreferences',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectionRecordingPreferencesResponse.fromJson(response);
  }
}

class GetConnectionRecordingPreferencesResponse {
  /// Service-provided idempotency token.
  final String? clientToken;

  /// The set of preferences used for recording RDP connections in the requesting
  /// Amazon Web Services account and Amazon Web Services Region. This includes
  /// details such as which S3 bucket recordings are stored in.
  final ConnectionRecordingPreferences? connectionRecordingPreferences;

  GetConnectionRecordingPreferencesResponse({
    this.clientToken,
    this.connectionRecordingPreferences,
  });

  factory GetConnectionRecordingPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConnectionRecordingPreferencesResponse(
      clientToken: json['ClientToken'] as String?,
      connectionRecordingPreferences: json['ConnectionRecordingPreferences'] !=
              null
          ? ConnectionRecordingPreferences.fromJson(
              json['ConnectionRecordingPreferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final connectionRecordingPreferences = this.connectionRecordingPreferences;
    return {
      if (clientToken != null) 'ClientToken': clientToken,
      if (connectionRecordingPreferences != null)
        'ConnectionRecordingPreferences': connectionRecordingPreferences,
    };
  }
}

class DeleteConnectionRecordingPreferencesResponse {
  /// Service-provided idempotency token.
  final String? clientToken;

  DeleteConnectionRecordingPreferencesResponse({
    this.clientToken,
  });

  factory DeleteConnectionRecordingPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteConnectionRecordingPreferencesResponse(
      clientToken: json['ClientToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    return {
      if (clientToken != null) 'ClientToken': clientToken,
    };
  }
}

class UpdateConnectionRecordingPreferencesResponse {
  /// Service-provided idempotency token.
  final String? clientToken;

  /// The set of preferences used for recording RDP connections in the requesting
  /// Amazon Web Services account and Amazon Web Services Region. This includes
  /// details such as which S3 bucket recordings are stored in.
  final ConnectionRecordingPreferences? connectionRecordingPreferences;

  UpdateConnectionRecordingPreferencesResponse({
    this.clientToken,
    this.connectionRecordingPreferences,
  });

  factory UpdateConnectionRecordingPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateConnectionRecordingPreferencesResponse(
      clientToken: json['ClientToken'] as String?,
      connectionRecordingPreferences: json['ConnectionRecordingPreferences'] !=
              null
          ? ConnectionRecordingPreferences.fromJson(
              json['ConnectionRecordingPreferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final connectionRecordingPreferences = this.connectionRecordingPreferences;
    return {
      if (clientToken != null) 'ClientToken': clientToken,
      if (connectionRecordingPreferences != null)
        'ConnectionRecordingPreferences': connectionRecordingPreferences,
    };
  }
}

/// The set of preferences used for recording RDP connections in the requesting
/// Amazon Web Services account and Amazon Web Services Region. This includes
/// details such as which S3 bucket recordings are stored in.
class ConnectionRecordingPreferences {
  /// The ARN of a KMS key that is used to encrypt data while it is being
  /// processed by the service. This key must exist in the same Amazon Web
  /// Services Region as the node you start an RDP connection to.
  final String kMSKeyArn;

  /// Determines where recordings of RDP connections are stored.
  final RecordingDestinations recordingDestinations;

  ConnectionRecordingPreferences({
    required this.kMSKeyArn,
    required this.recordingDestinations,
  });

  factory ConnectionRecordingPreferences.fromJson(Map<String, dynamic> json) {
    return ConnectionRecordingPreferences(
      kMSKeyArn: (json['KMSKeyArn'] as String?) ?? '',
      recordingDestinations: RecordingDestinations.fromJson(
          (json['RecordingDestinations'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final kMSKeyArn = this.kMSKeyArn;
    final recordingDestinations = this.recordingDestinations;
    return {
      'KMSKeyArn': kMSKeyArn,
      'RecordingDestinations': recordingDestinations,
    };
  }
}

/// Determines where recordings of RDP connections are stored.
class RecordingDestinations {
  /// The S3 bucket where RDP connection recordings are stored.
  final List<S3Bucket> s3Buckets;

  RecordingDestinations({
    required this.s3Buckets,
  });

  factory RecordingDestinations.fromJson(Map<String, dynamic> json) {
    return RecordingDestinations(
      s3Buckets: ((json['S3Buckets'] as List?) ?? const [])
          .nonNulls
          .map((e) => S3Bucket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Buckets = this.s3Buckets;
    return {
      'S3Buckets': s3Buckets,
    };
  }
}

/// The S3 bucket where RDP connection recordings are stored.
class S3Bucket {
  /// The name of the S3 bucket where RDP connection recordings are stored.
  final String bucketName;

  /// The Amazon Web Services account number that owns the S3 bucket.
  final String bucketOwner;

  S3Bucket({
    required this.bucketName,
    required this.bucketOwner,
  });

  factory S3Bucket.fromJson(Map<String, dynamic> json) {
    return S3Bucket(
      bucketName: (json['BucketName'] as String?) ?? '',
      bucketOwner: (json['BucketOwner'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketOwner = this.bucketOwner;
    return {
      'BucketName': bucketName,
      'BucketOwner': bucketOwner,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
