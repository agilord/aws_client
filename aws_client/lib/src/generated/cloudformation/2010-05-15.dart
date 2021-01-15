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

import '2010-05-15.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

part '2010-05-15.g.dart';

/// AWS CloudFormation allows you to create and manage AWS infrastructure
/// deployments predictably and repeatedly. You can use AWS CloudFormation to
/// leverage AWS products, such as Amazon Elastic Compute Cloud, Amazon Elastic
/// Block Store, Amazon Simple Notification Service, Elastic Load Balancing, and
/// Auto Scaling to build highly-reliable, highly scalable, cost-effective
/// applications without creating or configuring the underlying AWS
/// infrastructure.
class CloudFormation {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  CloudFormation({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudformation',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Cancels an update on the specified stack. If the call completes
  /// successfully, the stack rolls back the update and reverts to the previous
  /// stack configuration.
  /// <note>
  /// You can cancel only stacks that are in the UPDATE_IN_PROGRESS state.
  /// </note>
  ///
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>CancelUpdateStack</code> request.
  /// Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to cancel an update on a
  /// stack with the same name. You might retry <code>CancelUpdateStack</code>
  /// requests to ensure that AWS CloudFormation successfully received them.
  Future<void> cancelUpdateStack({
    @_s.required String stackName,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    await _protocol.send(
      $request,
      action: 'CancelUpdateStack',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CancelUpdateStackInput'],
      shapes: shapes,
    );
  }

  /// For a specified stack that is in the <code>UPDATE_ROLLBACK_FAILED</code>
  /// state, continues rolling it back to the
  /// <code>UPDATE_ROLLBACK_COMPLETE</code> state. Depending on the cause of the
  /// failure, you can manually <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed">
  /// fix the error</a> and continue the rollback. By continuing the rollback,
  /// you can return your stack to a working state (the
  /// <code>UPDATE_ROLLBACK_COMPLETE</code> state), and then try to update the
  /// stack again.
  ///
  /// A stack goes into the <code>UPDATE_ROLLBACK_FAILED</code> state when AWS
  /// CloudFormation cannot roll back all changes after a failed stack update.
  /// For example, you might have a stack that is rolling back to an old
  /// database instance that was deleted outside of AWS CloudFormation. Because
  /// AWS CloudFormation doesn't know the database was deleted, it assumes that
  /// the database instance still exists and attempts to roll back to it,
  /// causing the update rollback to fail.
  ///
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [stackName] :
  /// The name or the unique ID of the stack that you want to continue rolling
  /// back.
  /// <note>
  /// Don't specify the name of a nested stack (a stack that was created by
  /// using the <code>AWS::CloudFormation::Stack</code> resource). Instead, use
  /// this operation on the parent stack (the stack that contains the
  /// <code>AWS::CloudFormation::Stack</code> resource).
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>ContinueUpdateRollback</code> request.
  /// Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to continue the rollback
  /// to a stack with the same name. You might retry
  /// <code>ContinueUpdateRollback</code> requests to ensure that AWS
  /// CloudFormation successfully received them.
  ///
  /// Parameter [resourcesToSkip] :
  /// A list of the logical IDs of the resources that AWS CloudFormation skips
  /// during the continue update rollback operation. You can specify only
  /// resources that are in the <code>UPDATE_FAILED</code> state because a
  /// rollback failed. You can't specify resources that are in the
  /// <code>UPDATE_FAILED</code> state for other reasons, for example, because
  /// an update was cancelled. To check why a resource update failed, use the
  /// <a>DescribeStackResources</a> action, and view the resource status reason.
  /// <important>
  /// Specify this property to skip rolling back resources that AWS
  /// CloudFormation can't successfully roll back. We recommend that you <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed">
  /// troubleshoot</a> resources before skipping them. AWS CloudFormation sets
  /// the status of the specified resources to <code>UPDATE_COMPLETE</code> and
  /// continues to roll back the stack. After the rollback is complete, the
  /// state of the skipped resources will be inconsistent with the state of the
  /// resources in the stack template. Before performing another stack update,
  /// you must update the stack or resources to be consistent with each other.
  /// If you don't, subsequent stack updates might fail, and the stack will
  /// become unrecoverable.
  /// </important>
  /// Specify the minimum number of resources required to successfully roll back
  /// your stack. For example, a failed resource update might cause dependent
  /// resources to fail. In this case, it might not be necessary to skip the
  /// dependent resources.
  ///
  /// To skip resources that are part of nested stacks, use the following
  /// format: <code>NestedStackName.ResourceLogicalID</code>. If you want to
  /// specify the logical ID of a stack resource (<code>Type:
  /// AWS::CloudFormation::Stack</code>) in the <code>ResourcesToSkip</code>
  /// list, then its corresponding embedded stack must be in one of the
  /// following states: <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_COMPLETE</code>, or <code>DELETE_FAILED</code>.
  /// <note>
  /// Don't confuse a child stack's name with its corresponding logical ID
  /// defined in the parent stack. For an example of a continue update rollback
  /// operation with nested stacks, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html#nested-stacks">Using
  /// ResourcesToSkip to recover a nested stacks hierarchy</a>.
  /// </note>
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that AWS CloudFormation assumes to roll back the stack. AWS
  /// CloudFormation uses the role's credentials to make calls on your behalf.
  /// AWS CloudFormation always uses this role for all future operations on the
  /// stack. As long as users have permission to operate on the stack, AWS
  /// CloudFormation uses this role even if the users don't have permission to
  /// pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  Future<void> continueUpdateRollback({
    @_s.required String stackName,
    String clientRequestToken,
    List<String> resourcesToSkip,
    String roleARN,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      20,
      2048,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    resourcesToSkip?.also((arg) => $request['ResourcesToSkip'] = arg);
    roleARN?.also((arg) => $request['RoleARN'] = arg);
    await _protocol.send(
      $request,
      action: 'ContinueUpdateRollback',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ContinueUpdateRollbackInput'],
      shapes: shapes,
      resultWrapper: 'ContinueUpdateRollbackResult',
    );
  }

  /// Creates a list of changes that will be applied to a stack so that you can
  /// review the changes before executing them. You can create a change set for
  /// a stack that doesn't exist or an existing stack. If you create a change
  /// set for a stack that doesn't exist, the change set shows all of the
  /// resources that AWS CloudFormation will create. If you create a change set
  /// for an existing stack, AWS CloudFormation compares the stack's information
  /// with the information that you submit in the change set and lists the
  /// differences. Use change sets to understand which resources AWS
  /// CloudFormation will create or change, and how it will change resources in
  /// an existing stack, before you create or update a stack.
  ///
  /// To create a change set for a stack that doesn't exist, for the
  /// <code>ChangeSetType</code> parameter, specify <code>CREATE</code>. To
  /// create a change set for an existing stack, specify <code>UPDATE</code> for
  /// the <code>ChangeSetType</code> parameter. To create a change set for an
  /// import operation, specify <code>IMPORT</code> for the
  /// <code>ChangeSetType</code> parameter. After the
  /// <code>CreateChangeSet</code> call successfully completes, AWS
  /// CloudFormation starts creating the change set. To check the status of the
  /// change set or to review it, use the <a>DescribeChangeSet</a> action.
  ///
  /// When you are satisfied with the changes the change set will make, execute
  /// the change set by using the <a>ExecuteChangeSet</a> action. AWS
  /// CloudFormation doesn't make changes until you execute the change set.
  ///
  /// To create a change set for the entire stack hierachy, set
  /// <code>IncludeNestedStacks</code> to <code>True</code>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InsufficientCapabilitiesException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [changeSetName] :
  /// The name of the change set. The name must be unique among all change sets
  /// that are associated with the specified stack.
  ///
  /// A change set name can contain only alphanumeric, case sensitive characters
  /// and hyphens. It must start with an alphabetic character and cannot exceed
  /// 128 characters.
  ///
  /// Parameter [stackName] :
  /// The name or the unique ID of the stack for which you are creating a change
  /// set. AWS CloudFormation generates the change set by comparing this stack's
  /// information with the information that you submit, such as a modified
  /// template or different parameter input values.
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack template
  /// contains certain capabilities in order for AWS CloudFormation to create
  /// the stack.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your AWS account; for example, by creating new AWS Identity and Access
  /// Management (IAM) users. For those stacks, you must explicitly acknowledge
  /// this by specifying one of these capabilities.
  ///
  /// The following IAM resources require you to specify either the
  /// <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code>
  /// capability.
  ///
  /// <ul>
  /// <li>
  /// If you have IAM resources, you can specify either capability.
  /// </li>
  /// <li>
  /// If you have IAM resources with custom names, you <i>must</i> specify
  /// <code>CAPABILITY_NAMED_IAM</code>.
  /// </li>
  /// <li>
  /// If you don't specify either of these capabilities, AWS CloudFormation
  /// returns an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">
  /// AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">
  /// AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">
  /// AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">
  /// AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">
  /// AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">
  /// AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">
  /// AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates</a>.
  /// </li>
  /// <li>
  /// <code>CAPABILITY_AUTO_EXPAND</code>
  ///
  /// Some template contain macros. Macros perform custom processing on
  /// templates; this can include simple actions like find-and-replace
  /// operations, all the way to extensive transformations of entire templates.
  /// Because of this, users typically create a change set from the processed
  /// template, so that they can review the changes resulting from the macros
  /// before actually creating the stack. If your stack template contains one or
  /// more macros, and you choose to create a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. This includes the <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by AWS CloudFormation.
  /// <note>
  /// This capacity does not apply to creating change sets, and specifying it
  /// when creating change sets has no effect.
  ///
  /// If you want to create a stack from a stack template that contains macros
  /// <i>and</i> nested stacks, you must create or update the stack directly
  /// from the template using the <a>CreateStack</a> or <a>UpdateStack</a>
  /// action, and specifying this capability.
  /// </note>
  /// For more information on macros, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [changeSetType] :
  /// The type of change set operation. To create a change set for a new stack,
  /// specify <code>CREATE</code>. To create a change set for an existing stack,
  /// specify <code>UPDATE</code>. To create a change set for an import
  /// operation, specify <code>IMPORT</code>.
  ///
  /// If you create a change set for a new stack, AWS Cloudformation creates a
  /// stack with a unique stack ID, but no template or resources. The stack will
  /// be in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-describing-stacks.html#d0e11995">
  /// <code>REVIEW_IN_PROGRESS</code> </a> state until you execute the change
  /// set.
  ///
  /// By default, AWS CloudFormation specifies <code>UPDATE</code>. You can't
  /// use the <code>UPDATE</code> type to create a change set for a new stack or
  /// the <code>CREATE</code> type to create a change set for an existing stack.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this <code>CreateChangeSet</code> request. Specify
  /// this token if you plan to retry requests so that AWS CloudFormation knows
  /// that you're not attempting to create another change set with the same
  /// name. You might retry <code>CreateChangeSet</code> requests to ensure that
  /// AWS CloudFormation successfully received them.
  ///
  /// Parameter [description] :
  /// A description to help you identify this change set.
  ///
  /// Parameter [includeNestedStacks] :
  /// Creates a change set for the all nested stacks specified in the template.
  /// The default behavior of this action is set to <code>False</code>. To
  /// include nested sets in a change set, specify <code>True</code>.
  ///
  /// Parameter [notificationARNs] :
  /// The Amazon Resource Names (ARNs) of Amazon Simple Notification Service
  /// (Amazon SNS) topics that AWS CloudFormation associates with the stack. To
  /// remove all associated notification topics, specify an empty list.
  ///
  /// Parameter [parameters] :
  /// A list of <code>Parameter</code> structures that specify input parameters
  /// for the change set. For more information, see the <a>Parameter</a> data
  /// type.
  ///
  /// Parameter [resourceTypes] :
  /// The template resource types that you have permissions to work with if you
  /// execute this change set, such as <code>AWS::EC2::Instance</code>,
  /// <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>.
  ///
  /// If the list of resource types doesn't include a resource type that you're
  /// updating, the stack update fails. By default, AWS CloudFormation grants
  /// permissions to all resource types. AWS Identity and Access Management
  /// (IAM) uses this parameter for condition keys in IAM policies for AWS
  /// CloudFormation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling
  /// Access with AWS Identity and Access Management</a> in the AWS
  /// CloudFormation User Guide.
  ///
  /// Parameter [resourcesToImport] :
  /// The resources to import into your stack.
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that AWS CloudFormation assumes when executing the change set.
  /// AWS CloudFormation uses the role's credentials to make calls on your
  /// behalf. AWS CloudFormation uses this role for all future operations on the
  /// stack. As long as users have permission to operate on the stack, AWS
  /// CloudFormation uses this role even if the users don't have permission to
  /// pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// Parameter [rollbackConfiguration] :
  /// The rollback triggers for AWS CloudFormation to monitor during stack
  /// creation and updating operations, and for the specified monitoring period
  /// afterwards.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with this stack. AWS CloudFormation also
  /// propagates these tags to resources in the stack. You can specify a maximum
  /// of 50 tags.
  ///
  /// Parameter [templateBody] :
  /// A structure that contains the body of the revised template, with a minimum
  /// length of 1 byte and a maximum length of 51,200 bytes. AWS CloudFormation
  /// generates the change set by comparing this template with the template of
  /// the stack that you specified.
  ///
  /// Conditional: You must specify only <code>TemplateBody</code> or
  /// <code>TemplateURL</code>.
  ///
  /// Parameter [templateURL] :
  /// The location of the file that contains the revised template. The URL must
  /// point to a template (max size: 460,800 bytes) that is located in an S3
  /// bucket. AWS CloudFormation generates the change set by comparing this
  /// template with the stack that you specified.
  ///
  /// Conditional: You must specify only <code>TemplateBody</code> or
  /// <code>TemplateURL</code>.
  ///
  /// Parameter [usePreviousTemplate] :
  /// Whether to reuse the template that is associated with the stack to create
  /// the change set.
  Future<CreateChangeSetOutput> createChangeSet({
    @_s.required String changeSetName,
    @_s.required String stackName,
    List<Capability> capabilities,
    ChangeSetType changeSetType,
    String clientToken,
    String description,
    bool includeNestedStacks,
    List<String> notificationARNs,
    List<Parameter> parameters,
    List<String> resourceTypes,
    List<ResourceToImport> resourcesToImport,
    String roleARN,
    RollbackConfiguration rollbackConfiguration,
    List<Tag> tags,
    String templateBody,
    String templateURL,
    bool usePreviousTemplate,
  }) async {
    ArgumentError.checkNotNull(changeSetName, 'changeSetName');
    _s.validateStringLength(
      'changeSetName',
      changeSetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'changeSetName',
      changeSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      20,
      2048,
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    $request['StackName'] = stackName;
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e?.toValue() ?? '').toList());
    changeSetType?.also((arg) => $request['ChangeSetType'] = arg.toValue());
    clientToken?.also((arg) => $request['ClientToken'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    includeNestedStacks?.also((arg) => $request['IncludeNestedStacks'] = arg);
    notificationARNs?.also((arg) => $request['NotificationARNs'] = arg);
    parameters?.also((arg) => $request['Parameters'] = arg);
    resourceTypes?.also((arg) => $request['ResourceTypes'] = arg);
    resourcesToImport?.also((arg) => $request['ResourcesToImport'] = arg);
    roleARN?.also((arg) => $request['RoleARN'] = arg);
    rollbackConfiguration
        ?.also((arg) => $request['RollbackConfiguration'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    usePreviousTemplate?.also((arg) => $request['UsePreviousTemplate'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateChangeSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateChangeSetInput'],
      shapes: shapes,
      resultWrapper: 'CreateChangeSetResult',
    );
    return CreateChangeSetOutput.fromXml($result);
  }

  /// Creates a stack as specified in the template. After the call completes
  /// successfully, the stack creation starts. You can check the status of the
  /// stack via the <a>DescribeStacks</a> API.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  /// May throw [TokenAlreadyExistsException].
  /// May throw [InsufficientCapabilitiesException].
  ///
  /// Parameter [stackName] :
  /// The name that is associated with the stack. The name must be unique in the
  /// Region in which you are creating the stack.
  /// <note>
  /// A stack name can contain only alphanumeric characters (case sensitive) and
  /// hyphens. It must start with an alphabetic character and cannot be longer
  /// than 128 characters.
  /// </note>
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack template
  /// contains certain capabilities in order for AWS CloudFormation to create
  /// the stack.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your AWS account; for example, by creating new AWS Identity and Access
  /// Management (IAM) users. For those stacks, you must explicitly acknowledge
  /// this by specifying one of these capabilities.
  ///
  /// The following IAM resources require you to specify either the
  /// <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code>
  /// capability.
  ///
  /// <ul>
  /// <li>
  /// If you have IAM resources, you can specify either capability.
  /// </li>
  /// <li>
  /// If you have IAM resources with custom names, you <i>must</i> specify
  /// <code>CAPABILITY_NAMED_IAM</code>.
  /// </li>
  /// <li>
  /// If you don't specify either of these capabilities, AWS CloudFormation
  /// returns an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">
  /// AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">
  /// AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">
  /// AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">
  /// AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">
  /// AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">
  /// AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">
  /// AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates</a>.
  /// </li>
  /// <li>
  /// <code>CAPABILITY_AUTO_EXPAND</code>
  ///
  /// Some template contain macros. Macros perform custom processing on
  /// templates; this can include simple actions like find-and-replace
  /// operations, all the way to extensive transformations of entire templates.
  /// Because of this, users typically create a change set from the processed
  /// template, so that they can review the changes resulting from the macros
  /// before actually creating the stack. If your stack template contains one or
  /// more macros, and you choose to create a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. This includes the <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by AWS CloudFormation.
  ///
  /// If you want to create a stack from a stack template that contains macros
  /// <i>and</i> nested stacks, you must create the stack directly from the
  /// template using this capability.
  /// <important>
  /// You should only create stacks directly from a stack template that contains
  /// macros if you know what processing the macro performs.
  ///
  /// Each macro relies on an underlying Lambda service function for processing
  /// stack templates. Be aware that the Lambda function owner can update the
  /// function operation without AWS CloudFormation being notified.
  /// </important>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>CreateStack</code> request. Specify
  /// this token if you plan to retry requests so that AWS CloudFormation knows
  /// that you're not attempting to create a stack with the same name. You might
  /// retry <code>CreateStack</code> requests to ensure that AWS CloudFormation
  /// successfully received them.
  ///
  /// All events triggered by a given stack operation are assigned the same
  /// client request token, which you can use to track operations. For example,
  /// if you execute a <code>CreateStack</code> operation with the token
  /// <code>token1</code>, then all the <code>StackEvents</code> generated by
  /// that operation will have <code>ClientRequestToken</code> set as
  /// <code>token1</code>.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format <i>Console-StackOperation-ID</i>, which helps you easily
  /// identify the stack operation . For example, if you create a stack using
  /// the console, each stack event would be assigned the same token in the
  /// following format:
  /// <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>.
  ///
  /// Parameter [disableRollback] :
  /// Set to <code>true</code> to disable rollback of the stack if stack
  /// creation failed. You can specify either <code>DisableRollback</code> or
  /// <code>OnFailure</code>, but not both.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [enableTerminationProtection] :
  /// Whether to enable termination protection on the specified stack. If a user
  /// attempts to delete a stack with termination protection enabled, the
  /// operation fails and the stack remains unchanged. For more information, see
  /// <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting
  /// a Stack From Being Deleted</a> in the <i>AWS CloudFormation User
  /// Guide</i>. Termination protection is disabled on stacks by default.
  ///
  /// For <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested
  /// stacks</a>, termination protection is set on the root stack and cannot be
  /// changed directly on the nested stack.
  ///
  /// Parameter [notificationARNs] :
  /// The Simple Notification Service (SNS) topic ARNs to publish stack related
  /// events. You can find your SNS topic ARNs using the SNS console or your
  /// Command Line Interface (CLI).
  ///
  /// Parameter [onFailure] :
  /// Determines what action will be taken if stack creation fails. This must be
  /// one of: DO_NOTHING, ROLLBACK, or DELETE. You can specify either
  /// <code>OnFailure</code> or <code>DisableRollback</code>, but not both.
  ///
  /// Default: <code>ROLLBACK</code>
  ///
  /// Parameter [parameters] :
  /// A list of <code>Parameter</code> structures that specify input parameters
  /// for the stack. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html">Parameter</a>
  /// data type.
  ///
  /// Parameter [resourceTypes] :
  /// The template resource types that you have permissions to work with for
  /// this create stack action, such as <code>AWS::EC2::Instance</code>,
  /// <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>. Use
  /// the following syntax to describe template resource types:
  /// <code>AWS::*</code> (for all AWS resource), <code>Custom::*</code> (for
  /// all custom resources), <code>Custom::<i>logical_ID</i> </code> (for a
  /// specific custom resource), <code>AWS::<i>service_name</i>::*</code> (for
  /// all resources of a particular AWS service), and
  /// <code>AWS::<i>service_name</i>::<i>resource_logical_ID</i> </code> (for a
  /// specific AWS resource).
  ///
  /// If the list of resource types doesn't include a resource that you're
  /// creating, the stack creation fails. By default, AWS CloudFormation grants
  /// permissions to all resource types. AWS Identity and Access Management
  /// (IAM) uses this parameter for AWS CloudFormation-specific condition keys
  /// in IAM policies. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling
  /// Access with AWS Identity and Access Management</a>.
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that AWS CloudFormation assumes to create the stack. AWS
  /// CloudFormation uses the role's credentials to make calls on your behalf.
  /// AWS CloudFormation always uses this role for all future operations on the
  /// stack. As long as users have permission to operate on the stack, AWS
  /// CloudFormation uses this role even if the users don't have permission to
  /// pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// Parameter [rollbackConfiguration] :
  /// The rollback triggers for AWS CloudFormation to monitor during stack
  /// creation and updating operations, and for the specified monitoring period
  /// afterwards.
  ///
  /// Parameter [stackPolicyBody] :
  /// Structure containing the stack policy body. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html">
  /// Prevent Updates to Stack Resources</a> in the <i>AWS CloudFormation User
  /// Guide</i>. You can specify either the <code>StackPolicyBody</code> or the
  /// <code>StackPolicyURL</code> parameter, but not both.
  ///
  /// Parameter [stackPolicyURL] :
  /// Location of a file containing the stack policy. The URL must point to a
  /// policy (maximum size: 16 KB) located in an S3 bucket in the same Region as
  /// the stack. You can specify either the <code>StackPolicyBody</code> or the
  /// <code>StackPolicyURL</code> parameter, but not both.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with this stack. AWS CloudFormation also
  /// propagates these tags to the resources created in the stack. A maximum
  /// number of 50 tags can be specified.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the <code>TemplateBody</code> or the
  /// <code>TemplateURL</code> parameter, but not both.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template (max size: 460,800 bytes) that is located in an Amazon S3 bucket.
  /// For more information, go to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the <code>TemplateBody</code> or the
  /// <code>TemplateURL</code> parameter, but not both.
  ///
  /// Parameter [timeoutInMinutes] :
  /// The amount of time that can pass before the stack status becomes
  /// CREATE_FAILED; if <code>DisableRollback</code> is not set or is set to
  /// <code>false</code>, the stack will be rolled back.
  Future<CreateStackOutput> createStack({
    @_s.required String stackName,
    List<Capability> capabilities,
    String clientRequestToken,
    bool disableRollback,
    bool enableTerminationProtection,
    List<String> notificationARNs,
    OnFailure onFailure,
    List<Parameter> parameters,
    List<String> resourceTypes,
    String roleARN,
    RollbackConfiguration rollbackConfiguration,
    String stackPolicyBody,
    String stackPolicyURL,
    List<Tag> tags,
    String templateBody,
    String templateURL,
    int timeoutInMinutes,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      20,
      2048,
    );
    _s.validateStringLength(
      'stackPolicyBody',
      stackPolicyBody,
      1,
      16384,
    );
    _s.validateStringLength(
      'stackPolicyURL',
      stackPolicyURL,
      1,
      1350,
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    _s.validateNumRange(
      'timeoutInMinutes',
      timeoutInMinutes,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e?.toValue() ?? '').toList());
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    disableRollback?.also((arg) => $request['DisableRollback'] = arg);
    enableTerminationProtection
        ?.also((arg) => $request['EnableTerminationProtection'] = arg);
    notificationARNs?.also((arg) => $request['NotificationARNs'] = arg);
    onFailure?.also((arg) => $request['OnFailure'] = arg.toValue());
    parameters?.also((arg) => $request['Parameters'] = arg);
    resourceTypes?.also((arg) => $request['ResourceTypes'] = arg);
    roleARN?.also((arg) => $request['RoleARN'] = arg);
    rollbackConfiguration
        ?.also((arg) => $request['RollbackConfiguration'] = arg);
    stackPolicyBody?.also((arg) => $request['StackPolicyBody'] = arg);
    stackPolicyURL?.also((arg) => $request['StackPolicyURL'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    timeoutInMinutes?.also((arg) => $request['TimeoutInMinutes'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateStack',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateStackInput'],
      shapes: shapes,
      resultWrapper: 'CreateStackResult',
    );
    return CreateStackOutput.fromXml($result);
  }

  /// Creates stack instances for the specified accounts, within the specified
  /// Regions. A stack instance refers to a stack in a specific account and
  /// Region. You must specify at least one value for either
  /// <code>Accounts</code> or <code>DeploymentTargets</code>, and you must
  /// specify at least one value for <code>Regions</code>.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationInProgressException].
  /// May throw [OperationIdAlreadyExistsException].
  /// May throw [StaleRequestException].
  /// May throw [InvalidOperationException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [regions] :
  /// The names of one or more Regions where you want to create stack instances
  /// using the specified AWS account(s).
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to create stack
  /// instances from.
  ///
  /// Parameter [accounts] :
  /// [<code>Self-managed</code> permissions] The names of one or more AWS
  /// accounts that you want to create stack instances in the specified
  /// Region(s) for.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [deploymentTargets] :
  /// [<code>Service-managed</code> permissions] The AWS Organizations accounts
  /// for which to create stack instances in the specified Regions.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [operationId] :
  /// The unique identifier for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is <code>OUTDATED</code>.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how AWS CloudFormation performs this stack set operation.
  ///
  /// Parameter [parameterOverrides] :
  /// A list of stack set parameters whose values you want to override in the
  /// selected stack instances.
  ///
  /// Any overridden parameter values will be applied to all stack instances in
  /// the specified accounts and Regions. When specifying parameters and their
  /// values, be aware of how AWS CloudFormation sets parameter values during
  /// stack instance operations:
  ///
  /// <ul>
  /// <li>
  /// To override the current value for a parameter, include the parameter and
  /// specify its value.
  /// </li>
  /// <li>
  /// To leave a parameter set to its present value, you can do one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Do not include the parameter in the list.
  /// </li>
  /// <li>
  /// Include the parameter and specify <code>UsePreviousValue</code> as
  /// <code>true</code>. (You cannot specify both a value and set
  /// <code>UsePreviousValue</code> to <code>true</code>.)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// To set all overridden parameter back to the values specified in the stack
  /// set, specify a parameter list but do not include any parameters.
  /// </li>
  /// <li>
  /// To leave all parameters set to their present values, do not specify this
  /// property at all.
  /// </li>
  /// </ul>
  /// During stack set updates, any parameter values overridden for a stack
  /// instance are not updated, but retain their overridden value.
  ///
  /// You can only override the parameter <i>values</i> that are specified in
  /// the stack set; to add or delete a parameter itself, use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a>
  /// to update the stack set template.
  Future<CreateStackInstancesOutput> createStackInstances({
    @_s.required List<String> regions,
    @_s.required String stackSetName,
    List<String> accounts,
    DeploymentTargets deploymentTargets,
    String operationId,
    StackSetOperationPreferences operationPreferences,
    List<Parameter> parameterOverrides,
  }) async {
    ArgumentError.checkNotNull(regions, 'regions');
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    final $request = <String, dynamic>{};
    $request['Regions'] = regions;
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    deploymentTargets?.also((arg) => $request['DeploymentTargets'] = arg);
    $request['OperationId'] = operationId ?? _s.generateIdempotencyToken();
    operationPreferences?.also((arg) => $request['OperationPreferences'] = arg);
    parameterOverrides?.also((arg) => $request['ParameterOverrides'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateStackInstances',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateStackInstancesInput'],
      shapes: shapes,
      resultWrapper: 'CreateStackInstancesResult',
    );
    return CreateStackInstancesOutput.fromXml($result);
  }

  /// Creates a stack set.
  ///
  /// May throw [NameAlreadyExistsException].
  /// May throw [CreatedButModifiedException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [stackSetName] :
  /// The name to associate with the stack set. The name must be unique in the
  /// Region where you create your stack set.
  /// <note>
  /// A stack name can contain only alphanumeric characters (case-sensitive) and
  /// hyphens. It must start with an alphabetic character and can't be longer
  /// than 128 characters.
  /// </note>
  ///
  /// Parameter [administrationRoleARN] :
  /// The Amazon Resource Number (ARN) of the IAM role to use to create this
  /// stack set.
  ///
  /// Specify an IAM role only if you are using customized administrator roles
  /// to control which users or groups can manage specific stack sets within the
  /// same administrator account. For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Prerequisites:
  /// Granting Permissions for Stack Set Operations</a> in the <i>AWS
  /// CloudFormation User Guide</i>.
  ///
  /// Parameter [autoDeployment] :
  /// Describes whether StackSets automatically deploys to AWS Organizations
  /// accounts that are added to the target organization or organizational unit
  /// (OU). Specify only if <code>PermissionModel</code> is
  /// <code>SERVICE_MANAGED</code>.
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack set
  /// template contains certain capabilities in order for AWS CloudFormation to
  /// create the stack set and related stack instances.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your AWS account; for example, by creating new AWS Identity and Access
  /// Management (IAM) users. For those stack sets, you must explicitly
  /// acknowledge this by specifying one of these capabilities.
  ///
  /// The following IAM resources require you to specify either the
  /// <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code>
  /// capability.
  ///
  /// <ul>
  /// <li>
  /// If you have IAM resources, you can specify either capability.
  /// </li>
  /// <li>
  /// If you have IAM resources with custom names, you <i>must</i> specify
  /// <code>CAPABILITY_NAMED_IAM</code>.
  /// </li>
  /// <li>
  /// If you don't specify either of these capabilities, AWS CloudFormation
  /// returns an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">
  /// AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">
  /// AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">
  /// AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">
  /// AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">
  /// AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">
  /// AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">
  /// AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates</a>.
  /// </li>
  /// <li>
  /// <code>CAPABILITY_AUTO_EXPAND</code>
  ///
  /// Some templates contain macros. If your stack template contains one or more
  /// macros, and you choose to create a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// <note>
  /// Stack sets do not currently support macros in stack templates. (This
  /// includes the <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by AWS CloudFormation.) Even if you
  /// specify this capability, if you include a macro in your template the stack
  /// set operation will fail.
  /// </note> </li>
  /// </ul>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>CreateStackSet</code> request. Specify
  /// this token if you plan to retry requests so that AWS CloudFormation knows
  /// that you're not attempting to create another stack set with the same name.
  /// You might retry <code>CreateStackSet</code> requests to ensure that AWS
  /// CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// Parameter [description] :
  /// A description of the stack set. You can use the description to identify
  /// the stack set's purpose or other important information.
  ///
  /// Parameter [executionRoleName] :
  /// The name of the IAM execution role to use to create the stack set. If you
  /// do not specify an execution role, AWS CloudFormation uses the
  /// <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set
  /// operation.
  ///
  /// Specify an IAM role only if you are using customized execution roles to
  /// control which stack resources users and groups can include in their stack
  /// sets.
  ///
  /// Parameter [parameters] :
  /// The input parameters for the stack set template.
  ///
  /// Parameter [permissionModel] :
  /// Describes how the IAM roles required for stack set operations are created.
  /// By default, <code>SELF-MANAGED</code> is specified.
  ///
  /// <ul>
  /// <li>
  /// With <code>self-managed</code> permissions, you must create the
  /// administrator and execution roles required to deploy to target accounts.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant
  /// Self-Managed Stack Set Permissions</a>.
  /// </li>
  /// <li>
  /// With <code>service-managed</code> permissions, StackSets automatically
  /// creates the IAM roles required to deploy to accounts managed by AWS
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with this stack set and the stacks
  /// created from it. AWS CloudFormation also propagates these tags to
  /// supported resources that are created in the stacks. A maximum number of 50
  /// tags can be specified.
  ///
  /// If you specify tags as part of a <code>CreateStackSet</code> action, AWS
  /// CloudFormation checks to see if you have the required IAM permission to
  /// tag resources. If you don't, the entire <code>CreateStackSet</code> action
  /// fails with an <code>access denied</code> error, and the stack set is not
  /// created.
  ///
  /// Parameter [templateBody] :
  /// The structure that contains the template body, with a minimum length of 1
  /// byte and a maximum length of 51,200 bytes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the TemplateBody or the TemplateURL
  /// parameter, but not both.
  ///
  /// Parameter [templateURL] :
  /// The location of the file that contains the template body. The URL must
  /// point to a template (maximum size: 460,800 bytes) that's located in an
  /// Amazon S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the TemplateBody or the TemplateURL
  /// parameter, but not both.
  Future<CreateStackSetOutput> createStackSet({
    @_s.required String stackSetName,
    String administrationRoleARN,
    AutoDeployment autoDeployment,
    List<Capability> capabilities,
    String clientRequestToken,
    String description,
    String executionRoleName,
    List<Parameter> parameters,
    PermissionModels permissionModel,
    List<Tag> tags,
    String templateBody,
    String templateURL,
  }) async {
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateStringLength(
      'administrationRoleARN',
      administrationRoleARN,
      20,
      2048,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'executionRoleName',
      executionRoleName,
      1,
      64,
    );
    _s.validateStringPattern(
      'executionRoleName',
      executionRoleName,
      r'''[a-zA-Z_0-9+=,.@-]+''',
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    administrationRoleARN
        ?.also((arg) => $request['AdministrationRoleARN'] = arg);
    autoDeployment?.also((arg) => $request['AutoDeployment'] = arg);
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e?.toValue() ?? '').toList());
    $request['ClientRequestToken'] =
        clientRequestToken ?? _s.generateIdempotencyToken();
    description?.also((arg) => $request['Description'] = arg);
    executionRoleName?.also((arg) => $request['ExecutionRoleName'] = arg);
    parameters?.also((arg) => $request['Parameters'] = arg);
    permissionModel?.also((arg) => $request['PermissionModel'] = arg.toValue());
    tags?.also((arg) => $request['Tags'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateStackSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateStackSetInput'],
      shapes: shapes,
      resultWrapper: 'CreateStackSetResult',
    );
    return CreateStackSetOutput.fromXml($result);
  }

  /// Deletes the specified change set. Deleting change sets ensures that no one
  /// executes the wrong change set.
  ///
  /// If the call successfully completes, AWS CloudFormation successfully
  /// deleted the change set.
  ///
  /// If <code>IncludeNestedStacks</code> specifies <code>True</code> during the
  /// creation of the nested change set, then <code>DeleteChangeSet</code> will
  /// delete all change sets that belong to the stacks hierarchy and will also
  /// delete all change sets for nested stacks with the status of
  /// <code>REVIEW_IN_PROGRESS</code>.
  ///
  /// May throw [InvalidChangeSetStatusException].
  ///
  /// Parameter [changeSetName] :
  /// The name or Amazon Resource Name (ARN) of the change set that you want to
  /// delete.
  ///
  /// Parameter [stackName] :
  /// If you specified the name of a change set to delete, specify the stack
  /// name or ID (ARN) that is associated with it.
  Future<void> deleteChangeSet({
    @_s.required String changeSetName,
    String stackName,
  }) async {
    ArgumentError.checkNotNull(changeSetName, 'changeSetName');
    _s.validateStringLength(
      'changeSetName',
      changeSetName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'changeSetName',
      changeSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
    );
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    stackName?.also((arg) => $request['StackName'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteChangeSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteChangeSetInput'],
      shapes: shapes,
      resultWrapper: 'DeleteChangeSetResult',
    );
  }

  /// Deletes a specified stack. Once the call completes successfully, stack
  /// deletion starts. Deleted stacks do not show up in the
  /// <a>DescribeStacks</a> API if the deletion has been completed successfully.
  ///
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>DeleteStack</code> request. Specify
  /// this token if you plan to retry requests so that AWS CloudFormation knows
  /// that you're not attempting to delete a stack with the same name. You might
  /// retry <code>DeleteStack</code> requests to ensure that AWS CloudFormation
  /// successfully received them.
  ///
  /// All events triggered by a given stack operation are assigned the same
  /// client request token, which you can use to track operations. For example,
  /// if you execute a <code>CreateStack</code> operation with the token
  /// <code>token1</code>, then all the <code>StackEvents</code> generated by
  /// that operation will have <code>ClientRequestToken</code> set as
  /// <code>token1</code>.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format <i>Console-StackOperation-ID</i>, which helps you easily
  /// identify the stack operation . For example, if you create a stack using
  /// the console, each stack event would be assigned the same token in the
  /// following format:
  /// <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>.
  ///
  /// Parameter [retainResources] :
  /// For stacks in the <code>DELETE_FAILED</code> state, a list of resource
  /// logical IDs that are associated with the resources you want to retain.
  /// During deletion, AWS CloudFormation deletes the stack but does not delete
  /// the retained resources.
  ///
  /// Retaining resources is useful when you cannot delete a resource, such as a
  /// non-empty S3 bucket, but you want to delete the stack.
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that AWS CloudFormation assumes to delete the stack. AWS
  /// CloudFormation uses the role's credentials to make calls on your behalf.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  Future<void> deleteStack({
    @_s.required String stackName,
    String clientRequestToken,
    List<String> retainResources,
    String roleARN,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      20,
      2048,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    retainResources?.also((arg) => $request['RetainResources'] = arg);
    roleARN?.also((arg) => $request['RoleARN'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteStack',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteStackInput'],
      shapes: shapes,
    );
  }

  /// Deletes stack instances for the specified accounts, in the specified
  /// Regions.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationInProgressException].
  /// May throw [OperationIdAlreadyExistsException].
  /// May throw [StaleRequestException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [regions] :
  /// The Regions where you want to delete stack set instances.
  ///
  /// Parameter [retainStacks] :
  /// Removes the stack instances from the specified stack set, but doesn't
  /// delete the stacks. You can't reassociate a retained stack or add an
  /// existing, saved stack to a new stack set.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
  /// set operation options</a>.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to delete stack
  /// instances for.
  ///
  /// Parameter [accounts] :
  /// [<code>Self-managed</code> permissions] The names of the AWS accounts that
  /// you want to delete stack instances for.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [deploymentTargets] :
  /// [<code>Service-managed</code> permissions] The AWS Organizations accounts
  /// from which to delete stack instances.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [operationId] :
  /// The unique identifier for this stack set operation.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You can retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is <code>OUTDATED</code>.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how AWS CloudFormation performs this stack set operation.
  Future<DeleteStackInstancesOutput> deleteStackInstances({
    @_s.required List<String> regions,
    @_s.required bool retainStacks,
    @_s.required String stackSetName,
    List<String> accounts,
    DeploymentTargets deploymentTargets,
    String operationId,
    StackSetOperationPreferences operationPreferences,
  }) async {
    ArgumentError.checkNotNull(regions, 'regions');
    ArgumentError.checkNotNull(retainStacks, 'retainStacks');
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    final $request = <String, dynamic>{};
    $request['Regions'] = regions;
    $request['RetainStacks'] = retainStacks;
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    deploymentTargets?.also((arg) => $request['DeploymentTargets'] = arg);
    $request['OperationId'] = operationId ?? _s.generateIdempotencyToken();
    operationPreferences?.also((arg) => $request['OperationPreferences'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteStackInstances',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteStackInstancesInput'],
      shapes: shapes,
      resultWrapper: 'DeleteStackInstancesResult',
    );
    return DeleteStackInstancesOutput.fromXml($result);
  }

  /// Deletes a stack set. Before you can delete a stack set, all of its member
  /// stack instances must be deleted. For more information about how to do
  /// this, see <a>DeleteStackInstances</a>.
  ///
  /// May throw [StackSetNotEmptyException].
  /// May throw [OperationInProgressException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you're deleting. You can
  /// obtain this value by running <a>ListStackSets</a>.
  Future<void> deleteStackSet({
    @_s.required String stackSetName,
  }) async {
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    await _protocol.send(
      $request,
      action: 'DeleteStackSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteStackSetInput'],
      shapes: shapes,
      resultWrapper: 'DeleteStackSetResult',
    );
  }

  /// Removes a type or type version from active use in the CloudFormation
  /// registry. If a type or type version is deregistered, it cannot be used in
  /// CloudFormation operations.
  ///
  /// To deregister a type, you must individually deregister all registered
  /// versions of that type. If a type has only a single registered version,
  /// deregistering that version results in the type itself being deregistered.
  ///
  /// You cannot deregister the default version of a type, unless it is the only
  /// registered version of that type, in which case the type itself is
  /// deregistered as well.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [type] :
  /// The kind of type.
  ///
  /// Currently the only valid value is <code>RESOURCE</code>.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [versionId] :
  /// The ID of a specific version of the type. The version ID is the value at
  /// the end of the Amazon Resource Name (ARN) assigned to the type version
  /// when it is registered.
  Future<void> deregisterType({
    String arn,
    RegistryType type,
    String typeName,
    String versionId,
  }) async {
    _s.validateStringLength(
      'arn',
      arn,
      0,
      1024,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:[0-9]{12}:type/.+''',
    );
    _s.validateStringLength(
      'typeName',
      typeName,
      10,
      204,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}''',
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
    );
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[A-Za-z0-9-]+''',
    );
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    versionId?.also((arg) => $request['VersionId'] = arg);
    await _protocol.send(
      $request,
      action: 'DeregisterType',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeregisterTypeInput'],
      shapes: shapes,
      resultWrapper: 'DeregisterTypeResult',
    );
  }

  /// Retrieves your account's AWS CloudFormation limits, such as the maximum
  /// number of stacks that you can create in your account. For more information
  /// about account limits, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html">AWS
  /// CloudFormation Limits</a> in the <i>AWS CloudFormation User Guide</i>.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of limits that you want to
  /// retrieve.
  Future<DescribeAccountLimitsOutput> describeAccountLimits({
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAccountLimits',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAccountLimitsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAccountLimitsResult',
    );
    return DescribeAccountLimitsOutput.fromXml($result);
  }

  /// Returns the inputs for the change set and a list of changes that AWS
  /// CloudFormation will make if you execute the change set. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html">Updating
  /// Stacks Using Change Sets</a> in the AWS CloudFormation User Guide.
  ///
  /// May throw [ChangeSetNotFoundException].
  ///
  /// Parameter [changeSetName] :
  /// The name or Amazon Resource Name (ARN) of the change set that you want to
  /// describe.
  ///
  /// Parameter [nextToken] :
  /// A string (provided by the <a>DescribeChangeSet</a> response output) that
  /// identifies the next page of information that you want to retrieve.
  ///
  /// Parameter [stackName] :
  /// If you specified the name of a change set, specify the stack name or ID
  /// (ARN) of the change set you want to describe.
  Future<DescribeChangeSetOutput> describeChangeSet({
    @_s.required String changeSetName,
    String nextToken,
    String stackName,
  }) async {
    ArgumentError.checkNotNull(changeSetName, 'changeSetName');
    _s.validateStringLength(
      'changeSetName',
      changeSetName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'changeSetName',
      changeSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
    );
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeChangeSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeChangeSetInput'],
      shapes: shapes,
      resultWrapper: 'DescribeChangeSetResult',
    );
    return DescribeChangeSetOutput.fromXml($result);
  }

  /// Returns information about a stack drift detection operation. A stack drift
  /// detection operation detects whether a stack's actual configuration
  /// differs, or has <i>drifted</i>, from it's expected configuration, as
  /// defined in the stack template and any values specified as template
  /// parameters. A stack is considered to have drifted if one or more of its
  /// resources have drifted. For more information on stack and resource drift,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  ///
  /// Use <a>DetectStackDrift</a> to initiate a stack drift detection operation.
  /// <code>DetectStackDrift</code> returns a <code>StackDriftDetectionId</code>
  /// you can use to monitor the progress of the operation using
  /// <code>DescribeStackDriftDetectionStatus</code>. Once the drift detection
  /// operation has completed, use <a>DescribeStackResourceDrifts</a> to return
  /// drift information about the stack and its resources.
  ///
  /// Parameter [stackDriftDetectionId] :
  /// The ID of the drift detection results of this operation.
  ///
  /// AWS CloudFormation generates new results, with a new drift detection ID,
  /// each time this operation is run. However, the number of drift results AWS
  /// CloudFormation retains for any given stack, and for how long, may vary.
  Future<DescribeStackDriftDetectionStatusOutput>
      describeStackDriftDetectionStatus({
    @_s.required String stackDriftDetectionId,
  }) async {
    ArgumentError.checkNotNull(stackDriftDetectionId, 'stackDriftDetectionId');
    _s.validateStringLength(
      'stackDriftDetectionId',
      stackDriftDetectionId,
      1,
      36,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['StackDriftDetectionId'] = stackDriftDetectionId;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackDriftDetectionStatus',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackDriftDetectionStatusInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackDriftDetectionStatusResult',
    );
    return DescribeStackDriftDetectionStatusOutput.fromXml($result);
  }

  /// Returns all stack related events for a specified stack in reverse
  /// chronological order. For more information about a stack's event history,
  /// go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/concept-stack.html">Stacks</a>
  /// in the AWS CloudFormation User Guide.
  /// <note>
  /// You can list events for stacks that have failed to create or have been
  /// deleted by specifying the unique stack identifier (stack ID).
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of events that you want to
  /// retrieve.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack, which
  /// are not always interchangeable:
  ///
  /// <ul>
  /// <li>
  /// Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  /// </li>
  /// <li>
  /// Deleted stacks: You must specify the unique stack ID.
  /// </li>
  /// </ul>
  /// Default: There is no default value.
  Future<DescribeStackEventsOutput> describeStackEvents({
    String nextToken,
    String stackName,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackEvents',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackEventsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackEventsResult',
    );
    return DescribeStackEventsOutput.fromXml($result);
  }

  /// Returns the stack instance that's associated with the specified stack set,
  /// AWS account, and Region.
  ///
  /// For a list of stack instances that are associated with a specific stack
  /// set, use <a>ListStackInstances</a>.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [StackInstanceNotFoundException].
  ///
  /// Parameter [stackInstanceAccount] :
  /// The ID of an AWS account that's associated with this stack instance.
  ///
  /// Parameter [stackInstanceRegion] :
  /// The name of a Region that's associated with this stack instance.
  ///
  /// Parameter [stackSetName] :
  /// The name or the unique stack ID of the stack set that you want to get
  /// stack instance information for.
  Future<DescribeStackInstanceOutput> describeStackInstance({
    @_s.required String stackInstanceAccount,
    @_s.required String stackInstanceRegion,
    @_s.required String stackSetName,
  }) async {
    ArgumentError.checkNotNull(stackInstanceAccount, 'stackInstanceAccount');
    _s.validateStringPattern(
      'stackInstanceAccount',
      stackInstanceAccount,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackInstanceRegion, 'stackInstanceRegion');
    _s.validateStringPattern(
      'stackInstanceRegion',
      stackInstanceRegion,
      r'''^[a-zA-Z0-9-]{1,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    final $request = <String, dynamic>{};
    $request['StackInstanceAccount'] = stackInstanceAccount;
    $request['StackInstanceRegion'] = stackInstanceRegion;
    $request['StackSetName'] = stackSetName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackInstance',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackInstanceInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackInstanceResult',
    );
    return DescribeStackInstanceOutput.fromXml($result);
  }

  /// Returns a description of the specified resource in the specified stack.
  ///
  /// For deleted stacks, DescribeStackResource returns resource information for
  /// up to 90 days after the stack has been deleted.
  ///
  /// Parameter [logicalResourceId] :
  /// The logical name of the resource as specified in the template.
  ///
  /// Default: There is no default value.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack, which
  /// are not always interchangeable:
  ///
  /// <ul>
  /// <li>
  /// Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  /// </li>
  /// <li>
  /// Deleted stacks: You must specify the unique stack ID.
  /// </li>
  /// </ul>
  /// Default: There is no default value.
  Future<DescribeStackResourceOutput> describeStackResource({
    @_s.required String logicalResourceId,
    @_s.required String stackName,
  }) async {
    ArgumentError.checkNotNull(logicalResourceId, 'logicalResourceId');
    ArgumentError.checkNotNull(stackName, 'stackName');
    final $request = <String, dynamic>{};
    $request['LogicalResourceId'] = logicalResourceId;
    $request['StackName'] = stackName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackResource',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackResourceInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackResourceResult',
    );
    return DescribeStackResourceOutput.fromXml($result);
  }

  /// Returns drift information for the resources that have been checked for
  /// drift in the specified stack. This includes actual and expected
  /// configuration values for resources where AWS CloudFormation detects
  /// configuration drift.
  ///
  /// For a given stack, there will be one <code>StackResourceDrift</code> for
  /// each stack resource that has been checked for drift. Resources that have
  /// not yet been checked for drift are not included. Resources that do not
  /// currently support drift detection are not checked, and so not included.
  /// For a list of resources that support drift detection, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>.
  ///
  /// Use <a>DetectStackResourceDrift</a> to detect drift on individual
  /// resources, or <a>DetectStackDrift</a> to detect drift on all supported
  /// resources for a given stack.
  ///
  /// Parameter [stackName] :
  /// The name of the stack for which you want drift information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of stack resource drift results.
  ///
  /// Parameter [stackResourceDriftStatusFilters] :
  /// The resource drift status values to use as filters for the resource drift
  /// results returned.
  ///
  /// <ul>
  /// <li>
  /// <code>DELETED</code>: The resource differs from its expected template
  /// configuration in that the resource has been deleted.
  /// </li>
  /// <li>
  /// <code>MODIFIED</code>: One or more resource properties differ from their
  /// expected template values.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The resources's actual configuration matches its
  /// expected template configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation does not currently return
  /// this value.
  /// </li>
  /// </ul>
  Future<DescribeStackResourceDriftsOutput> describeStackResourceDrifts({
    @_s.required String stackName,
    int maxResults,
    String nextToken,
    List<StackResourceDriftStatus> stackResourceDriftStatusFilters,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackResourceDriftStatusFilters?.also((arg) =>
        $request['StackResourceDriftStatusFilters'] =
            arg.map((e) => e?.toValue() ?? '').toList());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackResourceDrifts',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackResourceDriftsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackResourceDriftsResult',
    );
    return DescribeStackResourceDriftsOutput.fromXml($result);
  }

  /// Returns AWS resource descriptions for running and deleted stacks. If
  /// <code>StackName</code> is specified, all the associated resources that are
  /// part of the stack are returned. If <code>PhysicalResourceId</code> is
  /// specified, the associated resources of the stack that the resource belongs
  /// to are returned.
  /// <note>
  /// Only the first 100 resources will be returned. If your stack has more
  /// resources than this, you should use <code>ListStackResources</code>
  /// instead.
  /// </note>
  /// For deleted stacks, <code>DescribeStackResources</code> returns resource
  /// information for up to 90 days after the stack has been deleted.
  ///
  /// You must specify either <code>StackName</code> or
  /// <code>PhysicalResourceId</code>, but not both. In addition, you can
  /// specify <code>LogicalResourceId</code> to filter the returned result. For
  /// more information about resources, the <code>LogicalResourceId</code> and
  /// <code>PhysicalResourceId</code>, go to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/">AWS
  /// CloudFormation User Guide</a>.
  /// <note>
  /// A <code>ValidationError</code> is returned if you specify both
  /// <code>StackName</code> and <code>PhysicalResourceId</code> in the same
  /// request.
  /// </note>
  ///
  /// Parameter [logicalResourceId] :
  /// The logical name of the resource as specified in the template.
  ///
  /// Default: There is no default value.
  ///
  /// Parameter [physicalResourceId] :
  /// The name or unique identifier that corresponds to a physical instance ID
  /// of a resource supported by AWS CloudFormation.
  ///
  /// For example, for an Amazon Elastic Compute Cloud (EC2) instance,
  /// <code>PhysicalResourceId</code> corresponds to the
  /// <code>InstanceId</code>. You can pass the EC2 <code>InstanceId</code> to
  /// <code>DescribeStackResources</code> to find which stack the instance
  /// belongs to and what other resources are part of the stack.
  ///
  /// Required: Conditional. If you do not specify
  /// <code>PhysicalResourceId</code>, you must specify <code>StackName</code>.
  ///
  /// Default: There is no default value.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack, which
  /// are not always interchangeable:
  ///
  /// <ul>
  /// <li>
  /// Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  /// </li>
  /// <li>
  /// Deleted stacks: You must specify the unique stack ID.
  /// </li>
  /// </ul>
  /// Default: There is no default value.
  ///
  /// Required: Conditional. If you do not specify <code>StackName</code>, you
  /// must specify <code>PhysicalResourceId</code>.
  Future<DescribeStackResourcesOutput> describeStackResources({
    String logicalResourceId,
    String physicalResourceId,
    String stackName,
  }) async {
    final $request = <String, dynamic>{};
    logicalResourceId?.also((arg) => $request['LogicalResourceId'] = arg);
    physicalResourceId?.also((arg) => $request['PhysicalResourceId'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackResources',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackResourcesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackResourcesResult',
    );
    return DescribeStackResourcesOutput.fromXml($result);
  }

  /// Returns the description of the specified stack set.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set whose description you want.
  Future<DescribeStackSetOutput> describeStackSet({
    @_s.required String stackSetName,
  }) async {
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackSetInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackSetResult',
    );
    return DescribeStackSetOutput.fromXml($result);
  }

  /// Returns the description of the specified stack set operation.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationNotFoundException].
  ///
  /// Parameter [operationId] :
  /// The unique ID of the stack set operation.
  ///
  /// Parameter [stackSetName] :
  /// The name or the unique stack ID of the stack set for the stack operation.
  Future<DescribeStackSetOperationOutput> describeStackSetOperation({
    @_s.required String operationId,
    @_s.required String stackSetName,
  }) async {
    ArgumentError.checkNotNull(operationId, 'operationId');
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    final $request = <String, dynamic>{};
    $request['OperationId'] = operationId;
    $request['StackSetName'] = stackSetName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStackSetOperation',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStackSetOperationInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStackSetOperationResult',
    );
    return DescribeStackSetOperationOutput.fromXml($result);
  }

  /// Returns the description for the specified stack; if no stack name was
  /// specified, then it returns the description for all the stacks created.
  /// <note>
  /// If the stack does not exist, an <code>AmazonCloudFormationException</code>
  /// is returned.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of stacks that you want to
  /// retrieve.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack, which
  /// are not always interchangeable:
  ///
  /// <ul>
  /// <li>
  /// Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  /// </li>
  /// <li>
  /// Deleted stacks: You must specify the unique stack ID.
  /// </li>
  /// </ul>
  /// Default: There is no default value.
  Future<DescribeStacksOutput> describeStacks({
    String nextToken,
    String stackName,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStacks',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStacksInput'],
      shapes: shapes,
      resultWrapper: 'DescribeStacksResult',
    );
    return DescribeStacksOutput.fromXml($result);
  }

  /// Returns detailed information about a type that has been registered.
  ///
  /// If you specify a <code>VersionId</code>, <code>DescribeType</code> returns
  /// information about that specific type version. Otherwise, it returns
  /// information about the default type version.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [type] :
  /// The kind of type.
  ///
  /// Currently the only valid value is <code>RESOURCE</code>.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [versionId] :
  /// The ID of a specific version of the type. The version ID is the value at
  /// the end of the Amazon Resource Name (ARN) assigned to the type version
  /// when it is registered.
  ///
  /// If you specify a <code>VersionId</code>, <code>DescribeType</code> returns
  /// information about that specific type version. Otherwise, it returns
  /// information about the default type version.
  Future<DescribeTypeOutput> describeType({
    String arn,
    RegistryType type,
    String typeName,
    String versionId,
  }) async {
    _s.validateStringLength(
      'arn',
      arn,
      0,
      1024,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+''',
    );
    _s.validateStringLength(
      'typeName',
      typeName,
      10,
      204,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}''',
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
    );
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[A-Za-z0-9-]+''',
    );
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    versionId?.also((arg) => $request['VersionId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeType',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTypeInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTypeResult',
    );
    return DescribeTypeOutput.fromXml($result);
  }

  /// Returns information about a type's registration, including its current
  /// status and type and version identifiers.
  ///
  /// When you initiate a registration request using <code> <a>RegisterType</a>
  /// </code>, you can then use <code> <a>DescribeTypeRegistration</a> </code>
  /// to monitor the progress of that registration request.
  ///
  /// Once the registration request has completed, use <code>
  /// <a>DescribeType</a> </code> to return detailed informaiton about a type.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [registrationToken] :
  /// The identifier for this registration request.
  ///
  /// This registration token is generated by CloudFormation when you initiate a
  /// registration request using <code> <a>RegisterType</a> </code>.
  Future<DescribeTypeRegistrationOutput> describeTypeRegistration({
    @_s.required String registrationToken,
  }) async {
    ArgumentError.checkNotNull(registrationToken, 'registrationToken');
    _s.validateStringLength(
      'registrationToken',
      registrationToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'registrationToken',
      registrationToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['RegistrationToken'] = registrationToken;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTypeRegistration',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTypeRegistrationInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTypeRegistrationResult',
    );
    return DescribeTypeRegistrationOutput.fromXml($result);
  }

  /// Detects whether a stack's actual configuration differs, or has
  /// <i>drifted</i>, from it's expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For each
  /// resource in the stack that supports drift detection, AWS CloudFormation
  /// compares the actual configuration of the resource with its expected
  /// template configuration. Only resource properties explicitly defined in the
  /// stack template are checked for drift. A stack is considered to have
  /// drifted if one or more of its resources differ from their expected
  /// template configurations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  ///
  /// Use <code>DetectStackDrift</code> to detect drift on all supported
  /// resources for a given stack, or <a>DetectStackResourceDrift</a> to detect
  /// drift on individual resources.
  ///
  /// For a list of stack resources that currently support drift detection, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>.
  ///
  /// <code>DetectStackDrift</code> can take up to several minutes, depending on
  /// the number of resources contained within the stack. Use
  /// <a>DescribeStackDriftDetectionStatus</a> to monitor the progress of a
  /// detect stack drift operation. Once the drift detection operation has
  /// completed, use <a>DescribeStackResourceDrifts</a> to return drift
  /// information about the stack and its resources.
  ///
  /// When detecting drift on a stack, AWS CloudFormation does not detect drift
  /// on any nested stacks belonging to that stack. Perform
  /// <code>DetectStackDrift</code> directly on the nested stack itself.
  ///
  /// Parameter [stackName] :
  /// The name of the stack for which you want to detect drift.
  ///
  /// Parameter [logicalResourceIds] :
  /// The logical names of any resources you want to use as filters.
  Future<DetectStackDriftOutput> detectStackDrift({
    @_s.required String stackName,
    List<String> logicalResourceIds,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    logicalResourceIds?.also((arg) => $request['LogicalResourceIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DetectStackDrift',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetectStackDriftInput'],
      shapes: shapes,
      resultWrapper: 'DetectStackDriftResult',
    );
    return DetectStackDriftOutput.fromXml($result);
  }

  /// Returns information about whether a resource's actual configuration
  /// differs, or has <i>drifted</i>, from it's expected configuration, as
  /// defined in the stack template and any values specified as template
  /// parameters. This information includes actual and expected property values
  /// for resources in which AWS CloudFormation detects drift. Only resource
  /// properties explicitly defined in the stack template are checked for drift.
  /// For more information about stack and resource drift, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  ///
  /// Use <code>DetectStackResourceDrift</code> to detect drift on individual
  /// resources, or <a>DetectStackDrift</a> to detect drift on all resources in
  /// a given stack that support drift detection.
  ///
  /// Resources that do not currently support drift detection cannot be checked.
  /// For a list of resources that support drift detection, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>.
  ///
  /// Parameter [logicalResourceId] :
  /// The logical name of the resource for which to return drift information.
  ///
  /// Parameter [stackName] :
  /// The name of the stack to which the resource belongs.
  Future<DetectStackResourceDriftOutput> detectStackResourceDrift({
    @_s.required String logicalResourceId,
    @_s.required String stackName,
  }) async {
    ArgumentError.checkNotNull(logicalResourceId, 'logicalResourceId');
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['LogicalResourceId'] = logicalResourceId;
    $request['StackName'] = stackName;
    final $result = await _protocol.send(
      $request,
      action: 'DetectStackResourceDrift',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetectStackResourceDriftInput'],
      shapes: shapes,
      resultWrapper: 'DetectStackResourceDriftResult',
    );
    return DetectStackResourceDriftOutput.fromXml($result);
  }

  /// Detect drift on a stack set. When CloudFormation performs drift detection
  /// on a stack set, it performs drift detection on the stack associated with
  /// each stack instance in the stack set. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">How
  /// CloudFormation Performs Drift Detection on a Stack Set</a>.
  ///
  /// <code>DetectStackSetDrift</code> returns the <code>OperationId</code> of
  /// the stack set drift detection operation. Use this operation id with <code>
  /// <a>DescribeStackSetOperation</a> </code> to monitor the progress of the
  /// drift detection operation. The drift detection operation may take some
  /// time, depending on the number of stack instances included in the stack
  /// set, as well as the number of resources included in each stack.
  ///
  /// Once the operation has completed, use the following actions to return
  /// drift information:
  ///
  /// <ul>
  /// <li>
  /// Use <code> <a>DescribeStackSet</a> </code> to return detailed informaiton
  /// about the stack set, including detailed information about the last
  /// <i>completed</i> drift operation performed on the stack set. (Information
  /// about drift operations that are in progress is not included.)
  /// </li>
  /// <li>
  /// Use <code> <a>ListStackInstances</a> </code> to return a list of stack
  /// instances belonging to the stack set, including the drift status and last
  /// drift time checked of each instance.
  /// </li>
  /// <li>
  /// Use <code> <a>DescribeStackInstance</a> </code> to return detailed
  /// information about a specific stack instance, including its drift status
  /// and last drift time checked.
  /// </li>
  /// </ul>
  /// For more information on performing a drift detection operation on a stack
  /// set, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting
  /// Unmanaged Changes in Stack Sets</a>.
  ///
  /// You can only run a single drift detection operation on a given stack set
  /// at one time.
  ///
  /// To stop a drift detection stack set operation, use <code>
  /// <a>StopStackSetOperation</a> </code>.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [OperationInProgressException].
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name of the stack set on which to perform the drift detection
  /// operation.
  ///
  /// Parameter [operationId] :
  /// <i>The ID of the stack set operation.</i>
  Future<DetectStackSetDriftOutput> detectStackSetDrift({
    @_s.required String stackSetName,
    String operationId,
    StackSetOperationPreferences operationPreferences,
  }) async {
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateStringPattern(
      'stackSetName',
      stackSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*(?::[a-zA-Z0-9]{8}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{12})?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    $request['OperationId'] = operationId ?? _s.generateIdempotencyToken();
    operationPreferences?.also((arg) => $request['OperationPreferences'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DetectStackSetDrift',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetectStackSetDriftInput'],
      shapes: shapes,
      resultWrapper: 'DetectStackSetDriftResult',
    );
    return DetectStackSetDriftOutput.fromXml($result);
  }

  /// Returns the estimated monthly cost of a template. The return value is an
  /// AWS Simple Monthly Calculator URL with a query string that describes the
  /// resources required to run the template.
  ///
  /// Parameter [parameters] :
  /// A list of <code>Parameter</code> structures that specify input parameters.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.)
  ///
  /// Conditional: You must pass <code>TemplateBody</code> or
  /// <code>TemplateURL</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template that is located in an Amazon S3 bucket. For more information, go
  /// to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must pass <code>TemplateURL</code> or
  /// <code>TemplateBody</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  Future<EstimateTemplateCostOutput> estimateTemplateCost({
    List<Parameter> parameters,
    String templateBody,
    String templateURL,
  }) async {
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    parameters?.also((arg) => $request['Parameters'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'EstimateTemplateCost',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EstimateTemplateCostInput'],
      shapes: shapes,
      resultWrapper: 'EstimateTemplateCostResult',
    );
    return EstimateTemplateCostOutput.fromXml($result);
  }

  /// Updates a stack using the input information that was provided when the
  /// specified change set was created. After the call successfully completes,
  /// AWS CloudFormation starts updating the stack. Use the
  /// <a>DescribeStacks</a> action to view the status of the update.
  ///
  /// When you execute a change set, AWS CloudFormation deletes all other change
  /// sets associated with the stack because they aren't valid for the updated
  /// stack.
  ///
  /// If a stack policy is associated with the stack, AWS CloudFormation
  /// enforces the policy during the update. You can't specify a temporary stack
  /// policy that overrides the current policy.
  ///
  /// To create a change set for the entire stack hierachy,
  /// <code>IncludeNestedStacks</code> must have been set to <code>True</code>.
  ///
  /// May throw [InvalidChangeSetStatusException].
  /// May throw [ChangeSetNotFoundException].
  /// May throw [InsufficientCapabilitiesException].
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [changeSetName] :
  /// The name or ARN of the change set that you want use to update the
  /// specified stack.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>ExecuteChangeSet</code> request.
  /// Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to execute a change set to
  /// update a stack with the same name. You might retry
  /// <code>ExecuteChangeSet</code> requests to ensure that AWS CloudFormation
  /// successfully received them.
  ///
  /// Parameter [stackName] :
  /// If you specified the name of a change set, specify the stack name or ID
  /// (ARN) that is associated with the change set you want to execute.
  Future<void> executeChangeSet({
    @_s.required String changeSetName,
    String clientRequestToken,
    String stackName,
  }) async {
    ArgumentError.checkNotNull(changeSetName, 'changeSetName');
    _s.validateStringLength(
      'changeSetName',
      changeSetName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'changeSetName',
      changeSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
    );
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    await _protocol.send(
      $request,
      action: 'ExecuteChangeSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ExecuteChangeSetInput'],
      shapes: shapes,
      resultWrapper: 'ExecuteChangeSetResult',
    );
  }

  /// Returns the stack policy for a specified stack. If a stack doesn't have a
  /// policy, a null value is returned.
  ///
  /// Parameter [stackName] :
  /// The name or unique stack ID that is associated with the stack whose policy
  /// you want to get.
  Future<GetStackPolicyOutput> getStackPolicy({
    @_s.required String stackName,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    final $result = await _protocol.send(
      $request,
      action: 'GetStackPolicy',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetStackPolicyInput'],
      shapes: shapes,
      resultWrapper: 'GetStackPolicyResult',
    );
    return GetStackPolicyOutput.fromXml($result);
  }

  /// Returns the template body for a specified stack. You can get the template
  /// for running or deleted stacks.
  ///
  /// For deleted stacks, GetTemplate returns the template for up to 90 days
  /// after the stack has been deleted.
  /// <note>
  /// If the template does not exist, a <code>ValidationError</code> is
  /// returned.
  /// </note>
  ///
  /// May throw [ChangeSetNotFoundException].
  ///
  /// Parameter [changeSetName] :
  /// The name or Amazon Resource Name (ARN) of a change set for which AWS
  /// CloudFormation returns the associated template. If you specify a name, you
  /// must also specify the <code>StackName</code>.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack, which
  /// are not always interchangeable:
  ///
  /// <ul>
  /// <li>
  /// Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  /// </li>
  /// <li>
  /// Deleted stacks: You must specify the unique stack ID.
  /// </li>
  /// </ul>
  /// Default: There is no default value.
  ///
  /// Parameter [templateStage] :
  /// For templates that include transforms, the stage of the template that AWS
  /// CloudFormation returns. To get the user-submitted template, specify
  /// <code>Original</code>. To get the template after AWS CloudFormation has
  /// processed all transforms, specify <code>Processed</code>.
  ///
  /// If the template doesn't include transforms, <code>Original</code> and
  /// <code>Processed</code> return the same template. By default, AWS
  /// CloudFormation specifies <code>Original</code>.
  Future<GetTemplateOutput> getTemplate({
    String changeSetName,
    String stackName,
    TemplateStage templateStage,
  }) async {
    _s.validateStringLength(
      'changeSetName',
      changeSetName,
      1,
      1600,
    );
    _s.validateStringPattern(
      'changeSetName',
      changeSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*''',
    );
    final $request = <String, dynamic>{};
    changeSetName?.also((arg) => $request['ChangeSetName'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    templateStage?.also((arg) => $request['TemplateStage'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'GetTemplate',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetTemplateInput'],
      shapes: shapes,
      resultWrapper: 'GetTemplateResult',
    );
    return GetTemplateOutput.fromXml($result);
  }

  /// Returns information about a new or existing template. The
  /// <code>GetTemplateSummary</code> action is useful for viewing parameter
  /// information, such as default parameter values and parameter types, before
  /// you create or update a stack or stack set.
  ///
  /// You can use the <code>GetTemplateSummary</code> action when you submit a
  /// template, or you can get template information for a stack set, or a
  /// running or deleted stack.
  ///
  /// For deleted stacks, <code>GetTemplateSummary</code> returns the template
  /// information for up to 90 days after the stack has been deleted. If the
  /// template does not exist, a <code>ValidationError</code> is returned.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackName] :
  /// The name or the stack ID that is associated with the stack, which are not
  /// always interchangeable. For running stacks, you can specify either the
  /// stack's name or its unique stack ID. For deleted stack, you must specify
  /// the unique stack ID.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>StackName</code>, <code>StackSetName</code>,
  /// <code>TemplateBody</code>, or <code>TemplateURL</code>.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set from which the stack was created.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>StackName</code>, <code>StackSetName</code>,
  /// <code>TemplateBody</code>, or <code>TemplateURL</code>.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. For more information about templates,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>StackName</code>, <code>StackSetName</code>,
  /// <code>TemplateBody</code>, or <code>TemplateURL</code>.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template (max size: 460,800 bytes) that is located in an Amazon S3 bucket.
  /// For more information about templates, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>StackName</code>, <code>StackSetName</code>,
  /// <code>TemplateBody</code>, or <code>TemplateURL</code>.
  Future<GetTemplateSummaryOutput> getTemplateSummary({
    String stackName,
    String stackSetName,
    String templateBody,
    String templateURL,
  }) async {
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
    );
    _s.validateStringPattern(
      'stackSetName',
      stackSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*(?::[a-zA-Z0-9]{8}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{12})?''',
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    stackName?.also((arg) => $request['StackName'] = arg);
    stackSetName?.also((arg) => $request['StackSetName'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetTemplateSummary',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetTemplateSummaryInput'],
      shapes: shapes,
      resultWrapper: 'GetTemplateSummaryResult',
    );
    return GetTemplateSummaryOutput.fromXml($result);
  }

  /// Returns the ID and status of each active change set for a stack. For
  /// example, AWS CloudFormation lists change sets that are in the
  /// <code>CREATE_IN_PROGRESS</code> or <code>CREATE_PENDING</code> state.
  ///
  /// Parameter [stackName] :
  /// The name or the Amazon Resource Name (ARN) of the stack for which you want
  /// to list change sets.
  ///
  /// Parameter [nextToken] :
  /// A string (provided by the <a>ListChangeSets</a> response output) that
  /// identifies the next page of change sets that you want to retrieve.
  Future<ListChangeSetsOutput> listChangeSets({
    @_s.required String stackName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListChangeSets',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListChangeSetsInput'],
      shapes: shapes,
      resultWrapper: 'ListChangeSetsResult',
    );
    return ListChangeSetsOutput.fromXml($result);
  }

  /// Lists all exported output values in the account and Region in which you
  /// call this action. Use this action to see the exported output values that
  /// you can import into other stacks. To import values, use the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html">
  /// <code>Fn::ImportValue</code> </a> function.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html">
  /// AWS CloudFormation Export Stack Output Values</a>.
  ///
  /// Parameter [nextToken] :
  /// A string (provided by the <a>ListExports</a> response output) that
  /// identifies the next page of exported output values that you asked to
  /// retrieve.
  Future<ListExportsOutput> listExports({
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListExports',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListExportsInput'],
      shapes: shapes,
      resultWrapper: 'ListExportsResult',
    );
    return ListExportsOutput.fromXml($result);
  }

  /// Lists all stacks that are importing an exported output value. To modify or
  /// remove an exported output value, first use this action to see which stacks
  /// are using it. To see the exported output values in your account, see
  /// <a>ListExports</a>.
  ///
  /// For more information about importing an exported output value, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html">
  /// <code>Fn::ImportValue</code> </a> function.
  ///
  /// Parameter [exportName] :
  /// The name of the exported output value. AWS CloudFormation returns the
  /// stack names that are importing this value.
  ///
  /// Parameter [nextToken] :
  /// A string (provided by the <a>ListImports</a> response output) that
  /// identifies the next page of stacks that are importing the specified
  /// exported output value.
  Future<ListImportsOutput> listImports({
    @_s.required String exportName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(exportName, 'exportName');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['ExportName'] = exportName;
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListImports',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListImportsInput'],
      shapes: shapes,
      resultWrapper: 'ListImportsResult',
    );
    return ListImportsOutput.fromXml($result);
  }

  /// Returns summary information about stack instances that are associated with
  /// the specified stack set. You can filter for stack instances that are
  /// associated with a specific AWS account name or Region, or that have a
  /// specific status.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to list stack
  /// instances for.
  ///
  /// Parameter [filters] :
  /// The status that stack instances are filtered by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous request didn't return all of the remaining results, the
  /// response's <code>NextToken</code> parameter value is set to a token. To
  /// retrieve the next set of results, call <code>ListStackInstances</code>
  /// again and assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [stackInstanceAccount] :
  /// The name of the AWS account that you want to list stack instances for.
  ///
  /// Parameter [stackInstanceRegion] :
  /// The name of the Region where you want to list stack instances.
  Future<ListStackInstancesOutput> listStackInstances({
    @_s.required String stackSetName,
    List<StackInstanceFilter> filters,
    int maxResults,
    String nextToken,
    String stackInstanceAccount,
    String stackInstanceRegion,
  }) async {
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'stackInstanceAccount',
      stackInstanceAccount,
      r'''^[0-9]{12}$''',
    );
    _s.validateStringPattern(
      'stackInstanceRegion',
      stackInstanceRegion,
      r'''^[a-zA-Z0-9-]{1,128}$''',
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    filters?.also((arg) => $request['Filters'] = arg);
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackInstanceAccount?.also((arg) => $request['StackInstanceAccount'] = arg);
    stackInstanceRegion?.also((arg) => $request['StackInstanceRegion'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListStackInstances',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStackInstancesInput'],
      shapes: shapes,
      resultWrapper: 'ListStackInstancesResult',
    );
    return ListStackInstancesOutput.fromXml($result);
  }

  /// Returns descriptions of all resources of the specified stack.
  ///
  /// For deleted stacks, ListStackResources returns resource information for up
  /// to 90 days after the stack has been deleted.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack, which
  /// are not always interchangeable:
  ///
  /// <ul>
  /// <li>
  /// Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  /// </li>
  /// <li>
  /// Deleted stacks: You must specify the unique stack ID.
  /// </li>
  /// </ul>
  /// Default: There is no default value.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of stack resources that you want to
  /// retrieve.
  Future<ListStackResourcesOutput> listStackResources({
    @_s.required String stackName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListStackResources',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStackResourcesInput'],
      shapes: shapes,
      resultWrapper: 'ListStackResourcesResult',
    );
    return ListStackResourcesOutput.fromXml($result);
  }

  /// Returns summary information about the results of a stack set operation.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationNotFoundException].
  ///
  /// Parameter [operationId] :
  /// The ID of the stack set operation.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to get operation
  /// results for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous request didn't return all of the remaining results, the
  /// response object's <code>NextToken</code> parameter value is set to a
  /// token. To retrieve the next set of results, call
  /// <code>ListStackSetOperationResults</code> again and assign that token to
  /// the request object's <code>NextToken</code> parameter. If there are no
  /// remaining results, the previous response object's <code>NextToken</code>
  /// parameter is set to <code>null</code>.
  Future<ListStackSetOperationResultsOutput> listStackSetOperationResults({
    @_s.required String operationId,
    @_s.required String stackSetName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(operationId, 'operationId');
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['OperationId'] = operationId;
    $request['StackSetName'] = stackSetName;
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListStackSetOperationResults',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStackSetOperationResultsInput'],
      shapes: shapes,
      resultWrapper: 'ListStackSetOperationResultsResult',
    );
    return ListStackSetOperationResultsOutput.fromXml($result);
  }

  /// Returns summary information about operations performed on a stack set.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to get operation
  /// summaries for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListStackSetOperations</code> again and assign that token to the
  /// request object's <code>NextToken</code> parameter. If there are no
  /// remaining results, the previous response object's <code>NextToken</code>
  /// parameter is set to <code>null</code>.
  Future<ListStackSetOperationsOutput> listStackSetOperations({
    @_s.required String stackSetName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListStackSetOperations',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStackSetOperationsInput'],
      shapes: shapes,
      resultWrapper: 'ListStackSetOperationsResult',
    );
    return ListStackSetOperationsOutput.fromXml($result);
  }

  /// Returns summary information about stack sets that are associated with the
  /// user.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListStackSets</code> again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If there are no remaining
  /// results, the previous response object's <code>NextToken</code> parameter
  /// is set to <code>null</code>.
  ///
  /// Parameter [status] :
  /// The status of the stack sets that you want to get summary information
  /// about.
  Future<ListStackSetsOutput> listStackSets({
    int maxResults,
    String nextToken,
    StackSetStatus status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    status?.also((arg) => $request['Status'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ListStackSets',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStackSetsInput'],
      shapes: shapes,
      resultWrapper: 'ListStackSetsResult',
    );
    return ListStackSetsOutput.fromXml($result);
  }

  /// Returns the summary information for stacks whose status matches the
  /// specified StackStatusFilter. Summary information for stacks that have been
  /// deleted is kept for 90 days after the stack is deleted. If no
  /// StackStatusFilter is specified, summary information for all stacks is
  /// returned (including existing stacks and stacks that have been deleted).
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of stacks that you want to
  /// retrieve.
  ///
  /// Parameter [stackStatusFilter] :
  /// Stack status to use as a filter. Specify one or more stack status codes to
  /// list only stacks with the specified status codes. For a complete list of
  /// stack status codes, see the <code>StackStatus</code> parameter of the
  /// <a>Stack</a> data type.
  Future<ListStacksOutput> listStacks({
    String nextToken,
    List<StackStatus> stackStatusFilter,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackStatusFilter?.also((arg) => $request['StackStatusFilter'] =
        arg.map((e) => e?.toValue() ?? '').toList());
    final $result = await _protocol.send(
      $request,
      action: 'ListStacks',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStacksInput'],
      shapes: shapes,
      resultWrapper: 'ListStacksResult',
    );
    return ListStacksOutput.fromXml($result);
  }

  /// Returns a list of registration tokens for the specified type(s).
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call this action
  /// again and assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [registrationStatusFilter] :
  /// The current status of the type registration request.
  ///
  /// The default is <code>IN_PROGRESS</code>.
  ///
  /// Parameter [type] :
  /// The kind of type.
  ///
  /// Currently the only valid value is <code>RESOURCE</code>.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeArn] :
  /// The Amazon Resource Name (ARN) of the type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  Future<ListTypeRegistrationsOutput> listTypeRegistrations({
    int maxResults,
    String nextToken,
    RegistrationStatus registrationStatusFilter,
    RegistryType type,
    String typeArn,
    String typeName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'typeArn',
      typeArn,
      0,
      1024,
    );
    _s.validateStringPattern(
      'typeArn',
      typeArn,
      r'''arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+''',
    );
    _s.validateStringLength(
      'typeName',
      typeName,
      10,
      204,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}''',
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    registrationStatusFilter
        ?.also((arg) => $request['RegistrationStatusFilter'] = arg.toValue());
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeArn?.also((arg) => $request['TypeArn'] = arg);
    typeName?.also((arg) => $request['TypeName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListTypeRegistrations',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTypeRegistrationsInput'],
      shapes: shapes,
      resultWrapper: 'ListTypeRegistrationsResult',
    );
    return ListTypeRegistrationsOutput.fromXml($result);
  }

  /// Returns summary information about the versions of a type.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the type for which you want version
  /// summary information.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [deprecatedStatus] :
  /// The deprecation status of the type versions that you want to get summary
  /// information about.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>LIVE</code>: The type version is registered and can be used in
  /// CloudFormation operations, dependent on its provisioning behavior and
  /// visibility scope.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code>: The type version has been deregistered and can no
  /// longer be used in CloudFormation operations.
  /// </li>
  /// </ul>
  /// The default is <code>LIVE</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call this action
  /// again and assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [type] :
  /// The kind of the type.
  ///
  /// Currently the only valid value is <code>RESOURCE</code>.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the type for which you want version summary information.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  Future<ListTypeVersionsOutput> listTypeVersions({
    String arn,
    DeprecatedStatus deprecatedStatus,
    int maxResults,
    String nextToken,
    RegistryType type,
    String typeName,
  }) async {
    _s.validateStringLength(
      'arn',
      arn,
      0,
      1024,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:[0-9]{12}:type/.+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'typeName',
      typeName,
      10,
      204,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}''',
    );
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    deprecatedStatus
        ?.also((arg) => $request['DeprecatedStatus'] = arg.toValue());
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListTypeVersions',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTypeVersionsInput'],
      shapes: shapes,
      resultWrapper: 'ListTypeVersionsResult',
    );
    return ListTypeVersionsOutput.fromXml($result);
  }

  /// Returns summary information about types that have been registered with
  /// CloudFormation.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [deprecatedStatus] :
  /// The deprecation status of the types that you want to get summary
  /// information about.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>LIVE</code>: The type is registered for use in CloudFormation
  /// operations.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code>: The type has been deregistered and can no longer
  /// be used in CloudFormation operations.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call this action
  /// again and assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [provisioningType] :
  /// The provisioning behavior of the type. AWS CloudFormation determines the
  /// provisioning type during registration, based on the types of handlers in
  /// the schema handler package submitted.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>FULLY_MUTABLE</code>: The type includes an update handler to process
  /// updates to the type during stack update operations.
  /// </li>
  /// <li>
  /// <code>IMMUTABLE</code>: The type does not include an update handler, so
  /// the type cannot be updated and must instead be replaced during stack
  /// update operations.
  /// </li>
  /// <li>
  /// <code>NON_PROVISIONABLE</code>: The type does not include create, read,
  /// and delete handlers, and therefore cannot actually be provisioned.
  /// </li>
  /// </ul>
  ///
  /// Parameter [type] :
  /// The type of extension.
  ///
  /// Parameter [visibility] :
  /// The scope at which the type is visible and usable in CloudFormation
  /// operations.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>PRIVATE</code>: The type is only visible and usable within the
  /// account in which it is registered. Currently, AWS CloudFormation marks any
  /// types you create as <code>PRIVATE</code>.
  /// </li>
  /// <li>
  /// <code>PUBLIC</code>: The type is publically visible and usable within any
  /// Amazon account.
  /// </li>
  /// </ul>
  /// The default is <code>PRIVATE</code>.
  Future<ListTypesOutput> listTypes({
    DeprecatedStatus deprecatedStatus,
    int maxResults,
    String nextToken,
    ProvisioningType provisioningType,
    RegistryType type,
    Visibility visibility,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    deprecatedStatus
        ?.also((arg) => $request['DeprecatedStatus'] = arg.toValue());
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    provisioningType
        ?.also((arg) => $request['ProvisioningType'] = arg.toValue());
    type?.also((arg) => $request['Type'] = arg.toValue());
    visibility?.also((arg) => $request['Visibility'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ListTypes',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTypesInput'],
      shapes: shapes,
      resultWrapper: 'ListTypesResult',
    );
    return ListTypesOutput.fromXml($result);
  }

  /// Reports progress of a resource handler to CloudFormation.
  ///
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>. Do not use this API in your code.
  ///
  /// May throw [InvalidStateTransitionException].
  /// May throw [OperationStatusCheckFailedException].
  ///
  /// Parameter [bearerToken] :
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>.
  ///
  /// Parameter [operationStatus] :
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>.
  ///
  /// Parameter [clientRequestToken] :
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>.
  ///
  /// Parameter [currentOperationStatus] :
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>.
  ///
  /// Parameter [errorCode] :
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>.
  ///
  /// Parameter [resourceModel] :
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>.
  ///
  /// Parameter [statusMessage] :
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>.
  Future<void> recordHandlerProgress({
    @_s.required String bearerToken,
    @_s.required OperationStatus operationStatus,
    String clientRequestToken,
    OperationStatus currentOperationStatus,
    HandlerErrorCode errorCode,
    String resourceModel,
    String statusMessage,
  }) async {
    ArgumentError.checkNotNull(bearerToken, 'bearerToken');
    _s.validateStringLength(
      'bearerToken',
      bearerToken,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(operationStatus, 'operationStatus');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'resourceModel',
      resourceModel,
      1,
      16384,
    );
    _s.validateStringLength(
      'statusMessage',
      statusMessage,
      0,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['BearerToken'] = bearerToken;
    $request['OperationStatus'] = operationStatus.toValue();
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    currentOperationStatus
        ?.also((arg) => $request['CurrentOperationStatus'] = arg.toValue());
    errorCode?.also((arg) => $request['ErrorCode'] = arg.toValue());
    resourceModel?.also((arg) => $request['ResourceModel'] = arg);
    statusMessage?.also((arg) => $request['StatusMessage'] = arg);
    await _protocol.send(
      $request,
      action: 'RecordHandlerProgress',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RecordHandlerProgressInput'],
      shapes: shapes,
      resultWrapper: 'RecordHandlerProgressResult',
    );
  }

  /// Registers a type with the CloudFormation service. Registering a type makes
  /// it available for use in CloudFormation templates in your AWS account, and
  /// includes:
  ///
  /// <ul>
  /// <li>
  /// Validating the resource schema
  /// </li>
  /// <li>
  /// Determining which handlers have been specified for the resource
  /// </li>
  /// <li>
  /// Making the resource type available for use in your account
  /// </li>
  /// </ul>
  /// For more information on how to develop types and ready them for
  /// registeration, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html">Creating
  /// Resource Providers</a> in the <i>CloudFormation CLI User Guide</i>.
  ///
  /// You can have a maximum of 50 resource type versions registered at a time.
  /// This maximum is per account and per region. Use <a
  /// href="AWSCloudFormation/latest/APIReference/API_DeregisterType.html">DeregisterType</a>
  /// to deregister specific resource type versions if necessary.
  ///
  /// Once you have initiated a registration request using <code>
  /// <a>RegisterType</a> </code>, you can use <code>
  /// <a>DescribeTypeRegistration</a> </code> to monitor the progress of the
  /// registration request.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [schemaHandlerPackage] :
  /// A url to the S3 bucket containing the schema handler package that contains
  /// the schema, event handlers, and associated files for the type you want to
  /// register.
  ///
  /// For information on generating a schema handler package for the type you
  /// want to register, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-cli-submit.html">submit</a>
  /// in the <i>CloudFormation CLI User Guide</i>.
  /// <note>
  /// The user registering the resource provider type must be able to access the
  /// the schema handler package in the S3 bucket. That is, the user needs to
  /// have <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// permissions for the schema handler package. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html">Actions,
  /// Resources, and Condition Keys for Amazon S3</a> in the <i>AWS Identity and
  /// Access Management User Guide</i>.
  /// </note>
  ///
  /// Parameter [typeName] :
  /// The name of the type being registered.
  ///
  /// We recommend that type names adhere to the following pattern:
  /// <i>company_or_organization</i>::<i>service</i>::<i>type</i>.
  /// <note>
  /// The following organization namespaces are reserved and cannot be used in
  /// your resource type names:
  ///
  /// <ul>
  /// <li>
  /// <code>Alexa</code>
  /// </li>
  /// <li>
  /// <code>AMZN</code>
  /// </li>
  /// <li>
  /// <code>Amazon</code>
  /// </li>
  /// <li>
  /// <code>AWS</code>
  /// </li>
  /// <li>
  /// <code>Custom</code>
  /// </li>
  /// <li>
  /// <code>Dev</code>
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier that acts as an idempotency key for this registration
  /// request. Specifying a client request token prevents CloudFormation from
  /// generating more than one version of a type from the same registeration
  /// request, even if the request is submitted multiple times.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role for CloudFormation to
  /// assume when invoking the resource provider. If your resource type calls
  /// AWS APIs in any of its handlers, you must create an <i> <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// execution role</a> </i> that includes the necessary permissions to call
  /// those AWS APIs, and provision that execution role in your account. When
  /// CloudFormation needs to invoke the resource provider handler,
  /// CloudFormation assumes this execution role to create a temporary session
  /// token, which it then passes to the resource provider handler, thereby
  /// supplying your resource provider with the appropriate credentials.
  ///
  /// Parameter [loggingConfig] :
  /// Specifies logging configuration information for a type.
  ///
  /// Parameter [type] :
  /// The kind of type.
  ///
  /// Currently, the only valid value is <code>RESOURCE</code>.
  Future<RegisterTypeOutput> registerType({
    @_s.required String schemaHandlerPackage,
    @_s.required String typeName,
    String clientRequestToken,
    String executionRoleArn,
    LoggingConfig loggingConfig,
    RegistryType type,
  }) async {
    ArgumentError.checkNotNull(schemaHandlerPackage, 'schemaHandlerPackage');
    _s.validateStringLength(
      'schemaHandlerPackage',
      schemaHandlerPackage,
      1,
      4096,
      isRequired: true,
    );
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      10,
      204,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''arn:.+:iam::[0-9]{12}:role/.+''',
    );
    final $request = <String, dynamic>{};
    $request['SchemaHandlerPackage'] = schemaHandlerPackage;
    $request['TypeName'] = typeName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    executionRoleArn?.also((arg) => $request['ExecutionRoleArn'] = arg);
    loggingConfig?.also((arg) => $request['LoggingConfig'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'RegisterType',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RegisterTypeInput'],
      shapes: shapes,
      resultWrapper: 'RegisterTypeResult',
    );
    return RegisterTypeOutput.fromXml($result);
  }

  /// Sets a stack policy for a specified stack.
  ///
  /// Parameter [stackName] :
  /// The name or unique stack ID that you want to associate a policy with.
  ///
  /// Parameter [stackPolicyBody] :
  /// Structure containing the stack policy body. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html">
  /// Prevent Updates to Stack Resources</a> in the AWS CloudFormation User
  /// Guide. You can specify either the <code>StackPolicyBody</code> or the
  /// <code>StackPolicyURL</code> parameter, but not both.
  ///
  /// Parameter [stackPolicyURL] :
  /// Location of a file containing the stack policy. The URL must point to a
  /// policy (maximum size: 16 KB) located in an S3 bucket in the same Region as
  /// the stack. You can specify either the <code>StackPolicyBody</code> or the
  /// <code>StackPolicyURL</code> parameter, but not both.
  Future<void> setStackPolicy({
    @_s.required String stackName,
    String stackPolicyBody,
    String stackPolicyURL,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackPolicyBody',
      stackPolicyBody,
      1,
      16384,
    );
    _s.validateStringLength(
      'stackPolicyURL',
      stackPolicyURL,
      1,
      1350,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    stackPolicyBody?.also((arg) => $request['StackPolicyBody'] = arg);
    stackPolicyURL?.also((arg) => $request['StackPolicyURL'] = arg);
    await _protocol.send(
      $request,
      action: 'SetStackPolicy',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetStackPolicyInput'],
      shapes: shapes,
    );
  }

  /// Specify the default version of a type. The default version of a type will
  /// be used in CloudFormation operations.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the type for which you want version
  /// summary information.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [type] :
  /// The kind of type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the type.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [versionId] :
  /// The ID of a specific version of the type. The version ID is the value at
  /// the end of the Amazon Resource Name (ARN) assigned to the type version
  /// when it is registered.
  Future<void> setTypeDefaultVersion({
    String arn,
    RegistryType type,
    String typeName,
    String versionId,
  }) async {
    _s.validateStringLength(
      'arn',
      arn,
      0,
      1024,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:[0-9]{12}:type/.+''',
    );
    _s.validateStringLength(
      'typeName',
      typeName,
      10,
      204,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}''',
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
    );
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[A-Za-z0-9-]+''',
    );
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    versionId?.also((arg) => $request['VersionId'] = arg);
    await _protocol.send(
      $request,
      action: 'SetTypeDefaultVersion',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetTypeDefaultVersionInput'],
      shapes: shapes,
      resultWrapper: 'SetTypeDefaultVersionResult',
    );
  }

  /// Sends a signal to the specified resource with a success or failure status.
  /// You can use the SignalResource API in conjunction with a creation policy
  /// or update policy. AWS CloudFormation doesn't proceed with a stack creation
  /// or update until resources receive the required number of signals or the
  /// timeout period is exceeded. The SignalResource API is useful in cases
  /// where you want to send signals from anywhere other than an Amazon EC2
  /// instance.
  ///
  /// Parameter [logicalResourceId] :
  /// The logical ID of the resource that you want to signal. The logical ID is
  /// the name of the resource that given in the template.
  ///
  /// Parameter [stackName] :
  /// The stack name or unique stack ID that includes the resource that you want
  /// to signal.
  ///
  /// Parameter [status] :
  /// The status of the signal, which is either success or failure. A failure
  /// signal causes AWS CloudFormation to immediately fail the stack creation or
  /// update.
  ///
  /// Parameter [uniqueId] :
  /// A unique ID of the signal. When you signal Amazon EC2 instances or Auto
  /// Scaling groups, specify the instance ID that you are signaling as the
  /// unique ID. If you send multiple signals to a single resource (such as
  /// signaling a wait condition), each signal requires a different unique ID.
  Future<void> signalResource({
    @_s.required String logicalResourceId,
    @_s.required String stackName,
    @_s.required ResourceSignalStatus status,
    @_s.required String uniqueId,
  }) async {
    ArgumentError.checkNotNull(logicalResourceId, 'logicalResourceId');
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    ArgumentError.checkNotNull(uniqueId, 'uniqueId');
    _s.validateStringLength(
      'uniqueId',
      uniqueId,
      1,
      64,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['LogicalResourceId'] = logicalResourceId;
    $request['StackName'] = stackName;
    $request['Status'] = status.toValue();
    $request['UniqueId'] = uniqueId;
    await _protocol.send(
      $request,
      action: 'SignalResource',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SignalResourceInput'],
      shapes: shapes,
    );
  }

  /// Stops an in-progress operation on a stack set and its associated stack
  /// instances.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationNotFoundException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [operationId] :
  /// The ID of the stack operation.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to stop the operation
  /// for.
  Future<void> stopStackSetOperation({
    @_s.required String operationId,
    @_s.required String stackSetName,
  }) async {
    ArgumentError.checkNotNull(operationId, 'operationId');
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    final $request = <String, dynamic>{};
    $request['OperationId'] = operationId;
    $request['StackSetName'] = stackSetName;
    await _protocol.send(
      $request,
      action: 'StopStackSetOperation',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StopStackSetOperationInput'],
      shapes: shapes,
      resultWrapper: 'StopStackSetOperationResult',
    );
  }

  /// Updates a stack as specified in the template. After the call completes
  /// successfully, the stack update starts. You can check the status of the
  /// stack via the <a>DescribeStacks</a> action.
  ///
  /// To get a copy of the template for an existing stack, you can use the
  /// <a>GetTemplate</a> action.
  ///
  /// For more information about creating an update template, updating a stack,
  /// and monitoring the progress of the update, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html">Updating
  /// a Stack</a>.
  ///
  /// May throw [InsufficientCapabilitiesException].
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [stackName] :
  /// The name or unique stack ID of the stack to update.
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack template
  /// contains certain capabilities in order for AWS CloudFormation to update
  /// the stack.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your AWS account; for example, by creating new AWS Identity and Access
  /// Management (IAM) users. For those stacks, you must explicitly acknowledge
  /// this by specifying one of these capabilities.
  ///
  /// The following IAM resources require you to specify either the
  /// <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code>
  /// capability.
  ///
  /// <ul>
  /// <li>
  /// If you have IAM resources, you can specify either capability.
  /// </li>
  /// <li>
  /// If you have IAM resources with custom names, you <i>must</i> specify
  /// <code>CAPABILITY_NAMED_IAM</code>.
  /// </li>
  /// <li>
  /// If you don't specify either of these capabilities, AWS CloudFormation
  /// returns an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">
  /// AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">
  /// AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">
  /// AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">
  /// AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">
  /// AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">
  /// AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">
  /// AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates</a>.
  /// </li>
  /// <li>
  /// <code>CAPABILITY_AUTO_EXPAND</code>
  ///
  /// Some template contain macros. Macros perform custom processing on
  /// templates; this can include simple actions like find-and-replace
  /// operations, all the way to extensive transformations of entire templates.
  /// Because of this, users typically create a change set from the processed
  /// template, so that they can review the changes resulting from the macros
  /// before actually updating the stack. If your stack template contains one or
  /// more macros, and you choose to update a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. This includes the <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by AWS CloudFormation.
  ///
  /// If you want to update a stack from a stack template that contains macros
  /// <i>and</i> nested stacks, you must update the stack directly from the
  /// template using this capability.
  /// <important>
  /// You should only update stacks directly from a stack template that contains
  /// macros if you know what processing the macro performs.
  ///
  /// Each macro relies on an underlying Lambda service function for processing
  /// stack templates. Be aware that the Lambda function owner can update the
  /// function operation without AWS CloudFormation being notified.
  /// </important>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>UpdateStack</code> request. Specify
  /// this token if you plan to retry requests so that AWS CloudFormation knows
  /// that you're not attempting to update a stack with the same name. You might
  /// retry <code>UpdateStack</code> requests to ensure that AWS CloudFormation
  /// successfully received them.
  ///
  /// All events triggered by a given stack operation are assigned the same
  /// client request token, which you can use to track operations. For example,
  /// if you execute a <code>CreateStack</code> operation with the token
  /// <code>token1</code>, then all the <code>StackEvents</code> generated by
  /// that operation will have <code>ClientRequestToken</code> set as
  /// <code>token1</code>.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format <i>Console-StackOperation-ID</i>, which helps you easily
  /// identify the stack operation . For example, if you create a stack using
  /// the console, each stack event would be assigned the same token in the
  /// following format:
  /// <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>.
  ///
  /// Parameter [notificationARNs] :
  /// Amazon Simple Notification Service topic Amazon Resource Names (ARNs) that
  /// AWS CloudFormation associates with the stack. Specify an empty list to
  /// remove all notification topics.
  ///
  /// Parameter [parameters] :
  /// A list of <code>Parameter</code> structures that specify input parameters
  /// for the stack. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html">Parameter</a>
  /// data type.
  ///
  /// Parameter [resourceTypes] :
  /// The template resource types that you have permissions to work with for
  /// this update stack action, such as <code>AWS::EC2::Instance</code>,
  /// <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>.
  ///
  /// If the list of resource types doesn't include a resource that you're
  /// updating, the stack update fails. By default, AWS CloudFormation grants
  /// permissions to all resource types. AWS Identity and Access Management
  /// (IAM) uses this parameter for AWS CloudFormation-specific condition keys
  /// in IAM policies. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling
  /// Access with AWS Identity and Access Management</a>.
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that AWS CloudFormation assumes to update the stack. AWS
  /// CloudFormation uses the role's credentials to make calls on your behalf.
  /// AWS CloudFormation always uses this role for all future operations on the
  /// stack. As long as users have permission to operate on the stack, AWS
  /// CloudFormation uses this role even if the users don't have permission to
  /// pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// Parameter [rollbackConfiguration] :
  /// The rollback triggers for AWS CloudFormation to monitor during stack
  /// creation and updating operations, and for the specified monitoring period
  /// afterwards.
  ///
  /// Parameter [stackPolicyBody] :
  /// Structure containing a new stack policy body. You can specify either the
  /// <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter,
  /// but not both.
  ///
  /// You might update the stack policy, for example, in order to protect a new
  /// resource that you created during a stack update. If you do not specify a
  /// stack policy, the current policy that is associated with the stack is
  /// unchanged.
  ///
  /// Parameter [stackPolicyDuringUpdateBody] :
  /// Structure containing the temporary overriding stack policy body. You can
  /// specify either the <code>StackPolicyDuringUpdateBody</code> or the
  /// <code>StackPolicyDuringUpdateURL</code> parameter, but not both.
  ///
  /// If you want to update protected resources, specify a temporary overriding
  /// stack policy during this update. If you do not specify a stack policy, the
  /// current policy that is associated with the stack will be used.
  ///
  /// Parameter [stackPolicyDuringUpdateURL] :
  /// Location of a file containing the temporary overriding stack policy. The
  /// URL must point to a policy (max size: 16KB) located in an S3 bucket in the
  /// same Region as the stack. You can specify either the
  /// <code>StackPolicyDuringUpdateBody</code> or the
  /// <code>StackPolicyDuringUpdateURL</code> parameter, but not both.
  ///
  /// If you want to update protected resources, specify a temporary overriding
  /// stack policy during this update. If you do not specify a stack policy, the
  /// current policy that is associated with the stack will be used.
  ///
  /// Parameter [stackPolicyURL] :
  /// Location of a file containing the updated stack policy. The URL must point
  /// to a policy (max size: 16KB) located in an S3 bucket in the same Region as
  /// the stack. You can specify either the <code>StackPolicyBody</code> or the
  /// <code>StackPolicyURL</code> parameter, but not both.
  ///
  /// You might update the stack policy, for example, in order to protect a new
  /// resource that you created during a stack update. If you do not specify a
  /// stack policy, the current policy that is associated with the stack is
  /// unchanged.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with this stack. AWS CloudFormation also
  /// propagates these tags to supported resources in the stack. You can specify
  /// a maximum number of 50 tags.
  ///
  /// If you don't specify this parameter, AWS CloudFormation doesn't modify the
  /// stack's tags. If you specify an empty value, AWS CloudFormation removes
  /// all associated tags.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.)
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code>, <code>TemplateURL</code>, or set the
  /// <code>UsePreviousTemplate</code> to <code>true</code>.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template that is located in an Amazon S3 bucket. For more information, go
  /// to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code>, <code>TemplateURL</code>, or set the
  /// <code>UsePreviousTemplate</code> to <code>true</code>.
  ///
  /// Parameter [usePreviousTemplate] :
  /// Reuse the existing template that is associated with the stack that you are
  /// updating.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code>, <code>TemplateURL</code>, or set the
  /// <code>UsePreviousTemplate</code> to <code>true</code>.
  Future<UpdateStackOutput> updateStack({
    @_s.required String stackName,
    List<Capability> capabilities,
    String clientRequestToken,
    List<String> notificationARNs,
    List<Parameter> parameters,
    List<String> resourceTypes,
    String roleARN,
    RollbackConfiguration rollbackConfiguration,
    String stackPolicyBody,
    String stackPolicyDuringUpdateBody,
    String stackPolicyDuringUpdateURL,
    String stackPolicyURL,
    List<Tag> tags,
    String templateBody,
    String templateURL,
    bool usePreviousTemplate,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      20,
      2048,
    );
    _s.validateStringLength(
      'stackPolicyBody',
      stackPolicyBody,
      1,
      16384,
    );
    _s.validateStringLength(
      'stackPolicyDuringUpdateBody',
      stackPolicyDuringUpdateBody,
      1,
      16384,
    );
    _s.validateStringLength(
      'stackPolicyDuringUpdateURL',
      stackPolicyDuringUpdateURL,
      1,
      1350,
    );
    _s.validateStringLength(
      'stackPolicyURL',
      stackPolicyURL,
      1,
      1350,
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e?.toValue() ?? '').toList());
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    notificationARNs?.also((arg) => $request['NotificationARNs'] = arg);
    parameters?.also((arg) => $request['Parameters'] = arg);
    resourceTypes?.also((arg) => $request['ResourceTypes'] = arg);
    roleARN?.also((arg) => $request['RoleARN'] = arg);
    rollbackConfiguration
        ?.also((arg) => $request['RollbackConfiguration'] = arg);
    stackPolicyBody?.also((arg) => $request['StackPolicyBody'] = arg);
    stackPolicyDuringUpdateBody
        ?.also((arg) => $request['StackPolicyDuringUpdateBody'] = arg);
    stackPolicyDuringUpdateURL
        ?.also((arg) => $request['StackPolicyDuringUpdateURL'] = arg);
    stackPolicyURL?.also((arg) => $request['StackPolicyURL'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    usePreviousTemplate?.also((arg) => $request['UsePreviousTemplate'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateStack',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateStackInput'],
      shapes: shapes,
      resultWrapper: 'UpdateStackResult',
    );
    return UpdateStackOutput.fromXml($result);
  }

  /// Updates the parameter values for stack instances for the specified
  /// accounts, within the specified Regions. A stack instance refers to a stack
  /// in a specific account and Region.
  ///
  /// You can only update stack instances in Regions and accounts where they
  /// already exist; to create additional stack instances, use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html">CreateStackInstances</a>.
  ///
  /// During stack set updates, any parameters overridden for a stack instance
  /// are not updated, but retain their overridden value.
  ///
  /// You can only update the parameter <i>values</i> that are specified in the
  /// stack set; to add or delete a parameter itself, use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a>
  /// to update the stack set template. If you add a parameter to a template,
  /// before you can override the parameter value specified in the stack set you
  /// must first use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a>
  /// to update all stack instances with the updated template and parameter
  /// value specified in the stack set. Once a stack instance has been updated
  /// with the new parameter, you can then override the parameter value using
  /// <code>UpdateStackInstances</code>.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [StackInstanceNotFoundException].
  /// May throw [OperationInProgressException].
  /// May throw [OperationIdAlreadyExistsException].
  /// May throw [StaleRequestException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [regions] :
  /// The names of one or more Regions in which you want to update parameter
  /// values for stack instances. The overridden parameter values will be
  /// applied to all stack instances in the specified accounts and Regions.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set associated with the stack
  /// instances.
  ///
  /// Parameter [accounts] :
  /// [<code>Self-managed</code> permissions] The names of one or more AWS
  /// accounts for which you want to update parameter values for stack
  /// instances. The overridden parameter values will be applied to all stack
  /// instances in the specified accounts and Regions.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [deploymentTargets] :
  /// [<code>Service-managed</code> permissions] The AWS Organizations accounts
  /// for which you want to update parameter values for stack instances. If your
  /// update targets OUs, the overridden parameter values only apply to the
  /// accounts that are currently in the target OUs and their child OUs.
  /// Accounts added to the target OUs and their child OUs in the future won't
  /// use the overridden values.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [operationId] :
  /// The unique identifier for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how AWS CloudFormation performs this stack set operation.
  ///
  /// Parameter [parameterOverrides] :
  /// A list of input parameters whose values you want to update for the
  /// specified stack instances.
  ///
  /// Any overridden parameter values will be applied to all stack instances in
  /// the specified accounts and Regions. When specifying parameters and their
  /// values, be aware of how AWS CloudFormation sets parameter values during
  /// stack instance update operations:
  ///
  /// <ul>
  /// <li>
  /// To override the current value for a parameter, include the parameter and
  /// specify its value.
  /// </li>
  /// <li>
  /// To leave a parameter set to its present value, you can do one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Do not include the parameter in the list.
  /// </li>
  /// <li>
  /// Include the parameter and specify <code>UsePreviousValue</code> as
  /// <code>true</code>. (You cannot specify both a value and set
  /// <code>UsePreviousValue</code> to <code>true</code>.)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// To set all overridden parameter back to the values specified in the stack
  /// set, specify a parameter list but do not include any parameters.
  /// </li>
  /// <li>
  /// To leave all parameters set to their present values, do not specify this
  /// property at all.
  /// </li>
  /// </ul>
  /// During stack set updates, any parameter values overridden for a stack
  /// instance are not updated, but retain their overridden value.
  ///
  /// You can only override the parameter <i>values</i> that are specified in
  /// the stack set; to add or delete a parameter itself, use
  /// <code>UpdateStackSet</code> to update the stack set template. If you add a
  /// parameter to a template, before you can override the parameter value
  /// specified in the stack set you must first use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a>
  /// to update all stack instances with the updated template and parameter
  /// value specified in the stack set. Once a stack instance has been updated
  /// with the new parameter, you can then override the parameter value using
  /// <code>UpdateStackInstances</code>.
  Future<UpdateStackInstancesOutput> updateStackInstances({
    @_s.required List<String> regions,
    @_s.required String stackSetName,
    List<String> accounts,
    DeploymentTargets deploymentTargets,
    String operationId,
    StackSetOperationPreferences operationPreferences,
    List<Parameter> parameterOverrides,
  }) async {
    ArgumentError.checkNotNull(regions, 'regions');
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateStringPattern(
      'stackSetName',
      stackSetName,
      r'''[a-zA-Z][-a-zA-Z0-9]*(?::[a-zA-Z0-9]{8}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{12})?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    final $request = <String, dynamic>{};
    $request['Regions'] = regions;
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    deploymentTargets?.also((arg) => $request['DeploymentTargets'] = arg);
    $request['OperationId'] = operationId ?? _s.generateIdempotencyToken();
    operationPreferences?.also((arg) => $request['OperationPreferences'] = arg);
    parameterOverrides?.also((arg) => $request['ParameterOverrides'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateStackInstances',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateStackInstancesInput'],
      shapes: shapes,
      resultWrapper: 'UpdateStackInstancesResult',
    );
    return UpdateStackInstancesOutput.fromXml($result);
  }

  /// Updates the stack set, and associated stack instances in the specified
  /// accounts and Regions.
  ///
  /// Even if the stack set operation created by updating the stack set fails
  /// (completely or partially, below or above a specified failure tolerance),
  /// the stack set is updated with your changes. Subsequent
  /// <a>CreateStackInstances</a> calls on the specified stack set use the
  /// updated stack set.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationInProgressException].
  /// May throw [OperationIdAlreadyExistsException].
  /// May throw [StaleRequestException].
  /// May throw [InvalidOperationException].
  /// May throw [StackInstanceNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to update.
  ///
  /// Parameter [accounts] :
  /// [<code>Self-managed</code> permissions] The accounts in which to update
  /// associated stack instances. If you specify accounts, you must also specify
  /// the Regions in which to update stack set instances.
  ///
  /// To update <i>all</i> the stack instances associated with this stack set,
  /// do not specify the <code>Accounts</code> or <code>Regions</code>
  /// properties.
  ///
  /// If the stack set update includes changes to the template (that is, if the
  /// <code>TemplateBody</code> or <code>TemplateURL</code> properties are
  /// specified), or the <code>Parameters</code> property, AWS CloudFormation
  /// marks all stack instances with a status of <code>OUTDATED</code> prior to
  /// updating the stack instances in the specified accounts and Regions. If the
  /// stack set update does not include changes to the template or parameters,
  /// AWS CloudFormation updates the stack instances in the specified accounts
  /// and Regions, while leaving all other stack instances with their existing
  /// stack instance status.
  ///
  /// Parameter [administrationRoleARN] :
  /// The Amazon Resource Number (ARN) of the IAM role to use to update this
  /// stack set.
  ///
  /// Specify an IAM role only if you are using customized administrator roles
  /// to control which users or groups can manage specific stack sets within the
  /// same administrator account. For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Granting
  /// Permissions for Stack Set Operations</a> in the <i>AWS CloudFormation User
  /// Guide</i>.
  ///
  /// If you specified a customized administrator role when you created the
  /// stack set, you must specify a customized administrator role, even if it is
  /// the same customized administrator role used with this stack set
  /// previously.
  ///
  /// Parameter [autoDeployment] :
  /// [<code>Service-managed</code> permissions] Describes whether StackSets
  /// automatically deploys to AWS Organizations accounts that are added to a
  /// target organization or organizational unit (OU).
  ///
  /// If you specify <code>AutoDeployment</code>, do not specify
  /// <code>DeploymentTargets</code> or <code>Regions</code>.
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack template
  /// contains certain capabilities in order for AWS CloudFormation to update
  /// the stack set and its associated stack instances.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your AWS account; for example, by creating new AWS Identity and Access
  /// Management (IAM) users. For those stacks sets, you must explicitly
  /// acknowledge this by specifying one of these capabilities.
  ///
  /// The following IAM resources require you to specify either the
  /// <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code>
  /// capability.
  ///
  /// <ul>
  /// <li>
  /// If you have IAM resources, you can specify either capability.
  /// </li>
  /// <li>
  /// If you have IAM resources with custom names, you <i>must</i> specify
  /// <code>CAPABILITY_NAMED_IAM</code>.
  /// </li>
  /// <li>
  /// If you don't specify either of these capabilities, AWS CloudFormation
  /// returns an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">
  /// AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">
  /// AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">
  /// AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">
  /// AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">
  /// AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">
  /// AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">
  /// AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates</a>.
  /// </li>
  /// <li>
  /// <code>CAPABILITY_AUTO_EXPAND</code>
  ///
  /// Some templates contain macros. If your stack template contains one or more
  /// macros, and you choose to update a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// <important>
  /// Stack sets do not currently support macros in stack templates. (This
  /// includes the <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by AWS CloudFormation.) Even if you
  /// specify this capability, if you include a macro in your template the stack
  /// set operation will fail.
  /// </important> </li>
  /// </ul>
  ///
  /// Parameter [deploymentTargets] :
  /// [<code>Service-managed</code> permissions] The AWS Organizations accounts
  /// in which to update associated stack instances.
  ///
  /// To update all the stack instances associated with this stack set, do not
  /// specify <code>DeploymentTargets</code> or <code>Regions</code>.
  ///
  /// If the stack set update includes changes to the template (that is, if
  /// <code>TemplateBody</code> or <code>TemplateURL</code> is specified), or
  /// the <code>Parameters</code>, AWS CloudFormation marks all stack instances
  /// with a status of <code>OUTDATED</code> prior to updating the stack
  /// instances in the specified accounts and Regions. If the stack set update
  /// does not include changes to the template or parameters, AWS CloudFormation
  /// updates the stack instances in the specified accounts and Regions, while
  /// leaving all other stack instances with their existing stack instance
  /// status.
  ///
  /// Parameter [description] :
  /// A brief description of updates that you are making.
  ///
  /// Parameter [executionRoleName] :
  /// The name of the IAM execution role to use to update the stack set. If you
  /// do not specify an execution role, AWS CloudFormation uses the
  /// <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set
  /// operation.
  ///
  /// Specify an IAM role only if you are using customized execution roles to
  /// control which stack resources users and groups can include in their stack
  /// sets.
  ///
  /// If you specify a customized execution role, AWS CloudFormation uses that
  /// role to update the stack. If you do not specify a customized execution
  /// role, AWS CloudFormation performs the update using the role previously
  /// associated with the stack set, so long as you have permissions to perform
  /// operations on the stack set.
  ///
  /// Parameter [operationId] :
  /// The unique ID for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, AWS CloudFormation generates one
  /// automatically.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is <code>OUTDATED</code>.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how AWS CloudFormation performs this stack set operation.
  ///
  /// Parameter [parameters] :
  /// A list of input parameters for the stack set template.
  ///
  /// Parameter [permissionModel] :
  /// Describes how the IAM roles required for stack set operations are created.
  /// You cannot modify <code>PermissionModel</code> if there are stack
  /// instances associated with your stack set.
  ///
  /// <ul>
  /// <li>
  /// With <code>self-managed</code> permissions, you must create the
  /// administrator and execution roles required to deploy to target accounts.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant
  /// Self-Managed Stack Set Permissions</a>.
  /// </li>
  /// <li>
  /// With <code>service-managed</code> permissions, StackSets automatically
  /// creates the IAM roles required to deploy to accounts managed by AWS
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [regions] :
  /// The Regions in which to update associated stack instances. If you specify
  /// Regions, you must also specify accounts in which to update stack set
  /// instances.
  ///
  /// To update <i>all</i> the stack instances associated with this stack set,
  /// do not specify the <code>Accounts</code> or <code>Regions</code>
  /// properties.
  ///
  /// If the stack set update includes changes to the template (that is, if the
  /// <code>TemplateBody</code> or <code>TemplateURL</code> properties are
  /// specified), or the <code>Parameters</code> property, AWS CloudFormation
  /// marks all stack instances with a status of <code>OUTDATED</code> prior to
  /// updating the stack instances in the specified accounts and Regions. If the
  /// stack set update does not include changes to the template or parameters,
  /// AWS CloudFormation updates the stack instances in the specified accounts
  /// and Regions, while leaving all other stack instances with their existing
  /// stack instance status.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with this stack set and the stacks
  /// created from it. AWS CloudFormation also propagates these tags to
  /// supported resources that are created in the stacks. You can specify a
  /// maximum number of 50 tags.
  ///
  /// If you specify tags for this parameter, those tags replace any list of
  /// tags that are currently associated with this stack set. This means:
  ///
  /// <ul>
  /// <li>
  /// If you don't specify this parameter, AWS CloudFormation doesn't modify the
  /// stack's tags.
  /// </li>
  /// <li>
  /// If you specify <i>any</i> tags using this parameter, you must specify
  /// <i>all</i> the tags that you want associated with this stack set, even
  /// tags you've specifed before (for example, when creating the stack set or
  /// during a previous update of the stack set.). Any tags that you don't
  /// include in the updated list of tags are removed from the stack set, and
  /// therefore from the stacks and resources as well.
  /// </li>
  /// <li>
  /// If you specify an empty value, AWS CloudFormation removes all currently
  /// associated tags.
  /// </li>
  /// </ul>
  /// If you specify new tags as part of an <code>UpdateStackSet</code> action,
  /// AWS CloudFormation checks to see if you have the required IAM permission
  /// to tag resources. If you omit tags that are currently associated with the
  /// stack set from the list of tags you specify, AWS CloudFormation assumes
  /// that you want to remove those tags from the stack set, and checks to see
  /// if you have permission to untag resources. If you don't have the necessary
  /// permission(s), the entire <code>UpdateStackSet</code> action fails with an
  /// <code>access denied</code> error, and the stack set is not updated.
  ///
  /// Parameter [templateBody] :
  /// The structure that contains the template body, with a minimum length of 1
  /// byte and a maximum length of 51,200 bytes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code> or <code>TemplateURL</code>—or set
  /// <code>UsePreviousTemplate</code> to true.
  ///
  /// Parameter [templateURL] :
  /// The location of the file that contains the template body. The URL must
  /// point to a template (maximum size: 460,800 bytes) that is located in an
  /// Amazon S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code> or <code>TemplateURL</code>—or set
  /// <code>UsePreviousTemplate</code> to true.
  ///
  /// Parameter [usePreviousTemplate] :
  /// Use the existing template that's associated with the stack set that you're
  /// updating.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code> or <code>TemplateURL</code>—or set
  /// <code>UsePreviousTemplate</code> to true.
  Future<UpdateStackSetOutput> updateStackSet({
    @_s.required String stackSetName,
    List<String> accounts,
    String administrationRoleARN,
    AutoDeployment autoDeployment,
    List<Capability> capabilities,
    DeploymentTargets deploymentTargets,
    String description,
    String executionRoleName,
    String operationId,
    StackSetOperationPreferences operationPreferences,
    List<Parameter> parameters,
    PermissionModels permissionModel,
    List<String> regions,
    List<Tag> tags,
    String templateBody,
    String templateURL,
    bool usePreviousTemplate,
  }) async {
    ArgumentError.checkNotNull(stackSetName, 'stackSetName');
    _s.validateStringLength(
      'administrationRoleARN',
      administrationRoleARN,
      20,
      2048,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'executionRoleName',
      executionRoleName,
      1,
      64,
    );
    _s.validateStringPattern(
      'executionRoleName',
      executionRoleName,
      r'''[a-zA-Z_0-9+=,.@-]+''',
    );
    _s.validateStringLength(
      'operationId',
      operationId,
      1,
      128,
    );
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''[a-zA-Z0-9][-a-zA-Z0-9]*''',
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    administrationRoleARN
        ?.also((arg) => $request['AdministrationRoleARN'] = arg);
    autoDeployment?.also((arg) => $request['AutoDeployment'] = arg);
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e?.toValue() ?? '').toList());
    deploymentTargets?.also((arg) => $request['DeploymentTargets'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    executionRoleName?.also((arg) => $request['ExecutionRoleName'] = arg);
    $request['OperationId'] = operationId ?? _s.generateIdempotencyToken();
    operationPreferences?.also((arg) => $request['OperationPreferences'] = arg);
    parameters?.also((arg) => $request['Parameters'] = arg);
    permissionModel?.also((arg) => $request['PermissionModel'] = arg.toValue());
    regions?.also((arg) => $request['Regions'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    usePreviousTemplate?.also((arg) => $request['UsePreviousTemplate'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateStackSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateStackSetInput'],
      shapes: shapes,
      resultWrapper: 'UpdateStackSetResult',
    );
    return UpdateStackSetOutput.fromXml($result);
  }

  /// Updates termination protection for the specified stack. If a user attempts
  /// to delete a stack with termination protection enabled, the operation fails
  /// and the stack remains unchanged. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting
  /// a Stack From Being Deleted</a> in the <i>AWS CloudFormation User
  /// Guide</i>.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested
  /// stacks</a>, termination protection is set on the root stack and cannot be
  /// changed directly on the nested stack.
  ///
  /// Parameter [enableTerminationProtection] :
  /// Whether to enable termination protection on the specified stack.
  ///
  /// Parameter [stackName] :
  /// The name or unique ID of the stack for which you want to set termination
  /// protection.
  Future<UpdateTerminationProtectionOutput> updateTerminationProtection({
    @_s.required bool enableTerminationProtection,
    @_s.required String stackName,
  }) async {
    ArgumentError.checkNotNull(
        enableTerminationProtection, 'enableTerminationProtection');
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'stackName',
      stackName,
      r'''([a-zA-Z][-a-zA-Z0-9]*)|(arn:\b(aws|aws-us-gov|aws-cn)\b:[-a-zA-Z0-9:/._+]*)''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['EnableTerminationProtection'] = enableTerminationProtection;
    $request['StackName'] = stackName;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateTerminationProtection',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateTerminationProtectionInput'],
      shapes: shapes,
      resultWrapper: 'UpdateTerminationProtectionResult',
    );
    return UpdateTerminationProtectionOutput.fromXml($result);
  }

  /// Validates a specified template. AWS CloudFormation first checks if the
  /// template is valid JSON. If it isn't, AWS CloudFormation checks if the
  /// template is valid YAML. If both these checks fail, AWS CloudFormation
  /// returns a template validation error.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must pass <code>TemplateURL</code> or
  /// <code>TemplateBody</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template (max size: 460,800 bytes) that is located in an Amazon S3 bucket.
  /// For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must pass <code>TemplateURL</code> or
  /// <code>TemplateBody</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  Future<ValidateTemplateOutput> validateTemplate({
    String templateBody,
    String templateURL,
  }) async {
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'templateURL',
      templateURL,
      1,
      1024,
    );
    final $request = <String, dynamic>{};
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateURL?.also((arg) => $request['TemplateURL'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ValidateTemplate',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ValidateTemplateInput'],
      shapes: shapes,
      resultWrapper: 'ValidateTemplateResult',
    );
    return ValidateTemplateOutput.fromXml($result);
  }
}

/// Structure that contains the results of the account gate function which AWS
/// CloudFormation invokes, if present, before proceeding with a stack set
/// operation in an account and Region.
///
/// For each account and Region, AWS CloudFormation lets you specify a Lamdba
/// function that encapsulates any requirements that must be met before
/// CloudFormation can proceed with a stack set operation in that account and
/// Region. CloudFormation invokes the function each time a stack set operation
/// is requested for that account and Region; if the function returns
/// <code>FAILED</code>, CloudFormation cancels the operation in that account
/// and Region, and sets the stack set operation result status for that account
/// and Region to <code>FAILED</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-account-gating.html">Configuring
/// a target account gate</a>.
class AccountGateResult {
  /// The status of the account gate function.
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code>: The account gate function has determined that the
  /// account and Region passes any requirements for a stack set operation to
  /// occur. AWS CloudFormation proceeds with the stack operation in that account
  /// and Region.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The account gate function has determined that the
  /// account and Region does not meet the requirements for a stack set operation
  /// to occur. AWS CloudFormation cancels the stack set operation in that account
  /// and Region, and sets the stack set operation result status for that account
  /// and Region to <code>FAILED</code>.
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>: AWS CloudFormation has skipped calling the account
  /// gate function for this account and Region, for one of the following reasons:
  ///
  /// <ul>
  /// <li>
  /// An account gate function has not been specified for the account and Region.
  /// AWS CloudFormation proceeds with the stack set operation in this account and
  /// Region.
  /// </li>
  /// <li>
  /// The <code>AWSCloudFormationStackSetExecutionRole</code> of the stack set
  /// adminstration account lacks permissions to invoke the function. AWS
  /// CloudFormation proceeds with the stack set operation in this account and
  /// Region.
  /// </li>
  /// <li>
  /// Either no action is necessary, or no action is possible, on the stack. AWS
  /// CloudFormation skips the stack set operation in this account and Region.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final AccountGateStatus status;

  /// The reason for the account gate status assigned to this account and Region
  /// for the stack set operation.
  final String statusReason;

  AccountGateResult({
    this.status,
    this.statusReason,
  });
  factory AccountGateResult.fromXml(_s.XmlElement elem) {
    return AccountGateResult(
      status: _s.extractXmlStringValue(elem, 'Status')?.toAccountGateStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }
}

enum AccountGateStatus {
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SKIPPED')
  skipped,
}

extension on String {
  AccountGateStatus toAccountGateStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return AccountGateStatus.succeeded;
      case 'FAILED':
        return AccountGateStatus.failed;
      case 'SKIPPED':
        return AccountGateStatus.skipped;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The AccountLimit data type.
///
/// CloudFormation has the following limits per account:
///
/// <ul>
/// <li>
/// Number of concurrent resources
/// </li>
/// <li>
/// Number of stacks
/// </li>
/// <li>
/// Number of stack outputs
/// </li>
/// </ul>
/// For more information about these account limits, and other CloudFormation
/// limits, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html">AWS
/// CloudFormation Limits</a> in the <i>AWS CloudFormation User Guide</i>.
class AccountLimit {
  /// The name of the account limit.
  ///
  /// Values: <code>ConcurrentResourcesLimit</code> | <code>StackLimit</code> |
  /// <code>StackOutputsLimit</code>
  final String name;

  /// The value that is associated with the account limit name.
  final int value;

  AccountLimit({
    this.name,
    this.value,
  });
  factory AccountLimit.fromXml(_s.XmlElement elem) {
    return AccountLimit(
      name: _s.extractXmlStringValue(elem, 'Name'),
      value: _s.extractXmlIntValue(elem, 'Value'),
    );
  }
}

/// [<code>Service-managed</code> permissions] Describes whether StackSets
/// automatically deploys to AWS Organizations accounts that are added to a
/// target organization or organizational unit (OU).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AutoDeployment {
  /// If set to <code>true</code>, StackSets automatically deploys additional
  /// stack instances to AWS Organizations accounts that are added to a target
  /// organization or organizational unit (OU) in the specified Regions. If an
  /// account is removed from a target organization or OU, StackSets deletes stack
  /// instances from the account in the specified Regions.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// If set to <code>true</code>, stack resources are retained when an account is
  /// removed from a target organization or OU. If set to <code>false</code>,
  /// stack resources are deleted. Specify only if <code>Enabled</code> is set to
  /// <code>True</code>.
  @_s.JsonKey(name: 'RetainStacksOnAccountRemoval')
  final bool retainStacksOnAccountRemoval;

  AutoDeployment({
    this.enabled,
    this.retainStacksOnAccountRemoval,
  });
  factory AutoDeployment.fromXml(_s.XmlElement elem) {
    return AutoDeployment(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      retainStacksOnAccountRemoval:
          _s.extractXmlBoolValue(elem, 'RetainStacksOnAccountRemoval'),
    );
  }

  Map<String, dynamic> toJson() => _$AutoDeploymentToJson(this);
}

enum Capability {
  @_s.JsonValue('CAPABILITY_IAM')
  capabilityIam,
  @_s.JsonValue('CAPABILITY_NAMED_IAM')
  capabilityNamedIam,
  @_s.JsonValue('CAPABILITY_AUTO_EXPAND')
  capabilityAutoExpand,
}

extension on Capability {
  String toValue() {
    switch (this) {
      case Capability.capabilityIam:
        return 'CAPABILITY_IAM';
      case Capability.capabilityNamedIam:
        return 'CAPABILITY_NAMED_IAM';
      case Capability.capabilityAutoExpand:
        return 'CAPABILITY_AUTO_EXPAND';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Capability toCapability() {
    switch (this) {
      case 'CAPABILITY_IAM':
        return Capability.capabilityIam;
      case 'CAPABILITY_NAMED_IAM':
        return Capability.capabilityNamedIam;
      case 'CAPABILITY_AUTO_EXPAND':
        return Capability.capabilityAutoExpand;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The <code>Change</code> structure describes the changes AWS CloudFormation
/// will perform if you execute the change set.
class Change {
  /// A <code>ResourceChange</code> structure that describes the resource and
  /// action that AWS CloudFormation will perform.
  final ResourceChange resourceChange;

  /// The type of entity that AWS CloudFormation changes. Currently, the only
  /// entity type is <code>Resource</code>.
  final ChangeType type;

  Change({
    this.resourceChange,
    this.type,
  });
  factory Change.fromXml(_s.XmlElement elem) {
    return Change(
      resourceChange: _s
          .extractXmlChild(elem, 'ResourceChange')
          ?.let((e) => ResourceChange.fromXml(e)),
      type: _s.extractXmlStringValue(elem, 'Type')?.toChangeType(),
    );
  }
}

enum ChangeAction {
  @_s.JsonValue('Add')
  add,
  @_s.JsonValue('Modify')
  modify,
  @_s.JsonValue('Remove')
  remove,
  @_s.JsonValue('Import')
  import,
  @_s.JsonValue('Dynamic')
  dynamic,
}

extension on String {
  ChangeAction toChangeAction() {
    switch (this) {
      case 'Add':
        return ChangeAction.add;
      case 'Modify':
        return ChangeAction.modify;
      case 'Remove':
        return ChangeAction.remove;
      case 'Import':
        return ChangeAction.import;
      case 'Dynamic':
        return ChangeAction.dynamic;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ChangeSetStatus {
  @_s.JsonValue('CREATE_PENDING')
  createPending,
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_COMPLETE')
  createComplete,
  @_s.JsonValue('DELETE_PENDING')
  deletePending,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETE_COMPLETE')
  deleteComplete,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('FAILED')
  failed,
}

extension on String {
  ChangeSetStatus toChangeSetStatus() {
    switch (this) {
      case 'CREATE_PENDING':
        return ChangeSetStatus.createPending;
      case 'CREATE_IN_PROGRESS':
        return ChangeSetStatus.createInProgress;
      case 'CREATE_COMPLETE':
        return ChangeSetStatus.createComplete;
      case 'DELETE_PENDING':
        return ChangeSetStatus.deletePending;
      case 'DELETE_IN_PROGRESS':
        return ChangeSetStatus.deleteInProgress;
      case 'DELETE_COMPLETE':
        return ChangeSetStatus.deleteComplete;
      case 'DELETE_FAILED':
        return ChangeSetStatus.deleteFailed;
      case 'FAILED':
        return ChangeSetStatus.failed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The <code>ChangeSetSummary</code> structure describes a change set, its
/// status, and the stack with which it's associated.
class ChangeSetSummary {
  /// The ID of the change set.
  final String changeSetId;

  /// The name of the change set.
  final String changeSetName;

  /// The start time when the change set was created, in UTC.
  final DateTime creationTime;

  /// Descriptive information about the change set.
  final String description;

  /// If the change set execution status is <code>AVAILABLE</code>, you can
  /// execute the change set. If you can’t execute the change set, the status
  /// indicates why. For example, a change set might be in an
  /// <code>UNAVAILABLE</code> state because AWS CloudFormation is still creating
  /// it or in an <code>OBSOLETE</code> state because the stack was already
  /// updated.
  final ExecutionStatus executionStatus;

  /// Specifies the current setting of <code>IncludeNestedStacks</code> for the
  /// change set.
  final bool includeNestedStacks;

  /// The parent change set ID.
  final String parentChangeSetId;

  /// The root change set ID.
  final String rootChangeSetId;

  /// The ID of the stack with which the change set is associated.
  final String stackId;

  /// The name of the stack with which the change set is associated.
  final String stackName;

  /// The state of the change set, such as <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_COMPLETE</code>, or <code>FAILED</code>.
  final ChangeSetStatus status;

  /// A description of the change set's status. For example, if your change set is
  /// in the <code>FAILED</code> state, AWS CloudFormation shows the error
  /// message.
  final String statusReason;

  ChangeSetSummary({
    this.changeSetId,
    this.changeSetName,
    this.creationTime,
    this.description,
    this.executionStatus,
    this.includeNestedStacks,
    this.parentChangeSetId,
    this.rootChangeSetId,
    this.stackId,
    this.stackName,
    this.status,
    this.statusReason,
  });
  factory ChangeSetSummary.fromXml(_s.XmlElement elem) {
    return ChangeSetSummary(
      changeSetId: _s.extractXmlStringValue(elem, 'ChangeSetId'),
      changeSetName: _s.extractXmlStringValue(elem, 'ChangeSetName'),
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      executionStatus: _s
          .extractXmlStringValue(elem, 'ExecutionStatus')
          ?.toExecutionStatus(),
      includeNestedStacks: _s.extractXmlBoolValue(elem, 'IncludeNestedStacks'),
      parentChangeSetId: _s.extractXmlStringValue(elem, 'ParentChangeSetId'),
      rootChangeSetId: _s.extractXmlStringValue(elem, 'RootChangeSetId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toChangeSetStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }
}

enum ChangeSetType {
  @_s.JsonValue('CREATE')
  create,
  @_s.JsonValue('UPDATE')
  update,
  @_s.JsonValue('IMPORT')
  import,
}

extension on ChangeSetType {
  String toValue() {
    switch (this) {
      case ChangeSetType.create:
        return 'CREATE';
      case ChangeSetType.update:
        return 'UPDATE';
      case ChangeSetType.import:
        return 'IMPORT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ChangeSetType toChangeSetType() {
    switch (this) {
      case 'CREATE':
        return ChangeSetType.create;
      case 'UPDATE':
        return ChangeSetType.update;
      case 'IMPORT':
        return ChangeSetType.import;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ChangeSource {
  @_s.JsonValue('ResourceReference')
  resourceReference,
  @_s.JsonValue('ParameterReference')
  parameterReference,
  @_s.JsonValue('ResourceAttribute')
  resourceAttribute,
  @_s.JsonValue('DirectModification')
  directModification,
  @_s.JsonValue('Automatic')
  automatic,
}

extension on String {
  ChangeSource toChangeSource() {
    switch (this) {
      case 'ResourceReference':
        return ChangeSource.resourceReference;
      case 'ParameterReference':
        return ChangeSource.parameterReference;
      case 'ResourceAttribute':
        return ChangeSource.resourceAttribute;
      case 'DirectModification':
        return ChangeSource.directModification;
      case 'Automatic':
        return ChangeSource.automatic;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ChangeType {
  @_s.JsonValue('Resource')
  resource,
}

extension on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'Resource':
        return ChangeType.resource;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The output for a <a>ContinueUpdateRollback</a> action.
class ContinueUpdateRollbackOutput {
  ContinueUpdateRollbackOutput();
  factory ContinueUpdateRollbackOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ContinueUpdateRollbackOutput();
  }
}

/// The output for the <a>CreateChangeSet</a> action.
class CreateChangeSetOutput {
  /// The Amazon Resource Name (ARN) of the change set.
  final String id;

  /// The unique ID of the stack.
  final String stackId;

  CreateChangeSetOutput({
    this.id,
    this.stackId,
  });
  factory CreateChangeSetOutput.fromXml(_s.XmlElement elem) {
    return CreateChangeSetOutput(
      id: _s.extractXmlStringValue(elem, 'Id'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }
}

class CreateStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String operationId;

  CreateStackInstancesOutput({
    this.operationId,
  });
  factory CreateStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return CreateStackInstancesOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }
}

/// The output for a <a>CreateStack</a> action.
class CreateStackOutput {
  /// Unique identifier of the stack.
  final String stackId;

  CreateStackOutput({
    this.stackId,
  });
  factory CreateStackOutput.fromXml(_s.XmlElement elem) {
    return CreateStackOutput(
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }
}

class CreateStackSetOutput {
  /// The ID of the stack set that you're creating.
  final String stackSetId;

  CreateStackSetOutput({
    this.stackSetId,
  });
  factory CreateStackSetOutput.fromXml(_s.XmlElement elem) {
    return CreateStackSetOutput(
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
    );
  }
}

/// The output for the <a>DeleteChangeSet</a> action.
class DeleteChangeSetOutput {
  DeleteChangeSetOutput();
  factory DeleteChangeSetOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteChangeSetOutput();
  }
}

class DeleteStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String operationId;

  DeleteStackInstancesOutput({
    this.operationId,
  });
  factory DeleteStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return DeleteStackInstancesOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }
}

class DeleteStackSetOutput {
  DeleteStackSetOutput();
  factory DeleteStackSetOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteStackSetOutput();
  }
}

/// [<code>Service-managed</code> permissions] The AWS Organizations accounts to
/// which StackSets deploys. StackSets does not deploy stack instances to the
/// organization management account, even if the organization management account
/// is in your organization or in an OU in your organization.
///
/// For update operations, you can specify either <code>Accounts</code> or
/// <code>OrganizationalUnitIds</code>. For create and delete operations,
/// specify <code>OrganizationalUnitIds</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeploymentTargets {
  /// The names of one or more AWS accounts for which you want to deploy stack set
  /// updates.
  @_s.JsonKey(name: 'Accounts')
  final List<String> accounts;

  /// The organization root ID or organizational unit (OU) IDs to which StackSets
  /// deploys.
  @_s.JsonKey(name: 'OrganizationalUnitIds')
  final List<String> organizationalUnitIds;

  DeploymentTargets({
    this.accounts,
    this.organizationalUnitIds,
  });
  factory DeploymentTargets.fromXml(_s.XmlElement elem) {
    return DeploymentTargets(
      accounts: _s
          .extractXmlChild(elem, 'Accounts')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      organizationalUnitIds: _s
          .extractXmlChild(elem, 'OrganizationalUnitIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() => _$DeploymentTargetsToJson(this);
}

enum DeprecatedStatus {
  @_s.JsonValue('LIVE')
  live,
  @_s.JsonValue('DEPRECATED')
  deprecated,
}

extension on DeprecatedStatus {
  String toValue() {
    switch (this) {
      case DeprecatedStatus.live:
        return 'LIVE';
      case DeprecatedStatus.deprecated:
        return 'DEPRECATED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  DeprecatedStatus toDeprecatedStatus() {
    switch (this) {
      case 'LIVE':
        return DeprecatedStatus.live;
      case 'DEPRECATED':
        return DeprecatedStatus.deprecated;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class DeregisterTypeOutput {
  DeregisterTypeOutput();
  factory DeregisterTypeOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeregisterTypeOutput();
  }
}

/// The output for the <a>DescribeAccountLimits</a> action.
class DescribeAccountLimitsOutput {
  /// An account limit structure that contain a list of AWS CloudFormation account
  /// limits and their values.
  final List<AccountLimit> accountLimits;

  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of limits. If no additional page exists, this value is null.
  final String nextToken;

  DescribeAccountLimitsOutput({
    this.accountLimits,
    this.nextToken,
  });
  factory DescribeAccountLimitsOutput.fromXml(_s.XmlElement elem) {
    return DescribeAccountLimitsOutput(
      accountLimits: _s.extractXmlChild(elem, 'AccountLimits')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => AccountLimit.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// The output for the <a>DescribeChangeSet</a> action.
class DescribeChangeSetOutput {
  /// If you execute the change set, the list of capabilities that were explicitly
  /// acknowledged when the change set was created.
  final List<Capability> capabilities;

  /// The ARN of the change set.
  final String changeSetId;

  /// The name of the change set.
  final String changeSetName;

  /// A list of <code>Change</code> structures that describes the resources AWS
  /// CloudFormation changes if you execute the change set.
  final List<Change> changes;

  /// The start time when the change set was created, in UTC.
  final DateTime creationTime;

  /// Information about the change set.
  final String description;

  /// If the change set execution status is <code>AVAILABLE</code>, you can
  /// execute the change set. If you can’t execute the change set, the status
  /// indicates why. For example, a change set might be in an
  /// <code>UNAVAILABLE</code> state because AWS CloudFormation is still creating
  /// it or in an <code>OBSOLETE</code> state because the stack was already
  /// updated.
  final ExecutionStatus executionStatus;

  /// Verifies if <code>IncludeNestedStacks</code> is set to <code>True</code>.
  final bool includeNestedStacks;

  /// If the output exceeds 1 MB, a string that identifies the next page of
  /// changes. If there is no additional page, this value is null.
  final String nextToken;

  /// The ARNs of the Amazon Simple Notification Service (Amazon SNS) topics that
  /// will be associated with the stack if you execute the change set.
  final List<String> notificationARNs;

  /// A list of <code>Parameter</code> structures that describes the input
  /// parameters and their values used to create the change set. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html">Parameter</a>
  /// data type.
  final List<Parameter> parameters;

  /// Specifies the change set ID of the parent change set in the current nested
  /// change set hierarchy.
  final String parentChangeSetId;

  /// The rollback triggers for AWS CloudFormation to monitor during stack
  /// creation and updating operations, and for the specified monitoring period
  /// afterwards.
  final RollbackConfiguration rollbackConfiguration;

  /// Specifies the change set ID of the root change set in the current nested
  /// change set hierarchy.
  final String rootChangeSetId;

  /// The ARN of the stack that is associated with the change set.
  final String stackId;

  /// The name of the stack that is associated with the change set.
  final String stackName;

  /// The current status of the change set, such as
  /// <code>CREATE_IN_PROGRESS</code>, <code>CREATE_COMPLETE</code>, or
  /// <code>FAILED</code>.
  final ChangeSetStatus status;

  /// A description of the change set's status. For example, if your attempt to
  /// create a change set failed, AWS CloudFormation shows the error message.
  final String statusReason;

  /// If you execute the change set, the tags that will be associated with the
  /// stack.
  final List<Tag> tags;

  DescribeChangeSetOutput({
    this.capabilities,
    this.changeSetId,
    this.changeSetName,
    this.changes,
    this.creationTime,
    this.description,
    this.executionStatus,
    this.includeNestedStacks,
    this.nextToken,
    this.notificationARNs,
    this.parameters,
    this.parentChangeSetId,
    this.rollbackConfiguration,
    this.rootChangeSetId,
    this.stackId,
    this.stackName,
    this.status,
    this.statusReason,
    this.tags,
  });
  factory DescribeChangeSetOutput.fromXml(_s.XmlElement elem) {
    return DescribeChangeSetOutput(
      capabilities: _s.extractXmlChild(elem, 'Capabilities')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toCapability())
          .toList()),
      changeSetId: _s.extractXmlStringValue(elem, 'ChangeSetId'),
      changeSetName: _s.extractXmlStringValue(elem, 'ChangeSetName'),
      changes: _s.extractXmlChild(elem, 'Changes')?.let((elem) =>
          elem.findElements('member').map((c) => Change.fromXml(c)).toList()),
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      executionStatus: _s
          .extractXmlStringValue(elem, 'ExecutionStatus')
          ?.toExecutionStatus(),
      includeNestedStacks: _s.extractXmlBoolValue(elem, 'IncludeNestedStacks'),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      notificationARNs: _s
          .extractXmlChild(elem, 'NotificationARNs')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('member')
          .map((c) => Parameter.fromXml(c))
          .toList()),
      parentChangeSetId: _s.extractXmlStringValue(elem, 'ParentChangeSetId'),
      rollbackConfiguration: _s
          .extractXmlChild(elem, 'RollbackConfiguration')
          ?.let((e) => RollbackConfiguration.fromXml(e)),
      rootChangeSetId: _s.extractXmlStringValue(elem, 'RootChangeSetId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toChangeSetStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

class DescribeStackDriftDetectionStatusOutput {
  /// The status of the stack drift detection operation.
  ///
  /// <ul>
  /// <li>
  /// <code>DETECTION_COMPLETE</code>: The stack drift detection operation has
  /// successfully completed for all resources in the stack that support drift
  /// detection. (Resources that do not currently support stack detection remain
  /// unchecked.)
  ///
  /// If you specified logical resource IDs for AWS CloudFormation to use as a
  /// filter for the stack drift detection operation, only the resources with
  /// those logical IDs are checked for drift.
  /// </li>
  /// <li>
  /// <code>DETECTION_FAILED</code>: The stack drift detection operation has
  /// failed for at least one resource in the stack. Results will be available for
  /// resources on which AWS CloudFormation successfully completed drift
  /// detection.
  /// </li>
  /// <li>
  /// <code>DETECTION_IN_PROGRESS</code>: The stack drift detection operation is
  /// currently in progress.
  /// </li>
  /// </ul>
  final StackDriftDetectionStatus detectionStatus;

  /// The ID of the drift detection results of this operation.
  ///
  /// AWS CloudFormation generates new results, with a new drift detection ID,
  /// each time this operation is run. However, the number of reports AWS
  /// CloudFormation retains for any given stack, and for how long, may vary.
  final String stackDriftDetectionId;

  /// The ID of the stack.
  final String stackId;

  /// Time at which the stack drift detection operation was initiated.
  final DateTime timestamp;

  /// The reason the stack drift detection operation has its current status.
  final String detectionStatusReason;

  /// Total number of stack resources that have drifted. This is NULL until the
  /// drift detection operation reaches a status of
  /// <code>DETECTION_COMPLETE</code>. This value will be 0 for stacks whose drift
  /// status is <code>IN_SYNC</code>.
  final int driftedStackResourceCount;

  /// Status of the stack's actual configuration compared to its expected
  /// configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: The stack differs from its expected template
  /// configuration. A stack is considered to have drifted if one or more of its
  /// resources have drifted.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack
  /// differs from its expected template configuration.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The stack's actual configuration matches its expected
  /// template configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus stackDriftStatus;

  DescribeStackDriftDetectionStatusOutput({
    @_s.required this.detectionStatus,
    @_s.required this.stackDriftDetectionId,
    @_s.required this.stackId,
    @_s.required this.timestamp,
    this.detectionStatusReason,
    this.driftedStackResourceCount,
    this.stackDriftStatus,
  });
  factory DescribeStackDriftDetectionStatusOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackDriftDetectionStatusOutput(
      detectionStatus: _s
          .extractXmlStringValue(elem, 'DetectionStatus')
          ?.toStackDriftDetectionStatus(),
      stackDriftDetectionId:
          _s.extractXmlStringValue(elem, 'StackDriftDetectionId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
      detectionStatusReason:
          _s.extractXmlStringValue(elem, 'DetectionStatusReason'),
      driftedStackResourceCount:
          _s.extractXmlIntValue(elem, 'DriftedStackResourceCount'),
      stackDriftStatus: _s
          .extractXmlStringValue(elem, 'StackDriftStatus')
          ?.toStackDriftStatus(),
    );
  }
}

/// The output for a <a>DescribeStackEvents</a> action.
class DescribeStackEventsOutput {
  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of events. If no additional page exists, this value is null.
  final String nextToken;

  /// A list of <code>StackEvents</code> structures.
  final List<StackEvent> stackEvents;

  DescribeStackEventsOutput({
    this.nextToken,
    this.stackEvents,
  });
  factory DescribeStackEventsOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackEventsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stackEvents: _s.extractXmlChild(elem, 'StackEvents')?.let((elem) => elem
          .findElements('member')
          .map((c) => StackEvent.fromXml(c))
          .toList()),
    );
  }
}

class DescribeStackInstanceOutput {
  /// The stack instance that matches the specified request parameters.
  final StackInstance stackInstance;

  DescribeStackInstanceOutput({
    this.stackInstance,
  });
  factory DescribeStackInstanceOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackInstanceOutput(
      stackInstance: _s
          .extractXmlChild(elem, 'StackInstance')
          ?.let((e) => StackInstance.fromXml(e)),
    );
  }
}

class DescribeStackResourceDriftsOutput {
  /// Drift information for the resources that have been checked for drift in the
  /// specified stack. This includes actual and expected configuration values for
  /// resources where AWS CloudFormation detects drift.
  ///
  /// For a given stack, there will be one <code>StackResourceDrift</code> for
  /// each stack resource that has been checked for drift. Resources that have not
  /// yet been checked for drift are not included. Resources that do not currently
  /// support drift detection are not checked, and so not included. For a list of
  /// resources that support drift detection, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>.
  final List<StackResourceDrift> stackResourceDrifts;

  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>DescribeStackResourceDrifts</code> again and assign that
  /// token to the request object's <code>NextToken</code> parameter. If the
  /// request returns all results, <code>NextToken</code> is set to
  /// <code>null</code>.
  final String nextToken;

  DescribeStackResourceDriftsOutput({
    @_s.required this.stackResourceDrifts,
    this.nextToken,
  });
  factory DescribeStackResourceDriftsOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackResourceDriftsOutput(
      stackResourceDrifts: _s.extractXmlChild(elem, 'StackResourceDrifts')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => StackResourceDrift.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// The output for a <a>DescribeStackResource</a> action.
class DescribeStackResourceOutput {
  /// A <code>StackResourceDetail</code> structure containing the description of
  /// the specified resource in the specified stack.
  final StackResourceDetail stackResourceDetail;

  DescribeStackResourceOutput({
    this.stackResourceDetail,
  });
  factory DescribeStackResourceOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackResourceOutput(
      stackResourceDetail: _s
          .extractXmlChild(elem, 'StackResourceDetail')
          ?.let((e) => StackResourceDetail.fromXml(e)),
    );
  }
}

/// The output for a <a>DescribeStackResources</a> action.
class DescribeStackResourcesOutput {
  /// A list of <code>StackResource</code> structures.
  final List<StackResource> stackResources;

  DescribeStackResourcesOutput({
    this.stackResources,
  });
  factory DescribeStackResourcesOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackResourcesOutput(
      stackResources: _s.extractXmlChild(elem, 'StackResources')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => StackResource.fromXml(c))
              .toList()),
    );
  }
}

class DescribeStackSetOperationOutput {
  /// The specified stack set operation.
  final StackSetOperation stackSetOperation;

  DescribeStackSetOperationOutput({
    this.stackSetOperation,
  });
  factory DescribeStackSetOperationOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackSetOperationOutput(
      stackSetOperation: _s
          .extractXmlChild(elem, 'StackSetOperation')
          ?.let((e) => StackSetOperation.fromXml(e)),
    );
  }
}

class DescribeStackSetOutput {
  /// The specified stack set.
  final StackSet stackSet;

  DescribeStackSetOutput({
    this.stackSet,
  });
  factory DescribeStackSetOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackSetOutput(
      stackSet:
          _s.extractXmlChild(elem, 'StackSet')?.let((e) => StackSet.fromXml(e)),
    );
  }
}

/// The output for a <a>DescribeStacks</a> action.
class DescribeStacksOutput {
  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of stacks. If no additional page exists, this value is null.
  final String nextToken;

  /// A list of stack structures.
  final List<Stack> stacks;

  DescribeStacksOutput({
    this.nextToken,
    this.stacks,
  });
  factory DescribeStacksOutput.fromXml(_s.XmlElement elem) {
    return DescribeStacksOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stacks: _s.extractXmlChild(elem, 'Stacks')?.let((elem) =>
          elem.findElements('member').map((c) => Stack.fromXml(c)).toList()),
    );
  }
}

class DescribeTypeOutput {
  /// The Amazon Resource Name (ARN) of the type.
  final String arn;

  /// The ID of the default version of the type. The default version is used when
  /// the type version is not specified.
  ///
  /// To set the default version of a type, use <code>
  /// <a>SetTypeDefaultVersion</a> </code>.
  final String defaultVersionId;

  /// The deprecation status of the type.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>LIVE</code>: The type is registered and can be used in CloudFormation
  /// operations, dependent on its provisioning behavior and visibility scope.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code>: The type has been deregistered and can no longer be
  /// used in CloudFormation operations.
  /// </li>
  /// </ul>
  final DeprecatedStatus deprecatedStatus;

  /// The description of the registered type.
  final String description;

  /// The URL of a page providing detailed documentation for this type.
  final String documentationUrl;

  /// The Amazon Resource Name (ARN) of the IAM execution role used to register
  /// the type. If your resource type calls AWS APIs in any of its handlers, you
  /// must create an <i> <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// execution role</a> </i> that includes the necessary permissions to call
  /// those AWS APIs, and provision that execution role in your account.
  /// CloudFormation then assumes that execution role to provide your resource
  /// type with the appropriate credentials.
  final String executionRoleArn;

  /// Whether the specified type version is set as the default version.
  final bool isDefaultVersion;

  /// When the specified type version was registered.
  final DateTime lastUpdated;

  /// Contains logging configuration information for a type.
  final LoggingConfig loggingConfig;

  /// The provisioning behavior of the type. AWS CloudFormation determines the
  /// provisioning type during registration, based on the types of handlers in the
  /// schema handler package submitted.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>FULLY_MUTABLE</code>: The type includes an update handler to process
  /// updates to the type during stack update operations.
  /// </li>
  /// <li>
  /// <code>IMMUTABLE</code>: The type does not include an update handler, so the
  /// type cannot be updated and must instead be replaced during stack update
  /// operations.
  /// </li>
  /// <li>
  /// <code>NON_PROVISIONABLE</code>: The type does not include all of the
  /// following handlers, and therefore cannot actually be provisioned.
  ///
  /// <ul>
  /// <li>
  /// create
  /// </li>
  /// <li>
  /// read
  /// </li>
  /// <li>
  /// delete
  /// </li>
  /// </ul> </li>
  /// </ul>
  final ProvisioningType provisioningType;

  /// The schema that defines the type.
  ///
  /// For more information on type schemas, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">Resource
  /// Provider Schema</a> in the <i>CloudFormation CLI User Guide</i>.
  final String schema;

  /// The URL of the source code for the type.
  final String sourceUrl;

  /// When the specified type version was registered.
  final DateTime timeCreated;

  /// The kind of type.
  ///
  /// Currently the only valid value is <code>RESOURCE</code>.
  final RegistryType type;

  /// The name of the registered type.
  final String typeName;

  /// The scope at which the type is visible and usable in CloudFormation
  /// operations.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>PRIVATE</code>: The type is only visible and usable within the account
  /// in which it is registered. Currently, AWS CloudFormation marks any types you
  /// register as <code>PRIVATE</code>.
  /// </li>
  /// <li>
  /// <code>PUBLIC</code>: The type is publically visible and usable within any
  /// Amazon account.
  /// </li>
  /// </ul>
  final Visibility visibility;

  DescribeTypeOutput({
    this.arn,
    this.defaultVersionId,
    this.deprecatedStatus,
    this.description,
    this.documentationUrl,
    this.executionRoleArn,
    this.isDefaultVersion,
    this.lastUpdated,
    this.loggingConfig,
    this.provisioningType,
    this.schema,
    this.sourceUrl,
    this.timeCreated,
    this.type,
    this.typeName,
    this.visibility,
  });
  factory DescribeTypeOutput.fromXml(_s.XmlElement elem) {
    return DescribeTypeOutput(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      defaultVersionId: _s.extractXmlStringValue(elem, 'DefaultVersionId'),
      deprecatedStatus: _s
          .extractXmlStringValue(elem, 'DeprecatedStatus')
          ?.toDeprecatedStatus(),
      description: _s.extractXmlStringValue(elem, 'Description'),
      documentationUrl: _s.extractXmlStringValue(elem, 'DocumentationUrl'),
      executionRoleArn: _s.extractXmlStringValue(elem, 'ExecutionRoleArn'),
      isDefaultVersion: _s.extractXmlBoolValue(elem, 'IsDefaultVersion'),
      lastUpdated: _s.extractXmlDateTimeValue(elem, 'LastUpdated'),
      loggingConfig: _s
          .extractXmlChild(elem, 'LoggingConfig')
          ?.let((e) => LoggingConfig.fromXml(e)),
      provisioningType: _s
          .extractXmlStringValue(elem, 'ProvisioningType')
          ?.toProvisioningType(),
      schema: _s.extractXmlStringValue(elem, 'Schema'),
      sourceUrl: _s.extractXmlStringValue(elem, 'SourceUrl'),
      timeCreated: _s.extractXmlDateTimeValue(elem, 'TimeCreated'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toRegistryType(),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
      visibility: _s.extractXmlStringValue(elem, 'Visibility')?.toVisibility(),
    );
  }
}

class DescribeTypeRegistrationOutput {
  /// The description of the type registration request.
  final String description;

  /// The current status of the type registration request.
  final RegistrationStatus progressStatus;

  /// The Amazon Resource Name (ARN) of the type being registered.
  ///
  /// For registration requests with a <code>ProgressStatus</code> of other than
  /// <code>COMPLETE</code>, this will be <code>null</code>.
  final String typeArn;

  /// The Amazon Resource Name (ARN) of this specific version of the type being
  /// registered.
  ///
  /// For registration requests with a <code>ProgressStatus</code> of other than
  /// <code>COMPLETE</code>, this will be <code>null</code>.
  final String typeVersionArn;

  DescribeTypeRegistrationOutput({
    this.description,
    this.progressStatus,
    this.typeArn,
    this.typeVersionArn,
  });
  factory DescribeTypeRegistrationOutput.fromXml(_s.XmlElement elem) {
    return DescribeTypeRegistrationOutput(
      description: _s.extractXmlStringValue(elem, 'Description'),
      progressStatus: _s
          .extractXmlStringValue(elem, 'ProgressStatus')
          ?.toRegistrationStatus(),
      typeArn: _s.extractXmlStringValue(elem, 'TypeArn'),
      typeVersionArn: _s.extractXmlStringValue(elem, 'TypeVersionArn'),
    );
  }
}

class DetectStackDriftOutput {
  /// The ID of the drift detection results of this operation.
  ///
  /// AWS CloudFormation generates new results, with a new drift detection ID,
  /// each time this operation is run. However, the number of drift results AWS
  /// CloudFormation retains for any given stack, and for how long, may vary.
  final String stackDriftDetectionId;

  DetectStackDriftOutput({
    @_s.required this.stackDriftDetectionId,
  });
  factory DetectStackDriftOutput.fromXml(_s.XmlElement elem) {
    return DetectStackDriftOutput(
      stackDriftDetectionId:
          _s.extractXmlStringValue(elem, 'StackDriftDetectionId'),
    );
  }
}

class DetectStackResourceDriftOutput {
  /// Information about whether the resource's actual configuration has drifted
  /// from its expected template configuration, including actual and expected
  /// property values and any differences detected.
  final StackResourceDrift stackResourceDrift;

  DetectStackResourceDriftOutput({
    @_s.required this.stackResourceDrift,
  });
  factory DetectStackResourceDriftOutput.fromXml(_s.XmlElement elem) {
    return DetectStackResourceDriftOutput(
      stackResourceDrift: _s
          .extractXmlChild(elem, 'StackResourceDrift')
          ?.let((e) => StackResourceDrift.fromXml(e)),
    );
  }
}

class DetectStackSetDriftOutput {
  /// The ID of the drift detection stack set operation.
  ///
  /// you can use this operation id with <code> <a>DescribeStackSetOperation</a>
  /// </code> to monitor the progress of the drift detection operation.
  final String operationId;

  DetectStackSetDriftOutput({
    this.operationId,
  });
  factory DetectStackSetDriftOutput.fromXml(_s.XmlElement elem) {
    return DetectStackSetDriftOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }
}

enum DifferenceType {
  @_s.JsonValue('ADD')
  add,
  @_s.JsonValue('REMOVE')
  remove,
  @_s.JsonValue('NOT_EQUAL')
  notEqual,
}

extension on String {
  DifferenceType toDifferenceType() {
    switch (this) {
      case 'ADD':
        return DifferenceType.add;
      case 'REMOVE':
        return DifferenceType.remove;
      case 'NOT_EQUAL':
        return DifferenceType.notEqual;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The output for a <a>EstimateTemplateCost</a> action.
class EstimateTemplateCostOutput {
  /// An AWS Simple Monthly Calculator URL with a query string that describes the
  /// resources required to run the template.
  final String url;

  EstimateTemplateCostOutput({
    this.url,
  });
  factory EstimateTemplateCostOutput.fromXml(_s.XmlElement elem) {
    return EstimateTemplateCostOutput(
      url: _s.extractXmlStringValue(elem, 'Url'),
    );
  }
}

enum EvaluationType {
  @_s.JsonValue('Static')
  static,
  @_s.JsonValue('Dynamic')
  dynamic,
}

extension on String {
  EvaluationType toEvaluationType() {
    switch (this) {
      case 'Static':
        return EvaluationType.static;
      case 'Dynamic':
        return EvaluationType.dynamic;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The output for the <a>ExecuteChangeSet</a> action.
class ExecuteChangeSetOutput {
  ExecuteChangeSetOutput();
  factory ExecuteChangeSetOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ExecuteChangeSetOutput();
  }
}

enum ExecutionStatus {
  @_s.JsonValue('UNAVAILABLE')
  unavailable,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('EXECUTE_IN_PROGRESS')
  executeInProgress,
  @_s.JsonValue('EXECUTE_COMPLETE')
  executeComplete,
  @_s.JsonValue('EXECUTE_FAILED')
  executeFailed,
  @_s.JsonValue('OBSOLETE')
  obsolete,
}

extension on String {
  ExecutionStatus toExecutionStatus() {
    switch (this) {
      case 'UNAVAILABLE':
        return ExecutionStatus.unavailable;
      case 'AVAILABLE':
        return ExecutionStatus.available;
      case 'EXECUTE_IN_PROGRESS':
        return ExecutionStatus.executeInProgress;
      case 'EXECUTE_COMPLETE':
        return ExecutionStatus.executeComplete;
      case 'EXECUTE_FAILED':
        return ExecutionStatus.executeFailed;
      case 'OBSOLETE':
        return ExecutionStatus.obsolete;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The <code>Export</code> structure describes the exported output values for a
/// stack.
class Export {
  /// The stack that contains the exported output name and value.
  final String exportingStackId;

  /// The name of exported output value. Use this name and the
  /// <code>Fn::ImportValue</code> function to import the associated value into
  /// other stacks. The name is defined in the <code>Export</code> field in the
  /// associated stack's <code>Outputs</code> section.
  final String name;

  /// The value of the exported output, such as a resource physical ID. This value
  /// is defined in the <code>Export</code> field in the associated stack's
  /// <code>Outputs</code> section.
  final String value;

  Export({
    this.exportingStackId,
    this.name,
    this.value,
  });
  factory Export.fromXml(_s.XmlElement elem) {
    return Export(
      exportingStackId: _s.extractXmlStringValue(elem, 'ExportingStackId'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }
}

/// The output for the <a>GetStackPolicy</a> action.
class GetStackPolicyOutput {
  /// Structure containing the stack policy body. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html">
  /// Prevent Updates to Stack Resources</a> in the AWS CloudFormation User
  /// Guide.)
  final String stackPolicyBody;

  GetStackPolicyOutput({
    this.stackPolicyBody,
  });
  factory GetStackPolicyOutput.fromXml(_s.XmlElement elem) {
    return GetStackPolicyOutput(
      stackPolicyBody: _s.extractXmlStringValue(elem, 'StackPolicyBody'),
    );
  }
}

/// The output for <a>GetTemplate</a> action.
class GetTemplateOutput {
  /// The stage of the template that you can retrieve. For stacks, the
  /// <code>Original</code> and <code>Processed</code> templates are always
  /// available. For change sets, the <code>Original</code> template is always
  /// available. After AWS CloudFormation finishes creating the change set, the
  /// <code>Processed</code> template becomes available.
  final List<TemplateStage> stagesAvailable;

  /// Structure containing the template body. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the AWS CloudFormation User Guide.)
  ///
  /// AWS CloudFormation returns the same template that was used when the stack
  /// was created.
  final String templateBody;

  GetTemplateOutput({
    this.stagesAvailable,
    this.templateBody,
  });
  factory GetTemplateOutput.fromXml(_s.XmlElement elem) {
    return GetTemplateOutput(
      stagesAvailable: _s.extractXmlChild(elem, 'StagesAvailable')?.let(
          (elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toTemplateStage())
              .toList()),
      templateBody: _s.extractXmlStringValue(elem, 'TemplateBody'),
    );
  }
}

/// The output for the <a>GetTemplateSummary</a> action.
class GetTemplateSummaryOutput {
  /// The capabilities found within the template. If your template contains IAM
  /// resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value
  /// for this parameter when you use the <a>CreateStack</a> or <a>UpdateStack</a>
  /// actions with your template; otherwise, those actions return an
  /// InsufficientCapabilities error.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates</a>.
  final List<Capability> capabilities;

  /// The list of resources that generated the values in the
  /// <code>Capabilities</code> response element.
  final String capabilitiesReason;

  /// A list of the transforms that are declared in the template.
  final List<String> declaredTransforms;

  /// The value that is defined in the <code>Description</code> property of the
  /// template.
  final String description;

  /// The value that is defined for the <code>Metadata</code> property of the
  /// template.
  final String metadata;

  /// A list of parameter declarations that describe various properties for each
  /// parameter.
  final List<ParameterDeclaration> parameters;

  /// A list of resource identifier summaries that describe the target resources
  /// of an import operation and the properties you can provide during the import
  /// to identify the target resources. For example, <code>BucketName</code> is a
  /// possible identifier property for an <code>AWS::S3::Bucket</code> resource.
  final List<ResourceIdentifierSummary> resourceIdentifierSummaries;

  /// A list of all the template resource types that are defined in the template,
  /// such as <code>AWS::EC2::Instance</code>, <code>AWS::Dynamo::Table</code>,
  /// and <code>Custom::MyCustomInstance</code>.
  final List<String> resourceTypes;

  /// The AWS template format version, which identifies the capabilities of the
  /// template.
  final String version;

  GetTemplateSummaryOutput({
    this.capabilities,
    this.capabilitiesReason,
    this.declaredTransforms,
    this.description,
    this.metadata,
    this.parameters,
    this.resourceIdentifierSummaries,
    this.resourceTypes,
    this.version,
  });
  factory GetTemplateSummaryOutput.fromXml(_s.XmlElement elem) {
    return GetTemplateSummaryOutput(
      capabilities: _s.extractXmlChild(elem, 'Capabilities')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toCapability())
          .toList()),
      capabilitiesReason: _s.extractXmlStringValue(elem, 'CapabilitiesReason'),
      declaredTransforms: _s
          .extractXmlChild(elem, 'DeclaredTransforms')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      description: _s.extractXmlStringValue(elem, 'Description'),
      metadata: _s.extractXmlStringValue(elem, 'Metadata'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('member')
          .map((c) => ParameterDeclaration.fromXml(c))
          .toList()),
      resourceIdentifierSummaries: _s
          .extractXmlChild(elem, 'ResourceIdentifierSummaries')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => ResourceIdentifierSummary.fromXml(c))
              .toList()),
      resourceTypes: _s
          .extractXmlChild(elem, 'ResourceTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }
}

enum HandlerErrorCode {
  @_s.JsonValue('NotUpdatable')
  notUpdatable,
  @_s.JsonValue('InvalidRequest')
  invalidRequest,
  @_s.JsonValue('AccessDenied')
  accessDenied,
  @_s.JsonValue('InvalidCredentials')
  invalidCredentials,
  @_s.JsonValue('AlreadyExists')
  alreadyExists,
  @_s.JsonValue('NotFound')
  notFound,
  @_s.JsonValue('ResourceConflict')
  resourceConflict,
  @_s.JsonValue('Throttling')
  throttling,
  @_s.JsonValue('ServiceLimitExceeded')
  serviceLimitExceeded,
  @_s.JsonValue('NotStabilized')
  notStabilized,
  @_s.JsonValue('GeneralServiceException')
  generalServiceException,
  @_s.JsonValue('ServiceInternalError')
  serviceInternalError,
  @_s.JsonValue('NetworkFailure')
  networkFailure,
  @_s.JsonValue('InternalFailure')
  internalFailure,
}

extension on HandlerErrorCode {
  String toValue() {
    switch (this) {
      case HandlerErrorCode.notUpdatable:
        return 'NotUpdatable';
      case HandlerErrorCode.invalidRequest:
        return 'InvalidRequest';
      case HandlerErrorCode.accessDenied:
        return 'AccessDenied';
      case HandlerErrorCode.invalidCredentials:
        return 'InvalidCredentials';
      case HandlerErrorCode.alreadyExists:
        return 'AlreadyExists';
      case HandlerErrorCode.notFound:
        return 'NotFound';
      case HandlerErrorCode.resourceConflict:
        return 'ResourceConflict';
      case HandlerErrorCode.throttling:
        return 'Throttling';
      case HandlerErrorCode.serviceLimitExceeded:
        return 'ServiceLimitExceeded';
      case HandlerErrorCode.notStabilized:
        return 'NotStabilized';
      case HandlerErrorCode.generalServiceException:
        return 'GeneralServiceException';
      case HandlerErrorCode.serviceInternalError:
        return 'ServiceInternalError';
      case HandlerErrorCode.networkFailure:
        return 'NetworkFailure';
      case HandlerErrorCode.internalFailure:
        return 'InternalFailure';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  HandlerErrorCode toHandlerErrorCode() {
    switch (this) {
      case 'NotUpdatable':
        return HandlerErrorCode.notUpdatable;
      case 'InvalidRequest':
        return HandlerErrorCode.invalidRequest;
      case 'AccessDenied':
        return HandlerErrorCode.accessDenied;
      case 'InvalidCredentials':
        return HandlerErrorCode.invalidCredentials;
      case 'AlreadyExists':
        return HandlerErrorCode.alreadyExists;
      case 'NotFound':
        return HandlerErrorCode.notFound;
      case 'ResourceConflict':
        return HandlerErrorCode.resourceConflict;
      case 'Throttling':
        return HandlerErrorCode.throttling;
      case 'ServiceLimitExceeded':
        return HandlerErrorCode.serviceLimitExceeded;
      case 'NotStabilized':
        return HandlerErrorCode.notStabilized;
      case 'GeneralServiceException':
        return HandlerErrorCode.generalServiceException;
      case 'ServiceInternalError':
        return HandlerErrorCode.serviceInternalError;
      case 'NetworkFailure':
        return HandlerErrorCode.networkFailure;
      case 'InternalFailure':
        return HandlerErrorCode.internalFailure;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The output for the <a>ListChangeSets</a> action.
class ListChangeSetsOutput {
  /// If the output exceeds 1 MB, a string that identifies the next page of change
  /// sets. If there is no additional page, this value is null.
  final String nextToken;

  /// A list of <code>ChangeSetSummary</code> structures that provides the ID and
  /// status of each change set for the specified stack.
  final List<ChangeSetSummary> summaries;

  ListChangeSetsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListChangeSetsOutput.fromXml(_s.XmlElement elem) {
    return ListChangeSetsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map((c) => ChangeSetSummary.fromXml(c))
          .toList()),
    );
  }
}

class ListExportsOutput {
  /// The output for the <a>ListExports</a> action.
  final List<Export> exports;

  /// If the output exceeds 100 exported output values, a string that identifies
  /// the next page of exports. If there is no additional page, this value is
  /// null.
  final String nextToken;

  ListExportsOutput({
    this.exports,
    this.nextToken,
  });
  factory ListExportsOutput.fromXml(_s.XmlElement elem) {
    return ListExportsOutput(
      exports: _s.extractXmlChild(elem, 'Exports')?.let((elem) =>
          elem.findElements('member').map((c) => Export.fromXml(c)).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class ListImportsOutput {
  /// A list of stack names that are importing the specified exported output
  /// value.
  final List<String> imports;

  /// A string that identifies the next page of exports. If there is no additional
  /// page, this value is null.
  final String nextToken;

  ListImportsOutput({
    this.imports,
    this.nextToken,
  });
  factory ListImportsOutput.fromXml(_s.XmlElement elem) {
    return ListImportsOutput(
      imports: _s
          .extractXmlChild(elem, 'Imports')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class ListStackInstancesOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListStackInstances</code> again and assign that token to
  /// the request object's <code>NextToken</code> parameter. If the request
  /// returns all results, <code>NextToken</code> is set to <code>null</code>.
  final String nextToken;

  /// A list of <code>StackInstanceSummary</code> structures that contain
  /// information about the specified stack instances.
  final List<StackInstanceSummary> summaries;

  ListStackInstancesOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return ListStackInstancesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map((c) => StackInstanceSummary.fromXml(c))
          .toList()),
    );
  }
}

/// The output for a <a>ListStackResources</a> action.
class ListStackResourcesOutput {
  /// If the output exceeds 1 MB, a string that identifies the next page of stack
  /// resources. If no additional page exists, this value is null.
  final String nextToken;

  /// A list of <code>StackResourceSummary</code> structures.
  final List<StackResourceSummary> stackResourceSummaries;

  ListStackResourcesOutput({
    this.nextToken,
    this.stackResourceSummaries,
  });
  factory ListStackResourcesOutput.fromXml(_s.XmlElement elem) {
    return ListStackResourcesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stackResourceSummaries: _s
          .extractXmlChild(elem, 'StackResourceSummaries')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => StackResourceSummary.fromXml(c))
              .toList()),
    );
  }
}

class ListStackSetOperationResultsOutput {
  /// If the request doesn't return all results, <code>NextToken</code> is set to
  /// a token. To retrieve the next set of results, call
  /// <code>ListOperationResults</code> again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If there are no remaining
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String nextToken;

  /// A list of <code>StackSetOperationResultSummary</code> structures that
  /// contain information about the specified operation results, for accounts and
  /// Regions that are included in the operation.
  final List<StackSetOperationResultSummary> summaries;

  ListStackSetOperationResultsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackSetOperationResultsOutput.fromXml(_s.XmlElement elem) {
    return ListStackSetOperationResultsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map((c) => StackSetOperationResultSummary.fromXml(c))
          .toList()),
    );
  }
}

class ListStackSetOperationsOutput {
  /// If the request doesn't return all results, <code>NextToken</code> is set to
  /// a token. To retrieve the next set of results, call
  /// <code>ListOperationResults</code> again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If there are no remaining
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String nextToken;

  /// A list of <code>StackSetOperationSummary</code> structures that contain
  /// summary information about operations for the specified stack set.
  final List<StackSetOperationSummary> summaries;

  ListStackSetOperationsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackSetOperationsOutput.fromXml(_s.XmlElement elem) {
    return ListStackSetOperationsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map((c) => StackSetOperationSummary.fromXml(c))
          .toList()),
    );
  }
}

class ListStackSetsOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListStackInstances</code> again and assign that token to
  /// the request object's <code>NextToken</code> parameter. If the request
  /// returns all results, <code>NextToken</code> is set to <code>null</code>.
  final String nextToken;

  /// A list of <code>StackSetSummary</code> structures that contain information
  /// about the user's stack sets.
  final List<StackSetSummary> summaries;

  ListStackSetsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackSetsOutput.fromXml(_s.XmlElement elem) {
    return ListStackSetsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map((c) => StackSetSummary.fromXml(c))
          .toList()),
    );
  }
}

/// The output for <a>ListStacks</a> action.
class ListStacksOutput {
  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of stacks. If no additional page exists, this value is null.
  final String nextToken;

  /// A list of <code>StackSummary</code> structures containing information about
  /// the specified stacks.
  final List<StackSummary> stackSummaries;

  ListStacksOutput({
    this.nextToken,
    this.stackSummaries,
  });
  factory ListStacksOutput.fromXml(_s.XmlElement elem) {
    return ListStacksOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stackSummaries: _s.extractXmlChild(elem, 'StackSummaries')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => StackSummary.fromXml(c))
              .toList()),
    );
  }
}

class ListTypeRegistrationsOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call this action again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String nextToken;

  /// A list of type registration tokens.
  ///
  /// Use <code> <a>DescribeTypeRegistration</a> </code> to return detailed
  /// information about a type registration request.
  final List<String> registrationTokenList;

  ListTypeRegistrationsOutput({
    this.nextToken,
    this.registrationTokenList,
  });
  factory ListTypeRegistrationsOutput.fromXml(_s.XmlElement elem) {
    return ListTypeRegistrationsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      registrationTokenList: _s
          .extractXmlChild(elem, 'RegistrationTokenList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

class ListTypeVersionsOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call this action again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String nextToken;

  /// A list of <code>TypeVersionSummary</code> structures that contain
  /// information about the specified type's versions.
  final List<TypeVersionSummary> typeVersionSummaries;

  ListTypeVersionsOutput({
    this.nextToken,
    this.typeVersionSummaries,
  });
  factory ListTypeVersionsOutput.fromXml(_s.XmlElement elem) {
    return ListTypeVersionsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      typeVersionSummaries: _s
          .extractXmlChild(elem, 'TypeVersionSummaries')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => TypeVersionSummary.fromXml(c))
              .toList()),
    );
  }
}

class ListTypesOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call this action again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String nextToken;

  /// A list of <code>TypeSummary</code> structures that contain information about
  /// the specified types.
  final List<TypeSummary> typeSummaries;

  ListTypesOutput({
    this.nextToken,
    this.typeSummaries,
  });
  factory ListTypesOutput.fromXml(_s.XmlElement elem) {
    return ListTypesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      typeSummaries: _s.extractXmlChild(elem, 'TypeSummaries')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => TypeSummary.fromXml(c))
              .toList()),
    );
  }
}

/// Contains logging configuration information for a type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LoggingConfig {
  /// The Amazon CloudWatch log group to which CloudFormation sends error logging
  /// information when invoking the type's handlers.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// The ARN of the role that CloudFormation should assume when sending log
  /// entries to CloudWatch logs.
  @_s.JsonKey(name: 'LogRoleArn')
  final String logRoleArn;

  LoggingConfig({
    @_s.required this.logGroupName,
    @_s.required this.logRoleArn,
  });
  factory LoggingConfig.fromXml(_s.XmlElement elem) {
    return LoggingConfig(
      logGroupName: _s.extractXmlStringValue(elem, 'LogGroupName'),
      logRoleArn: _s.extractXmlStringValue(elem, 'LogRoleArn'),
    );
  }

  Map<String, dynamic> toJson() => _$LoggingConfigToJson(this);
}

/// Contains information about the module from which the resource was created,
/// if the resource was created from a module included in the stack template.
///
/// For more information on modules, see <a
/// href="AWSCloudFormation/latest/UserGuide/modules.html">Using modules to
/// encapsulate and reuse resource configurations</a> in the <i>CloudFormation
/// User Guide</i>.
class ModuleInfo {
  /// A concantenated list of the logical IDs of the module or modules containing
  /// the resource. Modules are listed starting with the inner-most nested module,
  /// and separated by <code>/</code>.
  ///
  /// In the following example, the resource was created from a module,
  /// <code>moduleA</code>, that is nested inside a parent module,
  /// <code>moduleB</code>.
  ///
  /// <code>moduleA/moduleB</code>
  ///
  /// For more information, see <a
  /// href="AWSCloudFormation/latest/UserGuide/modules.html#module-ref-resources">Referencing
  /// resources in a module</a> in the <i>CloudFormation User Guide</i>.
  final String logicalIdHierarchy;

  /// A concantenated list of the the module type or types containing the
  /// resource. Module types are listed starting with the inner-most nested
  /// module, and separated by <code>/</code>.
  ///
  /// In the following example, the resource was created from a module of type
  /// <code>AWS::First::Example::MODULE</code>, that is nested inside a parent
  /// module of type <code>AWS::Second::Example::MODULE</code>.
  ///
  /// <code>AWS::First::Example::MODULE/AWS::Second::Example::MODULE</code>
  final String typeHierarchy;

  ModuleInfo({
    this.logicalIdHierarchy,
    this.typeHierarchy,
  });
  factory ModuleInfo.fromXml(_s.XmlElement elem) {
    return ModuleInfo(
      logicalIdHierarchy: _s.extractXmlStringValue(elem, 'LogicalIdHierarchy'),
      typeHierarchy: _s.extractXmlStringValue(elem, 'TypeHierarchy'),
    );
  }
}

enum OnFailure {
  @_s.JsonValue('DO_NOTHING')
  doNothing,
  @_s.JsonValue('ROLLBACK')
  rollback,
  @_s.JsonValue('DELETE')
  delete,
}

extension on OnFailure {
  String toValue() {
    switch (this) {
      case OnFailure.doNothing:
        return 'DO_NOTHING';
      case OnFailure.rollback:
        return 'ROLLBACK';
      case OnFailure.delete:
        return 'DELETE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OnFailure toOnFailure() {
    switch (this) {
      case 'DO_NOTHING':
        return OnFailure.doNothing;
      case 'ROLLBACK':
        return OnFailure.rollback;
      case 'DELETE':
        return OnFailure.delete;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum OperationStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
}

extension on OperationStatus {
  String toValue() {
    switch (this) {
      case OperationStatus.pending:
        return 'PENDING';
      case OperationStatus.inProgress:
        return 'IN_PROGRESS';
      case OperationStatus.success:
        return 'SUCCESS';
      case OperationStatus.failed:
        return 'FAILED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OperationStatus toOperationStatus() {
    switch (this) {
      case 'PENDING':
        return OperationStatus.pending;
      case 'IN_PROGRESS':
        return OperationStatus.inProgress;
      case 'SUCCESS':
        return OperationStatus.success;
      case 'FAILED':
        return OperationStatus.failed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The Output data type.
class Output {
  /// User defined description associated with the output.
  final String description;

  /// The name of the export associated with the output.
  final String exportName;

  /// The key associated with the output.
  final String outputKey;

  /// The value associated with the output.
  final String outputValue;

  Output({
    this.description,
    this.exportName,
    this.outputKey,
    this.outputValue,
  });
  factory Output.fromXml(_s.XmlElement elem) {
    return Output(
      description: _s.extractXmlStringValue(elem, 'Description'),
      exportName: _s.extractXmlStringValue(elem, 'ExportName'),
      outputKey: _s.extractXmlStringValue(elem, 'OutputKey'),
      outputValue: _s.extractXmlStringValue(elem, 'OutputValue'),
    );
  }
}

/// The Parameter data type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Parameter {
  /// The key associated with the parameter. If you don't specify a key and value
  /// for a particular parameter, AWS CloudFormation uses the default value that
  /// is specified in your template.
  @_s.JsonKey(name: 'ParameterKey')
  final String parameterKey;

  /// The input value associated with the parameter.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  /// Read-only. The value that corresponds to a Systems Manager parameter key.
  /// This field is returned only for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html#aws-ssm-parameter-types">
  /// <code>SSM</code> parameter types</a> in the template.
  @_s.JsonKey(name: 'ResolvedValue')
  final String resolvedValue;

  /// During a stack update, use the existing parameter value that the stack is
  /// using for a given parameter key. If you specify <code>true</code>, do not
  /// specify a parameter value.
  @_s.JsonKey(name: 'UsePreviousValue')
  final bool usePreviousValue;

  Parameter({
    this.parameterKey,
    this.parameterValue,
    this.resolvedValue,
    this.usePreviousValue,
  });
  factory Parameter.fromXml(_s.XmlElement elem) {
    return Parameter(
      parameterKey: _s.extractXmlStringValue(elem, 'ParameterKey'),
      parameterValue: _s.extractXmlStringValue(elem, 'ParameterValue'),
      resolvedValue: _s.extractXmlStringValue(elem, 'ResolvedValue'),
      usePreviousValue: _s.extractXmlBoolValue(elem, 'UsePreviousValue'),
    );
  }

  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}

/// A set of criteria that AWS CloudFormation uses to validate parameter values.
/// Although other constraints might be defined in the stack template, AWS
/// CloudFormation returns only the <code>AllowedValues</code> property.
class ParameterConstraints {
  /// A list of values that are permitted for a parameter.
  final List<String> allowedValues;

  ParameterConstraints({
    this.allowedValues,
  });
  factory ParameterConstraints.fromXml(_s.XmlElement elem) {
    return ParameterConstraints(
      allowedValues: _s
          .extractXmlChild(elem, 'AllowedValues')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// The ParameterDeclaration data type.
class ParameterDeclaration {
  /// The default value of the parameter.
  final String defaultValue;

  /// The description that is associate with the parameter.
  final String description;

  /// Flag that indicates whether the parameter value is shown as plain text in
  /// logs and in the AWS Management Console.
  final bool noEcho;

  /// The criteria that AWS CloudFormation uses to validate parameter values.
  final ParameterConstraints parameterConstraints;

  /// The name that is associated with the parameter.
  final String parameterKey;

  /// The type of parameter.
  final String parameterType;

  ParameterDeclaration({
    this.defaultValue,
    this.description,
    this.noEcho,
    this.parameterConstraints,
    this.parameterKey,
    this.parameterType,
  });
  factory ParameterDeclaration.fromXml(_s.XmlElement elem) {
    return ParameterDeclaration(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      noEcho: _s.extractXmlBoolValue(elem, 'NoEcho'),
      parameterConstraints: _s
          .extractXmlChild(elem, 'ParameterConstraints')
          ?.let((e) => ParameterConstraints.fromXml(e)),
      parameterKey: _s.extractXmlStringValue(elem, 'ParameterKey'),
      parameterType: _s.extractXmlStringValue(elem, 'ParameterType'),
    );
  }
}

enum PermissionModels {
  @_s.JsonValue('SERVICE_MANAGED')
  serviceManaged,
  @_s.JsonValue('SELF_MANAGED')
  selfManaged,
}

extension on PermissionModels {
  String toValue() {
    switch (this) {
      case PermissionModels.serviceManaged:
        return 'SERVICE_MANAGED';
      case PermissionModels.selfManaged:
        return 'SELF_MANAGED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  PermissionModels toPermissionModels() {
    switch (this) {
      case 'SERVICE_MANAGED':
        return PermissionModels.serviceManaged;
      case 'SELF_MANAGED':
        return PermissionModels.selfManaged;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Context information that enables AWS CloudFormation to uniquely identify a
/// resource. AWS CloudFormation uses context key-value pairs in cases where a
/// resource's logical and physical IDs are not enough to uniquely identify that
/// resource. Each context key-value pair specifies a resource that contains the
/// targeted resource.
class PhysicalResourceIdContextKeyValuePair {
  /// The resource context key.
  final String key;

  /// The resource context value.
  final String value;

  PhysicalResourceIdContextKeyValuePair({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory PhysicalResourceIdContextKeyValuePair.fromXml(_s.XmlElement elem) {
    return PhysicalResourceIdContextKeyValuePair(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }
}

/// Information about a resource property whose actual value differs from its
/// expected value, as defined in the stack template and any values specified as
/// template parameters. These will be present only for resources whose
/// <code>StackResourceDriftStatus</code> is <code>MODIFIED</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
/// Unregulated Configuration Changes to Stacks and Resources</a>.
class PropertyDifference {
  /// The actual property value of the resource property.
  final String actualValue;

  /// The type of property difference.
  ///
  /// <ul>
  /// <li>
  /// <code>ADD</code>: A value has been added to a resource property that is an
  /// array or list data type.
  /// </li>
  /// <li>
  /// <code>REMOVE</code>: The property has been removed from the current resource
  /// configuration.
  /// </li>
  /// <li>
  /// <code>NOT_EQUAL</code>: The current property value differs from its expected
  /// value (as defined in the stack template and any values specified as template
  /// parameters).
  /// </li>
  /// </ul>
  final DifferenceType differenceType;

  /// The expected property value of the resource property, as defined in the
  /// stack template and any values specified as template parameters.
  final String expectedValue;

  /// The fully-qualified path to the resource property.
  final String propertyPath;

  PropertyDifference({
    @_s.required this.actualValue,
    @_s.required this.differenceType,
    @_s.required this.expectedValue,
    @_s.required this.propertyPath,
  });
  factory PropertyDifference.fromXml(_s.XmlElement elem) {
    return PropertyDifference(
      actualValue: _s.extractXmlStringValue(elem, 'ActualValue'),
      differenceType:
          _s.extractXmlStringValue(elem, 'DifferenceType')?.toDifferenceType(),
      expectedValue: _s.extractXmlStringValue(elem, 'ExpectedValue'),
      propertyPath: _s.extractXmlStringValue(elem, 'PropertyPath'),
    );
  }
}

enum ProvisioningType {
  @_s.JsonValue('NON_PROVISIONABLE')
  nonProvisionable,
  @_s.JsonValue('IMMUTABLE')
  immutable,
  @_s.JsonValue('FULLY_MUTABLE')
  fullyMutable,
}

extension on ProvisioningType {
  String toValue() {
    switch (this) {
      case ProvisioningType.nonProvisionable:
        return 'NON_PROVISIONABLE';
      case ProvisioningType.immutable:
        return 'IMMUTABLE';
      case ProvisioningType.fullyMutable:
        return 'FULLY_MUTABLE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ProvisioningType toProvisioningType() {
    switch (this) {
      case 'NON_PROVISIONABLE':
        return ProvisioningType.nonProvisionable;
      case 'IMMUTABLE':
        return ProvisioningType.immutable;
      case 'FULLY_MUTABLE':
        return ProvisioningType.fullyMutable;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class RecordHandlerProgressOutput {
  RecordHandlerProgressOutput();
  factory RecordHandlerProgressOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RecordHandlerProgressOutput();
  }
}

class RegisterTypeOutput {
  /// The identifier for this registration request.
  ///
  /// Use this registration token when calling <code>
  /// <a>DescribeTypeRegistration</a> </code>, which returns information about the
  /// status and IDs of the type registration.
  final String registrationToken;

  RegisterTypeOutput({
    this.registrationToken,
  });
  factory RegisterTypeOutput.fromXml(_s.XmlElement elem) {
    return RegisterTypeOutput(
      registrationToken: _s.extractXmlStringValue(elem, 'RegistrationToken'),
    );
  }
}

enum RegistrationStatus {
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
}

extension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.complete:
        return 'COMPLETE';
      case RegistrationStatus.inProgress:
        return 'IN_PROGRESS';
      case RegistrationStatus.failed:
        return 'FAILED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RegistrationStatus toRegistrationStatus() {
    switch (this) {
      case 'COMPLETE':
        return RegistrationStatus.complete;
      case 'IN_PROGRESS':
        return RegistrationStatus.inProgress;
      case 'FAILED':
        return RegistrationStatus.failed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum RegistryType {
  @_s.JsonValue('RESOURCE')
  resource,
  @_s.JsonValue('MODULE')
  module,
}

extension on RegistryType {
  String toValue() {
    switch (this) {
      case RegistryType.resource:
        return 'RESOURCE';
      case RegistryType.module:
        return 'MODULE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RegistryType toRegistryType() {
    switch (this) {
      case 'RESOURCE':
        return RegistryType.resource;
      case 'MODULE':
        return RegistryType.module;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Replacement {
  @_s.JsonValue('True')
  $true,
  @_s.JsonValue('False')
  $false,
  @_s.JsonValue('Conditional')
  conditional,
}

extension on String {
  Replacement toReplacement() {
    switch (this) {
      case 'True':
        return Replacement.$true;
      case 'False':
        return Replacement.$false;
      case 'Conditional':
        return Replacement.conditional;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum RequiresRecreation {
  @_s.JsonValue('Never')
  never,
  @_s.JsonValue('Conditionally')
  conditionally,
  @_s.JsonValue('Always')
  always,
}

extension on String {
  RequiresRecreation toRequiresRecreation() {
    switch (this) {
      case 'Never':
        return RequiresRecreation.never;
      case 'Conditionally':
        return RequiresRecreation.conditionally;
      case 'Always':
        return RequiresRecreation.always;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceAttribute {
  @_s.JsonValue('Properties')
  properties,
  @_s.JsonValue('Metadata')
  metadata,
  @_s.JsonValue('CreationPolicy')
  creationPolicy,
  @_s.JsonValue('UpdatePolicy')
  updatePolicy,
  @_s.JsonValue('DeletionPolicy')
  deletionPolicy,
  @_s.JsonValue('Tags')
  tags,
}

extension on String {
  ResourceAttribute toResourceAttribute() {
    switch (this) {
      case 'Properties':
        return ResourceAttribute.properties;
      case 'Metadata':
        return ResourceAttribute.metadata;
      case 'CreationPolicy':
        return ResourceAttribute.creationPolicy;
      case 'UpdatePolicy':
        return ResourceAttribute.updatePolicy;
      case 'DeletionPolicy':
        return ResourceAttribute.deletionPolicy;
      case 'Tags':
        return ResourceAttribute.tags;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The <code>ResourceChange</code> structure describes the resource and the
/// action that AWS CloudFormation will perform on it if you execute this change
/// set.
class ResourceChange {
  /// The action that AWS CloudFormation takes on the resource, such as
  /// <code>Add</code> (adds a new resource), <code>Modify</code> (changes a
  /// resource), <code>Remove</code> (deletes a resource), <code>Import</code>
  /// (imports a resource), or <code>Dynamic</code> (exact action for the resource
  /// cannot be determined).
  final ChangeAction action;

  /// The change set ID of the nested change set.
  final String changeSetId;

  /// For the <code>Modify</code> action, a list of
  /// <code>ResourceChangeDetail</code> structures that describes the changes that
  /// AWS CloudFormation will make to the resource.
  final List<ResourceChangeDetail> details;

  /// The resource's logical ID, which is defined in the stack's template.
  final String logicalResourceId;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo moduleInfo;

  /// The resource's physical ID (resource name). Resources that you are adding
  /// don't have physical IDs because they haven't been created.
  final String physicalResourceId;

  /// For the <code>Modify</code> action, indicates whether AWS CloudFormation
  /// will replace the resource by creating a new one and deleting the old one.
  /// This value depends on the value of the <code>RequiresRecreation</code>
  /// property in the <code>ResourceTargetDefinition</code> structure. For
  /// example, if the <code>RequiresRecreation</code> field is <code>Always</code>
  /// and the <code>Evaluation</code> field is <code>Static</code>,
  /// <code>Replacement</code> is <code>True</code>. If the
  /// <code>RequiresRecreation</code> field is <code>Always</code> and the
  /// <code>Evaluation</code> field is <code>Dynamic</code>,
  /// <code>Replacement</code> is <code>Conditionally</code>.
  ///
  /// If you have multiple changes with different <code>RequiresRecreation</code>
  /// values, the <code>Replacement</code> value depends on the change with the
  /// most impact. A <code>RequiresRecreation</code> value of <code>Always</code>
  /// has the most impact, followed by <code>Conditionally</code>, and then
  /// <code>Never</code>.
  final Replacement replacement;

  /// The type of AWS CloudFormation resource, such as
  /// <code>AWS::S3::Bucket</code>.
  final String resourceType;

  /// For the <code>Modify</code> action, indicates which resource attribute is
  /// triggering this update, such as a change in the resource attribute's
  /// <code>Metadata</code>, <code>Properties</code>, or <code>Tags</code>.
  final List<ResourceAttribute> scope;

  ResourceChange({
    this.action,
    this.changeSetId,
    this.details,
    this.logicalResourceId,
    this.moduleInfo,
    this.physicalResourceId,
    this.replacement,
    this.resourceType,
    this.scope,
  });
  factory ResourceChange.fromXml(_s.XmlElement elem) {
    return ResourceChange(
      action: _s.extractXmlStringValue(elem, 'Action')?.toChangeAction(),
      changeSetId: _s.extractXmlStringValue(elem, 'ChangeSetId'),
      details: _s.extractXmlChild(elem, 'Details')?.let((elem) => elem
          .findElements('member')
          .map((c) => ResourceChangeDetail.fromXml(c))
          .toList()),
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      moduleInfo: _s
          .extractXmlChild(elem, 'ModuleInfo')
          ?.let((e) => ModuleInfo.fromXml(e)),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      replacement:
          _s.extractXmlStringValue(elem, 'Replacement')?.toReplacement(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      scope: _s.extractXmlChild(elem, 'Scope')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toResourceAttribute())
          .toList()),
    );
  }
}

/// For a resource with <code>Modify</code> as the action, the
/// <code>ResourceChange</code> structure describes the changes AWS
/// CloudFormation will make to that resource.
class ResourceChangeDetail {
  /// The identity of the entity that triggered this change. This entity is a
  /// member of the group that is specified by the <code>ChangeSource</code>
  /// field. For example, if you modified the value of the
  /// <code>KeyPairName</code> parameter, the <code>CausingEntity</code> is the
  /// name of the parameter (<code>KeyPairName</code>).
  ///
  /// If the <code>ChangeSource</code> value is <code>DirectModification</code>,
  /// no value is given for <code>CausingEntity</code>.
  final String causingEntity;

  /// The group to which the <code>CausingEntity</code> value belongs. There are
  /// five entity groups:
  ///
  /// <ul>
  /// <li>
  /// <code>ResourceReference</code> entities are <code>Ref</code> intrinsic
  /// functions that refer to resources in the template, such as <code>{ "Ref" :
  /// "MyEC2InstanceResource" }</code>.
  /// </li>
  /// <li>
  /// <code>ParameterReference</code> entities are <code>Ref</code> intrinsic
  /// functions that get template parameter values, such as <code>{ "Ref" :
  /// "MyPasswordParameter" }</code>.
  /// </li>
  /// <li>
  /// <code>ResourceAttribute</code> entities are <code>Fn::GetAtt</code>
  /// intrinsic functions that get resource attribute values, such as <code>{
  /// "Fn::GetAtt" : [ "MyEC2InstanceResource", "PublicDnsName" ] }</code>.
  /// </li>
  /// <li>
  /// <code>DirectModification</code> entities are changes that are made directly
  /// to the template.
  /// </li>
  /// <li>
  /// <code>Automatic</code> entities are <code>AWS::CloudFormation::Stack</code>
  /// resource types, which are also known as nested stacks. If you made no
  /// changes to the <code>AWS::CloudFormation::Stack</code> resource, AWS
  /// CloudFormation sets the <code>ChangeSource</code> to <code>Automatic</code>
  /// because the nested stack's template might have changed. Changes to a nested
  /// stack's template aren't visible to AWS CloudFormation until you run an
  /// update on the parent stack.
  /// </li>
  /// </ul>
  final ChangeSource changeSource;

  /// Indicates whether AWS CloudFormation can determine the target value, and
  /// whether the target value will change before you execute a change set.
  ///
  /// For <code>Static</code> evaluations, AWS CloudFormation can determine that
  /// the target value will change, and its value. For example, if you directly
  /// modify the <code>InstanceType</code> property of an EC2 instance, AWS
  /// CloudFormation knows that this property value will change, and its value, so
  /// this is a <code>Static</code> evaluation.
  ///
  /// For <code>Dynamic</code> evaluations, cannot determine the target value
  /// because it depends on the result of an intrinsic function, such as a
  /// <code>Ref</code> or <code>Fn::GetAtt</code> intrinsic function, when the
  /// stack is updated. For example, if your template includes a reference to a
  /// resource that is conditionally recreated, the value of the reference (the
  /// physical ID of the resource) might change, depending on if the resource is
  /// recreated. If the resource is recreated, it will have a new physical ID, so
  /// all references to that resource will also be updated.
  final EvaluationType evaluation;

  /// A <code>ResourceTargetDefinition</code> structure that describes the field
  /// that AWS CloudFormation will change and whether the resource will be
  /// recreated.
  final ResourceTargetDefinition target;

  ResourceChangeDetail({
    this.causingEntity,
    this.changeSource,
    this.evaluation,
    this.target,
  });
  factory ResourceChangeDetail.fromXml(_s.XmlElement elem) {
    return ResourceChangeDetail(
      causingEntity: _s.extractXmlStringValue(elem, 'CausingEntity'),
      changeSource:
          _s.extractXmlStringValue(elem, 'ChangeSource')?.toChangeSource(),
      evaluation:
          _s.extractXmlStringValue(elem, 'Evaluation')?.toEvaluationType(),
      target: _s
          .extractXmlChild(elem, 'Target')
          ?.let((e) => ResourceTargetDefinition.fromXml(e)),
    );
  }
}

/// Describes the target resources of a specific type in your import template
/// (for example, all <code>AWS::S3::Bucket</code> resources) and the properties
/// you can provide during the import to identify resources of that type.
class ResourceIdentifierSummary {
  /// The logical IDs of the target resources of the specified
  /// <code>ResourceType</code>, as defined in the import template.
  final List<String> logicalResourceIds;

  /// The resource properties you can provide during the import to identify your
  /// target resources. For example, <code>BucketName</code> is a possible
  /// identifier property for <code>AWS::S3::Bucket</code> resources.
  final List<String> resourceIdentifiers;

  /// The template resource type of the target resources, such as
  /// <code>AWS::S3::Bucket</code>.
  final String resourceType;

  ResourceIdentifierSummary({
    this.logicalResourceIds,
    this.resourceIdentifiers,
    this.resourceType,
  });
  factory ResourceIdentifierSummary.fromXml(_s.XmlElement elem) {
    return ResourceIdentifierSummary(
      logicalResourceIds: _s
          .extractXmlChild(elem, 'LogicalResourceIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      resourceIdentifiers: _s
          .extractXmlChild(elem, 'ResourceIdentifiers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
    );
  }
}

enum ResourceSignalStatus {
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILURE')
  failure,
}

extension on ResourceSignalStatus {
  String toValue() {
    switch (this) {
      case ResourceSignalStatus.success:
        return 'SUCCESS';
      case ResourceSignalStatus.failure:
        return 'FAILURE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ResourceSignalStatus toResourceSignalStatus() {
    switch (this) {
      case 'SUCCESS':
        return ResourceSignalStatus.success;
      case 'FAILURE':
        return ResourceSignalStatus.failure;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceStatus {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('CREATE_COMPLETE')
  createComplete,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DELETE_COMPLETE')
  deleteComplete,
  @_s.JsonValue('DELETE_SKIPPED')
  deleteSkipped,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
  @_s.JsonValue('UPDATE_COMPLETE')
  updateComplete,
  @_s.JsonValue('IMPORT_FAILED')
  importFailed,
  @_s.JsonValue('IMPORT_COMPLETE')
  importComplete,
  @_s.JsonValue('IMPORT_IN_PROGRESS')
  importInProgress,
  @_s.JsonValue('IMPORT_ROLLBACK_IN_PROGRESS')
  importRollbackInProgress,
  @_s.JsonValue('IMPORT_ROLLBACK_FAILED')
  importRollbackFailed,
  @_s.JsonValue('IMPORT_ROLLBACK_COMPLETE')
  importRollbackComplete,
}

extension on String {
  ResourceStatus toResourceStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return ResourceStatus.createInProgress;
      case 'CREATE_FAILED':
        return ResourceStatus.createFailed;
      case 'CREATE_COMPLETE':
        return ResourceStatus.createComplete;
      case 'DELETE_IN_PROGRESS':
        return ResourceStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return ResourceStatus.deleteFailed;
      case 'DELETE_COMPLETE':
        return ResourceStatus.deleteComplete;
      case 'DELETE_SKIPPED':
        return ResourceStatus.deleteSkipped;
      case 'UPDATE_IN_PROGRESS':
        return ResourceStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return ResourceStatus.updateFailed;
      case 'UPDATE_COMPLETE':
        return ResourceStatus.updateComplete;
      case 'IMPORT_FAILED':
        return ResourceStatus.importFailed;
      case 'IMPORT_COMPLETE':
        return ResourceStatus.importComplete;
      case 'IMPORT_IN_PROGRESS':
        return ResourceStatus.importInProgress;
      case 'IMPORT_ROLLBACK_IN_PROGRESS':
        return ResourceStatus.importRollbackInProgress;
      case 'IMPORT_ROLLBACK_FAILED':
        return ResourceStatus.importRollbackFailed;
      case 'IMPORT_ROLLBACK_COMPLETE':
        return ResourceStatus.importRollbackComplete;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The field that AWS CloudFormation will change, such as the name of a
/// resource's property, and whether the resource will be recreated.
class ResourceTargetDefinition {
  /// Indicates which resource attribute is triggering this update, such as a
  /// change in the resource attribute's <code>Metadata</code>,
  /// <code>Properties</code>, or <code>Tags</code>.
  final ResourceAttribute attribute;

  /// If the <code>Attribute</code> value is <code>Properties</code>, the name of
  /// the property. For all other attributes, the value is null.
  final String name;

  /// If the <code>Attribute</code> value is <code>Properties</code>, indicates
  /// whether a change to this property causes the resource to be recreated. The
  /// value can be <code>Never</code>, <code>Always</code>, or
  /// <code>Conditionally</code>. To determine the conditions for a
  /// <code>Conditionally</code> recreation, see the update behavior for that <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">property</a>
  /// in the AWS CloudFormation User Guide.
  final RequiresRecreation requiresRecreation;

  ResourceTargetDefinition({
    this.attribute,
    this.name,
    this.requiresRecreation,
  });
  factory ResourceTargetDefinition.fromXml(_s.XmlElement elem) {
    return ResourceTargetDefinition(
      attribute:
          _s.extractXmlStringValue(elem, 'Attribute')?.toResourceAttribute(),
      name: _s.extractXmlStringValue(elem, 'Name'),
      requiresRecreation: _s
          .extractXmlStringValue(elem, 'RequiresRecreation')
          ?.toRequiresRecreation(),
    );
  }
}

/// Describes the target resource of an import operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResourceToImport {
  /// The logical ID of the target resource as specified in the template.
  @_s.JsonKey(name: 'LogicalResourceId')
  final String logicalResourceId;

  /// A key-value pair that identifies the target resource. The key is an
  /// identifier property (for example, <code>BucketName</code> for
  /// <code>AWS::S3::Bucket</code> resources) and the value is the actual property
  /// value (for example, <code>MyS3Bucket</code>).
  @_s.JsonKey(name: 'ResourceIdentifier')
  final Map<String, String> resourceIdentifier;

  /// The type of resource to import into your stack, such as
  /// <code>AWS::S3::Bucket</code>. For a list of supported resource types, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html">Resources
  /// that support import operations</a> in the AWS CloudFormation User Guide.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ResourceToImport({
    @_s.required this.logicalResourceId,
    @_s.required this.resourceIdentifier,
    @_s.required this.resourceType,
  });
  Map<String, dynamic> toJson() => _$ResourceToImportToJson(this);
}

/// Structure containing the rollback triggers for AWS CloudFormation to monitor
/// during stack creation and updating operations, and for the specified
/// monitoring period afterwards.
///
/// Rollback triggers enable you to have AWS CloudFormation monitor the state of
/// your application during stack creation and updating, and to roll back that
/// operation if the application breaches the threshold of any of the alarms
/// you've specified. For more information, see <a
/// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-rollback-triggers.html">Monitor
/// and Roll Back Stack Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RollbackConfiguration {
  /// The amount of time, in minutes, during which CloudFormation should monitor
  /// all the rollback triggers after the stack creation or update operation
  /// deploys all necessary resources.
  ///
  /// The default is 0 minutes.
  ///
  /// If you specify a monitoring period but do not specify any rollback triggers,
  /// CloudFormation still waits the specified period of time before cleaning up
  /// old resources after update operations. You can use this monitoring period to
  /// perform any manual stack validation desired, and manually cancel the stack
  /// creation or update (using <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CancelUpdateStack.html">CancelUpdateStack</a>,
  /// for example) as necessary.
  ///
  /// If you specify 0 for this parameter, CloudFormation still monitors the
  /// specified rollback triggers during stack creation and update operations.
  /// Then, for update operations, it begins disposing of old resources
  /// immediately once the operation completes.
  @_s.JsonKey(name: 'MonitoringTimeInMinutes')
  final int monitoringTimeInMinutes;

  /// The triggers to monitor during stack creation or update actions.
  ///
  /// By default, AWS CloudFormation saves the rollback triggers specified for a
  /// stack and applies them to any subsequent update operations for the stack,
  /// unless you specify otherwise. If you do specify rollback triggers for this
  /// parameter, those triggers replace any list of triggers previously specified
  /// for the stack. This means:
  ///
  /// <ul>
  /// <li>
  /// To use the rollback triggers previously specified for this stack, if any,
  /// don't specify this parameter.
  /// </li>
  /// <li>
  /// To specify new or updated rollback triggers, you must specify <i>all</i> the
  /// triggers that you want used for this stack, even triggers you've specifed
  /// before (for example, when creating the stack or during a previous stack
  /// update). Any triggers that you don't include in the updated list of triggers
  /// are no longer applied to the stack.
  /// </li>
  /// <li>
  /// To remove all currently specified triggers, specify an empty list for this
  /// parameter.
  /// </li>
  /// </ul>
  /// If a specified trigger is missing, the entire stack operation fails and is
  /// rolled back.
  @_s.JsonKey(name: 'RollbackTriggers')
  final List<RollbackTrigger> rollbackTriggers;

  RollbackConfiguration({
    this.monitoringTimeInMinutes,
    this.rollbackTriggers,
  });
  factory RollbackConfiguration.fromXml(_s.XmlElement elem) {
    return RollbackConfiguration(
      monitoringTimeInMinutes:
          _s.extractXmlIntValue(elem, 'MonitoringTimeInMinutes'),
      rollbackTriggers: _s.extractXmlChild(elem, 'RollbackTriggers')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => RollbackTrigger.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() => _$RollbackConfigurationToJson(this);
}

/// A rollback trigger AWS CloudFormation monitors during creation and updating
/// of stacks. If any of the alarms you specify goes to ALARM state during the
/// stack operation or within the specified monitoring period afterwards,
/// CloudFormation rolls back the entire stack operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RollbackTrigger {
  /// The Amazon Resource Name (ARN) of the rollback trigger.
  ///
  /// If a specified trigger is missing, the entire stack operation fails and is
  /// rolled back.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The resource type of the rollback trigger. Currently, <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html">AWS::CloudWatch::Alarm</a>
  /// is the only supported resource type.
  @_s.JsonKey(name: 'Type')
  final String type;

  RollbackTrigger({
    @_s.required this.arn,
    @_s.required this.type,
  });
  factory RollbackTrigger.fromXml(_s.XmlElement elem) {
    return RollbackTrigger(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      type: _s.extractXmlStringValue(elem, 'Type'),
    );
  }

  Map<String, dynamic> toJson() => _$RollbackTriggerToJson(this);
}

class SetTypeDefaultVersionOutput {
  SetTypeDefaultVersionOutput();
  factory SetTypeDefaultVersionOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetTypeDefaultVersionOutput();
  }
}

/// The Stack data type.
class Stack {
  /// The time at which the stack was created.
  final DateTime creationTime;

  /// The name associated with the stack.
  final String stackName;

  /// Current status of the stack.
  final StackStatus stackStatus;

  /// The capabilities allowed in the stack.
  final List<Capability> capabilities;

  /// The unique ID of the change set.
  final String changeSetId;

  /// The time the stack was deleted.
  final DateTime deletionTime;

  /// A user-defined description associated with the stack.
  final String description;

  /// Boolean to enable or disable rollback on stack creation failures:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code>: disable rollback
  /// </li>
  /// <li>
  /// <code>false</code>: enable rollback
  /// </li>
  /// </ul>
  final bool disableRollback;

  /// Information on whether a stack's actual configuration differs, or has
  /// <i>drifted</i>, from it's expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackDriftInformation driftInformation;

  /// Whether termination protection is enabled for the stack.
  ///
  /// For <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested
  /// stacks</a>, termination protection is set on the root stack and cannot be
  /// changed directly on the nested stack. For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting
  /// a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>.
  final bool enableTerminationProtection;

  /// The time the stack was last updated. This field will only be returned if the
  /// stack has been updated at least once.
  final DateTime lastUpdatedTime;

  /// SNS topic ARNs to which stack related events are published.
  final List<String> notificationARNs;

  /// A list of output structures.
  final List<Output> outputs;

  /// A list of <code>Parameter</code> structures.
  final List<Parameter> parameters;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the direct parent of this stack. For the first level of nested stacks,
  /// the root stack is also the parent stack.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.
  final String parentId;

  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that is associated with the stack. During a stack operation, AWS
  /// CloudFormation uses this role's credentials to make calls on your behalf.
  final String roleARN;

  /// The rollback triggers for AWS CloudFormation to monitor during stack
  /// creation and updating operations, and for the specified monitoring period
  /// afterwards.
  final RollbackConfiguration rollbackConfiguration;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the top-level stack to which the nested stack ultimately belongs.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.
  final String rootId;

  /// Unique identifier of the stack.
  final String stackId;

  /// Success/failure message associated with the stack status.
  final String stackStatusReason;

  /// A list of <code>Tag</code>s that specify information about the stack.
  final List<Tag> tags;

  /// The amount of time within which stack creation should complete.
  final int timeoutInMinutes;

  Stack({
    @_s.required this.creationTime,
    @_s.required this.stackName,
    @_s.required this.stackStatus,
    this.capabilities,
    this.changeSetId,
    this.deletionTime,
    this.description,
    this.disableRollback,
    this.driftInformation,
    this.enableTerminationProtection,
    this.lastUpdatedTime,
    this.notificationARNs,
    this.outputs,
    this.parameters,
    this.parentId,
    this.roleARN,
    this.rollbackConfiguration,
    this.rootId,
    this.stackId,
    this.stackStatusReason,
    this.tags,
    this.timeoutInMinutes,
  });
  factory Stack.fromXml(_s.XmlElement elem) {
    return Stack(
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      stackStatus:
          _s.extractXmlStringValue(elem, 'StackStatus')?.toStackStatus(),
      capabilities: _s.extractXmlChild(elem, 'Capabilities')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toCapability())
          .toList()),
      changeSetId: _s.extractXmlStringValue(elem, 'ChangeSetId'),
      deletionTime: _s.extractXmlDateTimeValue(elem, 'DeletionTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      disableRollback: _s.extractXmlBoolValue(elem, 'DisableRollback'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let((e) => StackDriftInformation.fromXml(e)),
      enableTerminationProtection:
          _s.extractXmlBoolValue(elem, 'EnableTerminationProtection'),
      lastUpdatedTime: _s.extractXmlDateTimeValue(elem, 'LastUpdatedTime'),
      notificationARNs: _s
          .extractXmlChild(elem, 'NotificationARNs')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      outputs: _s.extractXmlChild(elem, 'Outputs')?.let((elem) =>
          elem.findElements('member').map((c) => Output.fromXml(c)).toList()),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('member')
          .map((c) => Parameter.fromXml(c))
          .toList()),
      parentId: _s.extractXmlStringValue(elem, 'ParentId'),
      roleARN: _s.extractXmlStringValue(elem, 'RoleARN'),
      rollbackConfiguration: _s
          .extractXmlChild(elem, 'RollbackConfiguration')
          ?.let((e) => RollbackConfiguration.fromXml(e)),
      rootId: _s.extractXmlStringValue(elem, 'RootId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackStatusReason: _s.extractXmlStringValue(elem, 'StackStatusReason'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
      timeoutInMinutes: _s.extractXmlIntValue(elem, 'TimeoutInMinutes'),
    );
  }
}

enum StackDriftDetectionStatus {
  @_s.JsonValue('DETECTION_IN_PROGRESS')
  detectionInProgress,
  @_s.JsonValue('DETECTION_FAILED')
  detectionFailed,
  @_s.JsonValue('DETECTION_COMPLETE')
  detectionComplete,
}

extension on String {
  StackDriftDetectionStatus toStackDriftDetectionStatus() {
    switch (this) {
      case 'DETECTION_IN_PROGRESS':
        return StackDriftDetectionStatus.detectionInProgress;
      case 'DETECTION_FAILED':
        return StackDriftDetectionStatus.detectionFailed;
      case 'DETECTION_COMPLETE':
        return StackDriftDetectionStatus.detectionComplete;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about whether the stack's actual configuration differs,
/// or has <i>drifted</i>, from its expected configuration, as defined in the
/// stack template and any values specified as template parameters. A stack is
/// considered to have drifted if one or more of its resources have drifted.
class StackDriftInformation {
  /// Status of the stack's actual configuration compared to its expected template
  /// configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: The stack differs from its expected template
  /// configuration. A stack is considered to have drifted if one or more of its
  /// resources have drifted.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack
  /// differs from its expected template configuration.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The stack's actual configuration matches its expected
  /// template configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus stackDriftStatus;

  /// Most recent time when a drift detection operation was initiated on the
  /// stack, or any of its individual resources that support drift detection.
  final DateTime lastCheckTimestamp;

  StackDriftInformation({
    @_s.required this.stackDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackDriftInformation.fromXml(_s.XmlElement elem) {
    return StackDriftInformation(
      stackDriftStatus: _s
          .extractXmlStringValue(elem, 'StackDriftStatus')
          ?.toStackDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }
}

/// Contains information about whether the stack's actual configuration differs,
/// or has <i>drifted</i>, from its expected configuration, as defined in the
/// stack template and any values specified as template parameters. A stack is
/// considered to have drifted if one or more of its resources have drifted.
class StackDriftInformationSummary {
  /// Status of the stack's actual configuration compared to its expected template
  /// configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: The stack differs from its expected template
  /// configuration. A stack is considered to have drifted if one or more of its
  /// resources have drifted.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack
  /// differs from its expected template configuration.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The stack's actual configuration matches its expected
  /// template configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus stackDriftStatus;

  /// Most recent time when a drift detection operation was initiated on the
  /// stack, or any of its individual resources that support drift detection.
  final DateTime lastCheckTimestamp;

  StackDriftInformationSummary({
    @_s.required this.stackDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackDriftInformationSummary.fromXml(_s.XmlElement elem) {
    return StackDriftInformationSummary(
      stackDriftStatus: _s
          .extractXmlStringValue(elem, 'StackDriftStatus')
          ?.toStackDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }
}

enum StackDriftStatus {
  @_s.JsonValue('DRIFTED')
  drifted,
  @_s.JsonValue('IN_SYNC')
  inSync,
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('NOT_CHECKED')
  notChecked,
}

extension on String {
  StackDriftStatus toStackDriftStatus() {
    switch (this) {
      case 'DRIFTED':
        return StackDriftStatus.drifted;
      case 'IN_SYNC':
        return StackDriftStatus.inSync;
      case 'UNKNOWN':
        return StackDriftStatus.unknown;
      case 'NOT_CHECKED':
        return StackDriftStatus.notChecked;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The StackEvent data type.
class StackEvent {
  /// The unique ID of this event.
  final String eventId;

  /// The unique ID name of the instance of the stack.
  final String stackId;

  /// The name associated with a stack.
  final String stackName;

  /// Time the status was updated.
  final DateTime timestamp;

  /// The token passed to the operation that generated this event.
  ///
  /// All events triggered by a given stack operation are assigned the same client
  /// request token, which you can use to track operations. For example, if you
  /// execute a <code>CreateStack</code> operation with the token
  /// <code>token1</code>, then all the <code>StackEvents</code> generated by that
  /// operation will have <code>ClientRequestToken</code> set as
  /// <code>token1</code>.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format <i>Console-StackOperation-ID</i>, which helps you easily
  /// identify the stack operation . For example, if you create a stack using the
  /// console, each stack event would be assigned the same token in the following
  /// format:
  /// <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>.
  final String clientRequestToken;

  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// The name or unique identifier associated with the physical instance of the
  /// resource.
  final String physicalResourceId;

  /// BLOB of the properties used to create the resource.
  final String resourceProperties;

  /// Current status of the resource.
  final ResourceStatus resourceStatus;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  /// Type of resource. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">
  /// AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)
  final String resourceType;

  StackEvent({
    @_s.required this.eventId,
    @_s.required this.stackId,
    @_s.required this.stackName,
    @_s.required this.timestamp,
    this.clientRequestToken,
    this.logicalResourceId,
    this.physicalResourceId,
    this.resourceProperties,
    this.resourceStatus,
    this.resourceStatusReason,
    this.resourceType,
  });
  factory StackEvent.fromXml(_s.XmlElement elem) {
    return StackEvent(
      eventId: _s.extractXmlStringValue(elem, 'EventId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
      clientRequestToken: _s.extractXmlStringValue(elem, 'ClientRequestToken'),
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      resourceProperties: _s.extractXmlStringValue(elem, 'ResourceProperties'),
      resourceStatus:
          _s.extractXmlStringValue(elem, 'ResourceStatus')?.toResourceStatus(),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
    );
  }
}

/// An AWS CloudFormation stack, in a specific account and Region, that's part
/// of a stack set operation. A stack instance is a reference to an attempted or
/// actual stack in a given account within a given Region. A stack instance can
/// exist without a stack—for example, if the stack couldn't be created for some
/// reason. A stack instance is associated with only one stack set. Each stack
/// instance contains the ID of its associated stack set, as well as the ID of
/// the actual stack and the stack status.
class StackInstance {
  /// [<code>Self-managed</code> permissions] The name of the AWS account that the
  /// stack instance is associated with.
  final String account;

  /// Status of the stack instance's actual configuration compared to the expected
  /// template and parameter configuration of the stack set to which it belongs.
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: The stack differs from the expected template and
  /// parameter configuration of the stack set to which it belongs. A stack
  /// instance is considered to have drifted if one or more of the resources in
  /// the associated stack have drifted.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack
  /// instance differs from its expected stack set configuration.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The stack instance's actual configuration matches its
  /// expected stack set configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus driftStatus;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack instance. This value will be <code>NULL</code> for any stack
  /// instance on which drift detection has not yet been performed.
  final DateTime lastDriftCheckTimestamp;

  /// [<code>Service-managed</code> permissions] The organization root ID or
  /// organizational unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final String organizationalUnitId;

  /// A list of parameters from the stack set template whose values have been
  /// overridden in this stack instance.
  final List<Parameter> parameterOverrides;

  /// The name of the AWS Region that the stack instance is associated with.
  final String region;

  /// The ID of the stack instance.
  final String stackId;

  /// The detailed status of the stack instance.
  final StackInstanceComprehensiveStatus stackInstanceStatus;

  /// The name or unique ID of the stack set that the stack instance is associated
  /// with.
  final String stackSetId;

  /// The status of the stack instance, in terms of its synchronization with its
  /// associated stack set.
  ///
  /// <ul>
  /// <li>
  /// <code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has
  /// failed and left the stack in an unstable state. Stacks in this state are
  /// excluded from further <code>UpdateStackSet</code> operations. You might need
  /// to perform a <code>DeleteStackInstances</code> operation, with
  /// <code>RetainStacks</code> set to <code>true</code>, to delete the stack
  /// instance, and then delete the stack manually.
  /// </li>
  /// <li>
  /// <code>OUTDATED</code>: The stack isn't currently up to date with the stack
  /// set because:
  ///
  /// <ul>
  /// <li>
  /// The associated stack failed during a <code>CreateStackSet</code> or
  /// <code>UpdateStackSet</code> operation.
  /// </li>
  /// <li>
  /// The stack was part of a <code>CreateStackSet</code> or
  /// <code>UpdateStackSet</code> operation that failed or was stopped before the
  /// stack was created or updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CURRENT</code>: The stack is currently up to date with the stack set.
  /// </li>
  /// </ul>
  final StackInstanceStatus status;

  /// The explanation for the specific status code that is assigned to this stack
  /// instance.
  final String statusReason;

  StackInstance({
    this.account,
    this.driftStatus,
    this.lastDriftCheckTimestamp,
    this.organizationalUnitId,
    this.parameterOverrides,
    this.region,
    this.stackId,
    this.stackInstanceStatus,
    this.stackSetId,
    this.status,
    this.statusReason,
  });
  factory StackInstance.fromXml(_s.XmlElement elem) {
    return StackInstance(
      account: _s.extractXmlStringValue(elem, 'Account'),
      driftStatus:
          _s.extractXmlStringValue(elem, 'DriftStatus')?.toStackDriftStatus(),
      lastDriftCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastDriftCheckTimestamp'),
      organizationalUnitId:
          _s.extractXmlStringValue(elem, 'OrganizationalUnitId'),
      parameterOverrides: _s.extractXmlChild(elem, 'ParameterOverrides')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => Parameter.fromXml(c))
              .toList()),
      region: _s.extractXmlStringValue(elem, 'Region'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackInstanceStatus: _s
          .extractXmlChild(elem, 'StackInstanceStatus')
          ?.let((e) => StackInstanceComprehensiveStatus.fromXml(e)),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackInstanceStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }
}

/// The detailed status of the stack instance.
class StackInstanceComprehensiveStatus {
  /// <ul>
  /// <li>
  /// <code>CANCELLED</code>: The operation in the specified account and Region
  /// has been cancelled. This is either because a user has stopped the stack set
  /// operation, or because the failure tolerance of the stack set operation has
  /// been exceeded.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The operation in the specified account and Region
  /// failed. If the stack set operation fails in enough accounts within a Region,
  /// the failure tolerance for the stack set operation as a whole might be
  /// exceeded.
  /// </li>
  /// <li>
  /// <code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has
  /// failed and left the stack in an unstable state. Stacks in this state are
  /// excluded from further <code>UpdateStackSet</code> operations. You might need
  /// to perform a <code>DeleteStackInstances</code> operation, with
  /// <code>RetainStacks</code> set to <code>true</code>, to delete the stack
  /// instance, and then delete the stack manually.
  /// </li>
  /// <li>
  /// <code>PENDING</code>: The operation in the specified account and Region has
  /// yet to start.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The operation in the specified account and Region is
  /// currently in progress.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The operation in the specified account and Region
  /// completed successfully.
  /// </li>
  /// </ul>
  final StackInstanceDetailedStatus detailedStatus;

  StackInstanceComprehensiveStatus({
    this.detailedStatus,
  });
  factory StackInstanceComprehensiveStatus.fromXml(_s.XmlElement elem) {
    return StackInstanceComprehensiveStatus(
      detailedStatus: _s
          .extractXmlStringValue(elem, 'DetailedStatus')
          ?.toStackInstanceDetailedStatus(),
    );
  }
}

enum StackInstanceDetailedStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('INOPERABLE')
  inoperable,
}

extension on String {
  StackInstanceDetailedStatus toStackInstanceDetailedStatus() {
    switch (this) {
      case 'PENDING':
        return StackInstanceDetailedStatus.pending;
      case 'RUNNING':
        return StackInstanceDetailedStatus.running;
      case 'SUCCEEDED':
        return StackInstanceDetailedStatus.succeeded;
      case 'FAILED':
        return StackInstanceDetailedStatus.failed;
      case 'CANCELLED':
        return StackInstanceDetailedStatus.cancelled;
      case 'INOPERABLE':
        return StackInstanceDetailedStatus.inoperable;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The status that stack instances are filtered by.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StackInstanceFilter {
  /// The type of filter to apply.
  @_s.JsonKey(name: 'Name')
  final StackInstanceFilterName name;

  /// The status to filter by.
  @_s.JsonKey(name: 'Values')
  final String values;

  StackInstanceFilter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$StackInstanceFilterToJson(this);
}

enum StackInstanceFilterName {
  @_s.JsonValue('DETAILED_STATUS')
  detailedStatus,
}

extension on String {
  StackInstanceFilterName toStackInstanceFilterName() {
    switch (this) {
      case 'DETAILED_STATUS':
        return StackInstanceFilterName.detailedStatus;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum StackInstanceStatus {
  @_s.JsonValue('CURRENT')
  current,
  @_s.JsonValue('OUTDATED')
  outdated,
  @_s.JsonValue('INOPERABLE')
  inoperable,
}

extension on String {
  StackInstanceStatus toStackInstanceStatus() {
    switch (this) {
      case 'CURRENT':
        return StackInstanceStatus.current;
      case 'OUTDATED':
        return StackInstanceStatus.outdated;
      case 'INOPERABLE':
        return StackInstanceStatus.inoperable;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure that contains summary information about a stack instance.
class StackInstanceSummary {
  /// [<code>Self-managed</code> permissions] The name of the AWS account that the
  /// stack instance is associated with.
  final String account;

  /// Status of the stack instance's actual configuration compared to the expected
  /// template and parameter configuration of the stack set to which it belongs.
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: The stack differs from the expected template and
  /// parameter configuration of the stack set to which it belongs. A stack
  /// instance is considered to have drifted if one or more of the resources in
  /// the associated stack have drifted.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack
  /// instance differs from its expected stack set configuration.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The stack instance's actual configuration matches its
  /// expected stack set configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus driftStatus;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack instance. This value will be <code>NULL</code> for any stack
  /// instance on which drift detection has not yet been performed.
  final DateTime lastDriftCheckTimestamp;

  /// [<code>Service-managed</code> permissions] The organization root ID or
  /// organizational unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final String organizationalUnitId;

  /// The name of the AWS Region that the stack instance is associated with.
  final String region;

  /// The ID of the stack instance.
  final String stackId;

  /// The detailed status of the stack instance.
  final StackInstanceComprehensiveStatus stackInstanceStatus;

  /// The name or unique ID of the stack set that the stack instance is associated
  /// with.
  final String stackSetId;

  /// The status of the stack instance, in terms of its synchronization with its
  /// associated stack set.
  ///
  /// <ul>
  /// <li>
  /// <code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has
  /// failed and left the stack in an unstable state. Stacks in this state are
  /// excluded from further <code>UpdateStackSet</code> operations. You might need
  /// to perform a <code>DeleteStackInstances</code> operation, with
  /// <code>RetainStacks</code> set to <code>true</code>, to delete the stack
  /// instance, and then delete the stack manually.
  /// </li>
  /// <li>
  /// <code>OUTDATED</code>: The stack isn't currently up to date with the stack
  /// set because:
  ///
  /// <ul>
  /// <li>
  /// The associated stack failed during a <code>CreateStackSet</code> or
  /// <code>UpdateStackSet</code> operation.
  /// </li>
  /// <li>
  /// The stack was part of a <code>CreateStackSet</code> or
  /// <code>UpdateStackSet</code> operation that failed or was stopped before the
  /// stack was created or updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CURRENT</code>: The stack is currently up to date with the stack set.
  /// </li>
  /// </ul>
  final StackInstanceStatus status;

  /// The explanation for the specific status code assigned to this stack
  /// instance.
  final String statusReason;

  StackInstanceSummary({
    this.account,
    this.driftStatus,
    this.lastDriftCheckTimestamp,
    this.organizationalUnitId,
    this.region,
    this.stackId,
    this.stackInstanceStatus,
    this.stackSetId,
    this.status,
    this.statusReason,
  });
  factory StackInstanceSummary.fromXml(_s.XmlElement elem) {
    return StackInstanceSummary(
      account: _s.extractXmlStringValue(elem, 'Account'),
      driftStatus:
          _s.extractXmlStringValue(elem, 'DriftStatus')?.toStackDriftStatus(),
      lastDriftCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastDriftCheckTimestamp'),
      organizationalUnitId:
          _s.extractXmlStringValue(elem, 'OrganizationalUnitId'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackInstanceStatus: _s
          .extractXmlChild(elem, 'StackInstanceStatus')
          ?.let((e) => StackInstanceComprehensiveStatus.fromXml(e)),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackInstanceStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }
}

/// The StackResource data type.
class StackResource {
  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// Current status of the resource.
  final ResourceStatus resourceStatus;

  /// Type of resource. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">
  /// AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)
  final String resourceType;

  /// Time the status was updated.
  final DateTime timestamp;

  /// User defined description associated with the resource.
  final String description;

  /// Information about whether the resource's actual configuration differs, or
  /// has <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackResourceDriftInformation driftInformation;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// a resource supported by AWS CloudFormation.
  final String physicalResourceId;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  /// Unique identifier of the stack.
  final String stackId;

  /// The name associated with the stack.
  final String stackName;

  StackResource({
    @_s.required this.logicalResourceId,
    @_s.required this.resourceStatus,
    @_s.required this.resourceType,
    @_s.required this.timestamp,
    this.description,
    this.driftInformation,
    this.moduleInfo,
    this.physicalResourceId,
    this.resourceStatusReason,
    this.stackId,
    this.stackName,
  });
  factory StackResource.fromXml(_s.XmlElement elem) {
    return StackResource(
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      resourceStatus:
          _s.extractXmlStringValue(elem, 'ResourceStatus')?.toResourceStatus(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let((e) => StackResourceDriftInformation.fromXml(e)),
      moduleInfo: _s
          .extractXmlChild(elem, 'ModuleInfo')
          ?.let((e) => ModuleInfo.fromXml(e)),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
    );
  }
}

/// Contains detailed information about the specified stack resource.
class StackResourceDetail {
  /// Time the status was updated.
  final DateTime lastUpdatedTimestamp;

  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// Current status of the resource.
  final ResourceStatus resourceStatus;

  /// Type of resource. ((For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">
  /// AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)
  final String resourceType;

  /// User defined description associated with the resource.
  final String description;

  /// Information about whether the resource's actual configuration differs, or
  /// has <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackResourceDriftInformation driftInformation;

  /// The content of the <code>Metadata</code> attribute declared for the
  /// resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-metadata.html">Metadata
  /// Attribute</a> in the AWS CloudFormation User Guide.
  final String metadata;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// a resource supported by AWS CloudFormation.
  final String physicalResourceId;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  /// Unique identifier of the stack.
  final String stackId;

  /// The name associated with the stack.
  final String stackName;

  StackResourceDetail({
    @_s.required this.lastUpdatedTimestamp,
    @_s.required this.logicalResourceId,
    @_s.required this.resourceStatus,
    @_s.required this.resourceType,
    this.description,
    this.driftInformation,
    this.metadata,
    this.moduleInfo,
    this.physicalResourceId,
    this.resourceStatusReason,
    this.stackId,
    this.stackName,
  });
  factory StackResourceDetail.fromXml(_s.XmlElement elem) {
    return StackResourceDetail(
      lastUpdatedTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastUpdatedTimestamp'),
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      resourceStatus:
          _s.extractXmlStringValue(elem, 'ResourceStatus')?.toResourceStatus(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let((e) => StackResourceDriftInformation.fromXml(e)),
      metadata: _s.extractXmlStringValue(elem, 'Metadata'),
      moduleInfo: _s
          .extractXmlChild(elem, 'ModuleInfo')
          ?.let((e) => ModuleInfo.fromXml(e)),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
    );
  }
}

/// Contains the drift information for a resource that has been checked for
/// drift. This includes actual and expected property values for resources in
/// which AWS CloudFormation has detected drift. Only resource properties
/// explicitly defined in the stack template are checked for drift. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
/// Unregulated Configuration Changes to Stacks and Resources</a>.
///
/// Resources that do not currently support drift detection cannot be checked.
/// For a list of resources that support drift detection, see <a
/// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
/// that Support Drift Detection</a>.
///
/// Use <a>DetectStackResourceDrift</a> to detect drift on individual resources,
/// or <a>DetectStackDrift</a> to detect drift on all resources in a given stack
/// that support drift detection.
class StackResourceDrift {
  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// The type of the resource.
  final String resourceType;

  /// The ID of the stack.
  final String stackId;

  /// Status of the resource's actual configuration compared to its expected
  /// configuration
  ///
  /// <ul>
  /// <li>
  /// <code>DELETED</code>: The resource differs from its expected template
  /// configuration because the resource has been deleted.
  /// </li>
  /// <li>
  /// <code>MODIFIED</code>: One or more resource properties differ from their
  /// expected values (as defined in the stack template and any values specified
  /// as template parameters).
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The resources's actual configuration matches its
  /// expected template configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation does not currently return this
  /// value.
  /// </li>
  /// </ul>
  final StackResourceDriftStatus stackResourceDriftStatus;

  /// Time at which AWS CloudFormation performed drift detection on the stack
  /// resource.
  final DateTime timestamp;

  /// A JSON structure containing the actual property values of the stack
  /// resource.
  ///
  /// For resources whose <code>StackResourceDriftStatus</code> is
  /// <code>DELETED</code>, this structure will not be present.
  final String actualProperties;

  /// A JSON structure containing the expected property values of the stack
  /// resource, as defined in the stack template and any values specified as
  /// template parameters.
  ///
  /// For resources whose <code>StackResourceDriftStatus</code> is
  /// <code>DELETED</code>, this structure will not be present.
  final String expectedProperties;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// a resource supported by AWS CloudFormation.
  final String physicalResourceId;

  /// Context information that enables AWS CloudFormation to uniquely identify a
  /// resource. AWS CloudFormation uses context key-value pairs in cases where a
  /// resource's logical and physical IDs are not enough to uniquely identify that
  /// resource. Each context key-value pair specifies a unique resource that
  /// contains the targeted resource.
  final List<PhysicalResourceIdContextKeyValuePair> physicalResourceIdContext;

  /// A collection of the resource properties whose actual values differ from
  /// their expected values. These will be present only for resources whose
  /// <code>StackResourceDriftStatus</code> is <code>MODIFIED</code>.
  final List<PropertyDifference> propertyDifferences;

  StackResourceDrift({
    @_s.required this.logicalResourceId,
    @_s.required this.resourceType,
    @_s.required this.stackId,
    @_s.required this.stackResourceDriftStatus,
    @_s.required this.timestamp,
    this.actualProperties,
    this.expectedProperties,
    this.moduleInfo,
    this.physicalResourceId,
    this.physicalResourceIdContext,
    this.propertyDifferences,
  });
  factory StackResourceDrift.fromXml(_s.XmlElement elem) {
    return StackResourceDrift(
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackResourceDriftStatus: _s
          .extractXmlStringValue(elem, 'StackResourceDriftStatus')
          ?.toStackResourceDriftStatus(),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
      actualProperties: _s.extractXmlStringValue(elem, 'ActualProperties'),
      expectedProperties: _s.extractXmlStringValue(elem, 'ExpectedProperties'),
      moduleInfo: _s
          .extractXmlChild(elem, 'ModuleInfo')
          ?.let((e) => ModuleInfo.fromXml(e)),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      physicalResourceIdContext: _s
          .extractXmlChild(elem, 'PhysicalResourceIdContext')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => PhysicalResourceIdContextKeyValuePair.fromXml(c))
              .toList()),
      propertyDifferences: _s.extractXmlChild(elem, 'PropertyDifferences')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => PropertyDifference.fromXml(c))
              .toList()),
    );
  }
}

/// Contains information about whether the resource's actual configuration
/// differs, or has <i>drifted</i>, from its expected configuration.
class StackResourceDriftInformation {
  /// Status of the resource's actual configuration compared to its expected
  /// configuration
  ///
  /// <ul>
  /// <li>
  /// <code>DELETED</code>: The resource differs from its expected configuration
  /// in that it has been deleted.
  /// </li>
  /// <li>
  /// <code>MODIFIED</code>: The resource differs from its expected configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the resource
  /// differs from its expected configuration.
  ///
  /// Any resources that do not currently support drift detection have a status of
  /// <code>NOT_CHECKED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The resources's actual configuration matches its
  /// expected configuration.
  /// </li>
  /// </ul>
  final StackResourceDriftStatus stackResourceDriftStatus;

  /// When AWS CloudFormation last checked if the resource had drifted from its
  /// expected configuration.
  final DateTime lastCheckTimestamp;

  StackResourceDriftInformation({
    @_s.required this.stackResourceDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackResourceDriftInformation.fromXml(_s.XmlElement elem) {
    return StackResourceDriftInformation(
      stackResourceDriftStatus: _s
          .extractXmlStringValue(elem, 'StackResourceDriftStatus')
          ?.toStackResourceDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }
}

/// Summarizes information about whether the resource's actual configuration
/// differs, or has <i>drifted</i>, from its expected configuration.
class StackResourceDriftInformationSummary {
  /// Status of the resource's actual configuration compared to its expected
  /// configuration
  ///
  /// <ul>
  /// <li>
  /// <code>DELETED</code>: The resource differs from its expected configuration
  /// in that it has been deleted.
  /// </li>
  /// <li>
  /// <code>MODIFIED</code>: The resource differs from its expected configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the resource
  /// differs from its expected configuration.
  ///
  /// Any resources that do not currently support drift detection have a status of
  /// <code>NOT_CHECKED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>. If you performed an
  /// <a>ContinueUpdateRollback</a> operation on a stack, any resources included
  /// in <code>ResourcesToSkip</code> will also have a status of
  /// <code>NOT_CHECKED</code>. For more information on skipping resources during
  /// rollback operations, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html">Continue
  /// Rolling Back an Update</a> in the AWS CloudFormation User Guide.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The resources's actual configuration matches its
  /// expected configuration.
  /// </li>
  /// </ul>
  final StackResourceDriftStatus stackResourceDriftStatus;

  /// When AWS CloudFormation last checked if the resource had drifted from its
  /// expected configuration.
  final DateTime lastCheckTimestamp;

  StackResourceDriftInformationSummary({
    @_s.required this.stackResourceDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackResourceDriftInformationSummary.fromXml(_s.XmlElement elem) {
    return StackResourceDriftInformationSummary(
      stackResourceDriftStatus: _s
          .extractXmlStringValue(elem, 'StackResourceDriftStatus')
          ?.toStackResourceDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }
}

enum StackResourceDriftStatus {
  @_s.JsonValue('IN_SYNC')
  inSync,
  @_s.JsonValue('MODIFIED')
  modified,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('NOT_CHECKED')
  notChecked,
}

extension on StackResourceDriftStatus {
  String toValue() {
    switch (this) {
      case StackResourceDriftStatus.inSync:
        return 'IN_SYNC';
      case StackResourceDriftStatus.modified:
        return 'MODIFIED';
      case StackResourceDriftStatus.deleted:
        return 'DELETED';
      case StackResourceDriftStatus.notChecked:
        return 'NOT_CHECKED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  StackResourceDriftStatus toStackResourceDriftStatus() {
    switch (this) {
      case 'IN_SYNC':
        return StackResourceDriftStatus.inSync;
      case 'MODIFIED':
        return StackResourceDriftStatus.modified;
      case 'DELETED':
        return StackResourceDriftStatus.deleted;
      case 'NOT_CHECKED':
        return StackResourceDriftStatus.notChecked;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains high-level information about the specified stack resource.
class StackResourceSummary {
  /// Time the status was updated.
  final DateTime lastUpdatedTimestamp;

  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// Current status of the resource.
  final ResourceStatus resourceStatus;

  /// Type of resource. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">
  /// AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)
  final String resourceType;

  /// Information about whether the resource's actual configuration differs, or
  /// has <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackResourceDriftInformationSummary driftInformation;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// the resource.
  final String physicalResourceId;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  StackResourceSummary({
    @_s.required this.lastUpdatedTimestamp,
    @_s.required this.logicalResourceId,
    @_s.required this.resourceStatus,
    @_s.required this.resourceType,
    this.driftInformation,
    this.moduleInfo,
    this.physicalResourceId,
    this.resourceStatusReason,
  });
  factory StackResourceSummary.fromXml(_s.XmlElement elem) {
    return StackResourceSummary(
      lastUpdatedTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastUpdatedTimestamp'),
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      resourceStatus:
          _s.extractXmlStringValue(elem, 'ResourceStatus')?.toResourceStatus(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let((e) => StackResourceDriftInformationSummary.fromXml(e)),
      moduleInfo: _s
          .extractXmlChild(elem, 'ModuleInfo')
          ?.let((e) => ModuleInfo.fromXml(e)),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
    );
  }
}

/// A structure that contains information about a stack set. A stack set enables
/// you to provision stacks into AWS accounts and across Regions by using a
/// single CloudFormation template. In the stack set, you specify the template
/// to use, as well as any parameters and capabilities that the template
/// requires.
class StackSet {
  /// The Amazon Resource Number (ARN) of the IAM role used to create or update
  /// the stack set.
  ///
  /// Use customized administrator roles to control which users or groups can
  /// manage specific stack sets within the same administrator account. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Prerequisites:
  /// Granting Permissions for Stack Set Operations</a> in the <i>AWS
  /// CloudFormation User Guide</i>.
  final String administrationRoleARN;

  /// [<code>Service-managed</code> permissions] Describes whether StackSets
  /// automatically deploys to AWS Organizations accounts that are added to a
  /// target organization or organizational unit (OU).
  final AutoDeployment autoDeployment;

  /// The capabilities that are allowed in the stack set. Some stack set templates
  /// might include resources that can affect permissions in your AWS account—for
  /// example, by creating new AWS Identity and Access Management (IAM) users. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates.</a>
  final List<Capability> capabilities;

  /// A description of the stack set that you specify when the stack set is
  /// created or updated.
  final String description;

  /// The name of the IAM execution role used to create or update the stack set.
  ///
  /// Use customized execution roles to control which stack resources users and
  /// groups can include in their stack sets.
  final String executionRoleName;

  /// [<code>Service-managed</code> permissions] The organization root ID or
  /// organizational unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final List<String> organizationalUnitIds;

  /// A list of input parameters for a stack set.
  final List<Parameter> parameters;

  /// Describes how the IAM roles required for stack set operations are created.
  ///
  /// <ul>
  /// <li>
  /// With <code>self-managed</code> permissions, you must create the
  /// administrator and execution roles required to deploy to target accounts. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant
  /// Self-Managed Stack Set Permissions</a>.
  /// </li>
  /// <li>
  /// With <code>service-managed</code> permissions, StackSets automatically
  /// creates the IAM roles required to deploy to accounts managed by AWS
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  final PermissionModels permissionModel;

  /// The Amazon Resource Number (ARN) of the stack set.
  final String stackSetARN;

  /// Detailed information about the drift status of the stack set.
  ///
  /// For stack sets, contains information about the last <i>completed</i> drift
  /// operation performed on the stack set. Information about drift operations
  /// currently in progress is not included.
  final StackSetDriftDetectionDetails stackSetDriftDetectionDetails;

  /// The ID of the stack set.
  final String stackSetId;

  /// The name that's associated with the stack set.
  final String stackSetName;

  /// The status of the stack set.
  final StackSetStatus status;

  /// A list of tags that specify information about the stack set. A maximum
  /// number of 50 tags can be specified.
  final List<Tag> tags;

  /// The structure that contains the body of the template that was used to create
  /// or update the stack set.
  final String templateBody;

  StackSet({
    this.administrationRoleARN,
    this.autoDeployment,
    this.capabilities,
    this.description,
    this.executionRoleName,
    this.organizationalUnitIds,
    this.parameters,
    this.permissionModel,
    this.stackSetARN,
    this.stackSetDriftDetectionDetails,
    this.stackSetId,
    this.stackSetName,
    this.status,
    this.tags,
    this.templateBody,
  });
  factory StackSet.fromXml(_s.XmlElement elem) {
    return StackSet(
      administrationRoleARN:
          _s.extractXmlStringValue(elem, 'AdministrationRoleARN'),
      autoDeployment: _s
          .extractXmlChild(elem, 'AutoDeployment')
          ?.let((e) => AutoDeployment.fromXml(e)),
      capabilities: _s.extractXmlChild(elem, 'Capabilities')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toCapability())
          .toList()),
      description: _s.extractXmlStringValue(elem, 'Description'),
      executionRoleName: _s.extractXmlStringValue(elem, 'ExecutionRoleName'),
      organizationalUnitIds: _s
          .extractXmlChild(elem, 'OrganizationalUnitIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('member')
          .map((c) => Parameter.fromXml(c))
          .toList()),
      permissionModel: _s
          .extractXmlStringValue(elem, 'PermissionModel')
          ?.toPermissionModels(),
      stackSetARN: _s.extractXmlStringValue(elem, 'StackSetARN'),
      stackSetDriftDetectionDetails: _s
          .extractXmlChild(elem, 'StackSetDriftDetectionDetails')
          ?.let((e) => StackSetDriftDetectionDetails.fromXml(e)),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      stackSetName: _s.extractXmlStringValue(elem, 'StackSetName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackSetStatus(),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
      templateBody: _s.extractXmlStringValue(elem, 'TemplateBody'),
    );
  }
}

/// Detailed information about the drift status of the stack set.
///
/// For stack sets, contains information about the last <i>completed</i> drift
/// operation performed on the stack set. Information about drift operations
/// in-progress is not included.
///
/// For stack set operations, includes information about drift operations
/// currently being performed on the stack set.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting
/// Unmanaged Changes in Stack Sets</a> in the <i>AWS CloudFormation User
/// Guide</i>.
class StackSetDriftDetectionDetails {
  /// The status of the stack set drift detection operation.
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLETED</code>: The drift detection operation completed without
  /// failing on any stack instances.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The drift detection operation exceeded the specified
  /// failure tolerance.
  /// </li>
  /// <li>
  /// <code>PARTIAL_SUCCESS</code>: The drift detection operation completed
  /// without exceeding the failure tolerance for the operation.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code>: The drift detection operation is currently being
  /// performed.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>: The user has cancelled the drift detection operation.
  /// </li>
  /// </ul>
  final StackSetDriftDetectionStatus driftDetectionStatus;

  /// Status of the stack set's actual configuration compared to its expected
  /// template and parameter configuration. A stack set is considered to have
  /// drifted if one or more of its stack instances have drifted from their
  /// expected template and parameter configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: One or more of the stack instances belonging to the
  /// stack set stack differs from the expected template and parameter
  /// configuration. A stack instance is considered to have drifted if one or more
  /// of the resources in the associated stack have drifted.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked the stack set
  /// for drift.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: All of the stack instances belonging to the stack set
  /// stack match from the expected template and parameter configuration.
  /// </li>
  /// </ul>
  final StackSetDriftStatus driftStatus;

  /// The number of stack instances that have drifted from the expected template
  /// and parameter configuration of the stack set. A stack instance is considered
  /// to have drifted if one or more of the resources in the associated stack do
  /// not match their expected configuration.
  final int driftedStackInstancesCount;

  /// The number of stack instances for which the drift detection operation
  /// failed.
  final int failedStackInstancesCount;

  /// The number of stack instances that are currently being checked for drift.
  final int inProgressStackInstancesCount;

  /// The number of stack instances which match the expected template and
  /// parameter configuration of the stack set.
  final int inSyncStackInstancesCount;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack set. This value will be <code>NULL</code> for any stack set on
  /// which drift detection has not yet been performed.
  final DateTime lastDriftCheckTimestamp;

  /// The total number of stack instances belonging to this stack set.
  ///
  /// The total number of stack instances is equal to the total of:
  ///
  /// <ul>
  /// <li>
  /// Stack instances that match the stack set configuration.
  /// </li>
  /// <li>
  /// Stack instances that have drifted from the stack set configuration.
  /// </li>
  /// <li>
  /// Stack instances where the drift detection operation has failed.
  /// </li>
  /// <li>
  /// Stack instances currently being checked for drift.
  /// </li>
  /// </ul>
  final int totalStackInstancesCount;

  StackSetDriftDetectionDetails({
    this.driftDetectionStatus,
    this.driftStatus,
    this.driftedStackInstancesCount,
    this.failedStackInstancesCount,
    this.inProgressStackInstancesCount,
    this.inSyncStackInstancesCount,
    this.lastDriftCheckTimestamp,
    this.totalStackInstancesCount,
  });
  factory StackSetDriftDetectionDetails.fromXml(_s.XmlElement elem) {
    return StackSetDriftDetectionDetails(
      driftDetectionStatus: _s
          .extractXmlStringValue(elem, 'DriftDetectionStatus')
          ?.toStackSetDriftDetectionStatus(),
      driftStatus: _s
          .extractXmlStringValue(elem, 'DriftStatus')
          ?.toStackSetDriftStatus(),
      driftedStackInstancesCount:
          _s.extractXmlIntValue(elem, 'DriftedStackInstancesCount'),
      failedStackInstancesCount:
          _s.extractXmlIntValue(elem, 'FailedStackInstancesCount'),
      inProgressStackInstancesCount:
          _s.extractXmlIntValue(elem, 'InProgressStackInstancesCount'),
      inSyncStackInstancesCount:
          _s.extractXmlIntValue(elem, 'InSyncStackInstancesCount'),
      lastDriftCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastDriftCheckTimestamp'),
      totalStackInstancesCount:
          _s.extractXmlIntValue(elem, 'TotalStackInstancesCount'),
    );
  }
}

enum StackSetDriftDetectionStatus {
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('PARTIAL_SUCCESS')
  partialSuccess,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('STOPPED')
  stopped,
}

extension on String {
  StackSetDriftDetectionStatus toStackSetDriftDetectionStatus() {
    switch (this) {
      case 'COMPLETED':
        return StackSetDriftDetectionStatus.completed;
      case 'FAILED':
        return StackSetDriftDetectionStatus.failed;
      case 'PARTIAL_SUCCESS':
        return StackSetDriftDetectionStatus.partialSuccess;
      case 'IN_PROGRESS':
        return StackSetDriftDetectionStatus.inProgress;
      case 'STOPPED':
        return StackSetDriftDetectionStatus.stopped;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum StackSetDriftStatus {
  @_s.JsonValue('DRIFTED')
  drifted,
  @_s.JsonValue('IN_SYNC')
  inSync,
  @_s.JsonValue('NOT_CHECKED')
  notChecked,
}

extension on String {
  StackSetDriftStatus toStackSetDriftStatus() {
    switch (this) {
      case 'DRIFTED':
        return StackSetDriftStatus.drifted;
      case 'IN_SYNC':
        return StackSetDriftStatus.inSync;
      case 'NOT_CHECKED':
        return StackSetDriftStatus.notChecked;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure that contains information about a stack set operation.
class StackSetOperation {
  /// The type of stack set operation: <code>CREATE</code>, <code>UPDATE</code>,
  /// or <code>DELETE</code>. Create and delete operations affect only the
  /// specified stack set instances that are associated with the specified stack
  /// set. Update operations affect both the stack set itself, as well as
  /// <i>all</i> associated stack set instances.
  final StackSetOperationAction action;

  /// The Amazon Resource Number (ARN) of the IAM role used to perform this stack
  /// set operation.
  ///
  /// Use customized administrator roles to control which users or groups can
  /// manage specific stack sets within the same administrator account. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Define
  /// Permissions for Multiple Administrators</a> in the <i>AWS CloudFormation
  /// User Guide</i>.
  final String administrationRoleARN;

  /// The time at which the operation was initiated. Note that the creation times
  /// for the stack set operation might differ from the creation time of the
  /// individual stacks themselves. This is because AWS CloudFormation needs to
  /// perform preparatory work for the operation, such as dispatching the work to
  /// the requested Regions, before actually creating the first stacks.
  final DateTime creationTimestamp;

  /// [<code>Service-managed</code> permissions] The AWS Organizations accounts
  /// affected by the stack operation.
  final DeploymentTargets deploymentTargets;

  /// The time at which the stack set operation ended, across all accounts and
  /// Regions specified. Note that this doesn't necessarily mean that the stack
  /// set operation was successful, or even attempted, in each account or Region.
  final DateTime endTimestamp;

  /// The name of the IAM execution role used to create or update the stack set.
  ///
  /// Use customized execution roles to control which stack resources users and
  /// groups can include in their stack sets.
  final String executionRoleName;

  /// The unique ID of a stack set operation.
  final String operationId;

  /// The preferences for how AWS CloudFormation performs this stack set
  /// operation.
  final StackSetOperationPreferences operationPreferences;

  /// For stack set operations of action type <code>DELETE</code>, specifies
  /// whether to remove the stack instances from the specified stack set, but
  /// doesn't delete the stacks. You can't reassociate a retained stack, or add an
  /// existing, saved stack to a new stack set.
  final bool retainStacks;

  /// Detailed information about the drift status of the stack set. This includes
  /// information about drift operations currently being performed on the stack
  /// set.
  ///
  /// this information will only be present for stack set operations whose
  /// <code>Action</code> type is <code>DETECT_DRIFT</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting
  /// Unmanaged Changes in Stack Sets</a> in the AWS CloudFormation User Guide.
  final StackSetDriftDetectionDetails stackSetDriftDetectionDetails;

  /// The ID of the stack set.
  final String stackSetId;

  /// The status of the operation.
  ///
  /// <ul>
  /// <li>
  /// <code>FAILED</code>: The operation exceeded the specified failure tolerance.
  /// The failure tolerance value that you've set for an operation is applied for
  /// each Region during stack create and update operations. If the number of
  /// failed stacks within a Region exceeds the failure tolerance, the status of
  /// the operation in the Region is set to <code>FAILED</code>. This in turn sets
  /// the status of the operation as a whole to <code>FAILED</code>, and AWS
  /// CloudFormation cancels the operation in any remaining Regions.
  /// </li>
  /// <li>
  /// <code>QUEUED</code>: [<code>Service-managed</code> permissions] For
  /// automatic deployments that require a sequence of operations, the operation
  /// is queued to be performed. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes">stack
  /// set operation status codes</a> in the AWS CloudFormation User Guide.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The operation is currently being performed.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>: The user has cancelled the operation.
  /// </li>
  /// <li>
  /// <code>STOPPING</code>: The operation is in the process of stopping, at user
  /// request.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The operation completed creating or updating all the
  /// specified stacks without exceeding the failure tolerance for the operation.
  /// </li>
  /// </ul>
  final StackSetOperationStatus status;

  StackSetOperation({
    this.action,
    this.administrationRoleARN,
    this.creationTimestamp,
    this.deploymentTargets,
    this.endTimestamp,
    this.executionRoleName,
    this.operationId,
    this.operationPreferences,
    this.retainStacks,
    this.stackSetDriftDetectionDetails,
    this.stackSetId,
    this.status,
  });
  factory StackSetOperation.fromXml(_s.XmlElement elem) {
    return StackSetOperation(
      action:
          _s.extractXmlStringValue(elem, 'Action')?.toStackSetOperationAction(),
      administrationRoleARN:
          _s.extractXmlStringValue(elem, 'AdministrationRoleARN'),
      creationTimestamp: _s.extractXmlDateTimeValue(elem, 'CreationTimestamp'),
      deploymentTargets: _s
          .extractXmlChild(elem, 'DeploymentTargets')
          ?.let((e) => DeploymentTargets.fromXml(e)),
      endTimestamp: _s.extractXmlDateTimeValue(elem, 'EndTimestamp'),
      executionRoleName: _s.extractXmlStringValue(elem, 'ExecutionRoleName'),
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
      operationPreferences: _s
          .extractXmlChild(elem, 'OperationPreferences')
          ?.let((e) => StackSetOperationPreferences.fromXml(e)),
      retainStacks: _s.extractXmlBoolValue(elem, 'RetainStacks'),
      stackSetDriftDetectionDetails: _s
          .extractXmlChild(elem, 'StackSetDriftDetectionDetails')
          ?.let((e) => StackSetDriftDetectionDetails.fromXml(e)),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toStackSetOperationStatus(),
    );
  }
}

enum StackSetOperationAction {
  @_s.JsonValue('CREATE')
  create,
  @_s.JsonValue('UPDATE')
  update,
  @_s.JsonValue('DELETE')
  delete,
  @_s.JsonValue('DETECT_DRIFT')
  detectDrift,
}

extension on String {
  StackSetOperationAction toStackSetOperationAction() {
    switch (this) {
      case 'CREATE':
        return StackSetOperationAction.create;
      case 'UPDATE':
        return StackSetOperationAction.update;
      case 'DELETE':
        return StackSetOperationAction.delete;
      case 'DETECT_DRIFT':
        return StackSetOperationAction.detectDrift;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The user-specified preferences for how AWS CloudFormation performs a stack
/// set operation.
///
/// For more information on maximum concurrent accounts and failure tolerance,
/// see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
/// set operation options</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StackSetOperationPreferences {
  /// The number of accounts, per Region, for which this operation can fail before
  /// AWS CloudFormation stops the operation in that Region. If the operation is
  /// stopped in a Region, AWS CloudFormation doesn't attempt the operation in any
  /// subsequent Regions.
  ///
  /// Conditional: You must specify either <code>FailureToleranceCount</code> or
  /// <code>FailureTolerancePercentage</code> (but not both).
  @_s.JsonKey(name: 'FailureToleranceCount')
  final int failureToleranceCount;

  /// The percentage of accounts, per Region, for which this stack operation can
  /// fail before AWS CloudFormation stops the operation in that Region. If the
  /// operation is stopped in a Region, AWS CloudFormation doesn't attempt the
  /// operation in any subsequent Regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS CloudFormation rounds <i>down</i> to the next whole number.
  ///
  /// Conditional: You must specify either <code>FailureToleranceCount</code> or
  /// <code>FailureTolerancePercentage</code>, but not both.
  @_s.JsonKey(name: 'FailureTolerancePercentage')
  final int failureTolerancePercentage;

  /// The maximum number of accounts in which to perform this operation at one
  /// time. This is dependent on the value of <code>FailureToleranceCount</code>.
  /// <code>MaxConcurrentCount</code> is at most one more than the
  /// <code>FailureToleranceCount</code>.
  ///
  /// Note that this setting lets you specify the <i>maximum</i> for operations.
  /// For large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Conditional: You must specify either <code>MaxConcurrentCount</code> or
  /// <code>MaxConcurrentPercentage</code>, but not both.
  @_s.JsonKey(name: 'MaxConcurrentCount')
  final int maxConcurrentCount;

  /// The maximum percentage of accounts in which to perform this operation at one
  /// time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS CloudFormation rounds down to the next whole number. This is true except
  /// in cases where rounding down would result is zero. In this case,
  /// CloudFormation sets the number as one instead.
  ///
  /// Note that this setting lets you specify the <i>maximum</i> for operations.
  /// For large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Conditional: You must specify either <code>MaxConcurrentCount</code> or
  /// <code>MaxConcurrentPercentage</code>, but not both.
  @_s.JsonKey(name: 'MaxConcurrentPercentage')
  final int maxConcurrentPercentage;

  /// The order of the Regions in where you want to perform the stack operation.
  @_s.JsonKey(name: 'RegionOrder')
  final List<String> regionOrder;

  StackSetOperationPreferences({
    this.failureToleranceCount,
    this.failureTolerancePercentage,
    this.maxConcurrentCount,
    this.maxConcurrentPercentage,
    this.regionOrder,
  });
  factory StackSetOperationPreferences.fromXml(_s.XmlElement elem) {
    return StackSetOperationPreferences(
      failureToleranceCount:
          _s.extractXmlIntValue(elem, 'FailureToleranceCount'),
      failureTolerancePercentage:
          _s.extractXmlIntValue(elem, 'FailureTolerancePercentage'),
      maxConcurrentCount: _s.extractXmlIntValue(elem, 'MaxConcurrentCount'),
      maxConcurrentPercentage:
          _s.extractXmlIntValue(elem, 'MaxConcurrentPercentage'),
      regionOrder: _s
          .extractXmlChild(elem, 'RegionOrder')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() => _$StackSetOperationPreferencesToJson(this);
}

enum StackSetOperationResultStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELLED')
  cancelled,
}

extension on String {
  StackSetOperationResultStatus toStackSetOperationResultStatus() {
    switch (this) {
      case 'PENDING':
        return StackSetOperationResultStatus.pending;
      case 'RUNNING':
        return StackSetOperationResultStatus.running;
      case 'SUCCEEDED':
        return StackSetOperationResultStatus.succeeded;
      case 'FAILED':
        return StackSetOperationResultStatus.failed;
      case 'CANCELLED':
        return StackSetOperationResultStatus.cancelled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure that contains information about a specified operation's
/// results for a given account in a given Region.
class StackSetOperationResultSummary {
  /// [<code>Self-managed</code> permissions] The name of the AWS account for this
  /// operation result.
  final String account;

  /// The results of the account gate function AWS CloudFormation invokes, if
  /// present, before proceeding with stack set operations in an account
  final AccountGateResult accountGateResult;

  /// [<code>Service-managed</code> permissions] The organization root ID or
  /// organizational unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final String organizationalUnitId;

  /// The name of the AWS Region for this operation result.
  final String region;

  /// The result status of the stack set operation for the given account in the
  /// given Region.
  ///
  /// <ul>
  /// <li>
  /// <code>CANCELLED</code>: The operation in the specified account and Region
  /// has been cancelled. This is either because a user has stopped the stack set
  /// operation, or because the failure tolerance of the stack set operation has
  /// been exceeded.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The operation in the specified account and Region
  /// failed.
  ///
  /// If the stack set operation fails in enough accounts within a Region, the
  /// failure tolerance for the stack set operation as a whole might be exceeded.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The operation in the specified account and Region is
  /// currently in progress.
  /// </li>
  /// <li>
  /// <code>PENDING</code>: The operation in the specified account and Region has
  /// yet to start.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The operation in the specified account and Region
  /// completed successfully.
  /// </li>
  /// </ul>
  final StackSetOperationResultStatus status;

  /// The reason for the assigned result status.
  final String statusReason;

  StackSetOperationResultSummary({
    this.account,
    this.accountGateResult,
    this.organizationalUnitId,
    this.region,
    this.status,
    this.statusReason,
  });
  factory StackSetOperationResultSummary.fromXml(_s.XmlElement elem) {
    return StackSetOperationResultSummary(
      account: _s.extractXmlStringValue(elem, 'Account'),
      accountGateResult: _s
          .extractXmlChild(elem, 'AccountGateResult')
          ?.let((e) => AccountGateResult.fromXml(e)),
      organizationalUnitId:
          _s.extractXmlStringValue(elem, 'OrganizationalUnitId'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toStackSetOperationResultStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }
}

enum StackSetOperationStatus {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('QUEUED')
  queued,
}

extension on String {
  StackSetOperationStatus toStackSetOperationStatus() {
    switch (this) {
      case 'RUNNING':
        return StackSetOperationStatus.running;
      case 'SUCCEEDED':
        return StackSetOperationStatus.succeeded;
      case 'FAILED':
        return StackSetOperationStatus.failed;
      case 'STOPPING':
        return StackSetOperationStatus.stopping;
      case 'STOPPED':
        return StackSetOperationStatus.stopped;
      case 'QUEUED':
        return StackSetOperationStatus.queued;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structures that contain summary information about the specified
/// operation.
class StackSetOperationSummary {
  /// The type of operation: <code>CREATE</code>, <code>UPDATE</code>, or
  /// <code>DELETE</code>. Create and delete operations affect only the specified
  /// stack instances that are associated with the specified stack set. Update
  /// operations affect both the stack set itself as well as <i>all</i> associated
  /// stack set instances.
  final StackSetOperationAction action;

  /// The time at which the operation was initiated. Note that the creation times
  /// for the stack set operation might differ from the creation time of the
  /// individual stacks themselves. This is because AWS CloudFormation needs to
  /// perform preparatory work for the operation, such as dispatching the work to
  /// the requested Regions, before actually creating the first stacks.
  final DateTime creationTimestamp;

  /// The time at which the stack set operation ended, across all accounts and
  /// Regions specified. Note that this doesn't necessarily mean that the stack
  /// set operation was successful, or even attempted, in each account or Region.
  final DateTime endTimestamp;

  /// The unique ID of the stack set operation.
  final String operationId;

  /// The overall status of the operation.
  ///
  /// <ul>
  /// <li>
  /// <code>FAILED</code>: The operation exceeded the specified failure tolerance.
  /// The failure tolerance value that you've set for an operation is applied for
  /// each Region during stack create and update operations. If the number of
  /// failed stacks within a Region exceeds the failure tolerance, the status of
  /// the operation in the Region is set to <code>FAILED</code>. This in turn sets
  /// the status of the operation as a whole to <code>FAILED</code>, and AWS
  /// CloudFormation cancels the operation in any remaining Regions.
  /// </li>
  /// <li>
  /// <code>QUEUED</code>: [<code>Service-managed</code> permissions] For
  /// automatic deployments that require a sequence of operations, the operation
  /// is queued to be performed. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes">stack
  /// set operation status codes</a> in the AWS CloudFormation User Guide.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The operation is currently being performed.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>: The user has cancelled the operation.
  /// </li>
  /// <li>
  /// <code>STOPPING</code>: The operation is in the process of stopping, at user
  /// request.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The operation completed creating or updating all the
  /// specified stacks without exceeding the failure tolerance for the operation.
  /// </li>
  /// </ul>
  final StackSetOperationStatus status;

  StackSetOperationSummary({
    this.action,
    this.creationTimestamp,
    this.endTimestamp,
    this.operationId,
    this.status,
  });
  factory StackSetOperationSummary.fromXml(_s.XmlElement elem) {
    return StackSetOperationSummary(
      action:
          _s.extractXmlStringValue(elem, 'Action')?.toStackSetOperationAction(),
      creationTimestamp: _s.extractXmlDateTimeValue(elem, 'CreationTimestamp'),
      endTimestamp: _s.extractXmlDateTimeValue(elem, 'EndTimestamp'),
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toStackSetOperationStatus(),
    );
  }
}

enum StackSetStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
}

extension on StackSetStatus {
  String toValue() {
    switch (this) {
      case StackSetStatus.active:
        return 'ACTIVE';
      case StackSetStatus.deleted:
        return 'DELETED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  StackSetStatus toStackSetStatus() {
    switch (this) {
      case 'ACTIVE':
        return StackSetStatus.active;
      case 'DELETED':
        return StackSetStatus.deleted;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structures that contain summary information about the specified stack
/// set.
class StackSetSummary {
  /// [<code>Service-managed</code> permissions] Describes whether StackSets
  /// automatically deploys to AWS Organizations accounts that are added to a
  /// target organizational unit (OU).
  final AutoDeployment autoDeployment;

  /// A description of the stack set that you specify when the stack set is
  /// created or updated.
  final String description;

  /// Status of the stack set's actual configuration compared to its expected
  /// template and parameter configuration. A stack set is considered to have
  /// drifted if one or more of its stack instances have drifted from their
  /// expected template and parameter configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>DRIFTED</code>: One or more of the stack instances belonging to the
  /// stack set stack differs from the expected template and parameter
  /// configuration. A stack instance is considered to have drifted if one or more
  /// of the resources in the associated stack have drifted.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: AWS CloudFormation has not checked the stack set
  /// for drift.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: All of the stack instances belonging to the stack set
  /// stack match from the expected template and parameter configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus driftStatus;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack set. This value will be <code>NULL</code> for any stack set on
  /// which drift detection has not yet been performed.
  final DateTime lastDriftCheckTimestamp;

  /// Describes how the IAM roles required for stack set operations are created.
  ///
  /// <ul>
  /// <li>
  /// With <code>self-managed</code> permissions, you must create the
  /// administrator and execution roles required to deploy to target accounts. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant
  /// Self-Managed Stack Set Permissions</a>.
  /// </li>
  /// <li>
  /// With <code>service-managed</code> permissions, StackSets automatically
  /// creates the IAM roles required to deploy to accounts managed by AWS
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  final PermissionModels permissionModel;

  /// The ID of the stack set.
  final String stackSetId;

  /// The name of the stack set.
  final String stackSetName;

  /// The status of the stack set.
  final StackSetStatus status;

  StackSetSummary({
    this.autoDeployment,
    this.description,
    this.driftStatus,
    this.lastDriftCheckTimestamp,
    this.permissionModel,
    this.stackSetId,
    this.stackSetName,
    this.status,
  });
  factory StackSetSummary.fromXml(_s.XmlElement elem) {
    return StackSetSummary(
      autoDeployment: _s
          .extractXmlChild(elem, 'AutoDeployment')
          ?.let((e) => AutoDeployment.fromXml(e)),
      description: _s.extractXmlStringValue(elem, 'Description'),
      driftStatus:
          _s.extractXmlStringValue(elem, 'DriftStatus')?.toStackDriftStatus(),
      lastDriftCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastDriftCheckTimestamp'),
      permissionModel: _s
          .extractXmlStringValue(elem, 'PermissionModel')
          ?.toPermissionModels(),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      stackSetName: _s.extractXmlStringValue(elem, 'StackSetName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackSetStatus(),
    );
  }
}

enum StackStatus {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('CREATE_COMPLETE')
  createComplete,
  @_s.JsonValue('ROLLBACK_IN_PROGRESS')
  rollbackInProgress,
  @_s.JsonValue('ROLLBACK_FAILED')
  rollbackFailed,
  @_s.JsonValue('ROLLBACK_COMPLETE')
  rollbackComplete,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DELETE_COMPLETE')
  deleteComplete,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_COMPLETE_CLEANUP_IN_PROGRESS')
  updateCompleteCleanupInProgress,
  @_s.JsonValue('UPDATE_COMPLETE')
  updateComplete,
  @_s.JsonValue('UPDATE_ROLLBACK_IN_PROGRESS')
  updateRollbackInProgress,
  @_s.JsonValue('UPDATE_ROLLBACK_FAILED')
  updateRollbackFailed,
  @_s.JsonValue('UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS')
  updateRollbackCompleteCleanupInProgress,
  @_s.JsonValue('UPDATE_ROLLBACK_COMPLETE')
  updateRollbackComplete,
  @_s.JsonValue('REVIEW_IN_PROGRESS')
  reviewInProgress,
  @_s.JsonValue('IMPORT_IN_PROGRESS')
  importInProgress,
  @_s.JsonValue('IMPORT_COMPLETE')
  importComplete,
  @_s.JsonValue('IMPORT_ROLLBACK_IN_PROGRESS')
  importRollbackInProgress,
  @_s.JsonValue('IMPORT_ROLLBACK_FAILED')
  importRollbackFailed,
  @_s.JsonValue('IMPORT_ROLLBACK_COMPLETE')
  importRollbackComplete,
}

extension on StackStatus {
  String toValue() {
    switch (this) {
      case StackStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case StackStatus.createFailed:
        return 'CREATE_FAILED';
      case StackStatus.createComplete:
        return 'CREATE_COMPLETE';
      case StackStatus.rollbackInProgress:
        return 'ROLLBACK_IN_PROGRESS';
      case StackStatus.rollbackFailed:
        return 'ROLLBACK_FAILED';
      case StackStatus.rollbackComplete:
        return 'ROLLBACK_COMPLETE';
      case StackStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case StackStatus.deleteFailed:
        return 'DELETE_FAILED';
      case StackStatus.deleteComplete:
        return 'DELETE_COMPLETE';
      case StackStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case StackStatus.updateCompleteCleanupInProgress:
        return 'UPDATE_COMPLETE_CLEANUP_IN_PROGRESS';
      case StackStatus.updateComplete:
        return 'UPDATE_COMPLETE';
      case StackStatus.updateRollbackInProgress:
        return 'UPDATE_ROLLBACK_IN_PROGRESS';
      case StackStatus.updateRollbackFailed:
        return 'UPDATE_ROLLBACK_FAILED';
      case StackStatus.updateRollbackCompleteCleanupInProgress:
        return 'UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS';
      case StackStatus.updateRollbackComplete:
        return 'UPDATE_ROLLBACK_COMPLETE';
      case StackStatus.reviewInProgress:
        return 'REVIEW_IN_PROGRESS';
      case StackStatus.importInProgress:
        return 'IMPORT_IN_PROGRESS';
      case StackStatus.importComplete:
        return 'IMPORT_COMPLETE';
      case StackStatus.importRollbackInProgress:
        return 'IMPORT_ROLLBACK_IN_PROGRESS';
      case StackStatus.importRollbackFailed:
        return 'IMPORT_ROLLBACK_FAILED';
      case StackStatus.importRollbackComplete:
        return 'IMPORT_ROLLBACK_COMPLETE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  StackStatus toStackStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return StackStatus.createInProgress;
      case 'CREATE_FAILED':
        return StackStatus.createFailed;
      case 'CREATE_COMPLETE':
        return StackStatus.createComplete;
      case 'ROLLBACK_IN_PROGRESS':
        return StackStatus.rollbackInProgress;
      case 'ROLLBACK_FAILED':
        return StackStatus.rollbackFailed;
      case 'ROLLBACK_COMPLETE':
        return StackStatus.rollbackComplete;
      case 'DELETE_IN_PROGRESS':
        return StackStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return StackStatus.deleteFailed;
      case 'DELETE_COMPLETE':
        return StackStatus.deleteComplete;
      case 'UPDATE_IN_PROGRESS':
        return StackStatus.updateInProgress;
      case 'UPDATE_COMPLETE_CLEANUP_IN_PROGRESS':
        return StackStatus.updateCompleteCleanupInProgress;
      case 'UPDATE_COMPLETE':
        return StackStatus.updateComplete;
      case 'UPDATE_ROLLBACK_IN_PROGRESS':
        return StackStatus.updateRollbackInProgress;
      case 'UPDATE_ROLLBACK_FAILED':
        return StackStatus.updateRollbackFailed;
      case 'UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS':
        return StackStatus.updateRollbackCompleteCleanupInProgress;
      case 'UPDATE_ROLLBACK_COMPLETE':
        return StackStatus.updateRollbackComplete;
      case 'REVIEW_IN_PROGRESS':
        return StackStatus.reviewInProgress;
      case 'IMPORT_IN_PROGRESS':
        return StackStatus.importInProgress;
      case 'IMPORT_COMPLETE':
        return StackStatus.importComplete;
      case 'IMPORT_ROLLBACK_IN_PROGRESS':
        return StackStatus.importRollbackInProgress;
      case 'IMPORT_ROLLBACK_FAILED':
        return StackStatus.importRollbackFailed;
      case 'IMPORT_ROLLBACK_COMPLETE':
        return StackStatus.importRollbackComplete;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The StackSummary Data Type
class StackSummary {
  /// The time the stack was created.
  final DateTime creationTime;

  /// The name associated with the stack.
  final String stackName;

  /// The current status of the stack.
  final StackStatus stackStatus;

  /// The time the stack was deleted.
  final DateTime deletionTime;

  /// Summarizes information on whether a stack's actual configuration differs, or
  /// has <i>drifted</i>, from it's expected configuration, as defined in the
  /// stack template and any values specified as template parameters. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackDriftInformationSummary driftInformation;

  /// The time the stack was last updated. This field will only be returned if the
  /// stack has been updated at least once.
  final DateTime lastUpdatedTime;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the direct parent of this stack. For the first level of nested stacks,
  /// the root stack is also the parent stack.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.
  final String parentId;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the top-level stack to which the nested stack ultimately belongs.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.
  final String rootId;

  /// Unique stack identifier.
  final String stackId;

  /// Success/Failure message associated with the stack status.
  final String stackStatusReason;

  /// The template description of the template used to create the stack.
  final String templateDescription;

  StackSummary({
    @_s.required this.creationTime,
    @_s.required this.stackName,
    @_s.required this.stackStatus,
    this.deletionTime,
    this.driftInformation,
    this.lastUpdatedTime,
    this.parentId,
    this.rootId,
    this.stackId,
    this.stackStatusReason,
    this.templateDescription,
  });
  factory StackSummary.fromXml(_s.XmlElement elem) {
    return StackSummary(
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      stackStatus:
          _s.extractXmlStringValue(elem, 'StackStatus')?.toStackStatus(),
      deletionTime: _s.extractXmlDateTimeValue(elem, 'DeletionTime'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let((e) => StackDriftInformationSummary.fromXml(e)),
      lastUpdatedTime: _s.extractXmlDateTimeValue(elem, 'LastUpdatedTime'),
      parentId: _s.extractXmlStringValue(elem, 'ParentId'),
      rootId: _s.extractXmlStringValue(elem, 'RootId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackStatusReason: _s.extractXmlStringValue(elem, 'StackStatusReason'),
      templateDescription:
          _s.extractXmlStringValue(elem, 'TemplateDescription'),
    );
  }
}

class StopStackSetOperationOutput {
  StopStackSetOperationOutput();
  factory StopStackSetOperationOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return StopStackSetOperationOutput();
  }
}

/// The Tag type enables you to specify a key-value pair that can be used to
/// store information about an AWS CloudFormation stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// <i>Required</i>. A string used to identify this tag. You can specify a
  /// maximum of 128 characters for a tag key. Tags owned by Amazon Web Services
  /// (AWS) have the reserved prefix: <code>aws:</code>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// <i>Required</i>. A string containing the value for this tag. You can specify
  /// a maximum of 256 characters for a tag value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The TemplateParameter data type.
class TemplateParameter {
  /// The default value associated with the parameter.
  final String defaultValue;

  /// User defined description associated with the parameter.
  final String description;

  /// Flag indicating whether the parameter should be displayed as plain text in
  /// logs and UIs.
  final bool noEcho;

  /// The name associated with the parameter.
  final String parameterKey;

  TemplateParameter({
    this.defaultValue,
    this.description,
    this.noEcho,
    this.parameterKey,
  });
  factory TemplateParameter.fromXml(_s.XmlElement elem) {
    return TemplateParameter(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      noEcho: _s.extractXmlBoolValue(elem, 'NoEcho'),
      parameterKey: _s.extractXmlStringValue(elem, 'ParameterKey'),
    );
  }
}

enum TemplateStage {
  @_s.JsonValue('Original')
  original,
  @_s.JsonValue('Processed')
  processed,
}

extension on TemplateStage {
  String toValue() {
    switch (this) {
      case TemplateStage.original:
        return 'Original';
      case TemplateStage.processed:
        return 'Processed';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  TemplateStage toTemplateStage() {
    switch (this) {
      case 'Original':
        return TemplateStage.original;
      case 'Processed':
        return TemplateStage.processed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains summary information about the specified CloudFormation type.
class TypeSummary {
  /// The ID of the default version of the type. The default version is used when
  /// the type version is not specified.
  ///
  /// To set the default version of a type, use <code>
  /// <a>SetTypeDefaultVersion</a> </code>.
  final String defaultVersionId;

  /// The description of the type.
  final String description;

  /// When the current default version of the type was registered.
  final DateTime lastUpdated;

  /// The kind of type.
  final RegistryType type;

  /// The Amazon Resource Name (ARN) of the type.
  final String typeArn;

  /// The name of the type.
  final String typeName;

  TypeSummary({
    this.defaultVersionId,
    this.description,
    this.lastUpdated,
    this.type,
    this.typeArn,
    this.typeName,
  });
  factory TypeSummary.fromXml(_s.XmlElement elem) {
    return TypeSummary(
      defaultVersionId: _s.extractXmlStringValue(elem, 'DefaultVersionId'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      lastUpdated: _s.extractXmlDateTimeValue(elem, 'LastUpdated'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toRegistryType(),
      typeArn: _s.extractXmlStringValue(elem, 'TypeArn'),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
    );
  }
}

/// Contains summary information about a specific version of a CloudFormation
/// type.
class TypeVersionSummary {
  /// The Amazon Resource Name (ARN) of the type version.
  final String arn;

  /// The description of the type version.
  final String description;

  /// Whether the specified type version is set as the default version.
  final bool isDefaultVersion;

  /// When the version was registered.
  final DateTime timeCreated;

  /// The kind of type.
  final RegistryType type;

  /// The name of the type.
  final String typeName;

  /// The ID of a specific version of the type. The version ID is the value at the
  /// end of the Amazon Resource Name (ARN) assigned to the type version when it
  /// is registered.
  final String versionId;

  TypeVersionSummary({
    this.arn,
    this.description,
    this.isDefaultVersion,
    this.timeCreated,
    this.type,
    this.typeName,
    this.versionId,
  });
  factory TypeVersionSummary.fromXml(_s.XmlElement elem) {
    return TypeVersionSummary(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isDefaultVersion: _s.extractXmlBoolValue(elem, 'IsDefaultVersion'),
      timeCreated: _s.extractXmlDateTimeValue(elem, 'TimeCreated'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toRegistryType(),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
      versionId: _s.extractXmlStringValue(elem, 'VersionId'),
    );
  }
}

class UpdateStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String operationId;

  UpdateStackInstancesOutput({
    this.operationId,
  });
  factory UpdateStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return UpdateStackInstancesOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }
}

/// The output for an <a>UpdateStack</a> action.
class UpdateStackOutput {
  /// Unique identifier of the stack.
  final String stackId;

  UpdateStackOutput({
    this.stackId,
  });
  factory UpdateStackOutput.fromXml(_s.XmlElement elem) {
    return UpdateStackOutput(
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }
}

class UpdateStackSetOutput {
  /// The unique ID for this stack set operation.
  final String operationId;

  UpdateStackSetOutput({
    this.operationId,
  });
  factory UpdateStackSetOutput.fromXml(_s.XmlElement elem) {
    return UpdateStackSetOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }
}

class UpdateTerminationProtectionOutput {
  /// The unique ID of the stack.
  final String stackId;

  UpdateTerminationProtectionOutput({
    this.stackId,
  });
  factory UpdateTerminationProtectionOutput.fromXml(_s.XmlElement elem) {
    return UpdateTerminationProtectionOutput(
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }
}

/// The output for <a>ValidateTemplate</a> action.
class ValidateTemplateOutput {
  /// The capabilities found within the template. If your template contains IAM
  /// resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value
  /// for this parameter when you use the <a>CreateStack</a> or <a>UpdateStack</a>
  /// actions with your template; otherwise, those actions return an
  /// InsufficientCapabilities error.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in AWS CloudFormation Templates</a>.
  final List<Capability> capabilities;

  /// The list of resources that generated the values in the
  /// <code>Capabilities</code> response element.
  final String capabilitiesReason;

  /// A list of the transforms that are declared in the template.
  final List<String> declaredTransforms;

  /// The description found within the template.
  final String description;

  /// A list of <code>TemplateParameter</code> structures.
  final List<TemplateParameter> parameters;

  ValidateTemplateOutput({
    this.capabilities,
    this.capabilitiesReason,
    this.declaredTransforms,
    this.description,
    this.parameters,
  });
  factory ValidateTemplateOutput.fromXml(_s.XmlElement elem) {
    return ValidateTemplateOutput(
      capabilities: _s.extractXmlChild(elem, 'Capabilities')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toCapability())
          .toList()),
      capabilitiesReason: _s.extractXmlStringValue(elem, 'CapabilitiesReason'),
      declaredTransforms: _s
          .extractXmlChild(elem, 'DeclaredTransforms')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      description: _s.extractXmlStringValue(elem, 'Description'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('member')
          .map((c) => TemplateParameter.fromXml(c))
          .toList()),
    );
  }
}

enum Visibility {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('PRIVATE')
  private,
}

extension on Visibility {
  String toValue() {
    switch (this) {
      case Visibility.public:
        return 'PUBLIC';
      case Visibility.private:
        return 'PRIVATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Visibility toVisibility() {
    switch (this) {
      case 'PUBLIC':
        return Visibility.public;
      case 'PRIVATE':
        return Visibility.private;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class CFNRegistryException extends _s.GenericAwsException {
  CFNRegistryException({String type, String message})
      : super(type: type, code: 'CFNRegistryException', message: message);
}

class ChangeSetNotFoundException extends _s.GenericAwsException {
  ChangeSetNotFoundException({String type, String message})
      : super(type: type, code: 'ChangeSetNotFoundException', message: message);
}

class CreatedButModifiedException extends _s.GenericAwsException {
  CreatedButModifiedException({String type, String message})
      : super(
            type: type, code: 'CreatedButModifiedException', message: message);
}

class InsufficientCapabilitiesException extends _s.GenericAwsException {
  InsufficientCapabilitiesException({String type, String message})
      : super(
            type: type,
            code: 'InsufficientCapabilitiesException',
            message: message);
}

class InvalidChangeSetStatusException extends _s.GenericAwsException {
  InvalidChangeSetStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidChangeSetStatusException',
            message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NameAlreadyExistsException extends _s.GenericAwsException {
  NameAlreadyExistsException({String type, String message})
      : super(type: type, code: 'NameAlreadyExistsException', message: message);
}

class OperationIdAlreadyExistsException extends _s.GenericAwsException {
  OperationIdAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'OperationIdAlreadyExistsException',
            message: message);
}

class OperationInProgressException extends _s.GenericAwsException {
  OperationInProgressException({String type, String message})
      : super(
            type: type, code: 'OperationInProgressException', message: message);
}

class OperationNotFoundException extends _s.GenericAwsException {
  OperationNotFoundException({String type, String message})
      : super(type: type, code: 'OperationNotFoundException', message: message);
}

class OperationStatusCheckFailedException extends _s.GenericAwsException {
  OperationStatusCheckFailedException({String type, String message})
      : super(
            type: type,
            code: 'OperationStatusCheckFailedException',
            message: message);
}

class StackInstanceNotFoundException extends _s.GenericAwsException {
  StackInstanceNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'StackInstanceNotFoundException',
            message: message);
}

class StackSetNotEmptyException extends _s.GenericAwsException {
  StackSetNotEmptyException({String type, String message})
      : super(type: type, code: 'StackSetNotEmptyException', message: message);
}

class StackSetNotFoundException extends _s.GenericAwsException {
  StackSetNotFoundException({String type, String message})
      : super(type: type, code: 'StackSetNotFoundException', message: message);
}

class StaleRequestException extends _s.GenericAwsException {
  StaleRequestException({String type, String message})
      : super(type: type, code: 'StaleRequestException', message: message);
}

class TokenAlreadyExistsException extends _s.GenericAwsException {
  TokenAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'TokenAlreadyExistsException', message: message);
}

class TypeNotFoundException extends _s.GenericAwsException {
  TypeNotFoundException({String type, String message})
      : super(type: type, code: 'TypeNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'CFNRegistryException': (type, message) =>
      CFNRegistryException(type: type, message: message),
  'ChangeSetNotFoundException': (type, message) =>
      ChangeSetNotFoundException(type: type, message: message),
  'CreatedButModifiedException': (type, message) =>
      CreatedButModifiedException(type: type, message: message),
  'InsufficientCapabilitiesException': (type, message) =>
      InsufficientCapabilitiesException(type: type, message: message),
  'InvalidChangeSetStatusException': (type, message) =>
      InvalidChangeSetStatusException(type: type, message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'InvalidStateTransitionException': (type, message) =>
      InvalidStateTransitionException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NameAlreadyExistsException': (type, message) =>
      NameAlreadyExistsException(type: type, message: message),
  'OperationIdAlreadyExistsException': (type, message) =>
      OperationIdAlreadyExistsException(type: type, message: message),
  'OperationInProgressException': (type, message) =>
      OperationInProgressException(type: type, message: message),
  'OperationNotFoundException': (type, message) =>
      OperationNotFoundException(type: type, message: message),
  'OperationStatusCheckFailedException': (type, message) =>
      OperationStatusCheckFailedException(type: type, message: message),
  'StackInstanceNotFoundException': (type, message) =>
      StackInstanceNotFoundException(type: type, message: message),
  'StackSetNotEmptyException': (type, message) =>
      StackSetNotEmptyException(type: type, message: message),
  'StackSetNotFoundException': (type, message) =>
      StackSetNotFoundException(type: type, message: message),
  'StaleRequestException': (type, message) =>
      StaleRequestException(type: type, message: message),
  'TokenAlreadyExistsException': (type, message) =>
      TokenAlreadyExistsException(type: type, message: message),
  'TypeNotFoundException': (type, message) =>
      TypeNotFoundException(type: type, message: message),
};
