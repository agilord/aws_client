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

/// This is the <i> Amazon EC2 Instance Connect API Reference</i>. It provides
/// descriptions, syntax, and usage examples for each of the actions for Amazon
/// EC2 Instance Connect. Amazon EC2 Instance Connect enables system
/// administrators to publish one-time use SSH public keys to EC2, providing
/// users a simple and secure way to connect to their instances.
///
/// To view the Amazon EC2 Instance Connect content in the <i> Amazon EC2 User
/// Guide</i>, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Connect-using-EC2-Instance-Connect.html">Connect
/// to your Linux instance using EC2 Instance Connect</a>.
///
/// For Amazon EC2 APIs, see the <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Welcome.html">Amazon
/// EC2 API Reference</a>.
class Ec2InstanceConnect {
  final _s.JsonProtocol _protocol;
  Ec2InstanceConnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ec2-instance-connect',
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

  /// Pushes an SSH public key to the specified EC2 instance for use by the
  /// specified user. The key remains for 60 seconds. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Connect-using-EC2-Instance-Connect.html">Connect
  /// to your Linux instance using EC2 Instance Connect</a> in the <i>Amazon EC2
  /// User Guide</i>.
  ///
  /// May throw [AuthException].
  /// May throw [InvalidArgsException].
  /// May throw [ServiceException].
  /// May throw [ThrottlingException].
  /// May throw [EC2InstanceNotFoundException].
  /// May throw [EC2InstanceStateInvalidException].
  /// May throw [EC2InstanceUnavailableException].
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance.
  ///
  /// Parameter [instanceOSUser] :
  /// The OS user on the EC2 instance for whom the key can be used to
  /// authenticate.
  ///
  /// Parameter [sSHPublicKey] :
  /// The public key material. To use the public key, you must have the matching
  /// private key.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone in which the EC2 instance was launched.
  Future<SendSSHPublicKeyResponse> sendSSHPublicKey({
    required String instanceId,
    required String instanceOSUser,
    required String sSHPublicKey,
    String? availabilityZone,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEC2InstanceConnectService.SendSSHPublicKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'InstanceOSUser': instanceOSUser,
        'SSHPublicKey': sSHPublicKey,
        if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      },
    );

    return SendSSHPublicKeyResponse.fromJson(jsonResponse.body);
  }

  /// Pushes an SSH public key to the specified EC2 instance. The key remains
  /// for 60 seconds, which gives you 60 seconds to establish a serial console
  /// connection to the instance using SSH. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-serial-console.html">EC2
  /// Serial Console</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// May throw [AuthException].
  /// May throw [SerialConsoleAccessDisabledException].
  /// May throw [InvalidArgsException].
  /// May throw [ServiceException].
  /// May throw [ThrottlingException].
  /// May throw [EC2InstanceNotFoundException].
  /// May throw [EC2InstanceTypeInvalidException].
  /// May throw [SerialConsoleSessionLimitExceededException].
  /// May throw [SerialConsoleSessionUnavailableException].
  /// May throw [EC2InstanceStateInvalidException].
  /// May throw [EC2InstanceUnavailableException].
  /// May throw [SerialConsoleSessionUnsupportedException].
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance.
  ///
  /// Parameter [sSHPublicKey] :
  /// The public key material. To use the public key, you must have the matching
  /// private key. For information about the supported key formats and lengths,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws">Requirements
  /// for key pairs</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// Parameter [serialPort] :
  /// The serial port of the EC2 instance. Currently only port 0 is supported.
  ///
  /// Default: 0
  Future<SendSerialConsoleSSHPublicKeyResponse> sendSerialConsoleSSHPublicKey({
    required String instanceId,
    required String sSHPublicKey,
    int? serialPort,
  }) async {
    _s.validateNumRange(
      'serialPort',
      serialPort,
      0,
      0,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSEC2InstanceConnectService.SendSerialConsoleSSHPublicKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'SSHPublicKey': sSHPublicKey,
        if (serialPort != null) 'SerialPort': serialPort,
      },
    );

    return SendSerialConsoleSSHPublicKeyResponse.fromJson(jsonResponse.body);
  }
}

class SendSSHPublicKeyResponse {
  /// The ID of the request. Please provide this ID when contacting AWS Support
  /// for assistance.
  final String? requestId;

  /// Is true if the request succeeds and an error otherwise.
  final bool? success;

  SendSSHPublicKeyResponse({
    this.requestId,
    this.success,
  });

  factory SendSSHPublicKeyResponse.fromJson(Map<String, dynamic> json) {
    return SendSSHPublicKeyResponse(
      requestId: json['RequestId'] as String?,
      success: json['Success'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final success = this.success;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (success != null) 'Success': success,
    };
  }
}

class SendSerialConsoleSSHPublicKeyResponse {
  /// The ID of the request. Please provide this ID when contacting AWS Support
  /// for assistance.
  final String? requestId;

  /// Is true if the request succeeds and an error otherwise.
  final bool? success;

  SendSerialConsoleSSHPublicKeyResponse({
    this.requestId,
    this.success,
  });

  factory SendSerialConsoleSSHPublicKeyResponse.fromJson(
      Map<String, dynamic> json) {
    return SendSerialConsoleSSHPublicKeyResponse(
      requestId: json['RequestId'] as String?,
      success: json['Success'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final success = this.success;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (success != null) 'Success': success,
    };
  }
}

class AuthException extends _s.GenericAwsException {
  AuthException({String? type, String? message})
      : super(type: type, code: 'AuthException', message: message);
}

class EC2InstanceNotFoundException extends _s.GenericAwsException {
  EC2InstanceNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'EC2InstanceNotFoundException', message: message);
}

class EC2InstanceStateInvalidException extends _s.GenericAwsException {
  EC2InstanceStateInvalidException({String? type, String? message})
      : super(
            type: type,
            code: 'EC2InstanceStateInvalidException',
            message: message);
}

class EC2InstanceTypeInvalidException extends _s.GenericAwsException {
  EC2InstanceTypeInvalidException({String? type, String? message})
      : super(
            type: type,
            code: 'EC2InstanceTypeInvalidException',
            message: message);
}

class EC2InstanceUnavailableException extends _s.GenericAwsException {
  EC2InstanceUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'EC2InstanceUnavailableException',
            message: message);
}

class InvalidArgsException extends _s.GenericAwsException {
  InvalidArgsException({String? type, String? message})
      : super(type: type, code: 'InvalidArgsException', message: message);
}

class SerialConsoleAccessDisabledException extends _s.GenericAwsException {
  SerialConsoleAccessDisabledException({String? type, String? message})
      : super(
            type: type,
            code: 'SerialConsoleAccessDisabledException',
            message: message);
}

class SerialConsoleSessionLimitExceededException
    extends _s.GenericAwsException {
  SerialConsoleSessionLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'SerialConsoleSessionLimitExceededException',
            message: message);
}

class SerialConsoleSessionUnavailableException extends _s.GenericAwsException {
  SerialConsoleSessionUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'SerialConsoleSessionUnavailableException',
            message: message);
}

class SerialConsoleSessionUnsupportedException extends _s.GenericAwsException {
  SerialConsoleSessionUnsupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'SerialConsoleSessionUnsupportedException',
            message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthException': (type, message) =>
      AuthException(type: type, message: message),
  'EC2InstanceNotFoundException': (type, message) =>
      EC2InstanceNotFoundException(type: type, message: message),
  'EC2InstanceStateInvalidException': (type, message) =>
      EC2InstanceStateInvalidException(type: type, message: message),
  'EC2InstanceTypeInvalidException': (type, message) =>
      EC2InstanceTypeInvalidException(type: type, message: message),
  'EC2InstanceUnavailableException': (type, message) =>
      EC2InstanceUnavailableException(type: type, message: message),
  'InvalidArgsException': (type, message) =>
      InvalidArgsException(type: type, message: message),
  'SerialConsoleAccessDisabledException': (type, message) =>
      SerialConsoleAccessDisabledException(type: type, message: message),
  'SerialConsoleSessionLimitExceededException': (type, message) =>
      SerialConsoleSessionLimitExceededException(type: type, message: message),
  'SerialConsoleSessionUnavailableException': (type, message) =>
      SerialConsoleSessionUnavailableException(type: type, message: message),
  'SerialConsoleSessionUnsupportedException': (type, message) =>
      SerialConsoleSessionUnsupportedException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
