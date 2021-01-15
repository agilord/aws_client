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

part '2014-11-06.g.dart';

/// AWS Systems Manager is a collection of capabilities that helps you automate
/// management tasks such as collecting system inventory, applying operating
/// system (OS) patches, automating the creation of Amazon Machine Images
/// (AMIs), and configuring operating systems (OSs) and applications at scale.
/// Systems Manager lets you remotely and securely manage the configuration of
/// your managed instances. A <i>managed instance</i> is any Amazon Elastic
/// Compute Cloud instance (EC2 instance), or any on-premises server or virtual
/// machine (VM) in your hybrid environment that has been configured for Systems
/// Manager.
class Ssm {
  final _s.JsonProtocol _protocol;
  Ssm({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ssm',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds or overwrites one or more tags for the specified resource. Tags are
  /// metadata that you can assign to your documents, managed instances,
  /// maintenance windows, Parameter Store parameters, and patch baselines. Tags
  /// enable you to categorize your resources in different ways, for example, by
  /// purpose, owner, or environment. Each tag consists of a key and an optional
  /// value, both of which you define. For example, you could define a set of
  /// tags for your account's managed instances that helps you track each
  /// instance's owner and stack level. For example: Key=Owner and
  /// Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production,
  /// Pre-Production, or Test.
  ///
  /// Each resource can have a maximum of 50 tags.
  ///
  /// We recommend that you devise a set of tag keys that meets your needs for
  /// each resource type. Using a consistent set of tag keys makes it easier for
  /// you to manage your resources. You can search and filter the resources
  /// based on the tags you add. Tags don't have any semantic meaning to and are
  /// interpreted strictly as a string of characters.
  ///
  /// For more information about using tags with EC2 instances, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging
  /// your Amazon EC2 resources</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// May throw [InvalidResourceType].
  /// May throw [InvalidResourceId].
  /// May throw [InternalServerError].
  /// May throw [TooManyTagsError].
  /// May throw [TooManyUpdates].
  ///
  /// Parameter [resourceId] :
  /// The resource ID you want to tag.
  ///
  /// Use the ID of the resource. Here are some examples:
  ///
  /// ManagedInstance: mi-012345abcde
  ///
  /// MaintenanceWindow: mw-012345abcde
  ///
  /// PatchBaseline: pb-012345abcde
  ///
  /// For the Document and Parameter values, use the name of the resource.
  /// <note>
  /// The ManagedInstance type for this API action is only for on-premises
  /// managed instances. You must specify the name of the managed instance in
  /// the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  /// </note>
  ///
  /// Parameter [resourceType] :
  /// Specifies the type of resource you are tagging.
  /// <note>
  /// The ManagedInstance type for this API action is for on-premises managed
  /// instances. You must specify the name of the managed instance in the
  /// following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  /// </note>
  ///
  /// Parameter [tags] :
  /// One or more tags. The value parameter is required, but if you don't want
  /// the tag to have a value, specify the parameter with no value, and we set
  /// the value to an empty string.
  /// <important>
  /// Do not enter personally identifiable information in this field.
  /// </important>
  Future<void> addTagsToResource({
    @_s.required String resourceId,
    @_s.required ResourceTypeForTagging resourceType,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.AddTagsToResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ResourceType': resourceType?.toValue() ?? '',
        'Tags': tags,
      },
    );

    return AddTagsToResourceResult.fromJson(jsonResponse.body);
  }

  /// Attempts to cancel the command specified by the Command ID. There is no
  /// guarantee that the command will be terminated and the underlying process
  /// stopped.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidCommandId].
  /// May throw [InvalidInstanceId].
  /// May throw [DuplicateInstanceId].
  ///
  /// Parameter [commandId] :
  /// The ID of the command you want to cancel.
  ///
  /// Parameter [instanceIds] :
  /// (Optional) A list of instance IDs on which you want to cancel the command.
  /// If not provided, the command is canceled on every instance on which it was
  /// requested.
  Future<void> cancelCommand({
    @_s.required String commandId,
    List<String> instanceIds,
  }) async {
    ArgumentError.checkNotNull(commandId, 'commandId');
    _s.validateStringLength(
      'commandId',
      commandId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CancelCommand'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CommandId': commandId,
        if (instanceIds != null) 'InstanceIds': instanceIds,
      },
    );

    return CancelCommandResult.fromJson(jsonResponse.body);
  }

  /// Stops a maintenance window execution that is already in progress and
  /// cancels any tasks in the window that have not already starting running.
  /// (Tasks already in progress will continue to completion.)
  ///
  /// May throw [InternalServerError].
  /// May throw [DoesNotExistException].
  ///
  /// Parameter [windowExecutionId] :
  /// The ID of the maintenance window execution to stop.
  Future<CancelMaintenanceWindowExecutionResult>
      cancelMaintenanceWindowExecution({
    @_s.required String windowExecutionId,
  }) async {
    ArgumentError.checkNotNull(windowExecutionId, 'windowExecutionId');
    _s.validateStringLength(
      'windowExecutionId',
      windowExecutionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowExecutionId',
      windowExecutionId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CancelMaintenanceWindowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowExecutionId': windowExecutionId,
      },
    );

    return CancelMaintenanceWindowExecutionResult.fromJson(jsonResponse.body);
  }

  /// Generates an activation code and activation ID you can use to register
  /// your on-premises server or virtual machine (VM) with Systems Manager.
  /// Registering these machines with Systems Manager makes it possible to
  /// manage them using Systems Manager capabilities. You use the activation
  /// code and ID when installing SSM Agent on machines in your hybrid
  /// environment. For more information about requirements for managing
  /// on-premises instances and VMs using Systems Manager, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting
  /// up AWS Systems Manager for hybrid environments</a> in the <i>AWS Systems
  /// Manager User Guide</i>.
  /// <note>
  /// On-premises servers or VMs that are registered with Systems Manager and
  /// EC2 instances that you manage with Systems Manager are all called
  /// <i>managed instances</i>.
  /// </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [iamRole] :
  /// The Amazon Identity and Access Management (IAM) role that you want to
  /// assign to the managed instance. This IAM role must provide AssumeRole
  /// permissions for the Systems Manager service principal
  /// <code>ssm.amazonaws.com</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-service-role.html">Create
  /// an IAM service role for a hybrid environment</a> in the <i>AWS Systems
  /// Manager User Guide</i>.
  ///
  /// Parameter [defaultInstanceName] :
  /// The name of the registered, managed instance as it will appear in the
  /// Systems Manager console or when you use the AWS command line tools to list
  /// Systems Manager resources.
  /// <important>
  /// Do not enter personally identifiable information in this field.
  /// </important>
  ///
  /// Parameter [description] :
  /// A user-defined description of the resource that you want to register with
  /// Systems Manager.
  /// <important>
  /// Do not enter personally identifiable information in this field.
  /// </important>
  ///
  /// Parameter [expirationDate] :
  /// The date by which this activation request should expire. The default value
  /// is 24 hours.
  ///
  /// Parameter [registrationLimit] :
  /// Specify the maximum number of managed instances you want to register. The
  /// default value is 1 instance.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. Tags enable you to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag an activation to identify
  /// which servers or virtual machines (VMs) in your on-premises environment
  /// you intend to activate. In this case, you could specify the following key
  /// name/value pairs:
  ///
  /// <ul>
  /// <li>
  /// <code>Key=OS,Value=Windows</code>
  /// </li>
  /// <li>
  /// <code>Key=Environment,Value=Production</code>
  /// </li>
  /// </ul> <important>
  /// When you install SSM Agent on your on-premises servers and VMs, you
  /// specify an activation ID and code. When you specify the activation ID and
  /// code, tags assigned to the activation are automatically applied to the
  /// on-premises servers or VMs.
  /// </important>
  /// You can't add tags to or delete tags from an existing activation. You can
  /// tag your on-premises servers and VMs after they connect to Systems Manager
  /// for the first time and are assigned a managed instance ID. This means they
  /// are listed in the AWS Systems Manager console with an ID that is prefixed
  /// with "mi-". For information about how to add tags to your managed
  /// instances, see <a>AddTagsToResource</a>. For information about how to
  /// remove tags from your managed instances, see
  /// <a>RemoveTagsFromResource</a>.
  Future<CreateActivationResult> createActivation({
    @_s.required String iamRole,
    String defaultInstanceName,
    String description,
    DateTime expirationDate,
    int registrationLimit,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(iamRole, 'iamRole');
    _s.validateStringLength(
      'iamRole',
      iamRole,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'defaultInstanceName',
      defaultInstanceName,
      0,
      256,
    );
    _s.validateStringPattern(
      'defaultInstanceName',
      defaultInstanceName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateNumRange(
      'registrationLimit',
      registrationLimit,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateActivation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamRole': iamRole,
        if (defaultInstanceName != null)
          'DefaultInstanceName': defaultInstanceName,
        if (description != null) 'Description': description,
        if (expirationDate != null)
          'ExpirationDate': unixTimestampToJson(expirationDate),
        if (registrationLimit != null) 'RegistrationLimit': registrationLimit,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateActivationResult.fromJson(jsonResponse.body);
  }

  /// A State Manager association defines the state that you want to maintain on
  /// your instances. For example, an association can specify that anti-virus
  /// software must be installed and running on your instances, or that certain
  /// ports must be closed. For static targets, the association specifies a
  /// schedule for when the configuration is reapplied. For dynamic targets,
  /// such as an AWS Resource Group or an AWS Autoscaling Group, State Manager
  /// applies the configuration when new instances are added to the group. The
  /// association also specifies actions to take when applying the
  /// configuration. For example, an association for anti-virus software might
  /// run once a day. If the software is not installed, then State Manager
  /// installs it. If the software is installed, but the service is not running,
  /// then the association might instruct State Manager to start the service.
  ///
  /// May throw [AssociationAlreadyExists].
  /// May throw [AssociationLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentVersion].
  /// May throw [InvalidInstanceId].
  /// May throw [UnsupportedPlatformType].
  /// May throw [InvalidOutputLocation].
  /// May throw [InvalidParameters].
  /// May throw [InvalidTarget].
  /// May throw [InvalidSchedule].
  ///
  /// Parameter [name] :
  /// The name of the SSM document that contains the configuration information
  /// for the instance. You can specify Command or Automation documents.
  ///
  /// You can specify AWS-predefined documents, documents you created, or a
  /// document that is shared with you from another account.
  ///
  /// For SSM documents that are shared with you from other AWS accounts, you
  /// must specify the complete SSM document ARN, in the following format:
  ///
  /// <code>arn:<i>partition</i>:ssm:<i>region</i>:<i>account-id</i>:document/<i>document-name</i>
  /// </code>
  ///
  /// For example:
  ///
  /// <code>arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document</code>
  ///
  /// For AWS-predefined documents and SSM documents you created in your
  /// account, you only need to specify the document name. For example,
  /// <code>AWS-ApplyPatchBaseline</code> or <code>My-Document</code>.
  ///
  /// Parameter [applyOnlyAtCronInterval] :
  /// By default, when you create a new associations, the system runs it
  /// immediately after it is created and then according to the schedule you
  /// specified. Specify this option if you don't want an association to run
  /// immediately after you create it. This parameter is not supported for rate
  /// expressions.
  ///
  /// Parameter [associationName] :
  /// Specify a descriptive name for the association.
  ///
  /// Parameter [automationTargetParameterName] :
  /// Specify the target for the association. This target is required for
  /// associations that use an Automation document and target resources by using
  /// rate controls.
  ///
  /// Parameter [complianceSeverity] :
  /// The severity level to assign to the association.
  ///
  /// Parameter [documentVersion] :
  /// The document version you want to associate with the target(s). Can be a
  /// specific version or the default version.
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  /// <note>
  /// <code>InstanceId</code> has been deprecated. To specify an instance ID for
  /// an association, use the <code>Targets</code> parameter. Requests that
  /// include the parameter <code>InstanceID</code> with SSM documents that use
  /// schema version 2.0 or later will fail. In addition, if you use the
  /// parameter <code>InstanceId</code>, you cannot use the parameters
  /// <code>AssociationName</code>, <code>DocumentVersion</code>,
  /// <code>MaxErrors</code>, <code>MaxConcurrency</code>,
  /// <code>OutputLocation</code>, or <code>ScheduleExpression</code>. To use
  /// these parameters, you must use the <code>Targets</code> parameter.
  /// </note>
  ///
  /// Parameter [maxConcurrency] :
  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will
  /// process its association within the limit specified for MaxConcurrency.
  ///
  /// Parameter [maxErrors] :
  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of
  /// the target set, for example 10%. If you specify 3, for example, the system
  /// stops sending requests when the fourth error is received. If you specify
  /// 0, then the system stops sending requests after the first error is
  /// returned. If you run an association on 50 instances and set MaxError to
  /// 10%, then the system stops sending the request when the sixth error is
  /// received.
  ///
  /// Executions that are already running an association when MaxErrors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set MaxConcurrency to 1 so that executions proceed one
  /// at a time.
  ///
  /// Parameter [outputLocation] :
  /// An S3 bucket where you want to store the output details of the request.
  ///
  /// Parameter [parameters] :
  /// The parameters for the runtime configuration of the document.
  ///
  /// Parameter [scheduleExpression] :
  /// A cron expression when the association will be applied to the target(s).
  ///
  /// Parameter [syncCompliance] :
  /// The mode for generating association compliance. You can specify
  /// <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the
  /// system uses the status of the association execution to determine the
  /// compliance status. If the association execution runs successfully, then
  /// the association is <code>COMPLIANT</code>. If the association execution
  /// doesn't run successfully, the association is <code>NON-COMPLIANT</code>.
  ///
  /// In <code>MANUAL</code> mode, you must specify the
  /// <code>AssociationId</code> as a parameter for the
  /// <a>PutComplianceItems</a> API action. In this case, compliance data is not
  /// managed by State Manager. It is managed by your direct call to the
  /// <a>PutComplianceItems</a> API action.
  ///
  /// By default, all associations use <code>AUTO</code> mode.
  ///
  /// Parameter [targetLocations] :
  /// A location is a combination of AWS Regions and AWS accounts where you want
  /// to run the association. Use this action to create an association in
  /// multiple Regions and multiple accounts.
  ///
  /// Parameter [targets] :
  /// The targets for the association. You can target instances by using tags,
  /// AWS Resource Groups, all instances in an AWS account, or individual
  /// instance IDs. For more information about choosing targets for an
  /// association, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-state-manager-targets-and-rate-controls.html">Using
  /// targets and rate controls with State Manager associations</a> in the
  /// <i>AWS Systems Manager User Guide</i>.
  Future<CreateAssociationResult> createAssociation({
    @_s.required String name,
    bool applyOnlyAtCronInterval,
    String associationName,
    String automationTargetParameterName,
    AssociationComplianceSeverity complianceSeverity,
    String documentVersion,
    String instanceId,
    String maxConcurrency,
    String maxErrors,
    InstanceAssociationOutputLocation outputLocation,
    Map<String, List<String>> parameters,
    String scheduleExpression,
    AssociationSyncCompliance syncCompliance,
    List<TargetLocation> targetLocations,
    List<Target> targets,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'associationName',
      associationName,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    _s.validateStringLength(
      'automationTargetParameterName',
      automationTargetParameterName,
      1,
      50,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
    );
    _s.validateStringLength(
      'maxConcurrency',
      maxConcurrency,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxConcurrency',
      maxConcurrency,
      r'''^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$''',
    );
    _s.validateStringLength(
      'maxErrors',
      maxErrors,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxErrors',
      maxErrors,
      r'''^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$''',
    );
    _s.validateStringLength(
      'scheduleExpression',
      scheduleExpression,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (applyOnlyAtCronInterval != null)
          'ApplyOnlyAtCronInterval': applyOnlyAtCronInterval,
        if (associationName != null) 'AssociationName': associationName,
        if (automationTargetParameterName != null)
          'AutomationTargetParameterName': automationTargetParameterName,
        if (complianceSeverity != null)
          'ComplianceSeverity': complianceSeverity.toValue(),
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (instanceId != null) 'InstanceId': instanceId,
        if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
        if (maxErrors != null) 'MaxErrors': maxErrors,
        if (outputLocation != null) 'OutputLocation': outputLocation,
        if (parameters != null) 'Parameters': parameters,
        if (scheduleExpression != null)
          'ScheduleExpression': scheduleExpression,
        if (syncCompliance != null) 'SyncCompliance': syncCompliance.toValue(),
        if (targetLocations != null) 'TargetLocations': targetLocations,
        if (targets != null) 'Targets': targets,
      },
    );

    return CreateAssociationResult.fromJson(jsonResponse.body);
  }

  /// Associates the specified Systems Manager document with the specified
  /// instances or targets.
  ///
  /// When you associate a document with one or more instances using instance
  /// IDs or tags, SSM Agent running on the instance processes the document and
  /// configures the instance as specified.
  ///
  /// If you associate a document with an instance that already has an
  /// associated document, the system returns the AssociationAlreadyExists
  /// exception.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentVersion].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidParameters].
  /// May throw [DuplicateInstanceId].
  /// May throw [AssociationLimitExceeded].
  /// May throw [UnsupportedPlatformType].
  /// May throw [InvalidOutputLocation].
  /// May throw [InvalidTarget].
  /// May throw [InvalidSchedule].
  ///
  /// Parameter [entries] :
  /// One or more associations.
  Future<CreateAssociationBatchResult> createAssociationBatch({
    @_s.required List<CreateAssociationBatchRequestEntry> entries,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateAssociationBatch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Entries': entries,
      },
    );

    return CreateAssociationBatchResult.fromJson(jsonResponse.body);
  }

  /// Creates a Systems Manager (SSM) document. An SSM document defines the
  /// actions that Systems Manager performs on your managed instances. For more
  /// information about SSM documents, including information about supported
  /// schemas, features, and syntax, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">AWS
  /// Systems Manager Documents</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// May throw [DocumentAlreadyExists].
  /// May throw [MaxDocumentSizeExceeded].
  /// May throw [InternalServerError].
  /// May throw [InvalidDocumentContent].
  /// May throw [DocumentLimitExceeded].
  /// May throw [InvalidDocumentSchemaVersion].
  ///
  /// Parameter [content] :
  /// The content for the new SSM document in JSON or YAML format. We recommend
  /// storing the contents for your new document in an external JSON or YAML
  /// file and referencing the file in a command.
  ///
  /// For examples, see the following topics in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/create-ssm-document-api.html">Create
  /// an SSM document (AWS API)</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/create-ssm-document-cli.html">Create
  /// an SSM document (AWS CLI)</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/create-ssm-document-api.html">Create
  /// an SSM document (API)</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// A name for the Systems Manager document.
  /// <important>
  /// You can't use the following strings as document name prefixes. These are
  /// reserved by AWS for use as document name prefixes:
  ///
  /// <ul>
  /// <li>
  /// <code>aws-</code>
  /// </li>
  /// <li>
  /// <code>amazon</code>
  /// </li>
  /// <li>
  /// <code>amzn</code>
  /// </li>
  /// </ul> </important>
  ///
  /// Parameter [attachments] :
  /// A list of key and value pairs that describe attachments to a version of a
  /// document.
  ///
  /// Parameter [documentFormat] :
  /// Specify the document format for the request. The document format can be
  /// JSON, YAML, or TEXT. JSON is the default format.
  ///
  /// Parameter [documentType] :
  /// The type of document to create.
  ///
  /// Parameter [requires] :
  /// A list of SSM documents required by a document. This parameter is used
  /// exclusively by AWS AppConfig. When a user creates an AppConfig
  /// configuration in an SSM document, the user must also specify a required
  /// document for validation purposes. In this case, an
  /// <code>ApplicationConfiguration</code> document requires an
  /// <code>ApplicationConfigurationSchema</code> document for validation
  /// purposes. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig.html">AWS
  /// AppConfig</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. Tags enable you to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag an SSM document to
  /// identify the types of targets or the environment where it will run. In
  /// this case, you could specify the following key name/value pairs:
  ///
  /// <ul>
  /// <li>
  /// <code>Key=OS,Value=Windows</code>
  /// </li>
  /// <li>
  /// <code>Key=Environment,Value=Production</code>
  /// </li>
  /// </ul> <note>
  /// To add tags to an existing SSM document, use the <a>AddTagsToResource</a>
  /// action.
  /// </note>
  ///
  /// Parameter [targetType] :
  /// Specify a target type to define the kinds of resources the document can
  /// run on. For example, to run a document on EC2 instances, specify the
  /// following value: /AWS::EC2::Instance. If you specify a value of '/' the
  /// document can run on all types of resources. If you don't specify a value,
  /// the document can't run on any resources. For a list of valid resource
  /// types, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
  /// resource and property types reference</a> in the <i>AWS CloudFormation
  /// User Guide</i>.
  ///
  /// Parameter [versionName] :
  /// An optional field specifying the version of the artifact you are creating
  /// with the document. For example, "Release 12, Update 6". This value is
  /// unique across all versions of a document, and cannot be changed.
  Future<CreateDocumentResult> createDocument({
    @_s.required String content,
    @_s.required String name,
    List<AttachmentsSource> attachments,
    DocumentFormat documentFormat,
    DocumentType documentType,
    List<DocumentRequires> requires,
    List<Tag> tags,
    String targetType,
    String versionName,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    _s.validateStringLength(
      'content',
      content,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'targetType',
      targetType,
      0,
      200,
    );
    _s.validateStringPattern(
      'targetType',
      targetType,
      r'''^\/[\w\.\-\:\/]*$''',
    );
    _s.validateStringPattern(
      'versionName',
      versionName,
      r'''^[a-zA-Z0-9_\-.]{1,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Content': content,
        'Name': name,
        if (attachments != null) 'Attachments': attachments,
        if (documentFormat != null) 'DocumentFormat': documentFormat.toValue(),
        if (documentType != null) 'DocumentType': documentType.toValue(),
        if (requires != null) 'Requires': requires,
        if (tags != null) 'Tags': tags,
        if (targetType != null) 'TargetType': targetType,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return CreateDocumentResult.fromJson(jsonResponse.body);
  }

  /// Creates a new maintenance window.
  /// <note>
  /// The value you specify for <code>Duration</code> determines the specific
  /// end time for the maintenance window based on the time it begins. No
  /// maintenance window tasks are permitted to start after the resulting
  /// endtime minus the number of hours you specify for <code>Cutoff</code>. For
  /// example, if the maintenance window starts at 3 PM, the duration is three
  /// hours, and the value you specify for <code>Cutoff</code> is one hour, no
  /// maintenance window tasks can start after 5 PM.
  /// </note>
  ///
  /// May throw [IdempotentParameterMismatch].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [allowUnassociatedTargets] :
  /// Enables a maintenance window task to run on managed instances, even if you
  /// have not registered those instances as targets. If enabled, then you must
  /// specify the unregistered instances (by instance ID) when you register a
  /// task with the maintenance window.
  ///
  /// If you don't enable this option, then you must specify
  /// previously-registered targets when you register a task with the
  /// maintenance window.
  ///
  /// Parameter [cutoff] :
  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  ///
  /// Parameter [duration] :
  /// The duration of the maintenance window in hours.
  ///
  /// Parameter [name] :
  /// The name of the maintenance window.
  ///
  /// Parameter [schedule] :
  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token.
  ///
  /// Parameter [description] :
  /// An optional description for the maintenance window. We recommend
  /// specifying a description to help you organize your maintenance windows.
  ///
  /// Parameter [endDate] :
  /// The date and time, in ISO-8601 Extended format, for when you want the
  /// maintenance window to become inactive. EndDate allows you to set a date
  /// and time in the future when the maintenance window will no longer run.
  ///
  /// Parameter [scheduleOffset] :
  /// The number of days to wait after the date and time specified by a CRON
  /// expression before running the maintenance window.
  ///
  /// For example, the following cron expression schedules a maintenance window
  /// to run on the third Tuesday of every month at 11:30 PM.
  ///
  /// <code>cron(30 23 ? * TUE#3 *)</code>
  ///
  /// If the schedule offset is <code>2</code>, the maintenance window won't run
  /// until two days later.
  ///
  /// Parameter [scheduleTimezone] :
  /// The time zone that the scheduled maintenance window executions are based
  /// on, in Internet Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see
  /// the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on
  /// the IANA website.
  ///
  /// Parameter [startDate] :
  /// The date and time, in ISO-8601 Extended format, for when you want the
  /// maintenance window to become active. StartDate allows you to delay
  /// activation of the maintenance window until the specified future date.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. Tags enable you to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag a maintenance window to
  /// identify the type of tasks it will run, the types of targets, and the
  /// environment it will run in. In this case, you could specify the following
  /// key name/value pairs:
  ///
  /// <ul>
  /// <li>
  /// <code>Key=TaskType,Value=AgentUpdate</code>
  /// </li>
  /// <li>
  /// <code>Key=OS,Value=Windows</code>
  /// </li>
  /// <li>
  /// <code>Key=Environment,Value=Production</code>
  /// </li>
  /// </ul> <note>
  /// To add tags to an existing maintenance window, use the
  /// <a>AddTagsToResource</a> action.
  /// </note>
  Future<CreateMaintenanceWindowResult> createMaintenanceWindow({
    @_s.required bool allowUnassociatedTargets,
    @_s.required int cutoff,
    @_s.required int duration,
    @_s.required String name,
    @_s.required String schedule,
    String clientToken,
    String description,
    String endDate,
    int scheduleOffset,
    String scheduleTimezone,
    String startDate,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        allowUnassociatedTargets, 'allowUnassociatedTargets');
    ArgumentError.checkNotNull(cutoff, 'cutoff');
    _s.validateNumRange(
      'cutoff',
      cutoff,
      0,
      23,
      isRequired: true,
    );
    ArgumentError.checkNotNull(duration, 'duration');
    _s.validateNumRange(
      'duration',
      duration,
      1,
      24,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schedule, 'schedule');
    _s.validateStringLength(
      'schedule',
      schedule,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    _s.validateNumRange(
      'scheduleOffset',
      scheduleOffset,
      1,
      6,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AllowUnassociatedTargets': allowUnassociatedTargets,
        'Cutoff': cutoff,
        'Duration': duration,
        'Name': name,
        'Schedule': schedule,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (endDate != null) 'EndDate': endDate,
        if (scheduleOffset != null) 'ScheduleOffset': scheduleOffset,
        if (scheduleTimezone != null) 'ScheduleTimezone': scheduleTimezone,
        if (startDate != null) 'StartDate': startDate,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateMaintenanceWindowResult.fromJson(jsonResponse.body);
  }

  /// Creates a new OpsItem. You must have permission in AWS Identity and Access
  /// Management (IAM) to create a new OpsItem. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting
  /// started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS
  /// Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [OpsItemAlreadyExistsException].
  /// May throw [OpsItemLimitExceededException].
  /// May throw [OpsItemInvalidParameterException].
  ///
  /// Parameter [description] :
  /// Information about the OpsItem.
  ///
  /// Parameter [source] :
  /// The origin of the OpsItem, such as Amazon EC2 or Systems Manager.
  /// <note>
  /// The source name can't contain the following strings: aws, amazon, and
  /// amzn.
  /// </note>
  ///
  /// Parameter [title] :
  /// A short heading that describes the nature of the OpsItem and the impacted
  /// resource.
  ///
  /// Parameter [actualEndTime] :
  /// The time a runbook workflow ended. Currently reported only for the OpsItem
  /// type <code>/aws/changerequest</code>.
  ///
  /// Parameter [actualStartTime] :
  /// The time a runbook workflow started. Currently reported only for the
  /// OpsItem type <code>/aws/changerequest</code>.
  ///
  /// Parameter [category] :
  /// Specify a category to assign to an OpsItem.
  ///
  /// Parameter [notifications] :
  /// The Amazon Resource Name (ARN) of an SNS topic where notifications are
  /// sent when this OpsItem is edited or changed.
  ///
  /// Parameter [operationalData] :
  /// Operational data is custom data that provides useful reference details
  /// about the OpsItem. For example, you can specify log files, error strings,
  /// license keys, troubleshooting tips, or other relevant data. You enter
  /// operational data as key-value pairs. The key has a maximum length of 128
  /// characters. The value has a maximum size of 20 KB.
  /// <important>
  /// Operational data keys <i>can't</i> begin with the following: amazon, aws,
  /// amzn, ssm, /amazon, /aws, /amzn, /ssm.
  /// </important>
  /// You can choose to make the data searchable by other users in the account
  /// or you can restrict search access. Searchable data means that all users
  /// with access to the OpsItem Overview page (as provided by the
  /// <a>DescribeOpsItems</a> API action) can view and search on the specified
  /// data. Operational data that is not searchable is only viewable by users
  /// who have access to the OpsItem (as provided by the <a>GetOpsItem</a> API
  /// action).
  ///
  /// Use the <code>/aws/resources</code> key in OperationalData to specify a
  /// related resource in the request. Use the <code>/aws/automations</code> key
  /// in OperationalData to associate an Automation runbook with the OpsItem. To
  /// view AWS CLI example commands that use these keys, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems">Creating
  /// OpsItems manually</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [opsItemType] :
  /// The type of OpsItem to create. Currently, the only valid values are
  /// <code>/aws/changerequest</code> and <code>/aws/issue</code>.
  ///
  /// Parameter [plannedEndTime] :
  /// The time specified in a change request for a runbook workflow to end.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  ///
  /// Parameter [plannedStartTime] :
  /// The time specified in a change request for a runbook workflow to start.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  ///
  /// Parameter [priority] :
  /// The importance of this OpsItem in relation to other OpsItems in the
  /// system.
  ///
  /// Parameter [relatedOpsItems] :
  /// One or more OpsItems that share something in common with the current
  /// OpsItems. For example, related OpsItems can include OpsItems with similar
  /// error messages, impacted resources, or statuses for the impacted resource.
  ///
  /// Parameter [severity] :
  /// Specify a severity to assign to an OpsItem.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. You can restrict access
  /// to OpsItems by using an inline IAM policy that specifies tags. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html#OpsCenter-getting-started-user-permissions">Getting
  /// started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Tags use a key-value pair. For example:
  ///
  /// <code>Key=Department,Value=Finance</code>
  /// <note>
  /// To add tags to an existing OpsItem, use the <a>AddTagsToResource</a>
  /// action.
  /// </note>
  Future<CreateOpsItemResponse> createOpsItem({
    @_s.required String description,
    @_s.required String source,
    @_s.required String title,
    DateTime actualEndTime,
    DateTime actualStartTime,
    String category,
    List<OpsItemNotification> notifications,
    Map<String, OpsItemDataValue> operationalData,
    String opsItemType,
    DateTime plannedEndTime,
    DateTime plannedStartTime,
    int priority,
    List<RelatedOpsItem> relatedOpsItems,
    String severity,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\s\S]*\S[\s\S]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(source, 'source');
    _s.validateStringLength(
      'source',
      source,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'source',
      source,
      r'''^(?!\s*$).+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(title, 'title');
    _s.validateStringLength(
      'title',
      title,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'title',
      title,
      r'''^(?!\s*$).+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'category',
      category,
      1,
      64,
    );
    _s.validateStringPattern(
      'category',
      category,
      r'''^(?!\s*$).+''',
    );
    _s.validateNumRange(
      'priority',
      priority,
      1,
      5,
    );
    _s.validateStringLength(
      'severity',
      severity,
      1,
      64,
    );
    _s.validateStringPattern(
      'severity',
      severity,
      r'''^(?!\s*$).+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateOpsItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'Source': source,
        'Title': title,
        if (actualEndTime != null)
          'ActualEndTime': unixTimestampToJson(actualEndTime),
        if (actualStartTime != null)
          'ActualStartTime': unixTimestampToJson(actualStartTime),
        if (category != null) 'Category': category,
        if (notifications != null) 'Notifications': notifications,
        if (operationalData != null) 'OperationalData': operationalData,
        if (opsItemType != null) 'OpsItemType': opsItemType,
        if (plannedEndTime != null)
          'PlannedEndTime': unixTimestampToJson(plannedEndTime),
        if (plannedStartTime != null)
          'PlannedStartTime': unixTimestampToJson(plannedStartTime),
        if (priority != null) 'Priority': priority,
        if (relatedOpsItems != null) 'RelatedOpsItems': relatedOpsItems,
        if (severity != null) 'Severity': severity,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateOpsItemResponse.fromJson(jsonResponse.body);
  }

  /// If you create a new application in Application Manager, Systems Manager
  /// calls this API action to specify information about the new application,
  /// including the application type.
  ///
  /// May throw [OpsMetadataAlreadyExistsException].
  /// May throw [OpsMetadataTooManyUpdatesException].
  /// May throw [OpsMetadataInvalidArgumentException].
  /// May throw [OpsMetadataLimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceId] :
  /// A resource ID for a new Application Manager application.
  ///
  /// Parameter [metadata] :
  /// Metadata for a new Application Manager application.
  Future<CreateOpsMetadataResult> createOpsMetadata({
    @_s.required String resourceId,
    Map<String, MetadataValue> metadata,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^(?!\s*$).+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateOpsMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (metadata != null) 'Metadata': metadata,
      },
    );

    return CreateOpsMetadataResult.fromJson(jsonResponse.body);
  }

  /// Creates a patch baseline.
  /// <note>
  /// For information about valid key and value pairs in
  /// <code>PatchFilters</code> for each supported operating system type, see <a
  /// href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.
  /// </note>
  ///
  /// May throw [IdempotentParameterMismatch].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [name] :
  /// The name of the patch baseline.
  ///
  /// Parameter [approvalRules] :
  /// A set of rules used to include patches in the baseline.
  ///
  /// Parameter [approvedPatches] :
  /// A list of explicitly approved patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About
  /// package name formats for approved and rejected patch lists</a> in the
  /// <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [approvedPatchesComplianceLevel] :
  /// Defines the compliance level for approved patches. This means that if an
  /// approved patch is reported as missing, this is the severity of the
  /// compliance violation. The default value is UNSPECIFIED.
  ///
  /// Parameter [approvedPatchesEnableNonSecurity] :
  /// Indicates whether the list of approved patches includes non-security
  /// updates that should be applied to the instances. The default value is
  /// 'false'. Applies to Linux instances only.
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token.
  ///
  /// Parameter [description] :
  /// A description of the patch baseline.
  ///
  /// Parameter [globalFilters] :
  /// A set of global filters used to include patches in the baseline.
  ///
  /// Parameter [operatingSystem] :
  /// Defines the operating system the patch baseline applies to. The Default
  /// value is WINDOWS.
  ///
  /// Parameter [rejectedPatches] :
  /// A list of explicitly rejected patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About
  /// package name formats for approved and rejected patch lists</a> in the
  /// <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [rejectedPatchesAction] :
  /// The action for Patch Manager to take on patches included in the
  /// RejectedPackages list.
  ///
  /// <ul>
  /// <li>
  /// <b>ALLOW_AS_DEPENDENCY</b>: A package in the Rejected patches list is
  /// installed only if it is a dependency of another package. It is considered
  /// compliant with the patch baseline, and its status is reported as
  /// <i>InstalledOther</i>. This is the default action if no option is
  /// specified.
  /// </li>
  /// <li>
  /// <b>BLOCK</b>: Packages in the RejectedPatches list, and packages that
  /// include them as dependencies, are not installed under any circumstances.
  /// If a package was installed before it was added to the Rejected patches
  /// list, it is considered non-compliant with the patch baseline, and its
  /// status is reported as <i>InstalledRejected</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sources] :
  /// Information about the patches to use to update the instances, including
  /// target operating systems and source repositories. Applies to Linux
  /// instances only.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. Tags enable you to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag a patch baseline to
  /// identify the severity level of patches it specifies and the operating
  /// system family it applies to. In this case, you could specify the following
  /// key name/value pairs:
  ///
  /// <ul>
  /// <li>
  /// <code>Key=PatchSeverity,Value=Critical</code>
  /// </li>
  /// <li>
  /// <code>Key=OS,Value=Windows</code>
  /// </li>
  /// </ul> <note>
  /// To add tags to an existing patch baseline, use the
  /// <a>AddTagsToResource</a> action.
  /// </note>
  Future<CreatePatchBaselineResult> createPatchBaseline({
    @_s.required String name,
    PatchRuleGroup approvalRules,
    List<String> approvedPatches,
    PatchComplianceLevel approvedPatchesComplianceLevel,
    bool approvedPatchesEnableNonSecurity,
    String clientToken,
    String description,
    PatchFilterGroup globalFilters,
    OperatingSystem operatingSystem,
    List<String> rejectedPatches,
    PatchAction rejectedPatchesAction,
    List<PatchSource> sources,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreatePatchBaseline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (approvalRules != null) 'ApprovalRules': approvalRules,
        if (approvedPatches != null) 'ApprovedPatches': approvedPatches,
        if (approvedPatchesComplianceLevel != null)
          'ApprovedPatchesComplianceLevel':
              approvedPatchesComplianceLevel.toValue(),
        if (approvedPatchesEnableNonSecurity != null)
          'ApprovedPatchesEnableNonSecurity': approvedPatchesEnableNonSecurity,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (globalFilters != null) 'GlobalFilters': globalFilters,
        if (operatingSystem != null)
          'OperatingSystem': operatingSystem.toValue(),
        if (rejectedPatches != null) 'RejectedPatches': rejectedPatches,
        if (rejectedPatchesAction != null)
          'RejectedPatchesAction': rejectedPatchesAction.toValue(),
        if (sources != null) 'Sources': sources,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePatchBaselineResult.fromJson(jsonResponse.body);
  }

  /// A resource data sync helps you view data from multiple sources in a single
  /// location. Systems Manager offers two types of resource data sync:
  /// <code>SyncToDestination</code> and <code>SyncFromSource</code>.
  ///
  /// You can configure Systems Manager Inventory to use the
  /// <code>SyncToDestination</code> type to synchronize Inventory data from
  /// multiple AWS Regions to a single S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring
  /// Resource Data Sync for Inventory</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// You can configure Systems Manager Explorer to use the
  /// <code>SyncFromSource</code> type to synchronize operational work items
  /// (OpsItems) and operational data (OpsData) from multiple AWS Regions to a
  /// single S3 bucket. This type can synchronize OpsItems and OpsData from
  /// multiple AWS accounts and Regions or <code>EntireOrganization</code> by
  /// using AWS Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting
  /// up Systems Manager Explorer to display data from multiple accounts and
  /// Regions</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// A resource data sync is an asynchronous operation that returns
  /// immediately. After a successful initial sync is completed, the system
  /// continuously syncs data. To check the status of a sync, use the
  /// <a>ListResourceDataSync</a>.
  /// <note>
  /// By default, data is not encrypted in Amazon S3. We strongly recommend that
  /// you enable encryption in Amazon S3 to ensure secure data storage. We also
  /// recommend that you secure access to the Amazon S3 bucket by creating a
  /// restrictive bucket policy.
  /// </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [ResourceDataSyncCountExceededException].
  /// May throw [ResourceDataSyncAlreadyExistsException].
  /// May throw [ResourceDataSyncInvalidConfigurationException].
  ///
  /// Parameter [syncName] :
  /// A name for the configuration.
  ///
  /// Parameter [s3Destination] :
  /// Amazon S3 configuration details for the sync. This parameter is required
  /// if the <code>SyncType</code> value is SyncToDestination.
  ///
  /// Parameter [syncSource] :
  /// Specify information about the data sources to synchronize. This parameter
  /// is required if the <code>SyncType</code> value is SyncFromSource.
  ///
  /// Parameter [syncType] :
  /// Specify <code>SyncToDestination</code> to create a resource data sync that
  /// synchronizes data to an S3 bucket for Inventory. If you specify
  /// <code>SyncToDestination</code>, you must provide a value for
  /// <code>S3Destination</code>. Specify <code>SyncFromSource</code> to
  /// synchronize data from a single account and multiple Regions, or multiple
  /// AWS accounts and Regions, as listed in AWS Organizations for Explorer. If
  /// you specify <code>SyncFromSource</code>, you must provide a value for
  /// <code>SyncSource</code>. The default value is
  /// <code>SyncToDestination</code>.
  Future<void> createResourceDataSync({
    @_s.required String syncName,
    ResourceDataSyncS3Destination s3Destination,
    ResourceDataSyncSource syncSource,
    String syncType,
  }) async {
    ArgumentError.checkNotNull(syncName, 'syncName');
    _s.validateStringLength(
      'syncName',
      syncName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'syncType',
      syncType,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.CreateResourceDataSync'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SyncName': syncName,
        if (s3Destination != null) 'S3Destination': s3Destination,
        if (syncSource != null) 'SyncSource': syncSource,
        if (syncType != null) 'SyncType': syncType,
      },
    );

    return CreateResourceDataSyncResult.fromJson(jsonResponse.body);
  }

  /// Deletes an activation. You are not required to delete an activation. If
  /// you delete an activation, you can no longer use it to register additional
  /// managed instances. Deleting an activation does not de-register managed
  /// instances. You must manually de-register managed instances.
  ///
  /// May throw [InvalidActivationId].
  /// May throw [InvalidActivation].
  /// May throw [InternalServerError].
  /// May throw [TooManyUpdates].
  ///
  /// Parameter [activationId] :
  /// The ID of the activation that you want to delete.
  Future<void> deleteActivation({
    @_s.required String activationId,
  }) async {
    ArgumentError.checkNotNull(activationId, 'activationId');
    _s.validateStringPattern(
      'activationId',
      activationId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteActivation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ActivationId': activationId,
      },
    );

    return DeleteActivationResult.fromJson(jsonResponse.body);
  }

  /// Disassociates the specified Systems Manager document from the specified
  /// instance.
  ///
  /// When you disassociate a document from an instance, it does not change the
  /// configuration of the instance. To change the configuration state of an
  /// instance after you disassociate a document, you must create a new document
  /// with the desired configuration and associate it with the instance.
  ///
  /// May throw [AssociationDoesNotExist].
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidInstanceId].
  /// May throw [TooManyUpdates].
  ///
  /// Parameter [associationId] :
  /// The association ID that you want to delete.
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance.
  ///
  /// Parameter [name] :
  /// The name of the Systems Manager document.
  Future<void> deleteAssociation({
    String associationId,
    String instanceId,
    String name,
  }) async {
    _s.validateStringPattern(
      'associationId',
      associationId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (associationId != null) 'AssociationId': associationId,
        if (instanceId != null) 'InstanceId': instanceId,
        if (name != null) 'Name': name,
      },
    );

    return DeleteAssociationResult.fromJson(jsonResponse.body);
  }

  /// Deletes the Systems Manager document and all instance associations to the
  /// document.
  ///
  /// Before you delete the document, we recommend that you use
  /// <a>DeleteAssociation</a> to disassociate all instances that are associated
  /// with the document.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentOperation].
  /// May throw [AssociatedInstances].
  ///
  /// Parameter [name] :
  /// The name of the document.
  ///
  /// Parameter [documentVersion] :
  /// The version of the document that you want to delete. If not provided, all
  /// versions of the document are deleted.
  ///
  /// Parameter [force] :
  /// Some SSM document types require that you specify a <code>Force</code> flag
  /// before you can delete the document. For example, you must specify a
  /// <code>Force</code> flag to delete a document of type
  /// <code>ApplicationConfigurationSchema</code>. You can restrict access to
  /// the <code>Force</code> flag in an AWS Identity and Access Management (IAM)
  /// policy.
  ///
  /// Parameter [versionName] :
  /// The version name of the document that you want to delete. If not provided,
  /// all versions of the document are deleted.
  Future<void> deleteDocument({
    @_s.required String name,
    String documentVersion,
    bool force,
    String versionName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringPattern(
      'versionName',
      versionName,
      r'''^[a-zA-Z0-9_\-.]{1,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (force != null) 'Force': force,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return DeleteDocumentResult.fromJson(jsonResponse.body);
  }

  /// Delete a custom inventory type or the data associated with a custom
  /// Inventory type. Deleting a custom inventory type is also referred to as
  /// deleting a custom inventory schema.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidTypeNameException].
  /// May throw [InvalidOptionException].
  /// May throw [InvalidDeleteInventoryParametersException].
  /// May throw [InvalidInventoryRequestException].
  ///
  /// Parameter [typeName] :
  /// The name of the custom inventory type for which you want to delete either
  /// all previously collected data or the inventory type itself.
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token.
  ///
  /// Parameter [dryRun] :
  /// Use this option to view a summary of the deletion request without deleting
  /// any data or the data type. This option is useful when you only want to
  /// understand what will be deleted. Once you validate that the data to be
  /// deleted is what you intend to delete, you can run the same command without
  /// specifying the <code>DryRun</code> option.
  ///
  /// Parameter [schemaDeleteOption] :
  /// Use the <code>SchemaDeleteOption</code> to delete a custom inventory type
  /// (schema). If you don't choose this option, the system only deletes
  /// existing inventory data associated with the custom inventory type. Choose
  /// one of the following options:
  ///
  /// DisableSchema: If you choose this option, the system ignores all inventory
  /// data for the specified version, and any earlier versions. To enable this
  /// schema again, you must call the <code>PutInventory</code> action for a
  /// version greater than the disabled version.
  ///
  /// DeleteSchema: This option deletes the specified custom type from the
  /// Inventory service. You can recreate the schema later, if you want.
  Future<DeleteInventoryResult> deleteInventory({
    @_s.required String typeName,
    String clientToken,
    bool dryRun,
    InventorySchemaDeleteOption schemaDeleteOption,
  }) async {
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''^(AWS|Custom):.*$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteInventory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TypeName': typeName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dryRun != null) 'DryRun': dryRun,
        if (schemaDeleteOption != null)
          'SchemaDeleteOption': schemaDeleteOption.toValue(),
      },
    );

    return DeleteInventoryResult.fromJson(jsonResponse.body);
  }

  /// Deletes a maintenance window.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window to delete.
  Future<DeleteMaintenanceWindowResult> deleteMaintenanceWindow({
    @_s.required String windowId,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
      },
    );

    return DeleteMaintenanceWindowResult.fromJson(jsonResponse.body);
  }

  /// Delete OpsMetadata related to an application.
  ///
  /// May throw [OpsMetadataNotFoundException].
  /// May throw [OpsMetadataInvalidArgumentException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [opsMetadataArn] :
  /// The Amazon Resource Name (ARN) of an OpsMetadata Object to delete.
  Future<void> deleteOpsMetadata({
    @_s.required String opsMetadataArn,
  }) async {
    ArgumentError.checkNotNull(opsMetadataArn, 'opsMetadataArn');
    _s.validateStringLength(
      'opsMetadataArn',
      opsMetadataArn,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'opsMetadataArn',
      opsMetadataArn,
      r'''arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:opsmetadata\/([a-zA-Z0-9-_\.\/]*)''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteOpsMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OpsMetadataArn': opsMetadataArn,
      },
    );

    return DeleteOpsMetadataResult.fromJson(jsonResponse.body);
  }

  /// Delete a parameter from the system.
  ///
  /// May throw [InternalServerError].
  /// May throw [ParameterNotFound].
  ///
  /// Parameter [name] :
  /// The name of the parameter to delete.
  Future<void> deleteParameter({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteParameter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DeleteParameterResult.fromJson(jsonResponse.body);
  }

  /// Delete a list of parameters.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [names] :
  /// The names of the parameters to delete.
  Future<DeleteParametersResult> deleteParameters({
    @_s.required List<String> names,
  }) async {
    ArgumentError.checkNotNull(names, 'names');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Names': names,
      },
    );

    return DeleteParametersResult.fromJson(jsonResponse.body);
  }

  /// Deletes a patch baseline.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [baselineId] :
  /// The ID of the patch baseline to delete.
  Future<DeletePatchBaselineResult> deletePatchBaseline({
    @_s.required String baselineId,
  }) async {
    ArgumentError.checkNotNull(baselineId, 'baselineId');
    _s.validateStringLength(
      'baselineId',
      baselineId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baselineId',
      baselineId,
      r'''^[a-zA-Z0-9_\-:/]{20,128}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeletePatchBaseline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaselineId': baselineId,
      },
    );

    return DeletePatchBaselineResult.fromJson(jsonResponse.body);
  }

  /// Deletes a Resource Data Sync configuration. After the configuration is
  /// deleted, changes to data on managed instances are no longer synced to or
  /// from the target. Deleting a sync configuration does not delete data.
  ///
  /// May throw [InternalServerError].
  /// May throw [ResourceDataSyncNotFoundException].
  /// May throw [ResourceDataSyncInvalidConfigurationException].
  ///
  /// Parameter [syncName] :
  /// The name of the configuration to delete.
  ///
  /// Parameter [syncType] :
  /// Specify the type of resource data sync to delete.
  Future<void> deleteResourceDataSync({
    @_s.required String syncName,
    String syncType,
  }) async {
    ArgumentError.checkNotNull(syncName, 'syncName');
    _s.validateStringLength(
      'syncName',
      syncName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'syncType',
      syncType,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeleteResourceDataSync'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SyncName': syncName,
        if (syncType != null) 'SyncType': syncType,
      },
    );

    return DeleteResourceDataSyncResult.fromJson(jsonResponse.body);
  }

  /// Removes the server or virtual machine from the list of registered servers.
  /// You can reregister the instance again at any time. If you don't plan to
  /// use Run Command on the server, we suggest uninstalling SSM Agent first.
  ///
  /// May throw [InvalidInstanceId].
  /// May throw [InternalServerError].
  ///
  /// Parameter [instanceId] :
  /// The ID assigned to the managed instance when you registered it using the
  /// activation process.
  Future<void> deregisterManagedInstance({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''^mi-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeregisterManagedInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
      },
    );

    return DeregisterManagedInstanceResult.fromJson(jsonResponse.body);
  }

  /// Removes a patch group from a patch baseline.
  ///
  /// May throw [InvalidResourceId].
  /// May throw [InternalServerError].
  ///
  /// Parameter [baselineId] :
  /// The ID of the patch baseline to deregister the patch group from.
  ///
  /// Parameter [patchGroup] :
  /// The name of the patch group that should be deregistered from the patch
  /// baseline.
  Future<DeregisterPatchBaselineForPatchGroupResult>
      deregisterPatchBaselineForPatchGroup({
    @_s.required String baselineId,
    @_s.required String patchGroup,
  }) async {
    ArgumentError.checkNotNull(baselineId, 'baselineId');
    _s.validateStringLength(
      'baselineId',
      baselineId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baselineId',
      baselineId,
      r'''^[a-zA-Z0-9_\-:/]{20,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(patchGroup, 'patchGroup');
    _s.validateStringLength(
      'patchGroup',
      patchGroup,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patchGroup',
      patchGroup,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeregisterPatchBaselineForPatchGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaselineId': baselineId,
        'PatchGroup': patchGroup,
      },
    );

    return DeregisterPatchBaselineForPatchGroupResult.fromJson(
        jsonResponse.body);
  }

  /// Removes a target from a maintenance window.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  /// May throw [TargetInUseException].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window the target should be removed from.
  ///
  /// Parameter [windowTargetId] :
  /// The ID of the target definition to remove.
  ///
  /// Parameter [safe] :
  /// The system checks if the target is being referenced by a task. If the
  /// target is being referenced, the system returns an error and does not
  /// deregister the target from the maintenance window.
  Future<DeregisterTargetFromMaintenanceWindowResult>
      deregisterTargetFromMaintenanceWindow({
    @_s.required String windowId,
    @_s.required String windowTargetId,
    bool safe,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowTargetId, 'windowTargetId');
    _s.validateStringLength(
      'windowTargetId',
      windowTargetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowTargetId',
      windowTargetId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeregisterTargetFromMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        'WindowTargetId': windowTargetId,
        if (safe != null) 'Safe': safe,
      },
    );

    return DeregisterTargetFromMaintenanceWindowResult.fromJson(
        jsonResponse.body);
  }

  /// Removes a task from a maintenance window.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window the task should be removed from.
  ///
  /// Parameter [windowTaskId] :
  /// The ID of the task to remove from the maintenance window.
  Future<DeregisterTaskFromMaintenanceWindowResult>
      deregisterTaskFromMaintenanceWindow({
    @_s.required String windowId,
    @_s.required String windowTaskId,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowTaskId, 'windowTaskId');
    _s.validateStringLength(
      'windowTaskId',
      windowTaskId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowTaskId',
      windowTaskId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DeregisterTaskFromMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        'WindowTaskId': windowTaskId,
      },
    );

    return DeregisterTaskFromMaintenanceWindowResult.fromJson(
        jsonResponse.body);
  }

  /// Describes details about the activation, such as the date and time the
  /// activation was created, its expiration date, the IAM role assigned to the
  /// instances in the activation, and the number of instances registered by
  /// using this activation.
  ///
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// A filter to view information about your activations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<DescribeActivationsResult> describeActivations({
    List<DescribeActivationsFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeActivations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeActivationsResult.fromJson(jsonResponse.body);
  }

  /// Describes the association for the specified target or instance. If you
  /// created the association by using the <code>Targets</code> parameter, then
  /// you must retrieve the association by using the association ID. If you
  /// created the association by specifying an instance ID and a Systems Manager
  /// document, then you retrieve the association by specifying the document
  /// name and the instance ID.
  ///
  /// May throw [AssociationDoesNotExist].
  /// May throw [InvalidAssociationVersion].
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidInstanceId].
  ///
  /// Parameter [associationId] :
  /// The association ID for which you want information.
  ///
  /// Parameter [associationVersion] :
  /// Specify the association version to retrieve. To view the latest version,
  /// either specify <code>$LATEST</code> for this parameter, or omit this
  /// parameter. To view a list of all associations for an instance, use
  /// <a>ListAssociations</a>. To get a list of versions for a specific
  /// association, use <a>ListAssociationVersions</a>.
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  ///
  /// Parameter [name] :
  /// The name of the Systems Manager document.
  Future<DescribeAssociationResult> describeAssociation({
    String associationId,
    String associationVersion,
    String instanceId,
    String name,
  }) async {
    _s.validateStringPattern(
      'associationId',
      associationId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
    );
    _s.validateStringPattern(
      'associationVersion',
      associationVersion,
      r'''([$]LATEST)|([1-9][0-9]*)''',
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (associationId != null) 'AssociationId': associationId,
        if (associationVersion != null)
          'AssociationVersion': associationVersion,
        if (instanceId != null) 'InstanceId': instanceId,
        if (name != null) 'Name': name,
      },
    );

    return DescribeAssociationResult.fromJson(jsonResponse.body);
  }

  /// Use this API action to view information about a specific execution of a
  /// specific association.
  ///
  /// May throw [InternalServerError].
  /// May throw [AssociationDoesNotExist].
  /// May throw [InvalidNextToken].
  /// May throw [AssociationExecutionDoesNotExist].
  ///
  /// Parameter [associationId] :
  /// The association ID that includes the execution for which you want to view
  /// details.
  ///
  /// Parameter [executionId] :
  /// The execution ID for which you want to view details.
  ///
  /// Parameter [filters] :
  /// Filters for the request. You can specify the following filters and values.
  ///
  /// Status (EQUAL)
  ///
  /// ResourceId (EQUAL)
  ///
  /// ResourceType (EQUAL)
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<DescribeAssociationExecutionTargetsResult>
      describeAssociationExecutionTargets({
    @_s.required String associationId,
    @_s.required String executionId,
    List<AssociationExecutionTargetsFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringPattern(
      'associationId',
      associationId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(executionId, 'executionId');
    _s.validateStringPattern(
      'executionId',
      executionId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeAssociationExecutionTargets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationId': associationId,
        'ExecutionId': executionId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAssociationExecutionTargetsResult.fromJson(
        jsonResponse.body);
  }

  /// Use this API action to view all executions for a specific association ID.
  ///
  /// May throw [InternalServerError].
  /// May throw [AssociationDoesNotExist].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [associationId] :
  /// The association ID for which you want to view execution history details.
  ///
  /// Parameter [filters] :
  /// Filters for the request. You can specify the following filters and values.
  ///
  /// ExecutionId (EQUAL)
  ///
  /// Status (EQUAL)
  ///
  /// CreatedTime (EQUAL, GREATER_THAN, LESS_THAN)
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<DescribeAssociationExecutionsResult> describeAssociationExecutions({
    @_s.required String associationId,
    List<AssociationExecutionFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringPattern(
      'associationId',
      associationId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeAssociationExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationId': associationId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAssociationExecutionsResult.fromJson(jsonResponse.body);
  }

  /// Provides details about all active and terminated Automation executions.
  ///
  /// May throw [InvalidFilterKey].
  /// May throw [InvalidFilterValue].
  /// May throw [InvalidNextToken].
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// Filters used to limit the scope of executions that are requested.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeAutomationExecutionsResult> describeAutomationExecutions({
    List<AutomationExecutionFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeAutomationExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAutomationExecutionsResult.fromJson(jsonResponse.body);
  }

  /// Information about all active and terminated step executions in an
  /// Automation workflow.
  ///
  /// May throw [AutomationExecutionNotFoundException].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidFilterKey].
  /// May throw [InvalidFilterValue].
  /// May throw [InternalServerError].
  ///
  /// Parameter [automationExecutionId] :
  /// The Automation execution ID for which you want step execution
  /// descriptions.
  ///
  /// Parameter [filters] :
  /// One or more filters to limit the number of step executions returned by the
  /// request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [reverseOrder] :
  /// A boolean that indicates whether to list step executions in reverse order
  /// by start time. The default value is false.
  Future<DescribeAutomationStepExecutionsResult>
      describeAutomationStepExecutions({
    @_s.required String automationExecutionId,
    List<StepExecutionFilter> filters,
    int maxResults,
    String nextToken,
    bool reverseOrder,
  }) async {
    ArgumentError.checkNotNull(automationExecutionId, 'automationExecutionId');
    _s.validateStringLength(
      'automationExecutionId',
      automationExecutionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeAutomationStepExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutomationExecutionId': automationExecutionId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (reverseOrder != null) 'ReverseOrder': reverseOrder,
      },
    );

    return DescribeAutomationStepExecutionsResult.fromJson(jsonResponse.body);
  }

  /// Lists all patches eligible to be included in a patch baseline.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// Filters used to scope down the returned patches.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of patches to return (per page).
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeAvailablePatchesResult> describeAvailablePatches({
    List<PatchOrchestratorFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeAvailablePatches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAvailablePatchesResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified Systems Manager document.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentVersion].
  ///
  /// Parameter [name] :
  /// The name of the Systems Manager document.
  ///
  /// Parameter [documentVersion] :
  /// The document version for which you want information. Can be a specific
  /// version or the default version.
  ///
  /// Parameter [versionName] :
  /// An optional field specifying the version of the artifact associated with
  /// the document. For example, "Release 12, Update 6". This value is unique
  /// across all versions of a document, and cannot be changed.
  Future<DescribeDocumentResult> describeDocument({
    @_s.required String name,
    String documentVersion,
    String versionName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringPattern(
      'versionName',
      versionName,
      r'''^[a-zA-Z0-9_\-.]{1,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return DescribeDocumentResult.fromJson(jsonResponse.body);
  }

  /// Describes the permissions for a Systems Manager document. If you created
  /// the document, you are the owner. If a document is shared, it can either be
  /// shared privately (by specifying a user's AWS account ID) or publicly
  /// (<i>All</i>).
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidPermissionType].
  ///
  /// Parameter [name] :
  /// The name of the document for which you are the owner.
  ///
  /// Parameter [permissionType] :
  /// The permission type for the document. The permission type can be
  /// <i>Share</i>.
  Future<DescribeDocumentPermissionResponse> describeDocumentPermission({
    @_s.required String name,
    @_s.required DocumentPermissionType permissionType,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionType, 'permissionType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeDocumentPermission'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'PermissionType': permissionType?.toValue() ?? '',
      },
    );

    return DescribeDocumentPermissionResponse.fromJson(jsonResponse.body);
  }

  /// All associations for the instance(s).
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [instanceId] :
  /// The instance ID for which you want to view all associations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeEffectiveInstanceAssociationsResult>
      describeEffectiveInstanceAssociations({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeEffectiveInstanceAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeEffectiveInstanceAssociationsResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the current effective patches (the patch and the approval state)
  /// for the specified patch baseline. Note that this API applies only to
  /// Windows patch baselines.
  ///
  /// May throw [InvalidResourceId].
  /// May throw [DoesNotExistException].
  /// May throw [UnsupportedOperatingSystem].
  /// May throw [InternalServerError].
  ///
  /// Parameter [baselineId] :
  /// The ID of the patch baseline to retrieve the effective patches for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of patches to return (per page).
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeEffectivePatchesForPatchBaselineResult>
      describeEffectivePatchesForPatchBaseline({
    @_s.required String baselineId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(baselineId, 'baselineId');
    _s.validateStringLength(
      'baselineId',
      baselineId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baselineId',
      baselineId,
      r'''^[a-zA-Z0-9_\-:/]{20,128}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeEffectivePatchesForPatchBaseline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaselineId': baselineId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeEffectivePatchesForPatchBaselineResult.fromJson(
        jsonResponse.body);
  }

  /// The status of the associations for the instance(s).
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [instanceId] :
  /// The instance IDs for which you want association status information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeInstanceAssociationsStatusResult>
      describeInstanceAssociationsStatus({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeInstanceAssociationsStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeInstanceAssociationsStatusResult.fromJson(jsonResponse.body);
  }

  /// Describes one or more of your instances, including information about the
  /// operating system platform, the version of SSM Agent installed on the
  /// instance, instance status, and so on.
  ///
  /// If you specify one or more instance IDs, it returns information for those
  /// instances. If you do not specify instance IDs, it returns information for
  /// all your instances. If you specify an instance ID that is not valid or an
  /// instance that you do not own, you receive an error.
  /// <note>
  /// The IamRole field for this API action is the Amazon Identity and Access
  /// Management (IAM) role assigned to on-premises instances. This call does
  /// not return the IAM role for EC2 instances.
  /// </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidInstanceInformationFilterValue].
  /// May throw [InvalidFilterKey].
  ///
  /// Parameter [filters] :
  /// One or more filters. Use a filter to return a more specific list of
  /// instances. You can filter based on tags applied to EC2 instances. Use this
  /// <code>Filters</code> data type instead of
  /// <code>InstanceInformationFilterList</code>, which is deprecated.
  ///
  /// Parameter [instanceInformationFilterList] :
  /// This is a legacy method. We recommend that you don't use this method.
  /// Instead, use the <code>Filters</code> data type. <code>Filters</code>
  /// enables you to return instance information by filtering based on tags
  /// applied to managed instances.
  /// <note>
  /// Attempting to use <code>InstanceInformationFilterList</code> and
  /// <code>Filters</code> leads to an exception error.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeInstanceInformationResult> describeInstanceInformation({
    List<InstanceInformationStringFilter> filters,
    List<InstanceInformationFilter> instanceInformationFilterList,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeInstanceInformation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (instanceInformationFilterList != null)
          'InstanceInformationFilterList': instanceInformationFilterList,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeInstanceInformationResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the high-level patch state of one or more instances.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [instanceIds] :
  /// The ID of the instance whose patch state information should be retrieved.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instances to return (per page).
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeInstancePatchStatesResult> describeInstancePatchStates({
    @_s.required List<String> instanceIds,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceIds, 'instanceIds');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeInstancePatchStates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceIds': instanceIds,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeInstancePatchStatesResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the high-level patch state for the instances in the specified
  /// patch group.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [patchGroup] :
  /// The name of the patch group for which the patch state information should
  /// be retrieved.
  ///
  /// Parameter [filters] :
  /// Each entry in the array is a structure containing:
  ///
  /// Key (string between 1 and 200 characters)
  ///
  /// Values (array containing a single string)
  ///
  /// Type (string "Equal", "NotEqual", "LessThan", "GreaterThan")
  ///
  /// Parameter [maxResults] :
  /// The maximum number of patches to return (per page).
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeInstancePatchStatesForPatchGroupResult>
      describeInstancePatchStatesForPatchGroup({
    @_s.required String patchGroup,
    List<InstancePatchStateFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(patchGroup, 'patchGroup');
    _s.validateStringLength(
      'patchGroup',
      patchGroup,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patchGroup',
      patchGroup,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeInstancePatchStatesForPatchGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PatchGroup': patchGroup,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeInstancePatchStatesForPatchGroupResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves information about the patches on the specified instance and
  /// their state relative to the patch baseline being used for the instance.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance whose patch state information should be retrieved.
  ///
  /// Parameter [filters] :
  /// An array of structures. Each entry in the array is a structure containing
  /// a Key, Value combination. Valid values for Key are
  /// <code>Classification</code> | <code>KBId</code> | <code>Severity</code> |
  /// <code>State</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of patches to return (per page).
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeInstancePatchesResult> describeInstancePatches({
    @_s.required String instanceId,
    List<PatchOrchestratorFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeInstancePatches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeInstancePatchesResult.fromJson(jsonResponse.body);
  }

  /// Describes a specific delete inventory operation.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDeletionIdException].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [deletionId] :
  /// Specify the delete inventory ID for which you want information. This ID
  /// was returned by the <code>DeleteInventory</code> action.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<DescribeInventoryDeletionsResult> describeInventoryDeletions({
    String deletionId,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'deletionId',
      deletionId,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeInventoryDeletions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deletionId != null) 'DeletionId': deletionId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeInventoryDeletionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the individual task executions (one per target) for a particular
  /// task run as part of a maintenance window execution.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [taskId] :
  /// The ID of the specific task in the maintenance window task that should be
  /// retrieved.
  ///
  /// Parameter [windowExecutionId] :
  /// The ID of the maintenance window execution the task is part of.
  ///
  /// Parameter [filters] :
  /// Optional filters used to scope down the returned task invocations. The
  /// supported filter key is STATUS with the corresponding values PENDING,
  /// IN_PROGRESS, SUCCESS, FAILED, TIMED_OUT, CANCELLING, and CANCELLED.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMaintenanceWindowExecutionTaskInvocationsResult>
      describeMaintenanceWindowExecutionTaskInvocations({
    @_s.required String taskId,
    @_s.required String windowExecutionId,
    List<MaintenanceWindowFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowExecutionId, 'windowExecutionId');
    _s.validateStringLength(
      'windowExecutionId',
      windowExecutionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowExecutionId',
      windowExecutionId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonSSM.DescribeMaintenanceWindowExecutionTaskInvocations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskId': taskId,
        'WindowExecutionId': windowExecutionId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMaintenanceWindowExecutionTaskInvocationsResult.fromJson(
        jsonResponse.body);
  }

  /// For a given maintenance window execution, lists the tasks that were run.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowExecutionId] :
  /// The ID of the maintenance window execution whose task executions should be
  /// retrieved.
  ///
  /// Parameter [filters] :
  /// Optional filters used to scope down the returned tasks. The supported
  /// filter key is STATUS with the corresponding values PENDING, IN_PROGRESS,
  /// SUCCESS, FAILED, TIMED_OUT, CANCELLING, and CANCELLED.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMaintenanceWindowExecutionTasksResult>
      describeMaintenanceWindowExecutionTasks({
    @_s.required String windowExecutionId,
    List<MaintenanceWindowFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(windowExecutionId, 'windowExecutionId');
    _s.validateStringLength(
      'windowExecutionId',
      windowExecutionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowExecutionId',
      windowExecutionId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeMaintenanceWindowExecutionTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowExecutionId': windowExecutionId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMaintenanceWindowExecutionTasksResult.fromJson(
        jsonResponse.body);
  }

  /// Lists the executions of a maintenance window. This includes information
  /// about when the maintenance window was scheduled to be active, and
  /// information about tasks registered and run with the maintenance window.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window whose executions should be retrieved.
  ///
  /// Parameter [filters] :
  /// Each entry in the array is a structure containing:
  ///
  /// Key (string, between 1 and 128 characters)
  ///
  /// Values (array of strings, each string is between 1 and 256 characters)
  ///
  /// The supported Keys are ExecutedBefore and ExecutedAfter with the value
  /// being a date/time string such as 2016-11-04T05:00:00Z.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMaintenanceWindowExecutionsResult>
      describeMaintenanceWindowExecutions({
    @_s.required String windowId,
    List<MaintenanceWindowFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeMaintenanceWindowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMaintenanceWindowExecutionsResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves information about upcoming executions of a maintenance window.
  ///
  /// May throw [InternalServerError].
  /// May throw [DoesNotExistException].
  ///
  /// Parameter [filters] :
  /// Filters used to limit the range of results. For example, you can limit
  /// maintenance window executions to only those scheduled before or after a
  /// certain date and time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [resourceType] :
  /// The type of resource you want to retrieve information about. For example,
  /// "INSTANCE".
  ///
  /// Parameter [targets] :
  /// The instance ID or key/value pair to retrieve information about.
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window to retrieve information about.
  Future<DescribeMaintenanceWindowScheduleResult>
      describeMaintenanceWindowSchedule({
    List<PatchOrchestratorFilter> filters,
    int maxResults,
    String nextToken,
    MaintenanceWindowResourceType resourceType,
    List<Target> targets,
    String windowId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeMaintenanceWindowSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
        if (targets != null) 'Targets': targets,
        if (windowId != null) 'WindowId': windowId,
      },
    );

    return DescribeMaintenanceWindowScheduleResult.fromJson(jsonResponse.body);
  }

  /// Lists the targets registered with the maintenance window.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window whose targets should be retrieved.
  ///
  /// Parameter [filters] :
  /// Optional filters that can be used to narrow down the scope of the returned
  /// window targets. The supported filter keys are Type, WindowTargetId and
  /// OwnerInformation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMaintenanceWindowTargetsResult>
      describeMaintenanceWindowTargets({
    @_s.required String windowId,
    List<MaintenanceWindowFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeMaintenanceWindowTargets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMaintenanceWindowTargetsResult.fromJson(jsonResponse.body);
  }

  /// Lists the tasks in a maintenance window.
  /// <note>
  /// For maintenance window tasks without a specified target, you cannot supply
  /// values for <code>--max-errors</code> and <code>--max-concurrency</code>.
  /// Instead, the system inserts a placeholder value of <code>1</code>, which
  /// may be reported in the response to this command. These values do not
  /// affect the running of your task and can be ignored.
  /// </note>
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window whose tasks should be retrieved.
  ///
  /// Parameter [filters] :
  /// Optional filters used to narrow down the scope of the returned tasks. The
  /// supported filter keys are WindowTaskId, TaskArn, Priority, and TaskType.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMaintenanceWindowTasksResult> describeMaintenanceWindowTasks({
    @_s.required String windowId,
    List<MaintenanceWindowFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeMaintenanceWindowTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMaintenanceWindowTasksResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the maintenance windows in an AWS account.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// Optional filters used to narrow down the scope of the returned maintenance
  /// windows. Supported filter keys are <b>Name</b> and <b>Enabled</b>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMaintenanceWindowsResult> describeMaintenanceWindows({
    List<MaintenanceWindowFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeMaintenanceWindows'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMaintenanceWindowsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the maintenance window targets or tasks that
  /// an instance is associated with.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceType] :
  /// The type of resource you want to retrieve information about. For example,
  /// "INSTANCE".
  ///
  /// Parameter [targets] :
  /// The instance ID or key/value pair to retrieve information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMaintenanceWindowsForTargetResult>
      describeMaintenanceWindowsForTarget({
    @_s.required MaintenanceWindowResourceType resourceType,
    @_s.required List<Target> targets,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(targets, 'targets');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeMaintenanceWindowsForTarget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceType': resourceType?.toValue() ?? '',
        'Targets': targets,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMaintenanceWindowsForTargetResult.fromJson(
        jsonResponse.body);
  }

  /// Query a set of OpsItems. You must have permission in AWS Identity and
  /// Access Management (IAM) to query a list of OpsItems. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting
  /// started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS
  /// Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [opsItemFilters] :
  /// One or more filters to limit the response.
  ///
  /// <ul>
  /// <li>
  /// Key: CreatedTime
  ///
  /// Operations: GreaterThan, LessThan
  /// </li>
  /// <li>
  /// Key: LastModifiedBy
  ///
  /// Operations: Contains, Equals
  /// </li>
  /// <li>
  /// Key: LastModifiedTime
  ///
  /// Operations: GreaterThan, LessThan
  /// </li>
  /// <li>
  /// Key: Priority
  ///
  /// Operations: Equals
  /// </li>
  /// <li>
  /// Key: Source
  ///
  /// Operations: Contains, Equals
  /// </li>
  /// <li>
  /// Key: Status
  ///
  /// Operations: Equals
  /// </li>
  /// <li>
  /// Key: Title
  ///
  /// Operations: Contains
  /// </li>
  /// <li>
  /// Key: OperationalData*
  ///
  /// Operations: Equals
  /// </li>
  /// <li>
  /// Key: OperationalDataKey
  ///
  /// Operations: Equals
  /// </li>
  /// <li>
  /// Key: OperationalDataValue
  ///
  /// Operations: Equals, Contains
  /// </li>
  /// <li>
  /// Key: OpsItemId
  ///
  /// Operations: Equals
  /// </li>
  /// <li>
  /// Key: ResourceId
  ///
  /// Operations: Contains
  /// </li>
  /// <li>
  /// Key: AutomationId
  ///
  /// Operations: Equals
  /// </li>
  /// </ul>
  /// *If you filter the response by using the OperationalData operator, specify
  /// a key-value pair by using the following JSON format:
  /// {"key":"key_name","value":"a_value"}
  Future<DescribeOpsItemsResponse> describeOpsItems({
    int maxResults,
    String nextToken,
    List<OpsItemFilter> opsItemFilters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeOpsItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (opsItemFilters != null) 'OpsItemFilters': opsItemFilters,
      },
    );

    return DescribeOpsItemsResponse.fromJson(jsonResponse.body);
  }

  /// Get information about a parameter.
  /// <note>
  /// Request results are returned on a best-effort basis. If you specify
  /// <code>MaxResults</code> in the request, the response includes information
  /// up to the limit specified. The number of items returned, however, can be
  /// between zero and the value of <code>MaxResults</code>. If the service
  /// reaches an internal limit while processing the results, it stops the
  /// operation and returns the matching values up to that point and a
  /// <code>NextToken</code>. You can specify the <code>NextToken</code> in a
  /// subsequent call to get the next set of results.
  /// </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidFilterKey].
  /// May throw [InvalidFilterOption].
  /// May throw [InvalidFilterValue].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [filters] :
  /// This data type is deprecated. Instead, use <code>ParameterFilters</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [parameterFilters] :
  /// Filters to limit the request results.
  Future<DescribeParametersResult> describeParameters({
    List<ParametersFilter> filters,
    int maxResults,
    String nextToken,
    List<ParameterStringFilter> parameterFilters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (parameterFilters != null) 'ParameterFilters': parameterFilters,
      },
    );

    return DescribeParametersResult.fromJson(jsonResponse.body);
  }

  /// Lists the patch baselines in your AWS account.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// Each element in the array is a structure containing:
  ///
  /// Key: (string, "NAME_PREFIX" or "OWNER")
  ///
  /// Value: (array of strings, exactly 1 entry, between 1 and 255 characters)
  ///
  /// Parameter [maxResults] :
  /// The maximum number of patch baselines to return (per page).
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribePatchBaselinesResult> describePatchBaselines({
    List<PatchOrchestratorFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribePatchBaselines'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribePatchBaselinesResult.fromJson(jsonResponse.body);
  }

  /// Returns high-level aggregated patch compliance state for a patch group.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [patchGroup] :
  /// The name of the patch group whose patch snapshot should be retrieved.
  Future<DescribePatchGroupStateResult> describePatchGroupState({
    @_s.required String patchGroup,
  }) async {
    ArgumentError.checkNotNull(patchGroup, 'patchGroup');
    _s.validateStringLength(
      'patchGroup',
      patchGroup,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patchGroup',
      patchGroup,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribePatchGroupState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PatchGroup': patchGroup,
      },
    );

    return DescribePatchGroupStateResult.fromJson(jsonResponse.body);
  }

  /// Lists all patch groups that have been registered with patch baselines.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// One or more filters. Use a filter to return a more specific list of
  /// results.
  ///
  /// For <code>DescribePatchGroups</code>,valid filter keys include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>NAME_PREFIX</code>: The name of the patch group. Wildcards (*) are
  /// accepted.
  /// </li>
  /// <li>
  /// <code>OPERATING_SYSTEM</code>: The supported operating system type to
  /// return results for. For valid operating system values, see
  /// <a>GetDefaultPatchBaselineRequest$OperatingSystem</a> in
  /// <a>CreatePatchBaseline</a>.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// <code>--filters Key=NAME_PREFIX,Values=MyPatchGroup*</code>
  /// </li>
  /// <li>
  /// <code>--filters Key=OPERATING_SYSTEM,Values=AMAZON_LINUX_2</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of patch groups to return (per page).
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribePatchGroupsResult> describePatchGroups({
    List<PatchOrchestratorFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribePatchGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribePatchGroupsResult.fromJson(jsonResponse.body);
  }

  /// Lists the properties of available patches organized by product, product
  /// family, classification, severity, and other properties of available
  /// patches. You can use the reported properties in the filters you specify in
  /// requests for actions such as <a>CreatePatchBaseline</a>,
  /// <a>UpdatePatchBaseline</a>, <a>DescribeAvailablePatches</a>, and
  /// <a>DescribePatchBaselines</a>.
  ///
  /// The following section lists the properties that can be used in filters for
  /// each major operating system type:
  /// <dl> <dt>AMAZON_LINUX</dt> <dd>
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  /// </dd> <dt>AMAZON_LINUX_2</dt> <dd>
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  /// </dd> <dt>CENTOS</dt> <dd>
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  /// </dd> <dt>DEBIAN</dt> <dd>
  /// Valid properties: PRODUCT, PRIORITY
  /// </dd> <dt>MACOS</dt> <dd>
  /// Valid properties: PRODUCT, CLASSIFICATION
  /// </dd> <dt>ORACLE_LINUX</dt> <dd>
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  /// </dd> <dt>REDHAT_ENTERPRISE_LINUX</dt> <dd>
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  /// </dd> <dt>SUSE</dt> <dd>
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  /// </dd> <dt>UBUNTU</dt> <dd>
  /// Valid properties: PRODUCT, PRIORITY
  /// </dd> <dt>WINDOWS</dt> <dd>
  /// Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY
  /// </dd> </dl>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [operatingSystem] :
  /// The operating system type for which to list patches.
  ///
  /// Parameter [property] :
  /// The patch property for which you want to view patch details.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [patchSet] :
  /// Indicates whether to list patches for the Windows operating system or for
  /// Microsoft applications. Not applicable for the Linux or macOS operating
  /// systems.
  Future<DescribePatchPropertiesResult> describePatchProperties({
    @_s.required OperatingSystem operatingSystem,
    @_s.required PatchProperty property,
    int maxResults,
    String nextToken,
    PatchSet patchSet,
  }) async {
    ArgumentError.checkNotNull(operatingSystem, 'operatingSystem');
    ArgumentError.checkNotNull(property, 'property');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribePatchProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OperatingSystem': operatingSystem?.toValue() ?? '',
        'Property': property?.toValue() ?? '',
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (patchSet != null) 'PatchSet': patchSet.toValue(),
      },
    );

    return DescribePatchPropertiesResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of all active sessions (both connected and disconnected)
  /// or terminated sessions from the past 30 days.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidFilterKey].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [state] :
  /// The session status to retrieve a list of sessions for. For example,
  /// "Active".
  ///
  /// Parameter [filters] :
  /// One or more filters to limit the type of sessions returned by the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeSessionsResponse> describeSessions({
    @_s.required SessionState state,
    List<SessionFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(state, 'state');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.DescribeSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'State': state?.toValue() ?? '',
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeSessionsResponse.fromJson(jsonResponse.body);
  }

  /// Get detailed information about a particular Automation execution.
  ///
  /// May throw [AutomationExecutionNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [automationExecutionId] :
  /// The unique identifier for an existing automation execution to examine. The
  /// execution ID is returned by StartAutomationExecution when the execution of
  /// an Automation document is initiated.
  Future<GetAutomationExecutionResult> getAutomationExecution({
    @_s.required String automationExecutionId,
  }) async {
    ArgumentError.checkNotNull(automationExecutionId, 'automationExecutionId');
    _s.validateStringLength(
      'automationExecutionId',
      automationExecutionId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetAutomationExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutomationExecutionId': automationExecutionId,
      },
    );

    return GetAutomationExecutionResult.fromJson(jsonResponse.body);
  }

  /// Gets the state of the AWS Systems Manager Change Calendar at an optional,
  /// specified time. If you specify a time, <code>GetCalendarState</code>
  /// returns the state of the calendar at a specific time, and returns the next
  /// time that the Change Calendar state will transition. If you do not specify
  /// a time, <code>GetCalendarState</code> assumes the current time. Change
  /// Calendar entries have two possible states: <code>OPEN</code> or
  /// <code>CLOSED</code>.
  ///
  /// If you specify more than one calendar in a request, the command returns
  /// the status of <code>OPEN</code> only if all calendars in the request are
  /// open. If one or more calendars in the request are closed, the status
  /// returned is <code>CLOSED</code>.
  ///
  /// For more information about Systems Manager Change Calendar, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">AWS
  /// Systems Manager Change Calendar</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentType].
  /// May throw [UnsupportedCalendarException].
  ///
  /// Parameter [calendarNames] :
  /// The names or Amazon Resource Names (ARNs) of the Systems Manager documents
  /// that represent the calendar entries for which you want to get the state.
  ///
  /// Parameter [atTime] :
  /// (Optional) The specific time for which you want to get calendar state
  /// information, in <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO
  /// 8601</a> format. If you do not add <code>AtTime</code>, the current time
  /// is assumed.
  Future<GetCalendarStateResponse> getCalendarState({
    @_s.required List<String> calendarNames,
    String atTime,
  }) async {
    ArgumentError.checkNotNull(calendarNames, 'calendarNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetCalendarState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CalendarNames': calendarNames,
        if (atTime != null) 'AtTime': atTime,
      },
    );

    return GetCalendarStateResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about command execution for an invocation or
  /// plugin.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidCommandId].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidPluginName].
  /// May throw [InvocationDoesNotExist].
  ///
  /// Parameter [commandId] :
  /// (Required) The parent command ID of the invocation plugin.
  ///
  /// Parameter [instanceId] :
  /// (Required) The ID of the managed instance targeted by the command. A
  /// managed instance can be an EC2 instance or an instance in your hybrid
  /// environment that is configured for Systems Manager.
  ///
  /// Parameter [pluginName] :
  /// (Optional) The name of the plugin for which you want detailed results. If
  /// the document contains only one plugin, the name can be omitted and the
  /// details will be returned.
  ///
  /// Plugin names are also referred to as step names in Systems Manager
  /// documents.
  Future<GetCommandInvocationResult> getCommandInvocation({
    @_s.required String commandId,
    @_s.required String instanceId,
    String pluginName,
  }) async {
    ArgumentError.checkNotNull(commandId, 'commandId');
    _s.validateStringLength(
      'commandId',
      commandId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'pluginName',
      pluginName,
      4,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetCommandInvocation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CommandId': commandId,
        'InstanceId': instanceId,
        if (pluginName != null) 'PluginName': pluginName,
      },
    );

    return GetCommandInvocationResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the Session Manager connection status for an instance to
  /// determine whether it is running and ready to receive Session Manager
  /// connections.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [target] :
  /// The ID of the instance.
  Future<GetConnectionStatusResponse> getConnectionStatus({
    @_s.required String target,
  }) async {
    ArgumentError.checkNotNull(target, 'target');
    _s.validateStringLength(
      'target',
      target,
      1,
      400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetConnectionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Target': target,
      },
    );

    return GetConnectionStatusResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the default patch baseline. Note that Systems Manager supports
  /// creating multiple default patch baselines. For example, you can create a
  /// default patch baseline for each operating system.
  ///
  /// If you do not specify an operating system value, the default patch
  /// baseline for Windows is returned.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [operatingSystem] :
  /// Returns the default patch baseline for the specified operating system.
  Future<GetDefaultPatchBaselineResult> getDefaultPatchBaseline({
    OperatingSystem operatingSystem,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetDefaultPatchBaseline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (operatingSystem != null)
          'OperatingSystem': operatingSystem.toValue(),
      },
    );

    return GetDefaultPatchBaselineResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the current snapshot for the patch baseline the instance uses.
  /// This API is primarily used by the AWS-RunPatchBaseline Systems Manager
  /// document.
  ///
  /// May throw [InternalServerError].
  /// May throw [UnsupportedOperatingSystem].
  /// May throw [UnsupportedFeatureRequiredException].
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance for which the appropriate patch snapshot should be
  /// retrieved.
  ///
  /// Parameter [snapshotId] :
  /// The user-defined snapshot ID.
  Future<GetDeployablePatchSnapshotForInstanceResult>
      getDeployablePatchSnapshotForInstance({
    @_s.required String instanceId,
    @_s.required String snapshotId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringLength(
      'snapshotId',
      snapshotId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'snapshotId',
      snapshotId,
      r'''^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetDeployablePatchSnapshotForInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'SnapshotId': snapshotId,
      },
    );

    return GetDeployablePatchSnapshotForInstanceResult.fromJson(
        jsonResponse.body);
  }

  /// Gets the contents of the specified Systems Manager document.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentVersion].
  ///
  /// Parameter [name] :
  /// The name of the Systems Manager document.
  ///
  /// Parameter [documentFormat] :
  /// Returns the document in the specified format. The document format can be
  /// either JSON or YAML. JSON is the default format.
  ///
  /// Parameter [documentVersion] :
  /// The document version for which you want information.
  ///
  /// Parameter [versionName] :
  /// An optional field specifying the version of the artifact associated with
  /// the document. For example, "Release 12, Update 6". This value is unique
  /// across all versions of a document and can't be changed.
  Future<GetDocumentResult> getDocument({
    @_s.required String name,
    DocumentFormat documentFormat,
    String documentVersion,
    String versionName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringPattern(
      'versionName',
      versionName,
      r'''^[a-zA-Z0-9_\-.]{1,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (documentFormat != null) 'DocumentFormat': documentFormat.toValue(),
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return GetDocumentResult.fromJson(jsonResponse.body);
  }

  /// Query inventory information.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidFilter].
  /// May throw [InvalidInventoryGroupException].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidTypeNameException].
  /// May throw [InvalidAggregatorException].
  /// May throw [InvalidResultAttributeException].
  ///
  /// Parameter [aggregators] :
  /// Returns counts of inventory types based on one or more expressions. For
  /// example, if you aggregate by using an expression that uses the
  /// <code>AWS:InstanceInformation.PlatformType</code> type, you can see a
  /// count of how many Windows and Linux instances exist in your inventoried
  /// fleet.
  ///
  /// Parameter [filters] :
  /// One or more filters. Use a filter to return a more specific list of
  /// results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [resultAttributes] :
  /// The list of inventory item types to return.
  Future<GetInventoryResult> getInventory({
    List<InventoryAggregator> aggregators,
    List<InventoryFilter> filters,
    int maxResults,
    String nextToken,
    List<ResultAttribute> resultAttributes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetInventory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aggregators != null) 'Aggregators': aggregators,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resultAttributes != null) 'ResultAttributes': resultAttributes,
      },
    );

    return GetInventoryResult.fromJson(jsonResponse.body);
  }

  /// Return a list of inventory type names for the account, or return a list of
  /// attribute names for a specific Inventory item type.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidTypeNameException].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [aggregator] :
  /// Returns inventory schemas that support aggregation. For example, this call
  /// returns the <code>AWS:InstanceInformation</code> type, because it supports
  /// aggregation based on the <code>PlatformName</code>,
  /// <code>PlatformType</code>, and <code>PlatformVersion</code> attributes.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [subType] :
  /// Returns the sub-type schema for a specified inventory type.
  ///
  /// Parameter [typeName] :
  /// The type of inventory item to return.
  Future<GetInventorySchemaResult> getInventorySchema({
    bool aggregator,
    int maxResults,
    String nextToken,
    bool subType,
    String typeName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      200,
    );
    _s.validateStringLength(
      'typeName',
      typeName,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetInventorySchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aggregator != null) 'Aggregator': aggregator,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (subType != null) 'SubType': subType,
        if (typeName != null) 'TypeName': typeName,
      },
    );

    return GetInventorySchemaResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a maintenance window.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window for which you want to retrieve
  /// information.
  Future<GetMaintenanceWindowResult> getMaintenanceWindow({
    @_s.required String windowId,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
      },
    );

    return GetMaintenanceWindowResult.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a specific a maintenance window execution.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowExecutionId] :
  /// The ID of the maintenance window execution that includes the task.
  Future<GetMaintenanceWindowExecutionResult> getMaintenanceWindowExecution({
    @_s.required String windowExecutionId,
  }) async {
    ArgumentError.checkNotNull(windowExecutionId, 'windowExecutionId');
    _s.validateStringLength(
      'windowExecutionId',
      windowExecutionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowExecutionId',
      windowExecutionId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetMaintenanceWindowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowExecutionId': windowExecutionId,
      },
    );

    return GetMaintenanceWindowExecutionResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the details about a specific task run as part of a maintenance
  /// window execution.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [taskId] :
  /// The ID of the specific task execution in the maintenance window task that
  /// should be retrieved.
  ///
  /// Parameter [windowExecutionId] :
  /// The ID of the maintenance window execution that includes the task.
  Future<GetMaintenanceWindowExecutionTaskResult>
      getMaintenanceWindowExecutionTask({
    @_s.required String taskId,
    @_s.required String windowExecutionId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowExecutionId, 'windowExecutionId');
    _s.validateStringLength(
      'windowExecutionId',
      windowExecutionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowExecutionId',
      windowExecutionId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetMaintenanceWindowExecutionTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskId': taskId,
        'WindowExecutionId': windowExecutionId,
      },
    );

    return GetMaintenanceWindowExecutionTaskResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a specific task running on a specific target.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [invocationId] :
  /// The invocation ID to retrieve.
  ///
  /// Parameter [taskId] :
  /// The ID of the specific task in the maintenance window task that should be
  /// retrieved.
  ///
  /// Parameter [windowExecutionId] :
  /// The ID of the maintenance window execution for which the task is a part.
  Future<GetMaintenanceWindowExecutionTaskInvocationResult>
      getMaintenanceWindowExecutionTaskInvocation({
    @_s.required String invocationId,
    @_s.required String taskId,
    @_s.required String windowExecutionId,
  }) async {
    ArgumentError.checkNotNull(invocationId, 'invocationId');
    _s.validateStringLength(
      'invocationId',
      invocationId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'invocationId',
      invocationId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowExecutionId, 'windowExecutionId');
    _s.validateStringLength(
      'windowExecutionId',
      windowExecutionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowExecutionId',
      windowExecutionId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetMaintenanceWindowExecutionTaskInvocation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InvocationId': invocationId,
        'TaskId': taskId,
        'WindowExecutionId': windowExecutionId,
      },
    );

    return GetMaintenanceWindowExecutionTaskInvocationResult.fromJson(
        jsonResponse.body);
  }

  /// Lists the tasks in a maintenance window.
  /// <note>
  /// For maintenance window tasks without a specified target, you cannot supply
  /// values for <code>--max-errors</code> and <code>--max-concurrency</code>.
  /// Instead, the system inserts a placeholder value of <code>1</code>, which
  /// may be reported in the response to this command. These values do not
  /// affect the running of your task and can be ignored.
  /// </note>
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The maintenance window ID that includes the task to retrieve.
  ///
  /// Parameter [windowTaskId] :
  /// The maintenance window task ID to retrieve.
  Future<GetMaintenanceWindowTaskResult> getMaintenanceWindowTask({
    @_s.required String windowId,
    @_s.required String windowTaskId,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowTaskId, 'windowTaskId');
    _s.validateStringLength(
      'windowTaskId',
      windowTaskId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowTaskId',
      windowTaskId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetMaintenanceWindowTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        'WindowTaskId': windowTaskId,
      },
    );

    return GetMaintenanceWindowTaskResult.fromJson(jsonResponse.body);
  }

  /// Get information about an OpsItem by using the ID. You must have permission
  /// in AWS Identity and Access Management (IAM) to view information about an
  /// OpsItem. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting
  /// started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS
  /// Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [OpsItemNotFoundException].
  ///
  /// Parameter [opsItemId] :
  /// The ID of the OpsItem that you want to get.
  Future<GetOpsItemResponse> getOpsItem({
    @_s.required String opsItemId,
  }) async {
    ArgumentError.checkNotNull(opsItemId, 'opsItemId');
    _s.validateStringPattern(
      'opsItemId',
      opsItemId,
      r'''^(oi)-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetOpsItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OpsItemId': opsItemId,
      },
    );

    return GetOpsItemResponse.fromJson(jsonResponse.body);
  }

  /// View operational metadata related to an application in Application
  /// Manager.
  ///
  /// May throw [OpsMetadataNotFoundException].
  /// May throw [OpsMetadataInvalidArgumentException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [opsMetadataArn] :
  /// The Amazon Resource Name (ARN) of an OpsMetadata Object to view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<GetOpsMetadataResult> getOpsMetadata({
    @_s.required String opsMetadataArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(opsMetadataArn, 'opsMetadataArn');
    _s.validateStringLength(
      'opsMetadataArn',
      opsMetadataArn,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'opsMetadataArn',
      opsMetadataArn,
      r'''arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:opsmetadata\/([a-zA-Z0-9-_\.\/]*)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetOpsMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OpsMetadataArn': opsMetadataArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetOpsMetadataResult.fromJson(jsonResponse.body);
  }

  /// View a summary of OpsItems based on specified filters and aggregators.
  ///
  /// May throw [InternalServerError].
  /// May throw [ResourceDataSyncNotFoundException].
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidTypeNameException].
  /// May throw [InvalidAggregatorException].
  ///
  /// Parameter [aggregators] :
  /// Optional aggregators that return counts of OpsItems based on one or more
  /// expressions.
  ///
  /// Parameter [filters] :
  /// Optional filters used to scope down the returned OpsItems.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [resultAttributes] :
  /// The OpsItem data type to return.
  ///
  /// Parameter [syncName] :
  /// Specify the name of a resource data sync to get.
  Future<GetOpsSummaryResult> getOpsSummary({
    List<OpsAggregator> aggregators,
    List<OpsFilter> filters,
    int maxResults,
    String nextToken,
    List<OpsResultAttribute> resultAttributes,
    String syncName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'syncName',
      syncName,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetOpsSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aggregators != null) 'Aggregators': aggregators,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resultAttributes != null) 'ResultAttributes': resultAttributes,
        if (syncName != null) 'SyncName': syncName,
      },
    );

    return GetOpsSummaryResult.fromJson(jsonResponse.body);
  }

  /// Get information about a parameter by using the parameter name. Don't
  /// confuse this API action with the <a>GetParameters</a> API action.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidKeyId].
  /// May throw [ParameterNotFound].
  /// May throw [ParameterVersionNotFound].
  ///
  /// Parameter [name] :
  /// The name of the parameter you want to query.
  ///
  /// Parameter [withDecryption] :
  /// Return decrypted values for secure string parameters. This flag is ignored
  /// for String and StringList parameter types.
  Future<GetParameterResult> getParameter({
    @_s.required String name,
    bool withDecryption,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetParameter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (withDecryption != null) 'WithDecryption': withDecryption,
      },
    );

    return GetParameterResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the history of all changes to a parameter.
  ///
  /// May throw [InternalServerError].
  /// May throw [ParameterNotFound].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidKeyId].
  ///
  /// Parameter [name] :
  /// The name of the parameter for which you want to review history.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [withDecryption] :
  /// Return decrypted values for secure string parameters. This flag is ignored
  /// for String and StringList parameter types.
  Future<GetParameterHistoryResult> getParameterHistory({
    @_s.required String name,
    int maxResults,
    String nextToken,
    bool withDecryption,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetParameterHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (withDecryption != null) 'WithDecryption': withDecryption,
      },
    );

    return GetParameterHistoryResult.fromJson(jsonResponse.body);
  }

  /// Get details of a parameter. Don't confuse this API action with the
  /// <a>GetParameter</a> API action.
  ///
  /// May throw [InvalidKeyId].
  /// May throw [InternalServerError].
  ///
  /// Parameter [names] :
  /// Names of the parameters for which you want to query information.
  ///
  /// Parameter [withDecryption] :
  /// Return decrypted secure string value. Return decrypted values for secure
  /// string parameters. This flag is ignored for String and StringList
  /// parameter types.
  Future<GetParametersResult> getParameters({
    @_s.required List<String> names,
    bool withDecryption,
  }) async {
    ArgumentError.checkNotNull(names, 'names');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Names': names,
        if (withDecryption != null) 'WithDecryption': withDecryption,
      },
    );

    return GetParametersResult.fromJson(jsonResponse.body);
  }

  /// Retrieve information about one or more parameters in a specific hierarchy.
  /// <note>
  /// Request results are returned on a best-effort basis. If you specify
  /// <code>MaxResults</code> in the request, the response includes information
  /// up to the limit specified. The number of items returned, however, can be
  /// between zero and the value of <code>MaxResults</code>. If the service
  /// reaches an internal limit while processing the results, it stops the
  /// operation and returns the matching values up to that point and a
  /// <code>NextToken</code>. You can specify the <code>NextToken</code> in a
  /// subsequent call to get the next set of results.
  /// </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidFilterKey].
  /// May throw [InvalidFilterOption].
  /// May throw [InvalidFilterValue].
  /// May throw [InvalidKeyId].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [path] :
  /// The hierarchy for the parameter. Hierarchies start with a forward slash
  /// (/) and end with the parameter name. A parameter name hierarchy can have a
  /// maximum of 15 levels. Here is an example of a hierarchy:
  /// <code>/Finance/Prod/IAD/WinServ2016/license33</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [parameterFilters] :
  /// Filters to limit the request results.
  /// <note>
  /// For <code>GetParametersByPath</code>, the following filter
  /// <code>Key</code> names are supported: <code>Type</code>,
  /// <code>KeyId</code>, <code>Label</code>, and <code>DataType</code>.
  ///
  /// The following <code>Key</code> values are not supported for
  /// <code>GetParametersByPath</code>: <code>tag</code>, <code>Name</code>,
  /// <code>Path</code>, and <code>Tier</code>.
  /// </note>
  ///
  /// Parameter [recursive] :
  /// Retrieve all parameters within a hierarchy.
  /// <important>
  /// If a user has access to a path, then the user can access all levels of
  /// that path. For example, if a user has permission to access path
  /// <code>/a</code>, then the user can also access <code>/a/b</code>. Even if
  /// a user has explicitly been denied access in IAM for parameter
  /// <code>/a/b</code>, they can still call the GetParametersByPath API action
  /// recursively for <code>/a</code> and view <code>/a/b</code>.
  /// </important>
  ///
  /// Parameter [withDecryption] :
  /// Retrieve all parameters in a hierarchy with their value decrypted.
  Future<GetParametersByPathResult> getParametersByPath({
    @_s.required String path,
    int maxResults,
    String nextToken,
    List<ParameterStringFilter> parameterFilters,
    bool recursive,
    bool withDecryption,
  }) async {
    ArgumentError.checkNotNull(path, 'path');
    _s.validateStringLength(
      'path',
      path,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetParametersByPath'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Path': path,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (parameterFilters != null) 'ParameterFilters': parameterFilters,
        if (recursive != null) 'Recursive': recursive,
        if (withDecryption != null) 'WithDecryption': withDecryption,
      },
    );

    return GetParametersByPathResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a patch baseline.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InvalidResourceId].
  /// May throw [InternalServerError].
  ///
  /// Parameter [baselineId] :
  /// The ID of the patch baseline to retrieve.
  Future<GetPatchBaselineResult> getPatchBaseline({
    @_s.required String baselineId,
  }) async {
    ArgumentError.checkNotNull(baselineId, 'baselineId');
    _s.validateStringLength(
      'baselineId',
      baselineId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baselineId',
      baselineId,
      r'''^[a-zA-Z0-9_\-:/]{20,128}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetPatchBaseline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaselineId': baselineId,
      },
    );

    return GetPatchBaselineResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the patch baseline that should be used for the specified patch
  /// group.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [patchGroup] :
  /// The name of the patch group whose patch baseline should be retrieved.
  ///
  /// Parameter [operatingSystem] :
  /// Returns he operating system rule specified for patch groups using the
  /// patch baseline.
  Future<GetPatchBaselineForPatchGroupResult> getPatchBaselineForPatchGroup({
    @_s.required String patchGroup,
    OperatingSystem operatingSystem,
  }) async {
    ArgumentError.checkNotNull(patchGroup, 'patchGroup');
    _s.validateStringLength(
      'patchGroup',
      patchGroup,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patchGroup',
      patchGroup,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetPatchBaselineForPatchGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PatchGroup': patchGroup,
        if (operatingSystem != null)
          'OperatingSystem': operatingSystem.toValue(),
      },
    );

    return GetPatchBaselineForPatchGroupResult.fromJson(jsonResponse.body);
  }

  /// <code>ServiceSetting</code> is an account-level setting for an AWS
  /// service. This setting defines how a user interacts with or uses a service
  /// or a feature of a service. For example, if an AWS service charges money to
  /// the account based on feature or service usage, then the AWS service team
  /// might create a default setting of "false". This means the user can't use
  /// this feature unless they change the setting to "true" and intentionally
  /// opt in for a paid feature.
  ///
  /// Services map a <code>SettingId</code> object to a setting value. AWS
  /// services teams define the default value for a <code>SettingId</code>. You
  /// can't create a new <code>SettingId</code>, but you can overwrite the
  /// default value if you have the <code>ssm:UpdateServiceSetting</code>
  /// permission for the setting. Use the <a>UpdateServiceSetting</a> API action
  /// to change the default setting. Or use the <a>ResetServiceSetting</a> to
  /// change the value back to the original value defined by the AWS service
  /// team.
  ///
  /// Query the current service setting for the account.
  ///
  /// May throw [InternalServerError].
  /// May throw [ServiceSettingNotFound].
  ///
  /// Parameter [settingId] :
  /// The ID of the service setting to get. The setting ID can be
  /// <code>/ssm/parameter-store/default-parameter-tier</code>,
  /// <code>/ssm/parameter-store/high-throughput-enabled</code>, or
  /// <code>/ssm/managed-instance/activation-tier</code>.
  Future<GetServiceSettingResult> getServiceSetting({
    @_s.required String settingId,
  }) async {
    ArgumentError.checkNotNull(settingId, 'settingId');
    _s.validateStringLength(
      'settingId',
      settingId,
      1,
      1000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.GetServiceSetting'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SettingId': settingId,
      },
    );

    return GetServiceSettingResult.fromJson(jsonResponse.body);
  }

  /// A parameter label is a user-defined alias to help you manage different
  /// versions of a parameter. When you modify a parameter, Systems Manager
  /// automatically saves a new version and increments the version number by
  /// one. A label can help you remember the purpose of a parameter when there
  /// are multiple versions.
  ///
  /// Parameter labels have the following requirements and restrictions.
  ///
  /// <ul>
  /// <li>
  /// A version of a parameter can have a maximum of 10 labels.
  /// </li>
  /// <li>
  /// You can't attach the same label to different versions of the same
  /// parameter. For example, if version 1 has the label Production, then you
  /// can't attach Production to version 2.
  /// </li>
  /// <li>
  /// You can move a label from one version of a parameter to another.
  /// </li>
  /// <li>
  /// You can't create a label when you create a new parameter. You must attach
  /// a label to a specific version of a parameter.
  /// </li>
  /// <li>
  /// You can't delete a parameter label. If you no longer want to use a
  /// parameter label, then you must move it to a different version of a
  /// parameter.
  /// </li>
  /// <li>
  /// A label can have a maximum of 100 characters.
  /// </li>
  /// <li>
  /// Labels can contain letters (case sensitive), numbers, periods (.), hyphens
  /// (-), or underscores (_).
  /// </li>
  /// <li>
  /// Labels can't begin with a number, "aws," or "ssm" (not case sensitive). If
  /// a label fails to meet these requirements, then the label is not associated
  /// with a parameter and the system displays it in the list of InvalidLabels.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerError].
  /// May throw [TooManyUpdates].
  /// May throw [ParameterNotFound].
  /// May throw [ParameterVersionNotFound].
  /// May throw [ParameterVersionLabelLimitExceeded].
  ///
  /// Parameter [labels] :
  /// One or more labels to attach to the specified parameter version.
  ///
  /// Parameter [name] :
  /// The parameter name on which you want to attach one or more labels.
  ///
  /// Parameter [parameterVersion] :
  /// The specific version of the parameter on which you want to attach one or
  /// more labels. If no version is specified, the system attaches the label to
  /// the latest version.
  Future<LabelParameterVersionResult> labelParameterVersion({
    @_s.required List<String> labels,
    @_s.required String name,
    int parameterVersion,
  }) async {
    ArgumentError.checkNotNull(labels, 'labels');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.LabelParameterVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Labels': labels,
        'Name': name,
        if (parameterVersion != null) 'ParameterVersion': parameterVersion,
      },
    );

    return LabelParameterVersionResult.fromJson(jsonResponse.body);
  }

  /// Retrieves all versions of an association for a specific association ID.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidNextToken].
  /// May throw [AssociationDoesNotExist].
  ///
  /// Parameter [associationId] :
  /// The association ID for which you want to view all versions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<ListAssociationVersionsResult> listAssociationVersions({
    @_s.required String associationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringPattern(
      'associationId',
      associationId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListAssociationVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationId': associationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAssociationVersionsResult.fromJson(jsonResponse.body);
  }

  /// Returns all State Manager associations in the current AWS account and
  /// Region. You can limit the results to a specific State Manager association
  /// document or instance by specifying a filter.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [associationFilterList] :
  /// One or more filters. Use a filter to return a more specific list of
  /// results.
  /// <note>
  /// Filtering associations using the <code>InstanceID</code> attribute only
  /// returns legacy associations created using the <code>InstanceID</code>
  /// attribute. Associations targeting the instance that are part of the Target
  /// Attributes <code>ResourceGroup</code> or <code>Tags</code> are not
  /// returned.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<ListAssociationsResult> listAssociations({
    List<AssociationFilter> associationFilterList,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (associationFilterList != null)
          'AssociationFilterList': associationFilterList,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAssociationsResult.fromJson(jsonResponse.body);
  }

  /// An invocation is copy of a command sent to a specific instance. A command
  /// can apply to one or more instances. A command invocation applies to one
  /// instance. For example, if a user runs SendCommand against three instances,
  /// then a command invocation is created for each requested instance ID.
  /// ListCommandInvocations provide status about command execution.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidCommandId].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidFilterKey].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [commandId] :
  /// (Optional) The invocations for a specific command ID.
  ///
  /// Parameter [details] :
  /// (Optional) If set this returns the response of the command executions and
  /// any command output. By default this is set to False.
  ///
  /// Parameter [filters] :
  /// (Optional) One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// Parameter [instanceId] :
  /// (Optional) The command execution details for a specific instance ID.
  ///
  /// Parameter [maxResults] :
  /// (Optional) The maximum number of items to return for this call. The call
  /// also returns a token that you can specify in a subsequent call to get the
  /// next set of results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListCommandInvocationsResult> listCommandInvocations({
    String commandId,
    bool details,
    List<CommandFilter> filters,
    String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'commandId',
      commandId,
      36,
      36,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListCommandInvocations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (commandId != null) 'CommandId': commandId,
        if (details != null) 'Details': details,
        if (filters != null) 'Filters': filters,
        if (instanceId != null) 'InstanceId': instanceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCommandInvocationsResult.fromJson(jsonResponse.body);
  }

  /// Lists the commands requested by users of the AWS account.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidCommandId].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidFilterKey].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [commandId] :
  /// (Optional) If provided, lists only the specified command.
  ///
  /// Parameter [filters] :
  /// (Optional) One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// Parameter [instanceId] :
  /// (Optional) Lists commands issued against this instance ID.
  /// <note>
  /// You can't specify an instance ID in the same command that you specify
  /// <code>Status</code> = <code>Pending</code>. This is because the command
  /// has not reached the instance yet.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// (Optional) The maximum number of items to return for this call. The call
  /// also returns a token that you can specify in a subsequent call to get the
  /// next set of results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListCommandsResult> listCommands({
    String commandId,
    List<CommandFilter> filters,
    String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'commandId',
      commandId,
      36,
      36,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListCommands'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (commandId != null) 'CommandId': commandId,
        if (filters != null) 'Filters': filters,
        if (instanceId != null) 'InstanceId': instanceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCommandsResult.fromJson(jsonResponse.body);
  }

  /// For a specified resource ID, this API action returns a list of compliance
  /// statuses for different resource types. Currently, you can only specify one
  /// resource ID per call. List results depend on the criteria specified in the
  /// filter.
  ///
  /// May throw [InvalidResourceType].
  /// May throw [InvalidResourceId].
  /// May throw [InternalServerError].
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [filters] :
  /// One or more compliance filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [resourceIds] :
  /// The ID for the resources from which to get compliance information.
  /// Currently, you can only specify one resource ID.
  ///
  /// Parameter [resourceTypes] :
  /// The type of resource from which to get compliance information. Currently,
  /// the only supported resource type is <code>ManagedInstance</code>.
  Future<ListComplianceItemsResult> listComplianceItems({
    List<ComplianceStringFilter> filters,
    int maxResults,
    String nextToken,
    List<String> resourceIds,
    List<String> resourceTypes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListComplianceItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceIds != null) 'ResourceIds': resourceIds,
        if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      },
    );

    return ListComplianceItemsResult.fromJson(jsonResponse.body);
  }

  /// Returns a summary count of compliant and non-compliant resources for a
  /// compliance type. For example, this call can return State Manager
  /// associations, patches, or custom compliance types according to the filter
  /// criteria that you specify.
  ///
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// One or more compliance or inventory filters. Use a filter to return a more
  /// specific list of results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. Currently, you can
  /// specify null or 50. The call also returns a token that you can specify in
  /// a subsequent call to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<ListComplianceSummariesResult> listComplianceSummaries({
    List<ComplianceStringFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListComplianceSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListComplianceSummariesResult.fromJson(jsonResponse.body);
  }

  /// Information about approval reviews for a version of an SSM document.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentVersion].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [metadata] :
  /// The type of data for which details are being requested. Currently, the
  /// only supported value is <code>DocumentReviews</code>.
  ///
  /// Parameter [name] :
  /// The name of the document.
  ///
  /// Parameter [documentVersion] :
  /// The version of the document.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<ListDocumentMetadataHistoryResponse> listDocumentMetadataHistory({
    @_s.required DocumentMetadataEnum metadata,
    @_s.required String name,
    String documentVersion,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(metadata, 'metadata');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListDocumentMetadataHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Metadata': metadata?.toValue() ?? '',
        'Name': name,
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentMetadataHistoryResponse.fromJson(jsonResponse.body);
  }

  /// List all versions for a document.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidDocument].
  ///
  /// Parameter [name] :
  /// The name of the document. You can specify an Amazon Resource Name (ARN).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<ListDocumentVersionsResult> listDocumentVersions({
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListDocumentVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentVersionsResult.fromJson(jsonResponse.body);
  }

  /// Returns all Systems Manager (SSM) documents in the current AWS account and
  /// Region. You can limit the results of this request by using a filter.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidFilterKey].
  ///
  /// Parameter [documentFilterList] :
  /// This data type is deprecated. Instead, use <code>Filters</code>.
  ///
  /// Parameter [filters] :
  /// One or more DocumentKeyValuesFilter objects. Use a filter to return a more
  /// specific list of results. For keys, you can specify one or more key-value
  /// pair tags that have been applied to a document. Other valid keys include
  /// <code>Owner</code>, <code>Name</code>, <code>PlatformTypes</code>,
  /// <code>DocumentType</code>, and <code>TargetType</code>. For example, to
  /// return documents you own use <code>Key=Owner,Values=Self</code>. To
  /// specify a custom key-value pair, use the format
  /// <code>Key=tag:tagName,Values=valueName</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<ListDocumentsResult> listDocuments({
    List<DocumentFilter> documentFilterList,
    List<DocumentKeyValuesFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListDocuments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (documentFilterList != null)
          'DocumentFilterList': documentFilterList,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentsResult.fromJson(jsonResponse.body);
  }

  /// A list of inventory items returned by the request.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidTypeNameException].
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [instanceId] :
  /// The instance ID for which you want inventory information.
  ///
  /// Parameter [typeName] :
  /// The type of inventory item for which you want information.
  ///
  /// Parameter [filters] :
  /// One or more filters. Use a filter to return a more specific list of
  /// results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<ListInventoryEntriesResult> listInventoryEntries({
    @_s.required String instanceId,
    @_s.required String typeName,
    List<InventoryFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''^(AWS|Custom):.*$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListInventoryEntries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'TypeName': typeName,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListInventoryEntriesResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of all OpsItem events in the current AWS account and
  /// Region. You can limit the results to events associated with specific
  /// OpsItems by specifying a filter.
  ///
  /// May throw [InternalServerError].
  /// May throw [OpsItemNotFoundException].
  /// May throw [OpsItemLimitExceededException].
  /// May throw [OpsItemInvalidParameterException].
  ///
  /// Parameter [filters] :
  /// One or more OpsItem filters. Use a filter to return a more specific list
  /// of results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<ListOpsItemEventsResponse> listOpsItemEvents({
    List<OpsItemEventFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListOpsItemEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListOpsItemEventsResponse.fromJson(jsonResponse.body);
  }

  /// Systems Manager calls this API action when displaying all Application
  /// Manager OpsMetadata objects or blobs.
  ///
  /// May throw [OpsMetadataInvalidArgumentException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// One or more filters to limit the number of OpsMetadata objects returned by
  /// the call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<ListOpsMetadataResult> listOpsMetadata({
    List<OpsMetadataFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListOpsMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListOpsMetadataResult.fromJson(jsonResponse.body);
  }

  /// Returns a resource-level summary count. The summary includes information
  /// about compliant and non-compliant statuses and detailed compliance-item
  /// severity counts, according to the filter criteria you specify.
  ///
  /// May throw [InvalidFilter].
  /// May throw [InvalidNextToken].
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// One or more filters. Use a filter to return a more specific list of
  /// results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<ListResourceComplianceSummariesResult>
      listResourceComplianceSummaries({
    List<ComplianceStringFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListResourceComplianceSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourceComplianceSummariesResult.fromJson(jsonResponse.body);
  }

  /// Lists your resource data sync configurations. Includes information about
  /// the last time a sync attempted to start, the last sync status, and the
  /// last time a sync successfully completed.
  ///
  /// The number of sync configurations might be too large to return using a
  /// single call to <code>ListResourceDataSync</code>. You can limit the number
  /// of sync configurations returned by using the <code>MaxResults</code>
  /// parameter. To determine whether there are more sync configurations to
  /// list, check the value of <code>NextToken</code> in the output. If there
  /// are more sync configurations to list, you can request them by specifying
  /// the <code>NextToken</code> returned in the call to the parameter of a
  /// subsequent call.
  ///
  /// May throw [ResourceDataSyncInvalidConfigurationException].
  /// May throw [InternalServerError].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [syncType] :
  /// View a list of resource data syncs according to the sync type. Specify
  /// <code>SyncToDestination</code> to view resource data syncs that
  /// synchronize data to an Amazon S3 bucket. Specify
  /// <code>SyncFromSource</code> to view resource data syncs from AWS
  /// Organizations or from multiple AWS Regions.
  Future<ListResourceDataSyncResult> listResourceDataSync({
    int maxResults,
    String nextToken,
    String syncType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'syncType',
      syncType,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListResourceDataSync'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (syncType != null) 'SyncType': syncType,
      },
    );

    return ListResourceDataSyncResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of the tags assigned to the specified resource.
  ///
  /// May throw [InvalidResourceType].
  /// May throw [InvalidResourceId].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceId] :
  /// The resource ID for which you want to see a list of tags.
  ///
  /// Parameter [resourceType] :
  /// Returns a list of tags for a specific resource type.
  Future<ListTagsForResourceResult> listTagsForResource({
    @_s.required String resourceId,
    @_s.required ResourceTypeForTagging resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ResourceType': resourceType?.toValue() ?? '',
      },
    );

    return ListTagsForResourceResult.fromJson(jsonResponse.body);
  }

  /// Shares a Systems Manager document publicly or privately. If you share a
  /// document privately, you must specify the AWS user account IDs for those
  /// people who can use the document. If you share a document publicly, you
  /// must specify <i>All</i> as the account ID.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidPermissionType].
  /// May throw [DocumentPermissionLimit].
  /// May throw [DocumentLimitExceeded].
  ///
  /// Parameter [name] :
  /// The name of the document that you want to share.
  ///
  /// Parameter [permissionType] :
  /// The permission type for the document. The permission type can be
  /// <i>Share</i>.
  ///
  /// Parameter [accountIdsToAdd] :
  /// The AWS user accounts that should have access to the document. The account
  /// IDs can either be a group of account IDs or <i>All</i>.
  ///
  /// Parameter [accountIdsToRemove] :
  /// The AWS user accounts that should no longer have access to the document.
  /// The AWS user account can either be a group of account IDs or <i>All</i>.
  /// This action has a higher priority than <i>AccountIdsToAdd</i>. If you
  /// specify an account ID to add and the same ID to remove, the system removes
  /// access to the document.
  ///
  /// Parameter [sharedDocumentVersion] :
  /// (Optional) The version of the document to share. If it's not specified,
  /// the system choose the <code>Default</code> version to share.
  Future<void> modifyDocumentPermission({
    @_s.required String name,
    @_s.required DocumentPermissionType permissionType,
    List<String> accountIdsToAdd,
    List<String> accountIdsToRemove,
    String sharedDocumentVersion,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionType, 'permissionType');
    _s.validateStringLength(
      'sharedDocumentVersion',
      sharedDocumentVersion,
      0,
      8,
    );
    _s.validateStringPattern(
      'sharedDocumentVersion',
      sharedDocumentVersion,
      r'''([$]LATEST|[$]DEFAULT|[$]ALL)''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ModifyDocumentPermission'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'PermissionType': permissionType?.toValue() ?? '',
        if (accountIdsToAdd != null) 'AccountIdsToAdd': accountIdsToAdd,
        if (accountIdsToRemove != null)
          'AccountIdsToRemove': accountIdsToRemove,
        if (sharedDocumentVersion != null)
          'SharedDocumentVersion': sharedDocumentVersion,
      },
    );

    return ModifyDocumentPermissionResponse.fromJson(jsonResponse.body);
  }

  /// Registers a compliance type and other compliance details on a designated
  /// resource. This action lets you register custom compliance details with a
  /// resource. This call overwrites existing compliance information on the
  /// resource, so you must provide a full list of compliance items each time
  /// that you send the request.
  ///
  /// ComplianceType can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// ExecutionId: The execution ID when the patch, association, or custom
  /// compliance item was applied.
  /// </li>
  /// <li>
  /// ExecutionType: Specify patch, association, or Custom:<code>string</code>.
  /// </li>
  /// <li>
  /// ExecutionTime. The time the patch, association, or custom compliance item
  /// was applied to the instance.
  /// </li>
  /// <li>
  /// Id: The patch, association, or custom compliance ID.
  /// </li>
  /// <li>
  /// Title: A title.
  /// </li>
  /// <li>
  /// Status: The status of the compliance item. For example,
  /// <code>approved</code> for patches, or <code>Failed</code> for
  /// associations.
  /// </li>
  /// <li>
  /// Severity: A patch severity. For example, <code>critical</code>.
  /// </li>
  /// <li>
  /// DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.
  /// </li>
  /// <li>
  /// DocumentVersion: An SSM document version number. For example, 4.
  /// </li>
  /// <li>
  /// Classification: A patch classification. For example, <code>security
  /// updates</code>.
  /// </li>
  /// <li>
  /// PatchBaselineId: A patch baseline ID.
  /// </li>
  /// <li>
  /// PatchSeverity: A patch severity. For example, <code>Critical</code>.
  /// </li>
  /// <li>
  /// PatchState: A patch state. For example,
  /// <code>InstancesWithFailedPatches</code>.
  /// </li>
  /// <li>
  /// PatchGroup: The name of a patch group.
  /// </li>
  /// <li>
  /// InstalledTime: The time the association, patch, or custom compliance item
  /// was applied to the resource. Specify the time by using the following
  /// format: yyyy-MM-dd'T'HH:mm:ss'Z'
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidItemContentException].
  /// May throw [TotalSizeLimitExceededException].
  /// May throw [ItemSizeLimitExceededException].
  /// May throw [ComplianceTypeCountLimitExceededException].
  /// May throw [InvalidResourceType].
  /// May throw [InvalidResourceId].
  ///
  /// Parameter [complianceType] :
  /// Specify the compliance type. For example, specify Association (for a State
  /// Manager association), Patch, or Custom:<code>string</code>.
  ///
  /// Parameter [executionSummary] :
  /// A summary of the call execution that includes an execution ID, the type of
  /// execution (for example, <code>Command</code>), and the date/time of the
  /// execution using a datetime object that is saved in the following format:
  /// yyyy-MM-dd'T'HH:mm:ss'Z'.
  ///
  /// Parameter [items] :
  /// Information about the compliance as defined by the resource type. For
  /// example, for a patch compliance type, <code>Items</code> includes
  /// information about the PatchSeverity, Classification, and so on.
  ///
  /// Parameter [resourceId] :
  /// Specify an ID for this resource. For a managed instance, this is the
  /// instance ID.
  ///
  /// Parameter [resourceType] :
  /// Specify the type of resource. <code>ManagedInstance</code> is currently
  /// the only supported resource type.
  ///
  /// Parameter [itemContentHash] :
  /// MD5 or SHA-256 content hash. The content hash is used to determine if
  /// existing information should be overwritten or ignored. If the content
  /// hashes match, the request to put compliance information is ignored.
  ///
  /// Parameter [uploadType] :
  /// The mode for uploading compliance items. You can specify
  /// <code>COMPLETE</code> or <code>PARTIAL</code>. In <code>COMPLETE</code>
  /// mode, the system overwrites all existing compliance information for the
  /// resource. You must provide a full list of compliance items each time you
  /// send the request.
  ///
  /// In <code>PARTIAL</code> mode, the system overwrites compliance information
  /// for a specific association. The association must be configured with
  /// <code>SyncCompliance</code> set to <code>MANUAL</code>. By default, all
  /// requests use <code>COMPLETE</code> mode.
  /// <note>
  /// This attribute is only valid for association compliance.
  /// </note>
  Future<void> putComplianceItems({
    @_s.required String complianceType,
    @_s.required ComplianceExecutionSummary executionSummary,
    @_s.required List<ComplianceItemEntry> items,
    @_s.required String resourceId,
    @_s.required String resourceType,
    String itemContentHash,
    ComplianceUploadType uploadType,
  }) async {
    ArgumentError.checkNotNull(complianceType, 'complianceType');
    _s.validateStringLength(
      'complianceType',
      complianceType,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'complianceType',
      complianceType,
      r'''[A-Za-z0-9_\-]\w+|Custom:[a-zA-Z0-9_\-]\w+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(executionSummary, 'executionSummary');
    ArgumentError.checkNotNull(items, 'items');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    _s.validateStringLength(
      'resourceType',
      resourceType,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'itemContentHash',
      itemContentHash,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.PutComplianceItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComplianceType': complianceType,
        'ExecutionSummary': executionSummary,
        'Items': items,
        'ResourceId': resourceId,
        'ResourceType': resourceType,
        if (itemContentHash != null) 'ItemContentHash': itemContentHash,
        if (uploadType != null) 'UploadType': uploadType.toValue(),
      },
    );

    return PutComplianceItemsResult.fromJson(jsonResponse.body);
  }

  /// Bulk update custom inventory items on one more instance. The request adds
  /// an inventory item, if it doesn't already exist, or updates an inventory
  /// item, if it does exist.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidTypeNameException].
  /// May throw [InvalidItemContentException].
  /// May throw [TotalSizeLimitExceededException].
  /// May throw [ItemSizeLimitExceededException].
  /// May throw [ItemContentMismatchException].
  /// May throw [CustomSchemaCountLimitExceededException].
  /// May throw [UnsupportedInventorySchemaVersionException].
  /// May throw [UnsupportedInventoryItemContextException].
  /// May throw [InvalidInventoryItemContextException].
  /// May throw [SubTypeCountLimitExceededException].
  ///
  /// Parameter [instanceId] :
  /// An instance ID where you want to add or update inventory items.
  ///
  /// Parameter [items] :
  /// The inventory items that you want to add or update on instances.
  Future<PutInventoryResult> putInventory({
    @_s.required String instanceId,
    @_s.required List<InventoryItem> items,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(items, 'items');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.PutInventory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'Items': items,
      },
    );

    return PutInventoryResult.fromJson(jsonResponse.body);
  }

  /// Add a parameter to the system.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidKeyId].
  /// May throw [ParameterLimitExceeded].
  /// May throw [TooManyUpdates].
  /// May throw [ParameterAlreadyExists].
  /// May throw [HierarchyLevelLimitExceededException].
  /// May throw [HierarchyTypeMismatchException].
  /// May throw [InvalidAllowedPatternException].
  /// May throw [ParameterMaxVersionLimitExceeded].
  /// May throw [ParameterPatternMismatchException].
  /// May throw [UnsupportedParameterType].
  /// May throw [PoliciesLimitExceededException].
  /// May throw [InvalidPolicyTypeException].
  /// May throw [InvalidPolicyAttributeException].
  /// May throw [IncompatiblePolicyException].
  ///
  /// Parameter [name] :
  /// The fully qualified name of the parameter that you want to add to the
  /// system. The fully qualified name includes the complete hierarchy of the
  /// parameter path and name. For parameters in a hierarchy, you must include a
  /// leading forward slash character (/) when you create or reference a
  /// parameter. For example: <code>/Dev/DBServer/MySQL/db-string13</code>
  ///
  /// Naming Constraints:
  ///
  /// <ul>
  /// <li>
  /// Parameter names are case sensitive.
  /// </li>
  /// <li>
  /// A parameter name must be unique within an AWS Region
  /// </li>
  /// <li>
  /// A parameter name can't be prefixed with "aws" or "ssm" (case-insensitive).
  /// </li>
  /// <li>
  /// Parameter names can include only the following symbols and letters:
  /// <code>a-zA-Z0-9_.-/</code>
  /// </li>
  /// <li>
  /// A parameter name can't include spaces.
  /// </li>
  /// <li>
  /// Parameter hierarchies are limited to a maximum depth of fifteen levels.
  /// </li>
  /// </ul>
  /// For additional information about valid values for parameter names, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html">About
  /// requirements and constraints for parameter names</a> in the <i>AWS Systems
  /// Manager User Guide</i>.
  /// <note>
  /// The maximum length constraint listed below includes capacity for
  /// additional system attributes that are not part of the name. The maximum
  /// length for a parameter name, including the full length of the parameter
  /// ARN, is 1011 characters. For example, the length of the following
  /// parameter name is 65 characters, not 20 characters:
  ///
  /// <code>arn:aws:ssm:us-east-2:111122223333:parameter/ExampleParameterName</code>
  /// </note>
  ///
  /// Parameter [value] :
  /// The parameter value that you want to add to the system. Standard
  /// parameters have a value limit of 4 KB. Advanced parameters have a value
  /// limit of 8 KB.
  /// <note>
  /// Parameters can't be referenced or nested in the values of other
  /// parameters. You can't include <code>{{}}</code> or
  /// <code>{{ssm:<i>parameter-name</i>}}</code> in a parameter value.
  /// </note>
  ///
  /// Parameter [allowedPattern] :
  /// A regular expression used to validate the parameter value. For example,
  /// for String types with values restricted to numbers, you can specify the
  /// following: AllowedPattern=^\d+$
  ///
  /// Parameter [dataType] :
  /// The data type for a <code>String</code> parameter. Supported data types
  /// include plain text and Amazon Machine Image IDs.
  ///
  /// <b>The following data type values are supported.</b>
  ///
  /// <ul>
  /// <li>
  /// <code>text</code>
  /// </li>
  /// <li>
  /// <code>aws:ec2:image</code>
  /// </li>
  /// </ul>
  /// When you create a <code>String</code> parameter and specify
  /// <code>aws:ec2:image</code>, Systems Manager validates the parameter value
  /// is in the required format, such as <code>ami-12345abcdeEXAMPLE</code>, and
  /// that the specified AMI is available in your AWS account. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-ec2-aliases.html">Native
  /// parameter support for Amazon Machine Image IDs</a> in the <i>AWS Systems
  /// Manager User Guide</i>.
  ///
  /// Parameter [description] :
  /// Information about the parameter that you want to add to the system.
  /// Optional but recommended.
  /// <important>
  /// Do not enter personally identifiable information in this field.
  /// </important>
  ///
  /// Parameter [keyId] :
  /// The KMS Key ID that you want to use to encrypt a parameter. Either the
  /// default AWS Key Management Service (AWS KMS) key automatically assigned to
  /// your AWS account or a custom key. Required for parameters that use the
  /// <code>SecureString</code> data type.
  ///
  /// If you don't specify a key ID, the system uses the default key associated
  /// with your AWS account.
  ///
  /// <ul>
  /// <li>
  /// To use your default AWS KMS key, choose the <code>SecureString</code> data
  /// type, and do <i>not</i> specify the <code>Key ID</code> when you create
  /// the parameter. The system automatically populates <code>Key ID</code> with
  /// your default KMS key.
  /// </li>
  /// <li>
  /// To use a custom KMS key, choose the <code>SecureString</code> data type
  /// with the <code>Key ID</code> parameter.
  /// </li>
  /// </ul>
  ///
  /// Parameter [overwrite] :
  /// Overwrite an existing parameter. If not specified, will default to
  /// "false".
  ///
  /// Parameter [policies] :
  /// One or more policies to apply to a parameter. This action takes a JSON
  /// array. Parameter Store supports the following policy types:
  ///
  /// Expiration: This policy deletes the parameter after it expires. When you
  /// create the policy, you specify the expiration date. You can update the
  /// expiration date and time by updating the policy. Updating the
  /// <i>parameter</i> does not affect the expiration date and time. When the
  /// expiration time is reached, Parameter Store deletes the parameter.
  ///
  /// ExpirationNotification: This policy triggers an event in Amazon CloudWatch
  /// Events that notifies you about the expiration. By using this policy, you
  /// can receive notification before or after the expiration time is reached,
  /// in units of days or hours.
  ///
  /// NoChangeNotification: This policy triggers a CloudWatch event if a
  /// parameter has not been modified for a specified period of time. This
  /// policy type is useful when, for example, a secret needs to be changed
  /// within a period of time, but it has not been changed.
  ///
  /// All existing policies are preserved until you send new policies or an
  /// empty policy. For more information about parameter policies, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html">Assigning
  /// parameter policies</a>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. Tags enable you to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag a Systems Manager
  /// parameter to identify the type of resource to which it applies, the
  /// environment, or the type of configuration data referenced by the
  /// parameter. In this case, you could specify the following key name/value
  /// pairs:
  ///
  /// <ul>
  /// <li>
  /// <code>Key=Resource,Value=S3bucket</code>
  /// </li>
  /// <li>
  /// <code>Key=OS,Value=Windows</code>
  /// </li>
  /// <li>
  /// <code>Key=ParameterType,Value=LicenseKey</code>
  /// </li>
  /// </ul> <note>
  /// To add tags to an existing Systems Manager parameter, use the
  /// <a>AddTagsToResource</a> action.
  /// </note>
  ///
  /// Parameter [tier] :
  /// The parameter tier to assign to a parameter.
  ///
  /// Parameter Store offers a standard tier and an advanced tier for
  /// parameters. Standard parameters have a content size limit of 4 KB and
  /// can't be configured to use parameter policies. You can create a maximum of
  /// 10,000 standard parameters for each Region in an AWS account. Standard
  /// parameters are offered at no additional cost.
  ///
  /// Advanced parameters have a content size limit of 8 KB and can be
  /// configured to use parameter policies. You can create a maximum of 100,000
  /// advanced parameters for each Region in an AWS account. Advanced parameters
  /// incur a charge. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html">Standard
  /// and advanced parameter tiers</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// You can change a standard parameter to an advanced parameter any time. But
  /// you can't revert an advanced parameter to a standard parameter. Reverting
  /// an advanced parameter to a standard parameter would result in data loss
  /// because the system would truncate the size of the parameter from 8 KB to 4
  /// KB. Reverting would also remove any policies attached to the parameter.
  /// Lastly, advanced parameters use a different form of encryption than
  /// standard parameters.
  ///
  /// If you no longer need an advanced parameter, or if you no longer want to
  /// incur charges for an advanced parameter, you must delete it and recreate
  /// it as a new standard parameter.
  ///
  /// <b>Using the Default Tier Configuration</b>
  ///
  /// In <code>PutParameter</code> requests, you can specify the tier to create
  /// the parameter in. Whenever you specify a tier in the request, Parameter
  /// Store creates or updates the parameter according to that request. However,
  /// if you do not specify a tier in a request, Parameter Store assigns the
  /// tier based on the current Parameter Store default tier configuration.
  ///
  /// The default tier when you begin using Parameter Store is the
  /// standard-parameter tier. If you use the advanced-parameter tier, you can
  /// specify one of the following as the default:
  ///
  /// <ul>
  /// <li>
  /// <b>Advanced</b>: With this option, Parameter Store evaluates all requests
  /// as advanced parameters.
  /// </li>
  /// <li>
  /// <b>Intelligent-Tiering</b>: With this option, Parameter Store evaluates
  /// each request to determine if the parameter is standard or advanced.
  ///
  /// If the request doesn't include any options that require an advanced
  /// parameter, the parameter is created in the standard-parameter tier. If one
  /// or more options requiring an advanced parameter are included in the
  /// request, Parameter Store create a parameter in the advanced-parameter
  /// tier.
  ///
  /// This approach helps control your parameter-related costs by always
  /// creating standard parameters unless an advanced parameter is necessary.
  /// </li>
  /// </ul>
  /// Options that require an advanced parameter include the following:
  ///
  /// <ul>
  /// <li>
  /// The content size of the parameter is more than 4 KB.
  /// </li>
  /// <li>
  /// The parameter uses a parameter policy.
  /// </li>
  /// <li>
  /// More than 10,000 parameters already exist in your AWS account in the
  /// current Region.
  /// </li>
  /// </ul>
  /// For more information about configuring the default tier option, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/ps-default-tier.html">Specifying
  /// a default parameter tier</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [type] :
  /// The type of parameter that you want to add to the system.
  /// <note>
  /// <code>SecureString</code> is not currently supported for AWS
  /// CloudFormation templates.
  /// </note>
  /// Items in a <code>StringList</code> must be separated by a comma (,). You
  /// can't use other punctuation or special character to escape items in the
  /// list. If you have a parameter value that requires a comma, then use the
  /// <code>String</code> data type.
  /// <important>
  /// Specifying a parameter type is not required when updating a parameter. You
  /// must specify a parameter type when creating a parameter.
  /// </important>
  Future<PutParameterResult> putParameter({
    @_s.required String name,
    @_s.required String value,
    String allowedPattern,
    String dataType,
    String description,
    String keyId,
    bool overwrite,
    String policies,
    List<Tag> tags,
    ParameterTier tier,
    ParameterType type,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(value, 'value');
    _s.validateStringLength(
      'allowedPattern',
      allowedPattern,
      0,
      1024,
    );
    _s.validateStringLength(
      'dataType',
      dataType,
      0,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      256,
    );
    _s.validateStringPattern(
      'keyId',
      keyId,
      r'''^([a-zA-Z0-9:/_-]+)$''',
    );
    _s.validateStringLength(
      'policies',
      policies,
      1,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.PutParameter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Value': value,
        if (allowedPattern != null) 'AllowedPattern': allowedPattern,
        if (dataType != null) 'DataType': dataType,
        if (description != null) 'Description': description,
        if (keyId != null) 'KeyId': keyId,
        if (overwrite != null) 'Overwrite': overwrite,
        if (policies != null) 'Policies': policies,
        if (tags != null) 'Tags': tags,
        if (tier != null) 'Tier': tier.toValue(),
        if (type != null) 'Type': type.toValue(),
      },
    );

    return PutParameterResult.fromJson(jsonResponse.body);
  }

  /// Defines the default patch baseline for the relevant operating system.
  ///
  /// To reset the AWS predefined patch baseline as the default, specify the
  /// full patch baseline ARN as the baseline ID value. For example, for CentOS,
  /// specify
  /// <code>arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed</code>
  /// instead of <code>pb-0574b43a65ea646ed</code>.
  ///
  /// May throw [InvalidResourceId].
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [baselineId] :
  /// The ID of the patch baseline that should be the default patch baseline.
  Future<RegisterDefaultPatchBaselineResult> registerDefaultPatchBaseline({
    @_s.required String baselineId,
  }) async {
    ArgumentError.checkNotNull(baselineId, 'baselineId');
    _s.validateStringLength(
      'baselineId',
      baselineId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baselineId',
      baselineId,
      r'''^[a-zA-Z0-9_\-:/]{20,128}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.RegisterDefaultPatchBaseline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaselineId': baselineId,
      },
    );

    return RegisterDefaultPatchBaselineResult.fromJson(jsonResponse.body);
  }

  /// Registers a patch baseline for a patch group.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [DoesNotExistException].
  /// May throw [InvalidResourceId].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [baselineId] :
  /// The ID of the patch baseline to register the patch group with.
  ///
  /// Parameter [patchGroup] :
  /// The name of the patch group that should be registered with the patch
  /// baseline.
  Future<RegisterPatchBaselineForPatchGroupResult>
      registerPatchBaselineForPatchGroup({
    @_s.required String baselineId,
    @_s.required String patchGroup,
  }) async {
    ArgumentError.checkNotNull(baselineId, 'baselineId');
    _s.validateStringLength(
      'baselineId',
      baselineId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baselineId',
      baselineId,
      r'''^[a-zA-Z0-9_\-:/]{20,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(patchGroup, 'patchGroup');
    _s.validateStringLength(
      'patchGroup',
      patchGroup,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patchGroup',
      patchGroup,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.RegisterPatchBaselineForPatchGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaselineId': baselineId,
        'PatchGroup': patchGroup,
      },
    );

    return RegisterPatchBaselineForPatchGroupResult.fromJson(jsonResponse.body);
  }

  /// Registers a target with a maintenance window.
  ///
  /// May throw [IdempotentParameterMismatch].
  /// May throw [DoesNotExistException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceType] :
  /// The type of target being registered with the maintenance window.
  ///
  /// Parameter [targets] :
  /// The targets to register with the maintenance window. In other words, the
  /// instances to run commands on when the maintenance window runs.
  ///
  /// You can specify targets using instance IDs, resource group names, or tags
  /// that have been applied to instances.
  ///
  /// <b>Example 1</b>: Specify instance IDs
  ///
  /// <code>Key=InstanceIds,Values=<i>instance-id-1</i>,<i>instance-id-2</i>,<i>instance-id-3</i>
  /// </code>
  ///
  /// <b>Example 2</b>: Use tag key-pairs applied to instances
  ///
  /// <code>Key=tag:<i>my-tag-key</i>,Values=<i>my-tag-value-1</i>,<i>my-tag-value-2</i>
  /// </code>
  ///
  /// <b>Example 3</b>: Use tag-keys applied to instances
  ///
  /// <code>Key=tag-key,Values=<i>my-tag-key-1</i>,<i>my-tag-key-2</i> </code>
  ///
  /// <b>Example 4</b>: Use resource group names
  ///
  /// <code>Key=resource-groups:Name,Values=<i>resource-group-name</i> </code>
  ///
  /// <b>Example 5</b>: Use filters for resource group types
  ///
  /// <code>Key=resource-groups:ResourceTypeFilters,Values=<i>resource-type-1</i>,<i>resource-type-2</i>
  /// </code>
  /// <note>
  /// For <code>Key=resource-groups:ResourceTypeFilters</code>, specify resource
  /// types in the following format
  ///
  /// <code>Key=resource-groups:ResourceTypeFilters,Values=<i>AWS::EC2::INSTANCE</i>,<i>AWS::EC2::VPC</i>
  /// </code>
  /// </note>
  /// For more information about these examples formats, including the best use
  /// case for each one, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html">Examples:
  /// Register targets with a maintenance window</a> in the <i>AWS Systems
  /// Manager User Guide</i>.
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window the target should be registered with.
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token.
  ///
  /// Parameter [description] :
  /// An optional description for the target.
  ///
  /// Parameter [name] :
  /// An optional name for the target.
  ///
  /// Parameter [ownerInformation] :
  /// User-provided value that will be included in any CloudWatch events raised
  /// while running tasks for these targets in this maintenance window.
  Future<RegisterTargetWithMaintenanceWindowResult>
      registerTargetWithMaintenanceWindow({
    @_s.required MaintenanceWindowResourceType resourceType,
    @_s.required List<Target> targets,
    @_s.required String windowId,
    String clientToken,
    String description,
    String name,
    String ownerInformation,
  }) async {
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(targets, 'targets');
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    _s.validateStringLength(
      'ownerInformation',
      ownerInformation,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.RegisterTargetWithMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceType': resourceType?.toValue() ?? '',
        'Targets': targets,
        'WindowId': windowId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (ownerInformation != null) 'OwnerInformation': ownerInformation,
      },
    );

    return RegisterTargetWithMaintenanceWindowResult.fromJson(
        jsonResponse.body);
  }

  /// Adds a new task to a maintenance window.
  ///
  /// May throw [IdempotentParameterMismatch].
  /// May throw [DoesNotExistException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [FeatureNotAvailableException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [taskArn] :
  /// The ARN of the task to run.
  ///
  /// Parameter [taskType] :
  /// The type of task being registered.
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window the task should be added to.
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token.
  ///
  /// Parameter [description] :
  /// An optional description for the task.
  ///
  /// Parameter [loggingInfo] :
  /// A structure containing information about an S3 bucket to write
  /// instance-level logs to.
  /// <note>
  /// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
  /// contain logs, instead use the <code>OutputS3BucketName</code> and
  /// <code>OutputS3KeyPrefix</code> options in the
  /// <code>TaskInvocationParameters</code> structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  ///
  /// Parameter [maxConcurrency] :
  /// The maximum number of targets this task can be run for in parallel.
  /// <note>
  /// For maintenance window tasks without a target specified, you cannot supply
  /// a value for this option. Instead, the system inserts a placeholder value
  /// of <code>1</code>. This value does not affect the running of your task.
  /// </note>
  ///
  /// Parameter [maxErrors] :
  /// The maximum number of errors allowed before this task stops being
  /// scheduled.
  /// <note>
  /// For maintenance window tasks without a target specified, you cannot supply
  /// a value for this option. Instead, the system inserts a placeholder value
  /// of <code>1</code>. This value does not affect the running of your task.
  /// </note>
  ///
  /// Parameter [name] :
  /// An optional name for the task.
  ///
  /// Parameter [priority] :
  /// The priority of the task in the maintenance window, the lower the number
  /// the higher the priority. Tasks in a maintenance window are scheduled in
  /// priority order with tasks that have the same priority scheduled in
  /// parallel.
  ///
  /// Parameter [serviceRoleArn] :
  /// The ARN of the IAM service role for Systems Manager to assume when running
  /// a maintenance window task. If you do not specify a service role ARN,
  /// Systems Manager uses your account's service-linked role. If no
  /// service-linked role for Systems Manager exists in your account, it is
  /// created when you run <code>RegisterTaskWithMaintenanceWindow</code>.
  ///
  /// For more information, see the following topics in the in the <i>AWS
  /// Systems Manager User Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html#slr-permissions">Using
  /// service-linked roles for Systems Manager</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html#maintenance-window-tasks-service-role">Should
  /// I use a service-linked role or a custom service role to run maintenance
  /// window tasks? </a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [targets] :
  /// The targets (either instances or maintenance window targets).
  /// <note>
  /// One or more targets must be specified for maintenance window Run
  /// Command-type tasks. Depending on the task, targets are optional for other
  /// maintenance window task types (Automation, AWS Lambda, and AWS Step
  /// Functions). For more information about running tasks that do not specify
  /// targets, see see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html">Registering
  /// maintenance window tasks without targets</a> in the <i>AWS Systems Manager
  /// User Guide</i>.
  /// </note>
  /// Specify instances using the following format:
  ///
  /// <code>Key=InstanceIds,Values=&lt;instance-id-1&gt;,&lt;instance-id-2&gt;</code>
  ///
  /// Specify maintenance window targets using the following format:
  ///
  /// <code>Key=WindowTargetIds,Values=&lt;window-target-id-1&gt;,&lt;window-target-id-2&gt;</code>
  ///
  /// Parameter [taskInvocationParameters] :
  /// The parameters that the task should use during execution. Populate only
  /// the fields that match the task type. All other fields should be empty.
  ///
  /// Parameter [taskParameters] :
  /// The parameters that should be passed to the task when it is run.
  /// <note>
  /// <code>TaskParameters</code> has been deprecated. To specify parameters to
  /// pass to a task when it runs, instead use the <code>Parameters</code>
  /// option in the <code>TaskInvocationParameters</code> structure. For
  /// information about how Systems Manager handles these options for the
  /// supported maintenance window task types, see
  /// <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  Future<RegisterTaskWithMaintenanceWindowResult>
      registerTaskWithMaintenanceWindow({
    @_s.required String taskArn,
    @_s.required MaintenanceWindowTaskType taskType,
    @_s.required String windowId,
    String clientToken,
    String description,
    LoggingInfo loggingInfo,
    String maxConcurrency,
    String maxErrors,
    String name,
    int priority,
    String serviceRoleArn,
    List<Target> targets,
    MaintenanceWindowTaskInvocationParameters taskInvocationParameters,
    Map<String, MaintenanceWindowTaskParameterValueExpression> taskParameters,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskType, 'taskType');
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    _s.validateStringLength(
      'maxConcurrency',
      maxConcurrency,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxConcurrency',
      maxConcurrency,
      r'''^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$''',
    );
    _s.validateStringLength(
      'maxErrors',
      maxErrors,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxErrors',
      maxErrors,
      r'''^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$''',
    );
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    _s.validateNumRange(
      'priority',
      priority,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.RegisterTaskWithMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskArn': taskArn,
        'TaskType': taskType?.toValue() ?? '',
        'WindowId': windowId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (loggingInfo != null) 'LoggingInfo': loggingInfo,
        if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
        if (maxErrors != null) 'MaxErrors': maxErrors,
        if (name != null) 'Name': name,
        if (priority != null) 'Priority': priority,
        if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
        if (targets != null) 'Targets': targets,
        if (taskInvocationParameters != null)
          'TaskInvocationParameters': taskInvocationParameters,
        if (taskParameters != null) 'TaskParameters': taskParameters,
      },
    );

    return RegisterTaskWithMaintenanceWindowResult.fromJson(jsonResponse.body);
  }

  /// Removes tag keys from the specified resource.
  ///
  /// May throw [InvalidResourceType].
  /// May throw [InvalidResourceId].
  /// May throw [InternalServerError].
  /// May throw [TooManyUpdates].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource from which you want to remove tags. For example:
  ///
  /// ManagedInstance: mi-012345abcde
  ///
  /// MaintenanceWindow: mw-012345abcde
  ///
  /// PatchBaseline: pb-012345abcde
  ///
  /// For the Document and Parameter values, use the name of the resource.
  /// <note>
  /// The ManagedInstance type for this API action is only for on-premises
  /// managed instances. Specify the name of the managed instance in the
  /// following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  /// </note>
  ///
  /// Parameter [resourceType] :
  /// The type of resource from which you want to remove a tag.
  /// <note>
  /// The ManagedInstance type for this API action is only for on-premises
  /// managed instances. Specify the name of the managed instance in the
  /// following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  /// </note>
  ///
  /// Parameter [tagKeys] :
  /// Tag keys that you want to remove from the specified resource.
  Future<void> removeTagsFromResource({
    @_s.required String resourceId,
    @_s.required ResourceTypeForTagging resourceType,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.RemoveTagsFromResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ResourceType': resourceType?.toValue() ?? '',
        'TagKeys': tagKeys,
      },
    );

    return RemoveTagsFromResourceResult.fromJson(jsonResponse.body);
  }

  /// <code>ServiceSetting</code> is an account-level setting for an AWS
  /// service. This setting defines how a user interacts with or uses a service
  /// or a feature of a service. For example, if an AWS service charges money to
  /// the account based on feature or service usage, then the AWS service team
  /// might create a default setting of "false". This means the user can't use
  /// this feature unless they change the setting to "true" and intentionally
  /// opt in for a paid feature.
  ///
  /// Services map a <code>SettingId</code> object to a setting value. AWS
  /// services teams define the default value for a <code>SettingId</code>. You
  /// can't create a new <code>SettingId</code>, but you can overwrite the
  /// default value if you have the <code>ssm:UpdateServiceSetting</code>
  /// permission for the setting. Use the <a>GetServiceSetting</a> API action to
  /// view the current value. Use the <a>UpdateServiceSetting</a> API action to
  /// change the default setting.
  ///
  /// Reset the service setting for the account to the default value as
  /// provisioned by the AWS service team.
  ///
  /// May throw [InternalServerError].
  /// May throw [ServiceSettingNotFound].
  /// May throw [TooManyUpdates].
  ///
  /// Parameter [settingId] :
  /// The Amazon Resource Name (ARN) of the service setting to reset. The
  /// setting ID can be
  /// <code>/ssm/parameter-store/default-parameter-tier</code>,
  /// <code>/ssm/parameter-store/high-throughput-enabled</code>, or
  /// <code>/ssm/managed-instance/activation-tier</code>. For example,
  /// <code>arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled</code>.
  Future<ResetServiceSettingResult> resetServiceSetting({
    @_s.required String settingId,
  }) async {
    ArgumentError.checkNotNull(settingId, 'settingId');
    _s.validateStringLength(
      'settingId',
      settingId,
      1,
      1000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ResetServiceSetting'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SettingId': settingId,
      },
    );

    return ResetServiceSettingResult.fromJson(jsonResponse.body);
  }

  /// Reconnects a session to an instance after it has been disconnected.
  /// Connections can be resumed for disconnected sessions, but not terminated
  /// sessions.
  /// <note>
  /// This command is primarily for use by client machines to automatically
  /// reconnect during intermittent network issues. It is not intended for any
  /// other use.
  /// </note>
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [sessionId] :
  /// The ID of the disconnected session to resume.
  Future<ResumeSessionResponse> resumeSession({
    @_s.required String sessionId,
  }) async {
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    _s.validateStringLength(
      'sessionId',
      sessionId,
      1,
      96,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.ResumeSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return ResumeSessionResponse.fromJson(jsonResponse.body);
  }

  /// Sends a signal to an Automation execution to change the current behavior
  /// or status of the execution.
  ///
  /// May throw [AutomationExecutionNotFoundException].
  /// May throw [AutomationStepNotFoundException].
  /// May throw [InvalidAutomationSignalException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [automationExecutionId] :
  /// The unique identifier for an existing Automation execution that you want
  /// to send the signal to.
  ///
  /// Parameter [signalType] :
  /// The type of signal to send to an Automation execution.
  ///
  /// Parameter [payload] :
  /// The data sent with the signal. The data schema depends on the type of
  /// signal used in the request.
  ///
  /// For <code>Approve</code> and <code>Reject</code> signal types, the payload
  /// is an optional comment that you can send with the signal type. For
  /// example:
  ///
  /// <code>Comment="Looks good"</code>
  ///
  /// For <code>StartStep</code> and <code>Resume</code> signal types, you must
  /// send the name of the Automation step to start or resume as the payload.
  /// For example:
  ///
  /// <code>StepName="step1"</code>
  ///
  /// For the <code>StopStep</code> signal type, you must send the step
  /// execution ID as the payload. For example:
  ///
  /// <code>StepExecutionId="97fff367-fc5a-4299-aed8-0123456789ab"</code>
  Future<void> sendAutomationSignal({
    @_s.required String automationExecutionId,
    @_s.required SignalType signalType,
    Map<String, List<String>> payload,
  }) async {
    ArgumentError.checkNotNull(automationExecutionId, 'automationExecutionId');
    _s.validateStringLength(
      'automationExecutionId',
      automationExecutionId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(signalType, 'signalType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.SendAutomationSignal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutomationExecutionId': automationExecutionId,
        'SignalType': signalType?.toValue() ?? '',
        if (payload != null) 'Payload': payload,
      },
    );

    return SendAutomationSignalResult.fromJson(jsonResponse.body);
  }

  /// Runs commands on one or more managed instances.
  ///
  /// May throw [DuplicateInstanceId].
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentVersion].
  /// May throw [InvalidOutputFolder].
  /// May throw [InvalidParameters].
  /// May throw [UnsupportedPlatformType].
  /// May throw [MaxDocumentSizeExceeded].
  /// May throw [InvalidRole].
  /// May throw [InvalidNotificationConfig].
  ///
  /// Parameter [documentName] :
  /// Required. The name of the Systems Manager document to run. This can be a
  /// public document or a custom document.
  ///
  /// Parameter [cloudWatchOutputConfig] :
  /// Enables Systems Manager to send Run Command output to Amazon CloudWatch
  /// Logs.
  ///
  /// Parameter [comment] :
  /// User-specified information about the command, such as a brief description
  /// of what the command should do.
  ///
  /// Parameter [documentHash] :
  /// The Sha256 or Sha1 hash created by the system when the document was
  /// created.
  /// <note>
  /// Sha1 hashes have been deprecated.
  /// </note>
  ///
  /// Parameter [documentHashType] :
  /// Sha256 or Sha1.
  /// <note>
  /// Sha1 hashes have been deprecated.
  /// </note>
  ///
  /// Parameter [documentVersion] :
  /// The SSM document version to use in the request. You can specify $DEFAULT,
  /// $LATEST, or a specific version number. If you run commands by using the
  /// AWS CLI, then you must escape the first two options by using a backslash.
  /// If you specify a version number, then you don't need to use the backslash.
  /// For example:
  ///
  /// --document-version "\$DEFAULT"
  ///
  /// --document-version "\$LATEST"
  ///
  /// --document-version "3"
  ///
  /// Parameter [instanceIds] :
  /// The IDs of the instances where the command should run. Specifying instance
  /// IDs is most useful when you are targeting a limited number of instances,
  /// though you can specify up to 50 IDs.
  ///
  /// To target a larger number of instances, or if you prefer not to list
  /// individual instance IDs, we recommend using the <code>Targets</code>
  /// option instead. Using <code>Targets</code>, which accepts tag key-value
  /// pairs to identify the instances to send commands to, you can a send
  /// command to tens, hundreds, or thousands of instances at once.
  ///
  /// For more information about how to use targets, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html">Using
  /// targets and rate controls to send commands to a fleet</a> in the <i>AWS
  /// Systems Manager User Guide</i>.
  ///
  /// Parameter [maxConcurrency] :
  /// (Optional) The maximum number of instances that are allowed to run the
  /// command at the same time. You can specify a number such as 10 or a
  /// percentage such as 10%. The default value is 50. For more information
  /// about how to use MaxConcurrency, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-velocity">Using
  /// concurrency controls</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [maxErrors] :
  /// The maximum number of errors allowed without the command failing. When the
  /// command fails one more time beyond the value of MaxErrors, the systems
  /// stops sending the command to additional targets. You can specify a number
  /// like 10 or a percentage like 10%. The default value is 0. For more
  /// information about how to use MaxErrors, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-maxerrors">Using
  /// error controls</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [notificationConfig] :
  /// Configurations for sending notifications.
  ///
  /// Parameter [outputS3BucketName] :
  /// The name of the S3 bucket where command execution responses should be
  /// stored.
  ///
  /// Parameter [outputS3KeyPrefix] :
  /// The directory structure within the S3 bucket where the responses should be
  /// stored.
  ///
  /// Parameter [outputS3Region] :
  /// (Deprecated) You can no longer specify this parameter. The system ignores
  /// it. Instead, Systems Manager automatically determines the Region of the S3
  /// bucket.
  ///
  /// Parameter [parameters] :
  /// The required and optional parameters specified in the document being run.
  ///
  /// Parameter [serviceRoleArn] :
  /// The ARN of the IAM service role to use to publish Amazon Simple
  /// Notification Service (Amazon SNS) notifications for Run Command commands.
  ///
  /// Parameter [targets] :
  /// An array of search criteria that targets instances using a
  /// <code>Key,Value</code> combination that you specify. Specifying targets is
  /// most useful when you want to send a command to a large number of instances
  /// at once. Using <code>Targets</code>, which accepts tag key-value pairs to
  /// identify instances, you can send a command to tens, hundreds, or thousands
  /// of instances at once.
  ///
  /// To send a command to a smaller number of instances, you can use the
  /// <code>InstanceIds</code> option instead.
  ///
  /// For more information about how to use targets, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html">Sending
  /// commands to a fleet</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [timeoutSeconds] :
  /// If this time is reached and the command has not already started running,
  /// it will not run.
  Future<SendCommandResult> sendCommand({
    @_s.required String documentName,
    CloudWatchOutputConfig cloudWatchOutputConfig,
    String comment,
    String documentHash,
    DocumentHashType documentHashType,
    String documentVersion,
    List<String> instanceIds,
    String maxConcurrency,
    String maxErrors,
    NotificationConfig notificationConfig,
    String outputS3BucketName,
    String outputS3KeyPrefix,
    String outputS3Region,
    Map<String, List<String>> parameters,
    String serviceRoleArn,
    List<Target> targets,
    int timeoutSeconds,
  }) async {
    ArgumentError.checkNotNull(documentName, 'documentName');
    _s.validateStringPattern(
      'documentName',
      documentName,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'comment',
      comment,
      0,
      100,
    );
    _s.validateStringLength(
      'documentHash',
      documentHash,
      0,
      256,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringLength(
      'maxConcurrency',
      maxConcurrency,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxConcurrency',
      maxConcurrency,
      r'''^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$''',
    );
    _s.validateStringLength(
      'maxErrors',
      maxErrors,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxErrors',
      maxErrors,
      r'''^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$''',
    );
    _s.validateStringLength(
      'outputS3BucketName',
      outputS3BucketName,
      3,
      63,
    );
    _s.validateStringLength(
      'outputS3KeyPrefix',
      outputS3KeyPrefix,
      0,
      500,
    );
    _s.validateStringLength(
      'outputS3Region',
      outputS3Region,
      3,
      20,
    );
    _s.validateNumRange(
      'timeoutSeconds',
      timeoutSeconds,
      30,
      2592000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.SendCommand'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentName': documentName,
        if (cloudWatchOutputConfig != null)
          'CloudWatchOutputConfig': cloudWatchOutputConfig,
        if (comment != null) 'Comment': comment,
        if (documentHash != null) 'DocumentHash': documentHash,
        if (documentHashType != null)
          'DocumentHashType': documentHashType.toValue(),
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (instanceIds != null) 'InstanceIds': instanceIds,
        if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
        if (maxErrors != null) 'MaxErrors': maxErrors,
        if (notificationConfig != null)
          'NotificationConfig': notificationConfig,
        if (outputS3BucketName != null)
          'OutputS3BucketName': outputS3BucketName,
        if (outputS3KeyPrefix != null) 'OutputS3KeyPrefix': outputS3KeyPrefix,
        if (outputS3Region != null) 'OutputS3Region': outputS3Region,
        if (parameters != null) 'Parameters': parameters,
        if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
        if (targets != null) 'Targets': targets,
        if (timeoutSeconds != null) 'TimeoutSeconds': timeoutSeconds,
      },
    );

    return SendCommandResult.fromJson(jsonResponse.body);
  }

  /// Use this API action to run an association immediately and only one time.
  /// This action can be helpful when troubleshooting associations.
  ///
  /// May throw [InvalidAssociation].
  /// May throw [AssociationDoesNotExist].
  ///
  /// Parameter [associationIds] :
  /// The association IDs that you want to run immediately and only one time.
  Future<void> startAssociationsOnce({
    @_s.required List<String> associationIds,
  }) async {
    ArgumentError.checkNotNull(associationIds, 'associationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.StartAssociationsOnce'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationIds': associationIds,
      },
    );

    return StartAssociationsOnceResult.fromJson(jsonResponse.body);
  }

  /// Initiates execution of an Automation document.
  ///
  /// May throw [AutomationDefinitionNotFoundException].
  /// May throw [InvalidAutomationExecutionParametersException].
  /// May throw [AutomationExecutionLimitExceededException].
  /// May throw [AutomationDefinitionVersionNotFoundException].
  /// May throw [IdempotentParameterMismatch].
  /// May throw [InvalidTarget].
  /// May throw [InternalServerError].
  ///
  /// Parameter [documentName] :
  /// The name of the Automation document to use for this execution.
  ///
  /// Parameter [clientToken] :
  /// User-provided idempotency token. The token must be unique, is case
  /// insensitive, enforces the UUID format, and can't be reused.
  ///
  /// Parameter [documentVersion] :
  /// The version of the Automation document to use for this execution.
  ///
  /// Parameter [maxConcurrency] :
  /// The maximum number of targets allowed to run this task in parallel. You
  /// can specify a number, such as 10, or a percentage, such as 10%. The
  /// default value is 10.
  ///
  /// Parameter [maxErrors] :
  /// The number of errors that are allowed before the system stops running the
  /// automation on additional targets. You can specify either an absolute
  /// number of errors, for example 10, or a percentage of the target set, for
  /// example 10%. If you specify 3, for example, the system stops running the
  /// automation when the fourth error is received. If you specify 0, then the
  /// system stops running the automation on additional targets after the first
  /// error result is returned. If you run an automation on 50 resources and set
  /// max-errors to 10%, then the system stops running the automation on
  /// additional targets when the sixth error is received.
  ///
  /// Executions that are already running an automation when max-errors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set max-concurrency to 1 so the executions proceed one
  /// at a time.
  ///
  /// Parameter [mode] :
  /// The execution mode of the automation. Valid modes include the following:
  /// Auto and Interactive. The default mode is Auto.
  ///
  /// Parameter [parameters] :
  /// A key-value map of execution parameters, which match the declared
  /// parameters in the Automation document.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. You can specify a maximum
  /// of five tags for an automation. Tags enable you to categorize a resource
  /// in different ways, such as by purpose, owner, or environment. For example,
  /// you might want to tag an automation to identify an environment or
  /// operating system. In this case, you could specify the following key
  /// name/value pairs:
  ///
  /// <ul>
  /// <li>
  /// <code>Key=environment,Value=test</code>
  /// </li>
  /// <li>
  /// <code>Key=OS,Value=Windows</code>
  /// </li>
  /// </ul> <note>
  /// To add tags to an existing patch baseline, use the
  /// <a>AddTagsToResource</a> action.
  /// </note>
  ///
  /// Parameter [targetLocations] :
  /// A location is a combination of AWS Regions and/or AWS accounts where you
  /// want to run the Automation. Use this action to start an Automation in
  /// multiple Regions and multiple accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html">Running
  /// Automation workflows in multiple AWS Regions and accounts</a> in the
  /// <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [targetMaps] :
  /// A key-value mapping of document parameters to target resources. Both
  /// Targets and TargetMaps cannot be specified together.
  ///
  /// Parameter [targetParameterName] :
  /// The name of the parameter used as the target resource for the
  /// rate-controlled execution. Required if you specify targets.
  ///
  /// Parameter [targets] :
  /// A key-value mapping to target resources. Required if you specify
  /// TargetParameterName.
  Future<StartAutomationExecutionResult> startAutomationExecution({
    @_s.required String documentName,
    String clientToken,
    String documentVersion,
    String maxConcurrency,
    String maxErrors,
    ExecutionMode mode,
    Map<String, List<String>> parameters,
    List<Tag> tags,
    List<TargetLocation> targetLocations,
    List<Map<String, List<String>>> targetMaps,
    String targetParameterName,
    List<Target> targets,
  }) async {
    ArgumentError.checkNotNull(documentName, 'documentName');
    _s.validateStringPattern(
      'documentName',
      documentName,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}''',
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringLength(
      'maxConcurrency',
      maxConcurrency,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxConcurrency',
      maxConcurrency,
      r'''^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$''',
    );
    _s.validateStringLength(
      'maxErrors',
      maxErrors,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxErrors',
      maxErrors,
      r'''^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$''',
    );
    _s.validateStringLength(
      'targetParameterName',
      targetParameterName,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.StartAutomationExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentName': documentName,
        if (clientToken != null) 'ClientToken': clientToken,
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
        if (maxErrors != null) 'MaxErrors': maxErrors,
        if (mode != null) 'Mode': mode.toValue(),
        if (parameters != null) 'Parameters': parameters,
        if (tags != null) 'Tags': tags,
        if (targetLocations != null) 'TargetLocations': targetLocations,
        if (targetMaps != null) 'TargetMaps': targetMaps,
        if (targetParameterName != null)
          'TargetParameterName': targetParameterName,
        if (targets != null) 'Targets': targets,
      },
    );

    return StartAutomationExecutionResult.fromJson(jsonResponse.body);
  }

  /// Creates a change request for Change Manager. The runbooks (Automation
  /// documents) specified in the change request run only after all required
  /// approvals for the change request have been received.
  ///
  /// May throw [AutomationDefinitionNotFoundException].
  /// May throw [InvalidAutomationExecutionParametersException].
  /// May throw [AutomationExecutionLimitExceededException].
  /// May throw [AutomationDefinitionVersionNotFoundException].
  /// May throw [IdempotentParameterMismatch].
  /// May throw [InternalServerError].
  /// May throw [AutomationDefinitionNotApprovedException].
  ///
  /// Parameter [documentName] :
  /// The name of the change template document to run during the runbook
  /// workflow.
  ///
  /// Parameter [runbooks] :
  /// Information about the Automation runbooks (Automation documents) that are
  /// run during the runbook workflow.
  /// <note>
  /// The Automation runbooks specified for the runbook workflow can't run until
  /// all required approvals for the change request have been received.
  /// </note>
  ///
  /// Parameter [changeRequestName] :
  /// The name of the change request associated with the runbook workflow to be
  /// run.
  ///
  /// Parameter [clientToken] :
  /// The user-provided idempotency token. The token must be unique, is case
  /// insensitive, enforces the UUID format, and can't be reused.
  ///
  /// Parameter [documentVersion] :
  /// The version of the change template document to run during the runbook
  /// workflow.
  ///
  /// Parameter [parameters] :
  /// A key-value map of parameters that match the declared parameters in the
  /// change template document.
  ///
  /// Parameter [scheduledTime] :
  /// The date and time specified in the change request to run the Automation
  /// runbooks.
  /// <note>
  /// The Automation runbooks specified for the runbook workflow can't run until
  /// all required approvals for the change request have been received.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. You can specify a maximum
  /// of five tags for a change request. Tags enable you to categorize a
  /// resource in different ways, such as by purpose, owner, or environment. For
  /// example, you might want to tag a change request to identify an environment
  /// or target AWS Region. In this case, you could specify the following
  /// key-value pairs:
  ///
  /// <ul>
  /// <li>
  /// <code>Key=Environment,Value=Production</code>
  /// </li>
  /// <li>
  /// <code>Key=Region,Value=us-east-2</code>
  /// </li>
  /// </ul>
  Future<StartChangeRequestExecutionResult> startChangeRequestExecution({
    @_s.required String documentName,
    @_s.required List<Runbook> runbooks,
    String changeRequestName,
    String clientToken,
    String documentVersion,
    Map<String, List<String>> parameters,
    DateTime scheduledTime,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(documentName, 'documentName');
    _s.validateStringPattern(
      'documentName',
      documentName,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runbooks, 'runbooks');
    _s.validateStringLength(
      'changeRequestName',
      changeRequestName,
      1,
      1024,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}''',
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.StartChangeRequestExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentName': documentName,
        'Runbooks': runbooks,
        if (changeRequestName != null) 'ChangeRequestName': changeRequestName,
        if (clientToken != null) 'ClientToken': clientToken,
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (parameters != null) 'Parameters': parameters,
        if (scheduledTime != null)
          'ScheduledTime': unixTimestampToJson(scheduledTime),
        if (tags != null) 'Tags': tags,
      },
    );

    return StartChangeRequestExecutionResult.fromJson(jsonResponse.body);
  }

  /// Initiates a connection to a target (for example, an instance) for a
  /// Session Manager session. Returns a URL and token that can be used to open
  /// a WebSocket connection for sending input and receiving outputs.
  /// <note>
  /// AWS CLI usage: <code>start-session</code> is an interactive command that
  /// requires the Session Manager plugin to be installed on the client machine
  /// making the call. For information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install
  /// the Session Manager plugin for the AWS CLI</a> in the <i>AWS Systems
  /// Manager User Guide</i>.
  ///
  /// AWS Tools for PowerShell usage: Start-SSMSession is not currently
  /// supported by AWS Tools for PowerShell on Windows local machines.
  /// </note>
  ///
  /// May throw [InvalidDocument].
  /// May throw [TargetNotConnected].
  /// May throw [InternalServerError].
  ///
  /// Parameter [target] :
  /// The instance to connect to for the session.
  ///
  /// Parameter [documentName] :
  /// The name of the SSM document to define the parameters and plugin settings
  /// for the session. For example, <code>SSM-SessionManagerRunShell</code>. You
  /// can call the <a>GetDocument</a> API to verify the document exists before
  /// attempting to start a session. If no document name is provided, a shell to
  /// the instance is launched by default.
  ///
  /// Parameter [parameters] :
  /// Reserved for future use.
  Future<StartSessionResponse> startSession({
    @_s.required String target,
    String documentName,
    Map<String, List<String>> parameters,
  }) async {
    ArgumentError.checkNotNull(target, 'target');
    _s.validateStringLength(
      'target',
      target,
      1,
      400,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentName',
      documentName,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.StartSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Target': target,
        if (documentName != null) 'DocumentName': documentName,
        if (parameters != null) 'Parameters': parameters,
      },
    );

    return StartSessionResponse.fromJson(jsonResponse.body);
  }

  /// Stop an Automation that is currently running.
  ///
  /// May throw [AutomationExecutionNotFoundException].
  /// May throw [InvalidAutomationStatusUpdateException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [automationExecutionId] :
  /// The execution ID of the Automation to stop.
  ///
  /// Parameter [type] :
  /// The stop request type. Valid types include the following: Cancel and
  /// Complete. The default type is Cancel.
  Future<void> stopAutomationExecution({
    @_s.required String automationExecutionId,
    StopType type,
  }) async {
    ArgumentError.checkNotNull(automationExecutionId, 'automationExecutionId');
    _s.validateStringLength(
      'automationExecutionId',
      automationExecutionId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.StopAutomationExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutomationExecutionId': automationExecutionId,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return StopAutomationExecutionResult.fromJson(jsonResponse.body);
  }

  /// Permanently ends a session and closes the data connection between the
  /// Session Manager client and SSM Agent on the instance. A terminated session
  /// cannot be resumed.
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [sessionId] :
  /// The ID of the session to terminate.
  Future<TerminateSessionResponse> terminateSession({
    @_s.required String sessionId,
  }) async {
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    _s.validateStringLength(
      'sessionId',
      sessionId,
      1,
      96,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.TerminateSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return TerminateSessionResponse.fromJson(jsonResponse.body);
  }

  /// Updates an association. You can update the association name and version,
  /// the document version, schedule, parameters, and Amazon S3 output.
  ///
  /// In order to call this API action, your IAM user account, group, or role
  /// must be configured with permission to call the <a>DescribeAssociation</a>
  /// API action. If you don't have permission to call DescribeAssociation, then
  /// you receive the following error: <code>An error occurred
  /// (AccessDeniedException) when calling the UpdateAssociation operation:
  /// User: &lt;user_arn&gt; is not authorized to perform:
  /// ssm:DescribeAssociation on resource: &lt;resource_arn&gt;</code>
  /// <important>
  /// When you update an association, the association immediately runs against
  /// the specified targets.
  /// </important>
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidSchedule].
  /// May throw [InvalidParameters].
  /// May throw [InvalidOutputLocation].
  /// May throw [InvalidDocumentVersion].
  /// May throw [AssociationDoesNotExist].
  /// May throw [InvalidUpdate].
  /// May throw [TooManyUpdates].
  /// May throw [InvalidDocument].
  /// May throw [InvalidTarget].
  /// May throw [InvalidAssociationVersion].
  /// May throw [AssociationVersionLimitExceeded].
  ///
  /// Parameter [associationId] :
  /// The ID of the association you want to update.
  ///
  /// Parameter [applyOnlyAtCronInterval] :
  /// By default, when you update an association, the system runs it immediately
  /// after it is updated and then according to the schedule you specified.
  /// Specify this option if you don't want an association to run immediately
  /// after you update it. This parameter is not supported for rate expressions.
  ///
  /// Also, if you specified this option when you created the association, you
  /// can reset it. To do so, specify the
  /// <code>no-apply-only-at-cron-interval</code> parameter when you update the
  /// association from the command line. This parameter forces the association
  /// to run immediately after updating it and according to the interval
  /// specified.
  ///
  /// Parameter [associationName] :
  /// The name of the association that you want to update.
  ///
  /// Parameter [associationVersion] :
  /// This parameter is provided for concurrency control purposes. You must
  /// specify the latest association version in the service. If you want to
  /// ensure that this request succeeds, either specify <code>$LATEST</code>, or
  /// omit this parameter.
  ///
  /// Parameter [automationTargetParameterName] :
  /// Specify the target for the association. This target is required for
  /// associations that use an Automation document and target resources by using
  /// rate controls.
  ///
  /// Parameter [complianceSeverity] :
  /// The severity level to assign to the association.
  ///
  /// Parameter [documentVersion] :
  /// The document version you want update for the association.
  ///
  /// Parameter [maxConcurrency] :
  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will
  /// process its association within the limit specified for MaxConcurrency.
  ///
  /// Parameter [maxErrors] :
  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of
  /// the target set, for example 10%. If you specify 3, for example, the system
  /// stops sending requests when the fourth error is received. If you specify
  /// 0, then the system stops sending requests after the first error is
  /// returned. If you run an association on 50 instances and set MaxError to
  /// 10%, then the system stops sending the request when the sixth error is
  /// received.
  ///
  /// Executions that are already running an association when MaxErrors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set MaxConcurrency to 1 so that executions proceed one
  /// at a time.
  ///
  /// Parameter [name] :
  /// The name of the SSM document that contains the configuration information
  /// for the instance. You can specify Command or Automation documents.
  ///
  /// You can specify AWS-predefined documents, documents you created, or a
  /// document that is shared with you from another account.
  ///
  /// For SSM documents that are shared with you from other AWS accounts, you
  /// must specify the complete SSM document ARN, in the following format:
  ///
  /// <code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:document/<i>document-name</i>
  /// </code>
  ///
  /// For example:
  ///
  /// <code>arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document</code>
  ///
  /// For AWS-predefined documents and SSM documents you created in your
  /// account, you only need to specify the document name. For example,
  /// <code>AWS-ApplyPatchBaseline</code> or <code>My-Document</code>.
  ///
  /// Parameter [outputLocation] :
  /// An S3 bucket where you want to store the results of this request.
  ///
  /// Parameter [parameters] :
  /// The parameters you want to update for the association. If you create a
  /// parameter using Parameter Store, you can reference the parameter using
  /// {{ssm:parameter-name}}
  ///
  /// Parameter [scheduleExpression] :
  /// The cron expression used to schedule the association that you want to
  /// update.
  ///
  /// Parameter [syncCompliance] :
  /// The mode for generating association compliance. You can specify
  /// <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the
  /// system uses the status of the association execution to determine the
  /// compliance status. If the association execution runs successfully, then
  /// the association is <code>COMPLIANT</code>. If the association execution
  /// doesn't run successfully, the association is <code>NON-COMPLIANT</code>.
  ///
  /// In <code>MANUAL</code> mode, you must specify the
  /// <code>AssociationId</code> as a parameter for the
  /// <a>PutComplianceItems</a> API action. In this case, compliance data is not
  /// managed by State Manager. It is managed by your direct call to the
  /// <a>PutComplianceItems</a> API action.
  ///
  /// By default, all associations use <code>AUTO</code> mode.
  ///
  /// Parameter [targetLocations] :
  /// A location is a combination of AWS Regions and AWS accounts where you want
  /// to run the association. Use this action to update an association in
  /// multiple Regions and multiple accounts.
  ///
  /// Parameter [targets] :
  /// The targets of the association.
  Future<UpdateAssociationResult> updateAssociation({
    @_s.required String associationId,
    bool applyOnlyAtCronInterval,
    String associationName,
    String associationVersion,
    String automationTargetParameterName,
    AssociationComplianceSeverity complianceSeverity,
    String documentVersion,
    String maxConcurrency,
    String maxErrors,
    String name,
    InstanceAssociationOutputLocation outputLocation,
    Map<String, List<String>> parameters,
    String scheduleExpression,
    AssociationSyncCompliance syncCompliance,
    List<TargetLocation> targetLocations,
    List<Target> targets,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringPattern(
      'associationId',
      associationId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'associationName',
      associationName,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    _s.validateStringPattern(
      'associationVersion',
      associationVersion,
      r'''([$]LATEST)|([1-9][0-9]*)''',
    );
    _s.validateStringLength(
      'automationTargetParameterName',
      automationTargetParameterName,
      1,
      50,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringLength(
      'maxConcurrency',
      maxConcurrency,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxConcurrency',
      maxConcurrency,
      r'''^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$''',
    );
    _s.validateStringLength(
      'maxErrors',
      maxErrors,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxErrors',
      maxErrors,
      r'''^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$''',
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
    );
    _s.validateStringLength(
      'scheduleExpression',
      scheduleExpression,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationId': associationId,
        if (applyOnlyAtCronInterval != null)
          'ApplyOnlyAtCronInterval': applyOnlyAtCronInterval,
        if (associationName != null) 'AssociationName': associationName,
        if (associationVersion != null)
          'AssociationVersion': associationVersion,
        if (automationTargetParameterName != null)
          'AutomationTargetParameterName': automationTargetParameterName,
        if (complianceSeverity != null)
          'ComplianceSeverity': complianceSeverity.toValue(),
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
        if (maxErrors != null) 'MaxErrors': maxErrors,
        if (name != null) 'Name': name,
        if (outputLocation != null) 'OutputLocation': outputLocation,
        if (parameters != null) 'Parameters': parameters,
        if (scheduleExpression != null)
          'ScheduleExpression': scheduleExpression,
        if (syncCompliance != null) 'SyncCompliance': syncCompliance.toValue(),
        if (targetLocations != null) 'TargetLocations': targetLocations,
        if (targets != null) 'Targets': targets,
      },
    );

    return UpdateAssociationResult.fromJson(jsonResponse.body);
  }

  /// Updates the status of the Systems Manager document associated with the
  /// specified instance.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidInstanceId].
  /// May throw [InvalidDocument].
  /// May throw [AssociationDoesNotExist].
  /// May throw [StatusUnchanged].
  /// May throw [TooManyUpdates].
  ///
  /// Parameter [associationStatus] :
  /// The association status.
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance.
  ///
  /// Parameter [name] :
  /// The name of the Systems Manager document.
  Future<UpdateAssociationStatusResult> updateAssociationStatus({
    @_s.required AssociationStatus associationStatus,
    @_s.required String instanceId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(associationStatus, 'associationStatus');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.:/]{3,128}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateAssociationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationStatus': associationStatus,
        'InstanceId': instanceId,
        'Name': name,
      },
    );

    return UpdateAssociationStatusResult.fromJson(jsonResponse.body);
  }

  /// Updates one or more values for an SSM document.
  ///
  /// May throw [MaxDocumentSizeExceeded].
  /// May throw [DocumentVersionLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [DuplicateDocumentContent].
  /// May throw [DuplicateDocumentVersionName].
  /// May throw [InvalidDocumentContent].
  /// May throw [InvalidDocumentVersion].
  /// May throw [InvalidDocumentSchemaVersion].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentOperation].
  ///
  /// Parameter [content] :
  /// A valid JSON or YAML string.
  ///
  /// Parameter [name] :
  /// The name of the document that you want to update.
  ///
  /// Parameter [attachments] :
  /// A list of key and value pairs that describe attachments to a version of a
  /// document.
  ///
  /// Parameter [documentFormat] :
  /// Specify the document format for the new document version. Systems Manager
  /// supports JSON and YAML documents. JSON is the default format.
  ///
  /// Parameter [documentVersion] :
  /// (Required) The latest version of the document that you want to update. The
  /// latest document version can be specified using the $LATEST variable or by
  /// the version number. Updating a previous version of a document is not
  /// supported.
  ///
  /// Parameter [targetType] :
  /// Specify a new target type for the document.
  ///
  /// Parameter [versionName] :
  /// An optional field specifying the version of the artifact you are updating
  /// with the document. For example, "Release 12, Update 6". This value is
  /// unique across all versions of a document, and cannot be changed.
  Future<UpdateDocumentResult> updateDocument({
    @_s.required String content,
    @_s.required String name,
    List<AttachmentsSource> attachments,
    DocumentFormat documentFormat,
    String documentVersion,
    String targetType,
    String versionName,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    _s.validateStringLength(
      'content',
      content,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    _s.validateStringLength(
      'targetType',
      targetType,
      0,
      200,
    );
    _s.validateStringPattern(
      'targetType',
      targetType,
      r'''^\/[\w\.\-\:\/]*$''',
    );
    _s.validateStringPattern(
      'versionName',
      versionName,
      r'''^[a-zA-Z0-9_\-.]{1,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Content': content,
        'Name': name,
        if (attachments != null) 'Attachments': attachments,
        if (documentFormat != null) 'DocumentFormat': documentFormat.toValue(),
        if (documentVersion != null) 'DocumentVersion': documentVersion,
        if (targetType != null) 'TargetType': targetType,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return UpdateDocumentResult.fromJson(jsonResponse.body);
  }

  /// Set the default version of a document.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentVersion].
  /// May throw [InvalidDocumentSchemaVersion].
  ///
  /// Parameter [documentVersion] :
  /// The version of a custom document that you want to set as the default
  /// version.
  ///
  /// Parameter [name] :
  /// The name of a custom document that you want to set as the default version.
  Future<UpdateDocumentDefaultVersionResult> updateDocumentDefaultVersion({
    @_s.required String documentVersion,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(documentVersion, 'documentVersion');
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''(^[1-9][0-9]*$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateDocumentDefaultVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentVersion': documentVersion,
        'Name': name,
      },
    );

    return UpdateDocumentDefaultVersionResult.fromJson(jsonResponse.body);
  }

  /// Updates information related to approval reviews for a specific version of
  /// a document.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidDocument].
  /// May throw [InvalidDocumentOperation].
  /// May throw [InvalidDocumentVersion].
  ///
  /// Parameter [documentReviews] :
  /// The document review details to update.
  ///
  /// Parameter [name] :
  /// The name of the document for which a version is to be updated.
  ///
  /// Parameter [documentVersion] :
  /// The version of a document to update.
  Future<void> updateDocumentMetadata({
    @_s.required DocumentReviews documentReviews,
    @_s.required String name,
    String documentVersion,
  }) async {
    ArgumentError.checkNotNull(documentReviews, 'documentReviews');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentVersion',
      documentVersion,
      r'''([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateDocumentMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentReviews': documentReviews,
        'Name': name,
        if (documentVersion != null) 'DocumentVersion': documentVersion,
      },
    );

    return UpdateDocumentMetadataResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing maintenance window. Only specified parameters are
  /// modified.
  /// <note>
  /// The value you specify for <code>Duration</code> determines the specific
  /// end time for the maintenance window based on the time it begins. No
  /// maintenance window tasks are permitted to start after the resulting
  /// endtime minus the number of hours you specify for <code>Cutoff</code>. For
  /// example, if the maintenance window starts at 3 PM, the duration is three
  /// hours, and the value you specify for <code>Cutoff</code> is one hour, no
  /// maintenance window tasks can start after 5 PM.
  /// </note>
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The ID of the maintenance window to update.
  ///
  /// Parameter [allowUnassociatedTargets] :
  /// Whether targets must be registered with the maintenance window before
  /// tasks can be defined for those targets.
  ///
  /// Parameter [cutoff] :
  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  ///
  /// Parameter [description] :
  /// An optional description for the update request.
  ///
  /// Parameter [duration] :
  /// The duration of the maintenance window in hours.
  ///
  /// Parameter [enabled] :
  /// Whether the maintenance window is enabled.
  ///
  /// Parameter [endDate] :
  /// The date and time, in ISO-8601 Extended format, for when you want the
  /// maintenance window to become inactive. EndDate allows you to set a date
  /// and time in the future when the maintenance window will no longer run.
  ///
  /// Parameter [name] :
  /// The name of the maintenance window.
  ///
  /// Parameter [replace] :
  /// If True, then all fields that are required by the CreateMaintenanceWindow
  /// action are also required for this API request. Optional fields that are
  /// not specified are set to null.
  ///
  /// Parameter [schedule] :
  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  ///
  /// Parameter [scheduleOffset] :
  /// The number of days to wait after the date and time specified by a CRON
  /// expression before running the maintenance window.
  ///
  /// For example, the following cron expression schedules a maintenance window
  /// to run the third Tuesday of every month at 11:30 PM.
  ///
  /// <code>cron(30 23 ? * TUE#3 *)</code>
  ///
  /// If the schedule offset is <code>2</code>, the maintenance window won't run
  /// until two days later.
  ///
  /// Parameter [scheduleTimezone] :
  /// The time zone that the scheduled maintenance window executions are based
  /// on, in Internet Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see
  /// the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on
  /// the IANA website.
  ///
  /// Parameter [startDate] :
  /// The time zone that the scheduled maintenance window executions are based
  /// on, in Internet Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see
  /// the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on
  /// the IANA website.
  Future<UpdateMaintenanceWindowResult> updateMaintenanceWindow({
    @_s.required String windowId,
    bool allowUnassociatedTargets,
    int cutoff,
    String description,
    int duration,
    bool enabled,
    String endDate,
    String name,
    bool replace,
    String schedule,
    int scheduleOffset,
    String scheduleTimezone,
    String startDate,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'cutoff',
      cutoff,
      0,
      23,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    _s.validateNumRange(
      'duration',
      duration,
      1,
      24,
    );
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    _s.validateStringLength(
      'schedule',
      schedule,
      1,
      256,
    );
    _s.validateNumRange(
      'scheduleOffset',
      scheduleOffset,
      1,
      6,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateMaintenanceWindow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        if (allowUnassociatedTargets != null)
          'AllowUnassociatedTargets': allowUnassociatedTargets,
        if (cutoff != null) 'Cutoff': cutoff,
        if (description != null) 'Description': description,
        if (duration != null) 'Duration': duration,
        if (enabled != null) 'Enabled': enabled,
        if (endDate != null) 'EndDate': endDate,
        if (name != null) 'Name': name,
        if (replace != null) 'Replace': replace,
        if (schedule != null) 'Schedule': schedule,
        if (scheduleOffset != null) 'ScheduleOffset': scheduleOffset,
        if (scheduleTimezone != null) 'ScheduleTimezone': scheduleTimezone,
        if (startDate != null) 'StartDate': startDate,
      },
    );

    return UpdateMaintenanceWindowResult.fromJson(jsonResponse.body);
  }

  /// Modifies the target of an existing maintenance window. You can change the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Name
  /// </li>
  /// <li>
  /// Description
  /// </li>
  /// <li>
  /// Owner
  /// </li>
  /// <li>
  /// IDs for an ID target
  /// </li>
  /// <li>
  /// Tags for a Tag target
  /// </li>
  /// <li>
  /// From any supported tag type to another. The three supported tag types are
  /// ID target, Tag target, and resource group. For more information, see
  /// <a>Target</a>.
  /// </li>
  /// </ul> <note>
  /// If a parameter is null, then the corresponding field is not modified.
  /// </note>
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The maintenance window ID with which to modify the target.
  ///
  /// Parameter [windowTargetId] :
  /// The target ID to modify.
  ///
  /// Parameter [description] :
  /// An optional description for the update.
  ///
  /// Parameter [name] :
  /// A name for the update.
  ///
  /// Parameter [ownerInformation] :
  /// User-provided value that will be included in any CloudWatch events raised
  /// while running tasks for these targets in this maintenance window.
  ///
  /// Parameter [replace] :
  /// If True, then all fields that are required by the
  /// RegisterTargetWithMaintenanceWindow action are also required for this API
  /// request. Optional fields that are not specified are set to null.
  ///
  /// Parameter [targets] :
  /// The targets to add or replace.
  Future<UpdateMaintenanceWindowTargetResult> updateMaintenanceWindowTarget({
    @_s.required String windowId,
    @_s.required String windowTargetId,
    String description,
    String name,
    String ownerInformation,
    bool replace,
    List<Target> targets,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowTargetId, 'windowTargetId');
    _s.validateStringLength(
      'windowTargetId',
      windowTargetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowTargetId',
      windowTargetId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    _s.validateStringLength(
      'ownerInformation',
      ownerInformation,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateMaintenanceWindowTarget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        'WindowTargetId': windowTargetId,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (ownerInformation != null) 'OwnerInformation': ownerInformation,
        if (replace != null) 'Replace': replace,
        if (targets != null) 'Targets': targets,
      },
    );

    return UpdateMaintenanceWindowTargetResult.fromJson(jsonResponse.body);
  }

  /// Modifies a task assigned to a maintenance window. You can't change the
  /// task type, but you can change the following values:
  ///
  /// <ul>
  /// <li>
  /// TaskARN. For example, you can change a RUN_COMMAND task from
  /// AWS-RunPowerShellScript to AWS-RunShellScript.
  /// </li>
  /// <li>
  /// ServiceRoleArn
  /// </li>
  /// <li>
  /// TaskInvocationParameters
  /// </li>
  /// <li>
  /// Priority
  /// </li>
  /// <li>
  /// MaxConcurrency
  /// </li>
  /// <li>
  /// MaxErrors
  /// </li>
  /// </ul> <note>
  /// One or more targets must be specified for maintenance window Run
  /// Command-type tasks. Depending on the task, targets are optional for other
  /// maintenance window task types (Automation, AWS Lambda, and AWS Step
  /// Functions). For more information about running tasks that do not specify
  /// targets, see see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html">Registering
  /// maintenance window tasks without targets</a> in the <i>AWS Systems Manager
  /// User Guide</i>.
  /// </note>
  /// If the value for a parameter in <code>UpdateMaintenanceWindowTask</code>
  /// is null, then the corresponding field is not modified. If you set
  /// <code>Replace</code> to true, then all fields required by the
  /// <a>RegisterTaskWithMaintenanceWindow</a> action are required for this
  /// request. Optional fields that aren't specified are set to null.
  /// <important>
  /// When you update a maintenance window task that has options specified in
  /// <code>TaskInvocationParameters</code>, you must provide again all the
  /// <code>TaskInvocationParameters</code> values that you want to retain. The
  /// values you do not specify again are removed. For example, suppose that
  /// when you registered a Run Command task, you specified
  /// <code>TaskInvocationParameters</code> values for <code>Comment</code>,
  /// <code>NotificationConfig</code>, and <code>OutputS3BucketName</code>. If
  /// you update the maintenance window task and specify only a different
  /// <code>OutputS3BucketName</code> value, the values for <code>Comment</code>
  /// and <code>NotificationConfig</code> are removed.
  /// </important>
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [windowId] :
  /// The maintenance window ID that contains the task to modify.
  ///
  /// Parameter [windowTaskId] :
  /// The task ID to modify.
  ///
  /// Parameter [description] :
  /// The new task description to specify.
  ///
  /// Parameter [loggingInfo] :
  /// The new logging location in Amazon S3 to specify.
  /// <note>
  /// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
  /// contain logs, instead use the <code>OutputS3BucketName</code> and
  /// <code>OutputS3KeyPrefix</code> options in the
  /// <code>TaskInvocationParameters</code> structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  ///
  /// Parameter [maxConcurrency] :
  /// The new <code>MaxConcurrency</code> value you want to specify.
  /// <code>MaxConcurrency</code> is the number of targets that are allowed to
  /// run this task in parallel.
  /// <note>
  /// For maintenance window tasks without a target specified, you cannot supply
  /// a value for this option. Instead, the system inserts a placeholder value
  /// of <code>1</code>, which may be reported in the response to this command.
  /// This value does not affect the running of your task and can be ignored.
  /// </note>
  ///
  /// Parameter [maxErrors] :
  /// The new <code>MaxErrors</code> value to specify. <code>MaxErrors</code> is
  /// the maximum number of errors that are allowed before the task stops being
  /// scheduled.
  /// <note>
  /// For maintenance window tasks without a target specified, you cannot supply
  /// a value for this option. Instead, the system inserts a placeholder value
  /// of <code>1</code>, which may be reported in the response to this command.
  /// This value does not affect the running of your task and can be ignored.
  /// </note>
  ///
  /// Parameter [name] :
  /// The new task name to specify.
  ///
  /// Parameter [priority] :
  /// The new task priority to specify. The lower the number, the higher the
  /// priority. Tasks that have the same priority are scheduled in parallel.
  ///
  /// Parameter [replace] :
  /// If True, then all fields that are required by the
  /// RegisterTaskWithMaintenanceWindow action are also required for this API
  /// request. Optional fields that are not specified are set to null.
  ///
  /// Parameter [serviceRoleArn] :
  /// The ARN of the IAM service role for Systems Manager to assume when running
  /// a maintenance window task. If you do not specify a service role ARN,
  /// Systems Manager uses your account's service-linked role. If no
  /// service-linked role for Systems Manager exists in your account, it is
  /// created when you run <code>RegisterTaskWithMaintenanceWindow</code>.
  ///
  /// For more information, see the following topics in the in the <i>AWS
  /// Systems Manager User Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html#slr-permissions">Using
  /// service-linked roles for Systems Manager</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html#maintenance-window-tasks-service-role">Should
  /// I use a service-linked role or a custom service role to run maintenance
  /// window tasks? </a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [targets] :
  /// The targets (either instances or tags) to modify. Instances are specified
  /// using Key=instanceids,Values=instanceID_1,instanceID_2. Tags are specified
  /// using Key=tag_name,Values=tag_value.
  /// <note>
  /// One or more targets must be specified for maintenance window Run
  /// Command-type tasks. Depending on the task, targets are optional for other
  /// maintenance window task types (Automation, AWS Lambda, and AWS Step
  /// Functions). For more information about running tasks that do not specify
  /// targets, see see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html">Registering
  /// maintenance window tasks without targets</a> in the <i>AWS Systems Manager
  /// User Guide</i>.
  /// </note>
  ///
  /// Parameter [taskArn] :
  /// The task ARN to modify.
  ///
  /// Parameter [taskInvocationParameters] :
  /// The parameters that the task should use during execution. Populate only
  /// the fields that match the task type. All other fields should be empty.
  /// <important>
  /// When you update a maintenance window task that has options specified in
  /// <code>TaskInvocationParameters</code>, you must provide again all the
  /// <code>TaskInvocationParameters</code> values that you want to retain. The
  /// values you do not specify again are removed. For example, suppose that
  /// when you registered a Run Command task, you specified
  /// <code>TaskInvocationParameters</code> values for <code>Comment</code>,
  /// <code>NotificationConfig</code>, and <code>OutputS3BucketName</code>. If
  /// you update the maintenance window task and specify only a different
  /// <code>OutputS3BucketName</code> value, the values for <code>Comment</code>
  /// and <code>NotificationConfig</code> are removed.
  /// </important>
  ///
  /// Parameter [taskParameters] :
  /// The parameters to modify.
  /// <note>
  /// <code>TaskParameters</code> has been deprecated. To specify parameters to
  /// pass to a task when it runs, instead use the <code>Parameters</code>
  /// option in the <code>TaskInvocationParameters</code> structure. For
  /// information about how Systems Manager handles these options for the
  /// supported maintenance window task types, see
  /// <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  /// The map has the following format:
  ///
  /// Key: string, between 1 and 255 characters
  ///
  /// Value: an array of strings, each string is between 1 and 255 characters
  Future<UpdateMaintenanceWindowTaskResult> updateMaintenanceWindowTask({
    @_s.required String windowId,
    @_s.required String windowTaskId,
    String description,
    LoggingInfo loggingInfo,
    String maxConcurrency,
    String maxErrors,
    String name,
    int priority,
    bool replace,
    String serviceRoleArn,
    List<Target> targets,
    String taskArn,
    MaintenanceWindowTaskInvocationParameters taskInvocationParameters,
    Map<String, MaintenanceWindowTaskParameterValueExpression> taskParameters,
  }) async {
    ArgumentError.checkNotNull(windowId, 'windowId');
    _s.validateStringLength(
      'windowId',
      windowId,
      20,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowId',
      windowId,
      r'''^mw-[0-9a-f]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(windowTaskId, 'windowTaskId');
    _s.validateStringLength(
      'windowTaskId',
      windowTaskId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'windowTaskId',
      windowTaskId,
      r'''^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    _s.validateStringLength(
      'maxConcurrency',
      maxConcurrency,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxConcurrency',
      maxConcurrency,
      r'''^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$''',
    );
    _s.validateStringLength(
      'maxErrors',
      maxErrors,
      1,
      7,
    );
    _s.validateStringPattern(
      'maxErrors',
      maxErrors,
      r'''^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$''',
    );
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    _s.validateNumRange(
      'priority',
      priority,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'taskArn',
      taskArn,
      1,
      1600,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateMaintenanceWindowTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WindowId': windowId,
        'WindowTaskId': windowTaskId,
        if (description != null) 'Description': description,
        if (loggingInfo != null) 'LoggingInfo': loggingInfo,
        if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
        if (maxErrors != null) 'MaxErrors': maxErrors,
        if (name != null) 'Name': name,
        if (priority != null) 'Priority': priority,
        if (replace != null) 'Replace': replace,
        if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
        if (targets != null) 'Targets': targets,
        if (taskArn != null) 'TaskArn': taskArn,
        if (taskInvocationParameters != null)
          'TaskInvocationParameters': taskInvocationParameters,
        if (taskParameters != null) 'TaskParameters': taskParameters,
      },
    );

    return UpdateMaintenanceWindowTaskResult.fromJson(jsonResponse.body);
  }

  /// Changes the Amazon Identity and Access Management (IAM) role that is
  /// assigned to the on-premises instance or virtual machines (VM). IAM roles
  /// are first assigned to these hybrid instances during the activation
  /// process. For more information, see <a>CreateActivation</a>.
  ///
  /// May throw [InvalidInstanceId].
  /// May throw [InternalServerError].
  ///
  /// Parameter [iamRole] :
  /// The IAM role you want to assign or change.
  ///
  /// Parameter [instanceId] :
  /// The ID of the managed instance where you want to update the role.
  Future<void> updateManagedInstanceRole({
    @_s.required String iamRole,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(iamRole, 'iamRole');
    _s.validateStringLength(
      'iamRole',
      iamRole,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''^mi-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateManagedInstanceRole'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamRole': iamRole,
        'InstanceId': instanceId,
      },
    );

    return UpdateManagedInstanceRoleResult.fromJson(jsonResponse.body);
  }

  /// Edit or change an OpsItem. You must have permission in AWS Identity and
  /// Access Management (IAM) to update an OpsItem. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting
  /// started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS
  /// Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [OpsItemNotFoundException].
  /// May throw [OpsItemAlreadyExistsException].
  /// May throw [OpsItemLimitExceededException].
  /// May throw [OpsItemInvalidParameterException].
  ///
  /// Parameter [opsItemId] :
  /// The ID of the OpsItem.
  ///
  /// Parameter [actualEndTime] :
  /// The time a runbook workflow ended. Currently reported only for the OpsItem
  /// type <code>/aws/changerequest</code>.
  ///
  /// Parameter [actualStartTime] :
  /// The time a runbook workflow started. Currently reported only for the
  /// OpsItem type <code>/aws/changerequest</code>.
  ///
  /// Parameter [category] :
  /// Specify a new category for an OpsItem.
  ///
  /// Parameter [description] :
  /// Update the information about the OpsItem. Provide enough information so
  /// that users reading this OpsItem for the first time understand the issue.
  ///
  /// Parameter [notifications] :
  /// The Amazon Resource Name (ARN) of an SNS topic where notifications are
  /// sent when this OpsItem is edited or changed.
  ///
  /// Parameter [operationalData] :
  /// Add new keys or edit existing key-value pairs of the OperationalData map
  /// in the OpsItem object.
  ///
  /// Operational data is custom data that provides useful reference details
  /// about the OpsItem. For example, you can specify log files, error strings,
  /// license keys, troubleshooting tips, or other relevant data. You enter
  /// operational data as key-value pairs. The key has a maximum length of 128
  /// characters. The value has a maximum size of 20 KB.
  /// <important>
  /// Operational data keys <i>can't</i> begin with the following: amazon, aws,
  /// amzn, ssm, /amazon, /aws, /amzn, /ssm.
  /// </important>
  /// You can choose to make the data searchable by other users in the account
  /// or you can restrict search access. Searchable data means that all users
  /// with access to the OpsItem Overview page (as provided by the
  /// <a>DescribeOpsItems</a> API action) can view and search on the specified
  /// data. Operational data that is not searchable is only viewable by users
  /// who have access to the OpsItem (as provided by the <a>GetOpsItem</a> API
  /// action).
  ///
  /// Use the <code>/aws/resources</code> key in OperationalData to specify a
  /// related resource in the request. Use the <code>/aws/automations</code> key
  /// in OperationalData to associate an Automation runbook with the OpsItem. To
  /// view AWS CLI example commands that use these keys, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems">Creating
  /// OpsItems manually</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [operationalDataToDelete] :
  /// Keys that you want to remove from the OperationalData map.
  ///
  /// Parameter [plannedEndTime] :
  /// The time specified in a change request for a runbook workflow to end.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  ///
  /// Parameter [plannedStartTime] :
  /// The time specified in a change request for a runbook workflow to start.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  ///
  /// Parameter [priority] :
  /// The importance of this OpsItem in relation to other OpsItems in the
  /// system.
  ///
  /// Parameter [relatedOpsItems] :
  /// One or more OpsItems that share something in common with the current
  /// OpsItems. For example, related OpsItems can include OpsItems with similar
  /// error messages, impacted resources, or statuses for the impacted resource.
  ///
  /// Parameter [severity] :
  /// Specify a new severity for an OpsItem.
  ///
  /// Parameter [status] :
  /// The OpsItem status. Status can be <code>Open</code>, <code>In
  /// Progress</code>, or <code>Resolved</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems.html#OpsCenter-working-with-OpsItems-editing-details">Editing
  /// OpsItem details</a> in the <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [title] :
  /// A short heading that describes the nature of the OpsItem and the impacted
  /// resource.
  Future<void> updateOpsItem({
    @_s.required String opsItemId,
    DateTime actualEndTime,
    DateTime actualStartTime,
    String category,
    String description,
    List<OpsItemNotification> notifications,
    Map<String, OpsItemDataValue> operationalData,
    List<String> operationalDataToDelete,
    DateTime plannedEndTime,
    DateTime plannedStartTime,
    int priority,
    List<RelatedOpsItem> relatedOpsItems,
    String severity,
    OpsItemStatus status,
    String title,
  }) async {
    ArgumentError.checkNotNull(opsItemId, 'opsItemId');
    _s.validateStringPattern(
      'opsItemId',
      opsItemId,
      r'''^(oi)-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'category',
      category,
      1,
      64,
    );
    _s.validateStringPattern(
      'category',
      category,
      r'''^(?!\s*$).+''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\s\S]*\S[\s\S]*''',
    );
    _s.validateNumRange(
      'priority',
      priority,
      1,
      5,
    );
    _s.validateStringLength(
      'severity',
      severity,
      1,
      64,
    );
    _s.validateStringPattern(
      'severity',
      severity,
      r'''^(?!\s*$).+''',
    );
    _s.validateStringLength(
      'title',
      title,
      1,
      1024,
    );
    _s.validateStringPattern(
      'title',
      title,
      r'''^(?!\s*$).+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateOpsItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OpsItemId': opsItemId,
        if (actualEndTime != null)
          'ActualEndTime': unixTimestampToJson(actualEndTime),
        if (actualStartTime != null)
          'ActualStartTime': unixTimestampToJson(actualStartTime),
        if (category != null) 'Category': category,
        if (description != null) 'Description': description,
        if (notifications != null) 'Notifications': notifications,
        if (operationalData != null) 'OperationalData': operationalData,
        if (operationalDataToDelete != null)
          'OperationalDataToDelete': operationalDataToDelete,
        if (plannedEndTime != null)
          'PlannedEndTime': unixTimestampToJson(plannedEndTime),
        if (plannedStartTime != null)
          'PlannedStartTime': unixTimestampToJson(plannedStartTime),
        if (priority != null) 'Priority': priority,
        if (relatedOpsItems != null) 'RelatedOpsItems': relatedOpsItems,
        if (severity != null) 'Severity': severity,
        if (status != null) 'Status': status.toValue(),
        if (title != null) 'Title': title,
      },
    );

    return UpdateOpsItemResponse.fromJson(jsonResponse.body);
  }

  /// Systems Manager calls this API action when you edit OpsMetadata in
  /// Application Manager.
  ///
  /// May throw [OpsMetadataNotFoundException].
  /// May throw [OpsMetadataInvalidArgumentException].
  /// May throw [OpsMetadataKeyLimitExceededException].
  /// May throw [OpsMetadataTooManyUpdatesException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [opsMetadataArn] :
  /// The Amazon Resoure Name (ARN) of the OpsMetadata Object to update.
  ///
  /// Parameter [keysToDelete] :
  /// The metadata keys to delete from the OpsMetadata object.
  ///
  /// Parameter [metadataToUpdate] :
  /// Metadata to add to an OpsMetadata object.
  Future<UpdateOpsMetadataResult> updateOpsMetadata({
    @_s.required String opsMetadataArn,
    List<String> keysToDelete,
    Map<String, MetadataValue> metadataToUpdate,
  }) async {
    ArgumentError.checkNotNull(opsMetadataArn, 'opsMetadataArn');
    _s.validateStringLength(
      'opsMetadataArn',
      opsMetadataArn,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'opsMetadataArn',
      opsMetadataArn,
      r'''arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:opsmetadata\/([a-zA-Z0-9-_\.\/]*)''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateOpsMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OpsMetadataArn': opsMetadataArn,
        if (keysToDelete != null) 'KeysToDelete': keysToDelete,
        if (metadataToUpdate != null) 'MetadataToUpdate': metadataToUpdate,
      },
    );

    return UpdateOpsMetadataResult.fromJson(jsonResponse.body);
  }

  /// Modifies an existing patch baseline. Fields not specified in the request
  /// are left unchanged.
  /// <note>
  /// For information about valid key and value pairs in
  /// <code>PatchFilters</code> for each supported operating system type, see <a
  /// href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.
  /// </note>
  ///
  /// May throw [DoesNotExistException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [baselineId] :
  /// The ID of the patch baseline to update.
  ///
  /// Parameter [approvalRules] :
  /// A set of rules used to include patches in the baseline.
  ///
  /// Parameter [approvedPatches] :
  /// A list of explicitly approved patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About
  /// package name formats for approved and rejected patch lists</a> in the
  /// <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [approvedPatchesComplianceLevel] :
  /// Assigns a new compliance severity level to an existing patch baseline.
  ///
  /// Parameter [approvedPatchesEnableNonSecurity] :
  /// Indicates whether the list of approved patches includes non-security
  /// updates that should be applied to the instances. The default value is
  /// 'false'. Applies to Linux instances only.
  ///
  /// Parameter [description] :
  /// A description of the patch baseline.
  ///
  /// Parameter [globalFilters] :
  /// A set of global filters used to include patches in the baseline.
  ///
  /// Parameter [name] :
  /// The name of the patch baseline.
  ///
  /// Parameter [rejectedPatches] :
  /// A list of explicitly rejected patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About
  /// package name formats for approved and rejected patch lists</a> in the
  /// <i>AWS Systems Manager User Guide</i>.
  ///
  /// Parameter [rejectedPatchesAction] :
  /// The action for Patch Manager to take on patches included in the
  /// RejectedPackages list.
  ///
  /// <ul>
  /// <li>
  /// <b>ALLOW_AS_DEPENDENCY</b>: A package in the Rejected patches list is
  /// installed only if it is a dependency of another package. It is considered
  /// compliant with the patch baseline, and its status is reported as
  /// <i>InstalledOther</i>. This is the default action if no option is
  /// specified.
  /// </li>
  /// <li>
  /// <b>BLOCK</b>: Packages in the RejectedPatches list, and packages that
  /// include them as dependencies, are not installed under any circumstances.
  /// If a package was installed before it was added to the Rejected patches
  /// list, it is considered non-compliant with the patch baseline, and its
  /// status is reported as <i>InstalledRejected</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [replace] :
  /// If True, then all fields that are required by the CreatePatchBaseline
  /// action are also required for this API request. Optional fields that are
  /// not specified are set to null.
  ///
  /// Parameter [sources] :
  /// Information about the patches to use to update the instances, including
  /// target operating systems and source repositories. Applies to Linux
  /// instances only.
  Future<UpdatePatchBaselineResult> updatePatchBaseline({
    @_s.required String baselineId,
    PatchRuleGroup approvalRules,
    List<String> approvedPatches,
    PatchComplianceLevel approvedPatchesComplianceLevel,
    bool approvedPatchesEnableNonSecurity,
    String description,
    PatchFilterGroup globalFilters,
    String name,
    List<String> rejectedPatches,
    PatchAction rejectedPatchesAction,
    bool replace,
    List<PatchSource> sources,
  }) async {
    ArgumentError.checkNotNull(baselineId, 'baselineId');
    _s.validateStringLength(
      'baselineId',
      baselineId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baselineId',
      baselineId,
      r'''^[a-zA-Z0-9_\-:/]{20,128}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      3,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]{3,128}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdatePatchBaseline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaselineId': baselineId,
        if (approvalRules != null) 'ApprovalRules': approvalRules,
        if (approvedPatches != null) 'ApprovedPatches': approvedPatches,
        if (approvedPatchesComplianceLevel != null)
          'ApprovedPatchesComplianceLevel':
              approvedPatchesComplianceLevel.toValue(),
        if (approvedPatchesEnableNonSecurity != null)
          'ApprovedPatchesEnableNonSecurity': approvedPatchesEnableNonSecurity,
        if (description != null) 'Description': description,
        if (globalFilters != null) 'GlobalFilters': globalFilters,
        if (name != null) 'Name': name,
        if (rejectedPatches != null) 'RejectedPatches': rejectedPatches,
        if (rejectedPatchesAction != null)
          'RejectedPatchesAction': rejectedPatchesAction.toValue(),
        if (replace != null) 'Replace': replace,
        if (sources != null) 'Sources': sources,
      },
    );

    return UpdatePatchBaselineResult.fromJson(jsonResponse.body);
  }

  /// Update a resource data sync. After you create a resource data sync for a
  /// Region, you can't change the account options for that sync. For example,
  /// if you create a sync in the us-east-2 (Ohio) Region and you choose the
  /// Include only the current account option, you can't edit that sync later
  /// and choose the Include all accounts from my AWS Organizations
  /// configuration option. Instead, you must delete the first resource data
  /// sync, and create a new one.
  /// <note>
  /// This API action only supports a resource data sync that was created with a
  /// SyncFromSource <code>SyncType</code>.
  /// </note>
  ///
  /// May throw [ResourceDataSyncNotFoundException].
  /// May throw [ResourceDataSyncInvalidConfigurationException].
  /// May throw [ResourceDataSyncConflictException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [syncName] :
  /// The name of the resource data sync you want to update.
  ///
  /// Parameter [syncSource] :
  /// Specify information about the data sources to synchronize.
  ///
  /// Parameter [syncType] :
  /// The type of resource data sync. The supported <code>SyncType</code> is
  /// SyncFromSource.
  Future<void> updateResourceDataSync({
    @_s.required String syncName,
    @_s.required ResourceDataSyncSource syncSource,
    @_s.required String syncType,
  }) async {
    ArgumentError.checkNotNull(syncName, 'syncName');
    _s.validateStringLength(
      'syncName',
      syncName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(syncSource, 'syncSource');
    ArgumentError.checkNotNull(syncType, 'syncType');
    _s.validateStringLength(
      'syncType',
      syncType,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateResourceDataSync'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SyncName': syncName,
        'SyncSource': syncSource,
        'SyncType': syncType,
      },
    );

    return UpdateResourceDataSyncResult.fromJson(jsonResponse.body);
  }

  /// <code>ServiceSetting</code> is an account-level setting for an AWS
  /// service. This setting defines how a user interacts with or uses a service
  /// or a feature of a service. For example, if an AWS service charges money to
  /// the account based on feature or service usage, then the AWS service team
  /// might create a default setting of "false". This means the user can't use
  /// this feature unless they change the setting to "true" and intentionally
  /// opt in for a paid feature.
  ///
  /// Services map a <code>SettingId</code> object to a setting value. AWS
  /// services teams define the default value for a <code>SettingId</code>. You
  /// can't create a new <code>SettingId</code>, but you can overwrite the
  /// default value if you have the <code>ssm:UpdateServiceSetting</code>
  /// permission for the setting. Use the <a>GetServiceSetting</a> API action to
  /// view the current value. Or, use the <a>ResetServiceSetting</a> to change
  /// the value back to the original value defined by the AWS service team.
  ///
  /// Update the service setting for the account.
  ///
  /// May throw [InternalServerError].
  /// May throw [ServiceSettingNotFound].
  /// May throw [TooManyUpdates].
  ///
  /// Parameter [settingId] :
  /// The Amazon Resource Name (ARN) of the service setting to reset. For
  /// example,
  /// <code>arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled</code>.
  /// The setting ID can be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>/ssm/parameter-store/default-parameter-tier</code>
  /// </li>
  /// <li>
  /// <code>/ssm/parameter-store/high-throughput-enabled</code>
  /// </li>
  /// <li>
  /// <code>/ssm/managed-instance/activation-tier</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [settingValue] :
  /// The new value to specify for the service setting. For the
  /// <code>/ssm/parameter-store/default-parameter-tier</code> setting ID, the
  /// setting value can be one of the following.
  ///
  /// <ul>
  /// <li>
  /// Standard
  /// </li>
  /// <li>
  /// Advanced
  /// </li>
  /// <li>
  /// Intelligent-Tiering
  /// </li>
  /// </ul>
  /// For the <code>/ssm/parameter-store/high-throughput-enabled</code>, and
  /// <code>/ssm/managed-instance/activation-tier</code> setting IDs, the
  /// setting value can be true or false.
  Future<void> updateServiceSetting({
    @_s.required String settingId,
    @_s.required String settingValue,
  }) async {
    ArgumentError.checkNotNull(settingId, 'settingId');
    _s.validateStringLength(
      'settingId',
      settingId,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(settingValue, 'settingValue');
    _s.validateStringLength(
      'settingValue',
      settingValue,
      1,
      4096,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonSSM.UpdateServiceSetting'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SettingId': settingId,
        'SettingValue': settingValue,
      },
    );

    return UpdateServiceSettingResult.fromJson(jsonResponse.body);
  }
}

/// Information includes the AWS account ID where the current document is shared
/// and the version shared with that account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountSharingInfo {
  /// The AWS account ID where the current document is shared.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The version of the current document shared with the account.
  @_s.JsonKey(name: 'SharedDocumentVersion')
  final String sharedDocumentVersion;

  AccountSharingInfo({
    this.accountId,
    this.sharedDocumentVersion,
  });
  factory AccountSharingInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountSharingInfoFromJson(json);
}

/// An activation registers one or more on-premises servers or virtual machines
/// (VMs) with AWS so that you can configure those servers or VMs using Run
/// Command. A server or VM that has been registered with AWS is called a
/// managed instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Activation {
  /// The ID created by Systems Manager when you submitted the activation.
  @_s.JsonKey(name: 'ActivationId')
  final String activationId;

  /// The date the activation was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// A name for the managed instance when it is created.
  @_s.JsonKey(name: 'DefaultInstanceName')
  final String defaultInstanceName;

  /// A user defined description of the activation.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date when this activation can no longer be used to register managed
  /// instances.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationDate')
  final DateTime expirationDate;

  /// Whether or not the activation is expired.
  @_s.JsonKey(name: 'Expired')
  final bool expired;

  /// The Amazon Identity and Access Management (IAM) role to assign to the
  /// managed instance.
  @_s.JsonKey(name: 'IamRole')
  final String iamRole;

  /// The maximum number of managed instances that can be registered using this
  /// activation.
  @_s.JsonKey(name: 'RegistrationLimit')
  final int registrationLimit;

  /// The number of managed instances already registered with this activation.
  @_s.JsonKey(name: 'RegistrationsCount')
  final int registrationsCount;

  /// Tags assigned to the activation.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  Activation({
    this.activationId,
    this.createdDate,
    this.defaultInstanceName,
    this.description,
    this.expirationDate,
    this.expired,
    this.iamRole,
    this.registrationLimit,
    this.registrationsCount,
    this.tags,
  });
  factory Activation.fromJson(Map<String, dynamic> json) =>
      _$ActivationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsToResourceResult {
  AddTagsToResourceResult();
  factory AddTagsToResourceResult.fromJson(Map<String, dynamic> json) =>
      _$AddTagsToResourceResultFromJson(json);
}

/// Describes an association of a Systems Manager document and an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Association {
  /// The ID created by the system when you create an association. An association
  /// is a binding between a document and a set of targets with a schedule.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The association name.
  @_s.JsonKey(name: 'AssociationName')
  final String associationName;

  /// The association version.
  @_s.JsonKey(name: 'AssociationVersion')
  final String associationVersion;

  /// The version of the document used in the association.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The ID of the instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The date on which the association was last run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastExecutionDate')
  final DateTime lastExecutionDate;

  /// The name of the Systems Manager document.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Information about the association.
  @_s.JsonKey(name: 'Overview')
  final AssociationOverview overview;

  /// A cron expression that specifies a schedule when the association runs.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// The instances targeted by the request to create an association.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  Association({
    this.associationId,
    this.associationName,
    this.associationVersion,
    this.documentVersion,
    this.instanceId,
    this.lastExecutionDate,
    this.name,
    this.overview,
    this.scheduleExpression,
    this.targets,
  });
  factory Association.fromJson(Map<String, dynamic> json) =>
      _$AssociationFromJson(json);
}

enum AssociationComplianceSeverity {
  @_s.JsonValue('CRITICAL')
  critical,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('UNSPECIFIED')
  unspecified,
}

extension on AssociationComplianceSeverity {
  String toValue() {
    switch (this) {
      case AssociationComplianceSeverity.critical:
        return 'CRITICAL';
      case AssociationComplianceSeverity.high:
        return 'HIGH';
      case AssociationComplianceSeverity.medium:
        return 'MEDIUM';
      case AssociationComplianceSeverity.low:
        return 'LOW';
      case AssociationComplianceSeverity.unspecified:
        return 'UNSPECIFIED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the parameters for a document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociationDescription {
  /// By default, when you create a new associations, the system runs it
  /// immediately after it is created and then according to the schedule you
  /// specified. Specify this option if you don't want an association to run
  /// immediately after you create it. This parameter is not supported for rate
  /// expressions.
  @_s.JsonKey(name: 'ApplyOnlyAtCronInterval')
  final bool applyOnlyAtCronInterval;

  /// The association ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The association name.
  @_s.JsonKey(name: 'AssociationName')
  final String associationName;

  /// The association version.
  @_s.JsonKey(name: 'AssociationVersion')
  final String associationVersion;

  /// Specify the target for the association. This target is required for
  /// associations that use an Automation document and target resources by using
  /// rate controls.
  @_s.JsonKey(name: 'AutomationTargetParameterName')
  final String automationTargetParameterName;

  /// The severity level that is assigned to the association.
  @_s.JsonKey(name: 'ComplianceSeverity')
  final AssociationComplianceSeverity complianceSeverity;

  /// The date when the association was made.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Date')
  final DateTime date;

  /// The document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The ID of the instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The date on which the association was last run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastExecutionDate')
  final DateTime lastExecutionDate;

  /// The last date on which the association was successfully run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastSuccessfulExecutionDate')
  final DateTime lastSuccessfulExecutionDate;

  /// The date when the association was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateAssociationDate')
  final DateTime lastUpdateAssociationDate;

  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will process
  /// its association within the limit specified for MaxConcurrency.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of the
  /// target set, for example 10%. If you specify 3, for example, the system stops
  /// sending requests when the fourth error is received. If you specify 0, then
  /// the system stops sending requests after the first error is returned. If you
  /// run an association on 50 instances and set MaxError to 10%, then the system
  /// stops sending the request when the sixth error is received.
  ///
  /// Executions that are already running an association when MaxErrors is reached
  /// are allowed to complete, but some of these executions may fail as well. If
  /// you need to ensure that there won't be more than max-errors failed
  /// executions, set MaxConcurrency to 1 so that executions proceed one at a
  /// time.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The name of the Systems Manager document.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An S3 bucket where you want to store the output details of the request.
  @_s.JsonKey(name: 'OutputLocation')
  final InstanceAssociationOutputLocation outputLocation;

  /// Information about the association.
  @_s.JsonKey(name: 'Overview')
  final AssociationOverview overview;

  /// A description of the parameters for a document.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  /// A cron expression that specifies a schedule when the association runs.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// The association status.
  @_s.JsonKey(name: 'Status')
  final AssociationStatus status;

  /// The mode for generating association compliance. You can specify
  /// <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the
  /// system uses the status of the association execution to determine the
  /// compliance status. If the association execution runs successfully, then the
  /// association is <code>COMPLIANT</code>. If the association execution doesn't
  /// run successfully, the association is <code>NON-COMPLIANT</code>.
  ///
  /// In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code>
  /// as a parameter for the <a>PutComplianceItems</a> API action. In this case,
  /// compliance data is not managed by State Manager. It is managed by your
  /// direct call to the <a>PutComplianceItems</a> API action.
  ///
  /// By default, all associations use <code>AUTO</code> mode.
  @_s.JsonKey(name: 'SyncCompliance')
  final AssociationSyncCompliance syncCompliance;

  /// The combination of AWS Regions and AWS accounts where you want to run the
  /// association.
  @_s.JsonKey(name: 'TargetLocations')
  final List<TargetLocation> targetLocations;

  /// The instances targeted by the request.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  AssociationDescription({
    this.applyOnlyAtCronInterval,
    this.associationId,
    this.associationName,
    this.associationVersion,
    this.automationTargetParameterName,
    this.complianceSeverity,
    this.date,
    this.documentVersion,
    this.instanceId,
    this.lastExecutionDate,
    this.lastSuccessfulExecutionDate,
    this.lastUpdateAssociationDate,
    this.maxConcurrency,
    this.maxErrors,
    this.name,
    this.outputLocation,
    this.overview,
    this.parameters,
    this.scheduleExpression,
    this.status,
    this.syncCompliance,
    this.targetLocations,
    this.targets,
  });
  factory AssociationDescription.fromJson(Map<String, dynamic> json) =>
      _$AssociationDescriptionFromJson(json);
}

/// Includes information about the specified association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociationExecution {
  /// The association ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The association version.
  @_s.JsonKey(name: 'AssociationVersion')
  final String associationVersion;

  /// The time the execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Detailed status information about the execution.
  @_s.JsonKey(name: 'DetailedStatus')
  final String detailedStatus;

  /// The execution ID for the association.
  @_s.JsonKey(name: 'ExecutionId')
  final String executionId;

  /// The date of the last execution.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastExecutionDate')
  final DateTime lastExecutionDate;

  /// An aggregate status of the resources in the execution based on the status
  /// type.
  @_s.JsonKey(name: 'ResourceCountByStatus')
  final String resourceCountByStatus;

  /// The status of the association execution.
  @_s.JsonKey(name: 'Status')
  final String status;

  AssociationExecution({
    this.associationId,
    this.associationVersion,
    this.createdTime,
    this.detailedStatus,
    this.executionId,
    this.lastExecutionDate,
    this.resourceCountByStatus,
    this.status,
  });
  factory AssociationExecution.fromJson(Map<String, dynamic> json) =>
      _$AssociationExecutionFromJson(json);
}

/// Filters used in the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AssociationExecutionFilter {
  /// The key value used in the request.
  @_s.JsonKey(name: 'Key')
  final AssociationExecutionFilterKey key;

  /// The filter type specified in the request.
  @_s.JsonKey(name: 'Type')
  final AssociationFilterOperatorType type;

  /// The value specified for the key.
  @_s.JsonKey(name: 'Value')
  final String value;

  AssociationExecutionFilter({
    @_s.required this.key,
    @_s.required this.type,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$AssociationExecutionFilterToJson(this);
}

enum AssociationExecutionFilterKey {
  @_s.JsonValue('ExecutionId')
  executionId,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('CreatedTime')
  createdTime,
}

/// Includes information about the specified association execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociationExecutionTarget {
  /// The association ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The association version.
  @_s.JsonKey(name: 'AssociationVersion')
  final String associationVersion;

  /// Detailed information about the execution status.
  @_s.JsonKey(name: 'DetailedStatus')
  final String detailedStatus;

  /// The execution ID.
  @_s.JsonKey(name: 'ExecutionId')
  final String executionId;

  /// The date of the last execution.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastExecutionDate')
  final DateTime lastExecutionDate;

  /// The location where the association details are saved.
  @_s.JsonKey(name: 'OutputSource')
  final OutputSource outputSource;

  /// The resource ID, for example, the instance ID where the association ran.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The resource type, for example, instance.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The association execution status.
  @_s.JsonKey(name: 'Status')
  final String status;

  AssociationExecutionTarget({
    this.associationId,
    this.associationVersion,
    this.detailedStatus,
    this.executionId,
    this.lastExecutionDate,
    this.outputSource,
    this.resourceId,
    this.resourceType,
    this.status,
  });
  factory AssociationExecutionTarget.fromJson(Map<String, dynamic> json) =>
      _$AssociationExecutionTargetFromJson(json);
}

/// Filters for the association execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AssociationExecutionTargetsFilter {
  /// The key value used in the request.
  @_s.JsonKey(name: 'Key')
  final AssociationExecutionTargetsFilterKey key;

  /// The value specified for the key.
  @_s.JsonKey(name: 'Value')
  final String value;

  AssociationExecutionTargetsFilter({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() =>
      _$AssociationExecutionTargetsFilterToJson(this);
}

enum AssociationExecutionTargetsFilterKey {
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('ResourceId')
  resourceId,
  @_s.JsonValue('ResourceType')
  resourceType,
}

/// Describes a filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AssociationFilter {
  /// The name of the filter.
  /// <note>
  /// <code>InstanceId</code> has been deprecated.
  /// </note>
  @_s.JsonKey(name: 'key')
  final AssociationFilterKey key;

  /// The filter value.
  @_s.JsonKey(name: 'value')
  final String value;

  AssociationFilter({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$AssociationFilterToJson(this);
}

enum AssociationFilterKey {
  @_s.JsonValue('InstanceId')
  instanceId,
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('AssociationId')
  associationId,
  @_s.JsonValue('AssociationStatusName')
  associationStatusName,
  @_s.JsonValue('LastExecutedBefore')
  lastExecutedBefore,
  @_s.JsonValue('LastExecutedAfter')
  lastExecutedAfter,
  @_s.JsonValue('AssociationName')
  associationName,
  @_s.JsonValue('ResourceGroupName')
  resourceGroupName,
}

enum AssociationFilterOperatorType {
  @_s.JsonValue('EQUAL')
  equal,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
}

/// Information about the association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociationOverview {
  /// Returns the number of targets for the association status. For example, if
  /// you created an association with two instances, and one of them was
  /// successful, this would return the count of instances by status.
  @_s.JsonKey(name: 'AssociationStatusAggregatedCount')
  final Map<String, int> associationStatusAggregatedCount;

  /// A detailed status of the association.
  @_s.JsonKey(name: 'DetailedStatus')
  final String detailedStatus;

  /// The status of the association. Status can be: Pending, Success, or Failed.
  @_s.JsonKey(name: 'Status')
  final String status;

  AssociationOverview({
    this.associationStatusAggregatedCount,
    this.detailedStatus,
    this.status,
  });
  factory AssociationOverview.fromJson(Map<String, dynamic> json) =>
      _$AssociationOverviewFromJson(json);
}

/// Describes an association status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssociationStatus {
  /// The date when the status changed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Date')
  final DateTime date;

  /// The reason for the status.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status.
  @_s.JsonKey(name: 'Name')
  final AssociationStatusName name;

  /// A user-defined string.
  @_s.JsonKey(name: 'AdditionalInfo')
  final String additionalInfo;

  AssociationStatus({
    @_s.required this.date,
    @_s.required this.message,
    @_s.required this.name,
    this.additionalInfo,
  });
  factory AssociationStatus.fromJson(Map<String, dynamic> json) =>
      _$AssociationStatusFromJson(json);

  Map<String, dynamic> toJson() => _$AssociationStatusToJson(this);
}

enum AssociationStatusName {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failed')
  failed,
}

enum AssociationSyncCompliance {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('MANUAL')
  manual,
}

extension on AssociationSyncCompliance {
  String toValue() {
    switch (this) {
      case AssociationSyncCompliance.auto:
        return 'AUTO';
      case AssociationSyncCompliance.manual:
        return 'MANUAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the association version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociationVersionInfo {
  /// By default, when you create a new associations, the system runs it
  /// immediately after it is created and then according to the schedule you
  /// specified. Specify this option if you don't want an association to run
  /// immediately after you create it. This parameter is not supported for rate
  /// expressions.
  @_s.JsonKey(name: 'ApplyOnlyAtCronInterval')
  final bool applyOnlyAtCronInterval;

  /// The ID created by the system when the association was created.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The name specified for the association version when the association version
  /// was created.
  @_s.JsonKey(name: 'AssociationName')
  final String associationName;

  /// The association version.
  @_s.JsonKey(name: 'AssociationVersion')
  final String associationVersion;

  /// The severity level that is assigned to the association.
  @_s.JsonKey(name: 'ComplianceSeverity')
  final AssociationComplianceSeverity complianceSeverity;

  /// The date the association version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The version of a Systems Manager document used when the association version
  /// was created.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will process
  /// its association within the limit specified for MaxConcurrency.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of the
  /// target set, for example 10%. If you specify 3, for example, the system stops
  /// sending requests when the fourth error is received. If you specify 0, then
  /// the system stops sending requests after the first error is returned. If you
  /// run an association on 50 instances and set MaxError to 10%, then the system
  /// stops sending the request when the sixth error is received.
  ///
  /// Executions that are already running an association when MaxErrors is reached
  /// are allowed to complete, but some of these executions may fail as well. If
  /// you need to ensure that there won't be more than max-errors failed
  /// executions, set MaxConcurrency to 1 so that executions proceed one at a
  /// time.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The name specified when the association was created.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The location in Amazon S3 specified for the association when the association
  /// version was created.
  @_s.JsonKey(name: 'OutputLocation')
  final InstanceAssociationOutputLocation outputLocation;

  /// Parameters specified when the association version was created.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  /// The cron or rate schedule specified for the association when the association
  /// version was created.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// The mode for generating association compliance. You can specify
  /// <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the
  /// system uses the status of the association execution to determine the
  /// compliance status. If the association execution runs successfully, then the
  /// association is <code>COMPLIANT</code>. If the association execution doesn't
  /// run successfully, the association is <code>NON-COMPLIANT</code>.
  ///
  /// In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code>
  /// as a parameter for the <a>PutComplianceItems</a> API action. In this case,
  /// compliance data is not managed by State Manager. It is managed by your
  /// direct call to the <a>PutComplianceItems</a> API action.
  ///
  /// By default, all associations use <code>AUTO</code> mode.
  @_s.JsonKey(name: 'SyncCompliance')
  final AssociationSyncCompliance syncCompliance;

  /// The combination of AWS Regions and AWS accounts where you wanted to run the
  /// association when this association version was created.
  @_s.JsonKey(name: 'TargetLocations')
  final List<TargetLocation> targetLocations;

  /// The targets specified for the association when the association version was
  /// created.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  AssociationVersionInfo({
    this.applyOnlyAtCronInterval,
    this.associationId,
    this.associationName,
    this.associationVersion,
    this.complianceSeverity,
    this.createdDate,
    this.documentVersion,
    this.maxConcurrency,
    this.maxErrors,
    this.name,
    this.outputLocation,
    this.parameters,
    this.scheduleExpression,
    this.syncCompliance,
    this.targetLocations,
    this.targets,
  });
  factory AssociationVersionInfo.fromJson(Map<String, dynamic> json) =>
      _$AssociationVersionInfoFromJson(json);
}

/// A structure that includes attributes that describe a document attachment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachmentContent {
  /// The cryptographic hash value of the document content.
  @_s.JsonKey(name: 'Hash')
  final String hash;

  /// The hash algorithm used to calculate the hash value.
  @_s.JsonKey(name: 'HashType')
  final AttachmentHashType hashType;

  /// The name of an attachment.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The size of an attachment in bytes.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// The URL location of the attachment content.
  @_s.JsonKey(name: 'Url')
  final String url;

  AttachmentContent({
    this.hash,
    this.hashType,
    this.name,
    this.size,
    this.url,
  });
  factory AttachmentContent.fromJson(Map<String, dynamic> json) =>
      _$AttachmentContentFromJson(json);
}

enum AttachmentHashType {
  @_s.JsonValue('Sha256')
  sha256,
}

/// An attribute of an attachment, such as the attachment name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachmentInformation {
  /// The name of the attachment.
  @_s.JsonKey(name: 'Name')
  final String name;

  AttachmentInformation({
    this.name,
  });
  factory AttachmentInformation.fromJson(Map<String, dynamic> json) =>
      _$AttachmentInformationFromJson(json);
}

/// Identifying information about a document attachment, including the file name
/// and a key-value pair that identifies the location of an attachment to a
/// document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AttachmentsSource {
  /// The key of a key-value pair that identifies the location of an attachment to
  /// a document.
  @_s.JsonKey(name: 'Key')
  final AttachmentsSourceKey key;

  /// The name of the document attachment file.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of a key-value pair that identifies the location of an attachment
  /// to a document. The format for <b>Value</b> depends on the type of key you
  /// specify.
  ///
  /// <ul>
  /// <li>
  /// For the key <i>SourceUrl</i>, the value is an S3 bucket location. For
  /// example:
  ///
  /// <code>"Values": [ "s3://doc-example-bucket/my-folder" ]</code>
  /// </li>
  /// <li>
  /// For the key <i>S3FileUrl</i>, the value is a file in an S3 bucket. For
  /// example:
  ///
  /// <code>"Values": [ "s3://doc-example-bucket/my-folder/my-file.py" ]</code>
  /// </li>
  /// <li>
  /// For the key <i>AttachmentReference</i>, the value is constructed from the
  /// name of another SSM document in your account, a version number of that
  /// document, and a file attached to that document version that you want to
  /// reuse. For example:
  ///
  /// <code>"Values": [ "MyOtherDocument/3/my-other-file.py" ]</code>
  ///
  /// However, if the SSM document is shared with you from another account, the
  /// full SSM document ARN must be specified instead of the document name only.
  /// For example:
  ///
  /// <code>"Values": [
  /// "arn:aws:ssm:us-east-2:111122223333:document/OtherAccountDocument/3/their-file.py"
  /// ]</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  AttachmentsSource({
    this.key,
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$AttachmentsSourceToJson(this);
}

enum AttachmentsSourceKey {
  @_s.JsonValue('SourceUrl')
  sourceUrl,
  @_s.JsonValue('S3FileUrl')
  s3FileUrl,
  @_s.JsonValue('AttachmentReference')
  attachmentReference,
}

/// Detailed information about the current state of an individual Automation
/// execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutomationExecution {
  /// The ID of a State Manager association used in the Automation operation.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The execution ID.
  @_s.JsonKey(name: 'AutomationExecutionId')
  final String automationExecutionId;

  /// The execution status of the Automation.
  @_s.JsonKey(name: 'AutomationExecutionStatus')
  final AutomationExecutionStatus automationExecutionStatus;

  /// The subtype of the Automation operation. Currently, the only supported value
  /// is <code>ChangeRequest</code>.
  @_s.JsonKey(name: 'AutomationSubtype')
  final AutomationSubtype automationSubtype;

  /// The name of the Change Manager change request.
  @_s.JsonKey(name: 'ChangeRequestName')
  final String changeRequestName;

  /// The action of the step that is currently running.
  @_s.JsonKey(name: 'CurrentAction')
  final String currentAction;

  /// The name of the step that is currently running.
  @_s.JsonKey(name: 'CurrentStepName')
  final String currentStepName;

  /// The name of the Automation document used during the execution.
  @_s.JsonKey(name: 'DocumentName')
  final String documentName;

  /// The version of the document to use during execution.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The Amazon Resource Name (ARN) of the user who ran the automation.
  @_s.JsonKey(name: 'ExecutedBy')
  final String executedBy;

  /// The time the execution finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionEndTime')
  final DateTime executionEndTime;

  /// The time the execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionStartTime')
  final DateTime executionStartTime;

  /// A message describing why an execution has failed, if the status is set to
  /// Failed.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  /// The MaxConcurrency value specified by the user when the execution started.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The MaxErrors value specified by the user when the execution started.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The automation execution mode.
  @_s.JsonKey(name: 'Mode')
  final ExecutionMode mode;

  /// The ID of an OpsItem that is created to represent a Change Manager change
  /// request.
  @_s.JsonKey(name: 'OpsItemId')
  final String opsItemId;

  /// The list of execution outputs as defined in the automation document.
  @_s.JsonKey(name: 'Outputs')
  final Map<String, List<String>> outputs;

  /// The key-value map of execution parameters, which were supplied when calling
  /// StartAutomationExecution.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  /// The AutomationExecutionId of the parent automation.
  @_s.JsonKey(name: 'ParentAutomationExecutionId')
  final String parentAutomationExecutionId;

  /// An aggregate of step execution statuses displayed in the AWS Console for a
  /// multi-Region and multi-account Automation execution.
  @_s.JsonKey(name: 'ProgressCounters')
  final ProgressCounters progressCounters;

  /// A list of resolved targets in the rate control execution.
  @_s.JsonKey(name: 'ResolvedTargets')
  final ResolvedTargets resolvedTargets;

  /// Information about the Automation runbooks (Automation documents) that are
  /// run as part of a runbook workflow.
  /// <note>
  /// The Automation runbooks specified for the runbook workflow can't run until
  /// all required approvals for the change request have been received.
  /// </note>
  @_s.JsonKey(name: 'Runbooks')
  final List<Runbook> runbooks;

  /// The date and time the Automation operation is scheduled to start.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ScheduledTime')
  final DateTime scheduledTime;

  /// A list of details about the current state of all steps that comprise an
  /// execution. An Automation document contains a list of steps that are run in
  /// order.
  @_s.JsonKey(name: 'StepExecutions')
  final List<StepExecution> stepExecutions;

  /// A boolean value that indicates if the response contains the full list of the
  /// Automation step executions. If true, use the
  /// DescribeAutomationStepExecutions API action to get the full list of step
  /// executions.
  @_s.JsonKey(name: 'StepExecutionsTruncated')
  final bool stepExecutionsTruncated;

  /// The target of the execution.
  @_s.JsonKey(name: 'Target')
  final String target;

  /// The combination of AWS Regions and/or AWS accounts where you want to run the
  /// Automation.
  @_s.JsonKey(name: 'TargetLocations')
  final List<TargetLocation> targetLocations;

  /// The specified key-value mapping of document parameters to target resources.
  @_s.JsonKey(name: 'TargetMaps')
  final List<Map<String, List<String>>> targetMaps;

  /// The parameter name.
  @_s.JsonKey(name: 'TargetParameterName')
  final String targetParameterName;

  /// The specified targets.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  AutomationExecution({
    this.associationId,
    this.automationExecutionId,
    this.automationExecutionStatus,
    this.automationSubtype,
    this.changeRequestName,
    this.currentAction,
    this.currentStepName,
    this.documentName,
    this.documentVersion,
    this.executedBy,
    this.executionEndTime,
    this.executionStartTime,
    this.failureMessage,
    this.maxConcurrency,
    this.maxErrors,
    this.mode,
    this.opsItemId,
    this.outputs,
    this.parameters,
    this.parentAutomationExecutionId,
    this.progressCounters,
    this.resolvedTargets,
    this.runbooks,
    this.scheduledTime,
    this.stepExecutions,
    this.stepExecutionsTruncated,
    this.target,
    this.targetLocations,
    this.targetMaps,
    this.targetParameterName,
    this.targets,
  });
  factory AutomationExecution.fromJson(Map<String, dynamic> json) =>
      _$AutomationExecutionFromJson(json);
}

/// A filter used to match specific automation executions. This is used to limit
/// the scope of Automation execution information returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AutomationExecutionFilter {
  /// One or more keys to limit the results. Valid filter keys include the
  /// following: DocumentNamePrefix, ExecutionStatus, ExecutionId,
  /// ParentExecutionId, CurrentAction, StartTimeBefore, StartTimeAfter,
  /// TargetResourceGroup.
  @_s.JsonKey(name: 'Key')
  final AutomationExecutionFilterKey key;

  /// The values used to limit the execution information associated with the
  /// filter's key.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  AutomationExecutionFilter({
    @_s.required this.key,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$AutomationExecutionFilterToJson(this);
}

enum AutomationExecutionFilterKey {
  @_s.JsonValue('DocumentNamePrefix')
  documentNamePrefix,
  @_s.JsonValue('ExecutionStatus')
  executionStatus,
  @_s.JsonValue('ExecutionId')
  executionId,
  @_s.JsonValue('ParentExecutionId')
  parentExecutionId,
  @_s.JsonValue('CurrentAction')
  currentAction,
  @_s.JsonValue('StartTimeBefore')
  startTimeBefore,
  @_s.JsonValue('StartTimeAfter')
  startTimeAfter,
  @_s.JsonValue('AutomationType')
  automationType,
  @_s.JsonValue('TagKey')
  tagKey,
  @_s.JsonValue('TargetResourceGroup')
  targetResourceGroup,
  @_s.JsonValue('AutomationSubtype')
  automationSubtype,
  @_s.JsonValue('OpsItemId')
  opsItemId,
}

/// Details about a specific Automation execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutomationExecutionMetadata {
  /// The ID of a State Manager association used in the Automation operation.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The execution ID.
  @_s.JsonKey(name: 'AutomationExecutionId')
  final String automationExecutionId;

  /// The status of the execution.
  @_s.JsonKey(name: 'AutomationExecutionStatus')
  final AutomationExecutionStatus automationExecutionStatus;

  /// The subtype of the Automation operation. Currently, the only supported value
  /// is <code>ChangeRequest</code>.
  @_s.JsonKey(name: 'AutomationSubtype')
  final AutomationSubtype automationSubtype;

  /// Use this filter with <a>DescribeAutomationExecutions</a>. Specify either
  /// Local or CrossAccount. CrossAccount is an Automation that runs in multiple
  /// AWS Regions and accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html">Running
  /// Automation workflows in multiple AWS Regions and accounts</a> in the <i>AWS
  /// Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'AutomationType')
  final AutomationType automationType;

  /// The name of the Change Manager change request.
  @_s.JsonKey(name: 'ChangeRequestName')
  final String changeRequestName;

  /// The action of the step that is currently running.
  @_s.JsonKey(name: 'CurrentAction')
  final String currentAction;

  /// The name of the step that is currently running.
  @_s.JsonKey(name: 'CurrentStepName')
  final String currentStepName;

  /// The name of the Automation document used during execution.
  @_s.JsonKey(name: 'DocumentName')
  final String documentName;

  /// The document version used during the execution.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The IAM role ARN of the user who ran the Automation.
  @_s.JsonKey(name: 'ExecutedBy')
  final String executedBy;

  /// The time the execution finished. This is not populated if the execution is
  /// still in progress.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionEndTime')
  final DateTime executionEndTime;

  /// The time the execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionStartTime')
  final DateTime executionStartTime;

  /// The list of execution outputs as defined in the Automation document.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  /// An S3 bucket where execution information is stored.
  @_s.JsonKey(name: 'LogFile')
  final String logFile;

  /// The MaxConcurrency value specified by the user when starting the Automation.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The MaxErrors value specified by the user when starting the Automation.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The Automation execution mode.
  @_s.JsonKey(name: 'Mode')
  final ExecutionMode mode;

  /// The ID of an OpsItem that is created to represent a Change Manager change
  /// request.
  @_s.JsonKey(name: 'OpsItemId')
  final String opsItemId;

  /// The list of execution outputs as defined in the Automation document.
  @_s.JsonKey(name: 'Outputs')
  final Map<String, List<String>> outputs;

  /// The ExecutionId of the parent Automation.
  @_s.JsonKey(name: 'ParentAutomationExecutionId')
  final String parentAutomationExecutionId;

  /// A list of targets that resolved during the execution.
  @_s.JsonKey(name: 'ResolvedTargets')
  final ResolvedTargets resolvedTargets;

  /// Information about the Automation runbooks (Automation documents) that are
  /// run during a runbook workflow in Change Manager.
  /// <note>
  /// The Automation runbooks specified for the runbook workflow can't run until
  /// all required approvals for the change request have been received.
  /// </note>
  @_s.JsonKey(name: 'Runbooks')
  final List<Runbook> runbooks;

  /// The date and time the Automation operation is scheduled to start.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ScheduledTime')
  final DateTime scheduledTime;

  /// The list of execution outputs as defined in the Automation document.
  @_s.JsonKey(name: 'Target')
  final String target;

  /// The specified key-value mapping of document parameters to target resources.
  @_s.JsonKey(name: 'TargetMaps')
  final List<Map<String, List<String>>> targetMaps;

  /// The list of execution outputs as defined in the Automation document.
  @_s.JsonKey(name: 'TargetParameterName')
  final String targetParameterName;

  /// The targets defined by the user when starting the Automation.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  AutomationExecutionMetadata({
    this.associationId,
    this.automationExecutionId,
    this.automationExecutionStatus,
    this.automationSubtype,
    this.automationType,
    this.changeRequestName,
    this.currentAction,
    this.currentStepName,
    this.documentName,
    this.documentVersion,
    this.executedBy,
    this.executionEndTime,
    this.executionStartTime,
    this.failureMessage,
    this.logFile,
    this.maxConcurrency,
    this.maxErrors,
    this.mode,
    this.opsItemId,
    this.outputs,
    this.parentAutomationExecutionId,
    this.resolvedTargets,
    this.runbooks,
    this.scheduledTime,
    this.target,
    this.targetMaps,
    this.targetParameterName,
    this.targets,
  });
  factory AutomationExecutionMetadata.fromJson(Map<String, dynamic> json) =>
      _$AutomationExecutionMetadataFromJson(json);
}

enum AutomationExecutionStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Waiting')
  waiting,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('TimedOut')
  timedOut,
  @_s.JsonValue('Cancelling')
  cancelling,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('PendingApproval')
  pendingApproval,
  @_s.JsonValue('Approved')
  approved,
  @_s.JsonValue('Rejected')
  rejected,
  @_s.JsonValue('Scheduled')
  scheduled,
  @_s.JsonValue('RunbookInProgress')
  runbookInProgress,
  @_s.JsonValue('PendingChangeCalendarOverride')
  pendingChangeCalendarOverride,
  @_s.JsonValue('ChangeCalendarOverrideApproved')
  changeCalendarOverrideApproved,
  @_s.JsonValue('ChangeCalendarOverrideRejected')
  changeCalendarOverrideRejected,
  @_s.JsonValue('CompletedWithSuccess')
  completedWithSuccess,
  @_s.JsonValue('CompletedWithFailure')
  completedWithFailure,
}

enum AutomationSubtype {
  @_s.JsonValue('ChangeRequest')
  changeRequest,
}

enum AutomationType {
  @_s.JsonValue('CrossAccount')
  crossAccount,
  @_s.JsonValue('Local')
  local,
}

enum CalendarState {
  @_s.JsonValue('OPEN')
  open,
  @_s.JsonValue('CLOSED')
  closed,
}

/// Whether or not the command was successfully canceled. There is no guarantee
/// that a request can be canceled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelCommandResult {
  CancelCommandResult();
  factory CancelCommandResult.fromJson(Map<String, dynamic> json) =>
      _$CancelCommandResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelMaintenanceWindowExecutionResult {
  /// The ID of the maintenance window execution that has been stopped.
  @_s.JsonKey(name: 'WindowExecutionId')
  final String windowExecutionId;

  CancelMaintenanceWindowExecutionResult({
    this.windowExecutionId,
  });
  factory CancelMaintenanceWindowExecutionResult.fromJson(
          Map<String, dynamic> json) =>
      _$CancelMaintenanceWindowExecutionResultFromJson(json);
}

/// Configuration options for sending command output to CloudWatch Logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchOutputConfig {
  /// The name of the CloudWatch log group where you want to send command output.
  /// If you don't specify a group name, Systems Manager automatically creates a
  /// log group for you. The log group uses the following naming format:
  /// aws/ssm/<i>SystemsManagerDocumentName</i>.
  @_s.JsonKey(name: 'CloudWatchLogGroupName')
  final String cloudWatchLogGroupName;

  /// Enables Systems Manager to send command output to CloudWatch Logs.
  @_s.JsonKey(name: 'CloudWatchOutputEnabled')
  final bool cloudWatchOutputEnabled;

  CloudWatchOutputConfig({
    this.cloudWatchLogGroupName,
    this.cloudWatchOutputEnabled,
  });
  factory CloudWatchOutputConfig.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchOutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchOutputConfigToJson(this);
}

/// Describes a command request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Command {
  /// CloudWatch Logs information where you want Systems Manager to send the
  /// command output.
  @_s.JsonKey(name: 'CloudWatchOutputConfig')
  final CloudWatchOutputConfig cloudWatchOutputConfig;

  /// A unique identifier for this command.
  @_s.JsonKey(name: 'CommandId')
  final String commandId;

  /// User-specified information about the command, such as a brief description of
  /// what the command should do.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// The number of targets for which the command invocation reached a terminal
  /// state. Terminal states include the following: Success, Failed, Execution
  /// Timed Out, Delivery Timed Out, Canceled, Terminated, or Undeliverable.
  @_s.JsonKey(name: 'CompletedCount')
  final int completedCount;

  /// The number of targets for which the status is Delivery Timed Out.
  @_s.JsonKey(name: 'DeliveryTimedOutCount')
  final int deliveryTimedOutCount;

  /// The name of the document requested for execution.
  @_s.JsonKey(name: 'DocumentName')
  final String documentName;

  /// The SSM document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The number of targets for which the status is Failed or Execution Timed Out.
  @_s.JsonKey(name: 'ErrorCount')
  final int errorCount;

  /// If this time is reached and the command has not already started running, it
  /// will not run. Calculated based on the ExpiresAfter user input provided as
  /// part of the SendCommand API.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpiresAfter')
  final DateTime expiresAfter;

  /// The instance IDs against which this command was requested.
  @_s.JsonKey(name: 'InstanceIds')
  final List<String> instanceIds;

  /// The maximum number of instances that are allowed to run the command at the
  /// same time. You can specify a number of instances, such as 10, or a
  /// percentage of instances, such as 10%. The default value is 50. For more
  /// information about how to use MaxConcurrency, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html">Running
  /// commands using Systems Manager Run Command</a> in the <i>AWS Systems Manager
  /// User Guide</i>.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The maximum number of errors allowed before the system stops sending the
  /// command to additional targets. You can specify a number of errors, such as
  /// 10, or a percentage or errors, such as 10%. The default value is 0. For more
  /// information about how to use MaxErrors, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html">Running
  /// commands using Systems Manager Run Command</a> in the <i>AWS Systems Manager
  /// User Guide</i>.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// Configurations for sending notifications about command status changes.
  @_s.JsonKey(name: 'NotificationConfig')
  final NotificationConfig notificationConfig;

  /// The S3 bucket where the responses to the command executions should be
  /// stored. This was requested when issuing the command.
  @_s.JsonKey(name: 'OutputS3BucketName')
  final String outputS3BucketName;

  /// The S3 directory path inside the bucket where the responses to the command
  /// executions should be stored. This was requested when issuing the command.
  @_s.JsonKey(name: 'OutputS3KeyPrefix')
  final String outputS3KeyPrefix;

  /// (Deprecated) You can no longer specify this parameter. The system ignores
  /// it. Instead, Systems Manager automatically determines the Region of the S3
  /// bucket.
  @_s.JsonKey(name: 'OutputS3Region')
  final String outputS3Region;

  /// The parameter values to be inserted in the document when running the
  /// command.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  /// The date and time the command was requested.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RequestedDateTime')
  final DateTime requestedDateTime;

  /// The IAM service role that Run Command uses to act on your behalf when
  /// sending notifications about command status changes.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// The status of the command.
  @_s.JsonKey(name: 'Status')
  final CommandStatus status;

  /// A detailed status of the command execution. StatusDetails includes more
  /// information than Status because it includes states resulting from error and
  /// concurrency control parameters. StatusDetails can show different results
  /// than Status. For more information about these statuses, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding
  /// command statuses</a> in the <i>AWS Systems Manager User Guide</i>.
  /// StatusDetails can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// Pending: The command has not been sent to any instances.
  /// </li>
  /// <li>
  /// In Progress: The command has been sent to at least one instance but has not
  /// reached a final state on all instances.
  /// </li>
  /// <li>
  /// Success: The command successfully ran on all invocations. This is a terminal
  /// state.
  /// </li>
  /// <li>
  /// Delivery Timed Out: The value of MaxErrors or more command invocations shows
  /// a status of Delivery Timed Out. This is a terminal state.
  /// </li>
  /// <li>
  /// Execution Timed Out: The value of MaxErrors or more command invocations
  /// shows a status of Execution Timed Out. This is a terminal state.
  /// </li>
  /// <li>
  /// Failed: The value of MaxErrors or more command invocations shows a status of
  /// Failed. This is a terminal state.
  /// </li>
  /// <li>
  /// Incomplete: The command was attempted on all instances and one or more
  /// invocations does not have a value of Success but not enough invocations
  /// failed for the status to be Failed. This is a terminal state.
  /// </li>
  /// <li>
  /// Canceled: The command was terminated before it was completed. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Rate Exceeded: The number of instances targeted by the command exceeded the
  /// account limit for pending invocations. The system has canceled the command
  /// before running it on any instance. This is a terminal state.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The number of targets for the command.
  @_s.JsonKey(name: 'TargetCount')
  final int targetCount;

  /// An array of search criteria that targets instances using a Key,Value
  /// combination that you specify. Targets is required if you don't provide one
  /// or more instance IDs in the call.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  /// The <code>TimeoutSeconds</code> value specified for a command.
  @_s.JsonKey(name: 'TimeoutSeconds')
  final int timeoutSeconds;

  Command({
    this.cloudWatchOutputConfig,
    this.commandId,
    this.comment,
    this.completedCount,
    this.deliveryTimedOutCount,
    this.documentName,
    this.documentVersion,
    this.errorCount,
    this.expiresAfter,
    this.instanceIds,
    this.maxConcurrency,
    this.maxErrors,
    this.notificationConfig,
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
    this.outputS3Region,
    this.parameters,
    this.requestedDateTime,
    this.serviceRole,
    this.status,
    this.statusDetails,
    this.targetCount,
    this.targets,
    this.timeoutSeconds,
  });
  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}

/// Describes a command filter.
/// <note>
/// An instance ID can't be specified when a command status is
/// <code>Pending</code> because the command hasn't run on the instance yet.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CommandFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'key')
  final CommandFilterKey key;

  /// The filter value. Valid values for each filter key are as follows:
  ///
  /// <ul>
  /// <li>
  /// <b>InvokedAfter</b>: Specify a timestamp to limit your results. For example,
  /// specify <code>2018-07-07T00:00:00Z</code> to see a list of command
  /// executions occurring July 7, 2018, and later.
  /// </li>
  /// <li>
  /// <b>InvokedBefore</b>: Specify a timestamp to limit your results. For
  /// example, specify <code>2018-07-07T00:00:00Z</code> to see a list of command
  /// executions from before July 7, 2018.
  /// </li>
  /// <li>
  /// <b>Status</b>: Specify a valid command status to see a list of all command
  /// executions with that status. Status values you can specify include:
  ///
  /// <ul>
  /// <li>
  /// <code>Pending</code>
  /// </li>
  /// <li>
  /// <code>InProgress</code>
  /// </li>
  /// <li>
  /// <code>Success</code>
  /// </li>
  /// <li>
  /// <code>Cancelled</code>
  /// </li>
  /// <li>
  /// <code>Failed</code>
  /// </li>
  /// <li>
  /// <code>TimedOut</code>
  /// </li>
  /// <li>
  /// <code>Cancelling</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>DocumentName</b>: Specify name of the SSM document for which you want to
  /// see command execution results. For example, specify
  /// <code>AWS-RunPatchBaseline</code> to see command executions that used this
  /// SSM document to perform security patching operations on instances.
  /// </li>
  /// <li>
  /// <b>ExecutionStage</b>: Specify one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Executing</code>: Returns a list of command executions that are
  /// currently still running.
  /// </li>
  /// <li>
  /// <code>Complete</code>: Returns a list of command executions that have
  /// already completed.
  /// </li>
  /// </ul> </li>
  /// </ul>
  @_s.JsonKey(name: 'value')
  final String value;

  CommandFilter({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$CommandFilterToJson(this);
}

enum CommandFilterKey {
  @_s.JsonValue('InvokedAfter')
  invokedAfter,
  @_s.JsonValue('InvokedBefore')
  invokedBefore,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('ExecutionStage')
  executionStage,
  @_s.JsonValue('DocumentName')
  documentName,
}

/// An invocation is copy of a command sent to a specific instance. A command
/// can apply to one or more instances. A command invocation applies to one
/// instance. For example, if a user runs SendCommand against three instances,
/// then a command invocation is created for each requested instance ID. A
/// command invocation returns status and detail information about a command you
/// ran.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommandInvocation {
  /// CloudWatch Logs information where you want Systems Manager to send the
  /// command output.
  @_s.JsonKey(name: 'CloudWatchOutputConfig')
  final CloudWatchOutputConfig cloudWatchOutputConfig;

  /// The command against which this invocation was requested.
  @_s.JsonKey(name: 'CommandId')
  final String commandId;
  @_s.JsonKey(name: 'CommandPlugins')
  final List<CommandPlugin> commandPlugins;

  /// User-specified information about the command, such as a brief description of
  /// what the command should do.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// The document name that was requested for execution.
  @_s.JsonKey(name: 'DocumentName')
  final String documentName;

  /// The SSM document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The instance ID in which this invocation was requested.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The name of the invocation target. For EC2 instances this is the value for
  /// the aws:Name tag. For on-premises instances, this is the name of the
  /// instance.
  @_s.JsonKey(name: 'InstanceName')
  final String instanceName;

  /// Configurations for sending notifications about command status changes on a
  /// per instance basis.
  @_s.JsonKey(name: 'NotificationConfig')
  final NotificationConfig notificationConfig;

  /// The time and date the request was sent to this instance.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RequestedDateTime')
  final DateTime requestedDateTime;

  /// The IAM service role that Run Command uses to act on your behalf when
  /// sending notifications about command status changes on a per instance basis.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// The URL to the plugin's StdErr file in Amazon S3, if the S3 bucket was
  /// defined for the parent command. For an invocation, StandardErrorUrl is
  /// populated if there is just one plugin defined for the command, and the S3
  /// bucket was defined for the command.
  @_s.JsonKey(name: 'StandardErrorUrl')
  final String standardErrorUrl;

  /// The URL to the plugin's StdOut file in Amazon S3, if the S3 bucket was
  /// defined for the parent command. For an invocation, StandardOutputUrl is
  /// populated if there is just one plugin defined for the command, and the S3
  /// bucket was defined for the command.
  @_s.JsonKey(name: 'StandardOutputUrl')
  final String standardOutputUrl;

  /// Whether or not the invocation succeeded, failed, or is pending.
  @_s.JsonKey(name: 'Status')
  final CommandInvocationStatus status;

  /// A detailed status of the command execution for each invocation (each
  /// instance targeted by the command). StatusDetails includes more information
  /// than Status because it includes states resulting from error and concurrency
  /// control parameters. StatusDetails can show different results than Status.
  /// For more information about these statuses, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding
  /// command statuses</a> in the <i>AWS Systems Manager User Guide</i>.
  /// StatusDetails can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// Pending: The command has not been sent to the instance.
  /// </li>
  /// <li>
  /// In Progress: The command has been sent to the instance but has not reached a
  /// terminal state.
  /// </li>
  /// <li>
  /// Success: The execution of the command or plugin was successfully completed.
  /// This is a terminal state.
  /// </li>
  /// <li>
  /// Delivery Timed Out: The command was not delivered to the instance before the
  /// delivery timeout expired. Delivery timeouts do not count against the parent
  /// command's MaxErrors limit, but they do contribute to whether the parent
  /// command status is Success or Incomplete. This is a terminal state.
  /// </li>
  /// <li>
  /// Execution Timed Out: Command execution started on the instance, but the
  /// execution was not complete before the execution timeout expired. Execution
  /// timeouts count against the MaxErrors limit of the parent command. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Failed: The command was not successful on the instance. For a plugin, this
  /// indicates that the result code was not zero. For a command invocation, this
  /// indicates that the result code for one or more plugins was not zero.
  /// Invocation failures count against the MaxErrors limit of the parent command.
  /// This is a terminal state.
  /// </li>
  /// <li>
  /// Canceled: The command was terminated before it was completed. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Undeliverable: The command can't be delivered to the instance. The instance
  /// might not exist or might not be responding. Undeliverable invocations don't
  /// count against the parent command's MaxErrors limit and don't contribute to
  /// whether the parent command status is Success or Incomplete. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Terminated: The parent command exceeded its MaxErrors limit and subsequent
  /// command invocations were canceled by the system. This is a terminal state.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// Gets the trace output sent by the agent.
  @_s.JsonKey(name: 'TraceOutput')
  final String traceOutput;

  CommandInvocation({
    this.cloudWatchOutputConfig,
    this.commandId,
    this.commandPlugins,
    this.comment,
    this.documentName,
    this.documentVersion,
    this.instanceId,
    this.instanceName,
    this.notificationConfig,
    this.requestedDateTime,
    this.serviceRole,
    this.standardErrorUrl,
    this.standardOutputUrl,
    this.status,
    this.statusDetails,
    this.traceOutput,
  });
  factory CommandInvocation.fromJson(Map<String, dynamic> json) =>
      _$CommandInvocationFromJson(json);
}

enum CommandInvocationStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Delayed')
  delayed,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('TimedOut')
  timedOut,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Cancelling')
  cancelling,
}

/// Describes plugin details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommandPlugin {
  /// The name of the plugin. Must be one of the following: aws:updateAgent,
  /// aws:domainjoin, aws:applications, aws:runPowerShellScript, aws:psmodule,
  /// aws:cloudWatch, aws:runShellScript, or aws:updateSSMAgent.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Output of the plugin execution.
  @_s.JsonKey(name: 'Output')
  final String output;

  /// The S3 bucket where the responses to the command executions should be
  /// stored. This was requested when issuing the command. For example, in the
  /// following response:
  ///
  /// doc-example-bucket/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-02573cafcfEXAMPLE/awsrunShellScript
  ///
  /// doc-example-bucket is the name of the S3 bucket;
  ///
  /// ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix is the name of the S3 prefix;
  ///
  /// i-02573cafcfEXAMPLE is the instance ID;
  ///
  /// awsrunShellScript is the name of the plugin.
  @_s.JsonKey(name: 'OutputS3BucketName')
  final String outputS3BucketName;

  /// The S3 directory path inside the bucket where the responses to the command
  /// executions should be stored. This was requested when issuing the command.
  /// For example, in the following response:
  ///
  /// doc-example-bucket/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-02573cafcfEXAMPLE/awsrunShellScript
  ///
  /// doc-example-bucket is the name of the S3 bucket;
  ///
  /// ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix is the name of the S3 prefix;
  ///
  /// i-02573cafcfEXAMPLE is the instance ID;
  ///
  /// awsrunShellScript is the name of the plugin.
  @_s.JsonKey(name: 'OutputS3KeyPrefix')
  final String outputS3KeyPrefix;

  /// (Deprecated) You can no longer specify this parameter. The system ignores
  /// it. Instead, Systems Manager automatically determines the S3 bucket region.
  @_s.JsonKey(name: 'OutputS3Region')
  final String outputS3Region;

  /// A numeric response code generated after running the plugin.
  @_s.JsonKey(name: 'ResponseCode')
  final int responseCode;

  /// The time the plugin stopped running. Could stop prematurely if, for example,
  /// a cancel command was sent.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ResponseFinishDateTime')
  final DateTime responseFinishDateTime;

  /// The time the plugin started running.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ResponseStartDateTime')
  final DateTime responseStartDateTime;

  /// The URL for the complete text written by the plugin to stderr. If execution
  /// is not yet complete, then this string is empty.
  @_s.JsonKey(name: 'StandardErrorUrl')
  final String standardErrorUrl;

  /// The URL for the complete text written by the plugin to stdout in Amazon S3.
  /// If the S3 bucket for the command was not specified, then this string is
  /// empty.
  @_s.JsonKey(name: 'StandardOutputUrl')
  final String standardOutputUrl;

  /// The status of this plugin. You can run a document with multiple plugins.
  @_s.JsonKey(name: 'Status')
  final CommandPluginStatus status;

  /// A detailed status of the plugin execution. StatusDetails includes more
  /// information than Status because it includes states resulting from error and
  /// concurrency control parameters. StatusDetails can show different results
  /// than Status. For more information about these statuses, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding
  /// command statuses</a> in the <i>AWS Systems Manager User Guide</i>.
  /// StatusDetails can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// Pending: The command has not been sent to the instance.
  /// </li>
  /// <li>
  /// In Progress: The command has been sent to the instance but has not reached a
  /// terminal state.
  /// </li>
  /// <li>
  /// Success: The execution of the command or plugin was successfully completed.
  /// This is a terminal state.
  /// </li>
  /// <li>
  /// Delivery Timed Out: The command was not delivered to the instance before the
  /// delivery timeout expired. Delivery timeouts do not count against the parent
  /// command's MaxErrors limit, but they do contribute to whether the parent
  /// command status is Success or Incomplete. This is a terminal state.
  /// </li>
  /// <li>
  /// Execution Timed Out: Command execution started on the instance, but the
  /// execution was not complete before the execution timeout expired. Execution
  /// timeouts count against the MaxErrors limit of the parent command. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Failed: The command was not successful on the instance. For a plugin, this
  /// indicates that the result code was not zero. For a command invocation, this
  /// indicates that the result code for one or more plugins was not zero.
  /// Invocation failures count against the MaxErrors limit of the parent command.
  /// This is a terminal state.
  /// </li>
  /// <li>
  /// Canceled: The command was terminated before it was completed. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Undeliverable: The command can't be delivered to the instance. The instance
  /// might not exist, or it might not be responding. Undeliverable invocations
  /// don't count against the parent command's MaxErrors limit, and they don't
  /// contribute to whether the parent command status is Success or Incomplete.
  /// This is a terminal state.
  /// </li>
  /// <li>
  /// Terminated: The parent command exceeded its MaxErrors limit and subsequent
  /// command invocations were canceled by the system. This is a terminal state.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  CommandPlugin({
    this.name,
    this.output,
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
    this.outputS3Region,
    this.responseCode,
    this.responseFinishDateTime,
    this.responseStartDateTime,
    this.standardErrorUrl,
    this.standardOutputUrl,
    this.status,
    this.statusDetails,
  });
  factory CommandPlugin.fromJson(Map<String, dynamic> json) =>
      _$CommandPluginFromJson(json);
}

enum CommandPluginStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('TimedOut')
  timedOut,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Failed')
  failed,
}

enum CommandStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('TimedOut')
  timedOut,
  @_s.JsonValue('Cancelling')
  cancelling,
}

/// A summary of the call execution that includes an execution ID, the type of
/// execution (for example, <code>Command</code>), and the date/time of the
/// execution using a datetime object that is saved in the following format:
/// yyyy-MM-dd'T'HH:mm:ss'Z'.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComplianceExecutionSummary {
  /// The time the execution ran as a datetime object that is saved in the
  /// following format: yyyy-MM-dd'T'HH:mm:ss'Z'.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionTime')
  final DateTime executionTime;

  /// An ID created by the system when <code>PutComplianceItems</code> was called.
  /// For example, <code>CommandID</code> is a valid execution ID. You can use
  /// this ID in subsequent calls.
  @_s.JsonKey(name: 'ExecutionId')
  final String executionId;

  /// The type of execution. For example, <code>Command</code> is a valid
  /// execution type.
  @_s.JsonKey(name: 'ExecutionType')
  final String executionType;

  ComplianceExecutionSummary({
    @_s.required this.executionTime,
    this.executionId,
    this.executionType,
  });
  factory ComplianceExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$ComplianceExecutionSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ComplianceExecutionSummaryToJson(this);
}

/// Information about the compliance as defined by the resource type. For
/// example, for a patch resource type, <code>Items</code> includes information
/// about the PatchSeverity, Classification, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceItem {
  /// The compliance type. For example, Association (for a State Manager
  /// association), Patch, or Custom:<code>string</code> are all valid compliance
  /// types.
  @_s.JsonKey(name: 'ComplianceType')
  final String complianceType;

  /// A "Key": "Value" tag combination for the compliance item.
  @_s.JsonKey(name: 'Details')
  final Map<String, String> details;

  /// A summary for the compliance item. The summary includes an execution ID, the
  /// execution type (for example, command), and the execution time.
  @_s.JsonKey(name: 'ExecutionSummary')
  final ComplianceExecutionSummary executionSummary;

  /// An ID for the compliance item. For example, if the compliance item is a
  /// Windows patch, the ID could be the number of the KB article; for example:
  /// KB4010320.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// An ID for the resource. For a managed instance, this is the instance ID.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of resource. <code>ManagedInstance</code> is currently the only
  /// supported resource type.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The severity of the compliance status. Severity can be one of the following:
  /// Critical, High, Medium, Low, Informational, Unspecified.
  @_s.JsonKey(name: 'Severity')
  final ComplianceSeverity severity;

  /// The status of the compliance item. An item is either COMPLIANT,
  /// NON_COMPLIANT, or an empty string (for Windows patches that aren't
  /// applicable).
  @_s.JsonKey(name: 'Status')
  final ComplianceStatus status;

  /// A title for the compliance item. For example, if the compliance item is a
  /// Windows patch, the title could be the title of the KB article for the patch;
  /// for example: Security Update for Active Directory Federation Services.
  @_s.JsonKey(name: 'Title')
  final String title;

  ComplianceItem({
    this.complianceType,
    this.details,
    this.executionSummary,
    this.id,
    this.resourceId,
    this.resourceType,
    this.severity,
    this.status,
    this.title,
  });
  factory ComplianceItem.fromJson(Map<String, dynamic> json) =>
      _$ComplianceItemFromJson(json);
}

/// Information about a compliance item.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ComplianceItemEntry {
  /// The severity of the compliance status. Severity can be one of the following:
  /// Critical, High, Medium, Low, Informational, Unspecified.
  @_s.JsonKey(name: 'Severity')
  final ComplianceSeverity severity;

  /// The status of the compliance item. An item is either COMPLIANT or
  /// NON_COMPLIANT.
  @_s.JsonKey(name: 'Status')
  final ComplianceStatus status;

  /// A "Key": "Value" tag combination for the compliance item.
  @_s.JsonKey(name: 'Details')
  final Map<String, String> details;

  /// The compliance item ID. For example, if the compliance item is a Windows
  /// patch, the ID could be the number of the KB article.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The title of the compliance item. For example, if the compliance item is a
  /// Windows patch, the title could be the title of the KB article for the patch;
  /// for example: Security Update for Active Directory Federation Services.
  @_s.JsonKey(name: 'Title')
  final String title;

  ComplianceItemEntry({
    @_s.required this.severity,
    @_s.required this.status,
    this.details,
    this.id,
    this.title,
  });
  Map<String, dynamic> toJson() => _$ComplianceItemEntryToJson(this);
}

enum ComplianceQueryOperatorType {
  @_s.JsonValue('EQUAL')
  equal,
  @_s.JsonValue('NOT_EQUAL')
  notEqual,
  @_s.JsonValue('BEGIN_WITH')
  beginWith,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
}

enum ComplianceSeverity {
  @_s.JsonValue('CRITICAL')
  critical,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('INFORMATIONAL')
  informational,
  @_s.JsonValue('UNSPECIFIED')
  unspecified,
}

enum ComplianceStatus {
  @_s.JsonValue('COMPLIANT')
  compliant,
  @_s.JsonValue('NON_COMPLIANT')
  nonCompliant,
}

/// One or more filters. Use a filter to return a more specific list of results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ComplianceStringFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The type of comparison that should be performed for the value: Equal,
  /// NotEqual, BeginWith, LessThan, or GreaterThan.
  @_s.JsonKey(name: 'Type')
  final ComplianceQueryOperatorType type;

  /// The value for which to search.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  ComplianceStringFilter({
    this.key,
    this.type,
    this.values,
  });
  Map<String, dynamic> toJson() => _$ComplianceStringFilterToJson(this);
}

/// A summary of compliance information by compliance type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceSummaryItem {
  /// The type of compliance item. For example, the compliance type can be
  /// Association, Patch, or Custom:string.
  @_s.JsonKey(name: 'ComplianceType')
  final String complianceType;

  /// A list of COMPLIANT items for the specified compliance type.
  @_s.JsonKey(name: 'CompliantSummary')
  final CompliantSummary compliantSummary;

  /// A list of NON_COMPLIANT items for the specified compliance type.
  @_s.JsonKey(name: 'NonCompliantSummary')
  final NonCompliantSummary nonCompliantSummary;

  ComplianceSummaryItem({
    this.complianceType,
    this.compliantSummary,
    this.nonCompliantSummary,
  });
  factory ComplianceSummaryItem.fromJson(Map<String, dynamic> json) =>
      _$ComplianceSummaryItemFromJson(json);
}

enum ComplianceUploadType {
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('PARTIAL')
  partial,
}

extension on ComplianceUploadType {
  String toValue() {
    switch (this) {
      case ComplianceUploadType.complete:
        return 'COMPLETE';
      case ComplianceUploadType.partial:
        return 'PARTIAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A summary of resources that are compliant. The summary is organized
/// according to the resource count for each compliance type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompliantSummary {
  /// The total number of resources that are compliant.
  @_s.JsonKey(name: 'CompliantCount')
  final int compliantCount;

  /// A summary of the compliance severity by compliance type.
  @_s.JsonKey(name: 'SeveritySummary')
  final SeveritySummary severitySummary;

  CompliantSummary({
    this.compliantCount,
    this.severitySummary,
  });
  factory CompliantSummary.fromJson(Map<String, dynamic> json) =>
      _$CompliantSummaryFromJson(json);
}

enum ConnectionStatus {
  @_s.JsonValue('Connected')
  connected,
  @_s.JsonValue('NotConnected')
  notConnected,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateActivationResult {
  /// The code the system generates when it processes the activation. The
  /// activation code functions like a password to validate the activation ID.
  @_s.JsonKey(name: 'ActivationCode')
  final String activationCode;

  /// The ID number generated by the system when it processed the activation. The
  /// activation ID functions like a user name.
  @_s.JsonKey(name: 'ActivationId')
  final String activationId;

  CreateActivationResult({
    this.activationCode,
    this.activationId,
  });
  factory CreateActivationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateActivationResultFromJson(json);
}

/// Describes the association of a Systems Manager SSM document and an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateAssociationBatchRequestEntry {
  /// The name of the SSM document that contains the configuration information for
  /// the instance. You can specify Command or Automation documents.
  ///
  /// You can specify AWS-predefined documents, documents you created, or a
  /// document that is shared with you from another account.
  ///
  /// For SSM documents that are shared with you from other AWS accounts, you must
  /// specify the complete SSM document ARN, in the following format:
  ///
  /// <code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:document/<i>document-name</i>
  /// </code>
  ///
  /// For example:
  ///
  /// <code>arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document</code>
  ///
  /// For AWS-predefined documents and SSM documents you created in your account,
  /// you only need to specify the document name. For example,
  /// <code>AWS-ApplyPatchBaseline</code> or <code>My-Document</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// By default, when you create a new associations, the system runs it
  /// immediately after it is created and then according to the schedule you
  /// specified. Specify this option if you don't want an association to run
  /// immediately after you create it. This parameter is not supported for rate
  /// expressions.
  @_s.JsonKey(name: 'ApplyOnlyAtCronInterval')
  final bool applyOnlyAtCronInterval;

  /// Specify a descriptive name for the association.
  @_s.JsonKey(name: 'AssociationName')
  final String associationName;

  /// Specify the target for the association. This target is required for
  /// associations that use an Automation document and target resources by using
  /// rate controls.
  @_s.JsonKey(name: 'AutomationTargetParameterName')
  final String automationTargetParameterName;

  /// The severity level to assign to the association.
  @_s.JsonKey(name: 'ComplianceSeverity')
  final AssociationComplianceSeverity complianceSeverity;

  /// The document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The ID of the instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will process
  /// its association within the limit specified for MaxConcurrency.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of the
  /// target set, for example 10%. If you specify 3, for example, the system stops
  /// sending requests when the fourth error is received. If you specify 0, then
  /// the system stops sending requests after the first error is returned. If you
  /// run an association on 50 instances and set MaxError to 10%, then the system
  /// stops sending the request when the sixth error is received.
  ///
  /// Executions that are already running an association when MaxErrors is reached
  /// are allowed to complete, but some of these executions may fail as well. If
  /// you need to ensure that there won't be more than max-errors failed
  /// executions, set MaxConcurrency to 1 so that executions proceed one at a
  /// time.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// An S3 bucket where you want to store the results of this request.
  @_s.JsonKey(name: 'OutputLocation')
  final InstanceAssociationOutputLocation outputLocation;

  /// A description of the parameters for a document.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  /// A cron expression that specifies a schedule when the association runs.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// The mode for generating association compliance. You can specify
  /// <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the
  /// system uses the status of the association execution to determine the
  /// compliance status. If the association execution runs successfully, then the
  /// association is <code>COMPLIANT</code>. If the association execution doesn't
  /// run successfully, the association is <code>NON-COMPLIANT</code>.
  ///
  /// In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code>
  /// as a parameter for the <a>PutComplianceItems</a> API action. In this case,
  /// compliance data is not managed by State Manager. It is managed by your
  /// direct call to the <a>PutComplianceItems</a> API action.
  ///
  /// By default, all associations use <code>AUTO</code> mode.
  @_s.JsonKey(name: 'SyncCompliance')
  final AssociationSyncCompliance syncCompliance;

  /// Use this action to create an association in multiple Regions and multiple
  /// accounts.
  @_s.JsonKey(name: 'TargetLocations')
  final List<TargetLocation> targetLocations;

  /// The instances targeted by the request.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  CreateAssociationBatchRequestEntry({
    @_s.required this.name,
    this.applyOnlyAtCronInterval,
    this.associationName,
    this.automationTargetParameterName,
    this.complianceSeverity,
    this.documentVersion,
    this.instanceId,
    this.maxConcurrency,
    this.maxErrors,
    this.outputLocation,
    this.parameters,
    this.scheduleExpression,
    this.syncCompliance,
    this.targetLocations,
    this.targets,
  });
  factory CreateAssociationBatchRequestEntry.fromJson(
          Map<String, dynamic> json) =>
      _$CreateAssociationBatchRequestEntryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateAssociationBatchRequestEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssociationBatchResult {
  /// Information about the associations that failed.
  @_s.JsonKey(name: 'Failed')
  final List<FailedCreateAssociation> failed;

  /// Information about the associations that succeeded.
  @_s.JsonKey(name: 'Successful')
  final List<AssociationDescription> successful;

  CreateAssociationBatchResult({
    this.failed,
    this.successful,
  });
  factory CreateAssociationBatchResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAssociationBatchResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssociationResult {
  /// Information about the association.
  @_s.JsonKey(name: 'AssociationDescription')
  final AssociationDescription associationDescription;

  CreateAssociationResult({
    this.associationDescription,
  });
  factory CreateAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAssociationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDocumentResult {
  /// Information about the Systems Manager document.
  @_s.JsonKey(name: 'DocumentDescription')
  final DocumentDescription documentDescription;

  CreateDocumentResult({
    this.documentDescription,
  });
  factory CreateDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDocumentResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMaintenanceWindowResult {
  /// The ID of the created maintenance window.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  CreateMaintenanceWindowResult({
    this.windowId,
  });
  factory CreateMaintenanceWindowResult.fromJson(Map<String, dynamic> json) =>
      _$CreateMaintenanceWindowResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOpsItemResponse {
  /// The ID of the OpsItem.
  @_s.JsonKey(name: 'OpsItemId')
  final String opsItemId;

  CreateOpsItemResponse({
    this.opsItemId,
  });
  factory CreateOpsItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOpsItemResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOpsMetadataResult {
  /// The Amazon Resource Name (ARN) of the OpsMetadata Object or blob created by
  /// the call.
  @_s.JsonKey(name: 'OpsMetadataArn')
  final String opsMetadataArn;

  CreateOpsMetadataResult({
    this.opsMetadataArn,
  });
  factory CreateOpsMetadataResult.fromJson(Map<String, dynamic> json) =>
      _$CreateOpsMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePatchBaselineResult {
  /// The ID of the created patch baseline.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  CreatePatchBaselineResult({
    this.baselineId,
  });
  factory CreatePatchBaselineResult.fromJson(Map<String, dynamic> json) =>
      _$CreatePatchBaselineResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResourceDataSyncResult {
  CreateResourceDataSyncResult();
  factory CreateResourceDataSyncResult.fromJson(Map<String, dynamic> json) =>
      _$CreateResourceDataSyncResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteActivationResult {
  DeleteActivationResult();
  factory DeleteActivationResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteActivationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAssociationResult {
  DeleteAssociationResult();
  factory DeleteAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssociationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDocumentResult {
  DeleteDocumentResult();
  factory DeleteDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDocumentResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInventoryResult {
  /// Every <code>DeleteInventory</code> action is assigned a unique ID. This
  /// option returns a unique ID. You can use this ID to query the status of a
  /// delete operation. This option is useful for ensuring that a delete operation
  /// has completed before you begin other actions.
  @_s.JsonKey(name: 'DeletionId')
  final String deletionId;

  /// A summary of the delete operation. For more information about this summary,
  /// see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-custom.html#sysman-inventory-delete-summary">Deleting
  /// custom inventory</a> in the <i>AWS Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'DeletionSummary')
  final InventoryDeletionSummary deletionSummary;

  /// The name of the inventory data type specified in the request.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  DeleteInventoryResult({
    this.deletionId,
    this.deletionSummary,
    this.typeName,
  });
  factory DeleteInventoryResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteInventoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMaintenanceWindowResult {
  /// The ID of the deleted maintenance window.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  DeleteMaintenanceWindowResult({
    this.windowId,
  });
  factory DeleteMaintenanceWindowResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteMaintenanceWindowResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteOpsMetadataResult {
  DeleteOpsMetadataResult();
  factory DeleteOpsMetadataResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteOpsMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteParameterResult {
  DeleteParameterResult();
  factory DeleteParameterResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteParameterResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteParametersResult {
  /// The names of the deleted parameters.
  @_s.JsonKey(name: 'DeletedParameters')
  final List<String> deletedParameters;

  /// The names of parameters that weren't deleted because the parameters are not
  /// valid.
  @_s.JsonKey(name: 'InvalidParameters')
  final List<String> invalidParameters;

  DeleteParametersResult({
    this.deletedParameters,
    this.invalidParameters,
  });
  factory DeleteParametersResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteParametersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePatchBaselineResult {
  /// The ID of the deleted patch baseline.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  DeletePatchBaselineResult({
    this.baselineId,
  });
  factory DeletePatchBaselineResult.fromJson(Map<String, dynamic> json) =>
      _$DeletePatchBaselineResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourceDataSyncResult {
  DeleteResourceDataSyncResult();
  factory DeleteResourceDataSyncResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourceDataSyncResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterManagedInstanceResult {
  DeregisterManagedInstanceResult();
  factory DeregisterManagedInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$DeregisterManagedInstanceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterPatchBaselineForPatchGroupResult {
  /// The ID of the patch baseline the patch group was deregistered from.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The name of the patch group deregistered from the patch baseline.
  @_s.JsonKey(name: 'PatchGroup')
  final String patchGroup;

  DeregisterPatchBaselineForPatchGroupResult({
    this.baselineId,
    this.patchGroup,
  });
  factory DeregisterPatchBaselineForPatchGroupResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeregisterPatchBaselineForPatchGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterTargetFromMaintenanceWindowResult {
  /// The ID of the maintenance window the target was removed from.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  /// The ID of the removed target definition.
  @_s.JsonKey(name: 'WindowTargetId')
  final String windowTargetId;

  DeregisterTargetFromMaintenanceWindowResult({
    this.windowId,
    this.windowTargetId,
  });
  factory DeregisterTargetFromMaintenanceWindowResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeregisterTargetFromMaintenanceWindowResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterTaskFromMaintenanceWindowResult {
  /// The ID of the maintenance window the task was removed from.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  /// The ID of the task removed from the maintenance window.
  @_s.JsonKey(name: 'WindowTaskId')
  final String windowTaskId;

  DeregisterTaskFromMaintenanceWindowResult({
    this.windowId,
    this.windowTaskId,
  });
  factory DeregisterTaskFromMaintenanceWindowResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeregisterTaskFromMaintenanceWindowResultFromJson(json);
}

/// Filter for the DescribeActivation API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeActivationsFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'FilterKey')
  final DescribeActivationsFilterKeys filterKey;

  /// The filter values.
  @_s.JsonKey(name: 'FilterValues')
  final List<String> filterValues;

  DescribeActivationsFilter({
    this.filterKey,
    this.filterValues,
  });
  Map<String, dynamic> toJson() => _$DescribeActivationsFilterToJson(this);
}

enum DescribeActivationsFilterKeys {
  @_s.JsonValue('ActivationIds')
  activationIds,
  @_s.JsonValue('DefaultInstanceName')
  defaultInstanceName,
  @_s.JsonValue('IamRole')
  iamRole,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeActivationsResult {
  /// A list of activations for your AWS account.
  @_s.JsonKey(name: 'ActivationList')
  final List<Activation> activationList;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeActivationsResult({
    this.activationList,
    this.nextToken,
  });
  factory DescribeActivationsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeActivationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAssociationExecutionTargetsResult {
  /// Information about the execution.
  @_s.JsonKey(name: 'AssociationExecutionTargets')
  final List<AssociationExecutionTarget> associationExecutionTargets;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAssociationExecutionTargetsResult({
    this.associationExecutionTargets,
    this.nextToken,
  });
  factory DescribeAssociationExecutionTargetsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAssociationExecutionTargetsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAssociationExecutionsResult {
  /// A list of the executions for the specified association ID.
  @_s.JsonKey(name: 'AssociationExecutions')
  final List<AssociationExecution> associationExecutions;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAssociationExecutionsResult({
    this.associationExecutions,
    this.nextToken,
  });
  factory DescribeAssociationExecutionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAssociationExecutionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAssociationResult {
  /// Information about the association.
  @_s.JsonKey(name: 'AssociationDescription')
  final AssociationDescription associationDescription;

  DescribeAssociationResult({
    this.associationDescription,
  });
  factory DescribeAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeAssociationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAutomationExecutionsResult {
  /// The list of details about each automation execution which has occurred which
  /// matches the filter specification, if any.
  @_s.JsonKey(name: 'AutomationExecutionMetadataList')
  final List<AutomationExecutionMetadata> automationExecutionMetadataList;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAutomationExecutionsResult({
    this.automationExecutionMetadataList,
    this.nextToken,
  });
  factory DescribeAutomationExecutionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAutomationExecutionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAutomationStepExecutionsResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of details about the current state of all steps that make up an
  /// execution.
  @_s.JsonKey(name: 'StepExecutions')
  final List<StepExecution> stepExecutions;

  DescribeAutomationStepExecutionsResult({
    this.nextToken,
    this.stepExecutions,
  });
  factory DescribeAutomationStepExecutionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAutomationStepExecutionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAvailablePatchesResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of patches. Each entry in the array is a patch structure.
  @_s.JsonKey(name: 'Patches')
  final List<Patch> patches;

  DescribeAvailablePatchesResult({
    this.nextToken,
    this.patches,
  });
  factory DescribeAvailablePatchesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeAvailablePatchesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDocumentPermissionResponse {
  /// The account IDs that have permission to use this document. The ID can be
  /// either an AWS account or <i>All</i>.
  @_s.JsonKey(name: 'AccountIds')
  final List<String> accountIds;

  /// A list of AWS accounts where the current document is shared and the version
  /// shared with each account.
  @_s.JsonKey(name: 'AccountSharingInfoList')
  final List<AccountSharingInfo> accountSharingInfoList;

  DescribeDocumentPermissionResponse({
    this.accountIds,
    this.accountSharingInfoList,
  });
  factory DescribeDocumentPermissionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDocumentPermissionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDocumentResult {
  /// Information about the Systems Manager document.
  @_s.JsonKey(name: 'Document')
  final DocumentDescription document;

  DescribeDocumentResult({
    this.document,
  });
  factory DescribeDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeDocumentResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEffectiveInstanceAssociationsResult {
  /// The associations for the requested instance.
  @_s.JsonKey(name: 'Associations')
  final List<InstanceAssociation> associations;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeEffectiveInstanceAssociationsResult({
    this.associations,
    this.nextToken,
  });
  factory DescribeEffectiveInstanceAssociationsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEffectiveInstanceAssociationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEffectivePatchesForPatchBaselineResult {
  /// An array of patches and patch status.
  @_s.JsonKey(name: 'EffectivePatches')
  final List<EffectivePatch> effectivePatches;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeEffectivePatchesForPatchBaselineResult({
    this.effectivePatches,
    this.nextToken,
  });
  factory DescribeEffectivePatchesForPatchBaselineResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEffectivePatchesForPatchBaselineResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstanceAssociationsStatusResult {
  /// Status information about the association.
  @_s.JsonKey(name: 'InstanceAssociationStatusInfos')
  final List<InstanceAssociationStatusInfo> instanceAssociationStatusInfos;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeInstanceAssociationsStatusResult({
    this.instanceAssociationStatusInfos,
    this.nextToken,
  });
  factory DescribeInstanceAssociationsStatusResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInstanceAssociationsStatusResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstanceInformationResult {
  /// The instance information list.
  @_s.JsonKey(name: 'InstanceInformationList')
  final List<InstanceInformation> instanceInformationList;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeInstanceInformationResult({
    this.instanceInformationList,
    this.nextToken,
  });
  factory DescribeInstanceInformationResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInstanceInformationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstancePatchStatesForPatchGroupResult {
  /// The high-level patch state for the requested instances.
  @_s.JsonKey(name: 'InstancePatchStates')
  final List<InstancePatchState> instancePatchStates;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeInstancePatchStatesForPatchGroupResult({
    this.instancePatchStates,
    this.nextToken,
  });
  factory DescribeInstancePatchStatesForPatchGroupResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInstancePatchStatesForPatchGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstancePatchStatesResult {
  /// The high-level patch state for the requested instances.
  @_s.JsonKey(name: 'InstancePatchStates')
  final List<InstancePatchState> instancePatchStates;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeInstancePatchStatesResult({
    this.instancePatchStates,
    this.nextToken,
  });
  factory DescribeInstancePatchStatesResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInstancePatchStatesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstancePatchesResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Each entry in the array is a structure containing:
  ///
  /// Title (string)
  ///
  /// KBId (string)
  ///
  /// Classification (string)
  ///
  /// Severity (string)
  ///
  /// State (string, such as "INSTALLED" or "FAILED")
  ///
  /// InstalledTime (DateTime)
  ///
  /// InstalledBy (string)
  @_s.JsonKey(name: 'Patches')
  final List<PatchComplianceData> patches;

  DescribeInstancePatchesResult({
    this.nextToken,
    this.patches,
  });
  factory DescribeInstancePatchesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeInstancePatchesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInventoryDeletionsResult {
  /// A list of status items for deleted inventory.
  @_s.JsonKey(name: 'InventoryDeletions')
  final List<InventoryDeletionStatusItem> inventoryDeletions;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeInventoryDeletionsResult({
    this.inventoryDeletions,
    this.nextToken,
  });
  factory DescribeInventoryDeletionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInventoryDeletionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowExecutionTaskInvocationsResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the task invocation results per invocation.
  @_s.JsonKey(name: 'WindowExecutionTaskInvocationIdentities')
  final List<MaintenanceWindowExecutionTaskInvocationIdentity>
      windowExecutionTaskInvocationIdentities;

  DescribeMaintenanceWindowExecutionTaskInvocationsResult({
    this.nextToken,
    this.windowExecutionTaskInvocationIdentities,
  });
  factory DescribeMaintenanceWindowExecutionTaskInvocationsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowExecutionTaskInvocationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowExecutionTasksResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the task executions.
  @_s.JsonKey(name: 'WindowExecutionTaskIdentities')
  final List<MaintenanceWindowExecutionTaskIdentity>
      windowExecutionTaskIdentities;

  DescribeMaintenanceWindowExecutionTasksResult({
    this.nextToken,
    this.windowExecutionTaskIdentities,
  });
  factory DescribeMaintenanceWindowExecutionTasksResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowExecutionTasksResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowExecutionsResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the maintenance window executions.
  @_s.JsonKey(name: 'WindowExecutions')
  final List<MaintenanceWindowExecution> windowExecutions;

  DescribeMaintenanceWindowExecutionsResult({
    this.nextToken,
    this.windowExecutions,
  });
  factory DescribeMaintenanceWindowExecutionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowExecutionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowScheduleResult {
  /// The token for the next set of items to return. (You use this token in the
  /// next call.)
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about maintenance window executions scheduled for the specified
  /// time range.
  @_s.JsonKey(name: 'ScheduledWindowExecutions')
  final List<ScheduledWindowExecution> scheduledWindowExecutions;

  DescribeMaintenanceWindowScheduleResult({
    this.nextToken,
    this.scheduledWindowExecutions,
  });
  factory DescribeMaintenanceWindowScheduleResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowScheduleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowTargetsResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the targets in the maintenance window.
  @_s.JsonKey(name: 'Targets')
  final List<MaintenanceWindowTarget> targets;

  DescribeMaintenanceWindowTargetsResult({
    this.nextToken,
    this.targets,
  });
  factory DescribeMaintenanceWindowTargetsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowTargetsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowTasksResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the tasks in the maintenance window.
  @_s.JsonKey(name: 'Tasks')
  final List<MaintenanceWindowTask> tasks;

  DescribeMaintenanceWindowTasksResult({
    this.nextToken,
    this.tasks,
  });
  factory DescribeMaintenanceWindowTasksResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowTasksResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowsForTargetResult {
  /// The token for the next set of items to return. (You use this token in the
  /// next call.)
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the maintenance window targets and tasks an instance is
  /// associated with.
  @_s.JsonKey(name: 'WindowIdentities')
  final List<MaintenanceWindowIdentityForTarget> windowIdentities;

  DescribeMaintenanceWindowsForTargetResult({
    this.nextToken,
    this.windowIdentities,
  });
  factory DescribeMaintenanceWindowsForTargetResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowsForTargetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceWindowsResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the maintenance windows.
  @_s.JsonKey(name: 'WindowIdentities')
  final List<MaintenanceWindowIdentity> windowIdentities;

  DescribeMaintenanceWindowsResult({
    this.nextToken,
    this.windowIdentities,
  });
  factory DescribeMaintenanceWindowsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceWindowsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOpsItemsResponse {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of OpsItems.
  @_s.JsonKey(name: 'OpsItemSummaries')
  final List<OpsItemSummary> opsItemSummaries;

  DescribeOpsItemsResponse({
    this.nextToken,
    this.opsItemSummaries,
  });
  factory DescribeOpsItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeOpsItemsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeParametersResult {
  /// The token to use when requesting the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Parameters returned by the request.
  @_s.JsonKey(name: 'Parameters')
  final List<ParameterMetadata> parameters;

  DescribeParametersResult({
    this.nextToken,
    this.parameters,
  });
  factory DescribeParametersResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeParametersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePatchBaselinesResult {
  /// An array of PatchBaselineIdentity elements.
  @_s.JsonKey(name: 'BaselineIdentities')
  final List<PatchBaselineIdentity> baselineIdentities;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribePatchBaselinesResult({
    this.baselineIdentities,
    this.nextToken,
  });
  factory DescribePatchBaselinesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribePatchBaselinesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePatchGroupStateResult {
  /// The number of instances in the patch group.
  @_s.JsonKey(name: 'Instances')
  final int instances;

  /// The number of instances with patches from the patch baseline that failed to
  /// install.
  @_s.JsonKey(name: 'InstancesWithFailedPatches')
  final int instancesWithFailedPatches;

  /// The number of instances with patches installed that aren't defined in the
  /// patch baseline.
  @_s.JsonKey(name: 'InstancesWithInstalledOtherPatches')
  final int instancesWithInstalledOtherPatches;

  /// The number of instances with installed patches.
  @_s.JsonKey(name: 'InstancesWithInstalledPatches')
  final int instancesWithInstalledPatches;

  /// The number of instances with patches installed by Patch Manager that have
  /// not been rebooted after the patch installation. The status of these
  /// instances is NON_COMPLIANT.
  @_s.JsonKey(name: 'InstancesWithInstalledPendingRebootPatches')
  final int instancesWithInstalledPendingRebootPatches;

  /// The number of instances with patches installed that are specified in a
  /// RejectedPatches list. Patches with a status of <i>INSTALLED_REJECTED</i>
  /// were typically installed before they were added to a RejectedPatches list.
  /// <note>
  /// If ALLOW_AS_DEPENDENCY is the specified option for RejectedPatchesAction,
  /// the value of InstancesWithInstalledRejectedPatches will always be 0 (zero).
  /// </note>
  @_s.JsonKey(name: 'InstancesWithInstalledRejectedPatches')
  final int instancesWithInstalledRejectedPatches;

  /// The number of instances with missing patches from the patch baseline.
  @_s.JsonKey(name: 'InstancesWithMissingPatches')
  final int instancesWithMissingPatches;

  /// The number of instances with patches that aren't applicable.
  @_s.JsonKey(name: 'InstancesWithNotApplicablePatches')
  final int instancesWithNotApplicablePatches;

  /// The number of instances with <code>NotApplicable</code> patches beyond the
  /// supported limit, which are not reported by name to Systems Manager
  /// Inventory.
  @_s.JsonKey(name: 'InstancesWithUnreportedNotApplicablePatches')
  final int instancesWithUnreportedNotApplicablePatches;

  DescribePatchGroupStateResult({
    this.instances,
    this.instancesWithFailedPatches,
    this.instancesWithInstalledOtherPatches,
    this.instancesWithInstalledPatches,
    this.instancesWithInstalledPendingRebootPatches,
    this.instancesWithInstalledRejectedPatches,
    this.instancesWithMissingPatches,
    this.instancesWithNotApplicablePatches,
    this.instancesWithUnreportedNotApplicablePatches,
  });
  factory DescribePatchGroupStateResult.fromJson(Map<String, dynamic> json) =>
      _$DescribePatchGroupStateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePatchGroupsResult {
  /// Each entry in the array contains:
  ///
  /// PatchGroup: string (between 1 and 256 characters, Regex:
  /// ^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$)
  ///
  /// PatchBaselineIdentity: A PatchBaselineIdentity element.
  @_s.JsonKey(name: 'Mappings')
  final List<PatchGroupPatchBaselineMapping> mappings;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribePatchGroupsResult({
    this.mappings,
    this.nextToken,
  });
  factory DescribePatchGroupsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribePatchGroupsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePatchPropertiesResult {
  /// The token for the next set of items to return. (You use this token in the
  /// next call.)
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the properties for patches matching the filter request parameters.
  @_s.JsonKey(name: 'Properties')
  final List<Map<String, String>> properties;

  DescribePatchPropertiesResult({
    this.nextToken,
    this.properties,
  });
  factory DescribePatchPropertiesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribePatchPropertiesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSessionsResponse {
  /// The token for the next set of items to return. (You received this token from
  /// a previous call.)
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of sessions meeting the request parameters.
  @_s.JsonKey(name: 'Sessions')
  final List<Session> sessions;

  DescribeSessionsResponse({
    this.nextToken,
    this.sessions,
  });
  factory DescribeSessionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSessionsResponseFromJson(json);
}

/// A default version of a document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentDefaultVersionDescription {
  /// The default version of the document.
  @_s.JsonKey(name: 'DefaultVersion')
  final String defaultVersion;

  /// The default version of the artifact associated with the document.
  @_s.JsonKey(name: 'DefaultVersionName')
  final String defaultVersionName;

  /// The name of the document.
  @_s.JsonKey(name: 'Name')
  final String name;

  DocumentDefaultVersionDescription({
    this.defaultVersion,
    this.defaultVersionName,
    this.name,
  });
  factory DocumentDefaultVersionDescription.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentDefaultVersionDescriptionFromJson(json);
}

/// Describes a Systems Manager document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentDescription {
  /// The version of the document currently approved for use in the organization.
  @_s.JsonKey(name: 'ApprovedVersion')
  final String approvedVersion;

  /// Details about the document attachments, including names, locations, sizes,
  /// and so on.
  @_s.JsonKey(name: 'AttachmentsInformation')
  final List<AttachmentInformation> attachmentsInformation;

  /// The user in your organization who created the document.
  @_s.JsonKey(name: 'Author')
  final String author;

  /// The date when the document was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The default version.
  @_s.JsonKey(name: 'DefaultVersion')
  final String defaultVersion;

  /// A description of the document.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The document format, either JSON or YAML.
  @_s.JsonKey(name: 'DocumentFormat')
  final DocumentFormat documentFormat;

  /// The type of document.
  @_s.JsonKey(name: 'DocumentType')
  final DocumentType documentType;

  /// The document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The Sha256 or Sha1 hash created by the system when the document was created.
  /// <note>
  /// Sha1 hashes have been deprecated.
  /// </note>
  @_s.JsonKey(name: 'Hash')
  final String hash;

  /// The hash type of the document. Valid values include <code>Sha256</code> or
  /// <code>Sha1</code>.
  /// <note>
  /// Sha1 hashes have been deprecated.
  /// </note>
  @_s.JsonKey(name: 'HashType')
  final DocumentHashType hashType;

  /// The latest version of the document.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The name of the Systems Manager document.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The AWS user account that created the document.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// A description of the parameters for a document.
  @_s.JsonKey(name: 'Parameters')
  final List<DocumentParameter> parameters;

  /// The version of the document that is currently under review.
  @_s.JsonKey(name: 'PendingReviewVersion')
  final String pendingReviewVersion;

  /// The list of OS platforms compatible with this Systems Manager document.
  @_s.JsonKey(name: 'PlatformTypes')
  final List<PlatformType> platformTypes;

  /// A list of SSM documents required by a document. For example, an
  /// <code>ApplicationConfiguration</code> document requires an
  /// <code>ApplicationConfigurationSchema</code> document.
  @_s.JsonKey(name: 'Requires')
  final List<DocumentRequires> requires;

  /// Details about the review of a document.
  @_s.JsonKey(name: 'ReviewInformation')
  final List<ReviewInformation> reviewInformation;

  /// The current status of the review.
  @_s.JsonKey(name: 'ReviewStatus')
  final ReviewStatus reviewStatus;

  /// The schema version.
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The SHA1 hash of the document, which you can use for verification.
  @_s.JsonKey(name: 'Sha1')
  final String sha1;

  /// The status of the Systems Manager document.
  @_s.JsonKey(name: 'Status')
  final DocumentStatus status;

  /// A message returned by AWS Systems Manager that explains the
  /// <code>Status</code> value. For example, a <code>Failed</code> status might
  /// be explained by the <code>StatusInformation</code> message, "The specified
  /// S3 bucket does not exist. Verify that the URL of the S3 bucket is correct."
  @_s.JsonKey(name: 'StatusInformation')
  final String statusInformation;

  /// The tags, or metadata, that have been applied to the document.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The target type which defines the kinds of resources the document can run
  /// on. For example, /AWS::EC2::Instance. For a list of valid resource types,
  /// see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
  /// resource and property types reference</a> in the <i>AWS CloudFormation User
  /// Guide</i>.
  @_s.JsonKey(name: 'TargetType')
  final String targetType;

  /// The version of the artifact associated with the document.
  @_s.JsonKey(name: 'VersionName')
  final String versionName;

  DocumentDescription({
    this.approvedVersion,
    this.attachmentsInformation,
    this.author,
    this.createdDate,
    this.defaultVersion,
    this.description,
    this.documentFormat,
    this.documentType,
    this.documentVersion,
    this.hash,
    this.hashType,
    this.latestVersion,
    this.name,
    this.owner,
    this.parameters,
    this.pendingReviewVersion,
    this.platformTypes,
    this.requires,
    this.reviewInformation,
    this.reviewStatus,
    this.schemaVersion,
    this.sha1,
    this.status,
    this.statusInformation,
    this.tags,
    this.targetType,
    this.versionName,
  });
  factory DocumentDescription.fromJson(Map<String, dynamic> json) =>
      _$DocumentDescriptionFromJson(json);
}

/// This data type is deprecated. Instead, use <a>DocumentKeyValuesFilter</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DocumentFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'key')
  final DocumentFilterKey key;

  /// The value of the filter.
  @_s.JsonKey(name: 'value')
  final String value;

  DocumentFilter({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$DocumentFilterToJson(this);
}

enum DocumentFilterKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('Owner')
  owner,
  @_s.JsonValue('PlatformTypes')
  platformTypes,
  @_s.JsonValue('DocumentType')
  documentType,
}

enum DocumentFormat {
  @_s.JsonValue('YAML')
  yaml,
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('TEXT')
  text,
}

extension on DocumentFormat {
  String toValue() {
    switch (this) {
      case DocumentFormat.yaml:
        return 'YAML';
      case DocumentFormat.json:
        return 'JSON';
      case DocumentFormat.text:
        return 'TEXT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DocumentHashType {
  @_s.JsonValue('Sha256')
  sha256,
  @_s.JsonValue('Sha1')
  sha1,
}

extension on DocumentHashType {
  String toValue() {
    switch (this) {
      case DocumentHashType.sha256:
        return 'Sha256';
      case DocumentHashType.sha1:
        return 'Sha1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the name of a Systems Manager document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentIdentifier {
  /// The user in your organization who created the document.
  @_s.JsonKey(name: 'Author')
  final String author;

  /// The document format, either JSON or YAML.
  @_s.JsonKey(name: 'DocumentFormat')
  final DocumentFormat documentFormat;

  /// The document type.
  @_s.JsonKey(name: 'DocumentType')
  final DocumentType documentType;

  /// The document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The name of the Systems Manager document.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The AWS user account that created the document.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The operating system platform.
  @_s.JsonKey(name: 'PlatformTypes')
  final List<PlatformType> platformTypes;

  /// A list of SSM documents required by a document. For example, an
  /// <code>ApplicationConfiguration</code> document requires an
  /// <code>ApplicationConfigurationSchema</code> document.
  @_s.JsonKey(name: 'Requires')
  final List<DocumentRequires> requires;

  /// The current status of a document review.
  @_s.JsonKey(name: 'ReviewStatus')
  final ReviewStatus reviewStatus;

  /// The schema version.
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The tags, or metadata, that have been applied to the document.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The target type which defines the kinds of resources the document can run
  /// on. For example, /AWS::EC2::Instance. For a list of valid resource types,
  /// see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
  /// resource and property types reference</a> in the <i>AWS CloudFormation User
  /// Guide</i>.
  @_s.JsonKey(name: 'TargetType')
  final String targetType;

  /// An optional field specifying the version of the artifact associated with the
  /// document. For example, "Release 12, Update 6". This value is unique across
  /// all versions of a document, and cannot be changed.
  @_s.JsonKey(name: 'VersionName')
  final String versionName;

  DocumentIdentifier({
    this.author,
    this.documentFormat,
    this.documentType,
    this.documentVersion,
    this.name,
    this.owner,
    this.platformTypes,
    this.requires,
    this.reviewStatus,
    this.schemaVersion,
    this.tags,
    this.targetType,
    this.versionName,
  });
  factory DocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$DocumentIdentifierFromJson(json);
}

/// One or more filters. Use a filter to return a more specific list of
/// documents.
///
/// For keys, you can specify one or more tags that have been applied to a
/// document.
///
/// You can also use AWS-provided keys, some of which have specific allowed
/// values. These keys and their associated values are as follows:
/// <dl> <dt>DocumentType</dt> <dd>
/// <ul>
/// <li>
/// ApplicationConfiguration
/// </li>
/// <li>
/// ApplicationConfigurationSchema
/// </li>
/// <li>
/// Automation
/// </li>
/// <li>
/// ChangeCalendar
/// </li>
/// <li>
/// Command
/// </li>
/// <li>
/// DeploymentStrategy
/// </li>
/// <li>
/// Package
/// </li>
/// <li>
/// Policy
/// </li>
/// <li>
/// Session
/// </li>
/// </ul> </dd> <dt>Owner</dt> <dd>
/// Note that only one <code>Owner</code> can be specified in a request. For
/// example: <code>Key=Owner,Values=Self</code>.
///
/// <ul>
/// <li>
/// Amazon
/// </li>
/// <li>
/// Private
/// </li>
/// <li>
/// Public
/// </li>
/// <li>
/// Self
/// </li>
/// <li>
/// ThirdParty
/// </li>
/// </ul> </dd> <dt>PlatformTypes</dt> <dd>
/// <ul>
/// <li>
/// Linux
/// </li>
/// <li>
/// Windows
/// </li>
/// </ul> </dd> </dl>
/// <code>Name</code> is another AWS-provided key. If you use <code>Name</code>
/// as a key, you can use a name prefix to return a list of documents. For
/// example, in the AWS CLI, to return a list of all documents that begin with
/// <code>Te</code>, run the following command:
///
/// <code>aws ssm list-documents --filters Key=Name,Values=Te</code>
///
/// You can also use the <code>TargetType</code> AWS-provided key. For a list of
/// valid resource type values that can be used with this key, see <a
/// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
/// resource and property types reference</a> in the <i>AWS CloudFormation User
/// Guide</i>.
///
/// If you specify more than two keys, only documents that are identified by all
/// the tags are returned in the results. If you specify more than two values
/// for a key, documents that are identified by any of the values are returned
/// in the results.
///
/// To specify a custom key and value pair, use the format
/// <code>Key=tag:tagName,Values=valueName</code>.
///
/// For example, if you created a key called region and are using the AWS CLI to
/// call the <code>list-documents</code> command:
///
/// <code>aws ssm list-documents --filters Key=tag:region,Values=east,west
/// Key=Owner,Values=Self</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DocumentKeyValuesFilter {
  /// The name of the filter key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for the filter key.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  DocumentKeyValuesFilter({
    this.key,
    this.values,
  });
  Map<String, dynamic> toJson() => _$DocumentKeyValuesFilterToJson(this);
}

enum DocumentMetadataEnum {
  @_s.JsonValue('DocumentReviews')
  documentReviews,
}

extension on DocumentMetadataEnum {
  String toValue() {
    switch (this) {
      case DocumentMetadataEnum.documentReviews:
        return 'DocumentReviews';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about the response to a document review request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentMetadataResponseInfo {
  /// Details about a reviewer's response to a document review request.
  @_s.JsonKey(name: 'ReviewerResponse')
  final List<DocumentReviewerResponseSource> reviewerResponse;

  DocumentMetadataResponseInfo({
    this.reviewerResponse,
  });
  factory DocumentMetadataResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$DocumentMetadataResponseInfoFromJson(json);
}

/// Parameters specified in a System Manager document that run on the server
/// when the command is run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentParameter {
  /// If specified, the default values for the parameters. Parameters without a
  /// default value are required. Parameters with a default value are optional.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;

  /// A description of what the parameter does, how to use it, the default value,
  /// and whether or not the parameter is optional.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of parameter. The type can be either String or StringList.
  @_s.JsonKey(name: 'Type')
  final DocumentParameterType type;

  DocumentParameter({
    this.defaultValue,
    this.description,
    this.name,
    this.type,
  });
  factory DocumentParameter.fromJson(Map<String, dynamic> json) =>
      _$DocumentParameterFromJson(json);
}

enum DocumentParameterType {
  @_s.JsonValue('String')
  string,
  @_s.JsonValue('StringList')
  stringList,
}

enum DocumentPermissionType {
  @_s.JsonValue('Share')
  share,
}

extension on DocumentPermissionType {
  String toValue() {
    switch (this) {
      case DocumentPermissionType.share:
        return 'Share';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An SSM document required by the current document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DocumentRequires {
  /// The name of the required SSM document. The name can be an Amazon Resource
  /// Name (ARN).
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The document version required by the current document.
  @_s.JsonKey(name: 'Version')
  final String version;

  DocumentRequires({
    @_s.required this.name,
    this.version,
  });
  factory DocumentRequires.fromJson(Map<String, dynamic> json) =>
      _$DocumentRequiresFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentRequiresToJson(this);
}

enum DocumentReviewAction {
  @_s.JsonValue('SendForReview')
  sendForReview,
  @_s.JsonValue('UpdateReview')
  updateReview,
  @_s.JsonValue('Approve')
  approve,
  @_s.JsonValue('Reject')
  reject,
}

/// Information about comments added to a document review request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DocumentReviewCommentSource {
  /// The content of a comment entered by a user who requests a review of a new
  /// document version, or who reviews the new version.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The type of information added to a review request. Currently, only the value
  /// <code>Comment</code> is supported.
  @_s.JsonKey(name: 'Type')
  final DocumentReviewCommentType type;

  DocumentReviewCommentSource({
    this.content,
    this.type,
  });
  factory DocumentReviewCommentSource.fromJson(Map<String, dynamic> json) =>
      _$DocumentReviewCommentSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentReviewCommentSourceToJson(this);
}

enum DocumentReviewCommentType {
  @_s.JsonValue('Comment')
  comment,
}

/// Information about a reviewer's response to a document review request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentReviewerResponseSource {
  /// The comment entered by a reviewer as part of their document review response.
  @_s.JsonKey(name: 'Comment')
  final List<DocumentReviewCommentSource> comment;

  /// The date and time that a reviewer entered a response to a document review
  /// request.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The current review status of a new custom SSM document created by a member
  /// of your organization, or of the latest version of an existing SSM document.
  ///
  /// Only one version of a document can be in the APPROVED state at a time. When
  /// a new version is approved, the status of the previous version changes to
  /// REJECTED.
  ///
  /// Only one version of a document can be in review, or PENDING, at a time.
  @_s.JsonKey(name: 'ReviewStatus')
  final ReviewStatus reviewStatus;

  /// The user in your organization assigned to review a document request.
  @_s.JsonKey(name: 'Reviewer')
  final String reviewer;

  /// The date and time that a reviewer last updated a response to a document
  /// review request.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTime')
  final DateTime updatedTime;

  DocumentReviewerResponseSource({
    this.comment,
    this.createTime,
    this.reviewStatus,
    this.reviewer,
    this.updatedTime,
  });
  factory DocumentReviewerResponseSource.fromJson(Map<String, dynamic> json) =>
      _$DocumentReviewerResponseSourceFromJson(json);
}

/// Information about a document approval review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DocumentReviews {
  /// The action to take on a document approval review request.
  @_s.JsonKey(name: 'Action')
  final DocumentReviewAction action;

  /// A comment entered by a user in your organization about the document review
  /// request.
  @_s.JsonKey(name: 'Comment')
  final List<DocumentReviewCommentSource> comment;

  DocumentReviews({
    @_s.required this.action,
    this.comment,
  });
  Map<String, dynamic> toJson() => _$DocumentReviewsToJson(this);
}

/// The status of a document.
enum DocumentStatus {
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Updating')
  updating,
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Failed')
  failed,
}

enum DocumentType {
  @_s.JsonValue('Command')
  command,
  @_s.JsonValue('Policy')
  policy,
  @_s.JsonValue('Automation')
  automation,
  @_s.JsonValue('Session')
  session,
  @_s.JsonValue('Package')
  package,
  @_s.JsonValue('ApplicationConfiguration')
  applicationConfiguration,
  @_s.JsonValue('ApplicationConfigurationSchema')
  applicationConfigurationSchema,
  @_s.JsonValue('DeploymentStrategy')
  deploymentStrategy,
  @_s.JsonValue('ChangeCalendar')
  changeCalendar,
  @_s.JsonValue('Automation.ChangeTemplate')
  automationChangeTemplate,
}

extension on DocumentType {
  String toValue() {
    switch (this) {
      case DocumentType.command:
        return 'Command';
      case DocumentType.policy:
        return 'Policy';
      case DocumentType.automation:
        return 'Automation';
      case DocumentType.session:
        return 'Session';
      case DocumentType.package:
        return 'Package';
      case DocumentType.applicationConfiguration:
        return 'ApplicationConfiguration';
      case DocumentType.applicationConfigurationSchema:
        return 'ApplicationConfigurationSchema';
      case DocumentType.deploymentStrategy:
        return 'DeploymentStrategy';
      case DocumentType.changeCalendar:
        return 'ChangeCalendar';
      case DocumentType.automationChangeTemplate:
        return 'Automation.ChangeTemplate';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Version information about the document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentVersionInfo {
  /// The date the document was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The document format, either JSON or YAML.
  @_s.JsonKey(name: 'DocumentFormat')
  final DocumentFormat documentFormat;

  /// The document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// An identifier for the default version of the document.
  @_s.JsonKey(name: 'IsDefaultVersion')
  final bool isDefaultVersion;

  /// The document name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the approval review for the latest version of the
  /// document.
  @_s.JsonKey(name: 'ReviewStatus')
  final ReviewStatus reviewStatus;

  /// The status of the Systems Manager document, such as <code>Creating</code>,
  /// <code>Active</code>, <code>Failed</code>, and <code>Deleting</code>.
  @_s.JsonKey(name: 'Status')
  final DocumentStatus status;

  /// A message returned by AWS Systems Manager that explains the
  /// <code>Status</code> value. For example, a <code>Failed</code> status might
  /// be explained by the <code>StatusInformation</code> message, "The specified
  /// S3 bucket does not exist. Verify that the URL of the S3 bucket is correct."
  @_s.JsonKey(name: 'StatusInformation')
  final String statusInformation;

  /// The version of the artifact associated with the document. For example,
  /// "Release 12, Update 6". This value is unique across all versions of a
  /// document, and cannot be changed.
  @_s.JsonKey(name: 'VersionName')
  final String versionName;

  DocumentVersionInfo({
    this.createdDate,
    this.documentFormat,
    this.documentVersion,
    this.isDefaultVersion,
    this.name,
    this.reviewStatus,
    this.status,
    this.statusInformation,
    this.versionName,
  });
  factory DocumentVersionInfo.fromJson(Map<String, dynamic> json) =>
      _$DocumentVersionInfoFromJson(json);
}

/// The EffectivePatch structure defines metadata about a patch along with the
/// approval state of the patch in a particular patch baseline. The approval
/// state includes information about whether the patch is currently approved,
/// due to be approved by a rule, explicitly approved, or explicitly rejected
/// and the date the patch was or will be approved.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EffectivePatch {
  /// Provides metadata for a patch, including information such as the KB ID,
  /// severity, classification and a URL for where more information can be
  /// obtained about the patch.
  @_s.JsonKey(name: 'Patch')
  final Patch patch;

  /// The status of the patch in a patch baseline. This includes information about
  /// whether the patch is currently approved, due to be approved by a rule,
  /// explicitly approved, or explicitly rejected and the date the patch was or
  /// will be approved.
  @_s.JsonKey(name: 'PatchStatus')
  final PatchStatus patchStatus;

  EffectivePatch({
    this.patch,
    this.patchStatus,
  });
  factory EffectivePatch.fromJson(Map<String, dynamic> json) =>
      _$EffectivePatchFromJson(json);
}

enum ExecutionMode {
  @_s.JsonValue('Auto')
  auto,
  @_s.JsonValue('Interactive')
  interactive,
}

extension on ExecutionMode {
  String toValue() {
    switch (this) {
      case ExecutionMode.auto:
        return 'Auto';
      case ExecutionMode.interactive:
        return 'Interactive';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a failed association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedCreateAssociation {
  /// The association.
  @_s.JsonKey(name: 'Entry')
  final CreateAssociationBatchRequestEntry entry;

  /// The source of the failure.
  @_s.JsonKey(name: 'Fault')
  final Fault fault;

  /// A description of the failure.
  @_s.JsonKey(name: 'Message')
  final String message;

  FailedCreateAssociation({
    this.entry,
    this.fault,
    this.message,
  });
  factory FailedCreateAssociation.fromJson(Map<String, dynamic> json) =>
      _$FailedCreateAssociationFromJson(json);
}

/// Information about an Automation failure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailureDetails {
  /// Detailed information about the Automation step failure.
  @_s.JsonKey(name: 'Details')
  final Map<String, List<String>> details;

  /// The stage of the Automation execution when the failure occurred. The stages
  /// include the following: InputValidation, PreVerification, Invocation,
  /// PostVerification.
  @_s.JsonKey(name: 'FailureStage')
  final String failureStage;

  /// The type of Automation failure. Failure types include the following: Action,
  /// Permission, Throttling, Verification, Internal.
  @_s.JsonKey(name: 'FailureType')
  final String failureType;

  FailureDetails({
    this.details,
    this.failureStage,
    this.failureType,
  });
  factory FailureDetails.fromJson(Map<String, dynamic> json) =>
      _$FailureDetailsFromJson(json);
}

enum Fault {
  @_s.JsonValue('Client')
  client,
  @_s.JsonValue('Server')
  server,
  @_s.JsonValue('Unknown')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAutomationExecutionResult {
  /// Detailed information about the current state of an automation execution.
  @_s.JsonKey(name: 'AutomationExecution')
  final AutomationExecution automationExecution;

  GetAutomationExecutionResult({
    this.automationExecution,
  });
  factory GetAutomationExecutionResult.fromJson(Map<String, dynamic> json) =>
      _$GetAutomationExecutionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCalendarStateResponse {
  /// The time, as an <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO
  /// 8601</a> string, that you specified in your command. If you did not specify
  /// a time, <code>GetCalendarState</code> uses the current time.
  @_s.JsonKey(name: 'AtTime')
  final String atTime;

  /// The time, as an <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO
  /// 8601</a> string, that the calendar state will change. If the current
  /// calendar state is <code>OPEN</code>, <code>NextTransitionTime</code>
  /// indicates when the calendar state changes to <code>CLOSED</code>, and
  /// vice-versa.
  @_s.JsonKey(name: 'NextTransitionTime')
  final String nextTransitionTime;

  /// The state of the calendar. An <code>OPEN</code> calendar indicates that
  /// actions are allowed to proceed, and a <code>CLOSED</code> calendar indicates
  /// that actions are not allowed to proceed.
  @_s.JsonKey(name: 'State')
  final CalendarState state;

  GetCalendarStateResponse({
    this.atTime,
    this.nextTransitionTime,
    this.state,
  });
  factory GetCalendarStateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCalendarStateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCommandInvocationResult {
  /// CloudWatch Logs information where Systems Manager sent the command output.
  @_s.JsonKey(name: 'CloudWatchOutputConfig')
  final CloudWatchOutputConfig cloudWatchOutputConfig;

  /// The parent command ID of the invocation plugin.
  @_s.JsonKey(name: 'CommandId')
  final String commandId;

  /// The comment text for the command.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// The name of the document that was run. For example, AWS-RunShellScript.
  @_s.JsonKey(name: 'DocumentName')
  final String documentName;

  /// The SSM document version used in the request.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// Duration since ExecutionStartDateTime.
  @_s.JsonKey(name: 'ExecutionElapsedTime')
  final String executionElapsedTime;

  /// The date and time the plugin was finished running. Date and time are written
  /// in ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7.
  /// The following sample AWS CLI command uses the <code>InvokedAfter</code>
  /// filter.
  ///
  /// <code>aws ssm list-commands --filters
  /// key=InvokedAfter,value=2017-06-07T00:00:00Z</code>
  ///
  /// If the plugin has not started to run, the string is empty.
  @_s.JsonKey(name: 'ExecutionEndDateTime')
  final String executionEndDateTime;

  /// The date and time the plugin started running. Date and time are written in
  /// ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7. The
  /// following sample AWS CLI command uses the <code>InvokedBefore</code> filter.
  ///
  /// <code>aws ssm list-commands --filters
  /// key=InvokedBefore,value=2017-06-07T00:00:00Z</code>
  ///
  /// If the plugin has not started to run, the string is empty.
  @_s.JsonKey(name: 'ExecutionStartDateTime')
  final String executionStartDateTime;

  /// The ID of the managed instance targeted by the command. A managed instance
  /// can be an EC2 instance or an instance in your hybrid environment that is
  /// configured for Systems Manager.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The name of the plugin for which you want detailed results. For example,
  /// aws:RunShellScript is a plugin.
  @_s.JsonKey(name: 'PluginName')
  final String pluginName;

  /// The error level response code for the plugin script. If the response code is
  /// -1, then the command has not started running on the instance, or it was not
  /// received by the instance.
  @_s.JsonKey(name: 'ResponseCode')
  final int responseCode;

  /// The first 8,000 characters written by the plugin to stderr. If the command
  /// has not finished running, then this string is empty.
  @_s.JsonKey(name: 'StandardErrorContent')
  final String standardErrorContent;

  /// The URL for the complete text written by the plugin to stderr. If the
  /// command has not finished running, then this string is empty.
  @_s.JsonKey(name: 'StandardErrorUrl')
  final String standardErrorUrl;

  /// The first 24,000 characters written by the plugin to stdout. If the command
  /// has not finished running, if ExecutionStatus is neither Succeeded nor
  /// Failed, then this string is empty.
  @_s.JsonKey(name: 'StandardOutputContent')
  final String standardOutputContent;

  /// The URL for the complete text written by the plugin to stdout in Amazon S3.
  /// If an S3 bucket was not specified, then this string is empty.
  @_s.JsonKey(name: 'StandardOutputUrl')
  final String standardOutputUrl;

  /// The status of this invocation plugin. This status can be different than
  /// StatusDetails.
  @_s.JsonKey(name: 'Status')
  final CommandInvocationStatus status;

  /// A detailed status of the command execution for an invocation. StatusDetails
  /// includes more information than Status because it includes states resulting
  /// from error and concurrency control parameters. StatusDetails can show
  /// different results than Status. For more information about these statuses,
  /// see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding
  /// command statuses</a> in the <i>AWS Systems Manager User Guide</i>.
  /// StatusDetails can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// Pending: The command has not been sent to the instance.
  /// </li>
  /// <li>
  /// In Progress: The command has been sent to the instance but has not reached a
  /// terminal state.
  /// </li>
  /// <li>
  /// Delayed: The system attempted to send the command to the target, but the
  /// target was not available. The instance might not be available because of
  /// network issues, because the instance was stopped, or for similar reasons.
  /// The system will try to send the command again.
  /// </li>
  /// <li>
  /// Success: The command or plugin ran successfully. This is a terminal state.
  /// </li>
  /// <li>
  /// Delivery Timed Out: The command was not delivered to the instance before the
  /// delivery timeout expired. Delivery timeouts do not count against the parent
  /// command's MaxErrors limit, but they do contribute to whether the parent
  /// command status is Success or Incomplete. This is a terminal state.
  /// </li>
  /// <li>
  /// Execution Timed Out: The command started to run on the instance, but the
  /// execution was not complete before the timeout expired. Execution timeouts
  /// count against the MaxErrors limit of the parent command. This is a terminal
  /// state.
  /// </li>
  /// <li>
  /// Failed: The command wasn't run successfully on the instance. For a plugin,
  /// this indicates that the result code was not zero. For a command invocation,
  /// this indicates that the result code for one or more plugins was not zero.
  /// Invocation failures count against the MaxErrors limit of the parent command.
  /// This is a terminal state.
  /// </li>
  /// <li>
  /// Canceled: The command was terminated before it was completed. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Undeliverable: The command can't be delivered to the instance. The instance
  /// might not exist or might not be responding. Undeliverable invocations don't
  /// count against the parent command's MaxErrors limit and don't contribute to
  /// whether the parent command status is Success or Incomplete. This is a
  /// terminal state.
  /// </li>
  /// <li>
  /// Terminated: The parent command exceeded its MaxErrors limit and subsequent
  /// command invocations were canceled by the system. This is a terminal state.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  GetCommandInvocationResult({
    this.cloudWatchOutputConfig,
    this.commandId,
    this.comment,
    this.documentName,
    this.documentVersion,
    this.executionElapsedTime,
    this.executionEndDateTime,
    this.executionStartDateTime,
    this.instanceId,
    this.pluginName,
    this.responseCode,
    this.standardErrorContent,
    this.standardErrorUrl,
    this.standardOutputContent,
    this.standardOutputUrl,
    this.status,
    this.statusDetails,
  });
  factory GetCommandInvocationResult.fromJson(Map<String, dynamic> json) =>
      _$GetCommandInvocationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectionStatusResponse {
  /// The status of the connection to the instance. For example, 'Connected' or
  /// 'Not Connected'.
  @_s.JsonKey(name: 'Status')
  final ConnectionStatus status;

  /// The ID of the instance to check connection status.
  @_s.JsonKey(name: 'Target')
  final String target;

  GetConnectionStatusResponse({
    this.status,
    this.target,
  });
  factory GetConnectionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectionStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDefaultPatchBaselineResult {
  /// The ID of the default patch baseline.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The operating system for the returned patch baseline.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  GetDefaultPatchBaselineResult({
    this.baselineId,
    this.operatingSystem,
  });
  factory GetDefaultPatchBaselineResult.fromJson(Map<String, dynamic> json) =>
      _$GetDefaultPatchBaselineResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeployablePatchSnapshotForInstanceResult {
  /// The ID of the instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// Returns the specific operating system (for example Windows Server 2012 or
  /// Amazon Linux 2015.09) on the instance for the specified patch snapshot.
  @_s.JsonKey(name: 'Product')
  final String product;

  /// A pre-signed Amazon S3 URL that can be used to download the patch snapshot.
  @_s.JsonKey(name: 'SnapshotDownloadUrl')
  final String snapshotDownloadUrl;

  /// The user-defined snapshot ID.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  GetDeployablePatchSnapshotForInstanceResult({
    this.instanceId,
    this.product,
    this.snapshotDownloadUrl,
    this.snapshotId,
  });
  factory GetDeployablePatchSnapshotForInstanceResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetDeployablePatchSnapshotForInstanceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDocumentResult {
  /// A description of the document attachments, including names, locations,
  /// sizes, and so on.
  @_s.JsonKey(name: 'AttachmentsContent')
  final List<AttachmentContent> attachmentsContent;

  /// The contents of the Systems Manager document.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The document format, either JSON or YAML.
  @_s.JsonKey(name: 'DocumentFormat')
  final DocumentFormat documentFormat;

  /// The document type.
  @_s.JsonKey(name: 'DocumentType')
  final DocumentType documentType;

  /// The document version.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The name of the Systems Manager document.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of SSM documents required by a document. For example, an
  /// <code>ApplicationConfiguration</code> document requires an
  /// <code>ApplicationConfigurationSchema</code> document.
  @_s.JsonKey(name: 'Requires')
  final List<DocumentRequires> requires;

  /// The current review status of a new custom Systems Manager document (SSM
  /// document) created by a member of your organization, or of the latest version
  /// of an existing SSM document.
  ///
  /// Only one version of an SSM document can be in the APPROVED state at a time.
  /// When a new version is approved, the status of the previous version changes
  /// to REJECTED.
  ///
  /// Only one version of an SSM document can be in review, or PENDING, at a time.
  @_s.JsonKey(name: 'ReviewStatus')
  final ReviewStatus reviewStatus;

  /// The status of the Systems Manager document, such as <code>Creating</code>,
  /// <code>Active</code>, <code>Updating</code>, <code>Failed</code>, and
  /// <code>Deleting</code>.
  @_s.JsonKey(name: 'Status')
  final DocumentStatus status;

  /// A message returned by AWS Systems Manager that explains the
  /// <code>Status</code> value. For example, a <code>Failed</code> status might
  /// be explained by the <code>StatusInformation</code> message, "The specified
  /// S3 bucket does not exist. Verify that the URL of the S3 bucket is correct."
  @_s.JsonKey(name: 'StatusInformation')
  final String statusInformation;

  /// The version of the artifact associated with the document. For example,
  /// "Release 12, Update 6". This value is unique across all versions of a
  /// document, and cannot be changed.
  @_s.JsonKey(name: 'VersionName')
  final String versionName;

  GetDocumentResult({
    this.attachmentsContent,
    this.content,
    this.documentFormat,
    this.documentType,
    this.documentVersion,
    this.name,
    this.requires,
    this.reviewStatus,
    this.status,
    this.statusInformation,
    this.versionName,
  });
  factory GetDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$GetDocumentResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInventoryResult {
  /// Collection of inventory entities such as a collection of instance inventory.
  @_s.JsonKey(name: 'Entities')
  final List<InventoryResultEntity> entities;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetInventoryResult({
    this.entities,
    this.nextToken,
  });
  factory GetInventoryResult.fromJson(Map<String, dynamic> json) =>
      _$GetInventoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInventorySchemaResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Inventory schemas returned by the request.
  @_s.JsonKey(name: 'Schemas')
  final List<InventoryItemSchema> schemas;

  GetInventorySchemaResult({
    this.nextToken,
    this.schemas,
  });
  factory GetInventorySchemaResult.fromJson(Map<String, dynamic> json) =>
      _$GetInventorySchemaResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMaintenanceWindowExecutionResult {
  /// The time the maintenance window finished running.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The time the maintenance window started running.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the maintenance window execution.
  @_s.JsonKey(name: 'Status')
  final MaintenanceWindowExecutionStatus status;

  /// The details explaining the Status. Only available for certain status values.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The ID of the task executions from the maintenance window execution.
  @_s.JsonKey(name: 'TaskIds')
  final List<String> taskIds;

  /// The ID of the maintenance window execution.
  @_s.JsonKey(name: 'WindowExecutionId')
  final String windowExecutionId;

  GetMaintenanceWindowExecutionResult({
    this.endTime,
    this.startTime,
    this.status,
    this.statusDetails,
    this.taskIds,
    this.windowExecutionId,
  });
  factory GetMaintenanceWindowExecutionResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetMaintenanceWindowExecutionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMaintenanceWindowExecutionTaskInvocationResult {
  /// The time that the task finished running on the target.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The execution ID.
  @_s.JsonKey(name: 'ExecutionId')
  final String executionId;

  /// The invocation ID.
  @_s.JsonKey(name: 'InvocationId')
  final String invocationId;

  /// User-provided value to be included in any CloudWatch events raised while
  /// running tasks for these targets in this maintenance window.
  @_s.JsonKey(name: 'OwnerInformation')
  final String ownerInformation;

  /// The parameters used at the time that the task ran.
  @_s.JsonKey(name: 'Parameters')
  final String parameters;

  /// The time that the task started running on the target.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The task status for an invocation.
  @_s.JsonKey(name: 'Status')
  final MaintenanceWindowExecutionStatus status;

  /// The details explaining the status. Details are only available for certain
  /// status values.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The task execution ID.
  @_s.JsonKey(name: 'TaskExecutionId')
  final String taskExecutionId;

  /// Retrieves the task type for a maintenance window. Task types include the
  /// following: LAMBDA, STEP_FUNCTIONS, AUTOMATION, RUN_COMMAND.
  @_s.JsonKey(name: 'TaskType')
  final MaintenanceWindowTaskType taskType;

  /// The maintenance window execution ID.
  @_s.JsonKey(name: 'WindowExecutionId')
  final String windowExecutionId;

  /// The maintenance window target ID.
  @_s.JsonKey(name: 'WindowTargetId')
  final String windowTargetId;

  GetMaintenanceWindowExecutionTaskInvocationResult({
    this.endTime,
    this.executionId,
    this.invocationId,
    this.ownerInformation,
    this.parameters,
    this.startTime,
    this.status,
    this.statusDetails,
    this.taskExecutionId,
    this.taskType,
    this.windowExecutionId,
    this.windowTargetId,
  });
  factory GetMaintenanceWindowExecutionTaskInvocationResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetMaintenanceWindowExecutionTaskInvocationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMaintenanceWindowExecutionTaskResult {
  /// The time the task execution completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The defined maximum number of task executions that could be run in parallel.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The defined maximum number of task execution errors allowed before
  /// scheduling of the task execution would have been stopped.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The priority of the task.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The role that was assumed when running the task.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// The time the task execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the task.
  @_s.JsonKey(name: 'Status')
  final MaintenanceWindowExecutionStatus status;

  /// The details explaining the Status. Only available for certain status values.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The ARN of the task that ran.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  /// The ID of the specific task execution in the maintenance window task that
  /// was retrieved.
  @_s.JsonKey(name: 'TaskExecutionId')
  final String taskExecutionId;

  /// The parameters passed to the task when it was run.
  /// <note>
  /// <code>TaskParameters</code> has been deprecated. To specify parameters to
  /// pass to a task when it runs, instead use the <code>Parameters</code> option
  /// in the <code>TaskInvocationParameters</code> structure. For information
  /// about how Systems Manager handles these options for the supported
  /// maintenance window task types, see
  /// <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  /// The map has the following format:
  ///
  /// Key: string, between 1 and 255 characters
  ///
  /// Value: an array of strings, each string is between 1 and 255 characters
  @_s.JsonKey(name: 'TaskParameters')
  final List<Map<String, MaintenanceWindowTaskParameterValueExpression>>
      taskParameters;

  /// The type of task that was run.
  @_s.JsonKey(name: 'Type')
  final MaintenanceWindowTaskType type;

  /// The ID of the maintenance window execution that includes the task.
  @_s.JsonKey(name: 'WindowExecutionId')
  final String windowExecutionId;

  GetMaintenanceWindowExecutionTaskResult({
    this.endTime,
    this.maxConcurrency,
    this.maxErrors,
    this.priority,
    this.serviceRole,
    this.startTime,
    this.status,
    this.statusDetails,
    this.taskArn,
    this.taskExecutionId,
    this.taskParameters,
    this.type,
    this.windowExecutionId,
  });
  factory GetMaintenanceWindowExecutionTaskResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetMaintenanceWindowExecutionTaskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMaintenanceWindowResult {
  /// Whether targets must be registered with the maintenance window before tasks
  /// can be defined for those targets.
  @_s.JsonKey(name: 'AllowUnassociatedTargets')
  final bool allowUnassociatedTargets;

  /// The date the maintenance window was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  @_s.JsonKey(name: 'Cutoff')
  final int cutoff;

  /// The description of the maintenance window.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The duration of the maintenance window in hours.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// Indicates whether the maintenance window is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become inactive. The maintenance window will not run
  /// after this specified time.
  @_s.JsonKey(name: 'EndDate')
  final String endDate;

  /// The date the maintenance window was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedDate')
  final DateTime modifiedDate;

  /// The name of the maintenance window.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The next time the maintenance window will actually run, taking into account
  /// any specified times for the maintenance window to become active or inactive.
  @_s.JsonKey(name: 'NextExecutionTime')
  final String nextExecutionTime;

  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The number of days to wait to run a maintenance window after the scheduled
  /// CRON expression date and time.
  @_s.JsonKey(name: 'ScheduleOffset')
  final int scheduleOffset;

  /// The time zone that the scheduled maintenance window executions are based on,
  /// in Internet Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see the
  /// <a href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA
  /// website.
  @_s.JsonKey(name: 'ScheduleTimezone')
  final String scheduleTimezone;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become active. The maintenance window will not run
  /// before this specified time.
  @_s.JsonKey(name: 'StartDate')
  final String startDate;

  /// The ID of the created maintenance window.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  GetMaintenanceWindowResult({
    this.allowUnassociatedTargets,
    this.createdDate,
    this.cutoff,
    this.description,
    this.duration,
    this.enabled,
    this.endDate,
    this.modifiedDate,
    this.name,
    this.nextExecutionTime,
    this.schedule,
    this.scheduleOffset,
    this.scheduleTimezone,
    this.startDate,
    this.windowId,
  });
  factory GetMaintenanceWindowResult.fromJson(Map<String, dynamic> json) =>
      _$GetMaintenanceWindowResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMaintenanceWindowTaskResult {
  /// The retrieved task description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The location in Amazon S3 where the task results are logged.
  /// <note>
  /// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
  /// contain logs, instead use the <code>OutputS3BucketName</code> and
  /// <code>OutputS3KeyPrefix</code> options in the
  /// <code>TaskInvocationParameters</code> structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  @_s.JsonKey(name: 'LoggingInfo')
  final LoggingInfo loggingInfo;

  /// The maximum number of targets allowed to run this task in parallel.
  /// <note>
  /// For maintenance window tasks without a target specified, you cannot supply a
  /// value for this option. Instead, the system inserts a placeholder value of
  /// <code>1</code>, which may be reported in the response to this command. This
  /// value does not affect the running of your task and can be ignored.
  /// </note>
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The maximum number of errors allowed before the task stops being scheduled.
  /// <note>
  /// For maintenance window tasks without a target specified, you cannot supply a
  /// value for this option. Instead, the system inserts a placeholder value of
  /// <code>1</code>, which may be reported in the response to this command. This
  /// value does not affect the running of your task and can be ignored.
  /// </note>
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The retrieved task name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The priority of the task when it runs. The lower the number, the higher the
  /// priority. Tasks that have the same priority are scheduled in parallel.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The ARN of the IAM service role to use to publish Amazon Simple Notification
  /// Service (Amazon SNS) notifications for maintenance window Run Command tasks.
  @_s.JsonKey(name: 'ServiceRoleArn')
  final String serviceRoleArn;

  /// The targets where the task should run.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  /// The resource that the task used during execution. For RUN_COMMAND and
  /// AUTOMATION task types, the TaskArn is the Systems Manager Document name/ARN.
  /// For LAMBDA tasks, the value is the function name/ARN. For STEP_FUNCTIONS
  /// tasks, the value is the state machine ARN.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  /// The parameters to pass to the task when it runs.
  @_s.JsonKey(name: 'TaskInvocationParameters')
  final MaintenanceWindowTaskInvocationParameters taskInvocationParameters;

  /// The parameters to pass to the task when it runs.
  /// <note>
  /// <code>TaskParameters</code> has been deprecated. To specify parameters to
  /// pass to a task when it runs, instead use the <code>Parameters</code> option
  /// in the <code>TaskInvocationParameters</code> structure. For information
  /// about how Systems Manager handles these options for the supported
  /// maintenance window task types, see
  /// <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  @_s.JsonKey(name: 'TaskParameters')
  final Map<String, MaintenanceWindowTaskParameterValueExpression>
      taskParameters;

  /// The type of task to run.
  @_s.JsonKey(name: 'TaskType')
  final MaintenanceWindowTaskType taskType;

  /// The retrieved maintenance window ID.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  /// The retrieved maintenance window task ID.
  @_s.JsonKey(name: 'WindowTaskId')
  final String windowTaskId;

  GetMaintenanceWindowTaskResult({
    this.description,
    this.loggingInfo,
    this.maxConcurrency,
    this.maxErrors,
    this.name,
    this.priority,
    this.serviceRoleArn,
    this.targets,
    this.taskArn,
    this.taskInvocationParameters,
    this.taskParameters,
    this.taskType,
    this.windowId,
    this.windowTaskId,
  });
  factory GetMaintenanceWindowTaskResult.fromJson(Map<String, dynamic> json) =>
      _$GetMaintenanceWindowTaskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOpsItemResponse {
  /// The OpsItem.
  @_s.JsonKey(name: 'OpsItem')
  final OpsItem opsItem;

  GetOpsItemResponse({
    this.opsItem,
  });
  factory GetOpsItemResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOpsItemResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOpsMetadataResult {
  /// OpsMetadata for an Application Manager application.
  @_s.JsonKey(name: 'Metadata')
  final Map<String, MetadataValue> metadata;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The resource ID of the Application Manager application.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  GetOpsMetadataResult({
    this.metadata,
    this.nextToken,
    this.resourceId,
  });
  factory GetOpsMetadataResult.fromJson(Map<String, dynamic> json) =>
      _$GetOpsMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOpsSummaryResult {
  /// The list of aggregated and filtered OpsItems.
  @_s.JsonKey(name: 'Entities')
  final List<OpsEntity> entities;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetOpsSummaryResult({
    this.entities,
    this.nextToken,
  });
  factory GetOpsSummaryResult.fromJson(Map<String, dynamic> json) =>
      _$GetOpsSummaryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetParameterHistoryResult {
  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of parameters returned by the request.
  @_s.JsonKey(name: 'Parameters')
  final List<ParameterHistory> parameters;

  GetParameterHistoryResult({
    this.nextToken,
    this.parameters,
  });
  factory GetParameterHistoryResult.fromJson(Map<String, dynamic> json) =>
      _$GetParameterHistoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetParameterResult {
  /// Information about a parameter.
  @_s.JsonKey(name: 'Parameter')
  final Parameter parameter;

  GetParameterResult({
    this.parameter,
  });
  factory GetParameterResult.fromJson(Map<String, dynamic> json) =>
      _$GetParameterResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetParametersByPathResult {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of parameters found in the specified hierarchy.
  @_s.JsonKey(name: 'Parameters')
  final List<Parameter> parameters;

  GetParametersByPathResult({
    this.nextToken,
    this.parameters,
  });
  factory GetParametersByPathResult.fromJson(Map<String, dynamic> json) =>
      _$GetParametersByPathResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetParametersResult {
  /// A list of parameters that are not formatted correctly or do not run during
  /// an execution.
  @_s.JsonKey(name: 'InvalidParameters')
  final List<String> invalidParameters;

  /// A list of details for a parameter.
  @_s.JsonKey(name: 'Parameters')
  final List<Parameter> parameters;

  GetParametersResult({
    this.invalidParameters,
    this.parameters,
  });
  factory GetParametersResult.fromJson(Map<String, dynamic> json) =>
      _$GetParametersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPatchBaselineForPatchGroupResult {
  /// The ID of the patch baseline that should be used for the patch group.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The operating system rule specified for patch groups using the patch
  /// baseline.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  /// The name of the patch group.
  @_s.JsonKey(name: 'PatchGroup')
  final String patchGroup;

  GetPatchBaselineForPatchGroupResult({
    this.baselineId,
    this.operatingSystem,
    this.patchGroup,
  });
  factory GetPatchBaselineForPatchGroupResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetPatchBaselineForPatchGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPatchBaselineResult {
  /// A set of rules used to include patches in the baseline.
  @_s.JsonKey(name: 'ApprovalRules')
  final PatchRuleGroup approvalRules;

  /// A list of explicitly approved patches for the baseline.
  @_s.JsonKey(name: 'ApprovedPatches')
  final List<String> approvedPatches;

  /// Returns the specified compliance severity level for approved patches in the
  /// patch baseline.
  @_s.JsonKey(name: 'ApprovedPatchesComplianceLevel')
  final PatchComplianceLevel approvedPatchesComplianceLevel;

  /// Indicates whether the list of approved patches includes non-security updates
  /// that should be applied to the instances. The default value is 'false'.
  /// Applies to Linux instances only.
  @_s.JsonKey(name: 'ApprovedPatchesEnableNonSecurity')
  final bool approvedPatchesEnableNonSecurity;

  /// The ID of the retrieved patch baseline.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The date the patch baseline was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// A description of the patch baseline.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A set of global filters used to exclude patches from the baseline.
  @_s.JsonKey(name: 'GlobalFilters')
  final PatchFilterGroup globalFilters;

  /// The date the patch baseline was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedDate')
  final DateTime modifiedDate;

  /// The name of the patch baseline.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Returns the operating system specified for the patch baseline.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  /// Patch groups included in the patch baseline.
  @_s.JsonKey(name: 'PatchGroups')
  final List<String> patchGroups;

  /// A list of explicitly rejected patches for the baseline.
  @_s.JsonKey(name: 'RejectedPatches')
  final List<String> rejectedPatches;

  /// The action specified to take on patches included in the RejectedPatches
  /// list. A patch can be allowed only if it is a dependency of another package,
  /// or blocked entirely along with packages that include it as a dependency.
  @_s.JsonKey(name: 'RejectedPatchesAction')
  final PatchAction rejectedPatchesAction;

  /// Information about the patches to use to update the instances, including
  /// target operating systems and source repositories. Applies to Linux instances
  /// only.
  @_s.JsonKey(name: 'Sources')
  final List<PatchSource> sources;

  GetPatchBaselineResult({
    this.approvalRules,
    this.approvedPatches,
    this.approvedPatchesComplianceLevel,
    this.approvedPatchesEnableNonSecurity,
    this.baselineId,
    this.createdDate,
    this.description,
    this.globalFilters,
    this.modifiedDate,
    this.name,
    this.operatingSystem,
    this.patchGroups,
    this.rejectedPatches,
    this.rejectedPatchesAction,
    this.sources,
  });
  factory GetPatchBaselineResult.fromJson(Map<String, dynamic> json) =>
      _$GetPatchBaselineResultFromJson(json);
}

/// The query result body of the GetServiceSetting API action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceSettingResult {
  /// The query result of the current service setting.
  @_s.JsonKey(name: 'ServiceSetting')
  final ServiceSetting serviceSetting;

  GetServiceSettingResult({
    this.serviceSetting,
  });
  factory GetServiceSettingResult.fromJson(Map<String, dynamic> json) =>
      _$GetServiceSettingResultFromJson(json);
}

/// Status information about the aggregated associations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceAggregatedAssociationOverview {
  /// Detailed status information about the aggregated associations.
  @_s.JsonKey(name: 'DetailedStatus')
  final String detailedStatus;

  /// The number of associations for the instance(s).
  @_s.JsonKey(name: 'InstanceAssociationStatusAggregatedCount')
  final Map<String, int> instanceAssociationStatusAggregatedCount;

  InstanceAggregatedAssociationOverview({
    this.detailedStatus,
    this.instanceAssociationStatusAggregatedCount,
  });
  factory InstanceAggregatedAssociationOverview.fromJson(
          Map<String, dynamic> json) =>
      _$InstanceAggregatedAssociationOverviewFromJson(json);
}

/// One or more association documents on the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceAssociation {
  /// The association ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// Version information for the association on the instance.
  @_s.JsonKey(name: 'AssociationVersion')
  final String associationVersion;

  /// The content of the association document for the instance(s).
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  InstanceAssociation({
    this.associationId,
    this.associationVersion,
    this.content,
    this.instanceId,
  });
  factory InstanceAssociation.fromJson(Map<String, dynamic> json) =>
      _$InstanceAssociationFromJson(json);
}

/// An S3 bucket where you want to store the results of this request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InstanceAssociationOutputLocation {
  /// An S3 bucket where you want to store the results of this request.
  @_s.JsonKey(name: 'S3Location')
  final S3OutputLocation s3Location;

  InstanceAssociationOutputLocation({
    this.s3Location,
  });
  factory InstanceAssociationOutputLocation.fromJson(
          Map<String, dynamic> json) =>
      _$InstanceAssociationOutputLocationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InstanceAssociationOutputLocationToJson(this);
}

/// The URL of S3 bucket where you want to store the results of this request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceAssociationOutputUrl {
  /// The URL of S3 bucket where you want to store the results of this request.
  @_s.JsonKey(name: 'S3OutputUrl')
  final S3OutputUrl s3OutputUrl;

  InstanceAssociationOutputUrl({
    this.s3OutputUrl,
  });
  factory InstanceAssociationOutputUrl.fromJson(Map<String, dynamic> json) =>
      _$InstanceAssociationOutputUrlFromJson(json);
}

/// Status information about the instance association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceAssociationStatusInfo {
  /// The association ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The name of the association applied to the instance.
  @_s.JsonKey(name: 'AssociationName')
  final String associationName;

  /// The version of the association applied to the instance.
  @_s.JsonKey(name: 'AssociationVersion')
  final String associationVersion;

  /// Detailed status information about the instance association.
  @_s.JsonKey(name: 'DetailedStatus')
  final String detailedStatus;

  /// The association document versions.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// An error code returned by the request to create the association.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The date the instance association ran.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionDate')
  final DateTime executionDate;

  /// Summary information about association execution.
  @_s.JsonKey(name: 'ExecutionSummary')
  final String executionSummary;

  /// The instance ID where the association was created.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The name of the association.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A URL for an S3 bucket where you want to store the results of this request.
  @_s.JsonKey(name: 'OutputUrl')
  final InstanceAssociationOutputUrl outputUrl;

  /// Status information about the instance association.
  @_s.JsonKey(name: 'Status')
  final String status;

  InstanceAssociationStatusInfo({
    this.associationId,
    this.associationName,
    this.associationVersion,
    this.detailedStatus,
    this.documentVersion,
    this.errorCode,
    this.executionDate,
    this.executionSummary,
    this.instanceId,
    this.name,
    this.outputUrl,
    this.status,
  });
  factory InstanceAssociationStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$InstanceAssociationStatusInfoFromJson(json);
}

/// Describes a filter for a specific list of instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceInformation {
  /// The activation ID created by Systems Manager when the server or VM was
  /// registered.
  @_s.JsonKey(name: 'ActivationId')
  final String activationId;

  /// The version of SSM Agent running on your Linux instance.
  @_s.JsonKey(name: 'AgentVersion')
  final String agentVersion;

  /// Information about the association.
  @_s.JsonKey(name: 'AssociationOverview')
  final InstanceAggregatedAssociationOverview associationOverview;

  /// The status of the association.
  @_s.JsonKey(name: 'AssociationStatus')
  final String associationStatus;

  /// The fully qualified host name of the managed instance.
  @_s.JsonKey(name: 'ComputerName')
  final String computerName;

  /// The IP address of the managed instance.
  @_s.JsonKey(name: 'IPAddress')
  final String iPAddress;

  /// The Amazon Identity and Access Management (IAM) role assigned to the
  /// on-premises Systems Manager managed instance. This call does not return the
  /// IAM role for EC2 instances. To retrieve the IAM role for an EC2 instance,
  /// use the Amazon EC2 <code>DescribeInstances</code> action. For information,
  /// see <a
  /// href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a>
  /// in the <i>Amazon EC2 API Reference</i> or <a
  /// href="http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html">describe-instances</a>
  /// in the <i>AWS CLI Command Reference</i>.
  @_s.JsonKey(name: 'IamRole')
  final String iamRole;

  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// Indicates whether the latest version of SSM Agent is running on your Linux
  /// Managed Instance. This field does not indicate whether or not the latest
  /// version is installed on Windows managed instances, because some older
  /// versions of Windows Server use the EC2Config service to process SSM
  /// requests.
  @_s.JsonKey(name: 'IsLatestVersion')
  final bool isLatestVersion;

  /// The date the association was last run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastAssociationExecutionDate')
  final DateTime lastAssociationExecutionDate;

  /// The date and time when the agent last pinged the Systems Manager service.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastPingDateTime')
  final DateTime lastPingDateTime;

  /// The last date the association was successfully run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastSuccessfulAssociationExecutionDate')
  final DateTime lastSuccessfulAssociationExecutionDate;

  /// The name assigned to an on-premises server or virtual machine (VM) when it
  /// is activated as a Systems Manager managed instance. The name is specified as
  /// the <code>DefaultInstanceName</code> property using the
  /// <a>CreateActivation</a> command. It is applied to the managed instance by
  /// specifying the Activation Code and Activation ID when you install SSM Agent
  /// on the instance, as explained in <a
  /// href="http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-linux.html">Install
  /// SSM Agent for a hybrid environment (Linux)</a> and <a
  /// href="http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-win.html">Install
  /// SSM Agent for a hybrid environment (Windows)</a>. To retrieve the Name tag
  /// of an EC2 instance, use the Amazon EC2 <code>DescribeInstances</code>
  /// action. For information, see <a
  /// href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a>
  /// in the <i>Amazon EC2 API Reference</i> or <a
  /// href="http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html">describe-instances</a>
  /// in the <i>AWS CLI Command Reference</i>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Connection status of SSM Agent.
  /// <note>
  /// The status <code>Inactive</code> has been deprecated and is no longer in
  /// use.
  /// </note>
  @_s.JsonKey(name: 'PingStatus')
  final PingStatus pingStatus;

  /// The name of the operating system platform running on your instance.
  @_s.JsonKey(name: 'PlatformName')
  final String platformName;

  /// The operating system platform type.
  @_s.JsonKey(name: 'PlatformType')
  final PlatformType platformType;

  /// The version of the OS platform running on your instance.
  @_s.JsonKey(name: 'PlatformVersion')
  final String platformVersion;

  /// The date the server or VM was registered with AWS as a managed instance.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RegistrationDate')
  final DateTime registrationDate;

  /// The type of instance. Instances are either EC2 instances or managed
  /// instances.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  InstanceInformation({
    this.activationId,
    this.agentVersion,
    this.associationOverview,
    this.associationStatus,
    this.computerName,
    this.iPAddress,
    this.iamRole,
    this.instanceId,
    this.isLatestVersion,
    this.lastAssociationExecutionDate,
    this.lastPingDateTime,
    this.lastSuccessfulAssociationExecutionDate,
    this.name,
    this.pingStatus,
    this.platformName,
    this.platformType,
    this.platformVersion,
    this.registrationDate,
    this.resourceType,
  });
  factory InstanceInformation.fromJson(Map<String, dynamic> json) =>
      _$InstanceInformationFromJson(json);
}

/// Describes a filter for a specific list of instances. You can filter
/// instances information by using tags. You specify tags by using a key-value
/// mapping.
///
/// Use this action instead of the
/// <a>DescribeInstanceInformationRequest$InstanceInformationFilterList</a>
/// method. The <code>InstanceInformationFilterList</code> method is a legacy
/// method and does not support tags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceInformationFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'key')
  final InstanceInformationFilterKey key;

  /// The filter values.
  @_s.JsonKey(name: 'valueSet')
  final List<String> valueSet;

  InstanceInformationFilter({
    @_s.required this.key,
    @_s.required this.valueSet,
  });
  Map<String, dynamic> toJson() => _$InstanceInformationFilterToJson(this);
}

enum InstanceInformationFilterKey {
  @_s.JsonValue('InstanceIds')
  instanceIds,
  @_s.JsonValue('AgentVersion')
  agentVersion,
  @_s.JsonValue('PingStatus')
  pingStatus,
  @_s.JsonValue('PlatformTypes')
  platformTypes,
  @_s.JsonValue('ActivationIds')
  activationIds,
  @_s.JsonValue('IamRole')
  iamRole,
  @_s.JsonValue('ResourceType')
  resourceType,
  @_s.JsonValue('AssociationStatus')
  associationStatus,
}

/// The filters to describe or get information about your managed instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceInformationStringFilter {
  /// The filter key name to describe your instances. For example:
  ///
  /// "InstanceIds"|"AgentVersion"|"PingStatus"|"PlatformTypes"|"ActivationIds"|"IamRole"|"ResourceType"|"AssociationStatus"|"Tag
  /// Key"
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The filter values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  InstanceInformationStringFilter({
    @_s.required this.key,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() =>
      _$InstanceInformationStringFilterToJson(this);
}

/// Defines the high-level patch compliance state for a managed instance,
/// providing information about the number of installed, missing, not
/// applicable, and failed patches along with metadata about the operation when
/// this information was gathered for the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstancePatchState {
  /// The ID of the patch baseline used to patch the instance.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The ID of the managed instance the high-level patch compliance information
  /// was collected for.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The type of patching operation that was performed: <code>SCAN</code> (assess
  /// patch compliance state) or <code>INSTALL</code> (install missing patches).
  @_s.JsonKey(name: 'Operation')
  final PatchOperationType operation;

  /// The time the most recent patching operation completed on the instance.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'OperationEndTime')
  final DateTime operationEndTime;

  /// The time the most recent patching operation was started on the instance.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'OperationStartTime')
  final DateTime operationStartTime;

  /// The name of the patch group the managed instance belongs to.
  @_s.JsonKey(name: 'PatchGroup')
  final String patchGroup;

  /// The number of patches from the patch baseline that were attempted to be
  /// installed during the last patching operation, but failed to install.
  @_s.JsonKey(name: 'FailedCount')
  final int failedCount;

  /// An https URL or an Amazon S3 path-style URL to a list of patches to be
  /// installed. This patch installation list, which you maintain in an S3 bucket
  /// in YAML format and specify in the SSM document
  /// <code>AWS-RunPatchBaseline</code>, overrides the patches specified by the
  /// default patch baseline.
  ///
  /// For more information about the <code>InstallOverrideList</code> parameter,
  /// see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-about-aws-runpatchbaseline.html">About
  /// the SSM document AWS-RunPatchBaseline</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  @_s.JsonKey(name: 'InstallOverrideList')
  final String installOverrideList;

  /// The number of patches from the patch baseline that are installed on the
  /// instance.
  @_s.JsonKey(name: 'InstalledCount')
  final int installedCount;

  /// The number of patches not specified in the patch baseline that are installed
  /// on the instance.
  @_s.JsonKey(name: 'InstalledOtherCount')
  final int installedOtherCount;

  /// The number of patches installed by Patch Manager since the last time the
  /// instance was rebooted.
  @_s.JsonKey(name: 'InstalledPendingRebootCount')
  final int installedPendingRebootCount;

  /// The number of patches installed on an instance that are specified in a
  /// <code>RejectedPatches</code> list. Patches with a status of
  /// <i>InstalledRejected</i> were typically installed before they were added to
  /// a <code>RejectedPatches</code> list.
  /// <note>
  /// If <code>ALLOW_AS_DEPENDENCY</code> is the specified option for
  /// <code>RejectedPatchesAction</code>, the value of
  /// <code>InstalledRejectedCount</code> will always be <code>0</code> (zero).
  /// </note>
  @_s.JsonKey(name: 'InstalledRejectedCount')
  final int installedRejectedCount;

  /// The time of the last attempt to patch the instance with
  /// <code>NoReboot</code> specified as the reboot option.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastNoRebootInstallOperationTime')
  final DateTime lastNoRebootInstallOperationTime;

  /// The number of patches from the patch baseline that are applicable for the
  /// instance but aren't currently installed.
  @_s.JsonKey(name: 'MissingCount')
  final int missingCount;

  /// The number of patches from the patch baseline that aren't applicable for the
  /// instance and therefore aren't installed on the instance. This number may be
  /// truncated if the list of patch names is very large. The number of patches
  /// beyond this limit are reported in <code>UnreportedNotApplicableCount</code>.
  @_s.JsonKey(name: 'NotApplicableCount')
  final int notApplicableCount;

  /// Placeholder information. This field will always be empty in the current
  /// release of the service.
  @_s.JsonKey(name: 'OwnerInformation')
  final String ownerInformation;

  /// Indicates the reboot option specified in the patch baseline.
  /// <note>
  /// Reboot options apply to <code>Install</code> operations only. Reboots are
  /// not attempted for Patch Manager <code>Scan</code> operations.
  /// </note>
  /// <ul>
  /// <li>
  /// <b>RebootIfNeeded</b>: Patch Manager tries to reboot the instance if it
  /// installed any patches, or if any patches are detected with a status of
  /// <code>InstalledPendingReboot</code>.
  /// </li>
  /// <li>
  /// <b>NoReboot</b>: Patch Manager attempts to install missing packages without
  /// trying to reboot the system. Patches installed with this option are assigned
  /// a status of <code>InstalledPendingReboot</code>. These patches might not be
  /// in effect until a reboot is performed.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'RebootOption')
  final RebootOption rebootOption;

  /// The ID of the patch baseline snapshot used during the patching operation
  /// when this compliance data was collected.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  /// The number of patches beyond the supported limit of
  /// <code>NotApplicableCount</code> that are not reported by name to Systems
  /// Manager Inventory.
  @_s.JsonKey(name: 'UnreportedNotApplicableCount')
  final int unreportedNotApplicableCount;

  InstancePatchState({
    @_s.required this.baselineId,
    @_s.required this.instanceId,
    @_s.required this.operation,
    @_s.required this.operationEndTime,
    @_s.required this.operationStartTime,
    @_s.required this.patchGroup,
    this.failedCount,
    this.installOverrideList,
    this.installedCount,
    this.installedOtherCount,
    this.installedPendingRebootCount,
    this.installedRejectedCount,
    this.lastNoRebootInstallOperationTime,
    this.missingCount,
    this.notApplicableCount,
    this.ownerInformation,
    this.rebootOption,
    this.snapshotId,
    this.unreportedNotApplicableCount,
  });
  factory InstancePatchState.fromJson(Map<String, dynamic> json) =>
      _$InstancePatchStateFromJson(json);
}

/// Defines a filter used in <a>DescribeInstancePatchStatesForPatchGroup</a>
/// used to scope down the information returned by the API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstancePatchStateFilter {
  /// The key for the filter. Supported values are FailedCount, InstalledCount,
  /// InstalledOtherCount, MissingCount and NotApplicableCount.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The type of comparison that should be performed for the value: Equal,
  /// NotEqual, LessThan or GreaterThan.
  @_s.JsonKey(name: 'Type')
  final InstancePatchStateOperatorType type;

  /// The value for the filter, must be an integer greater than or equal to 0.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  InstancePatchStateFilter({
    @_s.required this.key,
    @_s.required this.type,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$InstancePatchStateFilterToJson(this);
}

enum InstancePatchStateOperatorType {
  @_s.JsonValue('Equal')
  equal,
  @_s.JsonValue('NotEqual')
  notEqual,
  @_s.JsonValue('LessThan')
  lessThan,
  @_s.JsonValue('GreaterThan')
  greaterThan,
}

/// Specifies the inventory type and attribute for the aggregation execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InventoryAggregator {
  /// Nested aggregators to further refine aggregation for an inventory type.
  @_s.JsonKey(name: 'Aggregators')
  final List<InventoryAggregator> aggregators;

  /// The inventory type and attribute name for aggregation.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// A user-defined set of one or more filters on which to aggregate inventory
  /// data. Groups return a count of resources that match and don't match the
  /// specified criteria.
  @_s.JsonKey(name: 'Groups')
  final List<InventoryGroup> groups;

  InventoryAggregator({
    this.aggregators,
    this.expression,
    this.groups,
  });
  Map<String, dynamic> toJson() => _$InventoryAggregatorToJson(this);
}

enum InventoryAttributeDataType {
  @_s.JsonValue('string')
  string,
  @_s.JsonValue('number')
  number,
}

enum InventoryDeletionStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Complete')
  complete,
}

/// Status information returned by the <code>DeleteInventory</code> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryDeletionStatusItem {
  /// The deletion ID returned by the <code>DeleteInventory</code> action.
  @_s.JsonKey(name: 'DeletionId')
  final String deletionId;

  /// The UTC timestamp when the delete operation started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeletionStartTime')
  final DateTime deletionStartTime;

  /// Information about the delete operation. For more information about this
  /// summary, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-custom.html#sysman-inventory-delete">Understanding
  /// the delete inventory summary</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  @_s.JsonKey(name: 'DeletionSummary')
  final InventoryDeletionSummary deletionSummary;

  /// The status of the operation. Possible values are InProgress and Complete.
  @_s.JsonKey(name: 'LastStatus')
  final InventoryDeletionStatus lastStatus;

  /// Information about the status.
  @_s.JsonKey(name: 'LastStatusMessage')
  final String lastStatusMessage;

  /// The UTC timestamp of when the last status report.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastStatusUpdateTime')
  final DateTime lastStatusUpdateTime;

  /// The name of the inventory data type.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  InventoryDeletionStatusItem({
    this.deletionId,
    this.deletionStartTime,
    this.deletionSummary,
    this.lastStatus,
    this.lastStatusMessage,
    this.lastStatusUpdateTime,
    this.typeName,
  });
  factory InventoryDeletionStatusItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryDeletionStatusItemFromJson(json);
}

/// Information about the delete operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryDeletionSummary {
  /// Remaining number of items to delete.
  @_s.JsonKey(name: 'RemainingCount')
  final int remainingCount;

  /// A list of counts and versions for deleted items.
  @_s.JsonKey(name: 'SummaryItems')
  final List<InventoryDeletionSummaryItem> summaryItems;

  /// The total number of items to delete. This count does not change during the
  /// delete operation.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  InventoryDeletionSummary({
    this.remainingCount,
    this.summaryItems,
    this.totalCount,
  });
  factory InventoryDeletionSummary.fromJson(Map<String, dynamic> json) =>
      _$InventoryDeletionSummaryFromJson(json);
}

/// Either a count, remaining count, or a version number in a delete inventory
/// summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryDeletionSummaryItem {
  /// A count of the number of deleted items.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The remaining number of items to delete.
  @_s.JsonKey(name: 'RemainingCount')
  final int remainingCount;

  /// The inventory type version.
  @_s.JsonKey(name: 'Version')
  final String version;

  InventoryDeletionSummaryItem({
    this.count,
    this.remainingCount,
    this.version,
  });
  factory InventoryDeletionSummaryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryDeletionSummaryItemFromJson(json);
}

/// One or more filters. Use a filter to return a more specific list of results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InventoryFilter {
  /// The name of the filter key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Inventory filter values. Example: inventory filter where instance IDs are
  /// specified as values Key=AWS:InstanceInformation.InstanceId,Values=
  /// i-a12b3c4d5e6g, i-1a2b3c4d5e6,Type=Equal
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  /// The type of filter.
  /// <note>
  /// The <code>Exists</code> filter must be used with aggregators. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-aggregate.html">Aggregating
  /// inventory data</a> in the <i>AWS Systems Manager User Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'Type')
  final InventoryQueryOperatorType type;

  InventoryFilter({
    @_s.required this.key,
    @_s.required this.values,
    this.type,
  });
  Map<String, dynamic> toJson() => _$InventoryFilterToJson(this);
}

/// A user-defined set of one or more filters on which to aggregate inventory
/// data. Groups return a count of resources that match and don't match the
/// specified criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InventoryGroup {
  /// Filters define the criteria for the group. The <code>matchingCount</code>
  /// field displays the number of resources that match the criteria. The
  /// <code>notMatchingCount</code> field displays the number of resources that
  /// don't match the criteria.
  @_s.JsonKey(name: 'Filters')
  final List<InventoryFilter> filters;

  /// The name of the group.
  @_s.JsonKey(name: 'Name')
  final String name;

  InventoryGroup({
    @_s.required this.filters,
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$InventoryGroupToJson(this);
}

/// Information collected from managed instances based on your inventory policy
/// document
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InventoryItem {
  /// The time the inventory information was collected.
  @_s.JsonKey(name: 'CaptureTime')
  final String captureTime;

  /// The schema version for the inventory item.
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The name of the inventory type. Default inventory item type names start with
  /// AWS. Custom inventory type names will start with Custom. Default inventory
  /// item types include the following: AWS:AWSComponent, AWS:Application,
  /// AWS:InstanceInformation, AWS:Network, and AWS:WindowsUpdate.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  /// The inventory data of the inventory type.
  @_s.JsonKey(name: 'Content')
  final List<Map<String, String>> content;

  /// MD5 hash of the inventory item type contents. The content hash is used to
  /// determine whether to update inventory information. The PutInventory API does
  /// not update the inventory item type contents if the MD5 hash has not changed
  /// since last update.
  @_s.JsonKey(name: 'ContentHash')
  final String contentHash;

  /// A map of associated properties for a specified inventory type. For example,
  /// with this attribute, you can specify the <code>ExecutionId</code>,
  /// <code>ExecutionType</code>, <code>ComplianceType</code> properties of the
  /// <code>AWS:ComplianceItem</code> type.
  @_s.JsonKey(name: 'Context')
  final Map<String, String> context;

  InventoryItem({
    @_s.required this.captureTime,
    @_s.required this.schemaVersion,
    @_s.required this.typeName,
    this.content,
    this.contentHash,
    this.context,
  });
  Map<String, dynamic> toJson() => _$InventoryItemToJson(this);
}

/// Attributes are the entries within the inventory item content. It contains
/// name and value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryItemAttribute {
  /// The data type of the inventory item attribute.
  @_s.JsonKey(name: 'DataType')
  final InventoryAttributeDataType dataType;

  /// Name of the inventory item attribute.
  @_s.JsonKey(name: 'Name')
  final String name;

  InventoryItemAttribute({
    @_s.required this.dataType,
    @_s.required this.name,
  });
  factory InventoryItemAttribute.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemAttributeFromJson(json);
}

/// The inventory item schema definition. Users can use this to compose
/// inventory query filters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryItemSchema {
  /// The schema attributes for inventory. This contains data type and attribute
  /// name.
  @_s.JsonKey(name: 'Attributes')
  final List<InventoryItemAttribute> attributes;

  /// The name of the inventory type. Default inventory item type names start with
  /// AWS. Custom inventory type names will start with Custom. Default inventory
  /// item types include the following: AWS:AWSComponent, AWS:Application,
  /// AWS:InstanceInformation, AWS:Network, and AWS:WindowsUpdate.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  /// The alias name of the inventory type. The alias name is used for display
  /// purposes.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The schema version for the inventory item.
  @_s.JsonKey(name: 'Version')
  final String version;

  InventoryItemSchema({
    @_s.required this.attributes,
    @_s.required this.typeName,
    this.displayName,
    this.version,
  });
  factory InventoryItemSchema.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemSchemaFromJson(json);
}

enum InventoryQueryOperatorType {
  @_s.JsonValue('Equal')
  equal,
  @_s.JsonValue('NotEqual')
  notEqual,
  @_s.JsonValue('BeginWith')
  beginWith,
  @_s.JsonValue('LessThan')
  lessThan,
  @_s.JsonValue('GreaterThan')
  greaterThan,
  @_s.JsonValue('Exists')
  exists,
}

/// Inventory query results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryResultEntity {
  /// The data section in the inventory result entity JSON.
  @_s.JsonKey(name: 'Data')
  final Map<String, InventoryResultItem> data;

  /// ID of the inventory result entity. For example, for managed instance
  /// inventory the result will be the managed instance ID. For EC2 instance
  /// inventory, the result will be the instance ID.
  @_s.JsonKey(name: 'Id')
  final String id;

  InventoryResultEntity({
    this.data,
    this.id,
  });
  factory InventoryResultEntity.fromJson(Map<String, dynamic> json) =>
      _$InventoryResultEntityFromJson(json);
}

/// The inventory result item.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryResultItem {
  /// Contains all the inventory data of the item type. Results include attribute
  /// names and values.
  @_s.JsonKey(name: 'Content')
  final List<Map<String, String>> content;

  /// The schema version for the inventory result item/
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The name of the inventory result item type.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  /// The time inventory item data was captured.
  @_s.JsonKey(name: 'CaptureTime')
  final String captureTime;

  /// MD5 hash of the inventory item type contents. The content hash is used to
  /// determine whether to update inventory information. The PutInventory API does
  /// not update the inventory item type contents if the MD5 hash has not changed
  /// since last update.
  @_s.JsonKey(name: 'ContentHash')
  final String contentHash;

  InventoryResultItem({
    @_s.required this.content,
    @_s.required this.schemaVersion,
    @_s.required this.typeName,
    this.captureTime,
    this.contentHash,
  });
  factory InventoryResultItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryResultItemFromJson(json);
}

enum InventorySchemaDeleteOption {
  @_s.JsonValue('DisableSchema')
  disableSchema,
  @_s.JsonValue('DeleteSchema')
  deleteSchema,
}

extension on InventorySchemaDeleteOption {
  String toValue() {
    switch (this) {
      case InventorySchemaDeleteOption.disableSchema:
        return 'DisableSchema';
      case InventorySchemaDeleteOption.deleteSchema:
        return 'DeleteSchema';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelParameterVersionResult {
  /// The label does not meet the requirements. For information about parameter
  /// label requirements, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html">Labeling
  /// parameters</a> in the <i>AWS Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'InvalidLabels')
  final List<String> invalidLabels;

  /// The version of the parameter that has been labeled.
  @_s.JsonKey(name: 'ParameterVersion')
  final int parameterVersion;

  LabelParameterVersionResult({
    this.invalidLabels,
    this.parameterVersion,
  });
  factory LabelParameterVersionResult.fromJson(Map<String, dynamic> json) =>
      _$LabelParameterVersionResultFromJson(json);
}

enum LastResourceDataSyncStatus {
  @_s.JsonValue('Successful')
  successful,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('InProgress')
  inProgress,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociationVersionsResult {
  /// Information about all versions of the association for the specified
  /// association ID.
  @_s.JsonKey(name: 'AssociationVersions')
  final List<AssociationVersionInfo> associationVersions;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAssociationVersionsResult({
    this.associationVersions,
    this.nextToken,
  });
  factory ListAssociationVersionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListAssociationVersionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociationsResult {
  /// The associations.
  @_s.JsonKey(name: 'Associations')
  final List<Association> associations;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAssociationsResult({
    this.associations,
    this.nextToken,
  });
  factory ListAssociationsResult.fromJson(Map<String, dynamic> json) =>
      _$ListAssociationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCommandInvocationsResult {
  /// (Optional) A list of all invocations.
  @_s.JsonKey(name: 'CommandInvocations')
  final List<CommandInvocation> commandInvocations;

  /// (Optional) The token for the next set of items to return. (You received this
  /// token from a previous call.)
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCommandInvocationsResult({
    this.commandInvocations,
    this.nextToken,
  });
  factory ListCommandInvocationsResult.fromJson(Map<String, dynamic> json) =>
      _$ListCommandInvocationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCommandsResult {
  /// (Optional) The list of commands requested by the user.
  @_s.JsonKey(name: 'Commands')
  final List<Command> commands;

  /// (Optional) The token for the next set of items to return. (You received this
  /// token from a previous call.)
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCommandsResult({
    this.commands,
    this.nextToken,
  });
  factory ListCommandsResult.fromJson(Map<String, dynamic> json) =>
      _$ListCommandsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComplianceItemsResult {
  /// A list of compliance information for the specified resource ID.
  @_s.JsonKey(name: 'ComplianceItems')
  final List<ComplianceItem> complianceItems;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListComplianceItemsResult({
    this.complianceItems,
    this.nextToken,
  });
  factory ListComplianceItemsResult.fromJson(Map<String, dynamic> json) =>
      _$ListComplianceItemsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComplianceSummariesResult {
  /// A list of compliant and non-compliant summary counts based on compliance
  /// types. For example, this call returns State Manager associations, patches,
  /// or custom compliance types according to the filter criteria that you
  /// specified.
  @_s.JsonKey(name: 'ComplianceSummaryItems')
  final List<ComplianceSummaryItem> complianceSummaryItems;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListComplianceSummariesResult({
    this.complianceSummaryItems,
    this.nextToken,
  });
  factory ListComplianceSummariesResult.fromJson(Map<String, dynamic> json) =>
      _$ListComplianceSummariesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDocumentMetadataHistoryResponse {
  /// The user ID of the person in the organization who requested the document
  /// review.
  @_s.JsonKey(name: 'Author')
  final String author;

  /// The version of the document.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// Information about the response to the document approval request.
  @_s.JsonKey(name: 'Metadata')
  final DocumentMetadataResponseInfo metadata;

  /// The name of the document.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The maximum number of items to return for this call. The call also returns a
  /// token that you can specify in a subsequent call to get the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDocumentMetadataHistoryResponse({
    this.author,
    this.documentVersion,
    this.metadata,
    this.name,
    this.nextToken,
  });
  factory ListDocumentMetadataHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDocumentMetadataHistoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDocumentVersionsResult {
  /// The document versions.
  @_s.JsonKey(name: 'DocumentVersions')
  final List<DocumentVersionInfo> documentVersions;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDocumentVersionsResult({
    this.documentVersions,
    this.nextToken,
  });
  factory ListDocumentVersionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListDocumentVersionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDocumentsResult {
  /// The names of the Systems Manager documents.
  @_s.JsonKey(name: 'DocumentIdentifiers')
  final List<DocumentIdentifier> documentIdentifiers;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDocumentsResult({
    this.documentIdentifiers,
    this.nextToken,
  });
  factory ListDocumentsResult.fromJson(Map<String, dynamic> json) =>
      _$ListDocumentsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInventoryEntriesResult {
  /// The time that inventory information was collected for the instance(s).
  @_s.JsonKey(name: 'CaptureTime')
  final String captureTime;

  /// A list of inventory items on the instance(s).
  @_s.JsonKey(name: 'Entries')
  final List<Map<String, String>> entries;

  /// The instance ID targeted by the request to query inventory information.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The inventory schema version used by the instance(s).
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The type of inventory item returned by the request.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  ListInventoryEntriesResult({
    this.captureTime,
    this.entries,
    this.instanceId,
    this.nextToken,
    this.schemaVersion,
    this.typeName,
  });
  factory ListInventoryEntriesResult.fromJson(Map<String, dynamic> json) =>
      _$ListInventoryEntriesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOpsItemEventsResponse {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of event information for the specified OpsItems.
  @_s.JsonKey(name: 'Summaries')
  final List<OpsItemEventSummary> summaries;

  ListOpsItemEventsResponse({
    this.nextToken,
    this.summaries,
  });
  factory ListOpsItemEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOpsItemEventsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOpsMetadataResult {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of OpsMetadata objects.
  @_s.JsonKey(name: 'OpsMetadataList')
  final List<OpsMetadata> opsMetadataList;

  ListOpsMetadataResult({
    this.nextToken,
    this.opsMetadataList,
  });
  factory ListOpsMetadataResult.fromJson(Map<String, dynamic> json) =>
      _$ListOpsMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceComplianceSummariesResult {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A summary count for specified or targeted managed instances. Summary count
  /// includes information about compliant and non-compliant State Manager
  /// associations, patch status, or custom items according to the filter criteria
  /// that you specify.
  @_s.JsonKey(name: 'ResourceComplianceSummaryItems')
  final List<ResourceComplianceSummaryItem> resourceComplianceSummaryItems;

  ListResourceComplianceSummariesResult({
    this.nextToken,
    this.resourceComplianceSummaryItems,
  });
  factory ListResourceComplianceSummariesResult.fromJson(
          Map<String, dynamic> json) =>
      _$ListResourceComplianceSummariesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceDataSyncResult {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of your current Resource Data Sync configurations and their statuses.
  @_s.JsonKey(name: 'ResourceDataSyncItems')
  final List<ResourceDataSyncItem> resourceDataSyncItems;

  ListResourceDataSyncResult({
    this.nextToken,
    this.resourceDataSyncItems,
  });
  factory ListResourceDataSyncResult.fromJson(Map<String, dynamic> json) =>
      _$ListResourceDataSyncResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResult {
  /// A list of tags.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  ListTagsForResourceResult({
    this.tagList,
  });
  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResultFromJson(json);
}

/// Information about an S3 bucket to write instance-level logs to.
/// <note>
/// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
/// contain logs, instead use the <code>OutputS3BucketName</code> and
/// <code>OutputS3KeyPrefix</code> options in the
/// <code>TaskInvocationParameters</code> structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingInfo {
  /// The name of an S3 bucket where execution logs are stored .
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// The Region where the S3 bucket is located.
  @_s.JsonKey(name: 'S3Region')
  final String s3Region;

  /// (Optional) The S3 bucket subfolder.
  @_s.JsonKey(name: 'S3KeyPrefix')
  final String s3KeyPrefix;

  LoggingInfo({
    @_s.required this.s3BucketName,
    @_s.required this.s3Region,
    this.s3KeyPrefix,
  });
  factory LoggingInfo.fromJson(Map<String, dynamic> json) =>
      _$LoggingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingInfoToJson(this);
}

/// The parameters for an AUTOMATION task type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MaintenanceWindowAutomationParameters {
  /// The version of an Automation document to use during task execution.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The parameters for the AUTOMATION task.
  ///
  /// For information about specifying and updating task parameters, see
  /// <a>RegisterTaskWithMaintenanceWindow</a> and
  /// <a>UpdateMaintenanceWindowTask</a>.
  /// <note>
  /// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
  /// contain logs, instead use the <code>OutputS3BucketName</code> and
  /// <code>OutputS3KeyPrefix</code> options in the
  /// <code>TaskInvocationParameters</code> structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
  ///
  /// <code>TaskParameters</code> has been deprecated. To specify parameters to
  /// pass to a task when it runs, instead use the <code>Parameters</code> option
  /// in the <code>TaskInvocationParameters</code> structure. For information
  /// about how Systems Manager handles these options for the supported
  /// maintenance window task types, see
  /// <a>MaintenanceWindowTaskInvocationParameters</a>.
  ///
  /// For AUTOMATION task types, Systems Manager ignores any values specified for
  /// these parameters.
  /// </note>
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  MaintenanceWindowAutomationParameters({
    this.documentVersion,
    this.parameters,
  });
  factory MaintenanceWindowAutomationParameters.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowAutomationParametersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaintenanceWindowAutomationParametersToJson(this);
}

/// Describes the information about an execution of a maintenance window.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MaintenanceWindowExecution {
  /// The time the execution finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The time the execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the execution.
  @_s.JsonKey(name: 'Status')
  final MaintenanceWindowExecutionStatus status;

  /// The details explaining the Status. Only available for certain status values.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The ID of the maintenance window execution.
  @_s.JsonKey(name: 'WindowExecutionId')
  final String windowExecutionId;

  /// The ID of the maintenance window.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  MaintenanceWindowExecution({
    this.endTime,
    this.startTime,
    this.status,
    this.statusDetails,
    this.windowExecutionId,
    this.windowId,
  });
  factory MaintenanceWindowExecution.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceWindowExecutionFromJson(json);
}

enum MaintenanceWindowExecutionStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('CANCELLING')
  cancelling,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('SKIPPED_OVERLAPPING')
  skippedOverlapping,
}

/// Information about a task execution performed as part of a maintenance window
/// execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MaintenanceWindowExecutionTaskIdentity {
  /// The time the task execution finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The time the task execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the task execution.
  @_s.JsonKey(name: 'Status')
  final MaintenanceWindowExecutionStatus status;

  /// The details explaining the status of the task execution. Only available for
  /// certain status values.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The ARN of the task that ran.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  /// The ID of the specific task execution in the maintenance window execution.
  @_s.JsonKey(name: 'TaskExecutionId')
  final String taskExecutionId;

  /// The type of task that ran.
  @_s.JsonKey(name: 'TaskType')
  final MaintenanceWindowTaskType taskType;

  /// The ID of the maintenance window execution that ran the task.
  @_s.JsonKey(name: 'WindowExecutionId')
  final String windowExecutionId;

  MaintenanceWindowExecutionTaskIdentity({
    this.endTime,
    this.startTime,
    this.status,
    this.statusDetails,
    this.taskArn,
    this.taskExecutionId,
    this.taskType,
    this.windowExecutionId,
  });
  factory MaintenanceWindowExecutionTaskIdentity.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowExecutionTaskIdentityFromJson(json);
}

/// Describes the information about a task invocation for a particular target as
/// part of a task execution performed as part of a maintenance window
/// execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MaintenanceWindowExecutionTaskInvocationIdentity {
  /// The time the invocation finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The ID of the action performed in the service that actually handled the task
  /// invocation. If the task type is RUN_COMMAND, this value is the command ID.
  @_s.JsonKey(name: 'ExecutionId')
  final String executionId;

  /// The ID of the task invocation.
  @_s.JsonKey(name: 'InvocationId')
  final String invocationId;

  /// User-provided value that was specified when the target was registered with
  /// the maintenance window. This was also included in any CloudWatch events
  /// raised during the task invocation.
  @_s.JsonKey(name: 'OwnerInformation')
  final String ownerInformation;

  /// The parameters that were provided for the invocation when it was run.
  @_s.JsonKey(name: 'Parameters')
  final String parameters;

  /// The time the invocation started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the task invocation.
  @_s.JsonKey(name: 'Status')
  final MaintenanceWindowExecutionStatus status;

  /// The details explaining the status of the task invocation. Only available for
  /// certain Status values.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  /// The ID of the specific task execution in the maintenance window execution.
  @_s.JsonKey(name: 'TaskExecutionId')
  final String taskExecutionId;

  /// The task type.
  @_s.JsonKey(name: 'TaskType')
  final MaintenanceWindowTaskType taskType;

  /// The ID of the maintenance window execution that ran the task.
  @_s.JsonKey(name: 'WindowExecutionId')
  final String windowExecutionId;

  /// The ID of the target definition in this maintenance window the invocation
  /// was performed for.
  @_s.JsonKey(name: 'WindowTargetId')
  final String windowTargetId;

  MaintenanceWindowExecutionTaskInvocationIdentity({
    this.endTime,
    this.executionId,
    this.invocationId,
    this.ownerInformation,
    this.parameters,
    this.startTime,
    this.status,
    this.statusDetails,
    this.taskExecutionId,
    this.taskType,
    this.windowExecutionId,
    this.windowTargetId,
  });
  factory MaintenanceWindowExecutionTaskInvocationIdentity.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowExecutionTaskInvocationIdentityFromJson(json);
}

/// Filter used in the request. Supported filter keys are Name and Enabled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MaintenanceWindowFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The filter values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  MaintenanceWindowFilter({
    this.key,
    this.values,
  });
  Map<String, dynamic> toJson() => _$MaintenanceWindowFilterToJson(this);
}

/// Information about the maintenance window.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MaintenanceWindowIdentity {
  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  @_s.JsonKey(name: 'Cutoff')
  final int cutoff;

  /// A description of the maintenance window.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The duration of the maintenance window in hours.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// Indicates whether the maintenance window is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become inactive.
  @_s.JsonKey(name: 'EndDate')
  final String endDate;

  /// The name of the maintenance window.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The next time the maintenance window will actually run, taking into account
  /// any specified times for the maintenance window to become active or inactive.
  @_s.JsonKey(name: 'NextExecutionTime')
  final String nextExecutionTime;

  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The number of days to wait to run a maintenance window after the scheduled
  /// CRON expression date and time.
  @_s.JsonKey(name: 'ScheduleOffset')
  final int scheduleOffset;

  /// The time zone that the scheduled maintenance window executions are based on,
  /// in Internet Assigned Numbers Authority (IANA) format.
  @_s.JsonKey(name: 'ScheduleTimezone')
  final String scheduleTimezone;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become active.
  @_s.JsonKey(name: 'StartDate')
  final String startDate;

  /// The ID of the maintenance window.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  MaintenanceWindowIdentity({
    this.cutoff,
    this.description,
    this.duration,
    this.enabled,
    this.endDate,
    this.name,
    this.nextExecutionTime,
    this.schedule,
    this.scheduleOffset,
    this.scheduleTimezone,
    this.startDate,
    this.windowId,
  });
  factory MaintenanceWindowIdentity.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceWindowIdentityFromJson(json);
}

/// The maintenance window to which the specified target belongs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MaintenanceWindowIdentityForTarget {
  /// The name of the maintenance window.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the maintenance window.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  MaintenanceWindowIdentityForTarget({
    this.name,
    this.windowId,
  });
  factory MaintenanceWindowIdentityForTarget.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowIdentityForTargetFromJson(json);
}

/// The parameters for a LAMBDA task type.
///
/// For information about specifying and updating task parameters, see
/// <a>RegisterTaskWithMaintenanceWindow</a> and
/// <a>UpdateMaintenanceWindowTask</a>.
/// <note>
/// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
/// contain logs, instead use the <code>OutputS3BucketName</code> and
/// <code>OutputS3KeyPrefix</code> options in the
/// <code>TaskInvocationParameters</code> structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
///
/// <code>TaskParameters</code> has been deprecated. To specify parameters to
/// pass to a task when it runs, instead use the <code>Parameters</code> option
/// in the <code>TaskInvocationParameters</code> structure. For information
/// about how Systems Manager handles these options for the supported
/// maintenance window task types, see
/// <a>MaintenanceWindowTaskInvocationParameters</a>.
///
/// For Lambda tasks, Systems Manager ignores any values specified for
/// TaskParameters and LoggingInfo.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MaintenanceWindowLambdaParameters {
  /// Pass client-specific information to the Lambda function that you are
  /// invoking. You can then process the client information in your Lambda
  /// function as you choose through the context variable.
  @_s.JsonKey(name: 'ClientContext')
  final String clientContext;

  /// JSON to provide to your Lambda function as input.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Payload')
  final Uint8List payload;

  /// (Optional) Specify a Lambda function version or alias name. If you specify a
  /// function version, the action uses the qualified function ARN to invoke a
  /// specific Lambda function. If you specify an alias name, the action uses the
  /// alias ARN to invoke the Lambda function version to which the alias points.
  @_s.JsonKey(name: 'Qualifier')
  final String qualifier;

  MaintenanceWindowLambdaParameters({
    this.clientContext,
    this.payload,
    this.qualifier,
  });
  factory MaintenanceWindowLambdaParameters.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowLambdaParametersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaintenanceWindowLambdaParametersToJson(this);
}

enum MaintenanceWindowResourceType {
  @_s.JsonValue('INSTANCE')
  instance,
  @_s.JsonValue('RESOURCE_GROUP')
  resourceGroup,
}

extension on MaintenanceWindowResourceType {
  String toValue() {
    switch (this) {
      case MaintenanceWindowResourceType.instance:
        return 'INSTANCE';
      case MaintenanceWindowResourceType.resourceGroup:
        return 'RESOURCE_GROUP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The parameters for a RUN_COMMAND task type.
///
/// For information about specifying and updating task parameters, see
/// <a>RegisterTaskWithMaintenanceWindow</a> and
/// <a>UpdateMaintenanceWindowTask</a>.
/// <note>
/// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
/// contain logs, instead use the <code>OutputS3BucketName</code> and
/// <code>OutputS3KeyPrefix</code> options in the
/// <code>TaskInvocationParameters</code> structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
///
/// <code>TaskParameters</code> has been deprecated. To specify parameters to
/// pass to a task when it runs, instead use the <code>Parameters</code> option
/// in the <code>TaskInvocationParameters</code> structure. For information
/// about how Systems Manager handles these options for the supported
/// maintenance window task types, see
/// <a>MaintenanceWindowTaskInvocationParameters</a>.
///
/// For Run Command tasks, Systems Manager uses specified values for
/// <code>TaskParameters</code> and <code>LoggingInfo</code> only if no values
/// are specified for <code>TaskInvocationParameters</code>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MaintenanceWindowRunCommandParameters {
  @_s.JsonKey(name: 'CloudWatchOutputConfig')
  final CloudWatchOutputConfig cloudWatchOutputConfig;

  /// Information about the commands to run.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// The SHA-256 or SHA-1 hash created by the system when the document was
  /// created. SHA-1 hashes have been deprecated.
  @_s.JsonKey(name: 'DocumentHash')
  final String documentHash;

  /// SHA-256 or SHA-1. SHA-1 hashes have been deprecated.
  @_s.JsonKey(name: 'DocumentHashType')
  final DocumentHashType documentHashType;

  /// The SSM document version to use in the request. You can specify $DEFAULT,
  /// $LATEST, or a specific version number. If you run commands by using the AWS
  /// CLI, then you must escape the first two options by using a backslash. If you
  /// specify a version number, then you don't need to use the backslash. For
  /// example:
  ///
  /// --document-version "\$DEFAULT"
  ///
  /// --document-version "\$LATEST"
  ///
  /// --document-version "3"
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// Configurations for sending notifications about command status changes on a
  /// per-instance basis.
  @_s.JsonKey(name: 'NotificationConfig')
  final NotificationConfig notificationConfig;

  /// The name of the S3 bucket.
  @_s.JsonKey(name: 'OutputS3BucketName')
  final String outputS3BucketName;

  /// The S3 bucket subfolder.
  @_s.JsonKey(name: 'OutputS3KeyPrefix')
  final String outputS3KeyPrefix;

  /// The parameters for the RUN_COMMAND task execution.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  /// The ARN of the IAM service role to use to publish Amazon Simple Notification
  /// Service (Amazon SNS) notifications for maintenance window Run Command tasks.
  @_s.JsonKey(name: 'ServiceRoleArn')
  final String serviceRoleArn;

  /// If this time is reached and the command has not already started running, it
  /// doesn't run.
  @_s.JsonKey(name: 'TimeoutSeconds')
  final int timeoutSeconds;

  MaintenanceWindowRunCommandParameters({
    this.cloudWatchOutputConfig,
    this.comment,
    this.documentHash,
    this.documentHashType,
    this.documentVersion,
    this.notificationConfig,
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
    this.parameters,
    this.serviceRoleArn,
    this.timeoutSeconds,
  });
  factory MaintenanceWindowRunCommandParameters.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowRunCommandParametersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaintenanceWindowRunCommandParametersToJson(this);
}

/// The parameters for a STEP_FUNCTIONS task.
///
/// For information about specifying and updating task parameters, see
/// <a>RegisterTaskWithMaintenanceWindow</a> and
/// <a>UpdateMaintenanceWindowTask</a>.
/// <note>
/// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
/// contain logs, instead use the <code>OutputS3BucketName</code> and
/// <code>OutputS3KeyPrefix</code> options in the
/// <code>TaskInvocationParameters</code> structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
///
/// <code>TaskParameters</code> has been deprecated. To specify parameters to
/// pass to a task when it runs, instead use the <code>Parameters</code> option
/// in the <code>TaskInvocationParameters</code> structure. For information
/// about how Systems Manager handles these options for the supported
/// maintenance window task types, see
/// <a>MaintenanceWindowTaskInvocationParameters</a>.
///
/// For Step Functions tasks, Systems Manager ignores any values specified for
/// <code>TaskParameters</code> and <code>LoggingInfo</code>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MaintenanceWindowStepFunctionsParameters {
  /// The inputs for the STEP_FUNCTIONS task.
  @_s.JsonKey(name: 'Input')
  final String input;

  /// The name of the STEP_FUNCTIONS task.
  @_s.JsonKey(name: 'Name')
  final String name;

  MaintenanceWindowStepFunctionsParameters({
    this.input,
    this.name,
  });
  factory MaintenanceWindowStepFunctionsParameters.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowStepFunctionsParametersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaintenanceWindowStepFunctionsParametersToJson(this);
}

/// The target registered with the maintenance window.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MaintenanceWindowTarget {
  /// A description for the target.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name for the maintenance window target.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A user-provided value that will be included in any CloudWatch events that
  /// are raised while running tasks for these targets in this maintenance window.
  @_s.JsonKey(name: 'OwnerInformation')
  final String ownerInformation;

  /// The type of target that is being registered with the maintenance window.
  @_s.JsonKey(name: 'ResourceType')
  final MaintenanceWindowResourceType resourceType;

  /// The targets, either instances or tags.
  ///
  /// Specify instances using the following format:
  ///
  /// <code>Key=instanceids,Values=&lt;instanceid1&gt;,&lt;instanceid2&gt;</code>
  ///
  /// Tags are specified using the following format:
  ///
  /// <code>Key=&lt;tag name&gt;,Values=&lt;tag value&gt;</code>.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  /// The ID of the maintenance window to register the target with.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  /// The ID of the target.
  @_s.JsonKey(name: 'WindowTargetId')
  final String windowTargetId;

  MaintenanceWindowTarget({
    this.description,
    this.name,
    this.ownerInformation,
    this.resourceType,
    this.targets,
    this.windowId,
    this.windowTargetId,
  });
  factory MaintenanceWindowTarget.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceWindowTargetFromJson(json);
}

/// Information about a task defined for a maintenance window.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MaintenanceWindowTask {
  /// A description of the task.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Information about an S3 bucket to write task-level logs to.
  /// <note>
  /// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
  /// contain logs, instead use the <code>OutputS3BucketName</code> and
  /// <code>OutputS3KeyPrefix</code> options in the
  /// <code>TaskInvocationParameters</code> structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  @_s.JsonKey(name: 'LoggingInfo')
  final LoggingInfo loggingInfo;

  /// The maximum number of targets this task can be run for, in parallel.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The maximum number of errors allowed before this task stops being scheduled.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The task name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The priority of the task in the maintenance window. The lower the number,
  /// the higher the priority. Tasks that have the same priority are scheduled in
  /// parallel.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The ARN of the IAM service role to use to publish Amazon Simple Notification
  /// Service (Amazon SNS) notifications for maintenance window Run Command tasks.
  @_s.JsonKey(name: 'ServiceRoleArn')
  final String serviceRoleArn;

  /// The targets (either instances or tags). Instances are specified using
  /// Key=instanceids,Values=&lt;instanceid1&gt;,&lt;instanceid2&gt;. Tags are
  /// specified using Key=&lt;tag name&gt;,Values=&lt;tag value&gt;.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  /// The resource that the task uses during execution. For RUN_COMMAND and
  /// AUTOMATION task types, <code>TaskArn</code> is the Systems Manager document
  /// name or ARN. For LAMBDA tasks, it's the function name or ARN. For
  /// STEP_FUNCTIONS tasks, it's the state machine ARN.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  /// The parameters that should be passed to the task when it is run.
  /// <note>
  /// <code>TaskParameters</code> has been deprecated. To specify parameters to
  /// pass to a task when it runs, instead use the <code>Parameters</code> option
  /// in the <code>TaskInvocationParameters</code> structure. For information
  /// about how Systems Manager handles these options for the supported
  /// maintenance window task types, see
  /// <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  @_s.JsonKey(name: 'TaskParameters')
  final Map<String, MaintenanceWindowTaskParameterValueExpression>
      taskParameters;

  /// The type of task. The type can be one of the following: RUN_COMMAND,
  /// AUTOMATION, LAMBDA, or STEP_FUNCTIONS.
  @_s.JsonKey(name: 'Type')
  final MaintenanceWindowTaskType type;

  /// The ID of the maintenance window where the task is registered.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  /// The task ID.
  @_s.JsonKey(name: 'WindowTaskId')
  final String windowTaskId;

  MaintenanceWindowTask({
    this.description,
    this.loggingInfo,
    this.maxConcurrency,
    this.maxErrors,
    this.name,
    this.priority,
    this.serviceRoleArn,
    this.targets,
    this.taskArn,
    this.taskParameters,
    this.type,
    this.windowId,
    this.windowTaskId,
  });
  factory MaintenanceWindowTask.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceWindowTaskFromJson(json);
}

/// The parameters for task execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MaintenanceWindowTaskInvocationParameters {
  /// The parameters for an AUTOMATION task type.
  @_s.JsonKey(name: 'Automation')
  final MaintenanceWindowAutomationParameters automation;

  /// The parameters for a LAMBDA task type.
  @_s.JsonKey(name: 'Lambda')
  final MaintenanceWindowLambdaParameters lambda;

  /// The parameters for a RUN_COMMAND task type.
  @_s.JsonKey(name: 'RunCommand')
  final MaintenanceWindowRunCommandParameters runCommand;

  /// The parameters for a STEP_FUNCTIONS task type.
  @_s.JsonKey(name: 'StepFunctions')
  final MaintenanceWindowStepFunctionsParameters stepFunctions;

  MaintenanceWindowTaskInvocationParameters({
    this.automation,
    this.lambda,
    this.runCommand,
    this.stepFunctions,
  });
  factory MaintenanceWindowTaskInvocationParameters.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowTaskInvocationParametersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaintenanceWindowTaskInvocationParametersToJson(this);
}

/// Defines the values for a task parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MaintenanceWindowTaskParameterValueExpression {
  /// This field contains an array of 0 or more strings, each 1 to 255 characters
  /// in length.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  MaintenanceWindowTaskParameterValueExpression({
    this.values,
  });
  factory MaintenanceWindowTaskParameterValueExpression.fromJson(
          Map<String, dynamic> json) =>
      _$MaintenanceWindowTaskParameterValueExpressionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaintenanceWindowTaskParameterValueExpressionToJson(this);
}

enum MaintenanceWindowTaskType {
  @_s.JsonValue('RUN_COMMAND')
  runCommand,
  @_s.JsonValue('AUTOMATION')
  automation,
  @_s.JsonValue('STEP_FUNCTIONS')
  stepFunctions,
  @_s.JsonValue('LAMBDA')
  lambda,
}

extension on MaintenanceWindowTaskType {
  String toValue() {
    switch (this) {
      case MaintenanceWindowTaskType.runCommand:
        return 'RUN_COMMAND';
      case MaintenanceWindowTaskType.automation:
        return 'AUTOMATION';
      case MaintenanceWindowTaskType.stepFunctions:
        return 'STEP_FUNCTIONS';
      case MaintenanceWindowTaskType.lambda:
        return 'LAMBDA';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Metadata to assign to an Application Manager application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetadataValue {
  /// Metadata value to assign to an Application Manager application.
  @_s.JsonKey(name: 'Value')
  final String value;

  MetadataValue({
    this.value,
  });
  factory MetadataValue.fromJson(Map<String, dynamic> json) =>
      _$MetadataValueFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataValueToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyDocumentPermissionResponse {
  ModifyDocumentPermissionResponse();
  factory ModifyDocumentPermissionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ModifyDocumentPermissionResponseFromJson(json);
}

/// A summary of resources that are not compliant. The summary is organized
/// according to resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NonCompliantSummary {
  /// The total number of compliance items that are not compliant.
  @_s.JsonKey(name: 'NonCompliantCount')
  final int nonCompliantCount;

  /// A summary of the non-compliance severity by compliance type
  @_s.JsonKey(name: 'SeveritySummary')
  final SeveritySummary severitySummary;

  NonCompliantSummary({
    this.nonCompliantCount,
    this.severitySummary,
  });
  factory NonCompliantSummary.fromJson(Map<String, dynamic> json) =>
      _$NonCompliantSummaryFromJson(json);
}

/// Configurations for sending notifications.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotificationConfig {
  /// An Amazon Resource Name (ARN) for an Amazon Simple Notification Service
  /// (Amazon SNS) topic. Run Command pushes notifications about command status
  /// changes to this topic.
  @_s.JsonKey(name: 'NotificationArn')
  final String notificationArn;

  /// The different events for which you can receive notifications. These events
  /// include the following: All (events), InProgress, Success, TimedOut,
  /// Cancelled, Failed. To learn more about these events, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html">Monitoring
  /// Systems Manager status changes using Amazon SNS notifications</a> in the
  /// <i>AWS Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'NotificationEvents')
  final List<NotificationEvent> notificationEvents;

  /// Command: Receive notification when the status of a command changes.
  /// Invocation: For commands sent to multiple instances, receive notification on
  /// a per-instance basis when the status of a command changes.
  @_s.JsonKey(name: 'NotificationType')
  final NotificationType notificationType;

  NotificationConfig({
    this.notificationArn,
    this.notificationEvents,
    this.notificationType,
  });
  factory NotificationConfig.fromJson(Map<String, dynamic> json) =>
      _$NotificationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationConfigToJson(this);
}

enum NotificationEvent {
  @_s.JsonValue('All')
  all,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('TimedOut')
  timedOut,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Failed')
  failed,
}

enum NotificationType {
  @_s.JsonValue('Command')
  command,
  @_s.JsonValue('Invocation')
  invocation,
}

enum OperatingSystem {
  @_s.JsonValue('WINDOWS')
  windows,
  @_s.JsonValue('AMAZON_LINUX')
  amazonLinux,
  @_s.JsonValue('AMAZON_LINUX_2')
  amazonLinux_2,
  @_s.JsonValue('UBUNTU')
  ubuntu,
  @_s.JsonValue('REDHAT_ENTERPRISE_LINUX')
  redhatEnterpriseLinux,
  @_s.JsonValue('SUSE')
  suse,
  @_s.JsonValue('CENTOS')
  centos,
  @_s.JsonValue('ORACLE_LINUX')
  oracleLinux,
  @_s.JsonValue('DEBIAN')
  debian,
  @_s.JsonValue('MACOS')
  macos,
}

extension on OperatingSystem {
  String toValue() {
    switch (this) {
      case OperatingSystem.windows:
        return 'WINDOWS';
      case OperatingSystem.amazonLinux:
        return 'AMAZON_LINUX';
      case OperatingSystem.amazonLinux_2:
        return 'AMAZON_LINUX_2';
      case OperatingSystem.ubuntu:
        return 'UBUNTU';
      case OperatingSystem.redhatEnterpriseLinux:
        return 'REDHAT_ENTERPRISE_LINUX';
      case OperatingSystem.suse:
        return 'SUSE';
      case OperatingSystem.centos:
        return 'CENTOS';
      case OperatingSystem.oracleLinux:
        return 'ORACLE_LINUX';
      case OperatingSystem.debian:
        return 'DEBIAN';
      case OperatingSystem.macos:
        return 'MACOS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// One or more aggregators for viewing counts of OpsItems using different
/// dimensions such as <code>Source</code>, <code>CreatedTime</code>, or
/// <code>Source and CreatedTime</code>, to name a few.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpsAggregator {
  /// Either a Range or Count aggregator for limiting an OpsItem summary.
  @_s.JsonKey(name: 'AggregatorType')
  final String aggregatorType;

  /// A nested aggregator for viewing counts of OpsItems.
  @_s.JsonKey(name: 'Aggregators')
  final List<OpsAggregator> aggregators;

  /// The name of an OpsItem attribute on which to limit the count of OpsItems.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The aggregator filters.
  @_s.JsonKey(name: 'Filters')
  final List<OpsFilter> filters;

  /// The data type name to use for viewing counts of OpsItems.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  /// The aggregator value.
  @_s.JsonKey(name: 'Values')
  final Map<String, String> values;

  OpsAggregator({
    this.aggregatorType,
    this.aggregators,
    this.attributeName,
    this.filters,
    this.typeName,
    this.values,
  });
  Map<String, dynamic> toJson() => _$OpsAggregatorToJson(this);
}

/// The result of the query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsEntity {
  /// The data returned by the query.
  @_s.JsonKey(name: 'Data')
  final Map<String, OpsEntityItem> data;

  /// The query ID.
  @_s.JsonKey(name: 'Id')
  final String id;

  OpsEntity({
    this.data,
    this.id,
  });
  factory OpsEntity.fromJson(Map<String, dynamic> json) =>
      _$OpsEntityFromJson(json);
}

/// The OpsItem summaries result item.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsEntityItem {
  /// The time OpsItem data was captured.
  @_s.JsonKey(name: 'CaptureTime')
  final String captureTime;

  /// The detailed data content for an OpsItem summaries result item.
  @_s.JsonKey(name: 'Content')
  final List<Map<String, String>> content;

  OpsEntityItem({
    this.captureTime,
    this.content,
  });
  factory OpsEntityItem.fromJson(Map<String, dynamic> json) =>
      _$OpsEntityItemFromJson(json);
}

/// A filter for viewing OpsItem summaries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpsFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The filter value.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  /// The type of filter.
  @_s.JsonKey(name: 'Type')
  final OpsFilterOperatorType type;

  OpsFilter({
    @_s.required this.key,
    @_s.required this.values,
    this.type,
  });
  Map<String, dynamic> toJson() => _$OpsFilterToJson(this);
}

enum OpsFilterOperatorType {
  @_s.JsonValue('Equal')
  equal,
  @_s.JsonValue('NotEqual')
  notEqual,
  @_s.JsonValue('BeginWith')
  beginWith,
  @_s.JsonValue('LessThan')
  lessThan,
  @_s.JsonValue('GreaterThan')
  greaterThan,
  @_s.JsonValue('Exists')
  exists,
}

/// Operations engineers and IT professionals use OpsCenter to view,
/// investigate, and remediate operational issues impacting the performance and
/// health of their AWS resources. For more information, see <a
/// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS
/// Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsItem {
  /// The time a runbook workflow ended. Currently reported only for the OpsItem
  /// type <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ActualEndTime')
  final DateTime actualEndTime;

  /// The time a runbook workflow started. Currently reported only for the OpsItem
  /// type <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ActualStartTime')
  final DateTime actualStartTime;

  /// An OpsItem category. Category options include: Availability, Cost,
  /// Performance, Recovery, Security.
  @_s.JsonKey(name: 'Category')
  final String category;

  /// The ARN of the AWS account that created the OpsItem.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The date and time the OpsItem was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The OpsItem description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the AWS account that last updated the OpsItem.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time the OpsItem was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of an SNS topic where notifications are sent
  /// when this OpsItem is edited or changed.
  @_s.JsonKey(name: 'Notifications')
  final List<OpsItemNotification> notifications;

  /// Operational data is custom data that provides useful reference details about
  /// the OpsItem. For example, you can specify log files, error strings, license
  /// keys, troubleshooting tips, or other relevant data. You enter operational
  /// data as key-value pairs. The key has a maximum length of 128 characters. The
  /// value has a maximum size of 20 KB.
  /// <important>
  /// Operational data keys <i>can't</i> begin with the following: amazon, aws,
  /// amzn, ssm, /amazon, /aws, /amzn, /ssm.
  /// </important>
  /// You can choose to make the data searchable by other users in the account or
  /// you can restrict search access. Searchable data means that all users with
  /// access to the OpsItem Overview page (as provided by the
  /// <a>DescribeOpsItems</a> API action) can view and search on the specified
  /// data. Operational data that is not searchable is only viewable by users who
  /// have access to the OpsItem (as provided by the <a>GetOpsItem</a> API
  /// action).
  ///
  /// Use the <code>/aws/resources</code> key in OperationalData to specify a
  /// related resource in the request. Use the <code>/aws/automations</code> key
  /// in OperationalData to associate an Automation runbook with the OpsItem. To
  /// view AWS CLI example commands that use these keys, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems">Creating
  /// OpsItems manually</a> in the <i>AWS Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'OperationalData')
  final Map<String, OpsItemDataValue> operationalData;

  /// The ID of the OpsItem.
  @_s.JsonKey(name: 'OpsItemId')
  final String opsItemId;

  /// The type of OpsItem. Currently, the only valid values are
  /// <code>/aws/changerequest</code> and <code>/aws/issue</code>.
  @_s.JsonKey(name: 'OpsItemType')
  final String opsItemType;

  /// The time specified in a change request for a runbook workflow to end.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PlannedEndTime')
  final DateTime plannedEndTime;

  /// The time specified in a change request for a runbook workflow to start.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PlannedStartTime')
  final DateTime plannedStartTime;

  /// The importance of this OpsItem in relation to other OpsItems in the system.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// One or more OpsItems that share something in common with the current
  /// OpsItem. For example, related OpsItems can include OpsItems with similar
  /// error messages, impacted resources, or statuses for the impacted resource.
  @_s.JsonKey(name: 'RelatedOpsItems')
  final List<RelatedOpsItem> relatedOpsItems;

  /// The severity of the OpsItem. Severity options range from 1 to 4.
  @_s.JsonKey(name: 'Severity')
  final String severity;

  /// The origin of the OpsItem, such as Amazon EC2 or Systems Manager. The
  /// impacted resource is a subset of source.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The OpsItem status. Status can be <code>Open</code>, <code>In
  /// Progress</code>, or <code>Resolved</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html">Editing
  /// OpsItem details</a> in the <i>AWS Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'Status')
  final OpsItemStatus status;

  /// A short heading that describes the nature of the OpsItem and the impacted
  /// resource.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The version of this OpsItem. Each time the OpsItem is edited the version
  /// number increments by one.
  @_s.JsonKey(name: 'Version')
  final String version;

  OpsItem({
    this.actualEndTime,
    this.actualStartTime,
    this.category,
    this.createdBy,
    this.createdTime,
    this.description,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.notifications,
    this.operationalData,
    this.opsItemId,
    this.opsItemType,
    this.plannedEndTime,
    this.plannedStartTime,
    this.priority,
    this.relatedOpsItems,
    this.severity,
    this.source,
    this.status,
    this.title,
    this.version,
  });
  factory OpsItem.fromJson(Map<String, dynamic> json) =>
      _$OpsItemFromJson(json);
}

enum OpsItemDataType {
  @_s.JsonValue('SearchableString')
  searchableString,
  @_s.JsonValue('String')
  string,
}

/// An object that defines the value of the key and its type in the
/// OperationalData map.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OpsItemDataValue {
  /// The type of key-value pair. Valid types include
  /// <code>SearchableString</code> and <code>String</code>.
  @_s.JsonKey(name: 'Type')
  final OpsItemDataType type;

  /// The value of the OperationalData key.
  @_s.JsonKey(name: 'Value')
  final String value;

  OpsItemDataValue({
    this.type,
    this.value,
  });
  factory OpsItemDataValue.fromJson(Map<String, dynamic> json) =>
      _$OpsItemDataValueFromJson(json);

  Map<String, dynamic> toJson() => _$OpsItemDataValueToJson(this);
}

/// Describes a filter for a specific list of OpsItem events. You can filter
/// event information by using tags. You specify tags by using a key-value pair
/// mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpsItemEventFilter {
  /// The name of the filter key. Currently, the only supported value is
  /// <code>OpsItemId</code>.
  @_s.JsonKey(name: 'Key')
  final OpsItemEventFilterKey key;

  /// The operator used by the filter call. Currently, the only supported value is
  /// <code>Equal</code>.
  @_s.JsonKey(name: 'Operator')
  final OpsItemEventFilterOperator operator;

  /// The values for the filter, consisting of one or more OpsItem IDs.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  OpsItemEventFilter({
    @_s.required this.key,
    @_s.required this.operator,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$OpsItemEventFilterToJson(this);
}

enum OpsItemEventFilterKey {
  @_s.JsonValue('OpsItemId')
  opsItemId,
}

enum OpsItemEventFilterOperator {
  @_s.JsonValue('Equal')
  equal,
}

/// Summary information about an OpsItem event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsItemEventSummary {
  /// Information about the user or resource that created the OpsItem event.
  @_s.JsonKey(name: 'CreatedBy')
  final OpsItemIdentity createdBy;

  /// The date and time the OpsItem event was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Specific information about the OpsItem event.
  @_s.JsonKey(name: 'Detail')
  final String detail;

  /// The type of information provided as a detail.
  @_s.JsonKey(name: 'DetailType')
  final String detailType;

  /// The ID of the OpsItem event.
  @_s.JsonKey(name: 'EventId')
  final String eventId;

  /// The ID of the OpsItem.
  @_s.JsonKey(name: 'OpsItemId')
  final String opsItemId;

  /// The source of the OpsItem event.
  @_s.JsonKey(name: 'Source')
  final String source;

  OpsItemEventSummary({
    this.createdBy,
    this.createdTime,
    this.detail,
    this.detailType,
    this.eventId,
    this.opsItemId,
    this.source,
  });
  factory OpsItemEventSummary.fromJson(Map<String, dynamic> json) =>
      _$OpsItemEventSummaryFromJson(json);
}

/// Describes an OpsItem filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpsItemFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'Key')
  final OpsItemFilterKey key;

  /// The operator used by the filter call.
  @_s.JsonKey(name: 'Operator')
  final OpsItemFilterOperator operator;

  /// The filter value.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  OpsItemFilter({
    @_s.required this.key,
    @_s.required this.operator,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$OpsItemFilterToJson(this);
}

enum OpsItemFilterKey {
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('CreatedBy')
  createdBy,
  @_s.JsonValue('Source')
  source,
  @_s.JsonValue('Priority')
  priority,
  @_s.JsonValue('Title')
  title,
  @_s.JsonValue('OpsItemId')
  opsItemId,
  @_s.JsonValue('CreatedTime')
  createdTime,
  @_s.JsonValue('LastModifiedTime')
  lastModifiedTime,
  @_s.JsonValue('ActualStartTime')
  actualStartTime,
  @_s.JsonValue('ActualEndTime')
  actualEndTime,
  @_s.JsonValue('PlannedStartTime')
  plannedStartTime,
  @_s.JsonValue('PlannedEndTime')
  plannedEndTime,
  @_s.JsonValue('OperationalData')
  operationalData,
  @_s.JsonValue('OperationalDataKey')
  operationalDataKey,
  @_s.JsonValue('OperationalDataValue')
  operationalDataValue,
  @_s.JsonValue('ResourceId')
  resourceId,
  @_s.JsonValue('AutomationId')
  automationId,
  @_s.JsonValue('Category')
  category,
  @_s.JsonValue('Severity')
  severity,
  @_s.JsonValue('OpsItemType')
  opsItemType,
  @_s.JsonValue('ChangeRequestByRequesterArn')
  changeRequestByRequesterArn,
  @_s.JsonValue('ChangeRequestByRequesterName')
  changeRequestByRequesterName,
  @_s.JsonValue('ChangeRequestByApproverArn')
  changeRequestByApproverArn,
  @_s.JsonValue('ChangeRequestByApproverName')
  changeRequestByApproverName,
  @_s.JsonValue('ChangeRequestByTemplate')
  changeRequestByTemplate,
  @_s.JsonValue('ChangeRequestByTargetsResourceGroup')
  changeRequestByTargetsResourceGroup,
}

enum OpsItemFilterOperator {
  @_s.JsonValue('Equal')
  equal,
  @_s.JsonValue('Contains')
  contains,
  @_s.JsonValue('GreaterThan')
  greaterThan,
  @_s.JsonValue('LessThan')
  lessThan,
}

/// Information about the user or resource that created an OpsItem event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsItemIdentity {
  /// The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem
  /// event.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  OpsItemIdentity({
    this.arn,
  });
  factory OpsItemIdentity.fromJson(Map<String, dynamic> json) =>
      _$OpsItemIdentityFromJson(json);
}

/// A notification about the OpsItem.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OpsItemNotification {
  /// The Amazon Resource Name (ARN) of an SNS topic where notifications are sent
  /// when this OpsItem is edited or changed.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  OpsItemNotification({
    this.arn,
  });
  factory OpsItemNotification.fromJson(Map<String, dynamic> json) =>
      _$OpsItemNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$OpsItemNotificationToJson(this);
}

enum OpsItemStatus {
  @_s.JsonValue('Open')
  open,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Resolved')
  resolved,
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('TimedOut')
  timedOut,
  @_s.JsonValue('Cancelling')
  cancelling,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('CompletedWithSuccess')
  completedWithSuccess,
  @_s.JsonValue('CompletedWithFailure')
  completedWithFailure,
  @_s.JsonValue('Scheduled')
  scheduled,
  @_s.JsonValue('RunbookInProgress')
  runbookInProgress,
  @_s.JsonValue('PendingChangeCalendarOverride')
  pendingChangeCalendarOverride,
  @_s.JsonValue('ChangeCalendarOverrideApproved')
  changeCalendarOverrideApproved,
  @_s.JsonValue('ChangeCalendarOverrideRejected')
  changeCalendarOverrideRejected,
  @_s.JsonValue('PendingApproval')
  pendingApproval,
  @_s.JsonValue('Approved')
  approved,
  @_s.JsonValue('Rejected')
  rejected,
}

extension on OpsItemStatus {
  String toValue() {
    switch (this) {
      case OpsItemStatus.open:
        return 'Open';
      case OpsItemStatus.inProgress:
        return 'InProgress';
      case OpsItemStatus.resolved:
        return 'Resolved';
      case OpsItemStatus.pending:
        return 'Pending';
      case OpsItemStatus.timedOut:
        return 'TimedOut';
      case OpsItemStatus.cancelling:
        return 'Cancelling';
      case OpsItemStatus.cancelled:
        return 'Cancelled';
      case OpsItemStatus.failed:
        return 'Failed';
      case OpsItemStatus.completedWithSuccess:
        return 'CompletedWithSuccess';
      case OpsItemStatus.completedWithFailure:
        return 'CompletedWithFailure';
      case OpsItemStatus.scheduled:
        return 'Scheduled';
      case OpsItemStatus.runbookInProgress:
        return 'RunbookInProgress';
      case OpsItemStatus.pendingChangeCalendarOverride:
        return 'PendingChangeCalendarOverride';
      case OpsItemStatus.changeCalendarOverrideApproved:
        return 'ChangeCalendarOverrideApproved';
      case OpsItemStatus.changeCalendarOverrideRejected:
        return 'ChangeCalendarOverrideRejected';
      case OpsItemStatus.pendingApproval:
        return 'PendingApproval';
      case OpsItemStatus.approved:
        return 'Approved';
      case OpsItemStatus.rejected:
        return 'Rejected';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A count of OpsItems.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsItemSummary {
  /// The time a runbook workflow ended. Currently reported only for the OpsItem
  /// type <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ActualEndTime')
  final DateTime actualEndTime;

  /// The time a runbook workflow started. Currently reported only for the OpsItem
  /// type <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ActualStartTime')
  final DateTime actualStartTime;

  /// A list of OpsItems by category.
  @_s.JsonKey(name: 'Category')
  final String category;

  /// The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The date and time the OpsItem was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time the OpsItem was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// Operational data is custom data that provides useful reference details about
  /// the OpsItem.
  @_s.JsonKey(name: 'OperationalData')
  final Map<String, OpsItemDataValue> operationalData;

  /// The ID of the OpsItem.
  @_s.JsonKey(name: 'OpsItemId')
  final String opsItemId;

  /// The type of OpsItem. Currently, the only valid values are
  /// <code>/aws/changerequest</code> and <code>/aws/issue</code>.
  @_s.JsonKey(name: 'OpsItemType')
  final String opsItemType;

  /// The time specified in a change request for a runbook workflow to end.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PlannedEndTime')
  final DateTime plannedEndTime;

  /// The time specified in a change request for a runbook workflow to start.
  /// Currently supported only for the OpsItem type
  /// <code>/aws/changerequest</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PlannedStartTime')
  final DateTime plannedStartTime;

  /// The importance of this OpsItem in relation to other OpsItems in the system.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// A list of OpsItems by severity.
  @_s.JsonKey(name: 'Severity')
  final String severity;

  /// The impacted AWS resource.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The OpsItem status. Status can be <code>Open</code>, <code>In
  /// Progress</code>, or <code>Resolved</code>.
  @_s.JsonKey(name: 'Status')
  final OpsItemStatus status;

  /// A short heading that describes the nature of the OpsItem and the impacted
  /// resource.
  @_s.JsonKey(name: 'Title')
  final String title;

  OpsItemSummary({
    this.actualEndTime,
    this.actualStartTime,
    this.category,
    this.createdBy,
    this.createdTime,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.operationalData,
    this.opsItemId,
    this.opsItemType,
    this.plannedEndTime,
    this.plannedStartTime,
    this.priority,
    this.severity,
    this.source,
    this.status,
    this.title,
  });
  factory OpsItemSummary.fromJson(Map<String, dynamic> json) =>
      _$OpsItemSummaryFromJson(json);
}

/// Operational metadata for an application in Application Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsMetadata {
  /// The date the OpsMetadata objects was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The date the OpsMetadata object was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The user name who last updated the OpsMetadata object.
  @_s.JsonKey(name: 'LastModifiedUser')
  final String lastModifiedUser;

  /// The Amazon Resource Name (ARN) of the OpsMetadata Object or blob.
  @_s.JsonKey(name: 'OpsMetadataArn')
  final String opsMetadataArn;

  /// The ID of the Application Manager application.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  OpsMetadata({
    this.creationDate,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.opsMetadataArn,
    this.resourceId,
  });
  factory OpsMetadata.fromJson(Map<String, dynamic> json) =>
      _$OpsMetadataFromJson(json);
}

/// A filter to limit the number of OpsMetadata objects displayed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpsMetadataFilter {
  /// A filter key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// A filter value.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  OpsMetadataFilter({
    @_s.required this.key,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$OpsMetadataFilterToJson(this);
}

/// The OpsItem data type to return.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpsResultAttribute {
  /// Name of the data type. Valid value: AWS:OpsItem, AWS:EC2InstanceInformation,
  /// AWS:OpsItemTrendline, or AWS:ComplianceSummary.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  OpsResultAttribute({
    @_s.required this.typeName,
  });
  Map<String, dynamic> toJson() => _$OpsResultAttributeToJson(this);
}

/// Information about the source where the association execution details are
/// stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputSource {
  /// The ID of the output source, for example the URL of an S3 bucket.
  @_s.JsonKey(name: 'OutputSourceId')
  final String outputSourceId;

  /// The type of source where the association execution details are stored, for
  /// example, Amazon S3.
  @_s.JsonKey(name: 'OutputSourceType')
  final String outputSourceType;

  OutputSource({
    this.outputSourceId,
    this.outputSourceType,
  });
  factory OutputSource.fromJson(Map<String, dynamic> json) =>
      _$OutputSourceFromJson(json);
}

/// An Systems Manager parameter in Parameter Store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Parameter {
  /// The Amazon Resource Name (ARN) of the parameter.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The data type of the parameter, such as <code>text</code> or
  /// <code>aws:ec2:image</code>. The default is <code>text</code>.
  @_s.JsonKey(name: 'DataType')
  final String dataType;

  /// Date the parameter was last changed or updated and the parameter version was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The name of the parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Either the version number or the label used to retrieve the parameter value.
  /// Specify selectors by using one of the following formats:
  ///
  /// parameter_name:version
  ///
  /// parameter_name:label
  @_s.JsonKey(name: 'Selector')
  final String selector;

  /// Applies to parameters that reference information in other AWS services.
  /// SourceResult is the raw result or response from the source.
  @_s.JsonKey(name: 'SourceResult')
  final String sourceResult;

  /// The type of parameter. Valid values include the following:
  /// <code>String</code>, <code>StringList</code>, and <code>SecureString</code>.
  @_s.JsonKey(name: 'Type')
  final ParameterType type;

  /// The parameter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  /// The parameter version.
  @_s.JsonKey(name: 'Version')
  final int version;

  Parameter({
    this.arn,
    this.dataType,
    this.lastModifiedDate,
    this.name,
    this.selector,
    this.sourceResult,
    this.type,
    this.value,
    this.version,
  });
  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);
}

/// Information about parameter usage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParameterHistory {
  /// Parameter names can include the following letters and symbols.
  ///
  /// a-zA-Z0-9_.-
  @_s.JsonKey(name: 'AllowedPattern')
  final String allowedPattern;

  /// The data type of the parameter, such as <code>text</code> or
  /// <code>aws:ec2:image</code>. The default is <code>text</code>.
  @_s.JsonKey(name: 'DataType')
  final String dataType;

  /// Information about the parameter.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the query key used for this parameter.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// Labels assigned to the parameter version.
  @_s.JsonKey(name: 'Labels')
  final List<String> labels;

  /// Date the parameter was last changed or updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// Amazon Resource Name (ARN) of the AWS user who last changed the parameter.
  @_s.JsonKey(name: 'LastModifiedUser')
  final String lastModifiedUser;

  /// The name of the parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Information about the policies assigned to a parameter.
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html">Assigning
  /// parameter policies</a> in the <i>AWS Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'Policies')
  final List<ParameterInlinePolicy> policies;

  /// The parameter tier.
  @_s.JsonKey(name: 'Tier')
  final ParameterTier tier;

  /// The type of parameter used.
  @_s.JsonKey(name: 'Type')
  final ParameterType type;

  /// The parameter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  /// The parameter version.
  @_s.JsonKey(name: 'Version')
  final int version;

  ParameterHistory({
    this.allowedPattern,
    this.dataType,
    this.description,
    this.keyId,
    this.labels,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.name,
    this.policies,
    this.tier,
    this.type,
    this.value,
    this.version,
  });
  factory ParameterHistory.fromJson(Map<String, dynamic> json) =>
      _$ParameterHistoryFromJson(json);
}

/// One or more policies assigned to a parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParameterInlinePolicy {
  /// The status of the policy. Policies report the following statuses: Pending
  /// (the policy has not been enforced or applied yet), Finished (the policy was
  /// applied), Failed (the policy was not applied), or InProgress (the policy is
  /// being applied now).
  @_s.JsonKey(name: 'PolicyStatus')
  final String policyStatus;

  /// The JSON text of the policy.
  @_s.JsonKey(name: 'PolicyText')
  final String policyText;

  /// The type of policy. Parameter Store supports the following policy types:
  /// Expiration, ExpirationNotification, and NoChangeNotification.
  @_s.JsonKey(name: 'PolicyType')
  final String policyType;

  ParameterInlinePolicy({
    this.policyStatus,
    this.policyText,
    this.policyType,
  });
  factory ParameterInlinePolicy.fromJson(Map<String, dynamic> json) =>
      _$ParameterInlinePolicyFromJson(json);
}

/// Metadata includes information like the ARN of the last user and the
/// date/time the parameter was last used.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParameterMetadata {
  /// A parameter name can include only the following letters and symbols.
  ///
  /// a-zA-Z0-9_.-
  @_s.JsonKey(name: 'AllowedPattern')
  final String allowedPattern;

  /// The data type of the parameter, such as <code>text</code> or
  /// <code>aws:ec2:image</code>. The default is <code>text</code>.
  @_s.JsonKey(name: 'DataType')
  final String dataType;

  /// Description of the parameter actions.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the query key used for this parameter.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// Date the parameter was last changed or updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// Amazon Resource Name (ARN) of the AWS user who last changed the parameter.
  @_s.JsonKey(name: 'LastModifiedUser')
  final String lastModifiedUser;

  /// The parameter name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of policies associated with a parameter.
  @_s.JsonKey(name: 'Policies')
  final List<ParameterInlinePolicy> policies;

  /// The parameter tier.
  @_s.JsonKey(name: 'Tier')
  final ParameterTier tier;

  /// The type of parameter. Valid parameter types include the following:
  /// <code>String</code>, <code>StringList</code>, and <code>SecureString</code>.
  @_s.JsonKey(name: 'Type')
  final ParameterType type;

  /// The parameter version.
  @_s.JsonKey(name: 'Version')
  final int version;

  ParameterMetadata({
    this.allowedPattern,
    this.dataType,
    this.description,
    this.keyId,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.name,
    this.policies,
    this.tier,
    this.type,
    this.version,
  });
  factory ParameterMetadata.fromJson(Map<String, dynamic> json) =>
      _$ParameterMetadataFromJson(json);
}

/// One or more filters. Use a filter to return a more specific list of results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParameterStringFilter {
  /// The name of the filter.
  /// <note>
  /// The <code>ParameterStringFilter</code> object is used by the
  /// <a>DescribeParameters</a> and <a>GetParametersByPath</a> API actions.
  /// However, not all of the pattern values listed for <code>Key</code> can be
  /// used with both actions.
  ///
  /// For <code>DescribeActions</code>, all of the listed patterns are valid, with
  /// the exception of <code>Label</code>.
  ///
  /// For <code>GetParametersByPath</code>, the following patterns listed for
  /// <code>Key</code> are not valid: <code>tag</code>, <code>Name</code>,
  /// <code>Path</code>, and <code>Tier</code>.
  ///
  /// For examples of CLI commands demonstrating valid parameter filter
  /// constructions, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-search.html">Searching
  /// for Systems Manager parameters</a> in the <i>AWS Systems Manager User
  /// Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'Key')
  final String key;

  /// For all filters used with <a>DescribeParameters</a>, valid options include
  /// <code>Equals</code> and <code>BeginsWith</code>. The <code>Name</code>
  /// filter additionally supports the <code>Contains</code> option. (Exception:
  /// For filters using the key <code>Path</code>, valid options include
  /// <code>Recursive</code> and <code>OneLevel</code>.)
  ///
  /// For filters used with <a>GetParametersByPath</a>, valid options include
  /// <code>Equals</code> and <code>BeginsWith</code>. (Exception: For filters
  /// using <code>Label</code> as the Key name, the only valid option is
  /// <code>Equals</code>.)
  @_s.JsonKey(name: 'Option')
  final String option;

  /// The value you want to search for.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  ParameterStringFilter({
    @_s.required this.key,
    this.option,
    this.values,
  });
  Map<String, dynamic> toJson() => _$ParameterStringFilterToJson(this);
}

enum ParameterTier {
  @_s.JsonValue('Standard')
  standard,
  @_s.JsonValue('Advanced')
  advanced,
  @_s.JsonValue('Intelligent-Tiering')
  intelligentTiering,
}

extension on ParameterTier {
  String toValue() {
    switch (this) {
      case ParameterTier.standard:
        return 'Standard';
      case ParameterTier.advanced:
        return 'Advanced';
      case ParameterTier.intelligentTiering:
        return 'Intelligent-Tiering';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ParameterType {
  @_s.JsonValue('String')
  string,
  @_s.JsonValue('StringList')
  stringList,
  @_s.JsonValue('SecureString')
  secureString,
}

extension on ParameterType {
  String toValue() {
    switch (this) {
      case ParameterType.string:
        return 'String';
      case ParameterType.stringList:
        return 'StringList';
      case ParameterType.secureString:
        return 'SecureString';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// This data type is deprecated. Instead, use <a>ParameterStringFilter</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParametersFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'Key')
  final ParametersFilterKey key;

  /// The filter values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  ParametersFilter({
    @_s.required this.key,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$ParametersFilterToJson(this);
}

enum ParametersFilterKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('Type')
  type,
  @_s.JsonValue('KeyId')
  keyId,
}

/// Represents metadata about a patch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Patch {
  /// The Advisory ID of the patch. For example, <code>RHSA-2020:3779</code>.
  /// Applies to Linux-based instances only.
  @_s.JsonKey(name: 'AdvisoryIds')
  final List<String> advisoryIds;

  /// The architecture of the patch. For example, in
  /// <code>example-pkg-0.710.10-2.7.abcd.x86_64</code>, the architecture is
  /// indicated by <code>x86_64</code>. Applies to Linux-based instances only.
  @_s.JsonKey(name: 'Arch')
  final String arch;

  /// The Bugzilla ID of the patch. For example, <code>1600646</code>. Applies to
  /// Linux-based instances only.
  @_s.JsonKey(name: 'BugzillaIds')
  final List<String> bugzillaIds;

  /// The Common Vulnerabilities and Exposures (CVE) ID of the patch. For example,
  /// <code>CVE-2011-3192</code>. Applies to Linux-based instances only.
  @_s.JsonKey(name: 'CVEIds')
  final List<String> cVEIds;

  /// The classification of the patch. For example, <code>SecurityUpdates</code>,
  /// <code>Updates</code>, or <code>CriticalUpdates</code>.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// The URL where more information can be obtained about the patch.
  @_s.JsonKey(name: 'ContentUrl')
  final String contentUrl;

  /// The description of the patch.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The epoch of the patch. For example in
  /// <code>pkg-example-EE-20180914-2.2.amzn1.noarch</code>, the epoch value is
  /// <code>20180914-2</code>. Applies to Linux-based instances only.
  @_s.JsonKey(name: 'Epoch')
  final int epoch;

  /// The ID of the patch. Applies to Windows patches only.
  /// <note>
  /// This ID is not the same as the Microsoft Knowledge Base ID.
  /// </note>
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The Microsoft Knowledge Base ID of the patch. Applies to Windows patches
  /// only.
  @_s.JsonKey(name: 'KbNumber')
  final String kbNumber;

  /// The language of the patch if it's language-specific.
  @_s.JsonKey(name: 'Language')
  final String language;

  /// The ID of the Microsoft Security Response Center (MSRC) bulletin the patch
  /// is related to. For example, <code>MS14-045</code>. Applies to Windows
  /// patches only.
  @_s.JsonKey(name: 'MsrcNumber')
  final String msrcNumber;

  /// The severity of the patch, such as <code>Critical</code>,
  /// <code>Important</code>, or <code>Moderate</code>. Applies to Windows patches
  /// only.
  @_s.JsonKey(name: 'MsrcSeverity')
  final String msrcSeverity;

  /// The name of the patch. Applies to Linux-based instances only.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The specific product the patch is applicable for. For example,
  /// <code>WindowsServer2016</code> or <code>AmazonLinux2018.03</code>.
  @_s.JsonKey(name: 'Product')
  final String product;

  /// The product family the patch is applicable for. For example,
  /// <code>Windows</code> or <code>Amazon Linux 2</code>.
  @_s.JsonKey(name: 'ProductFamily')
  final String productFamily;

  /// The particular release of a patch. For example, in
  /// <code>pkg-example-EE-20180914-2.2.amzn1.noarch</code>, the release is
  /// <code>2.amaz1</code>. Applies to Linux-based instances only.
  @_s.JsonKey(name: 'Release')
  final String release;

  /// The date the patch was released.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReleaseDate')
  final DateTime releaseDate;

  /// The source patch repository for the operating system and version, such as
  /// <code>trusty-security</code> for Ubuntu Server 14.04 LTE and
  /// <code>focal-security</code> for Ubuntu Server 20.04 LTE. Applies to
  /// Linux-based instances only.
  @_s.JsonKey(name: 'Repository')
  final String repository;

  /// The severity level of the patch. For example, <code>CRITICAL</code> or
  /// <code>MODERATE</code>.
  @_s.JsonKey(name: 'Severity')
  final String severity;

  /// The title of the patch.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The name of the vendor providing the patch.
  @_s.JsonKey(name: 'Vendor')
  final String vendor;

  /// The version number of the patch. For example, in
  /// <code>example-pkg-1.710.10-2.7.abcd.x86_64</code>, the version number is
  /// indicated by <code>-1</code>. Applies to Linux-based instances only.
  @_s.JsonKey(name: 'Version')
  final String version;

  Patch({
    this.advisoryIds,
    this.arch,
    this.bugzillaIds,
    this.cVEIds,
    this.classification,
    this.contentUrl,
    this.description,
    this.epoch,
    this.id,
    this.kbNumber,
    this.language,
    this.msrcNumber,
    this.msrcSeverity,
    this.name,
    this.product,
    this.productFamily,
    this.release,
    this.releaseDate,
    this.repository,
    this.severity,
    this.title,
    this.vendor,
    this.version,
  });
  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);
}

enum PatchAction {
  @_s.JsonValue('ALLOW_AS_DEPENDENCY')
  allowAsDependency,
  @_s.JsonValue('BLOCK')
  block,
}

extension on PatchAction {
  String toValue() {
    switch (this) {
      case PatchAction.allowAsDependency:
        return 'ALLOW_AS_DEPENDENCY';
      case PatchAction.block:
        return 'BLOCK';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Defines the basic information about a patch baseline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PatchBaselineIdentity {
  /// The description of the patch baseline.
  @_s.JsonKey(name: 'BaselineDescription')
  final String baselineDescription;

  /// The ID of the patch baseline.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The name of the patch baseline.
  @_s.JsonKey(name: 'BaselineName')
  final String baselineName;

  /// Whether this is the default baseline. Note that Systems Manager supports
  /// creating multiple default patch baselines. For example, you can create a
  /// default patch baseline for each operating system.
  @_s.JsonKey(name: 'DefaultBaseline')
  final bool defaultBaseline;

  /// Defines the operating system the patch baseline applies to. The Default
  /// value is WINDOWS.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  PatchBaselineIdentity({
    this.baselineDescription,
    this.baselineId,
    this.baselineName,
    this.defaultBaseline,
    this.operatingSystem,
  });
  factory PatchBaselineIdentity.fromJson(Map<String, dynamic> json) =>
      _$PatchBaselineIdentityFromJson(json);
}

/// Information about the state of a patch on a particular instance as it
/// relates to the patch baseline used to patch the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PatchComplianceData {
  /// The classification of the patch (for example, SecurityUpdates, Updates,
  /// CriticalUpdates).
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// The date/time the patch was installed on the instance. Note that not all
  /// operating systems provide this level of information.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'InstalledTime')
  final DateTime installedTime;

  /// The operating system-specific ID of the patch.
  @_s.JsonKey(name: 'KBId')
  final String kBId;

  /// The severity of the patch (for example, Critical, Important, Moderate).
  @_s.JsonKey(name: 'Severity')
  final String severity;

  /// The state of the patch on the instance, such as INSTALLED or FAILED.
  ///
  /// For descriptions of each patch state, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-compliance-about.html#sysman-compliance-monitor-patch">About
  /// patch compliance</a> in the <i>AWS Systems Manager User Guide</i>.
  @_s.JsonKey(name: 'State')
  final PatchComplianceDataState state;

  /// The title of the patch.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The IDs of one or more Common Vulnerabilities and Exposure (CVE) issues that
  /// are resolved by the patch.
  @_s.JsonKey(name: 'CVEIds')
  final String cVEIds;

  PatchComplianceData({
    @_s.required this.classification,
    @_s.required this.installedTime,
    @_s.required this.kBId,
    @_s.required this.severity,
    @_s.required this.state,
    @_s.required this.title,
    this.cVEIds,
  });
  factory PatchComplianceData.fromJson(Map<String, dynamic> json) =>
      _$PatchComplianceDataFromJson(json);
}

enum PatchComplianceDataState {
  @_s.JsonValue('INSTALLED')
  installed,
  @_s.JsonValue('INSTALLED_OTHER')
  installedOther,
  @_s.JsonValue('INSTALLED_PENDING_REBOOT')
  installedPendingReboot,
  @_s.JsonValue('INSTALLED_REJECTED')
  installedRejected,
  @_s.JsonValue('MISSING')
  missing,
  @_s.JsonValue('NOT_APPLICABLE')
  notApplicable,
  @_s.JsonValue('FAILED')
  failed,
}

enum PatchComplianceLevel {
  @_s.JsonValue('CRITICAL')
  critical,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('INFORMATIONAL')
  informational,
  @_s.JsonValue('UNSPECIFIED')
  unspecified,
}

extension on PatchComplianceLevel {
  String toValue() {
    switch (this) {
      case PatchComplianceLevel.critical:
        return 'CRITICAL';
      case PatchComplianceLevel.high:
        return 'HIGH';
      case PatchComplianceLevel.medium:
        return 'MEDIUM';
      case PatchComplianceLevel.low:
        return 'LOW';
      case PatchComplianceLevel.informational:
        return 'INFORMATIONAL';
      case PatchComplianceLevel.unspecified:
        return 'UNSPECIFIED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PatchDeploymentStatus {
  @_s.JsonValue('APPROVED')
  approved,
  @_s.JsonValue('PENDING_APPROVAL')
  pendingApproval,
  @_s.JsonValue('EXPLICIT_APPROVED')
  explicitApproved,
  @_s.JsonValue('EXPLICIT_REJECTED')
  explicitRejected,
}

/// Defines which patches should be included in a patch baseline.
///
/// A patch filter consists of a key and a set of values. The filter key is a
/// patch property. For example, the available filter keys for WINDOWS are
/// PATCH_SET, PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, and MSRC_SEVERITY. The
/// filter values define a matching criterion for the patch property indicated
/// by the key. For example, if the filter key is PRODUCT and the filter values
/// are ["Office 2013", "Office 2016"], then the filter accepts all patches
/// where product name is either "Office 2013" or "Office 2016". The filter
/// values can be exact values for the patch property given as a key, or a
/// wildcard (*), which matches all values.
///
/// You can view lists of valid values for the patch properties by running the
/// <code>DescribePatchProperties</code> command. For information about which
/// patch properties can be used with each major operating system, see
/// <a>DescribePatchProperties</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PatchFilter {
  /// The key for the filter.
  ///
  /// Run the <a>DescribePatchProperties</a> command to view lists of valid keys
  /// for each operating system type.
  @_s.JsonKey(name: 'Key')
  final PatchFilterKey key;

  /// The value for the filter key.
  ///
  /// Run the <a>DescribePatchProperties</a> command to view lists of valid values
  /// for each key based on operating system type.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  PatchFilter({
    @_s.required this.key,
    @_s.required this.values,
  });
  factory PatchFilter.fromJson(Map<String, dynamic> json) =>
      _$PatchFilterFromJson(json);

  Map<String, dynamic> toJson() => _$PatchFilterToJson(this);
}

/// A set of patch filters, typically used for approval rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PatchFilterGroup {
  /// The set of patch filters that make up the group.
  @_s.JsonKey(name: 'PatchFilters')
  final List<PatchFilter> patchFilters;

  PatchFilterGroup({
    @_s.required this.patchFilters,
  });
  factory PatchFilterGroup.fromJson(Map<String, dynamic> json) =>
      _$PatchFilterGroupFromJson(json);

  Map<String, dynamic> toJson() => _$PatchFilterGroupToJson(this);
}

enum PatchFilterKey {
  @_s.JsonValue('ARCH')
  arch,
  @_s.JsonValue('ADVISORY_ID')
  advisoryId,
  @_s.JsonValue('BUGZILLA_ID')
  bugzillaId,
  @_s.JsonValue('PATCH_SET')
  patchSet,
  @_s.JsonValue('PRODUCT')
  product,
  @_s.JsonValue('PRODUCT_FAMILY')
  productFamily,
  @_s.JsonValue('CLASSIFICATION')
  classification,
  @_s.JsonValue('CVE_ID')
  cveId,
  @_s.JsonValue('EPOCH')
  epoch,
  @_s.JsonValue('MSRC_SEVERITY')
  msrcSeverity,
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('PATCH_ID')
  patchId,
  @_s.JsonValue('SECTION')
  section,
  @_s.JsonValue('PRIORITY')
  priority,
  @_s.JsonValue('REPOSITORY')
  repository,
  @_s.JsonValue('RELEASE')
  release,
  @_s.JsonValue('SEVERITY')
  severity,
  @_s.JsonValue('SECURITY')
  security,
  @_s.JsonValue('VERSION')
  version,
}

/// The mapping between a patch group and the patch baseline the patch group is
/// registered with.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PatchGroupPatchBaselineMapping {
  /// The patch baseline the patch group is registered with.
  @_s.JsonKey(name: 'BaselineIdentity')
  final PatchBaselineIdentity baselineIdentity;

  /// The name of the patch group registered with the patch baseline.
  @_s.JsonKey(name: 'PatchGroup')
  final String patchGroup;

  PatchGroupPatchBaselineMapping({
    this.baselineIdentity,
    this.patchGroup,
  });
  factory PatchGroupPatchBaselineMapping.fromJson(Map<String, dynamic> json) =>
      _$PatchGroupPatchBaselineMappingFromJson(json);
}

enum PatchOperationType {
  @_s.JsonValue('Scan')
  scan,
  @_s.JsonValue('Install')
  install,
}

/// Defines a filter used in Patch Manager APIs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PatchOrchestratorFilter {
  /// The key for the filter.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for the filter.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  PatchOrchestratorFilter({
    this.key,
    this.values,
  });
  Map<String, dynamic> toJson() => _$PatchOrchestratorFilterToJson(this);
}

enum PatchProperty {
  @_s.JsonValue('PRODUCT')
  product,
  @_s.JsonValue('PRODUCT_FAMILY')
  productFamily,
  @_s.JsonValue('CLASSIFICATION')
  classification,
  @_s.JsonValue('MSRC_SEVERITY')
  msrcSeverity,
  @_s.JsonValue('PRIORITY')
  priority,
  @_s.JsonValue('SEVERITY')
  severity,
}

extension on PatchProperty {
  String toValue() {
    switch (this) {
      case PatchProperty.product:
        return 'PRODUCT';
      case PatchProperty.productFamily:
        return 'PRODUCT_FAMILY';
      case PatchProperty.classification:
        return 'CLASSIFICATION';
      case PatchProperty.msrcSeverity:
        return 'MSRC_SEVERITY';
      case PatchProperty.priority:
        return 'PRIORITY';
      case PatchProperty.severity:
        return 'SEVERITY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Defines an approval rule for a patch baseline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PatchRule {
  /// The patch filter group that defines the criteria for the rule.
  @_s.JsonKey(name: 'PatchFilterGroup')
  final PatchFilterGroup patchFilterGroup;

  /// The number of days after the release date of each patch matched by the rule
  /// that the patch is marked as approved in the patch baseline. For example, a
  /// value of <code>7</code> means that patches are approved seven days after
  /// they are released. Not supported on Ubuntu Server.
  @_s.JsonKey(name: 'ApproveAfterDays')
  final int approveAfterDays;

  /// The cutoff date for auto approval of released patches. Any patches released
  /// on or before this date are installed automatically. Not supported on Ubuntu
  /// Server.
  ///
  /// Enter dates in the format <code>YYYY-MM-DD</code>. For example,
  /// <code>2020-12-31</code>.
  @_s.JsonKey(name: 'ApproveUntilDate')
  final String approveUntilDate;

  /// A compliance severity level for all approved patches in a patch baseline.
  @_s.JsonKey(name: 'ComplianceLevel')
  final PatchComplianceLevel complianceLevel;

  /// For instances identified by the approval rule filters, enables a patch
  /// baseline to apply non-security updates available in the specified
  /// repository. The default value is 'false'. Applies to Linux instances only.
  @_s.JsonKey(name: 'EnableNonSecurity')
  final bool enableNonSecurity;

  PatchRule({
    @_s.required this.patchFilterGroup,
    this.approveAfterDays,
    this.approveUntilDate,
    this.complianceLevel,
    this.enableNonSecurity,
  });
  factory PatchRule.fromJson(Map<String, dynamic> json) =>
      _$PatchRuleFromJson(json);

  Map<String, dynamic> toJson() => _$PatchRuleToJson(this);
}

/// A set of rules defining the approval rules for a patch baseline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PatchRuleGroup {
  /// The rules that make up the rule group.
  @_s.JsonKey(name: 'PatchRules')
  final List<PatchRule> patchRules;

  PatchRuleGroup({
    @_s.required this.patchRules,
  });
  factory PatchRuleGroup.fromJson(Map<String, dynamic> json) =>
      _$PatchRuleGroupFromJson(json);

  Map<String, dynamic> toJson() => _$PatchRuleGroupToJson(this);
}

enum PatchSet {
  @_s.JsonValue('OS')
  os,
  @_s.JsonValue('APPLICATION')
  application,
}

extension on PatchSet {
  String toValue() {
    switch (this) {
      case PatchSet.os:
        return 'OS';
      case PatchSet.application:
        return 'APPLICATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the patches to use to update the instances, including
/// target operating systems and source repository. Applies to Linux instances
/// only.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PatchSource {
  /// The value of the yum repo configuration. For example:
  ///
  /// <code>[main]</code>
  ///
  /// <code>cachedir=/var/cache/yum/$basesearch$releasever</code>
  ///
  /// <code>keepcache=0</code>
  ///
  /// <code>debuglevel=2</code>
  @_s.JsonKey(name: 'Configuration')
  final String configuration;

  /// The name specified to identify the patch source.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The specific operating system versions a patch repository applies to, such
  /// as "Ubuntu16.04", "AmazonLinux2016.09", "RedhatEnterpriseLinux7.2" or
  /// "Suse12.7". For lists of supported product values, see <a>PatchFilter</a>.
  @_s.JsonKey(name: 'Products')
  final List<String> products;

  PatchSource({
    @_s.required this.configuration,
    @_s.required this.name,
    @_s.required this.products,
  });
  factory PatchSource.fromJson(Map<String, dynamic> json) =>
      _$PatchSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PatchSourceToJson(this);
}

/// Information about the approval status of a patch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PatchStatus {
  /// The date the patch was approved (or will be approved if the status is
  /// PENDING_APPROVAL).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ApprovalDate')
  final DateTime approvalDate;

  /// The compliance severity level for a patch.
  @_s.JsonKey(name: 'ComplianceLevel')
  final PatchComplianceLevel complianceLevel;

  /// The approval status of a patch (APPROVED, PENDING_APPROVAL,
  /// EXPLICIT_APPROVED, EXPLICIT_REJECTED).
  @_s.JsonKey(name: 'DeploymentStatus')
  final PatchDeploymentStatus deploymentStatus;

  PatchStatus({
    this.approvalDate,
    this.complianceLevel,
    this.deploymentStatus,
  });
  factory PatchStatus.fromJson(Map<String, dynamic> json) =>
      _$PatchStatusFromJson(json);
}

enum PingStatus {
  @_s.JsonValue('Online')
  online,
  @_s.JsonValue('ConnectionLost')
  connectionLost,
  @_s.JsonValue('Inactive')
  inactive,
}

enum PlatformType {
  @_s.JsonValue('Windows')
  windows,
  @_s.JsonValue('Linux')
  linux,
}

/// An aggregate of step execution statuses displayed in the AWS Console for a
/// multi-Region and multi-account Automation execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProgressCounters {
  /// The total number of steps that the system cancelled in all specified AWS
  /// Regions and accounts for the current Automation execution.
  @_s.JsonKey(name: 'CancelledSteps')
  final int cancelledSteps;

  /// The total number of steps that failed to run in all specified AWS Regions
  /// and accounts for the current Automation execution.
  @_s.JsonKey(name: 'FailedSteps')
  final int failedSteps;

  /// The total number of steps that successfully completed in all specified AWS
  /// Regions and accounts for the current Automation execution.
  @_s.JsonKey(name: 'SuccessSteps')
  final int successSteps;

  /// The total number of steps that timed out in all specified AWS Regions and
  /// accounts for the current Automation execution.
  @_s.JsonKey(name: 'TimedOutSteps')
  final int timedOutSteps;

  /// The total number of steps run in all specified AWS Regions and accounts for
  /// the current Automation execution.
  @_s.JsonKey(name: 'TotalSteps')
  final int totalSteps;

  ProgressCounters({
    this.cancelledSteps,
    this.failedSteps,
    this.successSteps,
    this.timedOutSteps,
    this.totalSteps,
  });
  factory ProgressCounters.fromJson(Map<String, dynamic> json) =>
      _$ProgressCountersFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutComplianceItemsResult {
  PutComplianceItemsResult();
  factory PutComplianceItemsResult.fromJson(Map<String, dynamic> json) =>
      _$PutComplianceItemsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutInventoryResult {
  /// Information about the request.
  @_s.JsonKey(name: 'Message')
  final String message;

  PutInventoryResult({
    this.message,
  });
  factory PutInventoryResult.fromJson(Map<String, dynamic> json) =>
      _$PutInventoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutParameterResult {
  /// The tier assigned to the parameter.
  @_s.JsonKey(name: 'Tier')
  final ParameterTier tier;

  /// The new version number of a parameter. If you edit a parameter value,
  /// Parameter Store automatically creates a new version and assigns this new
  /// version a unique ID. You can reference a parameter version ID in API actions
  /// or in Systems Manager documents (SSM documents). By default, if you don't
  /// specify a specific version, the system returns the latest parameter value
  /// when a parameter is called.
  @_s.JsonKey(name: 'Version')
  final int version;

  PutParameterResult({
    this.tier,
    this.version,
  });
  factory PutParameterResult.fromJson(Map<String, dynamic> json) =>
      _$PutParameterResultFromJson(json);
}

enum RebootOption {
  @_s.JsonValue('RebootIfNeeded')
  rebootIfNeeded,
  @_s.JsonValue('NoReboot')
  noReboot,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterDefaultPatchBaselineResult {
  /// The ID of the default patch baseline.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  RegisterDefaultPatchBaselineResult({
    this.baselineId,
  });
  factory RegisterDefaultPatchBaselineResult.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterDefaultPatchBaselineResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterPatchBaselineForPatchGroupResult {
  /// The ID of the patch baseline the patch group was registered with.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The name of the patch group registered with the patch baseline.
  @_s.JsonKey(name: 'PatchGroup')
  final String patchGroup;

  RegisterPatchBaselineForPatchGroupResult({
    this.baselineId,
    this.patchGroup,
  });
  factory RegisterPatchBaselineForPatchGroupResult.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterPatchBaselineForPatchGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterTargetWithMaintenanceWindowResult {
  /// The ID of the target definition in this maintenance window.
  @_s.JsonKey(name: 'WindowTargetId')
  final String windowTargetId;

  RegisterTargetWithMaintenanceWindowResult({
    this.windowTargetId,
  });
  factory RegisterTargetWithMaintenanceWindowResult.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterTargetWithMaintenanceWindowResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterTaskWithMaintenanceWindowResult {
  /// The ID of the task in the maintenance window.
  @_s.JsonKey(name: 'WindowTaskId')
  final String windowTaskId;

  RegisterTaskWithMaintenanceWindowResult({
    this.windowTaskId,
  });
  factory RegisterTaskWithMaintenanceWindowResult.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterTaskWithMaintenanceWindowResultFromJson(json);
}

/// An OpsItems that shares something in common with the current OpsItem. For
/// example, related OpsItems can include OpsItems with similar error messages,
/// impacted resources, or statuses for the impacted resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RelatedOpsItem {
  /// The ID of an OpsItem related to the current OpsItem.
  @_s.JsonKey(name: 'OpsItemId')
  final String opsItemId;

  RelatedOpsItem({
    @_s.required this.opsItemId,
  });
  factory RelatedOpsItem.fromJson(Map<String, dynamic> json) =>
      _$RelatedOpsItemFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedOpsItemToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTagsFromResourceResult {
  RemoveTagsFromResourceResult();
  factory RemoveTagsFromResourceResult.fromJson(Map<String, dynamic> json) =>
      _$RemoveTagsFromResourceResultFromJson(json);
}

/// The result body of the ResetServiceSetting API action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetServiceSettingResult {
  /// The current, effective service setting after calling the ResetServiceSetting
  /// API action.
  @_s.JsonKey(name: 'ServiceSetting')
  final ServiceSetting serviceSetting;

  ResetServiceSettingResult({
    this.serviceSetting,
  });
  factory ResetServiceSettingResult.fromJson(Map<String, dynamic> json) =>
      _$ResetServiceSettingResultFromJson(json);
}

/// Information about targets that resolved during the Automation execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolvedTargets {
  /// A list of parameter values sent to targets that resolved during the
  /// Automation execution.
  @_s.JsonKey(name: 'ParameterValues')
  final List<String> parameterValues;

  /// A boolean value indicating whether the resolved target list is truncated.
  @_s.JsonKey(name: 'Truncated')
  final bool truncated;

  ResolvedTargets({
    this.parameterValues,
    this.truncated,
  });
  factory ResolvedTargets.fromJson(Map<String, dynamic> json) =>
      _$ResolvedTargetsFromJson(json);
}

/// Compliance summary information for a specific resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceComplianceSummaryItem {
  /// The compliance type.
  @_s.JsonKey(name: 'ComplianceType')
  final String complianceType;

  /// A list of items that are compliant for the resource.
  @_s.JsonKey(name: 'CompliantSummary')
  final CompliantSummary compliantSummary;

  /// Information about the execution.
  @_s.JsonKey(name: 'ExecutionSummary')
  final ComplianceExecutionSummary executionSummary;

  /// A list of items that aren't compliant for the resource.
  @_s.JsonKey(name: 'NonCompliantSummary')
  final NonCompliantSummary nonCompliantSummary;

  /// The highest severity item found for the resource. The resource is compliant
  /// for this item.
  @_s.JsonKey(name: 'OverallSeverity')
  final ComplianceSeverity overallSeverity;

  /// The resource ID.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The resource type.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The compliance status for the resource.
  @_s.JsonKey(name: 'Status')
  final ComplianceStatus status;

  ResourceComplianceSummaryItem({
    this.complianceType,
    this.compliantSummary,
    this.executionSummary,
    this.nonCompliantSummary,
    this.overallSeverity,
    this.resourceId,
    this.resourceType,
    this.status,
  });
  factory ResourceComplianceSummaryItem.fromJson(Map<String, dynamic> json) =>
      _$ResourceComplianceSummaryItemFromJson(json);
}

/// Information about the AwsOrganizationsSource resource data sync source. A
/// sync source of this type can synchronize data from AWS Organizations or, if
/// an AWS Organization is not present, from multiple AWS Regions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDataSyncAwsOrganizationsSource {
  /// If an AWS Organization is present, this is either
  /// <code>OrganizationalUnits</code> or <code>EntireOrganization</code>. For
  /// <code>OrganizationalUnits</code>, the data is aggregated from a set of
  /// organization units. For <code>EntireOrganization</code>, the data is
  /// aggregated from the entire AWS Organization.
  @_s.JsonKey(name: 'OrganizationSourceType')
  final String organizationSourceType;

  /// The AWS Organizations organization units included in the sync.
  @_s.JsonKey(name: 'OrganizationalUnits')
  final List<ResourceDataSyncOrganizationalUnit> organizationalUnits;

  ResourceDataSyncAwsOrganizationsSource({
    @_s.required this.organizationSourceType,
    this.organizationalUnits,
  });
  factory ResourceDataSyncAwsOrganizationsSource.fromJson(
          Map<String, dynamic> json) =>
      _$ResourceDataSyncAwsOrganizationsSourceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResourceDataSyncAwsOrganizationsSourceToJson(this);
}

/// Synchronize Systems Manager Inventory data from multiple AWS accounts
/// defined in AWS Organizations to a centralized S3 bucket. Data is
/// synchronized to individual key prefixes in the central bucket. Each key
/// prefix represents a different AWS account ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDataSyncDestinationDataSharing {
  /// The sharing data type. Only <code>Organization</code> is supported.
  @_s.JsonKey(name: 'DestinationDataSharingType')
  final String destinationDataSharingType;

  ResourceDataSyncDestinationDataSharing({
    this.destinationDataSharingType,
  });
  factory ResourceDataSyncDestinationDataSharing.fromJson(
          Map<String, dynamic> json) =>
      _$ResourceDataSyncDestinationDataSharingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResourceDataSyncDestinationDataSharingToJson(this);
}

/// Information about a Resource Data Sync configuration, including its current
/// status and last successful sync.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceDataSyncItem {
  /// The status reported by the last sync.
  @_s.JsonKey(name: 'LastStatus')
  final LastResourceDataSyncStatus lastStatus;

  /// The last time the sync operations returned a status of
  /// <code>SUCCESSFUL</code> (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastSuccessfulSyncTime')
  final DateTime lastSuccessfulSyncTime;

  /// The status message details reported by the last sync.
  @_s.JsonKey(name: 'LastSyncStatusMessage')
  final String lastSyncStatusMessage;

  /// The last time the configuration attempted to sync (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastSyncTime')
  final DateTime lastSyncTime;

  /// Configuration information for the target S3 bucket.
  @_s.JsonKey(name: 'S3Destination')
  final ResourceDataSyncS3Destination s3Destination;

  /// The date and time the configuration was created (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SyncCreatedTime')
  final DateTime syncCreatedTime;

  /// The date and time the resource data sync was changed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SyncLastModifiedTime')
  final DateTime syncLastModifiedTime;

  /// The name of the Resource Data Sync.
  @_s.JsonKey(name: 'SyncName')
  final String syncName;

  /// Information about the source where the data was synchronized.
  @_s.JsonKey(name: 'SyncSource')
  final ResourceDataSyncSourceWithState syncSource;

  /// The type of resource data sync. If <code>SyncType</code> is
  /// <code>SyncToDestination</code>, then the resource data sync synchronizes
  /// data to an S3 bucket. If the <code>SyncType</code> is
  /// <code>SyncFromSource</code> then the resource data sync synchronizes data
  /// from AWS Organizations or from multiple AWS Regions.
  @_s.JsonKey(name: 'SyncType')
  final String syncType;

  ResourceDataSyncItem({
    this.lastStatus,
    this.lastSuccessfulSyncTime,
    this.lastSyncStatusMessage,
    this.lastSyncTime,
    this.s3Destination,
    this.syncCreatedTime,
    this.syncLastModifiedTime,
    this.syncName,
    this.syncSource,
    this.syncType,
  });
  factory ResourceDataSyncItem.fromJson(Map<String, dynamic> json) =>
      _$ResourceDataSyncItemFromJson(json);
}

/// The AWS Organizations organizational unit data source for the sync.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDataSyncOrganizationalUnit {
  /// The AWS Organization unit ID data source for the sync.
  @_s.JsonKey(name: 'OrganizationalUnitId')
  final String organizationalUnitId;

  ResourceDataSyncOrganizationalUnit({
    this.organizationalUnitId,
  });
  factory ResourceDataSyncOrganizationalUnit.fromJson(
          Map<String, dynamic> json) =>
      _$ResourceDataSyncOrganizationalUnitFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResourceDataSyncOrganizationalUnitToJson(this);
}

/// Information about the target S3 bucket for the Resource Data Sync.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDataSyncS3Destination {
  /// The name of the S3 bucket where the aggregated data is stored.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// The AWS Region with the S3 bucket targeted by the Resource Data Sync.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// A supported sync format. The following format is currently supported:
  /// JsonSerDe
  @_s.JsonKey(name: 'SyncFormat')
  final ResourceDataSyncS3Format syncFormat;

  /// The ARN of an encryption key for a destination in Amazon S3. Must belong to
  /// the same Region as the destination S3 bucket.
  @_s.JsonKey(name: 'AWSKMSKeyARN')
  final String awsKMSKeyARN;

  /// Enables destination data sharing. By default, this field is
  /// <code>null</code>.
  @_s.JsonKey(name: 'DestinationDataSharing')
  final ResourceDataSyncDestinationDataSharing destinationDataSharing;

  /// An Amazon S3 prefix for the bucket.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  ResourceDataSyncS3Destination({
    @_s.required this.bucketName,
    @_s.required this.region,
    @_s.required this.syncFormat,
    this.awsKMSKeyARN,
    this.destinationDataSharing,
    this.prefix,
  });
  factory ResourceDataSyncS3Destination.fromJson(Map<String, dynamic> json) =>
      _$ResourceDataSyncS3DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDataSyncS3DestinationToJson(this);
}

enum ResourceDataSyncS3Format {
  @_s.JsonValue('JsonSerDe')
  jsonSerDe,
}

/// Information about the source of the data included in the resource data sync.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResourceDataSyncSource {
  /// The <code>SyncSource</code> AWS Regions included in the resource data sync.
  @_s.JsonKey(name: 'SourceRegions')
  final List<String> sourceRegions;

  /// The type of data source for the resource data sync. <code>SourceType</code>
  /// is either <code>AwsOrganizations</code> (if an organization is present in
  /// AWS Organizations) or <code>singleAccountMultiRegions</code>.
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  /// Information about the AwsOrganizationsSource resource data sync source. A
  /// sync source of this type can synchronize data from AWS Organizations.
  @_s.JsonKey(name: 'AwsOrganizationsSource')
  final ResourceDataSyncAwsOrganizationsSource awsOrganizationsSource;

  /// Whether to automatically synchronize and aggregate data from new AWS Regions
  /// when those Regions come online.
  @_s.JsonKey(name: 'IncludeFutureRegions')
  final bool includeFutureRegions;

  ResourceDataSyncSource({
    @_s.required this.sourceRegions,
    @_s.required this.sourceType,
    this.awsOrganizationsSource,
    this.includeFutureRegions,
  });
  Map<String, dynamic> toJson() => _$ResourceDataSyncSourceToJson(this);
}

/// The data type name for including resource data sync state. There are four
/// sync states:
///
/// <code>OrganizationNotExists</code> (Your organization doesn't exist)
///
/// <code>NoPermissions</code> (The system can't locate the service-linked role.
/// This role is automatically created when a user creates a resource data sync
/// in Explorer.)
///
/// <code>InvalidOrganizationalUnit</code> (You specified or selected an invalid
/// unit in the resource data sync configuration.)
///
/// <code>TrustedAccessDisabled</code> (You disabled Systems Manager access in
/// the organization in AWS Organizations.)
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceDataSyncSourceWithState {
  /// The field name in <code>SyncSource</code> for the
  /// <code>ResourceDataSyncAwsOrganizationsSource</code> type.
  @_s.JsonKey(name: 'AwsOrganizationsSource')
  final ResourceDataSyncAwsOrganizationsSource awsOrganizationsSource;

  /// Whether to automatically synchronize and aggregate data from new AWS Regions
  /// when those Regions come online.
  @_s.JsonKey(name: 'IncludeFutureRegions')
  final bool includeFutureRegions;

  /// The <code>SyncSource</code> AWS Regions included in the resource data sync.
  @_s.JsonKey(name: 'SourceRegions')
  final List<String> sourceRegions;

  /// The type of data source for the resource data sync. <code>SourceType</code>
  /// is either <code>AwsOrganizations</code> (if an organization is present in
  /// AWS Organizations) or <code>singleAccountMultiRegions</code>.
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  /// The data type name for including resource data sync state. There are four
  /// sync states:
  ///
  /// <code>OrganizationNotExists</code>: Your organization doesn't exist.
  ///
  /// <code>NoPermissions</code>: The system can't locate the service-linked role.
  /// This role is automatically created when a user creates a resource data sync
  /// in Explorer.
  ///
  /// <code>InvalidOrganizationalUnit</code>: You specified or selected an invalid
  /// unit in the resource data sync configuration.
  ///
  /// <code>TrustedAccessDisabled</code>: You disabled Systems Manager access in
  /// the organization in AWS Organizations.
  @_s.JsonKey(name: 'State')
  final String state;

  ResourceDataSyncSourceWithState({
    this.awsOrganizationsSource,
    this.includeFutureRegions,
    this.sourceRegions,
    this.sourceType,
    this.state,
  });
  factory ResourceDataSyncSourceWithState.fromJson(Map<String, dynamic> json) =>
      _$ResourceDataSyncSourceWithStateFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('ManagedInstance')
  managedInstance,
  @_s.JsonValue('Document')
  document,
  @_s.JsonValue('EC2Instance')
  eC2Instance,
}

enum ResourceTypeForTagging {
  @_s.JsonValue('Document')
  document,
  @_s.JsonValue('ManagedInstance')
  managedInstance,
  @_s.JsonValue('MaintenanceWindow')
  maintenanceWindow,
  @_s.JsonValue('Parameter')
  parameter,
  @_s.JsonValue('PatchBaseline')
  patchBaseline,
  @_s.JsonValue('OpsItem')
  opsItem,
}

extension on ResourceTypeForTagging {
  String toValue() {
    switch (this) {
      case ResourceTypeForTagging.document:
        return 'Document';
      case ResourceTypeForTagging.managedInstance:
        return 'ManagedInstance';
      case ResourceTypeForTagging.maintenanceWindow:
        return 'MaintenanceWindow';
      case ResourceTypeForTagging.parameter:
        return 'Parameter';
      case ResourceTypeForTagging.patchBaseline:
        return 'PatchBaseline';
      case ResourceTypeForTagging.opsItem:
        return 'OpsItem';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The inventory item result attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResultAttribute {
  /// Name of the inventory item type. Valid value: AWS:InstanceInformation.
  /// Default Value: AWS:InstanceInformation.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  ResultAttribute({
    @_s.required this.typeName,
  });
  Map<String, dynamic> toJson() => _$ResultAttributeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResumeSessionResponse {
  /// The ID of the session.
  @_s.JsonKey(name: 'SessionId')
  final String sessionId;

  /// A URL back to SSM Agent on the instance that the Session Manager client uses
  /// to send commands and receive output from the instance. Format:
  /// <code>wss://ssmmessages.<b>region</b>.amazonaws.com/v1/data-channel/<b>session-id</b>?stream=(input|output)</code>.
  ///
  /// <b>region</b> represents the Region identifier for an AWS Region supported
  /// by AWS Systems Manager, such as <code>us-east-2</code> for the US East
  /// (Ohio) Region. For a list of supported <b>region</b> values, see the
  /// <b>Region</b> column in <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region">Systems
  /// Manager service endpoints</a> in the <i>AWS General Reference</i>.
  ///
  /// <b>session-id</b> represents the ID of a Session Manager session, such as
  /// <code>1a2b3c4dEXAMPLE</code>.
  @_s.JsonKey(name: 'StreamUrl')
  final String streamUrl;

  /// An encrypted token value containing session and caller information. Used to
  /// authenticate the connection to the instance.
  @_s.JsonKey(name: 'TokenValue')
  final String tokenValue;

  ResumeSessionResponse({
    this.sessionId,
    this.streamUrl,
    this.tokenValue,
  });
  factory ResumeSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$ResumeSessionResponseFromJson(json);
}

/// Information about the result of a document review request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReviewInformation {
  /// The time that the reviewer took action on the document review request.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReviewedTime')
  final DateTime reviewedTime;

  /// The reviewer assigned to take action on the document review request.
  @_s.JsonKey(name: 'Reviewer')
  final String reviewer;

  /// The current status of the document review request.
  @_s.JsonKey(name: 'Status')
  final ReviewStatus status;

  ReviewInformation({
    this.reviewedTime,
    this.reviewer,
    this.status,
  });
  factory ReviewInformation.fromJson(Map<String, dynamic> json) =>
      _$ReviewInformationFromJson(json);
}

enum ReviewStatus {
  @_s.JsonValue('APPROVED')
  approved,
  @_s.JsonValue('NOT_REVIEWED')
  notReviewed,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('REJECTED')
  rejected,
}

/// Information about an Automation runbook (Automation document) used in a
/// runbook workflow in Change Manager.
/// <note>
/// The Automation runbooks specified for the runbook workflow can't run until
/// all required approvals for the change request have been received.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Runbook {
  /// The name of the Automation runbook (Automation document) used in a runbook
  /// workflow.
  @_s.JsonKey(name: 'DocumentName')
  final String documentName;

  /// The version of the Automation runbook (Automation document) used in a
  /// runbook workflow.
  @_s.JsonKey(name: 'DocumentVersion')
  final String documentVersion;

  /// The <code>MaxConcurrency</code> value specified by the user when the
  /// operation started, indicating the maximum number of resources that the
  /// runbook operation can run on at the same time.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The <code>MaxErrors</code> value specified by the user when the execution
  /// started, indicating the maximum number of errors that can occur during the
  /// operation before the updates are stopped or rolled back.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The key-value map of execution parameters, which were supplied when calling
  /// <code>StartChangeRequestExecution</code>.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, List<String>> parameters;

  /// Information about the AWS Regions and accounts targeted by the current
  /// Runbook operation.
  @_s.JsonKey(name: 'TargetLocations')
  final List<TargetLocation> targetLocations;

  /// The name of the parameter used as the target resource for the
  /// rate-controlled runbook workflow. Required if you specify
  /// <code>Targets</code>.
  @_s.JsonKey(name: 'TargetParameterName')
  final String targetParameterName;

  /// A key-value mapping to target resources that the Runbook operation performs
  /// tasks on. Required if you specify <code>TargetParameterName</code>.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  Runbook({
    @_s.required this.documentName,
    this.documentVersion,
    this.maxConcurrency,
    this.maxErrors,
    this.parameters,
    this.targetLocations,
    this.targetParameterName,
    this.targets,
  });
  factory Runbook.fromJson(Map<String, dynamic> json) =>
      _$RunbookFromJson(json);

  Map<String, dynamic> toJson() => _$RunbookToJson(this);
}

/// An S3 bucket where you want to store the results of this request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3OutputLocation {
  /// The name of the S3 bucket.
  @_s.JsonKey(name: 'OutputS3BucketName')
  final String outputS3BucketName;

  /// The S3 bucket subfolder.
  @_s.JsonKey(name: 'OutputS3KeyPrefix')
  final String outputS3KeyPrefix;

  /// (Deprecated) You can no longer specify this parameter. The system ignores
  /// it. Instead, Systems Manager automatically determines the Region of the S3
  /// bucket.
  @_s.JsonKey(name: 'OutputS3Region')
  final String outputS3Region;

  S3OutputLocation({
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
    this.outputS3Region,
  });
  factory S3OutputLocation.fromJson(Map<String, dynamic> json) =>
      _$S3OutputLocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3OutputLocationToJson(this);
}

/// A URL for the S3 bucket where you want to store the results of this request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3OutputUrl {
  /// A URL for an S3 bucket where you want to store the results of this request.
  @_s.JsonKey(name: 'OutputUrl')
  final String outputUrl;

  S3OutputUrl({
    this.outputUrl,
  });
  factory S3OutputUrl.fromJson(Map<String, dynamic> json) =>
      _$S3OutputUrlFromJson(json);
}

/// Information about a scheduled execution for a maintenance window.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScheduledWindowExecution {
  /// The time, in ISO-8601 Extended format, that the maintenance window is
  /// scheduled to be run.
  @_s.JsonKey(name: 'ExecutionTime')
  final String executionTime;

  /// The name of the maintenance window to be run.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the maintenance window to be run.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  ScheduledWindowExecution({
    this.executionTime,
    this.name,
    this.windowId,
  });
  factory ScheduledWindowExecution.fromJson(Map<String, dynamic> json) =>
      _$ScheduledWindowExecutionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendAutomationSignalResult {
  SendAutomationSignalResult();
  factory SendAutomationSignalResult.fromJson(Map<String, dynamic> json) =>
      _$SendAutomationSignalResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendCommandResult {
  /// The request as it was received by Systems Manager. Also provides the command
  /// ID which can be used future references to this request.
  @_s.JsonKey(name: 'Command')
  final Command command;

  SendCommandResult({
    this.command,
  });
  factory SendCommandResult.fromJson(Map<String, dynamic> json) =>
      _$SendCommandResultFromJson(json);
}

/// The service setting data structure.
///
/// <code>ServiceSetting</code> is an account-level setting for an AWS service.
/// This setting defines how a user interacts with or uses a service or a
/// feature of a service. For example, if an AWS service charges money to the
/// account based on feature or service usage, then the AWS service team might
/// create a default setting of "false". This means the user can't use this
/// feature unless they change the setting to "true" and intentionally opt in
/// for a paid feature.
///
/// Services map a <code>SettingId</code> object to a setting value. AWS
/// services teams define the default value for a <code>SettingId</code>. You
/// can't create a new <code>SettingId</code>, but you can overwrite the default
/// value if you have the <code>ssm:UpdateServiceSetting</code> permission for
/// the setting. Use the <a>UpdateServiceSetting</a> API action to change the
/// default setting. Or, use the <a>ResetServiceSetting</a> to change the value
/// back to the original value defined by the AWS service team.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceSetting {
  /// The ARN of the service setting.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The last time the service setting was modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The ARN of the last modified user. This field is populated only if the
  /// setting value was overwritten.
  @_s.JsonKey(name: 'LastModifiedUser')
  final String lastModifiedUser;

  /// The ID of the service setting.
  @_s.JsonKey(name: 'SettingId')
  final String settingId;

  /// The value of the service setting.
  @_s.JsonKey(name: 'SettingValue')
  final String settingValue;

  /// The status of the service setting. The value can be Default, Customized or
  /// PendingUpdate.
  ///
  /// <ul>
  /// <li>
  /// Default: The current setting uses a default value provisioned by the AWS
  /// service team.
  /// </li>
  /// <li>
  /// Customized: The current setting use a custom value specified by the
  /// customer.
  /// </li>
  /// <li>
  /// PendingUpdate: The current setting uses a default or custom value, but a
  /// setting change request is pending approval.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  ServiceSetting({
    this.arn,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.settingId,
    this.settingValue,
    this.status,
  });
  factory ServiceSetting.fromJson(Map<String, dynamic> json) =>
      _$ServiceSettingFromJson(json);
}

/// Information about a Session Manager connection to an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Session {
  /// Reserved for future use.
  @_s.JsonKey(name: 'Details')
  final String details;

  /// The name of the Session Manager SSM document used to define the parameters
  /// and plugin settings for the session. For example,
  /// <code>SSM-SessionManagerRunShell</code>.
  @_s.JsonKey(name: 'DocumentName')
  final String documentName;

  /// The date and time, in ISO-8601 Extended format, when the session was
  /// terminated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDate')
  final DateTime endDate;

  /// Reserved for future use.
  @_s.JsonKey(name: 'OutputUrl')
  final SessionManagerOutputUrl outputUrl;

  /// The ID of the AWS user account that started the session.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The ID of the session.
  @_s.JsonKey(name: 'SessionId')
  final String sessionId;

  /// The date and time, in ISO-8601 Extended format, when the session began.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDate')
  final DateTime startDate;

  /// The status of the session. For example, "Connected" or "Terminated".
  @_s.JsonKey(name: 'Status')
  final SessionStatus status;

  /// The instance that the Session Manager session connected to.
  @_s.JsonKey(name: 'Target')
  final String target;

  Session({
    this.details,
    this.documentName,
    this.endDate,
    this.outputUrl,
    this.owner,
    this.sessionId,
    this.startDate,
    this.status,
    this.target,
  });
  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

/// Describes a filter for Session Manager information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SessionFilter {
  /// The name of the filter.
  @_s.JsonKey(name: 'key')
  final SessionFilterKey key;

  /// The filter value. Valid values for each filter key are as follows:
  ///
  /// <ul>
  /// <li>
  /// InvokedAfter: Specify a timestamp to limit your results. For example,
  /// specify 2018-08-29T00:00:00Z to see sessions that started August 29, 2018,
  /// and later.
  /// </li>
  /// <li>
  /// InvokedBefore: Specify a timestamp to limit your results. For example,
  /// specify 2018-08-29T00:00:00Z to see sessions that started before August 29,
  /// 2018.
  /// </li>
  /// <li>
  /// Target: Specify an instance to which session connections have been made.
  /// </li>
  /// <li>
  /// Owner: Specify an AWS user account to see a list of sessions started by that
  /// user.
  /// </li>
  /// <li>
  /// Status: Specify a valid session status to see a list of all sessions with
  /// that status. Status values you can specify include:
  ///
  /// <ul>
  /// <li>
  /// Connected
  /// </li>
  /// <li>
  /// Connecting
  /// </li>
  /// <li>
  /// Disconnected
  /// </li>
  /// <li>
  /// Terminated
  /// </li>
  /// <li>
  /// Terminating
  /// </li>
  /// <li>
  /// Failed
  /// </li>
  /// </ul> </li>
  /// <li>
  /// SessionId: Specify a session ID to return details about the session.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'value')
  final String value;

  SessionFilter({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$SessionFilterToJson(this);
}

enum SessionFilterKey {
  @_s.JsonValue('InvokedAfter')
  invokedAfter,
  @_s.JsonValue('InvokedBefore')
  invokedBefore,
  @_s.JsonValue('Target')
  target,
  @_s.JsonValue('Owner')
  owner,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('SessionId')
  sessionId,
}

/// Reserved for future use.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SessionManagerOutputUrl {
  /// Reserved for future use.
  @_s.JsonKey(name: 'CloudWatchOutputUrl')
  final String cloudWatchOutputUrl;

  /// Reserved for future use.
  @_s.JsonKey(name: 'S3OutputUrl')
  final String s3OutputUrl;

  SessionManagerOutputUrl({
    this.cloudWatchOutputUrl,
    this.s3OutputUrl,
  });
  factory SessionManagerOutputUrl.fromJson(Map<String, dynamic> json) =>
      _$SessionManagerOutputUrlFromJson(json);
}

enum SessionState {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('History')
  history,
}

extension on SessionState {
  String toValue() {
    switch (this) {
      case SessionState.active:
        return 'Active';
      case SessionState.history:
        return 'History';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SessionStatus {
  @_s.JsonValue('Connected')
  connected,
  @_s.JsonValue('Connecting')
  connecting,
  @_s.JsonValue('Disconnected')
  disconnected,
  @_s.JsonValue('Terminated')
  terminated,
  @_s.JsonValue('Terminating')
  terminating,
  @_s.JsonValue('Failed')
  failed,
}

/// The number of managed instances found for each patch severity level defined
/// in the request filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SeveritySummary {
  /// The total number of resources or compliance items that have a severity level
  /// of critical. Critical severity is determined by the organization that
  /// published the compliance items.
  @_s.JsonKey(name: 'CriticalCount')
  final int criticalCount;

  /// The total number of resources or compliance items that have a severity level
  /// of high. High severity is determined by the organization that published the
  /// compliance items.
  @_s.JsonKey(name: 'HighCount')
  final int highCount;

  /// The total number of resources or compliance items that have a severity level
  /// of informational. Informational severity is determined by the organization
  /// that published the compliance items.
  @_s.JsonKey(name: 'InformationalCount')
  final int informationalCount;

  /// The total number of resources or compliance items that have a severity level
  /// of low. Low severity is determined by the organization that published the
  /// compliance items.
  @_s.JsonKey(name: 'LowCount')
  final int lowCount;

  /// The total number of resources or compliance items that have a severity level
  /// of medium. Medium severity is determined by the organization that published
  /// the compliance items.
  @_s.JsonKey(name: 'MediumCount')
  final int mediumCount;

  /// The total number of resources or compliance items that have a severity level
  /// of unspecified. Unspecified severity is determined by the organization that
  /// published the compliance items.
  @_s.JsonKey(name: 'UnspecifiedCount')
  final int unspecifiedCount;

  SeveritySummary({
    this.criticalCount,
    this.highCount,
    this.informationalCount,
    this.lowCount,
    this.mediumCount,
    this.unspecifiedCount,
  });
  factory SeveritySummary.fromJson(Map<String, dynamic> json) =>
      _$SeveritySummaryFromJson(json);
}

enum SignalType {
  @_s.JsonValue('Approve')
  approve,
  @_s.JsonValue('Reject')
  reject,
  @_s.JsonValue('StartStep')
  startStep,
  @_s.JsonValue('StopStep')
  stopStep,
  @_s.JsonValue('Resume')
  resume,
}

extension on SignalType {
  String toValue() {
    switch (this) {
      case SignalType.approve:
        return 'Approve';
      case SignalType.reject:
        return 'Reject';
      case SignalType.startStep:
        return 'StartStep';
      case SignalType.stopStep:
        return 'StopStep';
      case SignalType.resume:
        return 'Resume';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartAssociationsOnceResult {
  StartAssociationsOnceResult();
  factory StartAssociationsOnceResult.fromJson(Map<String, dynamic> json) =>
      _$StartAssociationsOnceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartAutomationExecutionResult {
  /// The unique ID of a newly scheduled automation execution.
  @_s.JsonKey(name: 'AutomationExecutionId')
  final String automationExecutionId;

  StartAutomationExecutionResult({
    this.automationExecutionId,
  });
  factory StartAutomationExecutionResult.fromJson(Map<String, dynamic> json) =>
      _$StartAutomationExecutionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartChangeRequestExecutionResult {
  /// The unique ID of a runbook workflow operation. (A runbook workflow is a type
  /// of Automation operation.)
  @_s.JsonKey(name: 'AutomationExecutionId')
  final String automationExecutionId;

  StartChangeRequestExecutionResult({
    this.automationExecutionId,
  });
  factory StartChangeRequestExecutionResult.fromJson(
          Map<String, dynamic> json) =>
      _$StartChangeRequestExecutionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSessionResponse {
  /// The ID of the session.
  @_s.JsonKey(name: 'SessionId')
  final String sessionId;

  /// A URL back to SSM Agent on the instance that the Session Manager client uses
  /// to send commands and receive output from the instance. Format:
  /// <code>wss://ssmmessages.<b>region</b>.amazonaws.com/v1/data-channel/<b>session-id</b>?stream=(input|output)</code>
  ///
  /// <b>region</b> represents the Region identifier for an AWS Region supported
  /// by AWS Systems Manager, such as <code>us-east-2</code> for the US East
  /// (Ohio) Region. For a list of supported <b>region</b> values, see the
  /// <b>Region</b> column in <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region">Systems
  /// Manager service endpoints</a> in the <i>AWS General Reference</i>.
  ///
  /// <b>session-id</b> represents the ID of a Session Manager session, such as
  /// <code>1a2b3c4dEXAMPLE</code>.
  @_s.JsonKey(name: 'StreamUrl')
  final String streamUrl;

  /// An encrypted token value containing session and caller information. Used to
  /// authenticate the connection to the instance.
  @_s.JsonKey(name: 'TokenValue')
  final String tokenValue;

  StartSessionResponse({
    this.sessionId,
    this.streamUrl,
    this.tokenValue,
  });
  factory StartSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSessionResponseFromJson(json);
}

/// Detailed information about an the execution state of an Automation step.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StepExecution {
  /// The action this step performs. The action determines the behavior of the
  /// step.
  @_s.JsonKey(name: 'Action')
  final String action;

  /// If a step has finished execution, this contains the time the execution
  /// ended. If the step has not yet concluded, this field is not populated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionEndTime')
  final DateTime executionEndTime;

  /// If a step has begun execution, this contains the time the step started. If
  /// the step is in Pending status, this field is not populated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExecutionStartTime')
  final DateTime executionStartTime;

  /// Information about the Automation failure.
  @_s.JsonKey(name: 'FailureDetails')
  final FailureDetails failureDetails;

  /// If a step failed, this message explains why the execution failed.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  /// Fully-resolved values passed into the step before execution.
  @_s.JsonKey(name: 'Inputs')
  final Map<String, String> inputs;

  /// The flag which can be used to help decide whether the failure of current
  /// step leads to the Automation failure.
  @_s.JsonKey(name: 'IsCritical')
  final bool isCritical;

  /// The flag which can be used to end automation no matter whether the step
  /// succeeds or fails.
  @_s.JsonKey(name: 'IsEnd')
  final bool isEnd;

  /// The maximum number of tries to run the action of the step. The default value
  /// is 1.
  @_s.JsonKey(name: 'MaxAttempts')
  final int maxAttempts;

  /// The next step after the step succeeds.
  @_s.JsonKey(name: 'NextStep')
  final String nextStep;

  /// The action to take if the step fails. The default value is Abort.
  @_s.JsonKey(name: 'OnFailure')
  final String onFailure;

  /// Returned values from the execution of the step.
  @_s.JsonKey(name: 'Outputs')
  final Map<String, List<String>> outputs;

  /// A user-specified list of parameters to override when running a step.
  @_s.JsonKey(name: 'OverriddenParameters')
  final Map<String, List<String>> overriddenParameters;

  /// A message associated with the response code for an execution.
  @_s.JsonKey(name: 'Response')
  final String response;

  /// The response code returned by the execution of the step.
  @_s.JsonKey(name: 'ResponseCode')
  final String responseCode;

  /// The unique ID of a step execution.
  @_s.JsonKey(name: 'StepExecutionId')
  final String stepExecutionId;

  /// The name of this execution step.
  @_s.JsonKey(name: 'StepName')
  final String stepName;

  /// The execution status for this step.
  @_s.JsonKey(name: 'StepStatus')
  final AutomationExecutionStatus stepStatus;

  /// The combination of AWS Regions and accounts targeted by the current
  /// Automation execution.
  @_s.JsonKey(name: 'TargetLocation')
  final TargetLocation targetLocation;

  /// The targets for the step execution.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  /// The timeout seconds of the step.
  @_s.JsonKey(name: 'TimeoutSeconds')
  final int timeoutSeconds;

  /// Strategies used when step fails, we support Continue and Abort. Abort will
  /// fail the automation when the step fails. Continue will ignore the failure of
  /// current step and allow automation to run the next step. With conditional
  /// branching, we add step:stepName to support the automation to go to another
  /// specific step.
  @_s.JsonKey(name: 'ValidNextSteps')
  final List<String> validNextSteps;

  StepExecution({
    this.action,
    this.executionEndTime,
    this.executionStartTime,
    this.failureDetails,
    this.failureMessage,
    this.inputs,
    this.isCritical,
    this.isEnd,
    this.maxAttempts,
    this.nextStep,
    this.onFailure,
    this.outputs,
    this.overriddenParameters,
    this.response,
    this.responseCode,
    this.stepExecutionId,
    this.stepName,
    this.stepStatus,
    this.targetLocation,
    this.targets,
    this.timeoutSeconds,
    this.validNextSteps,
  });
  factory StepExecution.fromJson(Map<String, dynamic> json) =>
      _$StepExecutionFromJson(json);
}

/// A filter to limit the amount of step execution information returned by the
/// call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StepExecutionFilter {
  /// One or more keys to limit the results. Valid filter keys include the
  /// following: StepName, Action, StepExecutionId, StepExecutionStatus,
  /// StartTimeBefore, StartTimeAfter.
  @_s.JsonKey(name: 'Key')
  final StepExecutionFilterKey key;

  /// The values of the filter key.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  StepExecutionFilter({
    @_s.required this.key,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$StepExecutionFilterToJson(this);
}

enum StepExecutionFilterKey {
  @_s.JsonValue('StartTimeBefore')
  startTimeBefore,
  @_s.JsonValue('StartTimeAfter')
  startTimeAfter,
  @_s.JsonValue('StepExecutionStatus')
  stepExecutionStatus,
  @_s.JsonValue('StepExecutionId')
  stepExecutionId,
  @_s.JsonValue('StepName')
  stepName,
  @_s.JsonValue('Action')
  action,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopAutomationExecutionResult {
  StopAutomationExecutionResult();
  factory StopAutomationExecutionResult.fromJson(Map<String, dynamic> json) =>
      _$StopAutomationExecutionResultFromJson(json);
}

enum StopType {
  @_s.JsonValue('Complete')
  complete,
  @_s.JsonValue('Cancel')
  cancel,
}

extension on StopType {
  String toValue() {
    switch (this) {
      case StopType.complete:
        return 'Complete';
      case StopType.cancel:
        return 'Cancel';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Metadata that you assign to your AWS resources. Tags enable you to
/// categorize your resources in different ways, for example, by purpose, owner,
/// or environment. In Systems Manager, you can apply tags to documents, managed
/// instances, maintenance windows, Parameter Store parameters, and patch
/// baselines.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The name of the tag.
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

/// An array of search criteria that targets instances using a Key,Value
/// combination that you specify.
/// <note>
/// One or more targets must be specified for maintenance window Run
/// Command-type tasks. Depending on the task, targets are optional for other
/// maintenance window task types (Automation, AWS Lambda, and AWS Step
/// Functions). For more information about running tasks that do not specify
/// targets, see see <a
/// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html">Registering
/// maintenance window tasks without targets</a> in the <i>AWS Systems Manager
/// User Guide</i>.
/// </note>
/// Supported formats include the following.
///
/// <ul>
/// <li>
/// <code>Key=InstanceIds,Values=<i>instance-id-1</i>,<i>instance-id-2</i>,<i>instance-id-3</i>
/// </code>
/// </li>
/// <li>
/// <code>Key=tag:<i>my-tag-key</i>,Values=<i>my-tag-value-1</i>,<i>my-tag-value-2</i>
/// </code>
/// </li>
/// <li>
/// <code>Key=tag-key,Values=<i>my-tag-key-1</i>,<i>my-tag-key-2</i> </code>
/// </li>
/// <li>
/// <b>Run Command and Maintenance window targets only</b>:
/// <code>Key=resource-groups:Name,Values=<i>resource-group-name</i> </code>
/// </li>
/// <li>
/// <b>Maintenance window targets only</b>:
/// <code>Key=resource-groups:ResourceTypeFilters,Values=<i>resource-type-1</i>,<i>resource-type-2</i>
/// </code>
/// </li>
/// <li>
/// <b>Automation targets only</b>:
/// <code>Key=ResourceGroup;Values=<i>resource-group-name</i> </code>
/// </li>
/// </ul>
/// For example:
///
/// <ul>
/// <li>
/// <code>Key=InstanceIds,Values=i-02573cafcfEXAMPLE,i-0471e04240EXAMPLE,i-07782c72faEXAMPLE</code>
/// </li>
/// <li>
/// <code>Key=tag:CostCenter,Values=CostCenter1,CostCenter2,CostCenter3</code>
/// </li>
/// <li>
/// <code>Key=tag-key,Values=Name,Instance-Type,CostCenter</code>
/// </li>
/// <li>
/// <b>Run Command and Maintenance window targets only</b>:
/// <code>Key=resource-groups:Name,Values=ProductionResourceGroup</code>
///
/// This example demonstrates how to target all resources in the resource group
/// <b>ProductionResourceGroup</b> in your maintenance window.
/// </li>
/// <li>
/// <b>Maintenance window targets only</b>:
/// <code>Key=resource-groups:ResourceTypeFilters,Values=<i>AWS::EC2::INSTANCE</i>,<i>AWS::EC2::VPC</i>
/// </code>
///
/// This example demonstrates how to target only EC2 instances and VPCs in your
/// maintenance window.
/// </li>
/// <li>
/// <b>Automation targets only</b>:
/// <code>Key=ResourceGroup,Values=MyResourceGroup</code>
/// </li>
/// <li>
/// <b>State Manager association targets only</b>:
/// <code>Key=InstanceIds,Values=<i>*</i> </code>
///
/// This example demonstrates how to target all managed instances in the AWS
/// Region where the association was created.
/// </li>
/// </ul>
/// For more information about how to send commands that target instances using
/// <code>Key,Value</code> parameters, see <a
/// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-targeting">Targeting
/// multiple instances</a> in the <i>AWS Systems Manager User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Target {
  /// User-defined criteria for sending commands that target instances that meet
  /// the criteria.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// User-defined criteria that maps to <code>Key</code>. For example, if you
  /// specified <code>tag:ServerRole</code>, you could specify
  /// <code>value:WebServer</code> to run a command on instances that include EC2
  /// tags of <code>ServerRole,WebServer</code>.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Target({
    this.key,
    this.values,
  });
  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);

  Map<String, dynamic> toJson() => _$TargetToJson(this);
}

/// The combination of AWS Regions and accounts targeted by the current
/// Automation execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetLocation {
  /// The AWS accounts targeted by the current Automation execution.
  @_s.JsonKey(name: 'Accounts')
  final List<String> accounts;

  /// The Automation execution role used by the currently running Automation. If
  /// not specified, the default value is
  /// <code>AWS-SystemsManager-AutomationExecutionRole</code>.
  @_s.JsonKey(name: 'ExecutionRoleName')
  final String executionRoleName;

  /// The AWS Regions targeted by the current Automation execution.
  @_s.JsonKey(name: 'Regions')
  final List<String> regions;

  /// The maximum number of AWS accounts and AWS regions allowed to run the
  /// Automation concurrently.
  @_s.JsonKey(name: 'TargetLocationMaxConcurrency')
  final String targetLocationMaxConcurrency;

  /// The maximum number of errors allowed before the system stops queueing
  /// additional Automation executions for the currently running Automation.
  @_s.JsonKey(name: 'TargetLocationMaxErrors')
  final String targetLocationMaxErrors;

  TargetLocation({
    this.accounts,
    this.executionRoleName,
    this.regions,
    this.targetLocationMaxConcurrency,
    this.targetLocationMaxErrors,
  });
  factory TargetLocation.fromJson(Map<String, dynamic> json) =>
      _$TargetLocationFromJson(json);

  Map<String, dynamic> toJson() => _$TargetLocationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminateSessionResponse {
  /// The ID of the session that has been terminated.
  @_s.JsonKey(name: 'SessionId')
  final String sessionId;

  TerminateSessionResponse({
    this.sessionId,
  });
  factory TerminateSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$TerminateSessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssociationResult {
  /// The description of the association that was updated.
  @_s.JsonKey(name: 'AssociationDescription')
  final AssociationDescription associationDescription;

  UpdateAssociationResult({
    this.associationDescription,
  });
  factory UpdateAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssociationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssociationStatusResult {
  /// Information about the association.
  @_s.JsonKey(name: 'AssociationDescription')
  final AssociationDescription associationDescription;

  UpdateAssociationStatusResult({
    this.associationDescription,
  });
  factory UpdateAssociationStatusResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssociationStatusResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDocumentDefaultVersionResult {
  /// The description of a custom document that you want to set as the default
  /// version.
  @_s.JsonKey(name: 'Description')
  final DocumentDefaultVersionDescription description;

  UpdateDocumentDefaultVersionResult({
    this.description,
  });
  factory UpdateDocumentDefaultVersionResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDocumentDefaultVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDocumentMetadataResponse {
  UpdateDocumentMetadataResponse();
  factory UpdateDocumentMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDocumentMetadataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDocumentResult {
  /// A description of the document that was updated.
  @_s.JsonKey(name: 'DocumentDescription')
  final DocumentDescription documentDescription;

  UpdateDocumentResult({
    this.documentDescription,
  });
  factory UpdateDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDocumentResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMaintenanceWindowResult {
  /// Whether targets must be registered with the maintenance window before tasks
  /// can be defined for those targets.
  @_s.JsonKey(name: 'AllowUnassociatedTargets')
  final bool allowUnassociatedTargets;

  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  @_s.JsonKey(name: 'Cutoff')
  final int cutoff;

  /// An optional description of the update.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The duration of the maintenance window in hours.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// Whether the maintenance window is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become inactive. The maintenance window will not run
  /// after this specified time.
  @_s.JsonKey(name: 'EndDate')
  final String endDate;

  /// The name of the maintenance window.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The number of days to wait to run a maintenance window after the scheduled
  /// CRON expression date and time.
  @_s.JsonKey(name: 'ScheduleOffset')
  final int scheduleOffset;

  /// The time zone that the scheduled maintenance window executions are based on,
  /// in Internet Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see the
  /// <a href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA
  /// website.
  @_s.JsonKey(name: 'ScheduleTimezone')
  final String scheduleTimezone;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become active. The maintenance window will not run
  /// before this specified time.
  @_s.JsonKey(name: 'StartDate')
  final String startDate;

  /// The ID of the created maintenance window.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  UpdateMaintenanceWindowResult({
    this.allowUnassociatedTargets,
    this.cutoff,
    this.description,
    this.duration,
    this.enabled,
    this.endDate,
    this.name,
    this.schedule,
    this.scheduleOffset,
    this.scheduleTimezone,
    this.startDate,
    this.windowId,
  });
  factory UpdateMaintenanceWindowResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateMaintenanceWindowResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMaintenanceWindowTargetResult {
  /// The updated description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The updated name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The updated owner.
  @_s.JsonKey(name: 'OwnerInformation')
  final String ownerInformation;

  /// The updated targets.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  /// The maintenance window ID specified in the update request.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  /// The target ID specified in the update request.
  @_s.JsonKey(name: 'WindowTargetId')
  final String windowTargetId;

  UpdateMaintenanceWindowTargetResult({
    this.description,
    this.name,
    this.ownerInformation,
    this.targets,
    this.windowId,
    this.windowTargetId,
  });
  factory UpdateMaintenanceWindowTargetResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMaintenanceWindowTargetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMaintenanceWindowTaskResult {
  /// The updated task description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The updated logging information in Amazon S3.
  /// <note>
  /// <code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to
  /// contain logs, instead use the <code>OutputS3BucketName</code> and
  /// <code>OutputS3KeyPrefix</code> options in the
  /// <code>TaskInvocationParameters</code> structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  @_s.JsonKey(name: 'LoggingInfo')
  final LoggingInfo loggingInfo;

  /// The updated MaxConcurrency value.
  @_s.JsonKey(name: 'MaxConcurrency')
  final String maxConcurrency;

  /// The updated MaxErrors value.
  @_s.JsonKey(name: 'MaxErrors')
  final String maxErrors;

  /// The updated task name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The updated priority value.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The ARN of the IAM service role to use to publish Amazon Simple Notification
  /// Service (Amazon SNS) notifications for maintenance window Run Command tasks.
  @_s.JsonKey(name: 'ServiceRoleArn')
  final String serviceRoleArn;

  /// The updated target values.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  /// The updated task ARN value.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  /// The updated parameter values.
  @_s.JsonKey(name: 'TaskInvocationParameters')
  final MaintenanceWindowTaskInvocationParameters taskInvocationParameters;

  /// The updated parameter values.
  /// <note>
  /// <code>TaskParameters</code> has been deprecated. To specify parameters to
  /// pass to a task when it runs, instead use the <code>Parameters</code> option
  /// in the <code>TaskInvocationParameters</code> structure. For information
  /// about how Systems Manager handles these options for the supported
  /// maintenance window task types, see
  /// <a>MaintenanceWindowTaskInvocationParameters</a>.
  /// </note>
  @_s.JsonKey(name: 'TaskParameters')
  final Map<String, MaintenanceWindowTaskParameterValueExpression>
      taskParameters;

  /// The ID of the maintenance window that was updated.
  @_s.JsonKey(name: 'WindowId')
  final String windowId;

  /// The task ID of the maintenance window that was updated.
  @_s.JsonKey(name: 'WindowTaskId')
  final String windowTaskId;

  UpdateMaintenanceWindowTaskResult({
    this.description,
    this.loggingInfo,
    this.maxConcurrency,
    this.maxErrors,
    this.name,
    this.priority,
    this.serviceRoleArn,
    this.targets,
    this.taskArn,
    this.taskInvocationParameters,
    this.taskParameters,
    this.windowId,
    this.windowTaskId,
  });
  factory UpdateMaintenanceWindowTaskResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMaintenanceWindowTaskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateManagedInstanceRoleResult {
  UpdateManagedInstanceRoleResult();
  factory UpdateManagedInstanceRoleResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateManagedInstanceRoleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateOpsItemResponse {
  UpdateOpsItemResponse();
  factory UpdateOpsItemResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateOpsItemResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateOpsMetadataResult {
  /// The Amazon Resource Name (ARN) of the OpsMetadata Object that was updated.
  @_s.JsonKey(name: 'OpsMetadataArn')
  final String opsMetadataArn;

  UpdateOpsMetadataResult({
    this.opsMetadataArn,
  });
  factory UpdateOpsMetadataResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateOpsMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePatchBaselineResult {
  /// A set of rules used to include patches in the baseline.
  @_s.JsonKey(name: 'ApprovalRules')
  final PatchRuleGroup approvalRules;

  /// A list of explicitly approved patches for the baseline.
  @_s.JsonKey(name: 'ApprovedPatches')
  final List<String> approvedPatches;

  /// The compliance severity level assigned to the patch baseline after the
  /// update completed.
  @_s.JsonKey(name: 'ApprovedPatchesComplianceLevel')
  final PatchComplianceLevel approvedPatchesComplianceLevel;

  /// Indicates whether the list of approved patches includes non-security updates
  /// that should be applied to the instances. The default value is 'false'.
  /// Applies to Linux instances only.
  @_s.JsonKey(name: 'ApprovedPatchesEnableNonSecurity')
  final bool approvedPatchesEnableNonSecurity;

  /// The ID of the deleted patch baseline.
  @_s.JsonKey(name: 'BaselineId')
  final String baselineId;

  /// The date when the patch baseline was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// A description of the Patch Baseline.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A set of global filters used to exclude patches from the baseline.
  @_s.JsonKey(name: 'GlobalFilters')
  final PatchFilterGroup globalFilters;

  /// The date when the patch baseline was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedDate')
  final DateTime modifiedDate;

  /// The name of the patch baseline.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The operating system rule used by the updated patch baseline.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  /// A list of explicitly rejected patches for the baseline.
  @_s.JsonKey(name: 'RejectedPatches')
  final List<String> rejectedPatches;

  /// The action specified to take on patches included in the RejectedPatches
  /// list. A patch can be allowed only if it is a dependency of another package,
  /// or blocked entirely along with packages that include it as a dependency.
  @_s.JsonKey(name: 'RejectedPatchesAction')
  final PatchAction rejectedPatchesAction;

  /// Information about the patches to use to update the instances, including
  /// target operating systems and source repositories. Applies to Linux instances
  /// only.
  @_s.JsonKey(name: 'Sources')
  final List<PatchSource> sources;

  UpdatePatchBaselineResult({
    this.approvalRules,
    this.approvedPatches,
    this.approvedPatchesComplianceLevel,
    this.approvedPatchesEnableNonSecurity,
    this.baselineId,
    this.createdDate,
    this.description,
    this.globalFilters,
    this.modifiedDate,
    this.name,
    this.operatingSystem,
    this.rejectedPatches,
    this.rejectedPatchesAction,
    this.sources,
  });
  factory UpdatePatchBaselineResult.fromJson(Map<String, dynamic> json) =>
      _$UpdatePatchBaselineResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResourceDataSyncResult {
  UpdateResourceDataSyncResult();
  factory UpdateResourceDataSyncResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateResourceDataSyncResultFromJson(json);
}

/// The result body of the UpdateServiceSetting API action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateServiceSettingResult {
  UpdateServiceSettingResult();
  factory UpdateServiceSettingResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateServiceSettingResultFromJson(json);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class AssociatedInstances extends _s.GenericAwsException {
  AssociatedInstances({String type, String message})
      : super(type: type, code: 'AssociatedInstances', message: message);
}

class AssociationAlreadyExists extends _s.GenericAwsException {
  AssociationAlreadyExists({String type, String message})
      : super(type: type, code: 'AssociationAlreadyExists', message: message);
}

class AssociationDoesNotExist extends _s.GenericAwsException {
  AssociationDoesNotExist({String type, String message})
      : super(type: type, code: 'AssociationDoesNotExist', message: message);
}

class AssociationExecutionDoesNotExist extends _s.GenericAwsException {
  AssociationExecutionDoesNotExist({String type, String message})
      : super(
            type: type,
            code: 'AssociationExecutionDoesNotExist',
            message: message);
}

class AssociationLimitExceeded extends _s.GenericAwsException {
  AssociationLimitExceeded({String type, String message})
      : super(type: type, code: 'AssociationLimitExceeded', message: message);
}

class AssociationVersionLimitExceeded extends _s.GenericAwsException {
  AssociationVersionLimitExceeded({String type, String message})
      : super(
            type: type,
            code: 'AssociationVersionLimitExceeded',
            message: message);
}

class AutomationDefinitionNotApprovedException extends _s.GenericAwsException {
  AutomationDefinitionNotApprovedException({String type, String message})
      : super(
            type: type,
            code: 'AutomationDefinitionNotApprovedException',
            message: message);
}

class AutomationDefinitionNotFoundException extends _s.GenericAwsException {
  AutomationDefinitionNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'AutomationDefinitionNotFoundException',
            message: message);
}

class AutomationDefinitionVersionNotFoundException
    extends _s.GenericAwsException {
  AutomationDefinitionVersionNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'AutomationDefinitionVersionNotFoundException',
            message: message);
}

class AutomationExecutionLimitExceededException extends _s.GenericAwsException {
  AutomationExecutionLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'AutomationExecutionLimitExceededException',
            message: message);
}

class AutomationExecutionNotFoundException extends _s.GenericAwsException {
  AutomationExecutionNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'AutomationExecutionNotFoundException',
            message: message);
}

class AutomationStepNotFoundException extends _s.GenericAwsException {
  AutomationStepNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'AutomationStepNotFoundException',
            message: message);
}

class ComplianceTypeCountLimitExceededException extends _s.GenericAwsException {
  ComplianceTypeCountLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ComplianceTypeCountLimitExceededException',
            message: message);
}

class CustomSchemaCountLimitExceededException extends _s.GenericAwsException {
  CustomSchemaCountLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'CustomSchemaCountLimitExceededException',
            message: message);
}

class DocumentAlreadyExists extends _s.GenericAwsException {
  DocumentAlreadyExists({String type, String message})
      : super(type: type, code: 'DocumentAlreadyExists', message: message);
}

class DocumentLimitExceeded extends _s.GenericAwsException {
  DocumentLimitExceeded({String type, String message})
      : super(type: type, code: 'DocumentLimitExceeded', message: message);
}

class DocumentPermissionLimit extends _s.GenericAwsException {
  DocumentPermissionLimit({String type, String message})
      : super(type: type, code: 'DocumentPermissionLimit', message: message);
}

class DocumentVersionLimitExceeded extends _s.GenericAwsException {
  DocumentVersionLimitExceeded({String type, String message})
      : super(
            type: type, code: 'DocumentVersionLimitExceeded', message: message);
}

class DoesNotExistException extends _s.GenericAwsException {
  DoesNotExistException({String type, String message})
      : super(type: type, code: 'DoesNotExistException', message: message);
}

class DuplicateDocumentContent extends _s.GenericAwsException {
  DuplicateDocumentContent({String type, String message})
      : super(type: type, code: 'DuplicateDocumentContent', message: message);
}

class DuplicateDocumentVersionName extends _s.GenericAwsException {
  DuplicateDocumentVersionName({String type, String message})
      : super(
            type: type, code: 'DuplicateDocumentVersionName', message: message);
}

class DuplicateInstanceId extends _s.GenericAwsException {
  DuplicateInstanceId({String type, String message})
      : super(type: type, code: 'DuplicateInstanceId', message: message);
}

class FeatureNotAvailableException extends _s.GenericAwsException {
  FeatureNotAvailableException({String type, String message})
      : super(
            type: type, code: 'FeatureNotAvailableException', message: message);
}

class HierarchyLevelLimitExceededException extends _s.GenericAwsException {
  HierarchyLevelLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'HierarchyLevelLimitExceededException',
            message: message);
}

class HierarchyTypeMismatchException extends _s.GenericAwsException {
  HierarchyTypeMismatchException({String type, String message})
      : super(
            type: type,
            code: 'HierarchyTypeMismatchException',
            message: message);
}

class IdempotentParameterMismatch extends _s.GenericAwsException {
  IdempotentParameterMismatch({String type, String message})
      : super(
            type: type, code: 'IdempotentParameterMismatch', message: message);
}

class IncompatiblePolicyException extends _s.GenericAwsException {
  IncompatiblePolicyException({String type, String message})
      : super(
            type: type, code: 'IncompatiblePolicyException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidActivation extends _s.GenericAwsException {
  InvalidActivation({String type, String message})
      : super(type: type, code: 'InvalidActivation', message: message);
}

class InvalidActivationId extends _s.GenericAwsException {
  InvalidActivationId({String type, String message})
      : super(type: type, code: 'InvalidActivationId', message: message);
}

class InvalidAggregatorException extends _s.GenericAwsException {
  InvalidAggregatorException({String type, String message})
      : super(type: type, code: 'InvalidAggregatorException', message: message);
}

class InvalidAllowedPatternException extends _s.GenericAwsException {
  InvalidAllowedPatternException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAllowedPatternException',
            message: message);
}

class InvalidAssociation extends _s.GenericAwsException {
  InvalidAssociation({String type, String message})
      : super(type: type, code: 'InvalidAssociation', message: message);
}

class InvalidAssociationVersion extends _s.GenericAwsException {
  InvalidAssociationVersion({String type, String message})
      : super(type: type, code: 'InvalidAssociationVersion', message: message);
}

class InvalidAutomationExecutionParametersException
    extends _s.GenericAwsException {
  InvalidAutomationExecutionParametersException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAutomationExecutionParametersException',
            message: message);
}

class InvalidAutomationSignalException extends _s.GenericAwsException {
  InvalidAutomationSignalException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAutomationSignalException',
            message: message);
}

class InvalidAutomationStatusUpdateException extends _s.GenericAwsException {
  InvalidAutomationStatusUpdateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAutomationStatusUpdateException',
            message: message);
}

class InvalidCommandId extends _s.GenericAwsException {
  InvalidCommandId({String type, String message})
      : super(type: type, code: 'InvalidCommandId', message: message);
}

class InvalidDeleteInventoryParametersException extends _s.GenericAwsException {
  InvalidDeleteInventoryParametersException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeleteInventoryParametersException',
            message: message);
}

class InvalidDeletionIdException extends _s.GenericAwsException {
  InvalidDeletionIdException({String type, String message})
      : super(type: type, code: 'InvalidDeletionIdException', message: message);
}

class InvalidDocument extends _s.GenericAwsException {
  InvalidDocument({String type, String message})
      : super(type: type, code: 'InvalidDocument', message: message);
}

class InvalidDocumentContent extends _s.GenericAwsException {
  InvalidDocumentContent({String type, String message})
      : super(type: type, code: 'InvalidDocumentContent', message: message);
}

class InvalidDocumentOperation extends _s.GenericAwsException {
  InvalidDocumentOperation({String type, String message})
      : super(type: type, code: 'InvalidDocumentOperation', message: message);
}

class InvalidDocumentSchemaVersion extends _s.GenericAwsException {
  InvalidDocumentSchemaVersion({String type, String message})
      : super(
            type: type, code: 'InvalidDocumentSchemaVersion', message: message);
}

class InvalidDocumentType extends _s.GenericAwsException {
  InvalidDocumentType({String type, String message})
      : super(type: type, code: 'InvalidDocumentType', message: message);
}

class InvalidDocumentVersion extends _s.GenericAwsException {
  InvalidDocumentVersion({String type, String message})
      : super(type: type, code: 'InvalidDocumentVersion', message: message);
}

class InvalidFilter extends _s.GenericAwsException {
  InvalidFilter({String type, String message})
      : super(type: type, code: 'InvalidFilter', message: message);
}

class InvalidFilterKey extends _s.GenericAwsException {
  InvalidFilterKey({String type, String message})
      : super(type: type, code: 'InvalidFilterKey', message: message);
}

class InvalidFilterOption extends _s.GenericAwsException {
  InvalidFilterOption({String type, String message})
      : super(type: type, code: 'InvalidFilterOption', message: message);
}

class InvalidFilterValue extends _s.GenericAwsException {
  InvalidFilterValue({String type, String message})
      : super(type: type, code: 'InvalidFilterValue', message: message);
}

class InvalidInstanceId extends _s.GenericAwsException {
  InvalidInstanceId({String type, String message})
      : super(type: type, code: 'InvalidInstanceId', message: message);
}

class InvalidInstanceInformationFilterValue extends _s.GenericAwsException {
  InvalidInstanceInformationFilterValue({String type, String message})
      : super(
            type: type,
            code: 'InvalidInstanceInformationFilterValue',
            message: message);
}

class InvalidInventoryGroupException extends _s.GenericAwsException {
  InvalidInventoryGroupException({String type, String message})
      : super(
            type: type,
            code: 'InvalidInventoryGroupException',
            message: message);
}

class InvalidInventoryItemContextException extends _s.GenericAwsException {
  InvalidInventoryItemContextException({String type, String message})
      : super(
            type: type,
            code: 'InvalidInventoryItemContextException',
            message: message);
}

class InvalidInventoryRequestException extends _s.GenericAwsException {
  InvalidInventoryRequestException({String type, String message})
      : super(
            type: type,
            code: 'InvalidInventoryRequestException',
            message: message);
}

class InvalidItemContentException extends _s.GenericAwsException {
  InvalidItemContentException({String type, String message})
      : super(
            type: type, code: 'InvalidItemContentException', message: message);
}

class InvalidKeyId extends _s.GenericAwsException {
  InvalidKeyId({String type, String message})
      : super(type: type, code: 'InvalidKeyId', message: message);
}

class InvalidNextToken extends _s.GenericAwsException {
  InvalidNextToken({String type, String message})
      : super(type: type, code: 'InvalidNextToken', message: message);
}

class InvalidNotificationConfig extends _s.GenericAwsException {
  InvalidNotificationConfig({String type, String message})
      : super(type: type, code: 'InvalidNotificationConfig', message: message);
}

class InvalidOptionException extends _s.GenericAwsException {
  InvalidOptionException({String type, String message})
      : super(type: type, code: 'InvalidOptionException', message: message);
}

class InvalidOutputFolder extends _s.GenericAwsException {
  InvalidOutputFolder({String type, String message})
      : super(type: type, code: 'InvalidOutputFolder', message: message);
}

class InvalidOutputLocation extends _s.GenericAwsException {
  InvalidOutputLocation({String type, String message})
      : super(type: type, code: 'InvalidOutputLocation', message: message);
}

class InvalidParameters extends _s.GenericAwsException {
  InvalidParameters({String type, String message})
      : super(type: type, code: 'InvalidParameters', message: message);
}

class InvalidPermissionType extends _s.GenericAwsException {
  InvalidPermissionType({String type, String message})
      : super(type: type, code: 'InvalidPermissionType', message: message);
}

class InvalidPluginName extends _s.GenericAwsException {
  InvalidPluginName({String type, String message})
      : super(type: type, code: 'InvalidPluginName', message: message);
}

class InvalidPolicyAttributeException extends _s.GenericAwsException {
  InvalidPolicyAttributeException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPolicyAttributeException',
            message: message);
}

class InvalidPolicyTypeException extends _s.GenericAwsException {
  InvalidPolicyTypeException({String type, String message})
      : super(type: type, code: 'InvalidPolicyTypeException', message: message);
}

class InvalidResourceId extends _s.GenericAwsException {
  InvalidResourceId({String type, String message})
      : super(type: type, code: 'InvalidResourceId', message: message);
}

class InvalidResourceType extends _s.GenericAwsException {
  InvalidResourceType({String type, String message})
      : super(type: type, code: 'InvalidResourceType', message: message);
}

class InvalidResultAttributeException extends _s.GenericAwsException {
  InvalidResultAttributeException({String type, String message})
      : super(
            type: type,
            code: 'InvalidResultAttributeException',
            message: message);
}

class InvalidRole extends _s.GenericAwsException {
  InvalidRole({String type, String message})
      : super(type: type, code: 'InvalidRole', message: message);
}

class InvalidSchedule extends _s.GenericAwsException {
  InvalidSchedule({String type, String message})
      : super(type: type, code: 'InvalidSchedule', message: message);
}

class InvalidTarget extends _s.GenericAwsException {
  InvalidTarget({String type, String message})
      : super(type: type, code: 'InvalidTarget', message: message);
}

class InvalidTypeNameException extends _s.GenericAwsException {
  InvalidTypeNameException({String type, String message})
      : super(type: type, code: 'InvalidTypeNameException', message: message);
}

class InvalidUpdate extends _s.GenericAwsException {
  InvalidUpdate({String type, String message})
      : super(type: type, code: 'InvalidUpdate', message: message);
}

class InvocationDoesNotExist extends _s.GenericAwsException {
  InvocationDoesNotExist({String type, String message})
      : super(type: type, code: 'InvocationDoesNotExist', message: message);
}

class ItemContentMismatchException extends _s.GenericAwsException {
  ItemContentMismatchException({String type, String message})
      : super(
            type: type, code: 'ItemContentMismatchException', message: message);
}

class ItemSizeLimitExceededException extends _s.GenericAwsException {
  ItemSizeLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ItemSizeLimitExceededException',
            message: message);
}

class MaxDocumentSizeExceeded extends _s.GenericAwsException {
  MaxDocumentSizeExceeded({String type, String message})
      : super(type: type, code: 'MaxDocumentSizeExceeded', message: message);
}

class OpsItemAlreadyExistsException extends _s.GenericAwsException {
  OpsItemAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'OpsItemAlreadyExistsException',
            message: message);
}

class OpsItemInvalidParameterException extends _s.GenericAwsException {
  OpsItemInvalidParameterException({String type, String message})
      : super(
            type: type,
            code: 'OpsItemInvalidParameterException',
            message: message);
}

class OpsItemLimitExceededException extends _s.GenericAwsException {
  OpsItemLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'OpsItemLimitExceededException',
            message: message);
}

class OpsItemNotFoundException extends _s.GenericAwsException {
  OpsItemNotFoundException({String type, String message})
      : super(type: type, code: 'OpsItemNotFoundException', message: message);
}

class OpsMetadataAlreadyExistsException extends _s.GenericAwsException {
  OpsMetadataAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'OpsMetadataAlreadyExistsException',
            message: message);
}

class OpsMetadataInvalidArgumentException extends _s.GenericAwsException {
  OpsMetadataInvalidArgumentException({String type, String message})
      : super(
            type: type,
            code: 'OpsMetadataInvalidArgumentException',
            message: message);
}

class OpsMetadataKeyLimitExceededException extends _s.GenericAwsException {
  OpsMetadataKeyLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'OpsMetadataKeyLimitExceededException',
            message: message);
}

class OpsMetadataLimitExceededException extends _s.GenericAwsException {
  OpsMetadataLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'OpsMetadataLimitExceededException',
            message: message);
}

class OpsMetadataNotFoundException extends _s.GenericAwsException {
  OpsMetadataNotFoundException({String type, String message})
      : super(
            type: type, code: 'OpsMetadataNotFoundException', message: message);
}

class OpsMetadataTooManyUpdatesException extends _s.GenericAwsException {
  OpsMetadataTooManyUpdatesException({String type, String message})
      : super(
            type: type,
            code: 'OpsMetadataTooManyUpdatesException',
            message: message);
}

class ParameterAlreadyExists extends _s.GenericAwsException {
  ParameterAlreadyExists({String type, String message})
      : super(type: type, code: 'ParameterAlreadyExists', message: message);
}

class ParameterLimitExceeded extends _s.GenericAwsException {
  ParameterLimitExceeded({String type, String message})
      : super(type: type, code: 'ParameterLimitExceeded', message: message);
}

class ParameterMaxVersionLimitExceeded extends _s.GenericAwsException {
  ParameterMaxVersionLimitExceeded({String type, String message})
      : super(
            type: type,
            code: 'ParameterMaxVersionLimitExceeded',
            message: message);
}

class ParameterNotFound extends _s.GenericAwsException {
  ParameterNotFound({String type, String message})
      : super(type: type, code: 'ParameterNotFound', message: message);
}

class ParameterPatternMismatchException extends _s.GenericAwsException {
  ParameterPatternMismatchException({String type, String message})
      : super(
            type: type,
            code: 'ParameterPatternMismatchException',
            message: message);
}

class ParameterVersionLabelLimitExceeded extends _s.GenericAwsException {
  ParameterVersionLabelLimitExceeded({String type, String message})
      : super(
            type: type,
            code: 'ParameterVersionLabelLimitExceeded',
            message: message);
}

class ParameterVersionNotFound extends _s.GenericAwsException {
  ParameterVersionNotFound({String type, String message})
      : super(type: type, code: 'ParameterVersionNotFound', message: message);
}

class PoliciesLimitExceededException extends _s.GenericAwsException {
  PoliciesLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'PoliciesLimitExceededException',
            message: message);
}

class ResourceDataSyncAlreadyExistsException extends _s.GenericAwsException {
  ResourceDataSyncAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceDataSyncAlreadyExistsException',
            message: message);
}

class ResourceDataSyncConflictException extends _s.GenericAwsException {
  ResourceDataSyncConflictException({String type, String message})
      : super(
            type: type,
            code: 'ResourceDataSyncConflictException',
            message: message);
}

class ResourceDataSyncCountExceededException extends _s.GenericAwsException {
  ResourceDataSyncCountExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceDataSyncCountExceededException',
            message: message);
}

class ResourceDataSyncInvalidConfigurationException
    extends _s.GenericAwsException {
  ResourceDataSyncInvalidConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'ResourceDataSyncInvalidConfigurationException',
            message: message);
}

class ResourceDataSyncNotFoundException extends _s.GenericAwsException {
  ResourceDataSyncNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'ResourceDataSyncNotFoundException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ServiceSettingNotFound extends _s.GenericAwsException {
  ServiceSettingNotFound({String type, String message})
      : super(type: type, code: 'ServiceSettingNotFound', message: message);
}

class StatusUnchanged extends _s.GenericAwsException {
  StatusUnchanged({String type, String message})
      : super(type: type, code: 'StatusUnchanged', message: message);
}

class SubTypeCountLimitExceededException extends _s.GenericAwsException {
  SubTypeCountLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'SubTypeCountLimitExceededException',
            message: message);
}

class TargetInUseException extends _s.GenericAwsException {
  TargetInUseException({String type, String message})
      : super(type: type, code: 'TargetInUseException', message: message);
}

class TargetNotConnected extends _s.GenericAwsException {
  TargetNotConnected({String type, String message})
      : super(type: type, code: 'TargetNotConnected', message: message);
}

class TooManyTagsError extends _s.GenericAwsException {
  TooManyTagsError({String type, String message})
      : super(type: type, code: 'TooManyTagsError', message: message);
}

class TooManyUpdates extends _s.GenericAwsException {
  TooManyUpdates({String type, String message})
      : super(type: type, code: 'TooManyUpdates', message: message);
}

class TotalSizeLimitExceededException extends _s.GenericAwsException {
  TotalSizeLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'TotalSizeLimitExceededException',
            message: message);
}

class UnsupportedCalendarException extends _s.GenericAwsException {
  UnsupportedCalendarException({String type, String message})
      : super(
            type: type, code: 'UnsupportedCalendarException', message: message);
}

class UnsupportedFeatureRequiredException extends _s.GenericAwsException {
  UnsupportedFeatureRequiredException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedFeatureRequiredException',
            message: message);
}

class UnsupportedInventoryItemContextException extends _s.GenericAwsException {
  UnsupportedInventoryItemContextException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedInventoryItemContextException',
            message: message);
}

class UnsupportedInventorySchemaVersionException
    extends _s.GenericAwsException {
  UnsupportedInventorySchemaVersionException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedInventorySchemaVersionException',
            message: message);
}

class UnsupportedOperatingSystem extends _s.GenericAwsException {
  UnsupportedOperatingSystem({String type, String message})
      : super(type: type, code: 'UnsupportedOperatingSystem', message: message);
}

class UnsupportedParameterType extends _s.GenericAwsException {
  UnsupportedParameterType({String type, String message})
      : super(type: type, code: 'UnsupportedParameterType', message: message);
}

class UnsupportedPlatformType extends _s.GenericAwsException {
  UnsupportedPlatformType({String type, String message})
      : super(type: type, code: 'UnsupportedPlatformType', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'AssociatedInstances': (type, message) =>
      AssociatedInstances(type: type, message: message),
  'AssociationAlreadyExists': (type, message) =>
      AssociationAlreadyExists(type: type, message: message),
  'AssociationDoesNotExist': (type, message) =>
      AssociationDoesNotExist(type: type, message: message),
  'AssociationExecutionDoesNotExist': (type, message) =>
      AssociationExecutionDoesNotExist(type: type, message: message),
  'AssociationLimitExceeded': (type, message) =>
      AssociationLimitExceeded(type: type, message: message),
  'AssociationVersionLimitExceeded': (type, message) =>
      AssociationVersionLimitExceeded(type: type, message: message),
  'AutomationDefinitionNotApprovedException': (type, message) =>
      AutomationDefinitionNotApprovedException(type: type, message: message),
  'AutomationDefinitionNotFoundException': (type, message) =>
      AutomationDefinitionNotFoundException(type: type, message: message),
  'AutomationDefinitionVersionNotFoundException': (type, message) =>
      AutomationDefinitionVersionNotFoundException(
          type: type, message: message),
  'AutomationExecutionLimitExceededException': (type, message) =>
      AutomationExecutionLimitExceededException(type: type, message: message),
  'AutomationExecutionNotFoundException': (type, message) =>
      AutomationExecutionNotFoundException(type: type, message: message),
  'AutomationStepNotFoundException': (type, message) =>
      AutomationStepNotFoundException(type: type, message: message),
  'ComplianceTypeCountLimitExceededException': (type, message) =>
      ComplianceTypeCountLimitExceededException(type: type, message: message),
  'CustomSchemaCountLimitExceededException': (type, message) =>
      CustomSchemaCountLimitExceededException(type: type, message: message),
  'DocumentAlreadyExists': (type, message) =>
      DocumentAlreadyExists(type: type, message: message),
  'DocumentLimitExceeded': (type, message) =>
      DocumentLimitExceeded(type: type, message: message),
  'DocumentPermissionLimit': (type, message) =>
      DocumentPermissionLimit(type: type, message: message),
  'DocumentVersionLimitExceeded': (type, message) =>
      DocumentVersionLimitExceeded(type: type, message: message),
  'DoesNotExistException': (type, message) =>
      DoesNotExistException(type: type, message: message),
  'DuplicateDocumentContent': (type, message) =>
      DuplicateDocumentContent(type: type, message: message),
  'DuplicateDocumentVersionName': (type, message) =>
      DuplicateDocumentVersionName(type: type, message: message),
  'DuplicateInstanceId': (type, message) =>
      DuplicateInstanceId(type: type, message: message),
  'FeatureNotAvailableException': (type, message) =>
      FeatureNotAvailableException(type: type, message: message),
  'HierarchyLevelLimitExceededException': (type, message) =>
      HierarchyLevelLimitExceededException(type: type, message: message),
  'HierarchyTypeMismatchException': (type, message) =>
      HierarchyTypeMismatchException(type: type, message: message),
  'IdempotentParameterMismatch': (type, message) =>
      IdempotentParameterMismatch(type: type, message: message),
  'IncompatiblePolicyException': (type, message) =>
      IncompatiblePolicyException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidActivation': (type, message) =>
      InvalidActivation(type: type, message: message),
  'InvalidActivationId': (type, message) =>
      InvalidActivationId(type: type, message: message),
  'InvalidAggregatorException': (type, message) =>
      InvalidAggregatorException(type: type, message: message),
  'InvalidAllowedPatternException': (type, message) =>
      InvalidAllowedPatternException(type: type, message: message),
  'InvalidAssociation': (type, message) =>
      InvalidAssociation(type: type, message: message),
  'InvalidAssociationVersion': (type, message) =>
      InvalidAssociationVersion(type: type, message: message),
  'InvalidAutomationExecutionParametersException': (type, message) =>
      InvalidAutomationExecutionParametersException(
          type: type, message: message),
  'InvalidAutomationSignalException': (type, message) =>
      InvalidAutomationSignalException(type: type, message: message),
  'InvalidAutomationStatusUpdateException': (type, message) =>
      InvalidAutomationStatusUpdateException(type: type, message: message),
  'InvalidCommandId': (type, message) =>
      InvalidCommandId(type: type, message: message),
  'InvalidDeleteInventoryParametersException': (type, message) =>
      InvalidDeleteInventoryParametersException(type: type, message: message),
  'InvalidDeletionIdException': (type, message) =>
      InvalidDeletionIdException(type: type, message: message),
  'InvalidDocument': (type, message) =>
      InvalidDocument(type: type, message: message),
  'InvalidDocumentContent': (type, message) =>
      InvalidDocumentContent(type: type, message: message),
  'InvalidDocumentOperation': (type, message) =>
      InvalidDocumentOperation(type: type, message: message),
  'InvalidDocumentSchemaVersion': (type, message) =>
      InvalidDocumentSchemaVersion(type: type, message: message),
  'InvalidDocumentType': (type, message) =>
      InvalidDocumentType(type: type, message: message),
  'InvalidDocumentVersion': (type, message) =>
      InvalidDocumentVersion(type: type, message: message),
  'InvalidFilter': (type, message) =>
      InvalidFilter(type: type, message: message),
  'InvalidFilterKey': (type, message) =>
      InvalidFilterKey(type: type, message: message),
  'InvalidFilterOption': (type, message) =>
      InvalidFilterOption(type: type, message: message),
  'InvalidFilterValue': (type, message) =>
      InvalidFilterValue(type: type, message: message),
  'InvalidInstanceId': (type, message) =>
      InvalidInstanceId(type: type, message: message),
  'InvalidInstanceInformationFilterValue': (type, message) =>
      InvalidInstanceInformationFilterValue(type: type, message: message),
  'InvalidInventoryGroupException': (type, message) =>
      InvalidInventoryGroupException(type: type, message: message),
  'InvalidInventoryItemContextException': (type, message) =>
      InvalidInventoryItemContextException(type: type, message: message),
  'InvalidInventoryRequestException': (type, message) =>
      InvalidInventoryRequestException(type: type, message: message),
  'InvalidItemContentException': (type, message) =>
      InvalidItemContentException(type: type, message: message),
  'InvalidKeyId': (type, message) => InvalidKeyId(type: type, message: message),
  'InvalidNextToken': (type, message) =>
      InvalidNextToken(type: type, message: message),
  'InvalidNotificationConfig': (type, message) =>
      InvalidNotificationConfig(type: type, message: message),
  'InvalidOptionException': (type, message) =>
      InvalidOptionException(type: type, message: message),
  'InvalidOutputFolder': (type, message) =>
      InvalidOutputFolder(type: type, message: message),
  'InvalidOutputLocation': (type, message) =>
      InvalidOutputLocation(type: type, message: message),
  'InvalidParameters': (type, message) =>
      InvalidParameters(type: type, message: message),
  'InvalidPermissionType': (type, message) =>
      InvalidPermissionType(type: type, message: message),
  'InvalidPluginName': (type, message) =>
      InvalidPluginName(type: type, message: message),
  'InvalidPolicyAttributeException': (type, message) =>
      InvalidPolicyAttributeException(type: type, message: message),
  'InvalidPolicyTypeException': (type, message) =>
      InvalidPolicyTypeException(type: type, message: message),
  'InvalidResourceId': (type, message) =>
      InvalidResourceId(type: type, message: message),
  'InvalidResourceType': (type, message) =>
      InvalidResourceType(type: type, message: message),
  'InvalidResultAttributeException': (type, message) =>
      InvalidResultAttributeException(type: type, message: message),
  'InvalidRole': (type, message) => InvalidRole(type: type, message: message),
  'InvalidSchedule': (type, message) =>
      InvalidSchedule(type: type, message: message),
  'InvalidTarget': (type, message) =>
      InvalidTarget(type: type, message: message),
  'InvalidTypeNameException': (type, message) =>
      InvalidTypeNameException(type: type, message: message),
  'InvalidUpdate': (type, message) =>
      InvalidUpdate(type: type, message: message),
  'InvocationDoesNotExist': (type, message) =>
      InvocationDoesNotExist(type: type, message: message),
  'ItemContentMismatchException': (type, message) =>
      ItemContentMismatchException(type: type, message: message),
  'ItemSizeLimitExceededException': (type, message) =>
      ItemSizeLimitExceededException(type: type, message: message),
  'MaxDocumentSizeExceeded': (type, message) =>
      MaxDocumentSizeExceeded(type: type, message: message),
  'OpsItemAlreadyExistsException': (type, message) =>
      OpsItemAlreadyExistsException(type: type, message: message),
  'OpsItemInvalidParameterException': (type, message) =>
      OpsItemInvalidParameterException(type: type, message: message),
  'OpsItemLimitExceededException': (type, message) =>
      OpsItemLimitExceededException(type: type, message: message),
  'OpsItemNotFoundException': (type, message) =>
      OpsItemNotFoundException(type: type, message: message),
  'OpsMetadataAlreadyExistsException': (type, message) =>
      OpsMetadataAlreadyExistsException(type: type, message: message),
  'OpsMetadataInvalidArgumentException': (type, message) =>
      OpsMetadataInvalidArgumentException(type: type, message: message),
  'OpsMetadataKeyLimitExceededException': (type, message) =>
      OpsMetadataKeyLimitExceededException(type: type, message: message),
  'OpsMetadataLimitExceededException': (type, message) =>
      OpsMetadataLimitExceededException(type: type, message: message),
  'OpsMetadataNotFoundException': (type, message) =>
      OpsMetadataNotFoundException(type: type, message: message),
  'OpsMetadataTooManyUpdatesException': (type, message) =>
      OpsMetadataTooManyUpdatesException(type: type, message: message),
  'ParameterAlreadyExists': (type, message) =>
      ParameterAlreadyExists(type: type, message: message),
  'ParameterLimitExceeded': (type, message) =>
      ParameterLimitExceeded(type: type, message: message),
  'ParameterMaxVersionLimitExceeded': (type, message) =>
      ParameterMaxVersionLimitExceeded(type: type, message: message),
  'ParameterNotFound': (type, message) =>
      ParameterNotFound(type: type, message: message),
  'ParameterPatternMismatchException': (type, message) =>
      ParameterPatternMismatchException(type: type, message: message),
  'ParameterVersionLabelLimitExceeded': (type, message) =>
      ParameterVersionLabelLimitExceeded(type: type, message: message),
  'ParameterVersionNotFound': (type, message) =>
      ParameterVersionNotFound(type: type, message: message),
  'PoliciesLimitExceededException': (type, message) =>
      PoliciesLimitExceededException(type: type, message: message),
  'ResourceDataSyncAlreadyExistsException': (type, message) =>
      ResourceDataSyncAlreadyExistsException(type: type, message: message),
  'ResourceDataSyncConflictException': (type, message) =>
      ResourceDataSyncConflictException(type: type, message: message),
  'ResourceDataSyncCountExceededException': (type, message) =>
      ResourceDataSyncCountExceededException(type: type, message: message),
  'ResourceDataSyncInvalidConfigurationException': (type, message) =>
      ResourceDataSyncInvalidConfigurationException(
          type: type, message: message),
  'ResourceDataSyncNotFoundException': (type, message) =>
      ResourceDataSyncNotFoundException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ServiceSettingNotFound': (type, message) =>
      ServiceSettingNotFound(type: type, message: message),
  'StatusUnchanged': (type, message) =>
      StatusUnchanged(type: type, message: message),
  'SubTypeCountLimitExceededException': (type, message) =>
      SubTypeCountLimitExceededException(type: type, message: message),
  'TargetInUseException': (type, message) =>
      TargetInUseException(type: type, message: message),
  'TargetNotConnected': (type, message) =>
      TargetNotConnected(type: type, message: message),
  'TooManyTagsError': (type, message) =>
      TooManyTagsError(type: type, message: message),
  'TooManyUpdates': (type, message) =>
      TooManyUpdates(type: type, message: message),
  'TotalSizeLimitExceededException': (type, message) =>
      TotalSizeLimitExceededException(type: type, message: message),
  'UnsupportedCalendarException': (type, message) =>
      UnsupportedCalendarException(type: type, message: message),
  'UnsupportedFeatureRequiredException': (type, message) =>
      UnsupportedFeatureRequiredException(type: type, message: message),
  'UnsupportedInventoryItemContextException': (type, message) =>
      UnsupportedInventoryItemContextException(type: type, message: message),
  'UnsupportedInventorySchemaVersionException': (type, message) =>
      UnsupportedInventorySchemaVersionException(type: type, message: message),
  'UnsupportedOperatingSystem': (type, message) =>
      UnsupportedOperatingSystem(type: type, message: message),
  'UnsupportedParameterType': (type, message) =>
      UnsupportedParameterType(type: type, message: message),
  'UnsupportedPlatformType': (type, message) =>
      UnsupportedPlatformType(type: type, message: message),
};
