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

/// Amazon Web Services Control Tower offers application programming interface
/// (API) operations that support programmatic interaction with these types of
/// resources:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/controls.html">
/// <i>controls</i> </a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/lz-api-launch.html">
/// <i>landing zones</i> </a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/types-of-baselines.html">
/// <i>baselines</i> </a>
/// </li>
/// </ul>
/// For more information about these types of resources, see the <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html">
/// <i>Amazon Web Services Control Tower User Guide</i> </a>.
///
/// <b>About control APIs</b>
///
/// These interfaces allow you to apply the Amazon Web Services library of
/// pre-defined <i>controls</i> to your organizational units, programmatically.
/// In Amazon Web Services Control Tower, the terms "control" and "guardrail"
/// are synonyms.
///
/// To call these APIs, you'll need to know:
///
/// <ul>
/// <li>
/// the <code>controlIdentifier</code> for the control--or guardrail--you are
/// targeting.
/// </li>
/// <li>
/// the ARN associated with the target organizational unit (OU), which we call
/// the <code>targetIdentifier</code>.
/// </li>
/// <li>
/// the ARN associated with a resource that you wish to tag or untag.
/// </li>
/// </ul>
/// <b>To get the <code>controlIdentifier</code> for your Amazon Web Services
/// Control Tower control:</b>
///
/// The <code>controlIdentifier</code> is an ARN that is specified for each
/// control. You can view the <code>controlIdentifier</code> in the console on
/// the <b>Control details</b> page, as well as in the documentation.
///
/// The <code>controlIdentifier</code> is unique in each Amazon Web Services
/// Region for each control. You can find the <code>controlIdentifier</code> for
/// each Region and control in the <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-metadata-tables.html">Tables
/// of control metadata</a> or the <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-region-tables.html">Control
/// availability by Region tables</a> in the <i>Amazon Web Services Control
/// Tower User Guide.</i>
///
/// A quick-reference list of control identifers for the Amazon Web Services
/// Control Tower legacy <i>Strongly recommended</i> and <i>Elective</i>
/// controls is given in <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-identifiers.html.html">Resource
/// identifiers for APIs and controls</a> in the <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-identifiers.html">Controls
/// reference guide section</a> of the <i>Amazon Web Services Control Tower User
/// Guide</i>. Remember that <i>Mandatory</i> controls cannot be added or
/// removed.
/// <note>
/// <b>ARN format:</b>
/// <code>arn:aws:controltower:{REGION}::control/{CONTROL_NAME}</code>
///
/// <b>Example:</b>
///
/// <code>arn:aws:controltower:us-west-2::control/AWS-GR_AUTOSCALING_LAUNCH_CONFIG_PUBLIC_IP_DISABLED</code>
/// </note>
/// <b>To get the <code>targetIdentifier</code>:</b>
///
/// The <code>targetIdentifier</code> is the ARN for an OU.
///
/// In the Amazon Web Services Organizations console, you can find the ARN for
/// the OU on the <b>Organizational unit details</b> page associated with that
/// OU.
/// <note>
/// <b>OU ARN format:</b>
///
/// <code>arn:${Partition}:organizations::${MasterAccountId}:ou/o-${OrganizationId}/ou-${OrganizationalUnitId}</code>
/// </note>
/// <b> About landing zone APIs</b>
///
/// You can configure and launch an Amazon Web Services Control Tower landing
/// zone with APIs. For an introduction and steps, see <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/getting-started-apis.html">Getting
/// started with Amazon Web Services Control Tower using APIs</a>.
///
/// For an overview of landing zone API operations, see <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/2023-all.html#landing-zone-apis">
/// Amazon Web Services Control Tower supports landing zone APIs</a>. The
/// individual API operations for landing zones are detailed in this document,
/// the <a
/// href="https://docs.aws.amazon.com/controltower/latest/APIReference/API_Operations.html">API
/// reference manual</a>, in the "Actions" section.
///
/// <b>About baseline APIs</b>
///
/// You can apply the <code>AWSControlTowerBaseline</code> baseline to an
/// organizational unit (OU) as a way to register the OU with Amazon Web
/// Services Control Tower, programmatically. For a general overview of this
/// capability, see <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/2024-all.html#baseline-apis">Amazon
/// Web Services Control Tower supports APIs for OU registration and
/// configuration with baselines</a>.
///
/// You can call the baseline API operations to view the baselines that Amazon
/// Web Services Control Tower enables for your landing zone, on your behalf,
/// when setting up the landing zone. These baselines are read-only baselines.
///
/// The individual API operations for baselines are detailed in this document,
/// the <a
/// href="https://docs.aws.amazon.com/controltower/latest/APIReference/API_Operations.html">API
/// reference manual</a>, in the "Actions" section. For usage examples, see <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">Baseline
/// API input and output examples with CLI</a>.
/// <p class="title"> <b>Details and examples</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">Control
/// API input and output examples with CLI</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">Baseline
/// API input and output examples with CLI</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/enable-controls.html">Enable
/// controls with CloudFormation</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/lz-apis-cfn-setup.html">Launch
/// a landing zone with CloudFormation</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-metadata-tables.html">Control
/// metadata tables (large page)</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-region-tables.html">Control
/// availability by Region tables (large page)</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-identifiers.html">List
/// of identifiers for legacy controls</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/controls.html">Controls
/// reference guide</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/controls-reference.html">Controls
/// library groupings</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/creating-resources-with-cloudformation.html">Creating
/// Amazon Web Services Control Tower resources with Amazon Web Services
/// CloudFormation</a>
/// </li>
/// </ul>
/// To view the open source resource repository on GitHub, see <a
/// href="https://github.com/aws-cloudformation/aws-cloudformation-resource-providers-controltower">aws-cloudformation/aws-cloudformation-resource-providers-controltower</a>
///
/// <b>Recording API Requests</b>
///
/// Amazon Web Services Control Tower supports Amazon Web Services CloudTrail, a
/// service that records Amazon Web Services API calls for your Amazon Web
/// Services account and delivers log files to an Amazon S3 bucket. By using
/// information collected by CloudTrail, you can determine which requests the
/// Amazon Web Services Control Tower service received, who made the request and
/// when, and so on. For more about Amazon Web Services Control Tower and its
/// support for CloudTrail, see <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/logging-using-cloudtrail.html">Logging
/// Amazon Web Services Control Tower Actions with Amazon Web Services
/// CloudTrail</a> in the Amazon Web Services Control Tower User Guide. To learn
/// more about CloudTrail, including how to turn it on and find your log files,
/// see the Amazon Web Services CloudTrail User Guide.
class ControlTower {
  final _s.RestJsonProtocol _protocol;
  ControlTower({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'controltower',
            signingName: 'controltower',
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

  /// Creates a new landing zone. This API call starts an asynchronous operation
  /// that creates and configures a landing zone, based on the parameters
  /// specified in the manifest JSON file.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [manifest] :
  /// The manifest JSON file is a text file that describes your Amazon Web
  /// Services resources. For examples, review <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/lz-api-launch">Launch
  /// your landing zone</a>.
  ///
  /// Parameter [version] :
  /// The landing zone version, for example, 3.0.
  ///
  /// Parameter [tags] :
  /// Tags to be applied to the landing zone.
  Future<CreateLandingZoneOutput> createLandingZone({
    required Manifest manifest,
    required String version,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'manifest': manifest,
      'version': version,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-landingzone',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLandingZoneOutput.fromJson(response);
  }

  /// Decommissions a landing zone. This API call starts an asynchronous
  /// operation that deletes Amazon Web Services Control Tower resources
  /// deployed in accounts managed by Amazon Web Services Control Tower.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [landingZoneIdentifier] :
  /// The unique identifier of the landing zone.
  Future<DeleteLandingZoneOutput> deleteLandingZone({
    required String landingZoneIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'landingZoneIdentifier': landingZoneIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-landingzone',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLandingZoneOutput.fromJson(response);
  }

  /// Disable an <code>EnabledBaseline</code> resource on the specified Target.
  /// This API starts an asynchronous operation to remove all resources deployed
  /// as part of the baseline enablement. The resource will vary depending on
  /// the enabled baseline. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [enabledBaselineIdentifier] :
  /// Identifier of the <code>EnabledBaseline</code> resource to be deactivated,
  /// in ARN format.
  Future<DisableBaselineOutput> disableBaseline({
    required String enabledBaselineIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'enabledBaselineIdentifier': enabledBaselineIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disable-baseline',
      exceptionFnMap: _exceptionFns,
    );
    return DisableBaselineOutput.fromJson(response);
  }

  /// This API call turns off a control. It starts an asynchronous operation
  /// that deletes AWS resources on the specified organizational unit and the
  /// accounts it contains. The resources will vary according to the control
  /// that you specify. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [controlIdentifier] :
  /// The ARN of the control. Only <b>Strongly recommended</b> and
  /// <b>Elective</b> controls are permitted, with the exception of the
  /// <b>Region deny</b> control. For information on how to find the
  /// <code>controlIdentifier</code>, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/Welcome.html">the
  /// overview page</a>.
  ///
  /// Parameter [targetIdentifier] :
  /// The ARN of the organizational unit. For information on how to find the
  /// <code>targetIdentifier</code>, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/Welcome.html">the
  /// overview page</a>.
  Future<DisableControlOutput> disableControl({
    required String controlIdentifier,
    required String targetIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'controlIdentifier': controlIdentifier,
      'targetIdentifier': targetIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disable-control',
      exceptionFnMap: _exceptionFns,
    );
    return DisableControlOutput.fromJson(response);
  }

  /// Enable (apply) a <code>Baseline</code> to a Target. This API starts an
  /// asynchronous operation to deploy resources specified by the
  /// <code>Baseline</code> to the specified Target. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [baselineIdentifier] :
  /// The ARN of the baseline to be enabled.
  ///
  /// Parameter [baselineVersion] :
  /// The specific version to be enabled of the specified baseline.
  ///
  /// Parameter [targetIdentifier] :
  /// The ARN of the target on which the baseline will be enabled. Only OUs are
  /// supported as targets.
  ///
  /// Parameter [parameters] :
  /// A list of <code>key-value</code> objects that specify enablement
  /// parameters, where <code>key</code> is a string and <code>value</code> is a
  /// document of any type.
  ///
  /// Parameter [tags] :
  /// Tags associated with input to <code>EnableBaseline</code>.
  Future<EnableBaselineOutput> enableBaseline({
    required String baselineIdentifier,
    required String baselineVersion,
    required String targetIdentifier,
    List<EnabledBaselineParameter>? parameters,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'baselineIdentifier': baselineIdentifier,
      'baselineVersion': baselineVersion,
      'targetIdentifier': targetIdentifier,
      if (parameters != null) 'parameters': parameters,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/enable-baseline',
      exceptionFnMap: _exceptionFns,
    );
    return EnableBaselineOutput.fromJson(response);
  }

  /// This API call activates a control. It starts an asynchronous operation
  /// that creates Amazon Web Services resources on the specified organizational
  /// unit and the accounts it contains. The resources created will vary
  /// according to the control that you specify. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [controlIdentifier] :
  /// The ARN of the control. Only <b>Strongly recommended</b> and
  /// <b>Elective</b> controls are permitted, with the exception of the
  /// <b>Region deny</b> control. For information on how to find the
  /// <code>controlIdentifier</code>, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/Welcome.html">the
  /// overview page</a>.
  ///
  /// Parameter [targetIdentifier] :
  /// The ARN of the organizational unit. For information on how to find the
  /// <code>targetIdentifier</code>, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/Welcome.html">the
  /// overview page</a>.
  ///
  /// Parameter [parameters] :
  /// A list of input parameter values, which are specified to configure the
  /// control when you enable it.
  ///
  /// Parameter [tags] :
  /// Tags to be applied to the <code>EnabledControl</code> resource.
  Future<EnableControlOutput> enableControl({
    required String controlIdentifier,
    required String targetIdentifier,
    List<EnabledControlParameter>? parameters,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'controlIdentifier': controlIdentifier,
      'targetIdentifier': targetIdentifier,
      if (parameters != null) 'parameters': parameters,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/enable-control',
      exceptionFnMap: _exceptionFns,
    );
    return EnableControlOutput.fromJson(response);
  }

  /// Retrieve details about an existing <code>Baseline</code> resource by
  /// specifying its identifier. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [baselineIdentifier] :
  /// The ARN of the <code>Baseline</code> resource to be retrieved.
  Future<GetBaselineOutput> getBaseline({
    required String baselineIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'baselineIdentifier': baselineIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-baseline',
      exceptionFnMap: _exceptionFns,
    );
    return GetBaselineOutput.fromJson(response);
  }

  /// Returns the details of an asynchronous baseline operation, as initiated by
  /// any of these APIs: <code>EnableBaseline</code>,
  /// <code>DisableBaseline</code>, <code>UpdateEnabledBaseline</code>,
  /// <code>ResetEnabledBaseline</code>. A status message is displayed in case
  /// of operation failure. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [operationIdentifier] :
  /// The operation ID returned from mutating asynchronous APIs (Enable,
  /// Disable, Update, Reset).
  Future<GetBaselineOperationOutput> getBaselineOperation({
    required String operationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'operationIdentifier': operationIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-baseline-operation',
      exceptionFnMap: _exceptionFns,
    );
    return GetBaselineOperationOutput.fromJson(response);
  }

  /// Returns the status of a particular <code>EnableControl</code> or
  /// <code>DisableControl</code> operation. Displays a message in case of
  /// error. Details for an operation are available for 90 days. For usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [operationIdentifier] :
  /// The ID of the asynchronous operation, which is used to track status. The
  /// operation is available for 90 days.
  Future<GetControlOperationOutput> getControlOperation({
    required String operationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'operationIdentifier': operationIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-control-operation',
      exceptionFnMap: _exceptionFns,
    );
    return GetControlOperationOutput.fromJson(response);
  }

  /// Retrieve details of an <code>EnabledBaseline</code> resource by specifying
  /// its identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [enabledBaselineIdentifier] :
  /// Identifier of the <code>EnabledBaseline</code> resource to be retrieved,
  /// in ARN format.
  Future<GetEnabledBaselineOutput> getEnabledBaseline({
    required String enabledBaselineIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'enabledBaselineIdentifier': enabledBaselineIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-enabled-baseline',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnabledBaselineOutput.fromJson(response);
  }

  /// Retrieves details about an enabled control. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [enabledControlIdentifier] :
  /// The <code>controlIdentifier</code> of the enabled control.
  Future<GetEnabledControlOutput> getEnabledControl({
    required String enabledControlIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'enabledControlIdentifier': enabledControlIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-enabled-control',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnabledControlOutput.fromJson(response);
  }

  /// Returns details about the landing zone. Displays a message in case of
  /// error.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [landingZoneIdentifier] :
  /// The unique identifier of the landing zone.
  Future<GetLandingZoneOutput> getLandingZone({
    required String landingZoneIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'landingZoneIdentifier': landingZoneIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-landingzone',
      exceptionFnMap: _exceptionFns,
    );
    return GetLandingZoneOutput.fromJson(response);
  }

  /// Returns the status of the specified landing zone operation. Details for an
  /// operation are available for 90 days.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [operationIdentifier] :
  /// A unique identifier assigned to a landing zone operation.
  Future<GetLandingZoneOperationOutput> getLandingZoneOperation({
    required String operationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'operationIdentifier': operationIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-landingzone-operation',
      exceptionFnMap: _exceptionFns,
    );
    return GetLandingZoneOperationOutput.fromJson(response);
  }

  /// Returns a summary list of all available baselines. For usage examples, see
  /// <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be shown.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<ListBaselinesOutput> listBaselines({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      4,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-baselines',
      exceptionFnMap: _exceptionFns,
    );
    return ListBaselinesOutput.fromJson(response);
  }

  /// Provides a list of operations in progress or queued.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filter] :
  /// An input filter for the <code>ListControlOperations</code> API that lets
  /// you select the types of control operations to view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be shown.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<ListControlOperationsOutput> listControlOperations({
    ControlOperationFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-control-operations',
      exceptionFnMap: _exceptionFns,
    );
    return ListControlOperationsOutput.fromJson(response);
  }

  /// Returns a list of summaries describing <code>EnabledBaseline</code>
  /// resources. You can filter the list by the corresponding
  /// <code>Baseline</code> or <code>Target</code> of the
  /// <code>EnabledBaseline</code> resources. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filter] :
  /// A filter applied on the <code>ListEnabledBaseline</code> operation.
  /// Allowed filters are <code>baselineIdentifiers</code> and
  /// <code>targetIdentifiers</code>. The filter can be applied for either, or
  /// both.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be shown.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<ListEnabledBaselinesOutput> listEnabledBaselines({
    EnabledBaselineFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      100,
    );
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-enabled-baselines',
      exceptionFnMap: _exceptionFns,
    );
    return ListEnabledBaselinesOutput.fromJson(response);
  }

  /// Lists the controls enabled by Amazon Web Services Control Tower on the
  /// specified organizational unit and the accounts it contains. For usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [filter] :
  /// An input filter for the <code>ListCEnabledControls</code> API that lets
  /// you select the types of control operations to view.
  ///
  /// Parameter [maxResults] :
  /// How many results to return per API call.
  ///
  /// Parameter [nextToken] :
  /// The token to continue the list from a previous API call with the same
  /// parameters.
  ///
  /// Parameter [targetIdentifier] :
  /// The ARN of the organizational unit. For information on how to find the
  /// <code>targetIdentifier</code>, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/Welcome.html">the
  /// overview page</a>.
  Future<ListEnabledControlsOutput> listEnabledControls({
    EnabledControlFilter? filter,
    int? maxResults,
    String? nextToken,
    String? targetIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (targetIdentifier != null) 'targetIdentifier': targetIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-enabled-controls',
      exceptionFnMap: _exceptionFns,
    );
    return ListEnabledControlsOutput.fromJson(response);
  }

  /// Returns the landing zone ARN for the landing zone deployed in your managed
  /// account. This API also creates an ARN for existing accounts that do not
  /// yet have a landing zone ARN.
  ///
  /// Returns one landing zone ARN.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of returned landing zone ARNs, which is one.
  ///
  /// Parameter [nextToken] :
  /// The token to continue the list from a previous API call with the same
  /// parameters.
  Future<ListLandingZonesOutput> listLandingZones({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-landingzones',
      exceptionFnMap: _exceptionFns,
    );
    return ListLandingZonesOutput.fromJson(response);
  }

  /// Returns a list of tags associated with the resource. For usage examples,
  /// see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Re-enables an <code>EnabledBaseline</code> resource. For example, this API
  /// can re-apply the existing <code>Baseline</code> after a new member account
  /// is moved to the target OU. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [enabledBaselineIdentifier] :
  /// Specifies the ID of the <code>EnabledBaseline</code> resource to be
  /// re-enabled, in ARN format.
  Future<ResetEnabledBaselineOutput> resetEnabledBaseline({
    required String enabledBaselineIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'enabledBaselineIdentifier': enabledBaselineIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/reset-enabled-baseline',
      exceptionFnMap: _exceptionFns,
    );
    return ResetEnabledBaselineOutput.fromJson(response);
  }

  /// This API call resets a landing zone. It starts an asynchronous operation
  /// that resets the landing zone to the parameters specified in its original
  /// configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [landingZoneIdentifier] :
  /// The unique identifier of the landing zone.
  Future<ResetLandingZoneOutput> resetLandingZone({
    required String landingZoneIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'landingZoneIdentifier': landingZoneIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/reset-landingzone',
      exceptionFnMap: _exceptionFns,
    );
    return ResetLandingZoneOutput.fromJson(response);
  }

  /// Applies tags to a resource. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be tagged.
  ///
  /// Parameter [tags] :
  /// Tags to be applied to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys to be removed from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an <code>EnabledBaseline</code> resource's applied parameters or
  /// version. For usage examples, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/baseline-api-examples.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [baselineVersion] :
  /// Specifies the new <code>Baseline</code> version, to which the
  /// <code>EnabledBaseline</code> should be updated.
  ///
  /// Parameter [enabledBaselineIdentifier] :
  /// Specifies the <code>EnabledBaseline</code> resource to be updated.
  ///
  /// Parameter [parameters] :
  /// Parameters to apply when making an update.
  Future<UpdateEnabledBaselineOutput> updateEnabledBaseline({
    required String baselineVersion,
    required String enabledBaselineIdentifier,
    List<EnabledBaselineParameter>? parameters,
  }) async {
    final $payload = <String, dynamic>{
      'baselineVersion': baselineVersion,
      'enabledBaselineIdentifier': enabledBaselineIdentifier,
      if (parameters != null) 'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-enabled-baseline',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnabledBaselineOutput.fromJson(response);
  }

  /// Updates the configuration of an already enabled control.
  ///
  /// If the enabled control shows an <code>EnablementStatus</code> of
  /// SUCCEEDED, supply parameters that are different from the currently
  /// configured parameters. Otherwise, Amazon Web Services Control Tower will
  /// not accept the request.
  ///
  /// If the enabled control shows an <code>EnablementStatus</code> of FAILED,
  /// Amazon Web Services Control Tower will update the control to match any
  /// valid parameters that you supply.
  ///
  /// If the <code>DriftSummary</code> status for the control shows as DRIFTED,
  /// you cannot call this API. Instead, you can update the control by calling
  /// <code>DisableControl</code> and again calling <code>EnableControl</code>,
  /// or you can run an extending governance operation. For usage examples, see
  /// <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-api-examples-short.html">
  /// <i>the Amazon Web Services Control Tower User Guide</i> </a>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [enabledControlIdentifier] :
  /// The ARN of the enabled control that will be updated.
  ///
  /// Parameter [parameters] :
  /// A key/value pair, where <code>Key</code> is of type <code>String</code>
  /// and <code>Value</code> is of type <code>Document</code>.
  Future<UpdateEnabledControlOutput> updateEnabledControl({
    required String enabledControlIdentifier,
    required List<EnabledControlParameter> parameters,
  }) async {
    final $payload = <String, dynamic>{
      'enabledControlIdentifier': enabledControlIdentifier,
      'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-enabled-control',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnabledControlOutput.fromJson(response);
  }

  /// This API call updates the landing zone. It starts an asynchronous
  /// operation that updates the landing zone based on the new landing zone
  /// version, or on the changed parameters specified in the updated manifest
  /// file.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [landingZoneIdentifier] :
  /// The unique identifier of the landing zone.
  ///
  /// Parameter [manifest] :
  /// The manifest JSON file is a text file that describes your Amazon Web
  /// Services resources. For examples, review <a
  /// href="https://docs.aws.amazon.com/controltower/latest/userguide/lz-api-launch">Launch
  /// your landing zone</a>.
  ///
  /// Parameter [version] :
  /// The landing zone version, for example, 3.2.
  Future<UpdateLandingZoneOutput> updateLandingZone({
    required String landingZoneIdentifier,
    required Manifest manifest,
    required String version,
  }) async {
    final $payload = <String, dynamic>{
      'landingZoneIdentifier': landingZoneIdentifier,
      'manifest': manifest,
      'version': version,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-landingzone',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLandingZoneOutput.fromJson(response);
  }
}

/// An object of shape <code>BaselineOperation</code>, returning details about
/// the specified <code>Baseline</code> operation ID.
class BaselineOperation {
  /// The end time of the operation (if applicable), in ISO 8601 format.
  final DateTime? endTime;

  /// The identifier of the specified operation.
  final String? operationIdentifier;

  /// An enumerated type (<code>enum</code>) with possible values of
  /// <code>ENABLE_BASELINE</code>, <code>DISABLE_BASELINE</code>,
  /// <code>UPDATE_ENABLED_BASELINE</code>, or
  /// <code>RESET_ENABLED_BASELINE</code>.
  final BaselineOperationType? operationType;

  /// The start time of the operation, in ISO 8601 format.
  final DateTime? startTime;

  /// An enumerated type (<code>enum</code>) with possible values of
  /// <code>SUCCEEDED</code>, <code>FAILED</code>, or <code>IN_PROGRESS</code>.
  final BaselineOperationStatus? status;

  /// A status message that gives more information about the operation's status,
  /// if applicable.
  final String? statusMessage;

  BaselineOperation({
    this.endTime,
    this.operationIdentifier,
    this.operationType,
    this.startTime,
    this.status,
    this.statusMessage,
  });

  factory BaselineOperation.fromJson(Map<String, dynamic> json) {
    return BaselineOperation(
      endTime: timeStampFromJson(json['endTime']),
      operationIdentifier: json['operationIdentifier'] as String?,
      operationType:
          (json['operationType'] as String?)?.toBaselineOperationType(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toBaselineOperationStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final operationIdentifier = this.operationIdentifier;
    final operationType = this.operationType;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (operationIdentifier != null)
        'operationIdentifier': operationIdentifier,
      if (operationType != null) 'operationType': operationType.toValue(),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum BaselineOperationStatus {
  succeeded,
  failed,
  inProgress,
}

extension BaselineOperationStatusValueExtension on BaselineOperationStatus {
  String toValue() {
    switch (this) {
      case BaselineOperationStatus.succeeded:
        return 'SUCCEEDED';
      case BaselineOperationStatus.failed:
        return 'FAILED';
      case BaselineOperationStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension BaselineOperationStatusFromString on String {
  BaselineOperationStatus toBaselineOperationStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return BaselineOperationStatus.succeeded;
      case 'FAILED':
        return BaselineOperationStatus.failed;
      case 'IN_PROGRESS':
        return BaselineOperationStatus.inProgress;
    }
    throw Exception('$this is not known in enum BaselineOperationStatus');
  }
}

enum BaselineOperationType {
  enableBaseline,
  disableBaseline,
  updateEnabledBaseline,
  resetEnabledBaseline,
}

extension BaselineOperationTypeValueExtension on BaselineOperationType {
  String toValue() {
    switch (this) {
      case BaselineOperationType.enableBaseline:
        return 'ENABLE_BASELINE';
      case BaselineOperationType.disableBaseline:
        return 'DISABLE_BASELINE';
      case BaselineOperationType.updateEnabledBaseline:
        return 'UPDATE_ENABLED_BASELINE';
      case BaselineOperationType.resetEnabledBaseline:
        return 'RESET_ENABLED_BASELINE';
    }
  }
}

extension BaselineOperationTypeFromString on String {
  BaselineOperationType toBaselineOperationType() {
    switch (this) {
      case 'ENABLE_BASELINE':
        return BaselineOperationType.enableBaseline;
      case 'DISABLE_BASELINE':
        return BaselineOperationType.disableBaseline;
      case 'UPDATE_ENABLED_BASELINE':
        return BaselineOperationType.updateEnabledBaseline;
      case 'RESET_ENABLED_BASELINE':
        return BaselineOperationType.resetEnabledBaseline;
    }
    throw Exception('$this is not known in enum BaselineOperationType');
  }
}

/// Returns a summary of information about a <code>Baseline</code> object.
class BaselineSummary {
  /// The full ARN of a Baseline.
  final String arn;

  /// The human-readable name of a Baseline.
  final String name;

  /// A summary description of a Baseline.
  final String? description;

  BaselineSummary({
    required this.arn,
    required this.name,
    this.description,
  });

  factory BaselineSummary.fromJson(Map<String, dynamic> json) {
    return BaselineSummary(
      arn: json['arn'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final description = this.description;
    return {
      'arn': arn,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// An operation performed by the control.
class ControlOperation {
  /// The <code>controlIdentifier</code> of the control for the operation.
  final String? controlIdentifier;

  /// The <code>controlIdentifier</code> of the enabled control.
  final String? enabledControlIdentifier;

  /// The time that the operation finished.
  final DateTime? endTime;

  /// The identifier of the specified operation.
  final String? operationIdentifier;

  /// One of <code>ENABLE_CONTROL</code> or <code>DISABLE_CONTROL</code>.
  final ControlOperationType? operationType;

  /// The time that the operation began.
  final DateTime? startTime;

  /// One of <code>IN_PROGRESS</code>, <code>SUCEEDED</code>, or
  /// <code>FAILED</code>.
  final ControlOperationStatus? status;

  /// If the operation result is <code>FAILED</code>, this string contains a
  /// message explaining why the operation failed.
  final String? statusMessage;

  /// The target upon which the control operation is working.
  final String? targetIdentifier;

  ControlOperation({
    this.controlIdentifier,
    this.enabledControlIdentifier,
    this.endTime,
    this.operationIdentifier,
    this.operationType,
    this.startTime,
    this.status,
    this.statusMessage,
    this.targetIdentifier,
  });

  factory ControlOperation.fromJson(Map<String, dynamic> json) {
    return ControlOperation(
      controlIdentifier: json['controlIdentifier'] as String?,
      enabledControlIdentifier: json['enabledControlIdentifier'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      operationIdentifier: json['operationIdentifier'] as String?,
      operationType:
          (json['operationType'] as String?)?.toControlOperationType(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toControlOperationStatus(),
      statusMessage: json['statusMessage'] as String?,
      targetIdentifier: json['targetIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlIdentifier = this.controlIdentifier;
    final enabledControlIdentifier = this.enabledControlIdentifier;
    final endTime = this.endTime;
    final operationIdentifier = this.operationIdentifier;
    final operationType = this.operationType;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final targetIdentifier = this.targetIdentifier;
    return {
      if (controlIdentifier != null) 'controlIdentifier': controlIdentifier,
      if (enabledControlIdentifier != null)
        'enabledControlIdentifier': enabledControlIdentifier,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (operationIdentifier != null)
        'operationIdentifier': operationIdentifier,
      if (operationType != null) 'operationType': operationType.toValue(),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (targetIdentifier != null) 'targetIdentifier': targetIdentifier,
    };
  }
}

/// A filter object that lets you call <code>ListCOntrolOperations</code> with a
/// specific filter.
class ControlOperationFilter {
  /// The set of <code>controlIdentifier</code> returned by the filter.
  final List<String>? controlIdentifiers;

  /// The set of <code>ControlOperation</code> objects returned by the filter.
  final List<ControlOperationType>? controlOperationTypes;

  /// The set <code>controlIdentifier</code> of enabled controls selected by the
  /// filter.
  final List<String>? enabledControlIdentifiers;

  /// Lists the status of control operations.
  final List<ControlOperationStatus>? statuses;

  /// The set of <code>targetIdentifier</code> objects returned by the filter.
  final List<String>? targetIdentifiers;

  ControlOperationFilter({
    this.controlIdentifiers,
    this.controlOperationTypes,
    this.enabledControlIdentifiers,
    this.statuses,
    this.targetIdentifiers,
  });

  Map<String, dynamic> toJson() {
    final controlIdentifiers = this.controlIdentifiers;
    final controlOperationTypes = this.controlOperationTypes;
    final enabledControlIdentifiers = this.enabledControlIdentifiers;
    final statuses = this.statuses;
    final targetIdentifiers = this.targetIdentifiers;
    return {
      if (controlIdentifiers != null) 'controlIdentifiers': controlIdentifiers,
      if (controlOperationTypes != null)
        'controlOperationTypes':
            controlOperationTypes.map((e) => e.toValue()).toList(),
      if (enabledControlIdentifiers != null)
        'enabledControlIdentifiers': enabledControlIdentifiers,
      if (statuses != null)
        'statuses': statuses.map((e) => e.toValue()).toList(),
      if (targetIdentifiers != null) 'targetIdentifiers': targetIdentifiers,
    };
  }
}

enum ControlOperationStatus {
  succeeded,
  failed,
  inProgress,
}

extension ControlOperationStatusValueExtension on ControlOperationStatus {
  String toValue() {
    switch (this) {
      case ControlOperationStatus.succeeded:
        return 'SUCCEEDED';
      case ControlOperationStatus.failed:
        return 'FAILED';
      case ControlOperationStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension ControlOperationStatusFromString on String {
  ControlOperationStatus toControlOperationStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return ControlOperationStatus.succeeded;
      case 'FAILED':
        return ControlOperationStatus.failed;
      case 'IN_PROGRESS':
        return ControlOperationStatus.inProgress;
    }
    throw Exception('$this is not known in enum ControlOperationStatus');
  }
}

/// A summary of information about the specified control operation.
class ControlOperationSummary {
  /// The <code>controlIdentifier</code> of a control.
  final String? controlIdentifier;

  /// The <code>controlIdentifier</code> of an enabled control.
  final String? enabledControlIdentifier;

  /// The time at which the control operation was completed.
  final DateTime? endTime;

  /// The unique identifier of a control operation.
  final String? operationIdentifier;

  /// The type of operation.
  final ControlOperationType? operationType;

  /// The time at which a control operation began.
  final DateTime? startTime;

  /// The status of the specified control operation.
  final ControlOperationStatus? status;

  /// A speficic message displayed as part of the control status.
  final String? statusMessage;

  /// The unique identifier of the target of a control operation.
  final String? targetIdentifier;

  ControlOperationSummary({
    this.controlIdentifier,
    this.enabledControlIdentifier,
    this.endTime,
    this.operationIdentifier,
    this.operationType,
    this.startTime,
    this.status,
    this.statusMessage,
    this.targetIdentifier,
  });

  factory ControlOperationSummary.fromJson(Map<String, dynamic> json) {
    return ControlOperationSummary(
      controlIdentifier: json['controlIdentifier'] as String?,
      enabledControlIdentifier: json['enabledControlIdentifier'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      operationIdentifier: json['operationIdentifier'] as String?,
      operationType:
          (json['operationType'] as String?)?.toControlOperationType(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toControlOperationStatus(),
      statusMessage: json['statusMessage'] as String?,
      targetIdentifier: json['targetIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlIdentifier = this.controlIdentifier;
    final enabledControlIdentifier = this.enabledControlIdentifier;
    final endTime = this.endTime;
    final operationIdentifier = this.operationIdentifier;
    final operationType = this.operationType;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final targetIdentifier = this.targetIdentifier;
    return {
      if (controlIdentifier != null) 'controlIdentifier': controlIdentifier,
      if (enabledControlIdentifier != null)
        'enabledControlIdentifier': enabledControlIdentifier,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (operationIdentifier != null)
        'operationIdentifier': operationIdentifier,
      if (operationType != null) 'operationType': operationType.toValue(),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (targetIdentifier != null) 'targetIdentifier': targetIdentifier,
    };
  }
}

enum ControlOperationType {
  enableControl,
  disableControl,
  updateEnabledControl,
}

extension ControlOperationTypeValueExtension on ControlOperationType {
  String toValue() {
    switch (this) {
      case ControlOperationType.enableControl:
        return 'ENABLE_CONTROL';
      case ControlOperationType.disableControl:
        return 'DISABLE_CONTROL';
      case ControlOperationType.updateEnabledControl:
        return 'UPDATE_ENABLED_CONTROL';
    }
  }
}

extension ControlOperationTypeFromString on String {
  ControlOperationType toControlOperationType() {
    switch (this) {
      case 'ENABLE_CONTROL':
        return ControlOperationType.enableControl;
      case 'DISABLE_CONTROL':
        return ControlOperationType.disableControl;
      case 'UPDATE_ENABLED_CONTROL':
        return ControlOperationType.updateEnabledControl;
    }
    throw Exception('$this is not known in enum ControlOperationType');
  }
}

class CreateLandingZoneOutput {
  /// The ARN of the landing zone resource.
  final String arn;

  /// A unique identifier assigned to a <code>CreateLandingZone</code> operation.
  /// You can use this identifier as an input of
  /// <code>GetLandingZoneOperation</code> to check the operation's status.
  final String operationIdentifier;

  CreateLandingZoneOutput({
    required this.arn,
    required this.operationIdentifier,
  });

  factory CreateLandingZoneOutput.fromJson(Map<String, dynamic> json) {
    return CreateLandingZoneOutput(
      arn: json['arn'] as String,
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final operationIdentifier = this.operationIdentifier;
    return {
      'arn': arn,
      'operationIdentifier': operationIdentifier,
    };
  }
}

class DeleteLandingZoneOutput {
  /// &gt;A unique identifier assigned to a <code>DeleteLandingZone</code>
  /// operation. You can use this identifier as an input parameter of
  /// <code>GetLandingZoneOperation</code> to check the operation's status.
  final String operationIdentifier;

  DeleteLandingZoneOutput({
    required this.operationIdentifier,
  });

  factory DeleteLandingZoneOutput.fromJson(Map<String, dynamic> json) {
    return DeleteLandingZoneOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class DisableBaselineOutput {
  /// The ID (in UUID format) of the asynchronous <code>DisableBaseline</code>
  /// operation. This <code>operationIdentifier</code> is used to track status
  /// through calls to the <code>GetBaselineOperation</code> API.
  final String operationIdentifier;

  DisableBaselineOutput({
    required this.operationIdentifier,
  });

  factory DisableBaselineOutput.fromJson(Map<String, dynamic> json) {
    return DisableBaselineOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class DisableControlOutput {
  /// The ID of the asynchronous operation, which is used to track status. The
  /// operation is available for 90 days.
  final String operationIdentifier;

  DisableControlOutput({
    required this.operationIdentifier,
  });

  factory DisableControlOutput.fromJson(Map<String, dynamic> json) {
    return DisableControlOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DriftStatus {
  drifted,
  inSync,
  notChecking,
  unknown,
}

extension DriftStatusValueExtension on DriftStatus {
  String toValue() {
    switch (this) {
      case DriftStatus.drifted:
        return 'DRIFTED';
      case DriftStatus.inSync:
        return 'IN_SYNC';
      case DriftStatus.notChecking:
        return 'NOT_CHECKING';
      case DriftStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension DriftStatusFromString on String {
  DriftStatus toDriftStatus() {
    switch (this) {
      case 'DRIFTED':
        return DriftStatus.drifted;
      case 'IN_SYNC':
        return DriftStatus.inSync;
      case 'NOT_CHECKING':
        return DriftStatus.notChecking;
      case 'UNKNOWN':
        return DriftStatus.unknown;
    }
    throw Exception('$this is not known in enum DriftStatus');
  }
}

/// The drift summary of the enabled control.
///
/// Amazon Web Services Control Tower expects the enabled control configuration
/// to include all supported and governed Regions. If the enabled control
/// differs from the expected configuration, it is defined to be in a state of
/// drift. You can repair this drift by resetting the enabled control.
class DriftStatusSummary {
  /// The drift status of the enabled control.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: The <code>enabledControl</code> deployed in this
  /// configuration doesn’t match the configuration that Amazon Web Services
  /// Control Tower expected.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The <code>enabledControl</code> deployed in this
  /// configuration matches the configuration that Amazon Web Services Control
  /// Tower expected.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKING</code>: Amazon Web Services Control Tower does not check
  /// drift for this enabled control. Drift is not supported for the control type.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: Amazon Web Services Control Tower is not able to check
  /// the drift status for the enabled control.
  /// </li>
  /// </ul>
  final DriftStatus? driftStatus;

  DriftStatusSummary({
    this.driftStatus,
  });

  factory DriftStatusSummary.fromJson(Map<String, dynamic> json) {
    return DriftStatusSummary(
      driftStatus: (json['driftStatus'] as String?)?.toDriftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final driftStatus = this.driftStatus;
    return {
      if (driftStatus != null) 'driftStatus': driftStatus.toValue(),
    };
  }
}

class EnableBaselineOutput {
  /// The ARN of the <code>EnabledBaseline</code> resource.
  final String arn;

  /// The ID (in UUID format) of the asynchronous <code>EnableBaseline</code>
  /// operation. This <code>operationIdentifier</code> is used to track status
  /// through calls to the <code>GetBaselineOperation</code> API.
  final String operationIdentifier;

  EnableBaselineOutput({
    required this.arn,
    required this.operationIdentifier,
  });

  factory EnableBaselineOutput.fromJson(Map<String, dynamic> json) {
    return EnableBaselineOutput(
      arn: json['arn'] as String,
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final operationIdentifier = this.operationIdentifier;
    return {
      'arn': arn,
      'operationIdentifier': operationIdentifier,
    };
  }
}

class EnableControlOutput {
  /// The ID of the asynchronous operation, which is used to track status. The
  /// operation is available for 90 days.
  final String operationIdentifier;

  /// The ARN of the <code>EnabledControl</code> resource.
  final String? arn;

  EnableControlOutput({
    required this.operationIdentifier,
    this.arn,
  });

  factory EnableControlOutput.fromJson(Map<String, dynamic> json) {
    return EnableControlOutput(
      operationIdentifier: json['operationIdentifier'] as String,
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    final arn = this.arn;
    return {
      'operationIdentifier': operationIdentifier,
      if (arn != null) 'arn': arn,
    };
  }
}

/// Details of the <code>EnabledBaseline</code> resource.
class EnabledBaselineDetails {
  /// The ARN of the <code>EnabledBaseline</code> resource.
  final String arn;

  /// The specific <code>Baseline</code> enabled as part of the
  /// <code>EnabledBaseline</code> resource.
  final String baselineIdentifier;
  final EnablementStatusSummary statusSummary;

  /// The target on which to enable the <code>Baseline</code>.
  final String targetIdentifier;

  /// The enabled version of the <code>Baseline</code>.
  final String? baselineVersion;

  /// Shows the parameters that are applied when enabling this
  /// <code>Baseline</code>.
  final List<EnabledBaselineParameterSummary>? parameters;

  EnabledBaselineDetails({
    required this.arn,
    required this.baselineIdentifier,
    required this.statusSummary,
    required this.targetIdentifier,
    this.baselineVersion,
    this.parameters,
  });

  factory EnabledBaselineDetails.fromJson(Map<String, dynamic> json) {
    return EnabledBaselineDetails(
      arn: json['arn'] as String,
      baselineIdentifier: json['baselineIdentifier'] as String,
      statusSummary: EnablementStatusSummary.fromJson(
          json['statusSummary'] as Map<String, dynamic>),
      targetIdentifier: json['targetIdentifier'] as String,
      baselineVersion: json['baselineVersion'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) => EnabledBaselineParameterSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final baselineIdentifier = this.baselineIdentifier;
    final statusSummary = this.statusSummary;
    final targetIdentifier = this.targetIdentifier;
    final baselineVersion = this.baselineVersion;
    final parameters = this.parameters;
    return {
      'arn': arn,
      'baselineIdentifier': baselineIdentifier,
      'statusSummary': statusSummary,
      'targetIdentifier': targetIdentifier,
      if (baselineVersion != null) 'baselineVersion': baselineVersion,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// A filter applied on the <code>ListEnabledBaseline</code> operation. Allowed
/// filters are <code>baselineIdentifiers</code> and
/// <code>targetIdentifiers</code>. The filter can be applied for either, or
/// both.
class EnabledBaselineFilter {
  /// Identifiers for the <code>Baseline</code> objects returned as part of the
  /// filter operation.
  final List<String>? baselineIdentifiers;

  /// Identifiers for the targets of the <code>Baseline</code> filter operation.
  final List<String>? targetIdentifiers;

  EnabledBaselineFilter({
    this.baselineIdentifiers,
    this.targetIdentifiers,
  });

  Map<String, dynamic> toJson() {
    final baselineIdentifiers = this.baselineIdentifiers;
    final targetIdentifiers = this.targetIdentifiers;
    return {
      if (baselineIdentifiers != null)
        'baselineIdentifiers': baselineIdentifiers,
      if (targetIdentifiers != null) 'targetIdentifiers': targetIdentifiers,
    };
  }
}

/// A key-value parameter to an <code>EnabledBaseline</code> resource.
class EnabledBaselineParameter {
  /// A string denoting the parameter key.
  final String key;

  /// A low-level <code>Document</code> object of any type (for example, a Java
  /// Object).
  final EnabledBaselineParameterDocument value;

  EnabledBaselineParameter({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class EnabledBaselineParameterDocument {
  EnabledBaselineParameterDocument();

  factory EnabledBaselineParameterDocument.fromJson(Map<String, dynamic> _) {
    return EnabledBaselineParameterDocument();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Summary of an applied parameter to an <code>EnabledBaseline</code> resource.
class EnabledBaselineParameterSummary {
  /// A string denoting the parameter key.
  final String key;

  /// A low-level document object of any type (for example, a Java Object).
  final EnabledBaselineParameterDocument value;

  EnabledBaselineParameterSummary({
    required this.key,
    required this.value,
  });

  factory EnabledBaselineParameterSummary.fromJson(Map<String, dynamic> json) {
    return EnabledBaselineParameterSummary(
      key: json['key'] as String,
      value: EnabledBaselineParameterDocument.fromJson(
          json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Returns a summary of information about an <code>EnabledBaseline</code>
/// object.
class EnabledBaselineSummary {
  /// The ARN of the <code>EnabledBaseline</code> resource
  final String arn;

  /// The specific baseline that is enabled as part of the
  /// <code>EnabledBaseline</code> resource.
  final String baselineIdentifier;
  final EnablementStatusSummary statusSummary;

  /// The target upon which the baseline is enabled.
  final String targetIdentifier;

  /// The enabled version of the baseline.
  final String? baselineVersion;

  EnabledBaselineSummary({
    required this.arn,
    required this.baselineIdentifier,
    required this.statusSummary,
    required this.targetIdentifier,
    this.baselineVersion,
  });

  factory EnabledBaselineSummary.fromJson(Map<String, dynamic> json) {
    return EnabledBaselineSummary(
      arn: json['arn'] as String,
      baselineIdentifier: json['baselineIdentifier'] as String,
      statusSummary: EnablementStatusSummary.fromJson(
          json['statusSummary'] as Map<String, dynamic>),
      targetIdentifier: json['targetIdentifier'] as String,
      baselineVersion: json['baselineVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final baselineIdentifier = this.baselineIdentifier;
    final statusSummary = this.statusSummary;
    final targetIdentifier = this.targetIdentifier;
    final baselineVersion = this.baselineVersion;
    return {
      'arn': arn,
      'baselineIdentifier': baselineIdentifier,
      'statusSummary': statusSummary,
      'targetIdentifier': targetIdentifier,
      if (baselineVersion != null) 'baselineVersion': baselineVersion,
    };
  }
}

/// Information about the enabled control.
class EnabledControlDetails {
  /// The ARN of the enabled control.
  final String? arn;

  /// The control identifier of the enabled control. For information on how to
  /// find the <code>controlIdentifier</code>, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/Welcome.html">the
  /// overview page</a>.
  final String? controlIdentifier;

  /// The drift status of the enabled control.
  final DriftStatusSummary? driftStatusSummary;

  /// Array of <code>EnabledControlParameter</code> objects.
  final List<EnabledControlParameterSummary>? parameters;

  /// The deployment summary of the enabled control.
  final EnablementStatusSummary? statusSummary;

  /// The ARN of the organizational unit. For information on how to find the
  /// <code>targetIdentifier</code>, see <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/Welcome.html">the
  /// overview page</a>.
  final String? targetIdentifier;

  /// Target Amazon Web Services Regions for the enabled control.
  final List<Region>? targetRegions;

  EnabledControlDetails({
    this.arn,
    this.controlIdentifier,
    this.driftStatusSummary,
    this.parameters,
    this.statusSummary,
    this.targetIdentifier,
    this.targetRegions,
  });

  factory EnabledControlDetails.fromJson(Map<String, dynamic> json) {
    return EnabledControlDetails(
      arn: json['arn'] as String?,
      controlIdentifier: json['controlIdentifier'] as String?,
      driftStatusSummary: json['driftStatusSummary'] != null
          ? DriftStatusSummary.fromJson(
              json['driftStatusSummary'] as Map<String, dynamic>)
          : null,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) => EnabledControlParameterSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      statusSummary: json['statusSummary'] != null
          ? EnablementStatusSummary.fromJson(
              json['statusSummary'] as Map<String, dynamic>)
          : null,
      targetIdentifier: json['targetIdentifier'] as String?,
      targetRegions: (json['targetRegions'] as List?)
          ?.whereNotNull()
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final controlIdentifier = this.controlIdentifier;
    final driftStatusSummary = this.driftStatusSummary;
    final parameters = this.parameters;
    final statusSummary = this.statusSummary;
    final targetIdentifier = this.targetIdentifier;
    final targetRegions = this.targetRegions;
    return {
      if (arn != null) 'arn': arn,
      if (controlIdentifier != null) 'controlIdentifier': controlIdentifier,
      if (driftStatusSummary != null) 'driftStatusSummary': driftStatusSummary,
      if (parameters != null) 'parameters': parameters,
      if (statusSummary != null) 'statusSummary': statusSummary,
      if (targetIdentifier != null) 'targetIdentifier': targetIdentifier,
      if (targetRegions != null) 'targetRegions': targetRegions,
    };
  }
}

/// A structure that returns a set of control identifiers, the control status
/// for each control in the set, and the drift status for each control in the
/// set.
class EnabledControlFilter {
  /// The set of <code>controlIdentifier</code> returned by the filter.
  final List<String>? controlIdentifiers;

  /// A list of <code>DriftStatus</code> items.
  final List<DriftStatus>? driftStatuses;

  /// A list of <code>EnablementStatus</code> items.
  final List<EnablementStatus>? statuses;

  EnabledControlFilter({
    this.controlIdentifiers,
    this.driftStatuses,
    this.statuses,
  });

  Map<String, dynamic> toJson() {
    final controlIdentifiers = this.controlIdentifiers;
    final driftStatuses = this.driftStatuses;
    final statuses = this.statuses;
    return {
      if (controlIdentifiers != null) 'controlIdentifiers': controlIdentifiers,
      if (driftStatuses != null)
        'driftStatuses': driftStatuses.map((e) => e.toValue()).toList(),
      if (statuses != null)
        'statuses': statuses.map((e) => e.toValue()).toList(),
    };
  }
}

/// A key/value pair, where <code>Key</code> is of type <code>String</code> and
/// <code>Value</code> is of type <code>Document</code>.
class EnabledControlParameter {
  /// The key of a key/value pair.
  final String key;

  /// The value of a key/value pair.
  final Document value;

  EnabledControlParameter({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Returns a summary of information about the parameters of an enabled control.
class EnabledControlParameterSummary {
  /// The key of a key/value pair.
  final String key;

  /// The value of a key/value pair.
  final Document value;

  EnabledControlParameterSummary({
    required this.key,
    required this.value,
  });

  factory EnabledControlParameterSummary.fromJson(Map<String, dynamic> json) {
    return EnabledControlParameterSummary(
      key: json['key'] as String,
      value: Document.fromJson(json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Returns a summary of information about an enabled control.
class EnabledControlSummary {
  /// The ARN of the enabled control.
  final String? arn;

  /// The <code>controlIdentifier</code> of the enabled control.
  final String? controlIdentifier;

  /// The drift status of the enabled control.
  final DriftStatusSummary? driftStatusSummary;

  /// A short description of the status of the enabled control.
  final EnablementStatusSummary? statusSummary;

  /// The ARN of the organizational unit.
  final String? targetIdentifier;

  EnabledControlSummary({
    this.arn,
    this.controlIdentifier,
    this.driftStatusSummary,
    this.statusSummary,
    this.targetIdentifier,
  });

  factory EnabledControlSummary.fromJson(Map<String, dynamic> json) {
    return EnabledControlSummary(
      arn: json['arn'] as String?,
      controlIdentifier: json['controlIdentifier'] as String?,
      driftStatusSummary: json['driftStatusSummary'] != null
          ? DriftStatusSummary.fromJson(
              json['driftStatusSummary'] as Map<String, dynamic>)
          : null,
      statusSummary: json['statusSummary'] != null
          ? EnablementStatusSummary.fromJson(
              json['statusSummary'] as Map<String, dynamic>)
          : null,
      targetIdentifier: json['targetIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final controlIdentifier = this.controlIdentifier;
    final driftStatusSummary = this.driftStatusSummary;
    final statusSummary = this.statusSummary;
    final targetIdentifier = this.targetIdentifier;
    return {
      if (arn != null) 'arn': arn,
      if (controlIdentifier != null) 'controlIdentifier': controlIdentifier,
      if (driftStatusSummary != null) 'driftStatusSummary': driftStatusSummary,
      if (statusSummary != null) 'statusSummary': statusSummary,
      if (targetIdentifier != null) 'targetIdentifier': targetIdentifier,
    };
  }
}

enum EnablementStatus {
  succeeded,
  failed,
  underChange,
}

extension EnablementStatusValueExtension on EnablementStatus {
  String toValue() {
    switch (this) {
      case EnablementStatus.succeeded:
        return 'SUCCEEDED';
      case EnablementStatus.failed:
        return 'FAILED';
      case EnablementStatus.underChange:
        return 'UNDER_CHANGE';
    }
  }
}

extension EnablementStatusFromString on String {
  EnablementStatus toEnablementStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return EnablementStatus.succeeded;
      case 'FAILED':
        return EnablementStatus.failed;
      case 'UNDER_CHANGE':
        return EnablementStatus.underChange;
    }
    throw Exception('$this is not known in enum EnablementStatus');
  }
}

/// The deployment summary of the enabled control.
class EnablementStatusSummary {
  /// The last operation identifier for the enabled control.
  final String? lastOperationIdentifier;

  /// The deployment status of the enabled control.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code>: The <code>enabledControl</code> configuration was
  /// deployed successfully.
  /// </li>
  /// <li>
  /// <code>UNDER_CHANGE</code>: The <code>enabledControl</code> configuration is
  /// changing.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The <code>enabledControl</code> configuration failed to
  /// deploy.
  /// </li>
  /// </ul>
  final EnablementStatus? status;

  EnablementStatusSummary({
    this.lastOperationIdentifier,
    this.status,
  });

  factory EnablementStatusSummary.fromJson(Map<String, dynamic> json) {
    return EnablementStatusSummary(
      lastOperationIdentifier: json['lastOperationIdentifier'] as String?,
      status: (json['status'] as String?)?.toEnablementStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastOperationIdentifier = this.lastOperationIdentifier;
    final status = this.status;
    return {
      if (lastOperationIdentifier != null)
        'lastOperationIdentifier': lastOperationIdentifier,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetBaselineOperationOutput {
  /// A <code>baselineOperation</code> object that shows information about the
  /// specified operation ID.
  final BaselineOperation baselineOperation;

  GetBaselineOperationOutput({
    required this.baselineOperation,
  });

  factory GetBaselineOperationOutput.fromJson(Map<String, dynamic> json) {
    return GetBaselineOperationOutput(
      baselineOperation: BaselineOperation.fromJson(
          json['baselineOperation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final baselineOperation = this.baselineOperation;
    return {
      'baselineOperation': baselineOperation,
    };
  }
}

class GetBaselineOutput {
  /// The baseline ARN.
  final String arn;

  /// A user-friendly name for the baseline.
  final String name;

  /// A description of the baseline.
  final String? description;

  GetBaselineOutput({
    required this.arn,
    required this.name,
    this.description,
  });

  factory GetBaselineOutput.fromJson(Map<String, dynamic> json) {
    return GetBaselineOutput(
      arn: json['arn'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final description = this.description;
    return {
      'arn': arn,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

class GetControlOperationOutput {
  /// An operation performed by the control.
  final ControlOperation controlOperation;

  GetControlOperationOutput({
    required this.controlOperation,
  });

  factory GetControlOperationOutput.fromJson(Map<String, dynamic> json) {
    return GetControlOperationOutput(
      controlOperation: ControlOperation.fromJson(
          json['controlOperation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final controlOperation = this.controlOperation;
    return {
      'controlOperation': controlOperation,
    };
  }
}

class GetEnabledBaselineOutput {
  /// Details of the <code>EnabledBaseline</code> resource.
  final EnabledBaselineDetails? enabledBaselineDetails;

  GetEnabledBaselineOutput({
    this.enabledBaselineDetails,
  });

  factory GetEnabledBaselineOutput.fromJson(Map<String, dynamic> json) {
    return GetEnabledBaselineOutput(
      enabledBaselineDetails: json['enabledBaselineDetails'] != null
          ? EnabledBaselineDetails.fromJson(
              json['enabledBaselineDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledBaselineDetails = this.enabledBaselineDetails;
    return {
      if (enabledBaselineDetails != null)
        'enabledBaselineDetails': enabledBaselineDetails,
    };
  }
}

class GetEnabledControlOutput {
  /// Information about the enabled control.
  final EnabledControlDetails enabledControlDetails;

  GetEnabledControlOutput({
    required this.enabledControlDetails,
  });

  factory GetEnabledControlOutput.fromJson(Map<String, dynamic> json) {
    return GetEnabledControlOutput(
      enabledControlDetails: EnabledControlDetails.fromJson(
          json['enabledControlDetails'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final enabledControlDetails = this.enabledControlDetails;
    return {
      'enabledControlDetails': enabledControlDetails,
    };
  }
}

class GetLandingZoneOperationOutput {
  /// Details about a landing zone operation.
  final LandingZoneOperationDetail operationDetails;

  GetLandingZoneOperationOutput({
    required this.operationDetails,
  });

  factory GetLandingZoneOperationOutput.fromJson(Map<String, dynamic> json) {
    return GetLandingZoneOperationOutput(
      operationDetails: LandingZoneOperationDetail.fromJson(
          json['operationDetails'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final operationDetails = this.operationDetails;
    return {
      'operationDetails': operationDetails,
    };
  }
}

class GetLandingZoneOutput {
  /// Information about the landing zone.
  final LandingZoneDetail landingZone;

  GetLandingZoneOutput({
    required this.landingZone,
  });

  factory GetLandingZoneOutput.fromJson(Map<String, dynamic> json) {
    return GetLandingZoneOutput(
      landingZone: LandingZoneDetail.fromJson(
          json['landingZone'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final landingZone = this.landingZone;
    return {
      'landingZone': landingZone,
    };
  }
}

/// Information about the landing zone.
class LandingZoneDetail {
  /// The landing zone manifest JSON text file that specifies the landing zone
  /// configurations.
  final Manifest manifest;

  /// The landing zone's current deployed version.
  final String version;

  /// The ARN of the landing zone.
  final String? arn;

  /// The drift status of the landing zone.
  final LandingZoneDriftStatusSummary? driftStatus;

  /// The latest available version of the landing zone.
  final String? latestAvailableVersion;

  /// The landing zone deployment status. One of <code>ACTIVE</code>,
  /// <code>PROCESSING</code>, <code>FAILED</code>.
  final LandingZoneStatus? status;

  LandingZoneDetail({
    required this.manifest,
    required this.version,
    this.arn,
    this.driftStatus,
    this.latestAvailableVersion,
    this.status,
  });

  factory LandingZoneDetail.fromJson(Map<String, dynamic> json) {
    return LandingZoneDetail(
      manifest: Manifest.fromJson(json['manifest'] as Map<String, dynamic>),
      version: json['version'] as String,
      arn: json['arn'] as String?,
      driftStatus: json['driftStatus'] != null
          ? LandingZoneDriftStatusSummary.fromJson(
              json['driftStatus'] as Map<String, dynamic>)
          : null,
      latestAvailableVersion: json['latestAvailableVersion'] as String?,
      status: (json['status'] as String?)?.toLandingZoneStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final manifest = this.manifest;
    final version = this.version;
    final arn = this.arn;
    final driftStatus = this.driftStatus;
    final latestAvailableVersion = this.latestAvailableVersion;
    final status = this.status;
    return {
      'manifest': manifest,
      'version': version,
      if (arn != null) 'arn': arn,
      if (driftStatus != null) 'driftStatus': driftStatus,
      if (latestAvailableVersion != null)
        'latestAvailableVersion': latestAvailableVersion,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum LandingZoneDriftStatus {
  drifted,
  inSync,
}

extension LandingZoneDriftStatusValueExtension on LandingZoneDriftStatus {
  String toValue() {
    switch (this) {
      case LandingZoneDriftStatus.drifted:
        return 'DRIFTED';
      case LandingZoneDriftStatus.inSync:
        return 'IN_SYNC';
    }
  }
}

extension LandingZoneDriftStatusFromString on String {
  LandingZoneDriftStatus toLandingZoneDriftStatus() {
    switch (this) {
      case 'DRIFTED':
        return LandingZoneDriftStatus.drifted;
      case 'IN_SYNC':
        return LandingZoneDriftStatus.inSync;
    }
    throw Exception('$this is not known in enum LandingZoneDriftStatus');
  }
}

/// The drift status summary of the landing zone.
///
/// If the landing zone differs from the expected configuration, it is defined
/// to be in a state of drift. You can repair this drift by resetting the
/// landing zone.
class LandingZoneDriftStatusSummary {
  /// The drift status of the landing zone.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: The landing zone deployed in this configuration does
  /// not match the configuration that Amazon Web Services Control Tower expected.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The landing zone deployed in this configuration
  /// matches the configuration that Amazon Web Services Control Tower expected.
  /// </li>
  /// </ul>
  final LandingZoneDriftStatus? status;

  LandingZoneDriftStatusSummary({
    this.status,
  });

  factory LandingZoneDriftStatusSummary.fromJson(Map<String, dynamic> json) {
    return LandingZoneDriftStatusSummary(
      status: (json['status'] as String?)?.toLandingZoneDriftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Information about a landing zone operation.
class LandingZoneOperationDetail {
  /// The landing zone operation end time.
  final DateTime? endTime;

  /// The landing zone operation type.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>DELETE</code>: The <code>DeleteLandingZone</code> operation.
  /// </li>
  /// <li>
  /// <code>CREATE</code>: The <code>CreateLandingZone</code> operation.
  /// </li>
  /// <li>
  /// <code>UPDATE</code>: The <code>UpdateLandingZone</code> operation.
  /// </li>
  /// <li>
  /// <code>RESET</code>: The <code>ResetLandingZone</code> operation.
  /// </li>
  /// </ul>
  final LandingZoneOperationType? operationType;

  /// The landing zone operation start time.
  final DateTime? startTime;

  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code>: The landing zone operation succeeded.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code>: The landing zone operation is in progress.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The landing zone operation failed.
  /// </li>
  /// </ul>
  final LandingZoneOperationStatus? status;

  /// If the operation result is FAILED, this string contains a message explaining
  /// why the operation failed.
  final String? statusMessage;

  LandingZoneOperationDetail({
    this.endTime,
    this.operationType,
    this.startTime,
    this.status,
    this.statusMessage,
  });

  factory LandingZoneOperationDetail.fromJson(Map<String, dynamic> json) {
    return LandingZoneOperationDetail(
      endTime: timeStampFromJson(json['endTime']),
      operationType:
          (json['operationType'] as String?)?.toLandingZoneOperationType(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toLandingZoneOperationStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final operationType = this.operationType;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (operationType != null) 'operationType': operationType.toValue(),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum LandingZoneOperationStatus {
  succeeded,
  failed,
  inProgress,
}

extension LandingZoneOperationStatusValueExtension
    on LandingZoneOperationStatus {
  String toValue() {
    switch (this) {
      case LandingZoneOperationStatus.succeeded:
        return 'SUCCEEDED';
      case LandingZoneOperationStatus.failed:
        return 'FAILED';
      case LandingZoneOperationStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension LandingZoneOperationStatusFromString on String {
  LandingZoneOperationStatus toLandingZoneOperationStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return LandingZoneOperationStatus.succeeded;
      case 'FAILED':
        return LandingZoneOperationStatus.failed;
      case 'IN_PROGRESS':
        return LandingZoneOperationStatus.inProgress;
    }
    throw Exception('$this is not known in enum LandingZoneOperationStatus');
  }
}

enum LandingZoneOperationType {
  delete,
  create,
  update,
  reset,
}

extension LandingZoneOperationTypeValueExtension on LandingZoneOperationType {
  String toValue() {
    switch (this) {
      case LandingZoneOperationType.delete:
        return 'DELETE';
      case LandingZoneOperationType.create:
        return 'CREATE';
      case LandingZoneOperationType.update:
        return 'UPDATE';
      case LandingZoneOperationType.reset:
        return 'RESET';
    }
  }
}

extension LandingZoneOperationTypeFromString on String {
  LandingZoneOperationType toLandingZoneOperationType() {
    switch (this) {
      case 'DELETE':
        return LandingZoneOperationType.delete;
      case 'CREATE':
        return LandingZoneOperationType.create;
      case 'UPDATE':
        return LandingZoneOperationType.update;
      case 'RESET':
        return LandingZoneOperationType.reset;
    }
    throw Exception('$this is not known in enum LandingZoneOperationType');
  }
}

enum LandingZoneStatus {
  active,
  processing,
  failed,
}

extension LandingZoneStatusValueExtension on LandingZoneStatus {
  String toValue() {
    switch (this) {
      case LandingZoneStatus.active:
        return 'ACTIVE';
      case LandingZoneStatus.processing:
        return 'PROCESSING';
      case LandingZoneStatus.failed:
        return 'FAILED';
    }
  }
}

extension LandingZoneStatusFromString on String {
  LandingZoneStatus toLandingZoneStatus() {
    switch (this) {
      case 'ACTIVE':
        return LandingZoneStatus.active;
      case 'PROCESSING':
        return LandingZoneStatus.processing;
      case 'FAILED':
        return LandingZoneStatus.failed;
    }
    throw Exception('$this is not known in enum LandingZoneStatus');
  }
}

/// Returns a summary of information about a landing zone.
class LandingZoneSummary {
  /// The ARN of the landing zone.
  final String? arn;

  LandingZoneSummary({
    this.arn,
  });

  factory LandingZoneSummary.fromJson(Map<String, dynamic> json) {
    return LandingZoneSummary(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

class ListBaselinesOutput {
  /// A list of <code>Baseline</code> object details.
  final List<BaselineSummary> baselines;

  /// A pagination token.
  final String? nextToken;

  ListBaselinesOutput({
    required this.baselines,
    this.nextToken,
  });

  factory ListBaselinesOutput.fromJson(Map<String, dynamic> json) {
    return ListBaselinesOutput(
      baselines: (json['baselines'] as List)
          .whereNotNull()
          .map((e) => BaselineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baselines = this.baselines;
    final nextToken = this.nextToken;
    return {
      'baselines': baselines,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListControlOperationsOutput {
  /// Returns a list of output from control operations. PLACEHOLDER
  final List<ControlOperationSummary> controlOperations;

  /// A pagination token.
  final String? nextToken;

  ListControlOperationsOutput({
    required this.controlOperations,
    this.nextToken,
  });

  factory ListControlOperationsOutput.fromJson(Map<String, dynamic> json) {
    return ListControlOperationsOutput(
      controlOperations: (json['controlOperations'] as List)
          .whereNotNull()
          .map((e) =>
              ControlOperationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlOperations = this.controlOperations;
    final nextToken = this.nextToken;
    return {
      'controlOperations': controlOperations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnabledBaselinesOutput {
  /// Retuens a list of summaries of <code>EnabledBaseline</code> resources.
  final List<EnabledBaselineSummary> enabledBaselines;

  /// A pagination token.
  final String? nextToken;

  ListEnabledBaselinesOutput({
    required this.enabledBaselines,
    this.nextToken,
  });

  factory ListEnabledBaselinesOutput.fromJson(Map<String, dynamic> json) {
    return ListEnabledBaselinesOutput(
      enabledBaselines: (json['enabledBaselines'] as List)
          .whereNotNull()
          .map(
              (e) => EnabledBaselineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledBaselines = this.enabledBaselines;
    final nextToken = this.nextToken;
    return {
      'enabledBaselines': enabledBaselines,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnabledControlsOutput {
  /// Lists the controls enabled by Amazon Web Services Control Tower on the
  /// specified organizational unit and the accounts it contains.
  final List<EnabledControlSummary> enabledControls;

  /// Retrieves the next page of results. If the string is empty, the response is
  /// the end of the results.
  final String? nextToken;

  ListEnabledControlsOutput({
    required this.enabledControls,
    this.nextToken,
  });

  factory ListEnabledControlsOutput.fromJson(Map<String, dynamic> json) {
    return ListEnabledControlsOutput(
      enabledControls: (json['enabledControls'] as List)
          .whereNotNull()
          .map((e) => EnabledControlSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledControls = this.enabledControls;
    final nextToken = this.nextToken;
    return {
      'enabledControls': enabledControls,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLandingZonesOutput {
  /// The ARN of the landing zone.
  final List<LandingZoneSummary> landingZones;

  /// Retrieves the next page of results. If the string is empty, the response is
  /// the end of the results.
  final String? nextToken;

  ListLandingZonesOutput({
    required this.landingZones,
    this.nextToken,
  });

  factory ListLandingZonesOutput.fromJson(Map<String, dynamic> json) {
    return ListLandingZonesOutput(
      landingZones: (json['landingZones'] as List)
          .whereNotNull()
          .map((e) => LandingZoneSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final landingZones = this.landingZones;
    final nextToken = this.nextToken;
    return {
      'landingZones': landingZones,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// A list of tags, as <code>key:value</code> strings.
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    required this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

class Manifest {
  Manifest();

  factory Manifest.fromJson(Map<String, dynamic> _) {
    return Manifest();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An Amazon Web Services Region in which Amazon Web Services Control Tower
/// expects to find the control deployed.
///
/// The expected Regions are based on the Regions that are governed by the
/// landing zone. In certain cases, a control is not actually enabled in the
/// Region as expected, such as during drift, or <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/region-how.html#mixed-governance">mixed
/// governance</a>.
class Region {
  /// The Amazon Web Services Region name.
  final String? name;

  Region({
    this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

class ResetEnabledBaselineOutput {
  /// The ID (in UUID format) of the asynchronous
  /// <code>ResetEnabledBaseline</code> operation. This
  /// <code>operationIdentifier</code> is used to track status through calls to
  /// the <code>GetBaselineOperation</code> API.
  final String operationIdentifier;

  ResetEnabledBaselineOutput({
    required this.operationIdentifier,
  });

  factory ResetEnabledBaselineOutput.fromJson(Map<String, dynamic> json) {
    return ResetEnabledBaselineOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class ResetLandingZoneOutput {
  /// A unique identifier assigned to a <code>ResetLandingZone</code> operation.
  /// You can use this identifier as an input parameter of
  /// <code>GetLandingZoneOperation</code> to check the operation's status.
  final String operationIdentifier;

  ResetLandingZoneOutput({
    required this.operationIdentifier,
  });

  factory ResetLandingZoneOutput.fromJson(Map<String, dynamic> json) {
    return ResetLandingZoneOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateEnabledBaselineOutput {
  /// The ID (in UUID format) of the asynchronous
  /// <code>UpdateEnabledBaseline</code> operation. This
  /// <code>operationIdentifier</code> is used to track status through calls to
  /// the <code>GetBaselineOperation</code> API.
  final String operationIdentifier;

  UpdateEnabledBaselineOutput({
    required this.operationIdentifier,
  });

  factory UpdateEnabledBaselineOutput.fromJson(Map<String, dynamic> json) {
    return UpdateEnabledBaselineOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class UpdateEnabledControlOutput {
  /// The operation identifier for this <code>UpdateEnabledControl</code>
  /// operation.
  final String operationIdentifier;

  UpdateEnabledControlOutput({
    required this.operationIdentifier,
  });

  factory UpdateEnabledControlOutput.fromJson(Map<String, dynamic> json) {
    return UpdateEnabledControlOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class UpdateLandingZoneOutput {
  /// A unique identifier assigned to a <code>UpdateLandingZone</code> operation.
  /// You can use this identifier as an input of
  /// <code>GetLandingZoneOperation</code> to check the operation's status.
  final String operationIdentifier;

  UpdateLandingZoneOutput({
    required this.operationIdentifier,
  });

  factory UpdateLandingZoneOutput.fromJson(Map<String, dynamic> json) {
    return UpdateLandingZoneOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
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
