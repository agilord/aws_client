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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2018-04-02.g.dart';

/// AWS EC2 Connect Service is a service that enables system administrators to
/// publish temporary SSH keys to their EC2 instances in order to establish
/// connections to their instances without leaving a permanent authentication
/// option.
class Ec2InstanceConnect {
  final _s.JsonProtocol _protocol;
  Ec2InstanceConnect({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ec2-instance-connect',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Pushes an SSH public key to a particular OS user on a given EC2 instance
  /// for 60 seconds.
  ///
  /// May throw [AuthException].
  /// May throw [InvalidArgsException].
  /// May throw [ServiceException].
  /// May throw [ThrottlingException].
  /// May throw [EC2InstanceNotFoundException].
  ///
  /// Parameter [availabilityZone] :
  /// The availability zone the EC2 instance was launched in.
  ///
  /// Parameter [instanceId] :
  /// The EC2 instance you wish to publish the SSH key to.
  ///
  /// Parameter [instanceOSUser] :
  /// The OS user on the EC2 instance whom the key may be used to authenticate
  /// as.
  ///
  /// Parameter [sSHPublicKey] :
  /// The public key to be published to the instance. To use it after
  /// publication you must have the matching private key.
  Future<SendSSHPublicKeyResponse> sendSSHPublicKey({
    @_s.required String availabilityZone,
    @_s.required String instanceId,
    @_s.required String instanceOSUser,
    @_s.required String sSHPublicKey,
  }) async {
    ArgumentError.checkNotNull(availabilityZone, 'availabilityZone');
    _s.validateStringLength(
      'availabilityZone',
      availabilityZone,
      6,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'availabilityZone',
      availabilityZone,
      r'''^(\w+-){2,3}\d+\w+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      10,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''^i-[a-f0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceOSUser, 'instanceOSUser');
    _s.validateStringLength(
      'instanceOSUser',
      instanceOSUser,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceOSUser',
      instanceOSUser,
      r'''^[A-Za-z_][A-Za-z0-9\@\._-]{0,30}[A-Za-z0-9\$_-]?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sSHPublicKey, 'sSHPublicKey');
    _s.validateStringLength(
      'sSHPublicKey',
      sSHPublicKey,
      256,
      4096,
      isRequired: true,
    );
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
        'AvailabilityZone': availabilityZone,
        'InstanceId': instanceId,
        'InstanceOSUser': instanceOSUser,
        'SSHPublicKey': sSHPublicKey,
      },
    );

    return SendSSHPublicKeyResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendSSHPublicKeyResponse {
  /// The request ID as logged by EC2 Connect. Please provide this when contacting
  /// AWS Support.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// Indicates request success.
  @_s.JsonKey(name: 'Success')
  final bool success;

  SendSSHPublicKeyResponse({
    this.requestId,
    this.success,
  });
  factory SendSSHPublicKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$SendSSHPublicKeyResponseFromJson(json);
}

class AuthException extends _s.GenericAwsException {
  AuthException({String type, String message})
      : super(type: type, code: 'AuthException', message: message);
}

class EC2InstanceNotFoundException extends _s.GenericAwsException {
  EC2InstanceNotFoundException({String type, String message})
      : super(
            type: type, code: 'EC2InstanceNotFoundException', message: message);
}

class InvalidArgsException extends _s.GenericAwsException {
  InvalidArgsException({String type, String message})
      : super(type: type, code: 'InvalidArgsException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String type, String message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthException': (type, message) =>
      AuthException(type: type, message: message),
  'EC2InstanceNotFoundException': (type, message) =>
      EC2InstanceNotFoundException(type: type, message: message),
  'InvalidArgsException': (type, message) =>
      InvalidArgsException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
