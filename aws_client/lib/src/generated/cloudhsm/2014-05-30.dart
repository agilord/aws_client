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

part '2014-05-30.g.dart';

/// This is documentation for <b>AWS CloudHSM Classic</b>. For more information,
/// see <a href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
/// Classic FAQs</a>, the <a
/// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
/// Classic User Guide</a>, and the <a
/// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
/// CloudHSM Classic API Reference</a>.
class CloudHsm {
  final _s.JsonProtocol _protocol;
  CloudHsm({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudhsm',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Adds or overwrites one or more tags for the specified AWS CloudHSM
  /// resource.
  ///
  /// Each tag consists of a key and a value. Tag keys must be unique to each
  /// resource.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS CloudHSM resource to tag.
  ///
  /// Parameter [tagList] :
  /// One or more tags.
  Future<AddTagsToResourceResponse> addTagsToResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''[\w :+=./\\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagList, 'tagList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.AddTagsToResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagList': tagList,
      },
    );

    return AddTagsToResourceResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Creates a high-availability partition group. A high-availability partition
  /// group is a group of partitions that spans multiple physical HSMs.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [label] :
  /// The label of the new high-availability partition group.
  Future<CreateHapgResponse> createHapg({
    @_s.required String label,
  }) async {
    ArgumentError.checkNotNull(label, 'label');
    _s.validateStringPattern(
      'label',
      label,
      r'''[a-zA-Z0-9_.-]{1,64}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.CreateHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Label': label,
      },
    );

    return CreateHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Creates an uninitialized HSM instance.
  ///
  /// There is an upfront fee charged for each HSM instance that you create with
  /// the <code>CreateHsm</code> operation. If you accidentally provision an HSM
  /// and want to request a refund, delete the instance using the
  /// <a>DeleteHsm</a> operation, go to the <a
  /// href="https://console.aws.amazon.com/support/home">AWS Support Center</a>,
  /// create a new case, and select <b>Account and Billing Support</b>.
  /// <important>
  /// It can take up to 20 minutes to create and provision an HSM. You can
  /// monitor the status of the HSM with the <a>DescribeHsm</a> operation. The
  /// HSM is ready to be initialized when the status changes to
  /// <code>RUNNING</code>.
  /// </important>
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of an IAM role to enable the AWS CloudHSM service to allocate an
  /// ENI on your behalf.
  ///
  /// Parameter [sshKey] :
  /// The SSH public key to install on the HSM.
  ///
  /// Parameter [subnetId] :
  /// The identifier of the subnet in your VPC in which to place the HSM.
  ///
  /// Parameter [clientToken] :
  /// A user-defined token to ensure idempotence. Subsequent calls to this
  /// operation with the same token will be ignored.
  ///
  /// Parameter [eniIp] :
  /// The IP address to assign to the HSM's ENI.
  ///
  /// If an IP address is not specified, an IP address will be randomly chosen
  /// from the CIDR range of the subnet.
  ///
  /// Parameter [externalId] :
  /// The external ID from <code>IamRoleArn</code>, if present.
  ///
  /// Parameter [syslogIp] :
  /// The IP address for the syslog monitoring server. The AWS CloudHSM service
  /// only supports one syslog monitoring server.
  Future<CreateHsmResponse> createHsm({
    @_s.required String iamRoleArn,
    @_s.required String sshKey,
    @_s.required String subnetId,
    @_s.required SubscriptionType subscriptionType,
    String clientToken,
    String eniIp,
    String externalId,
    String syslogIp,
  }) async {
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    _s.validateStringPattern(
      'iamRoleArn',
      iamRoleArn,
      r'''arn:aws(-iso)?:iam::[0-9]{12}:role/[a-zA-Z0-9_\+=,\.\-@]{1,64}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sshKey, 'sshKey');
    _s.validateStringPattern(
      'sshKey',
      sshKey,
      r'''[a-zA-Z0-9+/= ._:\\@-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetId, 'subnetId');
    _s.validateStringPattern(
      'subnetId',
      subnetId,
      r'''subnet-[0-9a-f]{8}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subscriptionType, 'subscriptionType');
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[a-zA-Z0-9]{1,64}''',
    );
    _s.validateStringPattern(
      'eniIp',
      eniIp,
      r'''\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}''',
    );
    _s.validateStringPattern(
      'externalId',
      externalId,
      r'''[\w :+=./-]*''',
    );
    _s.validateStringPattern(
      'syslogIp',
      syslogIp,
      r'''\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.CreateHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamRoleArn': iamRoleArn,
        'SshKey': sshKey,
        'SubnetId': subnetId,
        'SubscriptionType': subscriptionType?.toValue() ?? '',
        if (clientToken != null) 'ClientToken': clientToken,
        if (eniIp != null) 'EniIp': eniIp,
        if (externalId != null) 'ExternalId': externalId,
        if (syslogIp != null) 'SyslogIp': syslogIp,
      },
    );

    return CreateHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Creates an HSM client.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [certificate] :
  /// The contents of a Base64-Encoded X.509 v3 certificate to be installed on
  /// the HSMs used by this client.
  ///
  /// Parameter [label] :
  /// The label for the client.
  Future<CreateLunaClientResponse> createLunaClient({
    @_s.required String certificate,
    String label,
  }) async {
    ArgumentError.checkNotNull(certificate, 'certificate');
    _s.validateStringLength(
      'certificate',
      certificate,
      600,
      2400,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificate',
      certificate,
      r'''[\w :+=./\n-]*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'label',
      label,
      r'''[a-zA-Z0-9_.-]{2,64}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.CreateLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': certificate,
        if (label != null) 'Label': label,
      },
    );

    return CreateLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Deletes a high-availability partition group.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hapgArn] :
  /// The ARN of the high-availability partition group to delete.
  Future<DeleteHapgResponse> deleteHapg({
    @_s.required String hapgArn,
  }) async {
    ArgumentError.checkNotNull(hapgArn, 'hapgArn');
    _s.validateStringPattern(
      'hapgArn',
      hapgArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:hapg-[0-9a-f]{8}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DeleteHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HapgArn': hapgArn,
      },
    );

    return DeleteHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Deletes an HSM. After completion, this operation cannot be undone and your
  /// key material cannot be recovered.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hsmArn] :
  /// The ARN of the HSM to delete.
  Future<DeleteHsmResponse> deleteHsm({
    @_s.required String hsmArn,
  }) async {
    ArgumentError.checkNotNull(hsmArn, 'hsmArn');
    _s.validateStringPattern(
      'hsmArn',
      hsmArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:hsm-[0-9a-f]{8}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DeleteHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HsmArn': hsmArn,
      },
    );

    return DeleteHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Deletes a client.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client to delete.
  Future<DeleteLunaClientResponse> deleteLunaClient({
    @_s.required String clientArn,
  }) async {
    ArgumentError.checkNotNull(clientArn, 'clientArn');
    _s.validateStringPattern(
      'clientArn',
      clientArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:client-[0-9a-f]{8}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DeleteLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientArn': clientArn,
      },
    );

    return DeleteLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves information about a high-availability partition group.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hapgArn] :
  /// The ARN of the high-availability partition group to describe.
  Future<DescribeHapgResponse> describeHapg({
    @_s.required String hapgArn,
  }) async {
    ArgumentError.checkNotNull(hapgArn, 'hapgArn');
    _s.validateStringPattern(
      'hapgArn',
      hapgArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:hapg-[0-9a-f]{8}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DescribeHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HapgArn': hapgArn,
      },
    );

    return DescribeHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves information about an HSM. You can identify the HSM by its ARN or
  /// its serial number.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hsmArn] :
  /// The ARN of the HSM. Either the <code>HsmArn</code> or the
  /// <code>SerialNumber</code> parameter must be specified.
  ///
  /// Parameter [hsmSerialNumber] :
  /// The serial number of the HSM. Either the <code>HsmArn</code> or the
  /// <code>HsmSerialNumber</code> parameter must be specified.
  Future<DescribeHsmResponse> describeHsm({
    String hsmArn,
    String hsmSerialNumber,
  }) async {
    _s.validateStringPattern(
      'hsmArn',
      hsmArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:hsm-[0-9a-f]{8}''',
    );
    _s.validateStringPattern(
      'hsmSerialNumber',
      hsmSerialNumber,
      r'''\d{1,16}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DescribeHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (hsmArn != null) 'HsmArn': hsmArn,
        if (hsmSerialNumber != null) 'HsmSerialNumber': hsmSerialNumber,
      },
    );

    return DescribeHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves information about an HSM client.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [certificateFingerprint] :
  /// The certificate fingerprint.
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client.
  Future<DescribeLunaClientResponse> describeLunaClient({
    String certificateFingerprint,
    String clientArn,
  }) async {
    _s.validateStringPattern(
      'certificateFingerprint',
      certificateFingerprint,
      r'''([0-9a-fA-F][0-9a-fA-F]:){15}[0-9a-fA-F][0-9a-fA-F]''',
    );
    _s.validateStringPattern(
      'clientArn',
      clientArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:client-[0-9a-f]{8}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DescribeLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (certificateFingerprint != null)
          'CertificateFingerprint': certificateFingerprint,
        if (clientArn != null) 'ClientArn': clientArn,
      },
    );

    return DescribeLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Gets the configuration files necessary to connect to all high availability
  /// partition groups the client is associated with.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client.
  ///
  /// Parameter [clientVersion] :
  /// The client version.
  ///
  /// Parameter [hapgList] :
  /// A list of ARNs that identify the high-availability partition groups that
  /// are associated with the client.
  Future<GetConfigResponse> getConfig({
    @_s.required String clientArn,
    @_s.required ClientVersion clientVersion,
    @_s.required List<String> hapgList,
  }) async {
    ArgumentError.checkNotNull(clientArn, 'clientArn');
    _s.validateStringPattern(
      'clientArn',
      clientArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:client-[0-9a-f]{8}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(clientVersion, 'clientVersion');
    ArgumentError.checkNotNull(hapgList, 'hapgList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.GetConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientArn': clientArn,
        'ClientVersion': clientVersion?.toValue() ?? '',
        'HapgList': hapgList,
      },
    );

    return GetConfigResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Lists the Availability Zones that have available AWS CloudHSM capacity.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  Future<ListAvailableZonesResponse> listAvailableZones() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListAvailableZones'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return ListAvailableZonesResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Lists the high-availability partition groups for the account.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> member. If more results are available, the
  /// <code>NextToken</code> member of the response contains a token that you
  /// pass in the next call to <code>ListHapgs</code> to retrieve the next set
  /// of items.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value from a previous call to
  /// <code>ListHapgs</code>. Pass null if this is the first call.
  Future<ListHapgsResponse> listHapgs({
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListHapgs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHapgsResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves the identifiers of all of the HSMs provisioned for the current
  /// customer.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> member. If more results are available, the
  /// <code>NextToken</code> member of the response contains a token that you
  /// pass in the next call to <code>ListHsms</code> to retrieve the next set of
  /// items.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value from a previous call to
  /// <code>ListHsms</code>. Pass null if this is the first call.
  Future<ListHsmsResponse> listHsms({
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListHsms'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHsmsResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Lists all of the clients.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> member. If more results are available, the
  /// <code>NextToken</code> member of the response contains a token that you
  /// pass in the next call to <code>ListLunaClients</code> to retrieve the next
  /// set of items.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value from a previous call to
  /// <code>ListLunaClients</code>. Pass null if this is the first call.
  Future<ListLunaClientsResponse> listLunaClients({
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListLunaClients'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLunaClientsResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Returns a list of all tags for the specified AWS CloudHSM resource.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS CloudHSM resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''[\w :+=./\\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Modifies an existing high-availability partition group.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hapgArn] :
  /// The ARN of the high-availability partition group to modify.
  ///
  /// Parameter [label] :
  /// The new label for the high-availability partition group.
  ///
  /// Parameter [partitionSerialList] :
  /// The list of partition serial numbers to make members of the
  /// high-availability partition group.
  Future<ModifyHapgResponse> modifyHapg({
    @_s.required String hapgArn,
    String label,
    List<String> partitionSerialList,
  }) async {
    ArgumentError.checkNotNull(hapgArn, 'hapgArn');
    _s.validateStringPattern(
      'hapgArn',
      hapgArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:hapg-[0-9a-f]{8}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'label',
      label,
      r'''[a-zA-Z0-9_.-]{1,64}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ModifyHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HapgArn': hapgArn,
        if (label != null) 'Label': label,
        if (partitionSerialList != null)
          'PartitionSerialList': partitionSerialList,
      },
    );

    return ModifyHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Modifies an HSM.
  /// <important>
  /// This operation can result in the HSM being offline for up to 15 minutes
  /// while the AWS CloudHSM service is reconfigured. If you are modifying a
  /// production HSM, you should ensure that your AWS CloudHSM service is
  /// configured for high availability, and consider executing this operation
  /// during a maintenance window.
  /// </important>
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hsmArn] :
  /// The ARN of the HSM to modify.
  ///
  /// Parameter [eniIp] :
  /// The new IP address for the elastic network interface (ENI) attached to the
  /// HSM.
  ///
  /// If the HSM is moved to a different subnet, and an IP address is not
  /// specified, an IP address will be randomly chosen from the CIDR range of
  /// the new subnet.
  ///
  /// Parameter [externalId] :
  /// The new external ID.
  ///
  /// Parameter [iamRoleArn] :
  /// The new IAM role ARN.
  ///
  /// Parameter [subnetId] :
  /// The new identifier of the subnet that the HSM is in. The new subnet must
  /// be in the same Availability Zone as the current subnet.
  ///
  /// Parameter [syslogIp] :
  /// The new IP address for the syslog monitoring server. The AWS CloudHSM
  /// service only supports one syslog monitoring server.
  Future<ModifyHsmResponse> modifyHsm({
    @_s.required String hsmArn,
    String eniIp,
    String externalId,
    String iamRoleArn,
    String subnetId,
    String syslogIp,
  }) async {
    ArgumentError.checkNotNull(hsmArn, 'hsmArn');
    _s.validateStringPattern(
      'hsmArn',
      hsmArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:hsm-[0-9a-f]{8}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'eniIp',
      eniIp,
      r'''\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}''',
    );
    _s.validateStringPattern(
      'externalId',
      externalId,
      r'''[\w :+=./-]*''',
    );
    _s.validateStringPattern(
      'iamRoleArn',
      iamRoleArn,
      r'''arn:aws(-iso)?:iam::[0-9]{12}:role/[a-zA-Z0-9_\+=,\.\-@]{1,64}''',
    );
    _s.validateStringPattern(
      'subnetId',
      subnetId,
      r'''subnet-[0-9a-f]{8}''',
    );
    _s.validateStringPattern(
      'syslogIp',
      syslogIp,
      r'''\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ModifyHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HsmArn': hsmArn,
        if (eniIp != null) 'EniIp': eniIp,
        if (externalId != null) 'ExternalId': externalId,
        if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
        if (subnetId != null) 'SubnetId': subnetId,
        if (syslogIp != null) 'SyslogIp': syslogIp,
      },
    );

    return ModifyHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Modifies the certificate used by the client.
  ///
  /// This action can potentially start a workflow to install the new
  /// certificate on the client's HSMs.
  ///
  /// May throw [CloudHsmServiceException].
  ///
  /// Parameter [certificate] :
  /// The new certificate for the client.
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client.
  Future<ModifyLunaClientResponse> modifyLunaClient({
    @_s.required String certificate,
    @_s.required String clientArn,
  }) async {
    ArgumentError.checkNotNull(certificate, 'certificate');
    _s.validateStringLength(
      'certificate',
      certificate,
      600,
      2400,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificate',
      certificate,
      r'''[\w :+=./\n-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(clientArn, 'clientArn');
    _s.validateStringPattern(
      'clientArn',
      clientArn,
      r'''arn:aws(-iso)?:cloudhsm:[a-zA-Z0-9\-]*:[0-9]{12}:client-[0-9a-f]{8}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ModifyLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': certificate,
        'ClientArn': clientArn,
      },
    );

    return ModifyLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
  /// Classic User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="http://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Removes one or more tags from the specified AWS CloudHSM resource.
  ///
  /// To remove a tag, specify only the tag key to remove (not the value). To
  /// overwrite the value for an existing tag, use <a>AddTagsToResource</a>.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS CloudHSM resource.
  ///
  /// Parameter [tagKeyList] :
  /// The tag key or keys to remove.
  ///
  /// Specify only the tag key to remove (not the value). To overwrite the value
  /// for an existing tag, use <a>AddTagsToResource</a>.
  Future<RemoveTagsFromResourceResponse> removeTagsFromResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeyList,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''[\w :+=./\\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeyList, 'tagKeyList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.RemoveTagsFromResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeyList': tagKeyList,
      },
    );

    return RemoveTagsFromResourceResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsToResourceResponse {
  /// The status of the operation.
  @_s.JsonKey(name: 'Status')
  final String status;

  AddTagsToResourceResponse({
    @_s.required this.status,
  });
  factory AddTagsToResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddTagsToResourceResponseFromJson(json);
}

enum ClientVersion {
  @_s.JsonValue('5.1')
  $5_1,
  @_s.JsonValue('5.3')
  $5_3,
}

extension on ClientVersion {
  String toValue() {
    switch (this) {
      case ClientVersion.$5_1:
        return '5.1';
      case ClientVersion.$5_3:
        return '5.3';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Indicates that an internal error occurred.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudHsmInternalException implements _s.AwsException {
  CloudHsmInternalException();
  factory CloudHsmInternalException.fromJson(Map<String, dynamic> json) =>
      _$CloudHsmInternalExceptionFromJson(json);
}

enum CloudHsmObjectState {
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DEGRADED')
  degraded,
}

/// Indicates that an exception occurred in the AWS CloudHSM service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudHsmServiceException implements _s.AwsException {
  /// Additional information about the error.
  @_s.JsonKey(name: 'message')
  final String message;

  /// Indicates if the action can be retried.
  @_s.JsonKey(name: 'retryable')
  final bool retryable;

  CloudHsmServiceException({
    this.message,
    this.retryable,
  });
  factory CloudHsmServiceException.fromJson(Map<String, dynamic> json) =>
      _$CloudHsmServiceExceptionFromJson(json);
}

/// Contains the output of the <a>CreateHAPartitionGroup</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateHapgResponse {
  /// The ARN of the high-availability partition group.
  @_s.JsonKey(name: 'HapgArn')
  final String hapgArn;

  CreateHapgResponse({
    this.hapgArn,
  });
  factory CreateHapgResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateHapgResponseFromJson(json);
}

/// Contains the output of the <code>CreateHsm</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateHsmResponse {
  /// The ARN of the HSM.
  @_s.JsonKey(name: 'HsmArn')
  final String hsmArn;

  CreateHsmResponse({
    this.hsmArn,
  });
  factory CreateHsmResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateHsmResponseFromJson(json);
}

/// Contains the output of the <a>CreateLunaClient</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLunaClientResponse {
  /// The ARN of the client.
  @_s.JsonKey(name: 'ClientArn')
  final String clientArn;

  CreateLunaClientResponse({
    this.clientArn,
  });
  factory CreateLunaClientResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLunaClientResponseFromJson(json);
}

/// Contains the output of the <a>DeleteHapg</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteHapgResponse {
  /// The status of the action.
  @_s.JsonKey(name: 'Status')
  final String status;

  DeleteHapgResponse({
    @_s.required this.status,
  });
  factory DeleteHapgResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteHapgResponseFromJson(json);
}

/// Contains the output of the <a>DeleteHsm</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteHsmResponse {
  /// The status of the operation.
  @_s.JsonKey(name: 'Status')
  final String status;

  DeleteHsmResponse({
    @_s.required this.status,
  });
  factory DeleteHsmResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteHsmResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLunaClientResponse {
  /// The status of the action.
  @_s.JsonKey(name: 'Status')
  final String status;

  DeleteLunaClientResponse({
    @_s.required this.status,
  });
  factory DeleteLunaClientResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLunaClientResponseFromJson(json);
}

/// Contains the output of the <a>DescribeHapg</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHapgResponse {
  /// The ARN of the high-availability partition group.
  @_s.JsonKey(name: 'HapgArn')
  final String hapgArn;

  /// The serial number of the high-availability partition group.
  @_s.JsonKey(name: 'HapgSerial')
  final String hapgSerial;

  /// <p/>
  @_s.JsonKey(name: 'HsmsLastActionFailed')
  final List<String> hsmsLastActionFailed;

  /// <p/>
  @_s.JsonKey(name: 'HsmsPendingDeletion')
  final List<String> hsmsPendingDeletion;

  /// <p/>
  @_s.JsonKey(name: 'HsmsPendingRegistration')
  final List<String> hsmsPendingRegistration;

  /// The label for the high-availability partition group.
  @_s.JsonKey(name: 'Label')
  final String label;

  /// The date and time the high-availability partition group was last modified.
  @_s.JsonKey(name: 'LastModifiedTimestamp')
  final String lastModifiedTimestamp;

  /// The list of partition serial numbers that belong to the high-availability
  /// partition group.
  @_s.JsonKey(name: 'PartitionSerialList')
  final List<String> partitionSerialList;

  /// The state of the high-availability partition group.
  @_s.JsonKey(name: 'State')
  final CloudHsmObjectState state;

  DescribeHapgResponse({
    this.hapgArn,
    this.hapgSerial,
    this.hsmsLastActionFailed,
    this.hsmsPendingDeletion,
    this.hsmsPendingRegistration,
    this.label,
    this.lastModifiedTimestamp,
    this.partitionSerialList,
    this.state,
  });
  factory DescribeHapgResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeHapgResponseFromJson(json);
}

/// Contains the output of the <a>DescribeHsm</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHsmResponse {
  /// The Availability Zone that the HSM is in.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The identifier of the elastic network interface (ENI) attached to the HSM.
  @_s.JsonKey(name: 'EniId')
  final String eniId;

  /// The IP address assigned to the HSM's ENI.
  @_s.JsonKey(name: 'EniIp')
  final String eniIp;

  /// The ARN of the HSM.
  @_s.JsonKey(name: 'HsmArn')
  final String hsmArn;

  /// The HSM model type.
  @_s.JsonKey(name: 'HsmType')
  final String hsmType;

  /// The ARN of the IAM role assigned to the HSM.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// The list of partitions on the HSM.
  @_s.JsonKey(name: 'Partitions')
  final List<String> partitions;

  /// The serial number of the HSM.
  @_s.JsonKey(name: 'SerialNumber')
  final String serialNumber;

  /// The date and time that the server certificate was last updated.
  @_s.JsonKey(name: 'ServerCertLastUpdated')
  final String serverCertLastUpdated;

  /// The URI of the certificate server.
  @_s.JsonKey(name: 'ServerCertUri')
  final String serverCertUri;

  /// The HSM software version.
  @_s.JsonKey(name: 'SoftwareVersion')
  final String softwareVersion;

  /// The date and time that the SSH key was last updated.
  @_s.JsonKey(name: 'SshKeyLastUpdated')
  final String sshKeyLastUpdated;

  /// The public SSH key.
  @_s.JsonKey(name: 'SshPublicKey')
  final String sshPublicKey;

  /// The status of the HSM.
  @_s.JsonKey(name: 'Status')
  final HsmStatus status;

  /// Contains additional information about the status of the HSM.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The identifier of the subnet that the HSM is in.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The subscription end date.
  @_s.JsonKey(name: 'SubscriptionEndDate')
  final String subscriptionEndDate;

  /// The subscription start date.
  @_s.JsonKey(name: 'SubscriptionStartDate')
  final String subscriptionStartDate;
  @_s.JsonKey(name: 'SubscriptionType')
  final SubscriptionType subscriptionType;

  /// The name of the HSM vendor.
  @_s.JsonKey(name: 'VendorName')
  final String vendorName;

  /// The identifier of the VPC that the HSM is in.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DescribeHsmResponse({
    this.availabilityZone,
    this.eniId,
    this.eniIp,
    this.hsmArn,
    this.hsmType,
    this.iamRoleArn,
    this.partitions,
    this.serialNumber,
    this.serverCertLastUpdated,
    this.serverCertUri,
    this.softwareVersion,
    this.sshKeyLastUpdated,
    this.sshPublicKey,
    this.status,
    this.statusDetails,
    this.subnetId,
    this.subscriptionEndDate,
    this.subscriptionStartDate,
    this.subscriptionType,
    this.vendorName,
    this.vpcId,
  });
  factory DescribeHsmResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeHsmResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLunaClientResponse {
  /// The certificate installed on the HSMs used by this client.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The certificate fingerprint.
  @_s.JsonKey(name: 'CertificateFingerprint')
  final String certificateFingerprint;

  /// The ARN of the client.
  @_s.JsonKey(name: 'ClientArn')
  final String clientArn;

  /// The label of the client.
  @_s.JsonKey(name: 'Label')
  final String label;

  /// The date and time the client was last modified.
  @_s.JsonKey(name: 'LastModifiedTimestamp')
  final String lastModifiedTimestamp;

  DescribeLunaClientResponse({
    this.certificate,
    this.certificateFingerprint,
    this.clientArn,
    this.label,
    this.lastModifiedTimestamp,
  });
  factory DescribeLunaClientResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLunaClientResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConfigResponse {
  /// The certificate file containing the server.pem files of the HSMs.
  @_s.JsonKey(name: 'ConfigCred')
  final String configCred;

  /// The chrystoki.conf configuration file.
  @_s.JsonKey(name: 'ConfigFile')
  final String configFile;

  /// The type of credentials.
  @_s.JsonKey(name: 'ConfigType')
  final String configType;

  GetConfigResponse({
    this.configCred,
    this.configFile,
    this.configType,
  });
  factory GetConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConfigResponseFromJson(json);
}

enum HsmStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('SUSPENDED')
  suspended,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('DEGRADED')
  degraded,
}

/// Indicates that one or more of the request parameters are not valid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidRequestException implements _s.AwsException {
  InvalidRequestException();
  factory InvalidRequestException.fromJson(Map<String, dynamic> json) =>
      _$InvalidRequestExceptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAvailableZonesResponse {
  /// The list of Availability Zones that have available AWS CloudHSM capacity.
  @_s.JsonKey(name: 'AZList')
  final List<String> aZList;

  ListAvailableZonesResponse({
    this.aZList,
  });
  factory ListAvailableZonesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAvailableZonesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHapgsResponse {
  /// The list of high-availability partition groups.
  @_s.JsonKey(name: 'HapgList')
  final List<String> hapgList;

  /// If not null, more results are available. Pass this value to
  /// <code>ListHapgs</code> to retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHapgsResponse({
    @_s.required this.hapgList,
    this.nextToken,
  });
  factory ListHapgsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHapgsResponseFromJson(json);
}

/// Contains the output of the <code>ListHsms</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHsmsResponse {
  /// The list of ARNs that identify the HSMs.
  @_s.JsonKey(name: 'HsmList')
  final List<String> hsmList;

  /// If not null, more results are available. Pass this value to
  /// <code>ListHsms</code> to retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHsmsResponse({
    this.hsmList,
    this.nextToken,
  });
  factory ListHsmsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHsmsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLunaClientsResponse {
  /// The list of clients.
  @_s.JsonKey(name: 'ClientList')
  final List<String> clientList;

  /// If not null, more results are available. Pass this to
  /// <code>ListLunaClients</code> to retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLunaClientsResponse({
    @_s.required this.clientList,
    this.nextToken,
  });
  factory ListLunaClientsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLunaClientsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// One or more tags.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  ListTagsForResourceResponse({
    @_s.required this.tagList,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyHapgResponse {
  /// The ARN of the high-availability partition group.
  @_s.JsonKey(name: 'HapgArn')
  final String hapgArn;

  ModifyHapgResponse({
    this.hapgArn,
  });
  factory ModifyHapgResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyHapgResponseFromJson(json);
}

/// Contains the output of the <a>ModifyHsm</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyHsmResponse {
  /// The ARN of the HSM.
  @_s.JsonKey(name: 'HsmArn')
  final String hsmArn;

  ModifyHsmResponse({
    this.hsmArn,
  });
  factory ModifyHsmResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyHsmResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyLunaClientResponse {
  /// The ARN of the client.
  @_s.JsonKey(name: 'ClientArn')
  final String clientArn;

  ModifyLunaClientResponse({
    this.clientArn,
  });
  factory ModifyLunaClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyLunaClientResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTagsFromResourceResponse {
  /// The status of the operation.
  @_s.JsonKey(name: 'Status')
  final String status;

  RemoveTagsFromResourceResponse({
    @_s.required this.status,
  });
  factory RemoveTagsFromResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveTagsFromResourceResponseFromJson(json);
}

/// Specifies the type of subscription for the HSM.
///
/// <ul>
/// <li>
/// <b>PRODUCTION</b> - The HSM is being used in a production environment.
/// </li>
/// <li>
/// <b>TRIAL</b> - The HSM is being used in a product trial.
/// </li>
/// </ul>
enum SubscriptionType {
  @_s.JsonValue('PRODUCTION')
  production,
}

extension on SubscriptionType {
  String toValue() {
    switch (this) {
      case SubscriptionType.production:
        return 'PRODUCTION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A key-value pair that identifies or specifies metadata about an AWS CloudHSM
/// resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CloudHsmInternalException': (type, message) => CloudHsmInternalException(),
  'CloudHsmServiceException': (type, message) =>
      CloudHsmServiceException(message: message),
  'InvalidRequestException': (type, message) => InvalidRequestException(),
};
