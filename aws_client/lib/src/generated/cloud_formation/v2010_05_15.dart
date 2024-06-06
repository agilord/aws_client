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

import 'v2010_05_15.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// CloudFormation allows you to create and manage Amazon Web Services
/// infrastructure deployments predictably and repeatedly. You can use
/// CloudFormation to leverage Amazon Web Services products, such as Amazon
/// Elastic Compute Cloud, Amazon Elastic Block Store, Amazon Simple
/// Notification Service, Elastic Load Balancing, and Auto Scaling to build
/// highly reliable, highly scalable, cost-effective applications without
/// creating or configuring the underlying Amazon Web Services infrastructure.
class CloudFormation {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  CloudFormation({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudformation',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Activate trusted access with Organizations. With trusted access between
  /// StackSets and Organizations activated, the management account has
  /// permissions to create and manage StackSets for your organization.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [OperationNotFoundException].
  Future<void> activateOrganizationsAccess() async {
    final $request = <String, dynamic>{};
    await _protocol.send(
      $request,
      action: 'ActivateOrganizationsAccess',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ActivateOrganizationsAccessInput'],
      shapes: shapes,
      resultWrapper: 'ActivateOrganizationsAccessResult',
    );
  }

  /// Activates a public third-party extension, making it available for use in
  /// stack templates. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html">Using
  /// public extensions</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Once you have activated a public third-party extension in your account and
  /// Region, use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html">SetTypeConfiguration</a>
  /// to specify configuration properties for the extension. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private.html#registry-set-configuration">Configuring
  /// extensions at the account level</a> in the <i>CloudFormation User
  /// Guide</i>.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [autoUpdate] :
  /// Whether to automatically update the extension in this account and Region
  /// when a new <i>minor</i> version is published by the extension publisher.
  /// Major versions released by the publisher must be manually updated.
  ///
  /// The default is <code>true</code>.
  ///
  /// Parameter [executionRoleArn] :
  /// The name of the IAM execution role to use to activate the extension.
  ///
  /// Parameter [loggingConfig] :
  /// Contains logging configuration information for an extension.
  ///
  /// Parameter [majorVersion] :
  /// The major version of this extension you want to activate, if multiple
  /// major versions are available. The default is the latest major version.
  /// CloudFormation uses the latest available <i>minor</i> version of the major
  /// version selected.
  ///
  /// You can specify <code>MajorVersion</code> or <code>VersionBump</code>, but
  /// not both.
  ///
  /// Parameter [publicTypeArn] :
  /// The Amazon Resource Name (ARN) of the public extension.
  ///
  /// Conditional: You must specify <code>PublicTypeArn</code>, or
  /// <code>TypeName</code>, <code>Type</code>, and <code>PublisherId</code>.
  ///
  /// Parameter [publisherId] :
  /// The ID of the extension publisher.
  ///
  /// Conditional: You must specify <code>PublicTypeArn</code>, or
  /// <code>TypeName</code>, <code>Type</code>, and <code>PublisherId</code>.
  ///
  /// Parameter [type] :
  /// The extension type.
  ///
  /// Conditional: You must specify <code>PublicTypeArn</code>, or
  /// <code>TypeName</code>, <code>Type</code>, and <code>PublisherId</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension.
  ///
  /// Conditional: You must specify <code>PublicTypeArn</code>, or
  /// <code>TypeName</code>, <code>Type</code>, and <code>PublisherId</code>.
  ///
  /// Parameter [typeNameAlias] :
  /// An alias to assign to the public extension, in this account and Region. If
  /// you specify an alias for the extension, CloudFormation treats the alias as
  /// the extension type name within this account and Region. You must use the
  /// alias to refer to the extension in your templates, API calls, and
  /// CloudFormation console.
  ///
  /// An extension alias must be unique within a given account and Region. You
  /// can activate the same public resource multiple times in the same account
  /// and Region, using different type name aliases.
  ///
  /// Parameter [versionBump] :
  /// Manually updates a previously-activated type to a new major or minor
  /// version, if available. You can also use this parameter to update the value
  /// of <code>AutoUpdate</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>MAJOR</code>: CloudFormation updates the extension to the newest
  /// major version, if one is available.
  /// </li>
  /// <li>
  /// <code>MINOR</code>: CloudFormation updates the extension to the newest
  /// minor version, if one is available.
  /// </li>
  /// </ul>
  Future<ActivateTypeOutput> activateType({
    bool? autoUpdate,
    String? executionRoleArn,
    LoggingConfig? loggingConfig,
    int? majorVersion,
    String? publicTypeArn,
    String? publisherId,
    ThirdPartyType? type,
    String? typeName,
    String? typeNameAlias,
    VersionBump? versionBump,
  }) async {
    _s.validateNumRange(
      'majorVersion',
      majorVersion,
      1,
      100000,
    );
    final $request = <String, dynamic>{};
    autoUpdate?.also((arg) => $request['AutoUpdate'] = arg);
    executionRoleArn?.also((arg) => $request['ExecutionRoleArn'] = arg);
    loggingConfig?.also((arg) => $request['LoggingConfig'] = arg);
    majorVersion?.also((arg) => $request['MajorVersion'] = arg);
    publicTypeArn?.also((arg) => $request['PublicTypeArn'] = arg);
    publisherId?.also((arg) => $request['PublisherId'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    typeNameAlias?.also((arg) => $request['TypeNameAlias'] = arg);
    versionBump?.also((arg) => $request['VersionBump'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ActivateType',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ActivateTypeInput'],
      shapes: shapes,
      resultWrapper: 'ActivateTypeResult',
    );
    return ActivateTypeOutput.fromXml($result);
  }

  /// Returns configuration data for the specified CloudFormation extensions,
  /// from the CloudFormation registry for the account and Region.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private.html#registry-set-configuration">Configuring
  /// extensions at the account level</a> in the <i>CloudFormation User
  /// Guide</i>.
  ///
  /// May throw [TypeConfigurationNotFoundException].
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [typeConfigurationIdentifiers] :
  /// The list of identifiers for the desired extension configurations.
  Future<BatchDescribeTypeConfigurationsOutput>
      batchDescribeTypeConfigurations({
    required List<TypeConfigurationIdentifier> typeConfigurationIdentifiers,
  }) async {
    final $request = <String, dynamic>{};
    $request['TypeConfigurationIdentifiers'] = typeConfigurationIdentifiers;
    final $result = await _protocol.send(
      $request,
      action: 'BatchDescribeTypeConfigurations',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchDescribeTypeConfigurationsInput'],
      shapes: shapes,
      resultWrapper: 'BatchDescribeTypeConfigurationsResult',
    );
    return BatchDescribeTypeConfigurationsOutput.fromXml($result);
  }

  /// Cancels an update on the specified stack. If the call completes
  /// successfully, the stack rolls back the update and reverts to the previous
  /// stack configuration.
  /// <note>
  /// You can cancel only stacks that are in the <code>UPDATE_IN_PROGRESS</code>
  /// state.
  /// </note>
  ///
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [stackName] :
  /// <note>
  /// If you don't pass a parameter to <code>StackName</code>, the API returns a
  /// response that describes all resources in the account.
  ///
  /// The IAM policy below can be added to IAM policies when you want to limit
  /// resource-level permissions and avoid returning a response when no
  /// parameter is sent in the request:
  ///
  /// <code>{ "Version": "2012-10-17", "Statement": [{ "Effect": "Deny",
  /// "Action": "cloudformation:DescribeStacks", "NotResource":
  /// "arn:aws:cloudformation:*:*:stack/*/*" }] }</code>
  /// </note>
  /// The name or the unique stack ID that's associated with the stack.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>CancelUpdateStack</code> request.
  /// Specify this token if you plan to retry requests so that CloudFormation
  /// knows that you're not attempting to cancel an update on a stack with the
  /// same name. You might retry <code>CancelUpdateStack</code> requests to
  /// ensure that CloudFormation successfully received them.
  Future<void> cancelUpdateStack({
    required String stackName,
    String? clientRequestToken,
  }) async {
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

  /// For a specified stack that's in the <code>UPDATE_ROLLBACK_FAILED</code>
  /// state, continues rolling it back to the
  /// <code>UPDATE_ROLLBACK_COMPLETE</code> state. Depending on the cause of the
  /// failure, you can manually <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed">
  /// fix the error</a> and continue the rollback. By continuing the rollback,
  /// you can return your stack to a working state (the
  /// <code>UPDATE_ROLLBACK_COMPLETE</code> state), and then try to update the
  /// stack again.
  ///
  /// A stack goes into the <code>UPDATE_ROLLBACK_FAILED</code> state when
  /// CloudFormation can't roll back all changes after a failed stack update.
  /// For example, you might have a stack that's rolling back to an old database
  /// instance that was deleted outside of CloudFormation. Because
  /// CloudFormation doesn't know the database was deleted, it assumes that the
  /// database instance still exists and attempts to roll back to it, causing
  /// the update rollback to fail.
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
  /// Specify this token if you plan to retry requests so that CloudFormation
  /// knows that you're not attempting to continue the rollback to a stack with
  /// the same name. You might retry <code>ContinueUpdateRollback</code>
  /// requests to ensure that CloudFormation successfully received them.
  ///
  /// Parameter [resourcesToSkip] :
  /// A list of the logical IDs of the resources that CloudFormation skips
  /// during the continue update rollback operation. You can specify only
  /// resources that are in the <code>UPDATE_FAILED</code> state because a
  /// rollback failed. You can't specify resources that are in the
  /// <code>UPDATE_FAILED</code> state for other reasons, for example, because
  /// an update was canceled. To check why a resource update failed, use the
  /// <a>DescribeStackResources</a> action, and view the resource status reason.
  /// <important>
  /// Specify this property to skip rolling back resources that CloudFormation
  /// can't successfully roll back. We recommend that you <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed">
  /// troubleshoot</a> resources before skipping them. CloudFormation sets the
  /// status of the specified resources to <code>UPDATE_COMPLETE</code> and
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
  /// The Amazon Resource Name (ARN) of an Identity and Access Management (IAM)
  /// role that CloudFormation assumes to roll back the stack. CloudFormation
  /// uses the role's credentials to make calls on your behalf. CloudFormation
  /// always uses this role for all future operations on the stack. Provided
  /// that users have permission to operate on the stack, CloudFormation uses
  /// this role even if the users don't have permission to pass it. Ensure that
  /// the role grants least permission.
  ///
  /// If you don't specify a value, CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available,
  /// CloudFormation uses a temporary session that's generated from your user
  /// credentials.
  Future<void> continueUpdateRollback({
    required String stackName,
    String? clientRequestToken,
    List<String>? resourcesToSkip,
    String? roleARN,
  }) async {
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
  /// resources that CloudFormation will create. If you create a change set for
  /// an existing stack, CloudFormation compares the stack's information with
  /// the information that you submit in the change set and lists the
  /// differences. Use change sets to understand which resources CloudFormation
  /// will create or change, and how it will change resources in an existing
  /// stack, before you create or update a stack.
  ///
  /// To create a change set for a stack that doesn't exist, for the
  /// <code>ChangeSetType</code> parameter, specify <code>CREATE</code>. To
  /// create a change set for an existing stack, specify <code>UPDATE</code> for
  /// the <code>ChangeSetType</code> parameter. To create a change set for an
  /// import operation, specify <code>IMPORT</code> for the
  /// <code>ChangeSetType</code> parameter. After the
  /// <code>CreateChangeSet</code> call successfully completes, CloudFormation
  /// starts creating the change set. To check the status of the change set or
  /// to review it, use the <a>DescribeChangeSet</a> action.
  ///
  /// When you are satisfied with the changes the change set will make, execute
  /// the change set by using the <a>ExecuteChangeSet</a> action. CloudFormation
  /// doesn't make changes until you execute the change set.
  ///
  /// To create a change set for the entire stack hierarchy, set
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
  /// A change set name can contain only alphanumeric, case sensitive
  /// characters, and hyphens. It must start with an alphabetical character and
  /// can't exceed 128 characters.
  ///
  /// Parameter [stackName] :
  /// The name or the unique ID of the stack for which you are creating a change
  /// set. CloudFormation generates the change set by comparing this stack's
  /// information with the information that you submit, such as a modified
  /// template or different parameter input values.
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack template
  /// contains certain capabilities in order for CloudFormation to create the
  /// stack.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your Amazon Web Services account; for example, by creating new Identity
  /// and Access Management (IAM) users. For those stacks, you must explicitly
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
  /// If you don't specify either of these capabilities, CloudFormation returns
  /// an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we suggest that you
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM resources in CloudFormation templates</a>.
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by CloudFormation.
  /// <note>
  /// This capacity doesn't apply to creating change sets, and specifying it
  /// when creating change sets has no effect.
  ///
  /// If you want to create a stack from a stack template that contains macros
  /// <i>and</i> nested stacks, you must create or update the stack directly
  /// from the template using the <a>CreateStack</a> or <a>UpdateStack</a>
  /// action, and specifying this capability.
  /// </note>
  /// For more information about macros, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// CloudFormation macros to perform custom processing on templates</a>.
  /// </li>
  /// </ul> <note>
  /// Only one of the <code>Capabilities</code> and <code>ResourceType</code>
  /// parameters can be specified.
  /// </note>
  ///
  /// Parameter [changeSetType] :
  /// The type of change set operation. To create a change set for a new stack,
  /// specify <code>CREATE</code>. To create a change set for an existing stack,
  /// specify <code>UPDATE</code>. To create a change set for an import
  /// operation, specify <code>IMPORT</code>.
  ///
  /// If you create a change set for a new stack, CloudFormation creates a stack
  /// with a unique stack ID, but no template or resources. The stack will be in
  /// the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-describing-stacks.html#d0e11995">REVIEW_IN_PROGRESS</a>
  /// state until you execute the change set.
  ///
  /// By default, CloudFormation specifies <code>UPDATE</code>. You can't use
  /// the <code>UPDATE</code> type to create a change set for a new stack or the
  /// <code>CREATE</code> type to create a change set for an existing stack.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this <code>CreateChangeSet</code> request. Specify
  /// this token if you plan to retry requests so that CloudFormation knows that
  /// you're not attempting to create another change set with the same name. You
  /// might retry <code>CreateChangeSet</code> requests to ensure that
  /// CloudFormation successfully received them.
  ///
  /// Parameter [description] :
  /// A description to help you identify this change set.
  ///
  /// Parameter [importExistingResources] :
  /// Indicates if the change set imports resources that already exist.
  /// <note>
  /// This parameter can only import resources that have custom names in
  /// templates. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-name.html">name
  /// type</a> in the <i>CloudFormation User Guide</i>. To import resources that
  /// do not accept custom names, such as EC2 instances, use the resource import
  /// feature instead. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import.html">Bringing
  /// existing resources into CloudFormation management</a> in the
  /// <i>CloudFormation User Guide</i>.
  /// </note>
  ///
  /// Parameter [includeNestedStacks] :
  /// Creates a change set for the all nested stacks specified in the template.
  /// The default behavior of this action is set to <code>False</code>. To
  /// include nested sets in a change set, specify <code>True</code>.
  ///
  /// Parameter [notificationARNs] :
  /// The Amazon Resource Names (ARNs) of Amazon Simple Notification Service
  /// (Amazon SNS) topics that CloudFormation associates with the stack. To
  /// remove all associated notification topics, specify an empty list.
  ///
  /// Parameter [onStackFailure] :
  /// Determines what action will be taken if stack creation fails. If this
  /// parameter is specified, the <code>DisableRollback</code> parameter to the
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html">ExecuteChangeSet</a>
  /// API operation must not be specified. This must be one of these values:
  ///
  /// <ul>
  /// <li>
  /// <code>DELETE</code> - Deletes the change set if the stack creation fails.
  /// This is only valid when the <code>ChangeSetType</code> parameter is set to
  /// <code>CREATE</code>. If the deletion of the stack fails, the status of the
  /// stack is <code>DELETE_FAILED</code>.
  /// </li>
  /// <li>
  /// <code>DO_NOTHING</code> - if the stack creation fails, do nothing. This is
  /// equivalent to specifying <code>true</code> for the
  /// <code>DisableRollback</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html">ExecuteChangeSet</a>
  /// API operation.
  /// </li>
  /// <li>
  /// <code>ROLLBACK</code> - if the stack creation fails, roll back the stack.
  /// This is equivalent to specifying <code>false</code> for the
  /// <code>DisableRollback</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html">ExecuteChangeSet</a>
  /// API operation.
  /// </li>
  /// </ul>
  /// For nested stacks, when the <code>OnStackFailure</code> parameter is set
  /// to <code>DELETE</code> for the change set for the parent stack, any
  /// failure in a child stack will cause the parent stack creation to fail and
  /// all stacks to be deleted.
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
  /// updating, the stack update fails. By default, CloudFormation grants
  /// permissions to all resource types. Identity and Access Management (IAM)
  /// uses this parameter for condition keys in IAM policies for CloudFormation.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling
  /// access with Identity and Access Management</a> in the <i>CloudFormation
  /// User Guide</i>.
  /// <note>
  /// Only one of the <code>Capabilities</code> and <code>ResourceType</code>
  /// parameters can be specified.
  /// </note>
  ///
  /// Parameter [resourcesToImport] :
  /// The resources to import into your stack.
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an Identity and Access Management (IAM)
  /// role that CloudFormation assumes when executing the change set.
  /// CloudFormation uses the role's credentials to make calls on your behalf.
  /// CloudFormation uses this role for all future operations on the stack.
  /// Provided that users have permission to operate on the stack,
  /// CloudFormation uses this role even if the users don't have permission to
  /// pass it. Ensure that the role grants least permission.
  ///
  /// If you don't specify a value, CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available,
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// Parameter [rollbackConfiguration] :
  /// The rollback triggers for CloudFormation to monitor during stack creation
  /// and updating operations, and for the specified monitoring period
  /// afterwards.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with this stack. CloudFormation also
  /// propagates these tags to resources in the stack. You can specify a maximum
  /// of 50 tags.
  ///
  /// Parameter [templateBody] :
  /// A structure that contains the body of the revised template, with a minimum
  /// length of 1 byte and a maximum length of 51,200 bytes. CloudFormation
  /// generates the change set by comparing this template with the template of
  /// the stack that you specified.
  ///
  /// Conditional: You must specify only <code>TemplateBody</code> or
  /// <code>TemplateURL</code>.
  ///
  /// Parameter [templateURL] :
  /// The location of the file that contains the revised template. The URL must
  /// point to a template (max size: 460,800 bytes) that's located in an Amazon
  /// S3 bucket or a Systems Manager document. CloudFormation generates the
  /// change set by comparing this template with the stack that you specified.
  /// The location for an Amazon S3 bucket must start with
  /// <code>https://</code>.
  ///
  /// Conditional: You must specify only <code>TemplateBody</code> or
  /// <code>TemplateURL</code>.
  ///
  /// Parameter [usePreviousTemplate] :
  /// Whether to reuse the template that's associated with the stack to create
  /// the change set.
  Future<CreateChangeSetOutput> createChangeSet({
    required String changeSetName,
    required String stackName,
    List<Capability>? capabilities,
    ChangeSetType? changeSetType,
    String? clientToken,
    String? description,
    bool? importExistingResources,
    bool? includeNestedStacks,
    List<String>? notificationARNs,
    OnStackFailure? onStackFailure,
    List<Parameter>? parameters,
    List<String>? resourceTypes,
    List<ResourceToImport>? resourcesToImport,
    String? roleARN,
    RollbackConfiguration? rollbackConfiguration,
    List<Tag>? tags,
    String? templateBody,
    String? templateURL,
    bool? usePreviousTemplate,
  }) async {
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    $request['StackName'] = stackName;
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e.toValue()).toList());
    changeSetType?.also((arg) => $request['ChangeSetType'] = arg.toValue());
    clientToken?.also((arg) => $request['ClientToken'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    importExistingResources
        ?.also((arg) => $request['ImportExistingResources'] = arg);
    includeNestedStacks?.also((arg) => $request['IncludeNestedStacks'] = arg);
    notificationARNs?.also((arg) => $request['NotificationARNs'] = arg);
    onStackFailure?.also((arg) => $request['OnStackFailure'] = arg.toValue());
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

  /// Creates a template from existing resources that are not already managed
  /// with CloudFormation. You can check the status of the template generation
  /// using the <code>DescribeGeneratedTemplate</code> API action.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentResourcesLimitExceededException].
  ///
  /// Parameter [generatedTemplateName] :
  /// The name assigned to the generated template.
  ///
  /// Parameter [resources] :
  /// An optional list of resources to be included in the generated template.
  ///
  /// If no resources are specified,the template will be created without any
  /// resources. Resources can be added to the template using the
  /// <code>UpdateGeneratedTemplate</code> API action.
  ///
  /// Parameter [stackName] :
  /// An optional name or ARN of a stack to use as the base stack for the
  /// generated template.
  ///
  /// Parameter [templateConfiguration] :
  /// The configuration details of the generated template, including the
  /// <code>DeletionPolicy</code> and <code>UpdateReplacePolicy</code>.
  Future<CreateGeneratedTemplateOutput> createGeneratedTemplate({
    required String generatedTemplateName,
    List<ResourceDefinition>? resources,
    String? stackName,
    TemplateConfiguration? templateConfiguration,
  }) async {
    final $request = <String, dynamic>{};
    $request['GeneratedTemplateName'] = generatedTemplateName;
    resources?.also((arg) => $request['Resources'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    templateConfiguration
        ?.also((arg) => $request['TemplateConfiguration'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateGeneratedTemplate',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateGeneratedTemplateInput'],
      shapes: shapes,
      resultWrapper: 'CreateGeneratedTemplateResult',
    );
    return CreateGeneratedTemplateOutput.fromXml($result);
  }

  /// Creates a stack as specified in the template. After the call completes
  /// successfully, the stack creation starts. You can check the status of the
  /// stack through the <a>DescribeStacks</a> operation.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  /// May throw [TokenAlreadyExistsException].
  /// May throw [InsufficientCapabilitiesException].
  ///
  /// Parameter [stackName] :
  /// The name that's associated with the stack. The name must be unique in the
  /// Region in which you are creating the stack.
  /// <note>
  /// A stack name can contain only alphanumeric characters (case sensitive) and
  /// hyphens. It must start with an alphabetical character and can't be longer
  /// than 128 characters.
  /// </note>
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack template
  /// contains certain capabilities in order for CloudFormation to create the
  /// stack.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your Amazon Web Services account; for example, by creating new Identity
  /// and Access Management (IAM) users. For those stacks, you must explicitly
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
  /// If you don't specify either of these capabilities, CloudFormation returns
  /// an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in CloudFormation Templates</a>.
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by CloudFormation.
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
  /// function operation without CloudFormation being notified.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// CloudFormation macros to perform custom processing on templates</a>.
  /// </li>
  /// </ul> <note>
  /// Only one of the <code>Capabilities</code> and <code>ResourceType</code>
  /// parameters can be specified.
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>CreateStack</code> request. Specify
  /// this token if you plan to retry requests so that CloudFormation knows that
  /// you're not attempting to create a stack with the same name. You might
  /// retry <code>CreateStack</code> requests to ensure that CloudFormation
  /// successfully received them.
  ///
  /// All events initiated by a given stack operation are assigned the same
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting
  /// a Stack From Being Deleted</a> in the <i>CloudFormation User Guide</i>.
  /// Termination protection is deactivated on stacks by default.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested
  /// stacks</a>, termination protection is set on the root stack and can't be
  /// changed directly on the nested stack.
  ///
  /// Parameter [notificationARNs] :
  /// The Amazon Simple Notification Service (Amazon SNS) topic ARNs to publish
  /// stack related events. You can find your Amazon SNS topic ARNs using the
  /// Amazon SNS console or your Command Line Interface (CLI).
  ///
  /// Parameter [onFailure] :
  /// Determines what action will be taken if stack creation fails. This must be
  /// one of: <code>DO_NOTHING</code>, <code>ROLLBACK</code>, or
  /// <code>DELETE</code>. You can specify either <code>OnFailure</code> or
  /// <code>DisableRollback</code>, but not both.
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
  /// <code>AWS::*</code> (for all Amazon Web Services resources),
  /// <code>Custom::*</code> (for all custom resources),
  /// <code>Custom::<i>logical_ID</i> </code> (for a specific custom resource),
  /// <code>AWS::<i>service_name</i>::*</code> (for all resources of a
  /// particular Amazon Web Services service), and
  /// <code>AWS::<i>service_name</i>::<i>resource_logical_ID</i> </code> (for a
  /// specific Amazon Web Services resource).
  ///
  /// If the list of resource types doesn't include a resource that you're
  /// creating, the stack creation fails. By default, CloudFormation grants
  /// permissions to all resource types. Identity and Access Management (IAM)
  /// uses this parameter for CloudFormation-specific condition keys in IAM
  /// policies. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling
  /// Access with Identity and Access Management</a>.
  /// <note>
  /// Only one of the <code>Capabilities</code> and <code>ResourceType</code>
  /// parameters can be specified.
  /// </note>
  ///
  /// Parameter [retainExceptOnCreate] :
  /// When set to <code>true</code>, newly created resources are deleted when
  /// the operation rolls back. This includes newly created resources marked
  /// with a deletion policy of <code>Retain</code>.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an Identity and Access Management (IAM)
  /// role that CloudFormation assumes to create the stack. CloudFormation uses
  /// the role's credentials to make calls on your behalf. CloudFormation always
  /// uses this role for all future operations on the stack. Provided that users
  /// have permission to operate on the stack, CloudFormation uses this role
  /// even if the users don't have permission to pass it. Ensure that the role
  /// grants least privilege.
  ///
  /// If you don't specify a value, CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available,
  /// CloudFormation uses a temporary session that's generated from your user
  /// credentials.
  ///
  /// Parameter [rollbackConfiguration] :
  /// The rollback triggers for CloudFormation to monitor during stack creation
  /// and updating operations, and for the specified monitoring period
  /// afterwards.
  ///
  /// Parameter [stackPolicyBody] :
  /// Structure containing the stack policy body. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html">
  /// Prevent Updates to Stack Resources</a> in the <i>CloudFormation User
  /// Guide</i>. You can specify either the <code>StackPolicyBody</code> or the
  /// <code>StackPolicyURL</code> parameter, but not both.
  ///
  /// Parameter [stackPolicyURL] :
  /// Location of a file containing the stack policy. The URL must point to a
  /// policy (maximum size: 16 KB) located in an S3 bucket in the same Region as
  /// the stack. The location for an Amazon S3 bucket must start with
  /// <code>https://</code>. You can specify either the
  /// <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter,
  /// but not both.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with this stack. CloudFormation also
  /// propagates these tags to the resources created in the stack. A maximum
  /// number of 50 tags can be specified.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// anatomy</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Conditional: You must specify either the <code>TemplateBody</code> or the
  /// <code>TemplateURL</code> parameter, but not both.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template (max size: 460,800 bytes) that's located in an Amazon S3 bucket
  /// or a Systems Manager document. For more information, go to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// anatomy</a> in the <i>CloudFormation User Guide</i>. The location for an
  /// Amazon S3 bucket must start with <code>https://</code>.
  ///
  /// Conditional: You must specify either the <code>TemplateBody</code> or the
  /// <code>TemplateURL</code> parameter, but not both.
  ///
  /// Parameter [timeoutInMinutes] :
  /// The amount of time that can pass before the stack status becomes
  /// <code>CREATE_FAILED</code>; if <code>DisableRollback</code> is not set or
  /// is set to <code>false</code>, the stack will be rolled back.
  Future<CreateStackOutput> createStack({
    required String stackName,
    List<Capability>? capabilities,
    String? clientRequestToken,
    bool? disableRollback,
    bool? enableTerminationProtection,
    List<String>? notificationARNs,
    OnFailure? onFailure,
    List<Parameter>? parameters,
    List<String>? resourceTypes,
    bool? retainExceptOnCreate,
    String? roleARN,
    RollbackConfiguration? rollbackConfiguration,
    String? stackPolicyBody,
    String? stackPolicyURL,
    List<Tag>? tags,
    String? templateBody,
    String? templateURL,
    int? timeoutInMinutes,
  }) async {
    _s.validateNumRange(
      'timeoutInMinutes',
      timeoutInMinutes,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e.toValue()).toList());
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    disableRollback?.also((arg) => $request['DisableRollback'] = arg);
    enableTerminationProtection
        ?.also((arg) => $request['EnableTerminationProtection'] = arg);
    notificationARNs?.also((arg) => $request['NotificationARNs'] = arg);
    onFailure?.also((arg) => $request['OnFailure'] = arg.toValue());
    parameters?.also((arg) => $request['Parameters'] = arg);
    resourceTypes?.also((arg) => $request['ResourceTypes'] = arg);
    retainExceptOnCreate?.also((arg) => $request['RetainExceptOnCreate'] = arg);
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
  /// Amazon Web Services Regions. A stack instance refers to a stack in a
  /// specific account and Region. You must specify at least one value for
  /// either <code>Accounts</code> or <code>DeploymentTargets</code>, and you
  /// must specify at least one value for <code>Regions</code>.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationInProgressException].
  /// May throw [OperationIdAlreadyExistsException].
  /// May throw [StaleRequestException].
  /// May throw [InvalidOperationException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [regions] :
  /// The names of one or more Amazon Web Services Regions where you want to
  /// create stack instances using the specified Amazon Web Services accounts.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to create stack
  /// instances from.
  ///
  /// Parameter [accounts] :
  /// [Self-managed permissions] The names of one or more Amazon Web Services
  /// accounts that you want to create stack instances in the specified
  /// Region(s) for.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deploymentTargets] :
  /// [Service-managed permissions] The Organizations accounts for which to
  /// create stack instances in the specified Amazon Web Services Regions.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [operationId] :
  /// The unique identifier for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is <code>OUTDATED</code>.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how CloudFormation performs this stack set operation.
  ///
  /// Parameter [parameterOverrides] :
  /// A list of stack set parameters whose values you want to override in the
  /// selected stack instances.
  ///
  /// Any overridden parameter values will be applied to all stack instances in
  /// the specified accounts and Amazon Web Services Regions. When specifying
  /// parameters and their values, be aware of how CloudFormation sets parameter
  /// values during stack instance operations:
  ///
  /// <ul>
  /// <li>
  /// To override the current value for a parameter, include the parameter and
  /// specify its value.
  /// </li>
  /// <li>
  /// To leave an overridden parameter set to its present value, include the
  /// parameter and specify <code>UsePreviousValue</code> as <code>true</code>.
  /// (You can't specify both a value and set <code>UsePreviousValue</code> to
  /// <code>true</code>.)
  /// </li>
  /// <li>
  /// To set an overridden parameter back to the value specified in the stack
  /// set, specify a parameter list but don't include the parameter in the list.
  /// </li>
  /// <li>
  /// To leave all parameters set to their present values, don't specify this
  /// property at all.
  /// </li>
  /// </ul>
  /// During stack set updates, any parameter values overridden for a stack
  /// instance aren't updated, but retain their overridden value.
  ///
  /// You can only override the parameter <i>values</i> that are specified in
  /// the stack set; to add or delete a parameter itself, use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a>
  /// to update the stack set template.
  Future<CreateStackInstancesOutput> createStackInstances({
    required List<String> regions,
    required String stackSetName,
    List<String>? accounts,
    CallAs? callAs,
    DeploymentTargets? deploymentTargets,
    String? operationId,
    StackSetOperationPreferences? operationPreferences,
    List<Parameter>? parameterOverrides,
  }) async {
    final $request = <String, dynamic>{};
    $request['Regions'] = regions;
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
  /// The Amazon Resource Name (ARN) of the IAM role to use to create this stack
  /// set.
  ///
  /// Specify an IAM role only if you are using customized administrator roles
  /// to control which users or groups can manage specific stack sets within the
  /// same administrator account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Prerequisites:
  /// Granting Permissions for Stack Set Operations</a> in the <i>CloudFormation
  /// User Guide</i>.
  ///
  /// Parameter [autoDeployment] :
  /// Describes whether StackSets automatically deploys to Organizations
  /// accounts that are added to the target organization or organizational unit
  /// (OU). Specify only if <code>PermissionModel</code> is
  /// <code>SERVICE_MANAGED</code>.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// To create a stack set with service-managed permissions while signed in to
  /// the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// To create a stack set with service-managed permissions while signed in to
  /// a delegated administrator account, specify <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated admin
  /// in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  /// Stack sets with service-managed permissions are created in the management
  /// account, including stack sets that are created by delegated
  /// administrators.
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack set
  /// template contains certain capabilities in order for CloudFormation to
  /// create the stack set and related stack instances.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your Amazon Web Services account; for example, by creating new Identity
  /// and Access Management (IAM) users. For those stack sets, you must
  /// explicitly acknowledge this by specifying one of these capabilities.
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
  /// If you don't specify either of these capabilities, CloudFormation returns
  /// an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in CloudFormation Templates</a>.
  /// </li>
  /// <li>
  /// <code>CAPABILITY_AUTO_EXPAND</code>
  ///
  /// Some templates reference macros. If your stack set template references one
  /// or more macros, you must create the stack set directly from the processed
  /// template, without first reviewing the resulting changes in a change set.
  /// To create the stack set directly, you must acknowledge this capability.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// <important>
  /// Stack sets with service-managed permissions don't currently support the
  /// use of macros in templates. (This includes the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by CloudFormation.) Even if you
  /// specify this capability for a stack set with service-managed permissions,
  /// if you reference a macro in your template the stack set operation will
  /// fail.
  /// </important> </li>
  /// </ul>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>CreateStackSet</code> request. Specify
  /// this token if you plan to retry requests so that CloudFormation knows that
  /// you're not attempting to create another stack set with the same name. You
  /// might retry <code>CreateStackSet</code> requests to ensure that
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
  /// do not specify an execution role, CloudFormation uses the
  /// <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set
  /// operation.
  ///
  /// Specify an IAM role only if you are using customized execution roles to
  /// control which stack resources users and groups can include in their stack
  /// sets.
  ///
  /// Parameter [managedExecution] :
  /// Describes whether StackSets performs non-conflicting operations
  /// concurrently and queues conflicting operations.
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
  /// creates the IAM roles required to deploy to accounts managed by
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [stackId] :
  /// The stack ID you are importing into a new stack set. Specify the Amazon
  /// Resource Name (ARN) of the stack.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with this stack set and the stacks
  /// created from it. CloudFormation also propagates these tags to supported
  /// resources that are created in the stacks. A maximum number of 50 tags can
  /// be specified.
  ///
  /// If you specify tags as part of a <code>CreateStackSet</code> action,
  /// CloudFormation checks to see if you have the required IAM permission to
  /// tag resources. If you don't, the entire <code>CreateStackSet</code> action
  /// fails with an <code>access denied</code> error, and the stack set is not
  /// created.
  ///
  /// Parameter [templateBody] :
  /// The structure that contains the template body, with a minimum length of 1
  /// byte and a maximum length of 51,200 bytes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Conditional: You must specify either the TemplateBody or the TemplateURL
  /// parameter, but not both.
  ///
  /// Parameter [templateURL] :
  /// The location of the file that contains the template body. The URL must
  /// point to a template (maximum size: 460,800 bytes) that's located in an
  /// Amazon S3 bucket or a Systems Manager document. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Conditional: You must specify either the TemplateBody or the TemplateURL
  /// parameter, but not both.
  Future<CreateStackSetOutput> createStackSet({
    required String stackSetName,
    String? administrationRoleARN,
    AutoDeployment? autoDeployment,
    CallAs? callAs,
    List<Capability>? capabilities,
    String? clientRequestToken,
    String? description,
    String? executionRoleName,
    ManagedExecution? managedExecution,
    List<Parameter>? parameters,
    PermissionModels? permissionModel,
    String? stackId,
    List<Tag>? tags,
    String? templateBody,
    String? templateURL,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    administrationRoleARN
        ?.also((arg) => $request['AdministrationRoleARN'] = arg);
    autoDeployment?.also((arg) => $request['AutoDeployment'] = arg);
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e.toValue()).toList());
    $request['ClientRequestToken'] =
        clientRequestToken ?? _s.generateIdempotencyToken();
    description?.also((arg) => $request['Description'] = arg);
    executionRoleName?.also((arg) => $request['ExecutionRoleName'] = arg);
    managedExecution?.also((arg) => $request['ManagedExecution'] = arg);
    parameters?.also((arg) => $request['Parameters'] = arg);
    permissionModel?.also((arg) => $request['PermissionModel'] = arg.toValue());
    stackId?.also((arg) => $request['StackId'] = arg);
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

  /// Deactivates trusted access with Organizations. If trusted access is
  /// deactivated, the management account does not have permissions to create
  /// and manage service-managed StackSets for your organization.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [OperationNotFoundException].
  Future<void> deactivateOrganizationsAccess() async {
    final $request = <String, dynamic>{};
    await _protocol.send(
      $request,
      action: 'DeactivateOrganizationsAccess',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeactivateOrganizationsAccessInput'],
      shapes: shapes,
      resultWrapper: 'DeactivateOrganizationsAccessResult',
    );
  }

  /// Deactivates a public extension that was previously activated in this
  /// account and Region.
  ///
  /// Once deactivated, an extension can't be used in any CloudFormation
  /// operation. This includes stack update operations where the stack template
  /// includes the extension, even if no updates are being made to the
  /// extension. In addition, deactivated extensions aren't automatically
  /// updated if a new version of the extension is released.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) for the extension, in this account and
  /// Region.
  ///
  /// Conditional: You must specify either <code>Arn</code>, or
  /// <code>TypeName</code> and <code>Type</code>.
  ///
  /// Parameter [type] :
  /// The extension type.
  ///
  /// Conditional: You must specify either <code>Arn</code>, or
  /// <code>TypeName</code> and <code>Type</code>.
  ///
  /// Parameter [typeName] :
  /// The type name of the extension, in this account and Region. If you
  /// specified a type name alias when enabling the extension, use the type name
  /// alias.
  ///
  /// Conditional: You must specify either <code>Arn</code>, or
  /// <code>TypeName</code> and <code>Type</code>.
  Future<void> deactivateType({
    String? arn,
    ThirdPartyType? type,
    String? typeName,
  }) async {
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    await _protocol.send(
      $request,
      action: 'DeactivateType',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeactivateTypeInput'],
      shapes: shapes,
      resultWrapper: 'DeactivateTypeResult',
    );
  }

  /// Deletes the specified change set. Deleting change sets ensures that no one
  /// executes the wrong change set.
  ///
  /// If the call successfully completes, CloudFormation successfully deleted
  /// the change set.
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
  /// name or Amazon Resource Name (ARN) that's associated with it.
  Future<void> deleteChangeSet({
    required String changeSetName,
    String? stackName,
  }) async {
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

  /// Deleted a generated template.
  ///
  /// May throw [GeneratedTemplateNotFoundException].
  /// May throw [ConcurrentResourcesLimitExceededException].
  ///
  /// Parameter [generatedTemplateName] :
  /// The name or Amazon Resource Name (ARN) of a generated template.
  Future<void> deleteGeneratedTemplate({
    required String generatedTemplateName,
  }) async {
    final $request = <String, dynamic>{};
    $request['GeneratedTemplateName'] = generatedTemplateName;
    await _protocol.send(
      $request,
      action: 'DeleteGeneratedTemplate',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteGeneratedTemplateInput'],
      shapes: shapes,
    );
  }

  /// Deletes a specified stack. Once the call completes successfully, stack
  /// deletion starts. Deleted stacks don't show up in the <a>DescribeStacks</a>
  /// operation if the deletion has been completed successfully.
  ///
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that's associated with the stack.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>DeleteStack</code> request. Specify
  /// this token if you plan to retry requests so that CloudFormation knows that
  /// you're not attempting to delete a stack with the same name. You might
  /// retry <code>DeleteStack</code> requests to ensure that CloudFormation
  /// successfully received them.
  ///
  /// All events initiated by a given stack operation are assigned the same
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
  /// Parameter [deletionMode] :
  /// Specifies the deletion mode for the stack. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>STANDARD</code> - Use the standard behavior. Specifying this value
  /// is the same as not specifying this parameter.
  /// </li>
  /// <li>
  /// <code>FORCE_DELETE_STACK</code> - Delete the stack if it's stuck in a
  /// <code>DELETE_FAILED</code> state due to resource deletion failure.
  /// </li>
  /// </ul>
  ///
  /// Parameter [retainResources] :
  /// For stacks in the <code>DELETE_FAILED</code> state, a list of resource
  /// logical IDs that are associated with the resources you want to retain.
  /// During deletion, CloudFormation deletes the stack but doesn't delete the
  /// retained resources.
  ///
  /// Retaining resources is useful when you can't delete a resource, such as a
  /// non-empty S3 bucket, but you want to delete the stack.
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an Identity and Access Management (IAM)
  /// role that CloudFormation assumes to delete the stack. CloudFormation uses
  /// the role's credentials to make calls on your behalf.
  ///
  /// If you don't specify a value, CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available,
  /// CloudFormation uses a temporary session that's generated from your user
  /// credentials.
  Future<void> deleteStack({
    required String stackName,
    String? clientRequestToken,
    DeletionMode? deletionMode,
    List<String>? retainResources,
    String? roleARN,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    deletionMode?.also((arg) => $request['DeletionMode'] = arg.toValue());
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
  /// Amazon Web Services Regions.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationInProgressException].
  /// May throw [OperationIdAlreadyExistsException].
  /// May throw [StaleRequestException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [regions] :
  /// The Amazon Web Services Regions where you want to delete stack set
  /// instances.
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
  /// [Self-managed permissions] The names of the Amazon Web Services accounts
  /// that you want to delete stack instances for.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deploymentTargets] :
  /// [Service-managed permissions] The Organizations accounts from which to
  /// delete stack instances.
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
  /// CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You can retry stack set operation
  /// requests to ensure that CloudFormation successfully received them.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is <code>OUTDATED</code>.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how CloudFormation performs this stack set operation.
  Future<DeleteStackInstancesOutput> deleteStackInstances({
    required List<String> regions,
    required bool retainStacks,
    required String stackSetName,
    List<String>? accounts,
    CallAs? callAs,
    DeploymentTargets? deploymentTargets,
    String? operationId,
    StackSetOperationPreferences? operationPreferences,
  }) async {
    final $request = <String, dynamic>{};
    $request['Regions'] = regions;
    $request['RetainStacks'] = retainStacks;
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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

  /// Deletes a stack set. Before you can delete a stack set, all its member
  /// stack instances must be deleted. For more information about how to
  /// complete this, see <a>DeleteStackInstances</a>.
  ///
  /// May throw [StackSetNotEmptyException].
  /// May throw [OperationInProgressException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you're deleting. You can
  /// obtain this value by running <a>ListStackSets</a>.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  Future<void> deleteStackSet({
    required String stackSetName,
    CallAs? callAs,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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

  /// Marks an extension or extension version as <code>DEPRECATED</code> in the
  /// CloudFormation registry, removing it from active use. Deprecated
  /// extensions or extension versions cannot be used in CloudFormation
  /// operations.
  ///
  /// To deregister an entire extension, you must individually deregister all
  /// active versions of that extension. If an extension has only a single
  /// active version, deregistering that version results in the extension itself
  /// being deregistered and marked as deprecated in the registry.
  ///
  /// You can't deregister the default version of an extension if there are
  /// other active version of that extension. If you do deregister the default
  /// version of an extension, the extension type itself is deregistered as well
  /// and marked as deprecated.
  ///
  /// To view the deprecation status of an extension or extension version, use
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html">DescribeType</a>.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [type] :
  /// The kind of extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [versionId] :
  /// The ID of a specific version of the extension. The version ID is the value
  /// at the end of the Amazon Resource Name (ARN) assigned to the extension
  /// version when it is registered.
  Future<void> deregisterType({
    String? arn,
    RegistryType? type,
    String? typeName,
    String? versionId,
  }) async {
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

  /// Retrieves your account's CloudFormation limits, such as the maximum number
  /// of stacks that you can create in your account. For more information about
  /// account limits, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html">CloudFormation
  /// Quotas</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of limits that you want to
  /// retrieve.
  Future<DescribeAccountLimitsOutput> describeAccountLimits({
    String? nextToken,
  }) async {
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

  /// Returns the inputs for the change set and a list of changes that
  /// CloudFormation will make if you execute the change set. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html">Updating
  /// Stacks Using Change Sets</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// May throw [ChangeSetNotFoundException].
  ///
  /// Parameter [changeSetName] :
  /// The name or Amazon Resource Name (ARN) of the change set that you want to
  /// describe.
  ///
  /// Parameter [includePropertyValues] :
  /// If <code>true</code>, the returned changes include detailed changes in the
  /// property values.
  ///
  /// Parameter [nextToken] :
  /// A string (provided by the <a>DescribeChangeSet</a> response output) that
  /// identifies the next page of information that you want to retrieve.
  ///
  /// Parameter [stackName] :
  /// If you specified the name of a change set, specify the stack name or ID
  /// (ARN) of the change set you want to describe.
  Future<DescribeChangeSetOutput> describeChangeSet({
    required String changeSetName,
    bool? includePropertyValues,
    String? nextToken,
    String? stackName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    includePropertyValues
        ?.also((arg) => $request['IncludePropertyValues'] = arg);
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

  /// Returns hook-related information for the change set and a list of changes
  /// that CloudFormation makes when you run the change set.
  ///
  /// May throw [ChangeSetNotFoundException].
  ///
  /// Parameter [changeSetName] :
  /// The name or Amazon Resource Name (ARN) of the change set that you want to
  /// describe.
  ///
  /// Parameter [logicalResourceId] :
  /// If specified, lists only the hooks related to the specified
  /// <code>LogicalResourceId</code>.
  ///
  /// Parameter [nextToken] :
  /// A string, provided by the <code>DescribeChangeSetHooks</code> response
  /// output, that identifies the next page of information that you want to
  /// retrieve.
  ///
  /// Parameter [stackName] :
  /// If you specified the name of a change set, specify the stack name or stack
  /// ID (ARN) of the change set you want to describe.
  Future<DescribeChangeSetHooksOutput> describeChangeSetHooks({
    required String changeSetName,
    String? logicalResourceId,
    String? nextToken,
    String? stackName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    logicalResourceId?.also((arg) => $request['LogicalResourceId'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackName?.also((arg) => $request['StackName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeChangeSetHooks',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeChangeSetHooksInput'],
      shapes: shapes,
      resultWrapper: 'DescribeChangeSetHooksResult',
    );
    return DescribeChangeSetHooksOutput.fromXml($result);
  }

  /// Describes a generated template. The output includes details about the
  /// progress of the creation of a generated template started by a
  /// <code>CreateGeneratedTemplate</code> API action or the update of a
  /// generated template started with an <code>UpdateGeneratedTemplate</code>
  /// API action.
  ///
  /// May throw [GeneratedTemplateNotFoundException].
  ///
  /// Parameter [generatedTemplateName] :
  /// The name or Amazon Resource Name (ARN) of a generated template.
  Future<DescribeGeneratedTemplateOutput> describeGeneratedTemplate({
    required String generatedTemplateName,
  }) async {
    final $request = <String, dynamic>{};
    $request['GeneratedTemplateName'] = generatedTemplateName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeGeneratedTemplate',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeGeneratedTemplateInput'],
      shapes: shapes,
      resultWrapper: 'DescribeGeneratedTemplateResult',
    );
    return DescribeGeneratedTemplateOutput.fromXml($result);
  }

  /// Retrieves information about the account's <code>OrganizationAccess</code>
  /// status. This API can be called either by the management account or the
  /// delegated administrator by using the <code>CallAs</code> parameter. This
  /// API can also be called without the <code>CallAs</code> parameter by the
  /// management account.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [OperationNotFoundException].
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  Future<DescribeOrganizationsAccessOutput> describeOrganizationsAccess({
    CallAs? callAs,
  }) async {
    final $request = <String, dynamic>{};
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOrganizationsAccess',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOrganizationsAccessInput'],
      shapes: shapes,
      resultWrapper: 'DescribeOrganizationsAccessResult',
    );
    return DescribeOrganizationsAccessOutput.fromXml($result);
  }

  /// Returns information about a CloudFormation extension publisher.
  ///
  /// If you don't supply a <code>PublisherId</code>, and you have registered as
  /// an extension publisher, <code>DescribePublisher</code> returns information
  /// about your own publisher account.
  ///
  /// For more information about registering as a publisher, see:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html">RegisterPublisher</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html">Publishing
  /// extensions to make them available for public use</a> in the
  /// <i>CloudFormation CLI User Guide</i>
  /// </li>
  /// </ul>
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [publisherId] :
  /// The ID of the extension publisher.
  ///
  /// If you don't supply a <code>PublisherId</code>, and you have registered as
  /// an extension publisher, <code>DescribePublisher</code> returns information
  /// about your own publisher account.
  Future<DescribePublisherOutput> describePublisher({
    String? publisherId,
  }) async {
    final $request = <String, dynamic>{};
    publisherId?.also((arg) => $request['PublisherId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribePublisher',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribePublisherInput'],
      shapes: shapes,
      resultWrapper: 'DescribePublisherResult',
    );
    return DescribePublisherOutput.fromXml($result);
  }

  /// Describes details of a resource scan.
  ///
  /// May throw [ResourceScanNotFoundException].
  ///
  /// Parameter [resourceScanId] :
  /// The Amazon Resource Name (ARN) of the resource scan.
  Future<DescribeResourceScanOutput> describeResourceScan({
    required String resourceScanId,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceScanId'] = resourceScanId;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeResourceScan',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeResourceScanInput'],
      shapes: shapes,
      resultWrapper: 'DescribeResourceScanResult',
    );
    return DescribeResourceScanOutput.fromXml($result);
  }

  /// Returns information about a stack drift detection operation. A stack drift
  /// detection operation detects whether a stack's actual configuration
  /// differs, or has <i>drifted</i>, from its expected configuration, as
  /// defined in the stack template and any values specified as template
  /// parameters. A stack is considered to have drifted if one or more of its
  /// resources have drifted. For more information about stack and resource
  /// drift, see <a
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
  /// CloudFormation generates new results, with a new drift detection ID, each
  /// time this operation is run. However, the number of drift results
  /// CloudFormation retains for any given stack, and for how long, may vary.
  Future<DescribeStackDriftDetectionStatusOutput>
      describeStackDriftDetectionStatus({
    required String stackDriftDetectionId,
  }) async {
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
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html">CloudFormation
  /// stack creation events</a> in the <i>CloudFormation User Guide</i>.
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
  /// The name or the unique stack ID that's associated with the stack, which
  /// aren't always interchangeable:
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
    String? nextToken,
    String? stackName,
  }) async {
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

  /// Returns the stack instance that's associated with the specified StackSet,
  /// Amazon Web Services account, and Amazon Web Services Region.
  ///
  /// For a list of stack instances that are associated with a specific
  /// StackSet, use <a>ListStackInstances</a>.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [StackInstanceNotFoundException].
  ///
  /// Parameter [stackInstanceAccount] :
  /// The ID of an Amazon Web Services account that's associated with this stack
  /// instance.
  ///
  /// Parameter [stackInstanceRegion] :
  /// The name of a Region that's associated with this stack instance.
  ///
  /// Parameter [stackSetName] :
  /// The name or the unique stack ID of the stack set that you want to get
  /// stack instance information for.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  Future<DescribeStackInstanceOutput> describeStackInstance({
    required String stackInstanceAccount,
    required String stackInstanceRegion,
    required String stackSetName,
    CallAs? callAs,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackInstanceAccount'] = stackInstanceAccount;
    $request['StackInstanceRegion'] = stackInstanceRegion;
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
  /// The name or the unique stack ID that's associated with the stack, which
  /// aren't always interchangeable:
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
    required String logicalResourceId,
    required String stackName,
  }) async {
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
  /// configuration values for resources where CloudFormation detects
  /// configuration drift.
  ///
  /// For a given stack, there will be one <code>StackResourceDrift</code> for
  /// each stack resource that has been checked for drift. Resources that
  /// haven't yet been checked for drift aren't included. Resources that don't
  /// currently support drift detection aren't checked, and so not included. For
  /// a list of resources that support drift detection, see <a
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
  /// <code>IN_SYNC</code>: The resource's actual configuration matches its
  /// expected template configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: CloudFormation doesn't currently return this
  /// value.
  /// </li>
  /// </ul>
  Future<DescribeStackResourceDriftsOutput> describeStackResourceDrifts({
    required String stackName,
    int? maxResults,
    String? nextToken,
    List<StackResourceDriftStatus>? stackResourceDriftStatusFilters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackResourceDriftStatusFilters?.also((arg) =>
        $request['StackResourceDriftStatusFilters'] =
            arg.map((e) => e.toValue()).toList());
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

  /// Returns Amazon Web Services resource descriptions for running and deleted
  /// stacks. If <code>StackName</code> is specified, all the associated
  /// resources that are part of the stack are returned. If
  /// <code>PhysicalResourceId</code> is specified, the associated resources of
  /// the stack that the resource belongs to are returned.
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/">CloudFormation
  /// User Guide</a>.
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
  /// of a resource supported by CloudFormation.
  ///
  /// For example, for an Amazon Elastic Compute Cloud (EC2) instance,
  /// <code>PhysicalResourceId</code> corresponds to the
  /// <code>InstanceId</code>. You can pass the EC2 <code>InstanceId</code> to
  /// <code>DescribeStackResources</code> to find which stack the instance
  /// belongs to and what other resources are part of the stack.
  ///
  /// Required: Conditional. If you don't specify
  /// <code>PhysicalResourceId</code>, you must specify <code>StackName</code>.
  ///
  /// Default: There is no default value.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that is associated with the stack, which
  /// aren't always interchangeable:
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
  /// Required: Conditional. If you don't specify <code>StackName</code>, you
  /// must specify <code>PhysicalResourceId</code>.
  Future<DescribeStackResourcesOutput> describeStackResources({
    String? logicalResourceId,
    String? physicalResourceId,
    String? stackName,
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

  /// Returns the description of the specified StackSet.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set whose description you want.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  Future<DescribeStackSetOutput> describeStackSet({
    required String stackSetName,
    CallAs? callAs,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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

  /// Returns the description of the specified StackSet operation.
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [OperationNotFoundException].
  ///
  /// Parameter [operationId] :
  /// The unique ID of the stack set operation.
  ///
  /// Parameter [stackSetName] :
  /// The name or the unique stack ID of the stack set for the stack operation.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  Future<DescribeStackSetOperationOutput> describeStackSetOperation({
    required String operationId,
    required String stackSetName,
    CallAs? callAs,
  }) async {
    final $request = <String, dynamic>{};
    $request['OperationId'] = operationId;
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
  /// specified, then it returns the description for all the stacks created. For
  /// more information about a stack's event history, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html">CloudFormation
  /// stack creation events</a> in the <i>CloudFormation User Guide</i>.
  /// <note>
  /// If the stack doesn't exist, a <code>ValidationError</code> is returned.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of stacks that you want to
  /// retrieve.
  ///
  /// Parameter [stackName] :
  /// <note>
  /// If you don't pass a parameter to <code>StackName</code>, the API returns a
  /// response that describes all resources in the account, which can impact
  /// performance. This requires <code>ListStacks</code> and
  /// <code>DescribeStacks</code> permissions.
  ///
  /// Consider using the <a>ListStacks</a> API if you're not passing a parameter
  /// to <code>StackName</code>.
  ///
  /// The IAM policy below can be added to IAM policies when you want to limit
  /// resource-level permissions and avoid returning a response when no
  /// parameter is sent in the request:
  ///
  /// { "Version": "2012-10-17", "Statement": [{ "Effect": "Deny", "Action":
  /// "cloudformation:DescribeStacks", "NotResource":
  /// "arn:aws:cloudformation:*:*:stack/*/*" }] }
  /// </note>
  /// The name or the unique stack ID that's associated with the stack, which
  /// aren't always interchangeable:
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
    String? nextToken,
    String? stackName,
  }) async {
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

  /// Returns detailed information about an extension that has been registered.
  ///
  /// If you specify a <code>VersionId</code>, <code>DescribeType</code> returns
  /// information about that specific extension version. Otherwise, it returns
  /// information about the default extension version.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [publicVersionNumber] :
  /// The version number of a public third-party extension.
  ///
  /// Parameter [publisherId] :
  /// The publisher ID of the extension publisher.
  ///
  /// Extensions provided by Amazon Web Services are not assigned a publisher
  /// ID.
  ///
  /// Parameter [type] :
  /// The kind of extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [versionId] :
  /// The ID of a specific version of the extension. The version ID is the value
  /// at the end of the Amazon Resource Name (ARN) assigned to the extension
  /// version when it is registered.
  ///
  /// If you specify a <code>VersionId</code>, <code>DescribeType</code> returns
  /// information about that specific extension version. Otherwise, it returns
  /// information about the default extension version.
  Future<DescribeTypeOutput> describeType({
    String? arn,
    String? publicVersionNumber,
    String? publisherId,
    RegistryType? type,
    String? typeName,
    String? versionId,
  }) async {
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    publicVersionNumber?.also((arg) => $request['PublicVersionNumber'] = arg);
    publisherId?.also((arg) => $request['PublisherId'] = arg);
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

  /// Returns information about an extension's registration, including its
  /// current status and type and version identifiers.
  ///
  /// When you initiate a registration request using <a>RegisterType</a>, you
  /// can then use <a>DescribeTypeRegistration</a> to monitor the progress of
  /// that registration request.
  ///
  /// Once the registration request has completed, use <a>DescribeType</a> to
  /// return detailed information about an extension.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [registrationToken] :
  /// The identifier for this registration request.
  ///
  /// This registration token is generated by CloudFormation when you initiate a
  /// registration request using <a>RegisterType</a>.
  Future<DescribeTypeRegistrationOutput> describeTypeRegistration({
    required String registrationToken,
  }) async {
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
  /// <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For each
  /// resource in the stack that supports drift detection, CloudFormation
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
  /// When detecting drift on a stack, CloudFormation doesn't detect drift on
  /// any nested stacks belonging to that stack. Perform
  /// <code>DetectStackDrift</code> directly on the nested stack itself.
  ///
  /// Parameter [stackName] :
  /// The name of the stack for which you want to detect drift.
  ///
  /// Parameter [logicalResourceIds] :
  /// The logical names of any resources you want to use as filters.
  Future<DetectStackDriftOutput> detectStackDrift({
    required String stackName,
    List<String>? logicalResourceIds,
  }) async {
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
  /// differs, or has <i>drifted</i>, from its expected configuration, as
  /// defined in the stack template and any values specified as template
  /// parameters. This information includes actual and expected property values
  /// for resources in which CloudFormation detects drift. Only resource
  /// properties explicitly defined in the stack template are checked for drift.
  /// For more information about stack and resource drift, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  ///
  /// Use <code>DetectStackResourceDrift</code> to detect drift on individual
  /// resources, or <a>DetectStackDrift</a> to detect drift on all resources in
  /// a given stack that support drift detection.
  ///
  /// Resources that don't currently support drift detection can't be checked.
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
    required String logicalResourceId,
    required String stackName,
  }) async {
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
  /// CloudFormation performs drift detection on a stack set</a>.
  ///
  /// <code>DetectStackSetDrift</code> returns the <code>OperationId</code> of
  /// the stack set drift detection operation. Use this operation id with
  /// <a>DescribeStackSetOperation</a> to monitor the progress of the drift
  /// detection operation. The drift detection operation may take some time,
  /// depending on the number of stack instances included in the stack set, in
  /// addition to the number of resources included in each stack.
  ///
  /// Once the operation has completed, use the following actions to return
  /// drift information:
  ///
  /// <ul>
  /// <li>
  /// Use <a>DescribeStackSet</a> to return detailed information about the stack
  /// set, including detailed information about the last <i>completed</i> drift
  /// operation performed on the stack set. (Information about drift operations
  /// that are in progress isn't included.)
  /// </li>
  /// <li>
  /// Use <a>ListStackInstances</a> to return a list of stack instances
  /// belonging to the stack set, including the drift status and last drift time
  /// checked of each instance.
  /// </li>
  /// <li>
  /// Use <a>DescribeStackInstance</a> to return detailed information about a
  /// specific stack instance, including its drift status and last drift time
  /// checked.
  /// </li>
  /// </ul>
  /// For more information about performing a drift detection operation on a
  /// stack set, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting
  /// unmanaged changes in stack sets</a>.
  ///
  /// You can only run a single drift detection operation on a given stack set
  /// at one time.
  ///
  /// To stop a drift detection stack set operation, use
  /// <a>StopStackSetOperation</a>.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [OperationInProgressException].
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name of the stack set on which to perform the drift detection
  /// operation.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [operationId] :
  /// <i>The ID of the stack set operation.</i>
  ///
  /// Parameter [operationPreferences] :
  /// The user-specified preferences for how CloudFormation performs a stack set
  /// operation.
  ///
  /// For more information about maximum concurrent accounts and failure
  /// tolerance, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
  /// set operation options</a>.
  Future<DetectStackSetDriftOutput> detectStackSetDrift({
    required String stackSetName,
    CallAs? callAs,
    String? operationId,
    StackSetOperationPreferences? operationPreferences,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
  /// Amazon Web Services Simple Monthly Calculator URL with a query string that
  /// describes the resources required to run the template.
  ///
  /// Parameter [parameters] :
  /// A list of <code>Parameter</code> structures that specify input parameters.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.)
  ///
  /// Conditional: You must pass <code>TemplateBody</code> or
  /// <code>TemplateURL</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template that's located in an Amazon S3 bucket or a Systems Manager
  /// document. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>. The location for an
  /// Amazon S3 bucket must start with <code>https://</code>.
  ///
  /// Conditional: You must pass <code>TemplateURL</code> or
  /// <code>TemplateBody</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  Future<EstimateTemplateCostOutput> estimateTemplateCost({
    List<Parameter>? parameters,
    String? templateBody,
    String? templateURL,
  }) async {
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
  /// CloudFormation starts updating the stack. Use the <a>DescribeStacks</a>
  /// action to view the status of the update.
  ///
  /// When you execute a change set, CloudFormation deletes all other change
  /// sets associated with the stack because they aren't valid for the updated
  /// stack.
  ///
  /// If a stack policy is associated with the stack, CloudFormation enforces
  /// the policy during the update. You can't specify a temporary stack policy
  /// that overrides the current policy.
  ///
  /// To create a change set for the entire stack hierarchy,
  /// <code>IncludeNestedStacks</code> must have been set to <code>True</code>.
  ///
  /// May throw [InvalidChangeSetStatusException].
  /// May throw [ChangeSetNotFoundException].
  /// May throw [InsufficientCapabilitiesException].
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [changeSetName] :
  /// The name or Amazon Resource Name (ARN) of the change set that you want use
  /// to update the specified stack.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>ExecuteChangeSet</code> request.
  /// Specify this token if you plan to retry requests so that CloudFormation
  /// knows that you're not attempting to execute a change set to update a stack
  /// with the same name. You might retry <code>ExecuteChangeSet</code> requests
  /// to ensure that CloudFormation successfully received them.
  ///
  /// Parameter [disableRollback] :
  /// Preserves the state of previously provisioned resources when an operation
  /// fails. This parameter can't be specified when the
  /// <code>OnStackFailure</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html">CreateChangeSet</a>
  /// API operation was specified.
  ///
  /// <ul>
  /// <li>
  /// <code>True</code> - if the stack creation fails, do nothing. This is
  /// equivalent to specifying <code>DO_NOTHING</code> for the
  /// <code>OnStackFailure</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html">CreateChangeSet</a>
  /// API operation.
  /// </li>
  /// <li>
  /// <code>False</code> - if the stack creation fails, roll back the stack.
  /// This is equivalent to specifying <code>ROLLBACK</code> for the
  /// <code>OnStackFailure</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html">CreateChangeSet</a>
  /// API operation.
  /// </li>
  /// </ul>
  /// Default: <code>True</code>
  ///
  /// Parameter [retainExceptOnCreate] :
  /// When set to <code>true</code>, newly created resources are deleted when
  /// the operation rolls back. This includes newly created resources marked
  /// with a deletion policy of <code>Retain</code>.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [stackName] :
  /// If you specified the name of a change set, specify the stack name or
  /// Amazon Resource Name (ARN) that's associated with the change set you want
  /// to execute.
  Future<void> executeChangeSet({
    required String changeSetName,
    String? clientRequestToken,
    bool? disableRollback,
    bool? retainExceptOnCreate,
    String? stackName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ChangeSetName'] = changeSetName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    disableRollback?.also((arg) => $request['DisableRollback'] = arg);
    retainExceptOnCreate?.also((arg) => $request['RetainExceptOnCreate'] = arg);
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

  /// Retrieves a generated template. If the template is in an
  /// <code>InProgress</code> or <code>Pending</code> status then the template
  /// returned will be the template when the template was last in a
  /// <code>Complete</code> status. If the template has not yet been in a
  /// <code>Complete</code> status then an empty template will be returned.
  ///
  /// May throw [GeneratedTemplateNotFoundException].
  ///
  /// Parameter [generatedTemplateName] :
  /// The name or Amazon Resource Name (ARN) of the generated template. The
  /// format is
  /// <code>arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}</code>.
  /// For example,
  /// <code>arn:aws:cloudformation:<i>us-east-1</i>:<i>123456789012</i>:generatedtemplate/<i>2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc</i>
  /// </code>.
  ///
  /// Parameter [format] :
  /// The language to use to retrieve for the generated template. Supported
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>JSON</code>
  /// </li>
  /// <li>
  /// <code>YAML</code>
  /// </li>
  /// </ul>
  Future<GetGeneratedTemplateOutput> getGeneratedTemplate({
    required String generatedTemplateName,
    TemplateFormat? format,
  }) async {
    final $request = <String, dynamic>{};
    $request['GeneratedTemplateName'] = generatedTemplateName;
    format?.also((arg) => $request['Format'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'GetGeneratedTemplate',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetGeneratedTemplateInput'],
      shapes: shapes,
      resultWrapper: 'GetGeneratedTemplateResult',
    );
    return GetGeneratedTemplateOutput.fromXml($result);
  }

  /// Returns the stack policy for a specified stack. If a stack doesn't have a
  /// policy, a null value is returned.
  ///
  /// Parameter [stackName] :
  /// The name or unique stack ID that's associated with the stack whose policy
  /// you want to get.
  Future<GetStackPolicyOutput> getStackPolicy({
    required String stackName,
  }) async {
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
  /// For deleted stacks, <code>GetTemplate</code> returns the template for up
  /// to 90 days after the stack has been deleted.
  /// <note>
  /// If the template doesn't exist, a <code>ValidationError</code> is returned.
  /// </note>
  ///
  /// May throw [ChangeSetNotFoundException].
  ///
  /// Parameter [changeSetName] :
  /// The name or Amazon Resource Name (ARN) of a change set for which
  /// CloudFormation returns the associated template. If you specify a name, you
  /// must also specify the <code>StackName</code>.
  ///
  /// Parameter [stackName] :
  /// The name or the unique stack ID that's associated with the stack, which
  /// aren't always interchangeable:
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
  /// For templates that include transforms, the stage of the template that
  /// CloudFormation returns. To get the user-submitted template, specify
  /// <code>Original</code>. To get the template after CloudFormation has
  /// processed all transforms, specify <code>Processed</code>.
  ///
  /// If the template doesn't include transforms, <code>Original</code> and
  /// <code>Processed</code> return the same template. By default,
  /// CloudFormation specifies <code>Processed</code>.
  Future<GetTemplateOutput> getTemplate({
    String? changeSetName,
    String? stackName,
    TemplateStage? templateStage,
  }) async {
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
  /// template doesn't exist, a <code>ValidationError</code> is returned.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [stackName] :
  /// The name or the stack ID that's associated with the stack, which aren't
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
  /// anatomy</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>StackName</code>, <code>StackSetName</code>,
  /// <code>TemplateBody</code>, or <code>TemplateURL</code>.
  ///
  /// Parameter [templateSummaryConfig] :
  /// Specifies options for the <code>GetTemplateSummary</code> API action.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template (max size: 460,800 bytes) that's located in an Amazon S3 bucket
  /// or a Systems Manager document. For more information about templates, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// anatomy</a> in the <i>CloudFormation User Guide</i>. The location for an
  /// Amazon S3 bucket must start with <code>https://</code>.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>StackName</code>, <code>StackSetName</code>,
  /// <code>TemplateBody</code>, or <code>TemplateURL</code>.
  Future<GetTemplateSummaryOutput> getTemplateSummary({
    CallAs? callAs,
    String? stackName,
    String? stackSetName,
    String? templateBody,
    TemplateSummaryConfig? templateSummaryConfig,
    String? templateURL,
  }) async {
    final $request = <String, dynamic>{};
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    stackName?.also((arg) => $request['StackName'] = arg);
    stackSetName?.also((arg) => $request['StackSetName'] = arg);
    templateBody?.also((arg) => $request['TemplateBody'] = arg);
    templateSummaryConfig
        ?.also((arg) => $request['TemplateSummaryConfig'] = arg);
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

  /// Import existing stacks into a new stack sets. Use the stack import
  /// operation to import up to 10 stacks into a new stack set in the same
  /// account as the source stack or in a different administrator account and
  /// Region, by specifying the stack ID of the stack you intend to import.
  ///
  /// May throw [LimitExceededException].
  /// May throw [StackSetNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [OperationInProgressException].
  /// May throw [OperationIdAlreadyExistsException].
  /// May throw [StackNotFoundException].
  /// May throw [StaleRequestException].
  ///
  /// Parameter [stackSetName] :
  /// The name of the stack set. The name must be unique in the Region where you
  /// create your stack set.
  ///
  /// Parameter [callAs] :
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// For service managed stack sets, specify <code>DELEGATED_ADMIN</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [operationId] :
  /// A unique, user defined, identifier for the stack set operation.
  ///
  /// Parameter [operationPreferences] :
  /// The user-specified preferences for how CloudFormation performs a stack set
  /// operation.
  ///
  /// For more information about maximum concurrent accounts and failure
  /// tolerance, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
  /// set operation options</a>.
  ///
  /// Parameter [organizationalUnitIds] :
  /// The list of OU ID's to which the stacks being imported has to be mapped as
  /// deployment target.
  ///
  /// Parameter [stackIds] :
  /// The IDs of the stacks you are importing into a stack set. You import up to
  /// 10 stacks per stack set at a time.
  ///
  /// Specify either <code>StackIds</code> or <code>StackIdsUrl</code>.
  ///
  /// Parameter [stackIdsUrl] :
  /// The Amazon S3 URL which contains list of stack ids to be inputted.
  ///
  /// Specify either <code>StackIds</code> or <code>StackIdsUrl</code>.
  Future<ImportStacksToStackSetOutput> importStacksToStackSet({
    required String stackSetName,
    CallAs? callAs,
    String? operationId,
    StackSetOperationPreferences? operationPreferences,
    List<String>? organizationalUnitIds,
    List<String>? stackIds,
    String? stackIdsUrl,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    $request['OperationId'] = operationId ?? _s.generateIdempotencyToken();
    operationPreferences?.also((arg) => $request['OperationPreferences'] = arg);
    organizationalUnitIds
        ?.also((arg) => $request['OrganizationalUnitIds'] = arg);
    stackIds?.also((arg) => $request['StackIds'] = arg);
    stackIdsUrl?.also((arg) => $request['StackIdsUrl'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ImportStacksToStackSet',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ImportStacksToStackSetInput'],
      shapes: shapes,
      resultWrapper: 'ImportStacksToStackSetResult',
    );
    return ImportStacksToStackSetOutput.fromXml($result);
  }

  /// Returns the ID and status of each active change set for a stack. For
  /// example, CloudFormation lists change sets that are in the
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
    required String stackName,
    String? nextToken,
  }) async {
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
  /// Fn::ImportValue</a> function.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html">
  /// CloudFormation export stack output values</a>.
  ///
  /// Parameter [nextToken] :
  /// A string (provided by the <a>ListExports</a> response output) that
  /// identifies the next page of exported output values that you asked to
  /// retrieve.
  Future<ListExportsOutput> listExports({
    String? nextToken,
  }) async {
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

  /// Lists your generated templates in this Region.
  ///
  /// Parameter [maxResults] :
  /// If the number of available results exceeds this maximum, the response
  /// includes a <code>NextToken</code> value that you can use for the
  /// <code>NextToken</code> parameter to get the next set of results. By
  /// default the <code>ListGeneratedTemplates</code> API action will return at
  /// most 50 results in each response. The maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of resource scan results.
  Future<ListGeneratedTemplatesOutput> listGeneratedTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListGeneratedTemplates',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListGeneratedTemplatesInput'],
      shapes: shapes,
      resultWrapper: 'ListGeneratedTemplatesResult',
    );
    return ListGeneratedTemplatesOutput.fromXml($result);
  }

  /// Lists all stacks that are importing an exported output value. To modify or
  /// remove an exported output value, first use this action to see which stacks
  /// are using it. To see the exported output values in your account, see
  /// <a>ListExports</a>.
  ///
  /// For more information about importing an exported output value, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html">Fn::ImportValue</a>
  /// function.
  ///
  /// Parameter [exportName] :
  /// The name of the exported output value. CloudFormation returns the stack
  /// names that are importing this value.
  ///
  /// Parameter [nextToken] :
  /// A string (provided by the <a>ListImports</a> response output) that
  /// identifies the next page of stacks that are importing the specified
  /// exported output value.
  Future<ListImportsOutput> listImports({
    required String exportName,
    String? nextToken,
  }) async {
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

  /// Lists the related resources for a list of resources from a resource scan.
  /// The response indicates whether each returned resource is already managed
  /// by CloudFormation.
  ///
  /// May throw [ResourceScanNotFoundException].
  /// May throw [ResourceScanInProgressException].
  ///
  /// Parameter [resourceScanId] :
  /// The Amazon Resource Name (ARN) of the resource scan.
  ///
  /// Parameter [resources] :
  /// The list of resources for which you want to get the related resources. Up
  /// to 100 resources can be provided.
  ///
  /// Parameter [maxResults] :
  /// If the number of available results exceeds this maximum, the response
  /// includes a <code>NextToken</code> value that you can use for the
  /// <code>NextToken</code> parameter to get the next set of results. By
  /// default the <code>ListResourceScanRelatedResources</code> API action will
  /// return up to 100 results in each response. The maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of resource scan results.
  Future<ListResourceScanRelatedResourcesOutput>
      listResourceScanRelatedResources({
    required String resourceScanId,
    required List<ScannedResourceIdentifier> resources,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    $request['ResourceScanId'] = resourceScanId;
    $request['Resources'] = resources;
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListResourceScanRelatedResources',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListResourceScanRelatedResourcesInput'],
      shapes: shapes,
      resultWrapper: 'ListResourceScanRelatedResourcesResult',
    );
    return ListResourceScanRelatedResourcesOutput.fromXml($result);
  }

  /// Lists the resources from a resource scan. The results can be filtered by
  /// resource identifier, resource type prefix, tag key, and tag value. Only
  /// resources that match all specified filters are returned. The response
  /// indicates whether each returned resource is already managed by
  /// CloudFormation.
  ///
  /// May throw [ResourceScanNotFoundException].
  /// May throw [ResourceScanInProgressException].
  ///
  /// Parameter [resourceScanId] :
  /// The Amazon Resource Name (ARN) of the resource scan.
  ///
  /// Parameter [maxResults] :
  /// If the number of available results exceeds this maximum, the response
  /// includes a <code>NextToken</code> value that you can use for the
  /// <code>NextToken</code> parameter to get the next set of results. By
  /// default the <code>ListResourceScanResources</code> API action will return
  /// at most 100 results in each response. The maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of resource scan results.
  ///
  /// Parameter [resourceIdentifier] :
  /// If specified, the returned resources will have the specified resource
  /// identifier (or one of them in the case where the resource has multiple
  /// identifiers).
  ///
  /// Parameter [resourceTypePrefix] :
  /// If specified, the returned resources will be of any of the resource types
  /// with the specified prefix.
  ///
  /// Parameter [tagKey] :
  /// If specified, the returned resources will have a matching tag key.
  ///
  /// Parameter [tagValue] :
  /// If specified, the returned resources will have a matching tag value.
  Future<ListResourceScanResourcesOutput> listResourceScanResources({
    required String resourceScanId,
    int? maxResults,
    String? nextToken,
    String? resourceIdentifier,
    String? resourceTypePrefix,
    String? tagKey,
    String? tagValue,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceScanId'] = resourceScanId;
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    resourceIdentifier?.also((arg) => $request['ResourceIdentifier'] = arg);
    resourceTypePrefix?.also((arg) => $request['ResourceTypePrefix'] = arg);
    tagKey?.also((arg) => $request['TagKey'] = arg);
    tagValue?.also((arg) => $request['TagValue'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListResourceScanResources',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListResourceScanResourcesInput'],
      shapes: shapes,
      resultWrapper: 'ListResourceScanResourcesResult',
    );
    return ListResourceScanResourcesOutput.fromXml($result);
  }

  /// List the resource scans from newest to oldest. By default it will return
  /// up to 10 resource scans.
  ///
  /// Parameter [maxResults] :
  /// If the number of available results exceeds this maximum, the response
  /// includes a <code>NextToken</code> value that you can use for the
  /// <code>NextToken</code> parameter to get the next set of results. The
  /// default value is 10. The maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// A string that identifies the next page of resource scan results.
  Future<ListResourceScansOutput> listResourceScans({
    int? maxResults,
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListResourceScans',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListResourceScansInput'],
      shapes: shapes,
      resultWrapper: 'ListResourceScansResult',
    );
    return ListResourceScansOutput.fromXml($result);
  }

  /// Returns drift information for resources in a stack instance.
  /// <note>
  /// <code>ListStackInstanceResourceDrifts</code> returns drift information for
  /// the most recent drift detection operation. If an operation is in progress,
  /// it may only return partial results.
  /// </note>
  ///
  /// May throw [StackSetNotFoundException].
  /// May throw [StackInstanceNotFoundException].
  /// May throw [OperationNotFoundException].
  ///
  /// Parameter [operationId] :
  /// The unique ID of the drift operation.
  ///
  /// Parameter [stackInstanceAccount] :
  /// The name of the Amazon Web Services account that you want to list resource
  /// drifts for.
  ///
  /// Parameter [stackInstanceRegion] :
  /// The name of the Region where you want to list resource drifts.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to list drifted
  /// resources for.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
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
  /// Parameter [stackInstanceResourceDriftStatuses] :
  /// The resource drift status of the stack instance.
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
  /// <code>IN_SYNC</code>: The resource's actual configuration matches its
  /// expected template configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: CloudFormation doesn't currently return this
  /// value.
  /// </li>
  /// </ul>
  Future<ListStackInstanceResourceDriftsOutput>
      listStackInstanceResourceDrifts({
    required String operationId,
    required String stackInstanceAccount,
    required String stackInstanceRegion,
    required String stackSetName,
    CallAs? callAs,
    int? maxResults,
    String? nextToken,
    List<StackResourceDriftStatus>? stackInstanceResourceDriftStatuses,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    $request['OperationId'] = operationId;
    $request['StackInstanceAccount'] = stackInstanceAccount;
    $request['StackInstanceRegion'] = stackInstanceRegion;
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackInstanceResourceDriftStatuses?.also((arg) =>
        $request['StackInstanceResourceDriftStatuses'] =
            arg.map((e) => e.toValue()).toList());
    final $result = await _protocol.send(
      $request,
      action: 'ListStackInstanceResourceDrifts',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStackInstanceResourceDriftsInput'],
      shapes: shapes,
      resultWrapper: 'ListStackInstanceResourceDriftsResult',
    );
    return ListStackInstanceResourceDriftsOutput.fromXml($result);
  }

  /// Returns summary information about stack instances that are associated with
  /// the specified stack set. You can filter for stack instances that are
  /// associated with a specific Amazon Web Services account name or Region, or
  /// that have a specific status.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to list stack
  /// instances for.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// The filter to apply to stack instances
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous request didn't return all the remaining results, the
  /// response's <code>NextToken</code> parameter value is set to a token. To
  /// retrieve the next set of results, call <code>ListStackInstances</code>
  /// again and assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [stackInstanceAccount] :
  /// The name of the Amazon Web Services account that you want to list stack
  /// instances for.
  ///
  /// Parameter [stackInstanceRegion] :
  /// The name of the Region where you want to list stack instances.
  Future<ListStackInstancesOutput> listStackInstances({
    required String stackSetName,
    CallAs? callAs,
    List<StackInstanceFilter>? filters,
    int? maxResults,
    String? nextToken,
    String? stackInstanceAccount,
    String? stackInstanceRegion,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
  /// aren't always interchangeable:
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
    required String stackName,
    String? nextToken,
  }) async {
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

  /// Returns summary information about deployment targets for a stack set.
  ///
  /// May throw [StackSetNotFoundException].
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set that you want to get automatic
  /// deployment targets for.
  ///
  /// Parameter [callAs] :
  /// Specifies whether you are acting as an account administrator in the
  /// organization's management account or as a delegated administrator in a
  /// member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// StackSets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
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
  /// A string that identifies the next page of stack set deployment targets
  /// that you want to retrieve.
  Future<ListStackSetAutoDeploymentTargetsOutput>
      listStackSetAutoDeploymentTargets({
    required String stackSetName,
    CallAs? callAs,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListStackSetAutoDeploymentTargets',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListStackSetAutoDeploymentTargetsInput'],
      shapes: shapes,
      resultWrapper: 'ListStackSetAutoDeploymentTargetsResult',
    );
    return ListStackSetAutoDeploymentTargetsOutput.fromXml($result);
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
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// The filter to apply to operation results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous request didn't return all the remaining results, the
  /// response object's <code>NextToken</code> parameter value is set to a
  /// token. To retrieve the next set of results, call
  /// <code>ListStackSetOperationResults</code> again and assign that token to
  /// the request object's <code>NextToken</code> parameter. If there are no
  /// remaining results, the previous response object's <code>NextToken</code>
  /// parameter is set to <code>null</code>.
  Future<ListStackSetOperationResultsOutput> listStackSetOperationResults({
    required String operationId,
    required String stackSetName,
    CallAs? callAs,
    List<OperationResultFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    $request['OperationId'] = operationId;
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    filters?.also((arg) => $request['Filters'] = arg);
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
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
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
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListStackSetOperations</code> again and assign that token to the
  /// request object's <code>NextToken</code> parameter. If there are no
  /// remaining results, the previous response object's <code>NextToken</code>
  /// parameter is set to <code>null</code>.
  Future<ListStackSetOperationsOutput> listStackSetOperations({
    required String stackSetName,
    CallAs? callAs,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
  /// <ul>
  /// <li>
  /// [Self-managed permissions] If you set the <code>CallAs</code> parameter to
  /// <code>SELF</code> while signed in to your Amazon Web Services account,
  /// <code>ListStackSets</code> returns all self-managed stack sets in your
  /// Amazon Web Services account.
  /// </li>
  /// <li>
  /// [Service-managed permissions] If you set the <code>CallAs</code> parameter
  /// to <code>SELF</code> while signed in to the organization's management
  /// account, <code>ListStackSets</code> returns all stack sets in the
  /// management account.
  /// </li>
  /// <li>
  /// [Service-managed permissions] If you set the <code>CallAs</code> parameter
  /// to <code>DELEGATED_ADMIN</code> while signed in to your member account,
  /// <code>ListStackSets</code> returns all stack sets with service-managed
  /// permissions in the management account.
  /// </li>
  /// </ul>
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the management account or as a delegated
  /// administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
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
  /// If the previous paginated request didn't return all the remaining results,
  /// the response object's <code>NextToken</code> parameter value is set to a
  /// token. To retrieve the next set of results, call
  /// <code>ListStackSets</code> again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If there are no remaining
  /// results, the previous response object's <code>NextToken</code> parameter
  /// is set to <code>null</code>.
  ///
  /// Parameter [status] :
  /// The status of the stack sets that you want to get summary information
  /// about.
  Future<ListStackSetsOutput> listStackSets({
    CallAs? callAs,
    int? maxResults,
    String? nextToken,
    StackSetStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
    String? nextToken,
    List<StackStatus>? stackStatusFilter,
  }) async {
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    stackStatusFilter?.also((arg) =>
        $request['StackStatusFilter'] = arg.map((e) => e.toValue()).toList());
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

  /// Returns a list of registration tokens for the specified extension(s).
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
  /// If the previous paginated request didn't return all the remaining results,
  /// the response object's <code>NextToken</code> parameter value is set to a
  /// token. To retrieve the next set of results, call this action again and
  /// assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [registrationStatusFilter] :
  /// The current status of the extension registration request.
  ///
  /// The default is <code>IN_PROGRESS</code>.
  ///
  /// Parameter [type] :
  /// The kind of extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeArn] :
  /// The Amazon Resource Name (ARN) of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  Future<ListTypeRegistrationsOutput> listTypeRegistrations({
    int? maxResults,
    String? nextToken,
    RegistrationStatus? registrationStatusFilter,
    RegistryType? type,
    String? typeArn,
    String? typeName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Returns summary information about the versions of an extension.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the extension for which you want version
  /// summary information.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [deprecatedStatus] :
  /// The deprecation status of the extension versions that you want to get
  /// summary information about.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>LIVE</code>: The extension version is registered and can be used in
  /// CloudFormation operations, dependent on its provisioning behavior and
  /// visibility scope.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code>: The extension version has been deregistered and
  /// can no longer be used in CloudFormation operations.
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
  /// Parameter [publisherId] :
  /// The publisher ID of the extension publisher.
  ///
  /// Extensions published by Amazon aren't assigned a publisher ID.
  ///
  /// Parameter [type] :
  /// The kind of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension for which you want version summary information.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  Future<ListTypeVersionsOutput> listTypeVersions({
    String? arn,
    DeprecatedStatus? deprecatedStatus,
    int? maxResults,
    String? nextToken,
    String? publisherId,
    RegistryType? type,
    String? typeName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    deprecatedStatus
        ?.also((arg) => $request['DeprecatedStatus'] = arg.toValue());
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    publisherId?.also((arg) => $request['PublisherId'] = arg);
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

  /// Returns summary information about extension that have been registered with
  /// CloudFormation.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [deprecatedStatus] :
  /// The deprecation status of the extension that you want to get summary
  /// information about.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>LIVE</code>: The extension is registered for use in CloudFormation
  /// operations.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code>: The extension has been deregistered and can no
  /// longer be used in CloudFormation operations.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// Filter criteria to use in determining which extensions to return.
  ///
  /// Filters must be compatible with <code>Visibility</code> to return valid
  /// results. For example, specifying <code>AWS_TYPES</code> for
  /// <code>Category</code> and <code>PRIVATE</code> for <code>Visibility</code>
  /// returns an empty list of types, but specifying <code>PUBLIC</code> for
  /// <code>Visibility</code> returns the desired list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all the remaining results,
  /// the response object's <code>NextToken</code> parameter value is set to a
  /// token. To retrieve the next set of results, call this action again and
  /// assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [provisioningType] :
  /// For resource types, the provisioning behavior of the resource type.
  /// CloudFormation determines the provisioning type during registration, based
  /// on the types of handlers in the schema handler package submitted.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>FULLY_MUTABLE</code>: The resource type includes an update handler
  /// to process updates to the type during stack update operations.
  /// </li>
  /// <li>
  /// <code>IMMUTABLE</code>: The resource type doesn't include an update
  /// handler, so the type can't be updated and must instead be replaced during
  /// stack update operations.
  /// </li>
  /// <li>
  /// <code>NON_PROVISIONABLE</code>: The resource type doesn't include create,
  /// read, and delete handlers, and therefore can't actually be provisioned.
  /// </li>
  /// </ul>
  /// The default is <code>FULLY_MUTABLE</code>.
  ///
  /// Parameter [type] :
  /// The type of extension.
  ///
  /// Parameter [visibility] :
  /// The scope at which the extensions are visible and usable in CloudFormation
  /// operations.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>PRIVATE</code>: Extensions that are visible and usable within this
  /// account and Region. This includes:
  ///
  /// <ul>
  /// <li>
  /// Private extensions you have registered in this account and Region.
  /// </li>
  /// <li>
  /// Public extensions that you have activated in this account and Region.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PUBLIC</code>: Extensions that are publicly visible and available to
  /// be activated within any Amazon Web Services account. This includes
  /// extensions from Amazon Web Services, in addition to third-party
  /// publishers.
  /// </li>
  /// </ul>
  /// The default is <code>PRIVATE</code>.
  Future<ListTypesOutput> listTypes({
    DeprecatedStatus? deprecatedStatus,
    TypeFilters? filters,
    int? maxResults,
    String? nextToken,
    ProvisioningType? provisioningType,
    RegistryType? type,
    Visibility? visibility,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    deprecatedStatus
        ?.also((arg) => $request['DeprecatedStatus'] = arg.toValue());
    filters?.also((arg) => $request['Filters'] = arg);
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

  /// Publishes the specified extension to the CloudFormation registry as a
  /// public extension in this Region. Public extensions are available for use
  /// by all CloudFormation users. For more information about publishing
  /// extensions, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html">Publishing
  /// extensions to make them available for public use</a> in the
  /// <i>CloudFormation CLI User Guide</i>.
  ///
  /// To publish an extension, you must be registered as a publisher with
  /// CloudFormation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html">RegisterPublisher</a>.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the extension.
  ///
  /// Conditional: You must specify <code>Arn</code>, or <code>TypeName</code>
  /// and <code>Type</code>.
  ///
  /// Parameter [publicVersionNumber] :
  /// The version number to assign to this version of the extension.
  ///
  /// Use the following format, and adhere to semantic versioning when assigning
  /// a version number to your extension:
  ///
  /// <code>MAJOR.MINOR.PATCH</code>
  ///
  /// For more information, see <a href="https://semver.org/">Semantic
  /// Versioning 2.0.0</a>.
  ///
  /// If you don't specify a version number, CloudFormation increments the
  /// version number by one minor version release.
  ///
  /// You cannot specify a version number the first time you publish a type.
  /// CloudFormation automatically sets the first version number to be
  /// <code>1.0.0</code>.
  ///
  /// Parameter [type] :
  /// The type of the extension.
  ///
  /// Conditional: You must specify <code>Arn</code>, or <code>TypeName</code>
  /// and <code>Type</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension.
  ///
  /// Conditional: You must specify <code>Arn</code>, or <code>TypeName</code>
  /// and <code>Type</code>.
  Future<PublishTypeOutput> publishType({
    String? arn,
    String? publicVersionNumber,
    ThirdPartyType? type,
    String? typeName,
  }) async {
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    publicVersionNumber?.also((arg) => $request['PublicVersionNumber'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PublishType',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PublishTypeInput'],
      shapes: shapes,
      resultWrapper: 'PublishTypeResult',
    );
    return PublishTypeOutput.fromXml($result);
  }

  /// Reports progress of a resource handler to CloudFormation.
  ///
  /// Reserved for use by the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation
  /// CLI</a>. Don't use this API in your code.
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
    required String bearerToken,
    required OperationStatus operationStatus,
    String? clientRequestToken,
    OperationStatus? currentOperationStatus,
    HandlerErrorCode? errorCode,
    String? resourceModel,
    String? statusMessage,
  }) async {
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

  /// Registers your account as a publisher of public extensions in the
  /// CloudFormation registry. Public extensions are available for use by all
  /// CloudFormation users. This publisher ID applies to your account in all
  /// Amazon Web Services Regions.
  ///
  /// For information about requirements for registering as a public extension
  /// publisher, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-prereqs">Registering
  /// your account to publish CloudFormation extensions</a> in the
  /// <i>CloudFormation CLI User Guide</i>.
  /// <p/>
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [acceptTermsAndConditions] :
  /// Whether you accept the <a
  /// href="https://cloudformation-registry-documents.s3.amazonaws.com/Terms_and_Conditions_for_AWS_CloudFormation_Registry_Publishers.pdf">Terms
  /// and Conditions</a> for publishing extensions in the CloudFormation
  /// registry. You must accept the terms and conditions in order to register to
  /// publish public extensions to the CloudFormation registry.
  ///
  /// The default is <code>false</code>.
  ///
  /// Parameter [connectionArn] :
  /// If you are using a Bitbucket or GitHub account for identity verification,
  /// the Amazon Resource Name (ARN) for your connection to that account.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-prereqs">Registering
  /// your account to publish CloudFormation extensions</a> in the
  /// <i>CloudFormation CLI User Guide</i>.
  Future<RegisterPublisherOutput> registerPublisher({
    bool? acceptTermsAndConditions,
    String? connectionArn,
  }) async {
    final $request = <String, dynamic>{};
    acceptTermsAndConditions
        ?.also((arg) => $request['AcceptTermsAndConditions'] = arg);
    connectionArn?.also((arg) => $request['ConnectionArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RegisterPublisher',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RegisterPublisherInput'],
      shapes: shapes,
      resultWrapper: 'RegisterPublisherResult',
    );
    return RegisterPublisherOutput.fromXml($result);
  }

  /// Registers an extension with the CloudFormation service. Registering an
  /// extension makes it available for use in CloudFormation templates in your
  /// Amazon Web Services account, and includes:
  ///
  /// <ul>
  /// <li>
  /// Validating the extension schema.
  /// </li>
  /// <li>
  /// Determining which handlers, if any, have been specified for the extension.
  /// </li>
  /// <li>
  /// Making the extension available for use in your account.
  /// </li>
  /// </ul>
  /// For more information about how to develop extensions and ready them for
  /// registration, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html">Creating
  /// Resource Providers</a> in the <i>CloudFormation CLI User Guide</i>.
  ///
  /// You can have a maximum of 50 resource extension versions registered at a
  /// time. This maximum is per account and per Region. Use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeregisterType.html">DeregisterType</a>
  /// to deregister specific extension versions if necessary.
  ///
  /// Once you have initiated a registration request using <a>RegisterType</a>,
  /// you can use <a>DescribeTypeRegistration</a> to monitor the progress of the
  /// registration request.
  ///
  /// Once you have registered a private extension in your account and Region,
  /// use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html">SetTypeConfiguration</a>
  /// to specify configuration properties for the extension. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private.html#registry-set-configuration">Configuring
  /// extensions at the account level</a> in the <i>CloudFormation User
  /// Guide</i>.
  ///
  /// May throw [CFNRegistryException].
  ///
  /// Parameter [schemaHandlerPackage] :
  /// A URL to the S3 bucket containing the extension project package that
  /// contains the necessary files for the extension you want to register.
  ///
  /// For information about generating a schema handler package for the
  /// extension you want to register, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-cli-submit.html">submit</a>
  /// in the <i>CloudFormation CLI User Guide</i>.
  /// <note>
  /// The user registering the extension must be able to access the package in
  /// the S3 bucket. That's, the user needs to have <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// permissions for the schema handler package. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html">Actions,
  /// Resources, and Condition Keys for Amazon S3</a> in the <i>Identity and
  /// Access Management User Guide</i>.
  /// </note>
  ///
  /// Parameter [typeName] :
  /// The name of the extension being registered.
  ///
  /// We suggest that extension names adhere to the following patterns:
  ///
  /// <ul>
  /// <li>
  /// For resource types,
  /// <i>company_or_organization</i>::<i>service</i>::<i>type</i>.
  /// </li>
  /// <li>
  /// For modules,
  /// <i>company_or_organization</i>::<i>service</i>::<i>type</i>::MODULE.
  /// </li>
  /// <li>
  /// For hooks, <i>MyCompany</i>::<i>Testing</i>::<i>MyTestHook</i>.
  /// </li>
  /// </ul> <note>
  /// The following organization namespaces are reserved and can't be used in
  /// your extension names:
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
  /// generating more than one version of an extension from the same
  /// registration request, even if the request is submitted multiple times.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role for CloudFormation to
  /// assume when invoking the extension.
  ///
  /// For CloudFormation to assume the specified execution role, the role must
  /// contain a trust relationship with the CloudFormation service principal
  /// (<code>resources.cloudformation.amazonaws.com</code>). For more
  /// information about adding trust relationships, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-managingrole-editing-console.html#roles-managingrole_edit-trust-policy">Modifying
  /// a role trust policy</a> in the <i>Identity and Access Management User
  /// Guide</i>.
  ///
  /// If your extension calls Amazon Web Services APIs in any of its handlers,
  /// you must create an <i> <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// execution role</a> </i> that includes the necessary permissions to call
  /// those Amazon Web Services APIs, and provision that execution role in your
  /// account. When CloudFormation needs to invoke the resource type handler,
  /// CloudFormation assumes this execution role to create a temporary session
  /// token, which it then passes to the resource type handler, thereby
  /// supplying your resource type with the appropriate credentials.
  ///
  /// Parameter [loggingConfig] :
  /// Specifies logging configuration information for an extension.
  ///
  /// Parameter [type] :
  /// The kind of extension.
  Future<RegisterTypeOutput> registerType({
    required String schemaHandlerPackage,
    required String typeName,
    String? clientRequestToken,
    String? executionRoleArn,
    LoggingConfig? loggingConfig,
    RegistryType? type,
  }) async {
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

  /// When specifying <code>RollbackStack</code>, you preserve the state of
  /// previously provisioned resources when an operation fails. You can check
  /// the status of the stack through the <a>DescribeStacks</a> operation.
  ///
  /// Rolls back the specified stack to the last known stable state from
  /// <code>CREATE_FAILED</code> or <code>UPDATE_FAILED</code> stack statuses.
  ///
  /// This operation will delete a stack if it doesn't contain a last known
  /// stable state. A last known stable state includes any status in a
  /// <code>*_COMPLETE</code>. This includes the following stack statuses.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_COMPLETE</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_COMPLETE</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_ROLLBACK_COMPLETE</code>
  /// </li>
  /// <li>
  /// <code>IMPORT_COMPLETE</code>
  /// </li>
  /// <li>
  /// <code>IMPORT_ROLLBACK_COMPLETE</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [TokenAlreadyExistsException].
  ///
  /// Parameter [stackName] :
  /// The name that's associated with the stack.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>RollbackStack</code> request.
  ///
  /// Parameter [retainExceptOnCreate] :
  /// When set to <code>true</code>, newly created resources are deleted when
  /// the operation rolls back. This includes newly created resources marked
  /// with a deletion policy of <code>Retain</code>.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an Identity and Access Management role
  /// that CloudFormation assumes to rollback the stack.
  Future<RollbackStackOutput> rollbackStack({
    required String stackName,
    String? clientRequestToken,
    bool? retainExceptOnCreate,
    String? roleARN,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    retainExceptOnCreate?.also((arg) => $request['RetainExceptOnCreate'] = arg);
    roleARN?.also((arg) => $request['RoleARN'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RollbackStack',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RollbackStackInput'],
      shapes: shapes,
      resultWrapper: 'RollbackStackResult',
    );
    return RollbackStackOutput.fromXml($result);
  }

  /// Sets a stack policy for a specified stack.
  ///
  /// Parameter [stackName] :
  /// The name or unique stack ID that you want to associate a policy with.
  ///
  /// Parameter [stackPolicyBody] :
  /// Structure containing the stack policy body. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html">
  /// Prevent updates to stack resources</a> in the <i>CloudFormation User
  /// Guide</i>. You can specify either the <code>StackPolicyBody</code> or the
  /// <code>StackPolicyURL</code> parameter, but not both.
  ///
  /// Parameter [stackPolicyURL] :
  /// Location of a file containing the stack policy. The URL must point to a
  /// policy (maximum size: 16 KB) located in an Amazon S3 bucket in the same
  /// Amazon Web Services Region as the stack. The location for an Amazon S3
  /// bucket must start with <code>https://</code>. You can specify either the
  /// <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter,
  /// but not both.
  Future<void> setStackPolicy({
    required String stackName,
    String? stackPolicyBody,
    String? stackPolicyURL,
  }) async {
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

  /// Specifies the configuration data for a registered CloudFormation
  /// extension, in the given account and Region.
  ///
  /// To view the current configuration data for an extension, refer to the
  /// <code>ConfigurationSchema</code> element of <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html">DescribeType</a>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private.html#registry-set-configuration">Configuring
  /// extensions at the account level</a> in the <i>CloudFormation User
  /// Guide</i>.
  /// <important>
  /// It's strongly recommended that you use dynamic references to restrict
  /// sensitive configuration definitions, such as third-party credentials. For
  /// more details on dynamic references, see <a
  /// href="https://docs.aws.amazon.com/">Using dynamic references to specify
  /// template values</a> in the <i>CloudFormation User Guide</i>.
  /// </important>
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [configuration] :
  /// The configuration data for the extension, in this account and Region.
  ///
  /// The configuration data must be formatted as JSON, and validate against the
  /// schema returned in the <code>ConfigurationSchema</code> response element
  /// of <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html">DescribeType</a>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-model.html#resource-type-howto-configuration">Defining
  /// account-level configuration data for an extension</a> in the
  /// <i>CloudFormation CLI User Guide</i>.
  ///
  /// Parameter [configurationAlias] :
  /// An alias by which to refer to this extension configuration data.
  ///
  /// Conditional: Specifying a configuration alias is required when setting a
  /// configuration for a resource type extension.
  ///
  /// Parameter [type] :
  /// The type of extension.
  ///
  /// Conditional: You must specify <code>ConfigurationArn</code>, or
  /// <code>Type</code> and <code>TypeName</code>.
  ///
  /// Parameter [typeArn] :
  /// The Amazon Resource Name (ARN) for the extension, in this account and
  /// Region.
  ///
  /// For public extensions, this will be the ARN assigned when you call the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html">ActivateType</a>
  /// API operation in this account and Region. For private extensions, this
  /// will be the ARN assigned when you call the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>
  /// API operation in this account and Region.
  ///
  /// Do not include the extension versions suffix at the end of the ARN. You
  /// can set the configuration for an extension, but not for a specific
  /// extension version.
  ///
  /// Parameter [typeName] :
  /// The name of the extension.
  ///
  /// Conditional: You must specify <code>ConfigurationArn</code>, or
  /// <code>Type</code> and <code>TypeName</code>.
  Future<SetTypeConfigurationOutput> setTypeConfiguration({
    required String configuration,
    String? configurationAlias,
    ThirdPartyType? type,
    String? typeArn,
    String? typeName,
  }) async {
    final $request = <String, dynamic>{};
    $request['Configuration'] = configuration;
    configurationAlias?.also((arg) => $request['ConfigurationAlias'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeArn?.also((arg) => $request['TypeArn'] = arg);
    typeName?.also((arg) => $request['TypeName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SetTypeConfiguration',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetTypeConfigurationInput'],
      shapes: shapes,
      resultWrapper: 'SetTypeConfigurationResult',
    );
    return SetTypeConfigurationOutput.fromXml($result);
  }

  /// Specify the default version of an extension. The default version of an
  /// extension will be used in CloudFormation operations.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the extension for which you want version
  /// summary information.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [type] :
  /// The kind of extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension.
  ///
  /// Conditional: You must specify either <code>TypeName</code> and
  /// <code>Type</code>, or <code>Arn</code>.
  ///
  /// Parameter [versionId] :
  /// The ID of a specific version of the extension. The version ID is the value
  /// at the end of the Amazon Resource Name (ARN) assigned to the extension
  /// version when it is registered.
  Future<void> setTypeDefaultVersion({
    String? arn,
    RegistryType? type,
    String? typeName,
    String? versionId,
  }) async {
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
  /// You can use the <code>SignalResource</code> operation in conjunction with
  /// a creation policy or update policy. CloudFormation doesn't proceed with a
  /// stack creation or update until resources receive the required number of
  /// signals or the timeout period is exceeded. The <code>SignalResource</code>
  /// operation is useful in cases where you want to send signals from anywhere
  /// other than an Amazon EC2 instance.
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
  /// signal causes CloudFormation to immediately fail the stack creation or
  /// update.
  ///
  /// Parameter [uniqueId] :
  /// A unique ID of the signal. When you signal Amazon EC2 instances or Auto
  /// Scaling groups, specify the instance ID that you are signaling as the
  /// unique ID. If you send multiple signals to a single resource (such as
  /// signaling a wait condition), each signal requires a different unique ID.
  Future<void> signalResource({
    required String logicalResourceId,
    required String stackName,
    required ResourceSignalStatus status,
    required String uniqueId,
  }) async {
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

  /// Starts a scan of the resources in this account in this Region. You can the
  /// status of a scan using the <code>ListResourceScans</code> API action.
  ///
  /// May throw [ResourceScanInProgressException].
  /// May throw [ResourceScanLimitExceededException].
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>StartResourceScan</code> request.
  /// Specify this token if you plan to retry requests so that CloudFormation
  /// knows that you're not attempting to start a new resource scan.
  Future<StartResourceScanOutput> startResourceScan({
    String? clientRequestToken,
  }) async {
    final $request = <String, dynamic>{};
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'StartResourceScan',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartResourceScanInput'],
      shapes: shapes,
      resultWrapper: 'StartResourceScanResult',
    );
    return StartResourceScanOutput.fromXml($result);
  }

  /// Stops an in-progress operation on a stack set and its associated stack
  /// instances. StackSets will cancel all the unstarted stack instance
  /// deployments and wait for those are in-progress to complete.
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
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  Future<void> stopStackSetOperation({
    required String operationId,
    required String stackSetName,
    CallAs? callAs,
  }) async {
    final $request = <String, dynamic>{};
    $request['OperationId'] = operationId;
    $request['StackSetName'] = stackSetName;
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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

  /// Tests a registered extension to make sure it meets all necessary
  /// requirements for being published in the CloudFormation registry.
  ///
  /// <ul>
  /// <li>
  /// For resource types, this includes passing all contracts tests defined for
  /// the type.
  /// </li>
  /// <li>
  /// For modules, this includes determining if the module's model meets all
  /// necessary requirements.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-testing">Testing
  /// your public extension prior to publishing</a> in the <i>CloudFormation CLI
  /// User Guide</i>.
  ///
  /// If you don't specify a version, CloudFormation uses the default version of
  /// the extension in your account and Region for testing.
  ///
  /// To perform testing, CloudFormation assumes the execution role specified
  /// when the type was registered. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>.
  ///
  /// Once you've initiated testing on an extension using <code>TestType</code>,
  /// you can pass the returned <code>TypeVersionArn</code> into <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html">DescribeType</a>
  /// to monitor the current test status and test status description for the
  /// extension.
  ///
  /// An extension must have a test status of <code>PASSED</code> before it can
  /// be published. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-publish.html">Publishing
  /// extensions to make them available for public use</a> in the
  /// <i>CloudFormation CLI User Guide</i>.
  ///
  /// May throw [CFNRegistryException].
  /// May throw [TypeNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the extension.
  ///
  /// Conditional: You must specify <code>Arn</code>, or <code>TypeName</code>
  /// and <code>Type</code>.
  ///
  /// Parameter [logDeliveryBucket] :
  /// The S3 bucket to which CloudFormation delivers the contract test execution
  /// logs.
  ///
  /// CloudFormation delivers the logs by the time contract testing has
  /// completed and the extension has been assigned a test type status of
  /// <code>PASSED</code> or <code>FAILED</code>.
  ///
  /// The user calling <code>TestType</code> must be able to access items in the
  /// specified S3 bucket. Specifically, the user needs the following
  /// permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>GetObject</code>
  /// </li>
  /// <li>
  /// <code>PutObject</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazons3.html">Actions,
  /// Resources, and Condition Keys for Amazon S3</a> in the <i>Amazon Web
  /// Services Identity and Access Management User Guide</i>.
  ///
  /// Parameter [type] :
  /// The type of the extension to test.
  ///
  /// Conditional: You must specify <code>Arn</code>, or <code>TypeName</code>
  /// and <code>Type</code>.
  ///
  /// Parameter [typeName] :
  /// The name of the extension to test.
  ///
  /// Conditional: You must specify <code>Arn</code>, or <code>TypeName</code>
  /// and <code>Type</code>.
  ///
  /// Parameter [versionId] :
  /// The version of the extension to test.
  ///
  /// You can specify the version id with either <code>Arn</code>, or with
  /// <code>TypeName</code> and <code>Type</code>.
  ///
  /// If you don't specify a version, CloudFormation uses the default version of
  /// the extension in this account and Region for testing.
  Future<TestTypeOutput> testType({
    String? arn,
    String? logDeliveryBucket,
    ThirdPartyType? type,
    String? typeName,
    String? versionId,
  }) async {
    final $request = <String, dynamic>{};
    arn?.also((arg) => $request['Arn'] = arg);
    logDeliveryBucket?.also((arg) => $request['LogDeliveryBucket'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    typeName?.also((arg) => $request['TypeName'] = arg);
    versionId?.also((arg) => $request['VersionId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'TestType',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TestTypeInput'],
      shapes: shapes,
      resultWrapper: 'TestTypeResult',
    );
    return TestTypeOutput.fromXml($result);
  }

  /// Updates a generated template. This can be used to change the name, add and
  /// remove resources, refresh resources, and change the
  /// <code>DeletionPolicy</code> and <code>UpdateReplacePolicy</code> settings.
  /// You can check the status of the update to the generated template using the
  /// <code>DescribeGeneratedTemplate</code> API action.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [GeneratedTemplateNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [generatedTemplateName] :
  /// The name or Amazon Resource Name (ARN) of a generated template.
  ///
  /// Parameter [addResources] :
  /// An optional list of resources to be added to the generated template.
  ///
  /// Parameter [newGeneratedTemplateName] :
  /// An optional new name to assign to the generated template.
  ///
  /// Parameter [refreshAllResources] :
  /// If <code>true</code>, update the resource properties in the generated
  /// template with their current live state. This feature is useful when the
  /// resource properties in your generated a template does not reflect the live
  /// state of the resource properties. This happens when a user update the
  /// resource properties after generating a template.
  ///
  /// Parameter [removeResources] :
  /// A list of logical ids for resources to remove from the generated template.
  ///
  /// Parameter [templateConfiguration] :
  /// The configuration details of the generated template, including the
  /// <code>DeletionPolicy</code> and <code>UpdateReplacePolicy</code>.
  Future<UpdateGeneratedTemplateOutput> updateGeneratedTemplate({
    required String generatedTemplateName,
    List<ResourceDefinition>? addResources,
    String? newGeneratedTemplateName,
    bool? refreshAllResources,
    List<String>? removeResources,
    TemplateConfiguration? templateConfiguration,
  }) async {
    final $request = <String, dynamic>{};
    $request['GeneratedTemplateName'] = generatedTemplateName;
    addResources?.also((arg) => $request['AddResources'] = arg);
    newGeneratedTemplateName
        ?.also((arg) => $request['NewGeneratedTemplateName'] = arg);
    refreshAllResources?.also((arg) => $request['RefreshAllResources'] = arg);
    removeResources?.also((arg) => $request['RemoveResources'] = arg);
    templateConfiguration
        ?.also((arg) => $request['TemplateConfiguration'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateGeneratedTemplate',
      version: '2010-05-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateGeneratedTemplateInput'],
      shapes: shapes,
      resultWrapper: 'UpdateGeneratedTemplateResult',
    );
    return UpdateGeneratedTemplateOutput.fromXml($result);
  }

  /// Updates a stack as specified in the template. After the call completes
  /// successfully, the stack update starts. You can check the status of the
  /// stack through the <a>DescribeStacks</a> action.
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
  /// contains certain capabilities in order for CloudFormation to update the
  /// stack.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your Amazon Web Services account; for example, by creating new Identity
  /// and Access Management (IAM) users. For those stacks, you must explicitly
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
  /// If you don't specify either of these capabilities, CloudFormation returns
  /// an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we suggest that you
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">AWS::IAM::Policy</a>
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in CloudFormation Templates</a>.
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by CloudFormation.
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
  /// function operation without CloudFormation being notified.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// </li>
  /// </ul> <note>
  /// Only one of the <code>Capabilities</code> and <code>ResourceType</code>
  /// parameters can be specified.
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for this <code>UpdateStack</code> request. Specify
  /// this token if you plan to retry requests so that CloudFormation knows that
  /// you're not attempting to update a stack with the same name. You might
  /// retry <code>UpdateStack</code> requests to ensure that CloudFormation
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
  /// Preserve the state of previously provisioned resources when an operation
  /// fails.
  ///
  /// Default: <code>False</code>
  ///
  /// Parameter [notificationARNs] :
  /// Amazon Simple Notification Service topic Amazon Resource Names (ARNs) that
  /// CloudFormation associates with the stack. Specify an empty list to remove
  /// all notification topics.
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
  /// updating, the stack update fails. By default, CloudFormation grants
  /// permissions to all resource types. Identity and Access Management (IAM)
  /// uses this parameter for CloudFormation-specific condition keys in IAM
  /// policies. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling
  /// Access with Identity and Access Management</a>.
  /// <note>
  /// Only one of the <code>Capabilities</code> and <code>ResourceType</code>
  /// parameters can be specified.
  /// </note>
  ///
  /// Parameter [retainExceptOnCreate] :
  /// When set to <code>true</code>, newly created resources are deleted when
  /// the operation rolls back. This includes newly created resources marked
  /// with a deletion policy of <code>Retain</code>.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [roleARN] :
  /// The Amazon Resource Name (ARN) of an Identity and Access Management (IAM)
  /// role that CloudFormation assumes to update the stack. CloudFormation uses
  /// the role's credentials to make calls on your behalf. CloudFormation always
  /// uses this role for all future operations on the stack. Provided that users
  /// have permission to operate on the stack, CloudFormation uses this role
  /// even if the users don't have permission to pass it. Ensure that the role
  /// grants least privilege.
  ///
  /// If you don't specify a value, CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available,
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// Parameter [rollbackConfiguration] :
  /// The rollback triggers for CloudFormation to monitor during stack creation
  /// and updating operations, and for the specified monitoring period
  /// afterwards.
  ///
  /// Parameter [stackPolicyBody] :
  /// Structure containing a new stack policy body. You can specify either the
  /// <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter,
  /// but not both.
  ///
  /// You might update the stack policy, for example, in order to protect a new
  /// resource that you created during a stack update. If you don't specify a
  /// stack policy, the current policy that is associated with the stack is
  /// unchanged.
  ///
  /// Parameter [stackPolicyDuringUpdateBody] :
  /// Structure containing the temporary overriding stack policy body. You can
  /// specify either the <code>StackPolicyDuringUpdateBody</code> or the
  /// <code>StackPolicyDuringUpdateURL</code> parameter, but not both.
  ///
  /// If you want to update protected resources, specify a temporary overriding
  /// stack policy during this update. If you don't specify a stack policy, the
  /// current policy that is associated with the stack will be used.
  ///
  /// Parameter [stackPolicyDuringUpdateURL] :
  /// Location of a file containing the temporary overriding stack policy. The
  /// URL must point to a policy (max size: 16KB) located in an S3 bucket in the
  /// same Region as the stack. The location for an Amazon S3 bucket must start
  /// with <code>https://</code>. You can specify either the
  /// <code>StackPolicyDuringUpdateBody</code> or the
  /// <code>StackPolicyDuringUpdateURL</code> parameter, but not both.
  ///
  /// If you want to update protected resources, specify a temporary overriding
  /// stack policy during this update. If you don't specify a stack policy, the
  /// current policy that is associated with the stack will be used.
  ///
  /// Parameter [stackPolicyURL] :
  /// Location of a file containing the updated stack policy. The URL must point
  /// to a policy (max size: 16KB) located in an S3 bucket in the same Region as
  /// the stack. The location for an Amazon S3 bucket must start with
  /// <code>https://</code>. You can specify either the
  /// <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter,
  /// but not both.
  ///
  /// You might update the stack policy, for example, in order to protect a new
  /// resource that you created during a stack update. If you don't specify a
  /// stack policy, the current policy that is associated with the stack is
  /// unchanged.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with this stack. CloudFormation also
  /// propagates these tags to supported resources in the stack. You can specify
  /// a maximum number of 50 tags.
  ///
  /// If you don't specify this parameter, CloudFormation doesn't modify the
  /// stack's tags. If you specify an empty value, CloudFormation removes all
  /// associated tags.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.)
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code>, <code>TemplateURL</code>, or set the
  /// <code>UsePreviousTemplate</code> to <code>true</code>.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template that's located in an Amazon S3 bucket or a Systems Manager
  /// document. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>. The location for an
  /// Amazon S3 bucket must start with <code>https://</code>.
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
    required String stackName,
    List<Capability>? capabilities,
    String? clientRequestToken,
    bool? disableRollback,
    List<String>? notificationARNs,
    List<Parameter>? parameters,
    List<String>? resourceTypes,
    bool? retainExceptOnCreate,
    String? roleARN,
    RollbackConfiguration? rollbackConfiguration,
    String? stackPolicyBody,
    String? stackPolicyDuringUpdateBody,
    String? stackPolicyDuringUpdateURL,
    String? stackPolicyURL,
    List<Tag>? tags,
    String? templateBody,
    String? templateURL,
    bool? usePreviousTemplate,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackName'] = stackName;
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e.toValue()).toList());
    clientRequestToken?.also((arg) => $request['ClientRequestToken'] = arg);
    disableRollback?.also((arg) => $request['DisableRollback'] = arg);
    notificationARNs?.also((arg) => $request['NotificationARNs'] = arg);
    parameters?.also((arg) => $request['Parameters'] = arg);
    resourceTypes?.also((arg) => $request['ResourceTypes'] = arg);
    retainExceptOnCreate?.also((arg) => $request['RetainExceptOnCreate'] = arg);
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
  /// accounts, within the specified Amazon Web Services Regions. A stack
  /// instance refers to a stack in a specific account and Region.
  ///
  /// You can only update stack instances in Amazon Web Services Regions and
  /// accounts where they already exist; to create additional stack instances,
  /// use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html">CreateStackInstances</a>.
  ///
  /// During stack set updates, any parameters overridden for a stack instance
  /// aren't updated, but retain their overridden value.
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
  /// The names of one or more Amazon Web Services Regions in which you want to
  /// update parameter values for stack instances. The overridden parameter
  /// values will be applied to all stack instances in the specified accounts
  /// and Amazon Web Services Regions.
  ///
  /// Parameter [stackSetName] :
  /// The name or unique ID of the stack set associated with the stack
  /// instances.
  ///
  /// Parameter [accounts] :
  /// [Self-managed permissions] The names of one or more Amazon Web Services
  /// accounts for which you want to update parameter values for stack
  /// instances. The overridden parameter values will be applied to all stack
  /// instances in the specified accounts and Amazon Web Services Regions.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deploymentTargets] :
  /// [Service-managed permissions] The Organizations accounts for which you
  /// want to update parameter values for stack instances. If your update
  /// targets OUs, the overridden parameter values only apply to the accounts
  /// that are currently in the target OUs and their child OUs. Accounts added
  /// to the target OUs and their child OUs in the future won't use the
  /// overridden values.
  ///
  /// You can specify <code>Accounts</code> or <code>DeploymentTargets</code>,
  /// but not both.
  ///
  /// Parameter [operationId] :
  /// The unique identifier for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how CloudFormation performs this stack set operation.
  ///
  /// Parameter [parameterOverrides] :
  /// A list of input parameters whose values you want to update for the
  /// specified stack instances.
  ///
  /// Any overridden parameter values will be applied to all stack instances in
  /// the specified accounts and Amazon Web Services Regions. When specifying
  /// parameters and their values, be aware of how CloudFormation sets parameter
  /// values during stack instance update operations:
  ///
  /// <ul>
  /// <li>
  /// To override the current value for a parameter, include the parameter and
  /// specify its value.
  /// </li>
  /// <li>
  /// To leave an overridden parameter set to its present value, include the
  /// parameter and specify <code>UsePreviousValue</code> as <code>true</code>.
  /// (You can't specify both a value and set <code>UsePreviousValue</code> to
  /// <code>true</code>.)
  /// </li>
  /// <li>
  /// To set an overridden parameter back to the value specified in the stack
  /// set, specify a parameter list but don't include the parameter in the list.
  /// </li>
  /// <li>
  /// To leave all parameters set to their present values, don't specify this
  /// property at all.
  /// </li>
  /// </ul>
  /// During stack set updates, any parameter values overridden for a stack
  /// instance aren't updated, but retain their overridden value.
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
    required List<String> regions,
    required String stackSetName,
    List<String>? accounts,
    CallAs? callAs,
    DeploymentTargets? deploymentTargets,
    String? operationId,
    StackSetOperationPreferences? operationPreferences,
    List<Parameter>? parameterOverrides,
  }) async {
    final $request = <String, dynamic>{};
    $request['Regions'] = regions;
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
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
  /// accounts and Amazon Web Services Regions.
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
  /// [Self-managed permissions] The accounts in which to update associated
  /// stack instances. If you specify accounts, you must also specify the Amazon
  /// Web Services Regions in which to update stack set instances.
  ///
  /// To update <i>all</i> the stack instances associated with this stack set,
  /// don't specify the <code>Accounts</code> or <code>Regions</code>
  /// properties.
  ///
  /// If the stack set update includes changes to the template (that is, if the
  /// <code>TemplateBody</code> or <code>TemplateURL</code> properties are
  /// specified), or the <code>Parameters</code> property, CloudFormation marks
  /// all stack instances with a status of <code>OUTDATED</code> prior to
  /// updating the stack instances in the specified accounts and Amazon Web
  /// Services Regions. If the stack set update does not include changes to the
  /// template or parameters, CloudFormation updates the stack instances in the
  /// specified accounts and Amazon Web Services Regions, while leaving all
  /// other stack instances with their existing stack instance status.
  ///
  /// Parameter [administrationRoleARN] :
  /// The Amazon Resource Name (ARN) of the IAM role to use to update this stack
  /// set.
  ///
  /// Specify an IAM role only if you are using customized administrator roles
  /// to control which users or groups can manage specific stack sets within the
  /// same administrator account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Granting
  /// Permissions for Stack Set Operations</a> in the <i>CloudFormation User
  /// Guide</i>.
  ///
  /// If you specified a customized administrator role when you created the
  /// stack set, you must specify a customized administrator role, even if it is
  /// the same customized administrator role used with this stack set
  /// previously.
  ///
  /// Parameter [autoDeployment] :
  /// [Service-managed permissions] Describes whether StackSets automatically
  /// deploys to Organizations accounts that are added to a target organization
  /// or organizational unit (OU).
  ///
  /// If you specify <code>AutoDeployment</code>, don't specify
  /// <code>DeploymentTargets</code> or <code>Regions</code>.
  ///
  /// Parameter [callAs] :
  /// [Service-managed permissions] Specifies whether you are acting as an
  /// account administrator in the organization's management account or as a
  /// delegated administrator in a member account.
  ///
  /// By default, <code>SELF</code> is specified. Use <code>SELF</code> for
  /// stack sets with self-managed permissions.
  ///
  /// <ul>
  /// <li>
  /// If you are signed in to the management account, specify <code>SELF</code>.
  /// </li>
  /// <li>
  /// If you are signed in to a delegated administrator account, specify
  /// <code>DELEGATED_ADMIN</code>.
  ///
  /// Your Amazon Web Services account must be registered as a delegated
  /// administrator in the management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html">Register
  /// a delegated administrator</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [capabilities] :
  /// In some cases, you must explicitly acknowledge that your stack template
  /// contains certain capabilities in order for CloudFormation to update the
  /// stack set and its associated stack instances.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code>
  ///
  /// Some stack templates might include resources that can affect permissions
  /// in your Amazon Web Services account; for example, by creating new Identity
  /// and Access Management (IAM) users. For those stacks sets, you must
  /// explicitly acknowledge this by specifying one of these capabilities.
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
  /// If you don't specify either of these capabilities, CloudFormation returns
  /// an <code>InsufficientCapabilities</code> error.
  /// </li>
  /// </ul>
  /// If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html">AWS::IAM::AccessKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">AWS::IAM::Group</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html">AWS::IAM::Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">AWS::IAM::Role</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html">AWS::IAM::User</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html">AWS::IAM::UserToGroupAddition</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in CloudFormation Templates</a>.
  /// </li>
  /// <li>
  /// <code>CAPABILITY_AUTO_EXPAND</code>
  ///
  /// Some templates reference macros. If your stack set template references one
  /// or more macros, you must update the stack set directly from the processed
  /// template, without first reviewing the resulting changes in a change set.
  /// To update the stack set directly, you must acknowledge this capability.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using
  /// CloudFormation Macros to Perform Custom Processing on Templates</a>.
  /// <important>
  /// Stack sets with service-managed permissions do not currently support the
  /// use of macros in templates. (This includes the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a>
  /// transforms, which are macros hosted by CloudFormation.) Even if you
  /// specify this capability for a stack set with service-managed permissions,
  /// if you reference a macro in your template the stack set operation will
  /// fail.
  /// </important> </li>
  /// </ul>
  ///
  /// Parameter [deploymentTargets] :
  /// [Service-managed permissions] The Organizations accounts in which to
  /// update associated stack instances.
  ///
  /// To update all the stack instances associated with this stack set, do not
  /// specify <code>DeploymentTargets</code> or <code>Regions</code>.
  ///
  /// If the stack set update includes changes to the template (that is, if
  /// <code>TemplateBody</code> or <code>TemplateURL</code> is specified), or
  /// the <code>Parameters</code>, CloudFormation marks all stack instances with
  /// a status of <code>OUTDATED</code> prior to updating the stack instances in
  /// the specified accounts and Amazon Web Services Regions. If the stack set
  /// update doesn't include changes to the template or parameters,
  /// CloudFormation updates the stack instances in the specified accounts and
  /// Regions, while leaving all other stack instances with their existing stack
  /// instance status.
  ///
  /// Parameter [description] :
  /// A brief description of updates that you are making.
  ///
  /// Parameter [executionRoleName] :
  /// The name of the IAM execution role to use to update the stack set. If you
  /// do not specify an execution role, CloudFormation uses the
  /// <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set
  /// operation.
  ///
  /// Specify an IAM role only if you are using customized execution roles to
  /// control which stack resources users and groups can include in their stack
  /// sets.
  ///
  /// If you specify a customized execution role, CloudFormation uses that role
  /// to update the stack. If you do not specify a customized execution role,
  /// CloudFormation performs the update using the role previously associated
  /// with the stack set, so long as you have permissions to perform operations
  /// on the stack set.
  ///
  /// Parameter [managedExecution] :
  /// Describes whether StackSets performs non-conflicting operations
  /// concurrently and queues conflicting operations.
  ///
  /// Parameter [operationId] :
  /// The unique ID for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, CloudFormation generates one
  /// automatically.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is <code>OUTDATED</code>.
  ///
  /// Parameter [operationPreferences] :
  /// Preferences for how CloudFormation performs this stack set operation.
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
  /// creates the IAM roles required to deploy to accounts managed by
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [regions] :
  /// The Amazon Web Services Regions in which to update associated stack
  /// instances. If you specify Regions, you must also specify accounts in which
  /// to update stack set instances.
  ///
  /// To update <i>all</i> the stack instances associated with this stack set,
  /// do not specify the <code>Accounts</code> or <code>Regions</code>
  /// properties.
  ///
  /// If the stack set update includes changes to the template (that is, if the
  /// <code>TemplateBody</code> or <code>TemplateURL</code> properties are
  /// specified), or the <code>Parameters</code> property, CloudFormation marks
  /// all stack instances with a status of <code>OUTDATED</code> prior to
  /// updating the stack instances in the specified accounts and Regions. If the
  /// stack set update does not include changes to the template or parameters,
  /// CloudFormation updates the stack instances in the specified accounts and
  /// Regions, while leaving all other stack instances with their existing stack
  /// instance status.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with this stack set and the stacks
  /// created from it. CloudFormation also propagates these tags to supported
  /// resources that are created in the stacks. You can specify a maximum number
  /// of 50 tags.
  ///
  /// If you specify tags for this parameter, those tags replace any list of
  /// tags that are currently associated with this stack set. This means:
  ///
  /// <ul>
  /// <li>
  /// If you don't specify this parameter, CloudFormation doesn't modify the
  /// stack's tags.
  /// </li>
  /// <li>
  /// If you specify <i>any</i> tags using this parameter, you must specify
  /// <i>all</i> the tags that you want associated with this stack set, even
  /// tags you've specified before (for example, when creating the stack set or
  /// during a previous update of the stack set.). Any tags that you don't
  /// include in the updated list of tags are removed from the stack set, and
  /// therefore from the stacks and resources as well.
  /// </li>
  /// <li>
  /// If you specify an empty value, CloudFormation removes all currently
  /// associated tags.
  /// </li>
  /// </ul>
  /// If you specify new tags as part of an <code>UpdateStackSet</code> action,
  /// CloudFormation checks to see if you have the required IAM permission to
  /// tag resources. If you omit tags that are currently associated with the
  /// stack set from the list of tags you specify, CloudFormation assumes that
  /// you want to remove those tags from the stack set, and checks to see if you
  /// have permission to untag resources. If you don't have the necessary
  /// permission(s), the entire <code>UpdateStackSet</code> action fails with an
  /// <code>access denied</code> error, and the stack set is not updated.
  ///
  /// Parameter [templateBody] :
  /// The structure that contains the template body, with a minimum length of 1
  /// byte and a maximum length of 51,200 bytes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// <code>TemplateBody</code> or <code>TemplateURL</code>—or set
  /// <code>UsePreviousTemplate</code> to true.
  ///
  /// Parameter [templateURL] :
  /// The location of the file that contains the template body. The URL must
  /// point to a template (maximum size: 460,800 bytes) that is located in an
  /// Amazon S3 bucket or a Systems Manager document. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.
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
    required String stackSetName,
    List<String>? accounts,
    String? administrationRoleARN,
    AutoDeployment? autoDeployment,
    CallAs? callAs,
    List<Capability>? capabilities,
    DeploymentTargets? deploymentTargets,
    String? description,
    String? executionRoleName,
    ManagedExecution? managedExecution,
    String? operationId,
    StackSetOperationPreferences? operationPreferences,
    List<Parameter>? parameters,
    PermissionModels? permissionModel,
    List<String>? regions,
    List<Tag>? tags,
    String? templateBody,
    String? templateURL,
    bool? usePreviousTemplate,
  }) async {
    final $request = <String, dynamic>{};
    $request['StackSetName'] = stackSetName;
    accounts?.also((arg) => $request['Accounts'] = arg);
    administrationRoleARN
        ?.also((arg) => $request['AdministrationRoleARN'] = arg);
    autoDeployment?.also((arg) => $request['AutoDeployment'] = arg);
    callAs?.also((arg) => $request['CallAs'] = arg.toValue());
    capabilities?.also((arg) =>
        $request['Capabilities'] = arg.map((e) => e.toValue()).toList());
    deploymentTargets?.also((arg) => $request['DeploymentTargets'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    executionRoleName?.also((arg) => $request['ExecutionRoleName'] = arg);
    managedExecution?.also((arg) => $request['ManagedExecution'] = arg);
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
  /// a Stack From Being Deleted</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested
  /// stacks</a>, termination protection is set on the root stack and can't be
  /// changed directly on the nested stack.
  ///
  /// Parameter [enableTerminationProtection] :
  /// Whether to enable termination protection on the specified stack.
  ///
  /// Parameter [stackName] :
  /// The name or unique ID of the stack for which you want to set termination
  /// protection.
  Future<UpdateTerminationProtectionOutput> updateTerminationProtection({
    required bool enableTerminationProtection,
    required String stackName,
  }) async {
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

  /// Validates a specified template. CloudFormation first checks if the
  /// template is valid JSON. If it isn't, CloudFormation checks if the template
  /// is valid YAML. If both these checks fail, CloudFormation returns a
  /// template validation error.
  ///
  /// Parameter [templateBody] :
  /// Structure containing the template body with a minimum length of 1 byte and
  /// a maximum length of 51,200 bytes. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.
  ///
  /// Conditional: You must pass <code>TemplateURL</code> or
  /// <code>TemplateBody</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  ///
  /// Parameter [templateURL] :
  /// Location of file containing the template body. The URL must point to a
  /// template (max size: 460,800 bytes) that is located in an Amazon S3 bucket
  /// or a Systems Manager document. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>. The location for an
  /// Amazon S3 bucket must start with <code>https://</code>.
  ///
  /// Conditional: You must pass <code>TemplateURL</code> or
  /// <code>TemplateBody</code>. If both are passed, only
  /// <code>TemplateBody</code> is used.
  Future<ValidateTemplateOutput> validateTemplate({
    String? templateBody,
    String? templateURL,
  }) async {
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

enum AccountFilterType {
  none,
  intersection,
  difference,
  union,
}

extension AccountFilterTypeValueExtension on AccountFilterType {
  String toValue() {
    switch (this) {
      case AccountFilterType.none:
        return 'NONE';
      case AccountFilterType.intersection:
        return 'INTERSECTION';
      case AccountFilterType.difference:
        return 'DIFFERENCE';
      case AccountFilterType.union:
        return 'UNION';
    }
  }
}

extension AccountFilterTypeFromString on String {
  AccountFilterType toAccountFilterType() {
    switch (this) {
      case 'NONE':
        return AccountFilterType.none;
      case 'INTERSECTION':
        return AccountFilterType.intersection;
      case 'DIFFERENCE':
        return AccountFilterType.difference;
      case 'UNION':
        return AccountFilterType.union;
    }
    throw Exception('$this is not known in enum AccountFilterType');
  }
}

/// Structure that contains the results of the account gate function which
/// CloudFormation invokes, if present, before proceeding with a stack set
/// operation in an account and Region.
///
/// For each account and Region, CloudFormation lets you specify a Lambda
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
  /// occur. CloudFormation proceeds with the stack operation in that account and
  /// Region.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The account gate function has determined that the
  /// account and Region doesn't meet the requirements for a stack set operation
  /// to occur. CloudFormation cancels the stack set operation in that account and
  /// Region, and sets the stack set operation result status for that account and
  /// Region to <code>FAILED</code>.
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>: CloudFormation has skipped calling the account gate
  /// function for this account and Region, for one of the following reasons:
  ///
  /// <ul>
  /// <li>
  /// An account gate function hasn't been specified for the account and Region.
  /// CloudFormation proceeds with the stack set operation in this account and
  /// Region.
  /// </li>
  /// <li>
  /// The <code>AWSCloudFormationStackSetExecutionRole</code> of the stack set
  /// administration account lacks permissions to invoke the function.
  /// CloudFormation proceeds with the stack set operation in this account and
  /// Region.
  /// </li>
  /// <li>
  /// Either no action is necessary, or no action is possible, on the stack.
  /// CloudFormation skips the stack set operation in this account and Region.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final AccountGateStatus? status;

  /// The reason for the account gate status assigned to this account and Region
  /// for the stack set operation.
  final String? statusReason;

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

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum AccountGateStatus {
  succeeded,
  failed,
  skipped,
}

extension AccountGateStatusValueExtension on AccountGateStatus {
  String toValue() {
    switch (this) {
      case AccountGateStatus.succeeded:
        return 'SUCCEEDED';
      case AccountGateStatus.failed:
        return 'FAILED';
      case AccountGateStatus.skipped:
        return 'SKIPPED';
    }
  }
}

extension AccountGateStatusFromString on String {
  AccountGateStatus toAccountGateStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return AccountGateStatus.succeeded;
      case 'FAILED':
        return AccountGateStatus.failed;
      case 'SKIPPED':
        return AccountGateStatus.skipped;
    }
    throw Exception('$this is not known in enum AccountGateStatus');
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
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html">CloudFormation
/// quotas</a> in the <i>CloudFormation User Guide</i>.
class AccountLimit {
  /// The name of the account limit.
  ///
  /// Values: <code>ConcurrentResourcesLimit</code> | <code>StackLimit</code> |
  /// <code>StackOutputsLimit</code>
  final String? name;

  /// The value that's associated with the account limit name.
  final int? value;

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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

class ActivateOrganizationsAccessOutput {
  ActivateOrganizationsAccessOutput();
  factory ActivateOrganizationsAccessOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ActivateOrganizationsAccessOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ActivateTypeOutput {
  /// The Amazon Resource Name (ARN) of the activated extension, in this account
  /// and Region.
  final String? arn;

  ActivateTypeOutput({
    this.arn,
  });
  factory ActivateTypeOutput.fromXml(_s.XmlElement elem) {
    return ActivateTypeOutput(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

enum AttributeChangeType {
  add,
  remove,
  modify,
}

extension AttributeChangeTypeValueExtension on AttributeChangeType {
  String toValue() {
    switch (this) {
      case AttributeChangeType.add:
        return 'Add';
      case AttributeChangeType.remove:
        return 'Remove';
      case AttributeChangeType.modify:
        return 'Modify';
    }
  }
}

extension AttributeChangeTypeFromString on String {
  AttributeChangeType toAttributeChangeType() {
    switch (this) {
      case 'Add':
        return AttributeChangeType.add;
      case 'Remove':
        return AttributeChangeType.remove;
      case 'Modify':
        return AttributeChangeType.modify;
    }
    throw Exception('$this is not known in enum AttributeChangeType');
  }
}

/// [Service-managed permissions] Describes whether StackSets automatically
/// deploys to Organizations accounts that are added to a target organization or
/// organizational unit (OU).
class AutoDeployment {
  /// If set to <code>true</code>, StackSets automatically deploys additional
  /// stack instances to Organizations accounts that are added to a target
  /// organization or organizational unit (OU) in the specified Regions. If an
  /// account is removed from a target organization or OU, StackSets deletes stack
  /// instances from the account in the specified Regions.
  final bool? enabled;

  /// If set to <code>true</code>, stack resources are retained when an account is
  /// removed from a target organization or OU. If set to <code>false</code>,
  /// stack resources are deleted. Specify only if <code>Enabled</code> is set to
  /// <code>True</code>.
  final bool? retainStacksOnAccountRemoval;

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

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final retainStacksOnAccountRemoval = this.retainStacksOnAccountRemoval;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (retainStacksOnAccountRemoval != null)
        'RetainStacksOnAccountRemoval': retainStacksOnAccountRemoval,
    };
  }
}

/// Detailed information concerning an error generated during the setting of
/// configuration data for a CloudFormation extension.
class BatchDescribeTypeConfigurationsError {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? errorMessage;

  /// Identifying information for the configuration of a CloudFormation extension.
  final TypeConfigurationIdentifier? typeConfigurationIdentifier;

  BatchDescribeTypeConfigurationsError({
    this.errorCode,
    this.errorMessage,
    this.typeConfigurationIdentifier,
  });
  factory BatchDescribeTypeConfigurationsError.fromXml(_s.XmlElement elem) {
    return BatchDescribeTypeConfigurationsError(
      errorCode: _s.extractXmlStringValue(elem, 'ErrorCode'),
      errorMessage: _s.extractXmlStringValue(elem, 'ErrorMessage'),
      typeConfigurationIdentifier: _s
          .extractXmlChild(elem, 'TypeConfigurationIdentifier')
          ?.let(TypeConfigurationIdentifier.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final typeConfigurationIdentifier = this.typeConfigurationIdentifier;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (typeConfigurationIdentifier != null)
        'TypeConfigurationIdentifier': typeConfigurationIdentifier,
    };
  }
}

class BatchDescribeTypeConfigurationsOutput {
  /// A list of information concerning any errors generated during the setting of
  /// the specified configurations.
  final List<BatchDescribeTypeConfigurationsError>? errors;

  /// A list of any of the specified extension configurations from the
  /// CloudFormation registry.
  final List<TypeConfigurationDetails>? typeConfigurations;

  /// A list of any of the specified extension configurations that CloudFormation
  /// could not process for any reason.
  final List<TypeConfigurationIdentifier>? unprocessedTypeConfigurations;

  BatchDescribeTypeConfigurationsOutput({
    this.errors,
    this.typeConfigurations,
    this.unprocessedTypeConfigurations,
  });
  factory BatchDescribeTypeConfigurationsOutput.fromXml(_s.XmlElement elem) {
    return BatchDescribeTypeConfigurationsOutput(
      errors: _s.extractXmlChild(elem, 'Errors')?.let((elem) => elem
          .findElements('member')
          .map(BatchDescribeTypeConfigurationsError.fromXml)
          .toList()),
      typeConfigurations: _s.extractXmlChild(elem, 'TypeConfigurations')?.let(
          (elem) => elem
              .findElements('member')
              .map(TypeConfigurationDetails.fromXml)
              .toList()),
      unprocessedTypeConfigurations: _s
          .extractXmlChild(elem, 'UnprocessedTypeConfigurations')
          ?.let((elem) => elem
              .findElements('member')
              .map(TypeConfigurationIdentifier.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final typeConfigurations = this.typeConfigurations;
    final unprocessedTypeConfigurations = this.unprocessedTypeConfigurations;
    return {
      if (errors != null) 'Errors': errors,
      if (typeConfigurations != null) 'TypeConfigurations': typeConfigurations,
      if (unprocessedTypeConfigurations != null)
        'UnprocessedTypeConfigurations': unprocessedTypeConfigurations,
    };
  }
}

enum CallAs {
  self,
  delegatedAdmin,
}

extension CallAsValueExtension on CallAs {
  String toValue() {
    switch (this) {
      case CallAs.self:
        return 'SELF';
      case CallAs.delegatedAdmin:
        return 'DELEGATED_ADMIN';
    }
  }
}

extension CallAsFromString on String {
  CallAs toCallAs() {
    switch (this) {
      case 'SELF':
        return CallAs.self;
      case 'DELEGATED_ADMIN':
        return CallAs.delegatedAdmin;
    }
    throw Exception('$this is not known in enum CallAs');
  }
}

enum Capability {
  capabilityIam,
  capabilityNamedIam,
  capabilityAutoExpand,
}

extension CapabilityValueExtension on Capability {
  String toValue() {
    switch (this) {
      case Capability.capabilityIam:
        return 'CAPABILITY_IAM';
      case Capability.capabilityNamedIam:
        return 'CAPABILITY_NAMED_IAM';
      case Capability.capabilityAutoExpand:
        return 'CAPABILITY_AUTO_EXPAND';
    }
  }
}

extension CapabilityFromString on String {
  Capability toCapability() {
    switch (this) {
      case 'CAPABILITY_IAM':
        return Capability.capabilityIam;
      case 'CAPABILITY_NAMED_IAM':
        return Capability.capabilityNamedIam;
      case 'CAPABILITY_AUTO_EXPAND':
        return Capability.capabilityAutoExpand;
    }
    throw Exception('$this is not known in enum Capability');
  }
}

enum Category {
  registered,
  activated,
  thirdParty,
  awsTypes,
}

extension CategoryValueExtension on Category {
  String toValue() {
    switch (this) {
      case Category.registered:
        return 'REGISTERED';
      case Category.activated:
        return 'ACTIVATED';
      case Category.thirdParty:
        return 'THIRD_PARTY';
      case Category.awsTypes:
        return 'AWS_TYPES';
    }
  }
}

extension CategoryFromString on String {
  Category toCategory() {
    switch (this) {
      case 'REGISTERED':
        return Category.registered;
      case 'ACTIVATED':
        return Category.activated;
      case 'THIRD_PARTY':
        return Category.thirdParty;
      case 'AWS_TYPES':
        return Category.awsTypes;
    }
    throw Exception('$this is not known in enum Category');
  }
}

/// The <code>Change</code> structure describes the changes CloudFormation will
/// perform if you execute the change set.
class Change {
  /// Is either <code>null</code>, if no hooks invoke for the resource, or
  /// contains the number of hooks that will invoke for the resource.
  final int? hookInvocationCount;

  /// A <code>ResourceChange</code> structure that describes the resource and
  /// action that CloudFormation will perform.
  final ResourceChange? resourceChange;

  /// The type of entity that CloudFormation changes.
  ///
  /// <ul>
  /// <li>
  /// <code>Resource</code> This change is for a resource.
  /// </li>
  /// </ul>
  final ChangeType? type;

  Change({
    this.hookInvocationCount,
    this.resourceChange,
    this.type,
  });
  factory Change.fromXml(_s.XmlElement elem) {
    return Change(
      hookInvocationCount: _s.extractXmlIntValue(elem, 'HookInvocationCount'),
      resourceChange: _s
          .extractXmlChild(elem, 'ResourceChange')
          ?.let(ResourceChange.fromXml),
      type: _s.extractXmlStringValue(elem, 'Type')?.toChangeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final hookInvocationCount = this.hookInvocationCount;
    final resourceChange = this.resourceChange;
    final type = this.type;
    return {
      if (hookInvocationCount != null)
        'HookInvocationCount': hookInvocationCount,
      if (resourceChange != null) 'ResourceChange': resourceChange,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ChangeAction {
  add,
  modify,
  remove,
  import,
  $dynamic,
}

extension ChangeActionValueExtension on ChangeAction {
  String toValue() {
    switch (this) {
      case ChangeAction.add:
        return 'Add';
      case ChangeAction.modify:
        return 'Modify';
      case ChangeAction.remove:
        return 'Remove';
      case ChangeAction.import:
        return 'Import';
      case ChangeAction.$dynamic:
        return 'Dynamic';
    }
  }
}

extension ChangeActionFromString on String {
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
        return ChangeAction.$dynamic;
    }
    throw Exception('$this is not known in enum ChangeAction');
  }
}

/// Specifies the resource, the hook, and the hook version to be invoked.
class ChangeSetHook {
  /// Specify the hook failure mode for non-compliant resources in the followings
  /// ways.
  ///
  /// <ul>
  /// <li>
  /// <code>FAIL</code> Stops provisioning resources.
  /// </li>
  /// <li>
  /// <code>WARN</code> Allows provisioning to continue with a warning message.
  /// </li>
  /// </ul>
  final HookFailureMode? failureMode;

  /// Specifies the points in provisioning logic where a hook is invoked.
  final HookInvocationPoint? invocationPoint;

  /// Specifies details about the target that the hook will run against.
  final ChangeSetHookTargetDetails? targetDetails;

  /// The version ID of the type configuration.
  final String? typeConfigurationVersionId;

  /// The unique name for your hook. Specifies a three-part namespace for your
  /// hook, with a recommended pattern of
  /// <code>Organization::Service::Hook</code>.
  /// <note>
  /// The following organization namespaces are reserved and can't be used in your
  /// hook type names:
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
  /// <code>ASK</code>
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
  final String? typeName;

  /// The version ID of the type specified.
  final String? typeVersionId;

  ChangeSetHook({
    this.failureMode,
    this.invocationPoint,
    this.targetDetails,
    this.typeConfigurationVersionId,
    this.typeName,
    this.typeVersionId,
  });
  factory ChangeSetHook.fromXml(_s.XmlElement elem) {
    return ChangeSetHook(
      failureMode:
          _s.extractXmlStringValue(elem, 'FailureMode')?.toHookFailureMode(),
      invocationPoint: _s
          .extractXmlStringValue(elem, 'InvocationPoint')
          ?.toHookInvocationPoint(),
      targetDetails: _s
          .extractXmlChild(elem, 'TargetDetails')
          ?.let(ChangeSetHookTargetDetails.fromXml),
      typeConfigurationVersionId:
          _s.extractXmlStringValue(elem, 'TypeConfigurationVersionId'),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
      typeVersionId: _s.extractXmlStringValue(elem, 'TypeVersionId'),
    );
  }

  Map<String, dynamic> toJson() {
    final failureMode = this.failureMode;
    final invocationPoint = this.invocationPoint;
    final targetDetails = this.targetDetails;
    final typeConfigurationVersionId = this.typeConfigurationVersionId;
    final typeName = this.typeName;
    final typeVersionId = this.typeVersionId;
    return {
      if (failureMode != null) 'FailureMode': failureMode.toValue(),
      if (invocationPoint != null) 'InvocationPoint': invocationPoint.toValue(),
      if (targetDetails != null) 'TargetDetails': targetDetails,
      if (typeConfigurationVersionId != null)
        'TypeConfigurationVersionId': typeConfigurationVersionId,
      if (typeName != null) 'TypeName': typeName,
      if (typeVersionId != null) 'TypeVersionId': typeVersionId,
    };
  }
}

/// Specifies <code>RESOURCE</code> type target details for activated hooks.
class ChangeSetHookResourceTargetDetails {
  /// The resource's logical ID, which is defined in the stack's template.
  final String? logicalResourceId;

  /// Specifies the action of the resource.
  final ChangeAction? resourceAction;

  /// The type of CloudFormation resource, such as <code>AWS::S3::Bucket</code>.
  final String? resourceType;

  ChangeSetHookResourceTargetDetails({
    this.logicalResourceId,
    this.resourceAction,
    this.resourceType,
  });
  factory ChangeSetHookResourceTargetDetails.fromXml(_s.XmlElement elem) {
    return ChangeSetHookResourceTargetDetails(
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      resourceAction:
          _s.extractXmlStringValue(elem, 'ResourceAction')?.toChangeAction(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final resourceAction = this.resourceAction;
    final resourceType = this.resourceType;
    return {
      if (logicalResourceId != null) 'LogicalResourceId': logicalResourceId,
      if (resourceAction != null) 'ResourceAction': resourceAction.toValue(),
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// Specifies target details for an activated hook.
class ChangeSetHookTargetDetails {
  /// Required if <code>TargetType</code> is <code>RESOURCE</code>.
  final ChangeSetHookResourceTargetDetails? resourceTargetDetails;

  /// The name of the type.
  final HookTargetType? targetType;

  ChangeSetHookTargetDetails({
    this.resourceTargetDetails,
    this.targetType,
  });
  factory ChangeSetHookTargetDetails.fromXml(_s.XmlElement elem) {
    return ChangeSetHookTargetDetails(
      resourceTargetDetails: _s
          .extractXmlChild(elem, 'ResourceTargetDetails')
          ?.let(ChangeSetHookResourceTargetDetails.fromXml),
      targetType:
          _s.extractXmlStringValue(elem, 'TargetType')?.toHookTargetType(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTargetDetails = this.resourceTargetDetails;
    final targetType = this.targetType;
    return {
      if (resourceTargetDetails != null)
        'ResourceTargetDetails': resourceTargetDetails,
      if (targetType != null) 'TargetType': targetType.toValue(),
    };
  }
}

enum ChangeSetHooksStatus {
  planning,
  planned,
  unavailable,
}

extension ChangeSetHooksStatusValueExtension on ChangeSetHooksStatus {
  String toValue() {
    switch (this) {
      case ChangeSetHooksStatus.planning:
        return 'PLANNING';
      case ChangeSetHooksStatus.planned:
        return 'PLANNED';
      case ChangeSetHooksStatus.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension ChangeSetHooksStatusFromString on String {
  ChangeSetHooksStatus toChangeSetHooksStatus() {
    switch (this) {
      case 'PLANNING':
        return ChangeSetHooksStatus.planning;
      case 'PLANNED':
        return ChangeSetHooksStatus.planned;
      case 'UNAVAILABLE':
        return ChangeSetHooksStatus.unavailable;
    }
    throw Exception('$this is not known in enum ChangeSetHooksStatus');
  }
}

enum ChangeSetStatus {
  createPending,
  createInProgress,
  createComplete,
  deletePending,
  deleteInProgress,
  deleteComplete,
  deleteFailed,
  failed,
}

extension ChangeSetStatusValueExtension on ChangeSetStatus {
  String toValue() {
    switch (this) {
      case ChangeSetStatus.createPending:
        return 'CREATE_PENDING';
      case ChangeSetStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ChangeSetStatus.createComplete:
        return 'CREATE_COMPLETE';
      case ChangeSetStatus.deletePending:
        return 'DELETE_PENDING';
      case ChangeSetStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ChangeSetStatus.deleteComplete:
        return 'DELETE_COMPLETE';
      case ChangeSetStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ChangeSetStatus.failed:
        return 'FAILED';
    }
  }
}

extension ChangeSetStatusFromString on String {
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
    throw Exception('$this is not known in enum ChangeSetStatus');
  }
}

/// The <code>ChangeSetSummary</code> structure describes a change set, its
/// status, and the stack with which it's associated.
class ChangeSetSummary {
  /// The ID of the change set.
  final String? changeSetId;

  /// The name of the change set.
  final String? changeSetName;

  /// The start time when the change set was created, in UTC.
  final DateTime? creationTime;

  /// Descriptive information about the change set.
  final String? description;

  /// If the change set execution status is <code>AVAILABLE</code>, you can
  /// execute the change set. If you can't execute the change set, the status
  /// indicates why. For example, a change set might be in an
  /// <code>UNAVAILABLE</code> state because CloudFormation is still creating it
  /// or in an <code>OBSOLETE</code> state because the stack was already updated.
  final ExecutionStatus? executionStatus;

  /// Indicates if the change set imports resources that already exist.
  final bool? importExistingResources;

  /// Specifies the current setting of <code>IncludeNestedStacks</code> for the
  /// change set.
  final bool? includeNestedStacks;

  /// The parent change set ID.
  final String? parentChangeSetId;

  /// The root change set ID.
  final String? rootChangeSetId;

  /// The ID of the stack with which the change set is associated.
  final String? stackId;

  /// The name of the stack with which the change set is associated.
  final String? stackName;

  /// The state of the change set, such as <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_COMPLETE</code>, or <code>FAILED</code>.
  final ChangeSetStatus? status;

  /// A description of the change set's status. For example, if your change set is
  /// in the <code>FAILED</code> state, CloudFormation shows the error message.
  final String? statusReason;

  ChangeSetSummary({
    this.changeSetId,
    this.changeSetName,
    this.creationTime,
    this.description,
    this.executionStatus,
    this.importExistingResources,
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
      importExistingResources:
          _s.extractXmlBoolValue(elem, 'ImportExistingResources'),
      includeNestedStacks: _s.extractXmlBoolValue(elem, 'IncludeNestedStacks'),
      parentChangeSetId: _s.extractXmlStringValue(elem, 'ParentChangeSetId'),
      rootChangeSetId: _s.extractXmlStringValue(elem, 'RootChangeSetId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toChangeSetStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final changeSetId = this.changeSetId;
    final changeSetName = this.changeSetName;
    final creationTime = this.creationTime;
    final description = this.description;
    final executionStatus = this.executionStatus;
    final importExistingResources = this.importExistingResources;
    final includeNestedStacks = this.includeNestedStacks;
    final parentChangeSetId = this.parentChangeSetId;
    final rootChangeSetId = this.rootChangeSetId;
    final stackId = this.stackId;
    final stackName = this.stackName;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (description != null) 'Description': description,
      if (executionStatus != null) 'ExecutionStatus': executionStatus.toValue(),
      if (importExistingResources != null)
        'ImportExistingResources': importExistingResources,
      if (includeNestedStacks != null)
        'IncludeNestedStacks': includeNestedStacks,
      if (parentChangeSetId != null) 'ParentChangeSetId': parentChangeSetId,
      if (rootChangeSetId != null) 'RootChangeSetId': rootChangeSetId,
      if (stackId != null) 'StackId': stackId,
      if (stackName != null) 'StackName': stackName,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum ChangeSetType {
  create,
  update,
  import,
}

extension ChangeSetTypeValueExtension on ChangeSetType {
  String toValue() {
    switch (this) {
      case ChangeSetType.create:
        return 'CREATE';
      case ChangeSetType.update:
        return 'UPDATE';
      case ChangeSetType.import:
        return 'IMPORT';
    }
  }
}

extension ChangeSetTypeFromString on String {
  ChangeSetType toChangeSetType() {
    switch (this) {
      case 'CREATE':
        return ChangeSetType.create;
      case 'UPDATE':
        return ChangeSetType.update;
      case 'IMPORT':
        return ChangeSetType.import;
    }
    throw Exception('$this is not known in enum ChangeSetType');
  }
}

enum ChangeSource {
  resourceReference,
  parameterReference,
  resourceAttribute,
  directModification,
  automatic,
}

extension ChangeSourceValueExtension on ChangeSource {
  String toValue() {
    switch (this) {
      case ChangeSource.resourceReference:
        return 'ResourceReference';
      case ChangeSource.parameterReference:
        return 'ParameterReference';
      case ChangeSource.resourceAttribute:
        return 'ResourceAttribute';
      case ChangeSource.directModification:
        return 'DirectModification';
      case ChangeSource.automatic:
        return 'Automatic';
    }
  }
}

extension ChangeSourceFromString on String {
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
    throw Exception('$this is not known in enum ChangeSource');
  }
}

enum ChangeType {
  resource,
}

extension ChangeTypeValueExtension on ChangeType {
  String toValue() {
    switch (this) {
      case ChangeType.resource:
        return 'Resource';
    }
  }
}

extension ChangeTypeFromString on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'Resource':
        return ChangeType.resource;
    }
    throw Exception('$this is not known in enum ChangeType');
  }
}

enum ConcurrencyMode {
  strictFailureTolerance,
  softFailureTolerance,
}

extension ConcurrencyModeValueExtension on ConcurrencyMode {
  String toValue() {
    switch (this) {
      case ConcurrencyMode.strictFailureTolerance:
        return 'STRICT_FAILURE_TOLERANCE';
      case ConcurrencyMode.softFailureTolerance:
        return 'SOFT_FAILURE_TOLERANCE';
    }
  }
}

extension ConcurrencyModeFromString on String {
  ConcurrencyMode toConcurrencyMode() {
    switch (this) {
      case 'STRICT_FAILURE_TOLERANCE':
        return ConcurrencyMode.strictFailureTolerance;
      case 'SOFT_FAILURE_TOLERANCE':
        return ConcurrencyMode.softFailureTolerance;
    }
    throw Exception('$this is not known in enum ConcurrencyMode');
  }
}

/// The output for a <a>ContinueUpdateRollback</a> operation.
class ContinueUpdateRollbackOutput {
  ContinueUpdateRollbackOutput();
  factory ContinueUpdateRollbackOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ContinueUpdateRollbackOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The output for the <a>CreateChangeSet</a> action.
class CreateChangeSetOutput {
  /// The Amazon Resource Name (ARN) of the change set.
  final String? id;

  /// The unique ID of the stack.
  final String? stackId;

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

  Map<String, dynamic> toJson() {
    final id = this.id;
    final stackId = this.stackId;
    return {
      if (id != null) 'Id': id,
      if (stackId != null) 'StackId': stackId,
    };
  }
}

class CreateGeneratedTemplateOutput {
  /// The ID of the generated template.
  final String? generatedTemplateId;

  CreateGeneratedTemplateOutput({
    this.generatedTemplateId,
  });
  factory CreateGeneratedTemplateOutput.fromXml(_s.XmlElement elem) {
    return CreateGeneratedTemplateOutput(
      generatedTemplateId:
          _s.extractXmlStringValue(elem, 'GeneratedTemplateId'),
    );
  }

  Map<String, dynamic> toJson() {
    final generatedTemplateId = this.generatedTemplateId;
    return {
      if (generatedTemplateId != null)
        'GeneratedTemplateId': generatedTemplateId,
    };
  }
}

class CreateStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String? operationId;

  CreateStackInstancesOutput({
    this.operationId,
  });
  factory CreateStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return CreateStackInstancesOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

/// The output for a <a>CreateStack</a> action.
class CreateStackOutput {
  /// Unique identifier of the stack.
  final String? stackId;

  CreateStackOutput({
    this.stackId,
  });
  factory CreateStackOutput.fromXml(_s.XmlElement elem) {
    return CreateStackOutput(
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    return {
      if (stackId != null) 'StackId': stackId,
    };
  }
}

class CreateStackSetOutput {
  /// The ID of the stack set that you're creating.
  final String? stackSetId;

  CreateStackSetOutput({
    this.stackSetId,
  });
  factory CreateStackSetOutput.fromXml(_s.XmlElement elem) {
    return CreateStackSetOutput(
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackSetId = this.stackSetId;
    return {
      if (stackSetId != null) 'StackSetId': stackSetId,
    };
  }
}

class DeactivateOrganizationsAccessOutput {
  DeactivateOrganizationsAccessOutput();
  factory DeactivateOrganizationsAccessOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeactivateOrganizationsAccessOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeactivateTypeOutput {
  DeactivateTypeOutput();
  factory DeactivateTypeOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeactivateTypeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String? operationId;

  DeleteStackInstancesOutput({
    this.operationId,
  });
  factory DeleteStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return DeleteStackInstancesOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class DeleteStackSetOutput {
  DeleteStackSetOutput();
  factory DeleteStackSetOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteStackSetOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DeletionMode {
  standard,
  forceDeleteStack,
}

extension DeletionModeValueExtension on DeletionMode {
  String toValue() {
    switch (this) {
      case DeletionMode.standard:
        return 'STANDARD';
      case DeletionMode.forceDeleteStack:
        return 'FORCE_DELETE_STACK';
    }
  }
}

extension DeletionModeFromString on String {
  DeletionMode toDeletionMode() {
    switch (this) {
      case 'STANDARD':
        return DeletionMode.standard;
      case 'FORCE_DELETE_STACK':
        return DeletionMode.forceDeleteStack;
    }
    throw Exception('$this is not known in enum DeletionMode');
  }
}

/// [Service-managed permissions] The Organizations accounts to which StackSets
/// deploys. StackSets doesn't deploy stack instances to the organization
/// management account, even if the organization management account is in your
/// organization or in an OU in your organization.
///
/// For update operations, you can specify either <code>Accounts</code> or
/// <code>OrganizationalUnitIds</code>. For create and delete operations,
/// specify <code>OrganizationalUnitIds</code>.
class DeploymentTargets {
  /// Limit deployment targets to individual accounts or include additional
  /// accounts with provided OUs.
  ///
  /// The following is a list of possible values for the
  /// <code>AccountFilterType</code> operation.
  ///
  /// <ul>
  /// <li>
  /// <code>INTERSECTION</code>: StackSets deploys to the accounts specified in
  /// <code>Accounts</code> parameter.
  /// </li>
  /// <li>
  /// <code>DIFFERENCE</code>: StackSets excludes the accounts specified in
  /// <code>Accounts</code> parameter. This enables user to avoid certain accounts
  /// within an OU such as suspended accounts.
  /// </li>
  /// <li>
  /// <code>UNION</code>: StackSets includes additional accounts deployment
  /// targets.
  ///
  /// This is the default value if <code>AccountFilterType</code> is not provided.
  /// This enables user to update an entire OU and individual accounts from a
  /// different OU in one request, which used to be two separate requests.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Deploys to all the accounts in specified organizational
  /// units (OU).
  /// </li>
  /// </ul>
  final AccountFilterType? accountFilterType;

  /// The names of one or more Amazon Web Services accounts for which you want to
  /// deploy stack set updates.
  final List<String>? accounts;

  /// Returns the value of the <code>AccountsUrl</code> property.
  final String? accountsUrl;

  /// The organization root ID or organizational unit (OU) IDs to which StackSets
  /// deploys.
  final List<String>? organizationalUnitIds;

  DeploymentTargets({
    this.accountFilterType,
    this.accounts,
    this.accountsUrl,
    this.organizationalUnitIds,
  });
  factory DeploymentTargets.fromXml(_s.XmlElement elem) {
    return DeploymentTargets(
      accountFilterType: _s
          .extractXmlStringValue(elem, 'AccountFilterType')
          ?.toAccountFilterType(),
      accounts: _s
          .extractXmlChild(elem, 'Accounts')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      accountsUrl: _s.extractXmlStringValue(elem, 'AccountsUrl'),
      organizationalUnitIds: _s
          .extractXmlChild(elem, 'OrganizationalUnitIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final accountFilterType = this.accountFilterType;
    final accounts = this.accounts;
    final accountsUrl = this.accountsUrl;
    final organizationalUnitIds = this.organizationalUnitIds;
    return {
      if (accountFilterType != null)
        'AccountFilterType': accountFilterType.toValue(),
      if (accounts != null) 'Accounts': accounts,
      if (accountsUrl != null) 'AccountsUrl': accountsUrl,
      if (organizationalUnitIds != null)
        'OrganizationalUnitIds': organizationalUnitIds,
    };
  }
}

enum DeprecatedStatus {
  live,
  deprecated,
}

extension DeprecatedStatusValueExtension on DeprecatedStatus {
  String toValue() {
    switch (this) {
      case DeprecatedStatus.live:
        return 'LIVE';
      case DeprecatedStatus.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension DeprecatedStatusFromString on String {
  DeprecatedStatus toDeprecatedStatus() {
    switch (this) {
      case 'LIVE':
        return DeprecatedStatus.live;
      case 'DEPRECATED':
        return DeprecatedStatus.deprecated;
    }
    throw Exception('$this is not known in enum DeprecatedStatus');
  }
}

class DeregisterTypeOutput {
  DeregisterTypeOutput();
  factory DeregisterTypeOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeregisterTypeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The output for the <a>DescribeAccountLimits</a> action.
class DescribeAccountLimitsOutput {
  /// An account limit structure that contain a list of CloudFormation account
  /// limits and their values.
  final List<AccountLimit>? accountLimits;

  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of limits. If no additional page exists, this value is null.
  final String? nextToken;

  DescribeAccountLimitsOutput({
    this.accountLimits,
    this.nextToken,
  });
  factory DescribeAccountLimitsOutput.fromXml(_s.XmlElement elem) {
    return DescribeAccountLimitsOutput(
      accountLimits: _s.extractXmlChild(elem, 'AccountLimits')?.let((elem) =>
          elem.findElements('member').map(AccountLimit.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final accountLimits = this.accountLimits;
    final nextToken = this.nextToken;
    return {
      if (accountLimits != null) 'AccountLimits': accountLimits,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeChangeSetHooksOutput {
  /// The change set identifier (stack ID).
  final String? changeSetId;

  /// The change set name.
  final String? changeSetName;

  /// List of hook objects.
  final List<ChangeSetHook>? hooks;

  /// Pagination token, <code>null</code> or empty if no more results.
  final String? nextToken;

  /// The stack identifier (stack ID).
  final String? stackId;

  /// The stack name.
  final String? stackName;

  /// Provides the status of the change set hook.
  final ChangeSetHooksStatus? status;

  DescribeChangeSetHooksOutput({
    this.changeSetId,
    this.changeSetName,
    this.hooks,
    this.nextToken,
    this.stackId,
    this.stackName,
    this.status,
  });
  factory DescribeChangeSetHooksOutput.fromXml(_s.XmlElement elem) {
    return DescribeChangeSetHooksOutput(
      changeSetId: _s.extractXmlStringValue(elem, 'ChangeSetId'),
      changeSetName: _s.extractXmlStringValue(elem, 'ChangeSetName'),
      hooks: _s.extractXmlChild(elem, 'Hooks')?.let((elem) =>
          elem.findElements('member').map(ChangeSetHook.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toChangeSetHooksStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeSetId = this.changeSetId;
    final changeSetName = this.changeSetName;
    final hooks = this.hooks;
    final nextToken = this.nextToken;
    final stackId = this.stackId;
    final stackName = this.stackName;
    final status = this.status;
    return {
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (hooks != null) 'Hooks': hooks,
      if (nextToken != null) 'NextToken': nextToken,
      if (stackId != null) 'StackId': stackId,
      if (stackName != null) 'StackName': stackName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The output for the <a>DescribeChangeSet</a> action.
class DescribeChangeSetOutput {
  /// If you execute the change set, the list of capabilities that were explicitly
  /// acknowledged when the change set was created.
  final List<Capability>? capabilities;

  /// The Amazon Resource Name (ARN) of the change set.
  final String? changeSetId;

  /// The name of the change set.
  final String? changeSetName;

  /// A list of <code>Change</code> structures that describes the resources
  /// CloudFormation changes if you execute the change set.
  final List<Change>? changes;

  /// The start time when the change set was created, in UTC.
  final DateTime? creationTime;

  /// Information about the change set.
  final String? description;

  /// If the change set execution status is <code>AVAILABLE</code>, you can
  /// execute the change set. If you can't execute the change set, the status
  /// indicates why. For example, a change set might be in an
  /// <code>UNAVAILABLE</code> state because CloudFormation is still creating it
  /// or in an <code>OBSOLETE</code> state because the stack was already updated.
  final ExecutionStatus? executionStatus;

  /// Indicates if the change set imports resources that already exist.
  /// <note>
  /// This parameter can only import resources that have <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-name.html">custom
  /// names</a> in templates. To import resources that do not accept custom names,
  /// such as EC2 instances, use the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import.html">resource
  /// import</a> feature instead.
  /// </note>
  final bool? importExistingResources;

  /// Verifies if <code>IncludeNestedStacks</code> is set to <code>True</code>.
  final bool? includeNestedStacks;

  /// If the output exceeds 1 MB, a string that identifies the next page of
  /// changes. If there is no additional page, this value is null.
  final String? nextToken;

  /// The ARNs of the Amazon Simple Notification Service (Amazon SNS) topics that
  /// will be associated with the stack if you execute the change set.
  final List<String>? notificationARNs;

  /// Determines what action will be taken if stack creation fails. When this
  /// parameter is specified, the <code>DisableRollback</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html">ExecuteChangeSet</a>
  /// API operation must not be specified. This must be one of these values:
  ///
  /// <ul>
  /// <li>
  /// <code>DELETE</code> - Deletes the change set if the stack creation fails.
  /// This is only valid when the <code>ChangeSetType</code> parameter is set to
  /// <code>CREATE</code>. If the deletion of the stack fails, the status of the
  /// stack is <code>DELETE_FAILED</code>.
  /// </li>
  /// <li>
  /// <code>DO_NOTHING</code> - if the stack creation fails, do nothing. This is
  /// equivalent to specifying <code>true</code> for the
  /// <code>DisableRollback</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html">ExecuteChangeSet</a>
  /// API operation.
  /// </li>
  /// <li>
  /// <code>ROLLBACK</code> - if the stack creation fails, roll back the stack.
  /// This is equivalent to specifying <code>false</code> for the
  /// <code>DisableRollback</code> parameter to the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html">ExecuteChangeSet</a>
  /// API operation.
  /// </li>
  /// </ul>
  final OnStackFailure? onStackFailure;

  /// A list of <code>Parameter</code> structures that describes the input
  /// parameters and their values used to create the change set. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html">Parameter</a>
  /// data type.
  final List<Parameter>? parameters;

  /// Specifies the change set ID of the parent change set in the current nested
  /// change set hierarchy.
  final String? parentChangeSetId;

  /// The rollback triggers for CloudFormation to monitor during stack creation
  /// and updating operations, and for the specified monitoring period afterwards.
  final RollbackConfiguration? rollbackConfiguration;

  /// Specifies the change set ID of the root change set in the current nested
  /// change set hierarchy.
  final String? rootChangeSetId;

  /// The Amazon Resource Name (ARN) of the stack that's associated with the
  /// change set.
  final String? stackId;

  /// The name of the stack that's associated with the change set.
  final String? stackName;

  /// The current status of the change set, such as
  /// <code>CREATE_IN_PROGRESS</code>, <code>CREATE_COMPLETE</code>, or
  /// <code>FAILED</code>.
  final ChangeSetStatus? status;

  /// A description of the change set's status. For example, if your attempt to
  /// create a change set failed, CloudFormation shows the error message.
  final String? statusReason;

  /// If you execute the change set, the tags that will be associated with the
  /// stack.
  final List<Tag>? tags;

  DescribeChangeSetOutput({
    this.capabilities,
    this.changeSetId,
    this.changeSetName,
    this.changes,
    this.creationTime,
    this.description,
    this.executionStatus,
    this.importExistingResources,
    this.includeNestedStacks,
    this.nextToken,
    this.notificationARNs,
    this.onStackFailure,
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
      changes: _s.extractXmlChild(elem, 'Changes')?.let(
          (elem) => elem.findElements('member').map(Change.fromXml).toList()),
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      executionStatus: _s
          .extractXmlStringValue(elem, 'ExecutionStatus')
          ?.toExecutionStatus(),
      importExistingResources:
          _s.extractXmlBoolValue(elem, 'ImportExistingResources'),
      includeNestedStacks: _s.extractXmlBoolValue(elem, 'IncludeNestedStacks'),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      notificationARNs: _s
          .extractXmlChild(elem, 'NotificationARNs')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      onStackFailure:
          _s.extractXmlStringValue(elem, 'OnStackFailure')?.toOnStackFailure(),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('member').map(Parameter.fromXml).toList()),
      parentChangeSetId: _s.extractXmlStringValue(elem, 'ParentChangeSetId'),
      rollbackConfiguration: _s
          .extractXmlChild(elem, 'RollbackConfiguration')
          ?.let(RollbackConfiguration.fromXml),
      rootChangeSetId: _s.extractXmlStringValue(elem, 'RootChangeSetId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toChangeSetStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final changeSetId = this.changeSetId;
    final changeSetName = this.changeSetName;
    final changes = this.changes;
    final creationTime = this.creationTime;
    final description = this.description;
    final executionStatus = this.executionStatus;
    final importExistingResources = this.importExistingResources;
    final includeNestedStacks = this.includeNestedStacks;
    final nextToken = this.nextToken;
    final notificationARNs = this.notificationARNs;
    final onStackFailure = this.onStackFailure;
    final parameters = this.parameters;
    final parentChangeSetId = this.parentChangeSetId;
    final rollbackConfiguration = this.rollbackConfiguration;
    final rootChangeSetId = this.rootChangeSetId;
    final stackId = this.stackId;
    final stackName = this.stackName;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      if (capabilities != null)
        'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (changes != null) 'Changes': changes,
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (description != null) 'Description': description,
      if (executionStatus != null) 'ExecutionStatus': executionStatus.toValue(),
      if (importExistingResources != null)
        'ImportExistingResources': importExistingResources,
      if (includeNestedStacks != null)
        'IncludeNestedStacks': includeNestedStacks,
      if (nextToken != null) 'NextToken': nextToken,
      if (notificationARNs != null) 'NotificationARNs': notificationARNs,
      if (onStackFailure != null) 'OnStackFailure': onStackFailure.toValue(),
      if (parameters != null) 'Parameters': parameters,
      if (parentChangeSetId != null) 'ParentChangeSetId': parentChangeSetId,
      if (rollbackConfiguration != null)
        'RollbackConfiguration': rollbackConfiguration,
      if (rootChangeSetId != null) 'RootChangeSetId': rootChangeSetId,
      if (stackId != null) 'StackId': stackId,
      if (stackName != null) 'StackName': stackName,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeGeneratedTemplateOutput {
  /// The time the generated template was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the generated template. The format is
  /// <code>arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}</code>.
  /// For example,
  /// <code>arn:aws:cloudformation:<i>us-east-1</i>:<i>123456789012</i>:generatedtemplate/<i>2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc</i>
  /// </code>.
  final String? generatedTemplateId;

  /// The name of the generated template.
  final String? generatedTemplateName;

  /// The time the generated template was last updated.
  final DateTime? lastUpdatedTime;

  /// An object describing the progress of the template generation.
  final TemplateProgress? progress;

  /// A list of objects describing the details of the resources in the template
  /// generation.
  final List<ResourceDetail>? resources;

  /// The stack ARN of the base stack if a base stack was provided when generating
  /// the template.
  final String? stackId;

  /// The status of the template generation. Supported values are:
  ///
  /// <ul>
  /// <li>
  /// <code>CreatePending</code> - the creation of the template is pending.
  /// </li>
  /// <li>
  /// <code>CreateInProgress</code> - the creation of the template is in progress.
  /// </li>
  /// <li>
  /// <code>DeletePending</code> - the deletion of the template is pending.
  /// </li>
  /// <li>
  /// <code>DeleteInProgress</code> - the deletion of the template is in progress.
  /// </li>
  /// <li>
  /// <code>UpdatePending</code> - the update of the template is pending.
  /// </li>
  /// <li>
  /// <code>UpdateInProgress</code> - the update of the template is in progress.
  /// </li>
  /// <li>
  /// <code>Failed</code> - the template operation failed.
  /// </li>
  /// <li>
  /// <code>Complete</code> - the template operation is complete.
  /// </li>
  /// </ul>
  final GeneratedTemplateStatus? status;

  /// The reason for the current template generation status. This will provide
  /// more details if a failure happened.
  final String? statusReason;

  /// The configuration details of the generated template, including the
  /// <code>DeletionPolicy</code> and <code>UpdateReplacePolicy</code>.
  final TemplateConfiguration? templateConfiguration;

  /// The number of warnings generated for this template. The warnings are found
  /// in the details of each of the resources in the template.
  final int? totalWarnings;

  DescribeGeneratedTemplateOutput({
    this.creationTime,
    this.generatedTemplateId,
    this.generatedTemplateName,
    this.lastUpdatedTime,
    this.progress,
    this.resources,
    this.stackId,
    this.status,
    this.statusReason,
    this.templateConfiguration,
    this.totalWarnings,
  });
  factory DescribeGeneratedTemplateOutput.fromXml(_s.XmlElement elem) {
    return DescribeGeneratedTemplateOutput(
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      generatedTemplateId:
          _s.extractXmlStringValue(elem, 'GeneratedTemplateId'),
      generatedTemplateName:
          _s.extractXmlStringValue(elem, 'GeneratedTemplateName'),
      lastUpdatedTime: _s.extractXmlDateTimeValue(elem, 'LastUpdatedTime'),
      progress:
          _s.extractXmlChild(elem, 'Progress')?.let(TemplateProgress.fromXml),
      resources: _s.extractXmlChild(elem, 'Resources')?.let((elem) =>
          elem.findElements('member').map(ResourceDetail.fromXml).toList()),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toGeneratedTemplateStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
      templateConfiguration: _s
          .extractXmlChild(elem, 'TemplateConfiguration')
          ?.let(TemplateConfiguration.fromXml),
      totalWarnings: _s.extractXmlIntValue(elem, 'TotalWarnings'),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final generatedTemplateId = this.generatedTemplateId;
    final generatedTemplateName = this.generatedTemplateName;
    final lastUpdatedTime = this.lastUpdatedTime;
    final progress = this.progress;
    final resources = this.resources;
    final stackId = this.stackId;
    final status = this.status;
    final statusReason = this.statusReason;
    final templateConfiguration = this.templateConfiguration;
    final totalWarnings = this.totalWarnings;
    return {
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (generatedTemplateId != null)
        'GeneratedTemplateId': generatedTemplateId,
      if (generatedTemplateName != null)
        'GeneratedTemplateName': generatedTemplateName,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      if (progress != null) 'Progress': progress,
      if (resources != null) 'Resources': resources,
      if (stackId != null) 'StackId': stackId,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (totalWarnings != null) 'TotalWarnings': totalWarnings,
    };
  }
}

class DescribeOrganizationsAccessOutput {
  /// Presents the status of the <code>OrganizationAccess</code>.
  final OrganizationStatus? status;

  DescribeOrganizationsAccessOutput({
    this.status,
  });
  factory DescribeOrganizationsAccessOutput.fromXml(_s.XmlElement elem) {
    return DescribeOrganizationsAccessOutput(
      status: _s.extractXmlStringValue(elem, 'Status')?.toOrganizationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribePublisherOutput {
  /// The type of account used as the identity provider when registering this
  /// publisher with CloudFormation.
  final IdentityProvider? identityProvider;

  /// The ID of the extension publisher.
  final String? publisherId;

  /// The URL to the publisher's profile with the identity provider.
  final String? publisherProfile;

  /// Whether the publisher is verified. Currently, all registered publishers are
  /// verified.
  final PublisherStatus? publisherStatus;

  DescribePublisherOutput({
    this.identityProvider,
    this.publisherId,
    this.publisherProfile,
    this.publisherStatus,
  });
  factory DescribePublisherOutput.fromXml(_s.XmlElement elem) {
    return DescribePublisherOutput(
      identityProvider: _s
          .extractXmlStringValue(elem, 'IdentityProvider')
          ?.toIdentityProvider(),
      publisherId: _s.extractXmlStringValue(elem, 'PublisherId'),
      publisherProfile: _s.extractXmlStringValue(elem, 'PublisherProfile'),
      publisherStatus: _s
          .extractXmlStringValue(elem, 'PublisherStatus')
          ?.toPublisherStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    final publisherId = this.publisherId;
    final publisherProfile = this.publisherProfile;
    final publisherStatus = this.publisherStatus;
    return {
      if (identityProvider != null)
        'IdentityProvider': identityProvider.toValue(),
      if (publisherId != null) 'PublisherId': publisherId,
      if (publisherProfile != null) 'PublisherProfile': publisherProfile,
      if (publisherStatus != null) 'PublisherStatus': publisherStatus.toValue(),
    };
  }
}

class DescribeResourceScanOutput {
  /// The time that the resource scan was finished.
  final DateTime? endTime;

  /// The percentage of the resource scan that has been completed.
  final double? percentageCompleted;

  /// The Amazon Resource Name (ARN) of the resource scan. The format is
  /// <code>arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id}</code>.
  /// An example is
  /// <code>arn:aws:cloudformation:<i>us-east-1</i>:<i>123456789012</i>:resourceScan/<i>f5b490f7-7ed4-428a-aa06-31ff25db0772</i>
  /// </code>.
  final String? resourceScanId;

  /// The list of resource types for the specified scan. Resource types are only
  /// available for scans with a <code>Status</code> set to <code>COMPLETE</code>
  /// or <code>FAILED </code>.
  final List<String>? resourceTypes;

  /// The number of resources that were read. This is only available for scans
  /// with a <code>Status</code> set to <code>COMPLETE</code>,
  /// <code>EXPIRED</code>, or <code>FAILED </code>.
  /// <note>
  /// This field may be 0 if the resource scan failed with a
  /// <code>ResourceScanLimitExceededException</code>.
  /// </note>
  final int? resourcesRead;

  /// The number of resources that were listed. This is only available for scans
  /// with a <code>Status</code> set to <code>COMPLETE</code>,
  /// <code>EXPIRED</code>, or <code>FAILED </code>.
  final int? resourcesScanned;

  /// The time that the resource scan was started.
  final DateTime? startTime;

  /// Status of the resource scan.
  /// <dl> <dt>INPROGRESS</dt> <dd>
  /// The resource scan is still in progress.
  /// </dd> <dt>COMPLETE</dt> <dd>
  /// The resource scan is complete.
  /// </dd> <dt>EXPIRED</dt> <dd>
  /// The resource scan has expired.
  /// </dd> <dt>FAILED</dt> <dd>
  /// The resource scan has failed.
  /// </dd> </dl>
  final ResourceScanStatus? status;

  /// The reason for the resource scan status, providing more information if a
  /// failure happened.
  final String? statusReason;

  DescribeResourceScanOutput({
    this.endTime,
    this.percentageCompleted,
    this.resourceScanId,
    this.resourceTypes,
    this.resourcesRead,
    this.resourcesScanned,
    this.startTime,
    this.status,
    this.statusReason,
  });
  factory DescribeResourceScanOutput.fromXml(_s.XmlElement elem) {
    return DescribeResourceScanOutput(
      endTime: _s.extractXmlDateTimeValue(elem, 'EndTime'),
      percentageCompleted:
          _s.extractXmlDoubleValue(elem, 'PercentageCompleted'),
      resourceScanId: _s.extractXmlStringValue(elem, 'ResourceScanId'),
      resourceTypes: _s
          .extractXmlChild(elem, 'ResourceTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      resourcesRead: _s.extractXmlIntValue(elem, 'ResourcesRead'),
      resourcesScanned: _s.extractXmlIntValue(elem, 'ResourcesScanned'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toResourceScanStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final percentageCompleted = this.percentageCompleted;
    final resourceScanId = this.resourceScanId;
    final resourceTypes = this.resourceTypes;
    final resourcesRead = this.resourcesRead;
    final resourcesScanned = this.resourcesScanned;
    final startTime = this.startTime;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (endTime != null) 'EndTime': iso8601ToJson(endTime),
      if (percentageCompleted != null)
        'PercentageCompleted': percentageCompleted,
      if (resourceScanId != null) 'ResourceScanId': resourceScanId,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (resourcesRead != null) 'ResourcesRead': resourcesRead,
      if (resourcesScanned != null) 'ResourcesScanned': resourcesScanned,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

class DescribeStackDriftDetectionStatusOutput {
  /// The status of the stack drift detection operation.
  ///
  /// <ul>
  /// <li>
  /// <code>DETECTION_COMPLETE</code>: The stack drift detection operation has
  /// successfully completed for all resources in the stack that support drift
  /// detection. (Resources that don't currently support stack detection remain
  /// unchecked.)
  ///
  /// If you specified logical resource IDs for CloudFormation to use as a filter
  /// for the stack drift detection operation, only the resources with those
  /// logical IDs are checked for drift.
  /// </li>
  /// <li>
  /// <code>DETECTION_FAILED</code>: The stack drift detection operation has
  /// failed for at least one resource in the stack. Results will be available for
  /// resources on which CloudFormation successfully completed drift detection.
  /// </li>
  /// <li>
  /// <code>DETECTION_IN_PROGRESS</code>: The stack drift detection operation is
  /// currently in progress.
  /// </li>
  /// </ul>
  final StackDriftDetectionStatus detectionStatus;

  /// The ID of the drift detection results of this operation.
  ///
  /// CloudFormation generates new results, with a new drift detection ID, each
  /// time this operation is run. However, the number of reports CloudFormation
  /// retains for any given stack, and for how long, may vary.
  final String stackDriftDetectionId;

  /// The ID of the stack.
  final String stackId;

  /// Time at which the stack drift detection operation was initiated.
  final DateTime timestamp;

  /// The reason the stack drift detection operation has its current status.
  final String? detectionStatusReason;

  /// Total number of stack resources that have drifted. This is NULL until the
  /// drift detection operation reaches a status of
  /// <code>DETECTION_COMPLETE</code>. This value will be 0 for stacks whose drift
  /// status is <code>IN_SYNC</code>.
  final int? driftedStackResourceCount;

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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked if the stack differs
  /// from its expected template configuration.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The stack's actual configuration matches its expected
  /// template configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus? stackDriftStatus;

  DescribeStackDriftDetectionStatusOutput({
    required this.detectionStatus,
    required this.stackDriftDetectionId,
    required this.stackId,
    required this.timestamp,
    this.detectionStatusReason,
    this.driftedStackResourceCount,
    this.stackDriftStatus,
  });
  factory DescribeStackDriftDetectionStatusOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackDriftDetectionStatusOutput(
      detectionStatus: _s
          .extractXmlStringValue(elem, 'DetectionStatus')!
          .toStackDriftDetectionStatus(),
      stackDriftDetectionId:
          _s.extractXmlStringValue(elem, 'StackDriftDetectionId')!,
      stackId: _s.extractXmlStringValue(elem, 'StackId')!,
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp')!,
      detectionStatusReason:
          _s.extractXmlStringValue(elem, 'DetectionStatusReason'),
      driftedStackResourceCount:
          _s.extractXmlIntValue(elem, 'DriftedStackResourceCount'),
      stackDriftStatus: _s
          .extractXmlStringValue(elem, 'StackDriftStatus')
          ?.toStackDriftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final detectionStatus = this.detectionStatus;
    final stackDriftDetectionId = this.stackDriftDetectionId;
    final stackId = this.stackId;
    final timestamp = this.timestamp;
    final detectionStatusReason = this.detectionStatusReason;
    final driftedStackResourceCount = this.driftedStackResourceCount;
    final stackDriftStatus = this.stackDriftStatus;
    return {
      'DetectionStatus': detectionStatus.toValue(),
      'StackDriftDetectionId': stackDriftDetectionId,
      'StackId': stackId,
      'Timestamp': iso8601ToJson(timestamp),
      if (detectionStatusReason != null)
        'DetectionStatusReason': detectionStatusReason,
      if (driftedStackResourceCount != null)
        'DriftedStackResourceCount': driftedStackResourceCount,
      if (stackDriftStatus != null)
        'StackDriftStatus': stackDriftStatus.toValue(),
    };
  }
}

/// The output for a <a>DescribeStackEvents</a> action.
class DescribeStackEventsOutput {
  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of events. If no additional page exists, this value is null.
  final String? nextToken;

  /// A list of <code>StackEvents</code> structures.
  final List<StackEvent>? stackEvents;

  DescribeStackEventsOutput({
    this.nextToken,
    this.stackEvents,
  });
  factory DescribeStackEventsOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackEventsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stackEvents: _s.extractXmlChild(elem, 'StackEvents')?.let((elem) =>
          elem.findElements('member').map(StackEvent.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final stackEvents = this.stackEvents;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (stackEvents != null) 'StackEvents': stackEvents,
    };
  }
}

class DescribeStackInstanceOutput {
  /// The stack instance that matches the specified request parameters.
  final StackInstance? stackInstance;

  DescribeStackInstanceOutput({
    this.stackInstance,
  });
  factory DescribeStackInstanceOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackInstanceOutput(
      stackInstance:
          _s.extractXmlChild(elem, 'StackInstance')?.let(StackInstance.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final stackInstance = this.stackInstance;
    return {
      if (stackInstance != null) 'StackInstance': stackInstance,
    };
  }
}

class DescribeStackResourceDriftsOutput {
  /// Drift information for the resources that have been checked for drift in the
  /// specified stack. This includes actual and expected configuration values for
  /// resources where CloudFormation detects drift.
  ///
  /// For a given stack, there will be one <code>StackResourceDrift</code> for
  /// each stack resource that has been checked for drift. Resources that haven't
  /// yet been checked for drift aren't included. Resources that do not currently
  /// support drift detection aren't checked, and so not included. For a list of
  /// resources that support drift detection, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>.
  final List<StackResourceDrift> stackResourceDrifts;

  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>DescribeStackResourceDrifts</code> again and assign that
  /// token to the request object's <code>NextToken</code> parameter. If the
  /// request returns all results, <code>NextToken</code> is set to
  /// <code>null</code>.
  final String? nextToken;

  DescribeStackResourceDriftsOutput({
    required this.stackResourceDrifts,
    this.nextToken,
  });
  factory DescribeStackResourceDriftsOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackResourceDriftsOutput(
      stackResourceDrifts: _s
          .extractXmlChild(elem, 'StackResourceDrifts')!
          .findElements('member')
          .map(StackResourceDrift.fromXml)
          .toList(),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackResourceDrifts = this.stackResourceDrifts;
    final nextToken = this.nextToken;
    return {
      'StackResourceDrifts': stackResourceDrifts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The output for a <a>DescribeStackResource</a> action.
class DescribeStackResourceOutput {
  /// A <code>StackResourceDetail</code> structure containing the description of
  /// the specified resource in the specified stack.
  final StackResourceDetail? stackResourceDetail;

  DescribeStackResourceOutput({
    this.stackResourceDetail,
  });
  factory DescribeStackResourceOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackResourceOutput(
      stackResourceDetail: _s
          .extractXmlChild(elem, 'StackResourceDetail')
          ?.let(StackResourceDetail.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final stackResourceDetail = this.stackResourceDetail;
    return {
      if (stackResourceDetail != null)
        'StackResourceDetail': stackResourceDetail,
    };
  }
}

/// The output for a <a>DescribeStackResources</a> action.
class DescribeStackResourcesOutput {
  /// A list of <code>StackResource</code> structures.
  final List<StackResource>? stackResources;

  DescribeStackResourcesOutput({
    this.stackResources,
  });
  factory DescribeStackResourcesOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackResourcesOutput(
      stackResources: _s.extractXmlChild(elem, 'StackResources')?.let((elem) =>
          elem.findElements('member').map(StackResource.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final stackResources = this.stackResources;
    return {
      if (stackResources != null) 'StackResources': stackResources,
    };
  }
}

class DescribeStackSetOperationOutput {
  /// The specified stack set operation.
  final StackSetOperation? stackSetOperation;

  DescribeStackSetOperationOutput({
    this.stackSetOperation,
  });
  factory DescribeStackSetOperationOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackSetOperationOutput(
      stackSetOperation: _s
          .extractXmlChild(elem, 'StackSetOperation')
          ?.let(StackSetOperation.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final stackSetOperation = this.stackSetOperation;
    return {
      if (stackSetOperation != null) 'StackSetOperation': stackSetOperation,
    };
  }
}

class DescribeStackSetOutput {
  /// The specified stack set.
  final StackSet? stackSet;

  DescribeStackSetOutput({
    this.stackSet,
  });
  factory DescribeStackSetOutput.fromXml(_s.XmlElement elem) {
    return DescribeStackSetOutput(
      stackSet: _s.extractXmlChild(elem, 'StackSet')?.let(StackSet.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final stackSet = this.stackSet;
    return {
      if (stackSet != null) 'StackSet': stackSet,
    };
  }
}

/// The output for a <a>DescribeStacks</a> action.
class DescribeStacksOutput {
  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of stacks. If no additional page exists, this value is null.
  final String? nextToken;

  /// A list of stack structures.
  final List<Stack>? stacks;

  DescribeStacksOutput({
    this.nextToken,
    this.stacks,
  });
  factory DescribeStacksOutput.fromXml(_s.XmlElement elem) {
    return DescribeStacksOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stacks: _s.extractXmlChild(elem, 'Stacks')?.let(
          (elem) => elem.findElements('member').map(Stack.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final stacks = this.stacks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (stacks != null) 'Stacks': stacks,
    };
  }
}

class DescribeTypeOutput {
  /// The Amazon Resource Name (ARN) of the extension.
  final String? arn;

  /// Whether CloudFormation automatically updates the extension in this account
  /// and Region when a new <i>minor</i> version is published by the extension
  /// publisher. Major versions released by the publisher must be manually
  /// updated. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable">Activating
  /// public extensions for use in your account</a> in the <i>CloudFormation User
  /// Guide</i>.
  final bool? autoUpdate;

  /// A JSON string that represent the current configuration data for the
  /// extension in this account and Region.
  ///
  /// To set the configuration data for an extension, use <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html">SetTypeConfiguration</a>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private.html#registry-set-configuration">Configuring
  /// extensions at the account level</a> in the <i>CloudFormation User Guide</i>.
  final String? configurationSchema;

  /// The ID of the default version of the extension. The default version is used
  /// when the extension version isn't specified.
  ///
  /// This applies only to private extensions you have registered in your account.
  /// For public extensions, both those provided by Amazon Web Services and
  /// published by third parties, CloudFormation returns <code>null</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>.
  ///
  /// To set the default version of an extension, use
  /// <a>SetTypeDefaultVersion</a>.
  final String? defaultVersionId;

  /// The deprecation status of the extension version.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>LIVE</code>: The extension is activated or registered and can be used
  /// in CloudFormation operations, dependent on its provisioning behavior and
  /// visibility scope.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code>: The extension has been deactivated or deregistered
  /// and can no longer be used in CloudFormation operations.
  /// </li>
  /// </ul>
  /// For public third-party extensions, CloudFormation returns <code>null</code>.
  final DeprecatedStatus? deprecatedStatus;

  /// The description of the extension.
  final String? description;

  /// The URL of a page providing detailed documentation for this extension.
  final String? documentationUrl;

  /// The Amazon Resource Name (ARN) of the IAM execution role used to register
  /// the extension. This applies only to private extensions you have registered
  /// in your account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>.
  ///
  /// If the registered extension calls any Amazon Web Services APIs, you must
  /// create an <i> <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// execution role</a> </i> that includes the necessary permissions to call
  /// those Amazon Web Services APIs, and provision that execution role in your
  /// account. CloudFormation then assumes that execution role to provide your
  /// extension with the appropriate credentials.
  final String? executionRoleArn;

  /// Whether the extension is activated in the account and Region.
  ///
  /// This only applies to public third-party extensions. For all other
  /// extensions, CloudFormation returns <code>null</code>.
  final bool? isActivated;

  /// Whether the specified extension version is set as the default version.
  ///
  /// This applies only to private extensions you have registered in your account,
  /// and extensions published by Amazon Web Services. For public third-party
  /// extensions, whether they are activated in your account, CloudFormation
  /// returns <code>null</code>.
  final bool? isDefaultVersion;

  /// When the specified extension version was registered. This applies only to:
  ///
  /// <ul>
  /// <li>
  /// Private extensions you have registered in your account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>.
  /// </li>
  /// <li>
  /// Public extensions you have activated in your account with auto-update
  /// specified. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html">ActivateType</a>.
  /// </li>
  /// </ul>
  final DateTime? lastUpdated;

  /// The latest version of a public extension <i>that is available</i> for use.
  ///
  /// This only applies if you specify a public extension, and you don't specify a
  /// version. For all other requests, CloudFormation returns <code>null</code>.
  final String? latestPublicVersion;

  /// Contains logging configuration information for private extensions. This
  /// applies only to private extensions you have registered in your account. For
  /// public extensions, both those provided by Amazon Web Services and published
  /// by third parties, CloudFormation returns <code>null</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>.
  final LoggingConfig? loggingConfig;

  /// For public extensions that have been activated for this account and Region,
  /// the Amazon Resource Name (ARN) of the public extension.
  final String? originalTypeArn;

  /// For public extensions that have been activated for this account and Region,
  /// the type name of the public extension.
  ///
  /// If you specified a <code>TypeNameAlias</code> when enabling the extension in
  /// this account and Region, CloudFormation treats that alias as the extension's
  /// type name within the account and Region, not the type name of the public
  /// extension. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias">Specifying
  /// aliases to refer to extensions</a> in the <i>CloudFormation User Guide</i>.
  final String? originalTypeName;

  /// For resource type extensions, the provisioning behavior of the resource
  /// type. CloudFormation determines the provisioning type during registration,
  /// based on the types of handlers in the schema handler package submitted.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>FULLY_MUTABLE</code>: The resource type includes an update handler to
  /// process updates to the type during stack update operations.
  /// </li>
  /// <li>
  /// <code>IMMUTABLE</code>: The resource type doesn't include an update handler,
  /// so the type can't be updated and must instead be replaced during stack
  /// update operations.
  /// </li>
  /// <li>
  /// <code>NON_PROVISIONABLE</code>: The resource type doesn't include all the
  /// following handlers, and therefore can't actually be provisioned.
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
  final ProvisioningType? provisioningType;

  /// The version number of a public third-party extension.
  ///
  /// This applies only if you specify a public extension you have activated in
  /// your account, or specify a public extension without specifying a version.
  /// For all other extensions, CloudFormation returns <code>null</code>.
  final String? publicVersionNumber;

  /// The publisher ID of the extension publisher.
  ///
  /// This applies only to public third-party extensions. For private registered
  /// extensions, and extensions provided by Amazon Web Services, CloudFormation
  /// returns <code>null</code>.
  final String? publisherId;

  /// For extensions that are modules, the public third-party extensions that must
  /// be activated in your account in order for the module itself to be activated.
  final List<RequiredActivatedType>? requiredActivatedTypes;

  /// The schema that defines the extension.
  ///
  /// For more information about extension schemas, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">Resource
  /// Provider Schema</a> in the <i>CloudFormation CLI User Guide</i>.
  final String? schema;

  /// The URL of the source code for the extension.
  final String? sourceUrl;

  /// When the specified private extension version was registered or activated in
  /// your account.
  final DateTime? timeCreated;

  /// The kind of extension.
  final RegistryType? type;

  /// The name of the extension.
  ///
  /// If the extension is a public third-party type you have activated with a type
  /// name alias, CloudFormation returns the type name alias. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html">ActivateType</a>.
  final String? typeName;

  /// The contract test status of the registered extension version. To return the
  /// extension test status of a specific extension version, you must specify
  /// <code>VersionId</code>.
  ///
  /// This applies only to registered private extension versions. CloudFormation
  /// doesn't return this information for public extensions, whether they are
  /// activated in your account.
  ///
  /// <ul>
  /// <li>
  /// <code>PASSED</code>: The extension has passed all its contract tests.
  ///
  /// An extension must have a test status of <code>PASSED</code> before it can be
  /// published. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-publish.html">Publishing
  /// extensions to make them available for public use</a> in the
  /// <i>CloudFormation Command Line Interface User Guide</i>.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The extension has failed one or more contract tests.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code>: Contract tests are currently being performed on
  /// the extension.
  /// </li>
  /// <li>
  /// <code>NOT_TESTED</code>: Contract tests haven't been performed on the
  /// extension.
  /// </li>
  /// </ul>
  final TypeTestsStatus? typeTestsStatus;

  /// The description of the test status. To return the extension test status of a
  /// specific extension version, you must specify <code>VersionId</code>.
  ///
  /// This applies only to registered private extension versions. CloudFormation
  /// doesn't return this information for public extensions, whether they are
  /// activated in your account.
  final String? typeTestsStatusDescription;

  /// The scope at which the extension is visible and usable in CloudFormation
  /// operations.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>PRIVATE</code>: The extension is only visible and usable within the
  /// account in which it is registered. CloudFormation marks any extensions you
  /// register as <code>PRIVATE</code>.
  /// </li>
  /// <li>
  /// <code>PUBLIC</code>: The extension is publicly visible and usable within any
  /// Amazon Web Services account.
  /// </li>
  /// </ul>
  final Visibility? visibility;

  DescribeTypeOutput({
    this.arn,
    this.autoUpdate,
    this.configurationSchema,
    this.defaultVersionId,
    this.deprecatedStatus,
    this.description,
    this.documentationUrl,
    this.executionRoleArn,
    this.isActivated,
    this.isDefaultVersion,
    this.lastUpdated,
    this.latestPublicVersion,
    this.loggingConfig,
    this.originalTypeArn,
    this.originalTypeName,
    this.provisioningType,
    this.publicVersionNumber,
    this.publisherId,
    this.requiredActivatedTypes,
    this.schema,
    this.sourceUrl,
    this.timeCreated,
    this.type,
    this.typeName,
    this.typeTestsStatus,
    this.typeTestsStatusDescription,
    this.visibility,
  });
  factory DescribeTypeOutput.fromXml(_s.XmlElement elem) {
    return DescribeTypeOutput(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      autoUpdate: _s.extractXmlBoolValue(elem, 'AutoUpdate'),
      configurationSchema:
          _s.extractXmlStringValue(elem, 'ConfigurationSchema'),
      defaultVersionId: _s.extractXmlStringValue(elem, 'DefaultVersionId'),
      deprecatedStatus: _s
          .extractXmlStringValue(elem, 'DeprecatedStatus')
          ?.toDeprecatedStatus(),
      description: _s.extractXmlStringValue(elem, 'Description'),
      documentationUrl: _s.extractXmlStringValue(elem, 'DocumentationUrl'),
      executionRoleArn: _s.extractXmlStringValue(elem, 'ExecutionRoleArn'),
      isActivated: _s.extractXmlBoolValue(elem, 'IsActivated'),
      isDefaultVersion: _s.extractXmlBoolValue(elem, 'IsDefaultVersion'),
      lastUpdated: _s.extractXmlDateTimeValue(elem, 'LastUpdated'),
      latestPublicVersion:
          _s.extractXmlStringValue(elem, 'LatestPublicVersion'),
      loggingConfig:
          _s.extractXmlChild(elem, 'LoggingConfig')?.let(LoggingConfig.fromXml),
      originalTypeArn: _s.extractXmlStringValue(elem, 'OriginalTypeArn'),
      originalTypeName: _s.extractXmlStringValue(elem, 'OriginalTypeName'),
      provisioningType: _s
          .extractXmlStringValue(elem, 'ProvisioningType')
          ?.toProvisioningType(),
      publicVersionNumber:
          _s.extractXmlStringValue(elem, 'PublicVersionNumber'),
      publisherId: _s.extractXmlStringValue(elem, 'PublisherId'),
      requiredActivatedTypes: _s
          .extractXmlChild(elem, 'RequiredActivatedTypes')
          ?.let((elem) => elem
              .findElements('member')
              .map(RequiredActivatedType.fromXml)
              .toList()),
      schema: _s.extractXmlStringValue(elem, 'Schema'),
      sourceUrl: _s.extractXmlStringValue(elem, 'SourceUrl'),
      timeCreated: _s.extractXmlDateTimeValue(elem, 'TimeCreated'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toRegistryType(),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
      typeTestsStatus: _s
          .extractXmlStringValue(elem, 'TypeTestsStatus')
          ?.toTypeTestsStatus(),
      typeTestsStatusDescription:
          _s.extractXmlStringValue(elem, 'TypeTestsStatusDescription'),
      visibility: _s.extractXmlStringValue(elem, 'Visibility')?.toVisibility(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final autoUpdate = this.autoUpdate;
    final configurationSchema = this.configurationSchema;
    final defaultVersionId = this.defaultVersionId;
    final deprecatedStatus = this.deprecatedStatus;
    final description = this.description;
    final documentationUrl = this.documentationUrl;
    final executionRoleArn = this.executionRoleArn;
    final isActivated = this.isActivated;
    final isDefaultVersion = this.isDefaultVersion;
    final lastUpdated = this.lastUpdated;
    final latestPublicVersion = this.latestPublicVersion;
    final loggingConfig = this.loggingConfig;
    final originalTypeArn = this.originalTypeArn;
    final originalTypeName = this.originalTypeName;
    final provisioningType = this.provisioningType;
    final publicVersionNumber = this.publicVersionNumber;
    final publisherId = this.publisherId;
    final requiredActivatedTypes = this.requiredActivatedTypes;
    final schema = this.schema;
    final sourceUrl = this.sourceUrl;
    final timeCreated = this.timeCreated;
    final type = this.type;
    final typeName = this.typeName;
    final typeTestsStatus = this.typeTestsStatus;
    final typeTestsStatusDescription = this.typeTestsStatusDescription;
    final visibility = this.visibility;
    return {
      if (arn != null) 'Arn': arn,
      if (autoUpdate != null) 'AutoUpdate': autoUpdate,
      if (configurationSchema != null)
        'ConfigurationSchema': configurationSchema,
      if (defaultVersionId != null) 'DefaultVersionId': defaultVersionId,
      if (deprecatedStatus != null)
        'DeprecatedStatus': deprecatedStatus.toValue(),
      if (description != null) 'Description': description,
      if (documentationUrl != null) 'DocumentationUrl': documentationUrl,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (isActivated != null) 'IsActivated': isActivated,
      if (isDefaultVersion != null) 'IsDefaultVersion': isDefaultVersion,
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (latestPublicVersion != null)
        'LatestPublicVersion': latestPublicVersion,
      if (loggingConfig != null) 'LoggingConfig': loggingConfig,
      if (originalTypeArn != null) 'OriginalTypeArn': originalTypeArn,
      if (originalTypeName != null) 'OriginalTypeName': originalTypeName,
      if (provisioningType != null)
        'ProvisioningType': provisioningType.toValue(),
      if (publicVersionNumber != null)
        'PublicVersionNumber': publicVersionNumber,
      if (publisherId != null) 'PublisherId': publisherId,
      if (requiredActivatedTypes != null)
        'RequiredActivatedTypes': requiredActivatedTypes,
      if (schema != null) 'Schema': schema,
      if (sourceUrl != null) 'SourceUrl': sourceUrl,
      if (timeCreated != null) 'TimeCreated': iso8601ToJson(timeCreated),
      if (type != null) 'Type': type.toValue(),
      if (typeName != null) 'TypeName': typeName,
      if (typeTestsStatus != null) 'TypeTestsStatus': typeTestsStatus.toValue(),
      if (typeTestsStatusDescription != null)
        'TypeTestsStatusDescription': typeTestsStatusDescription,
      if (visibility != null) 'Visibility': visibility.toValue(),
    };
  }
}

class DescribeTypeRegistrationOutput {
  /// The description of the extension registration request.
  final String? description;

  /// The current status of the extension registration request.
  final RegistrationStatus? progressStatus;

  /// The Amazon Resource Name (ARN) of the extension being registered.
  ///
  /// For registration requests with a <code>ProgressStatus</code> of other than
  /// <code>COMPLETE</code>, this will be <code>null</code>.
  final String? typeArn;

  /// The Amazon Resource Name (ARN) of this specific version of the extension
  /// being registered.
  ///
  /// For registration requests with a <code>ProgressStatus</code> of other than
  /// <code>COMPLETE</code>, this will be <code>null</code>.
  final String? typeVersionArn;

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

  Map<String, dynamic> toJson() {
    final description = this.description;
    final progressStatus = this.progressStatus;
    final typeArn = this.typeArn;
    final typeVersionArn = this.typeVersionArn;
    return {
      if (description != null) 'Description': description,
      if (progressStatus != null) 'ProgressStatus': progressStatus.toValue(),
      if (typeArn != null) 'TypeArn': typeArn,
      if (typeVersionArn != null) 'TypeVersionArn': typeVersionArn,
    };
  }
}

enum DetailedStatus {
  configurationComplete,
  validationFailed,
}

extension DetailedStatusValueExtension on DetailedStatus {
  String toValue() {
    switch (this) {
      case DetailedStatus.configurationComplete:
        return 'CONFIGURATION_COMPLETE';
      case DetailedStatus.validationFailed:
        return 'VALIDATION_FAILED';
    }
  }
}

extension DetailedStatusFromString on String {
  DetailedStatus toDetailedStatus() {
    switch (this) {
      case 'CONFIGURATION_COMPLETE':
        return DetailedStatus.configurationComplete;
      case 'VALIDATION_FAILED':
        return DetailedStatus.validationFailed;
    }
    throw Exception('$this is not known in enum DetailedStatus');
  }
}

class DetectStackDriftOutput {
  /// The ID of the drift detection results of this operation.
  ///
  /// CloudFormation generates new results, with a new drift detection ID, each
  /// time this operation is run. However, the number of drift results
  /// CloudFormation retains for any given stack, and for how long, may vary.
  final String stackDriftDetectionId;

  DetectStackDriftOutput({
    required this.stackDriftDetectionId,
  });
  factory DetectStackDriftOutput.fromXml(_s.XmlElement elem) {
    return DetectStackDriftOutput(
      stackDriftDetectionId:
          _s.extractXmlStringValue(elem, 'StackDriftDetectionId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final stackDriftDetectionId = this.stackDriftDetectionId;
    return {
      'StackDriftDetectionId': stackDriftDetectionId,
    };
  }
}

class DetectStackResourceDriftOutput {
  /// Information about whether the resource's actual configuration has drifted
  /// from its expected template configuration, including actual and expected
  /// property values and any differences detected.
  final StackResourceDrift stackResourceDrift;

  DetectStackResourceDriftOutput({
    required this.stackResourceDrift,
  });
  factory DetectStackResourceDriftOutput.fromXml(_s.XmlElement elem) {
    return DetectStackResourceDriftOutput(
      stackResourceDrift: StackResourceDrift.fromXml(
          _s.extractXmlChild(elem, 'StackResourceDrift')!),
    );
  }

  Map<String, dynamic> toJson() {
    final stackResourceDrift = this.stackResourceDrift;
    return {
      'StackResourceDrift': stackResourceDrift,
    };
  }
}

class DetectStackSetDriftOutput {
  /// The ID of the drift detection stack set operation.
  ///
  /// You can use this operation ID with <a>DescribeStackSetOperation</a> to
  /// monitor the progress of the drift detection operation.
  final String? operationId;

  DetectStackSetDriftOutput({
    this.operationId,
  });
  factory DetectStackSetDriftOutput.fromXml(_s.XmlElement elem) {
    return DetectStackSetDriftOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

enum DifferenceType {
  add,
  remove,
  notEqual,
}

extension DifferenceTypeValueExtension on DifferenceType {
  String toValue() {
    switch (this) {
      case DifferenceType.add:
        return 'ADD';
      case DifferenceType.remove:
        return 'REMOVE';
      case DifferenceType.notEqual:
        return 'NOT_EQUAL';
    }
  }
}

extension DifferenceTypeFromString on String {
  DifferenceType toDifferenceType() {
    switch (this) {
      case 'ADD':
        return DifferenceType.add;
      case 'REMOVE':
        return DifferenceType.remove;
      case 'NOT_EQUAL':
        return DifferenceType.notEqual;
    }
    throw Exception('$this is not known in enum DifferenceType');
  }
}

/// The output for a <a>EstimateTemplateCost</a> action.
class EstimateTemplateCostOutput {
  /// An Amazon Web Services Simple Monthly Calculator URL with a query string
  /// that describes the resources required to run the template.
  final String? url;

  EstimateTemplateCostOutput({
    this.url,
  });
  factory EstimateTemplateCostOutput.fromXml(_s.XmlElement elem) {
    return EstimateTemplateCostOutput(
      url: _s.extractXmlStringValue(elem, 'Url'),
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      if (url != null) 'Url': url,
    };
  }
}

enum EvaluationType {
  static,
  $dynamic,
}

extension EvaluationTypeValueExtension on EvaluationType {
  String toValue() {
    switch (this) {
      case EvaluationType.static:
        return 'Static';
      case EvaluationType.$dynamic:
        return 'Dynamic';
    }
  }
}

extension EvaluationTypeFromString on String {
  EvaluationType toEvaluationType() {
    switch (this) {
      case 'Static':
        return EvaluationType.static;
      case 'Dynamic':
        return EvaluationType.$dynamic;
    }
    throw Exception('$this is not known in enum EvaluationType');
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

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ExecutionStatus {
  unavailable,
  available,
  executeInProgress,
  executeComplete,
  executeFailed,
  obsolete,
}

extension ExecutionStatusValueExtension on ExecutionStatus {
  String toValue() {
    switch (this) {
      case ExecutionStatus.unavailable:
        return 'UNAVAILABLE';
      case ExecutionStatus.available:
        return 'AVAILABLE';
      case ExecutionStatus.executeInProgress:
        return 'EXECUTE_IN_PROGRESS';
      case ExecutionStatus.executeComplete:
        return 'EXECUTE_COMPLETE';
      case ExecutionStatus.executeFailed:
        return 'EXECUTE_FAILED';
      case ExecutionStatus.obsolete:
        return 'OBSOLETE';
    }
  }
}

extension ExecutionStatusFromString on String {
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
    throw Exception('$this is not known in enum ExecutionStatus');
  }
}

/// The <code>Export</code> structure describes the exported output values for a
/// stack.
class Export {
  /// The stack that contains the exported output name and value.
  final String? exportingStackId;

  /// The name of exported output value. Use this name and the
  /// <code>Fn::ImportValue</code> function to import the associated value into
  /// other stacks. The name is defined in the <code>Export</code> field in the
  /// associated stack's <code>Outputs</code> section.
  final String? name;

  /// The value of the exported output, such as a resource physical ID. This value
  /// is defined in the <code>Export</code> field in the associated stack's
  /// <code>Outputs</code> section.
  final String? value;

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

  Map<String, dynamic> toJson() {
    final exportingStackId = this.exportingStackId;
    final name = this.name;
    final value = this.value;
    return {
      if (exportingStackId != null) 'ExportingStackId': exportingStackId,
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

enum GeneratedTemplateDeletionPolicy {
  delete,
  retain,
}

extension GeneratedTemplateDeletionPolicyValueExtension
    on GeneratedTemplateDeletionPolicy {
  String toValue() {
    switch (this) {
      case GeneratedTemplateDeletionPolicy.delete:
        return 'DELETE';
      case GeneratedTemplateDeletionPolicy.retain:
        return 'RETAIN';
    }
  }
}

extension GeneratedTemplateDeletionPolicyFromString on String {
  GeneratedTemplateDeletionPolicy toGeneratedTemplateDeletionPolicy() {
    switch (this) {
      case 'DELETE':
        return GeneratedTemplateDeletionPolicy.delete;
      case 'RETAIN':
        return GeneratedTemplateDeletionPolicy.retain;
    }
    throw Exception(
        '$this is not known in enum GeneratedTemplateDeletionPolicy');
  }
}

enum GeneratedTemplateResourceStatus {
  pending,
  inProgress,
  failed,
  complete,
}

extension GeneratedTemplateResourceStatusValueExtension
    on GeneratedTemplateResourceStatus {
  String toValue() {
    switch (this) {
      case GeneratedTemplateResourceStatus.pending:
        return 'PENDING';
      case GeneratedTemplateResourceStatus.inProgress:
        return 'IN_PROGRESS';
      case GeneratedTemplateResourceStatus.failed:
        return 'FAILED';
      case GeneratedTemplateResourceStatus.complete:
        return 'COMPLETE';
    }
  }
}

extension GeneratedTemplateResourceStatusFromString on String {
  GeneratedTemplateResourceStatus toGeneratedTemplateResourceStatus() {
    switch (this) {
      case 'PENDING':
        return GeneratedTemplateResourceStatus.pending;
      case 'IN_PROGRESS':
        return GeneratedTemplateResourceStatus.inProgress;
      case 'FAILED':
        return GeneratedTemplateResourceStatus.failed;
      case 'COMPLETE':
        return GeneratedTemplateResourceStatus.complete;
    }
    throw Exception(
        '$this is not known in enum GeneratedTemplateResourceStatus');
  }
}

enum GeneratedTemplateStatus {
  createPending,
  updatePending,
  deletePending,
  createInProgress,
  updateInProgress,
  deleteInProgress,
  failed,
  complete,
}

extension GeneratedTemplateStatusValueExtension on GeneratedTemplateStatus {
  String toValue() {
    switch (this) {
      case GeneratedTemplateStatus.createPending:
        return 'CREATE_PENDING';
      case GeneratedTemplateStatus.updatePending:
        return 'UPDATE_PENDING';
      case GeneratedTemplateStatus.deletePending:
        return 'DELETE_PENDING';
      case GeneratedTemplateStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case GeneratedTemplateStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case GeneratedTemplateStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case GeneratedTemplateStatus.failed:
        return 'FAILED';
      case GeneratedTemplateStatus.complete:
        return 'COMPLETE';
    }
  }
}

extension GeneratedTemplateStatusFromString on String {
  GeneratedTemplateStatus toGeneratedTemplateStatus() {
    switch (this) {
      case 'CREATE_PENDING':
        return GeneratedTemplateStatus.createPending;
      case 'UPDATE_PENDING':
        return GeneratedTemplateStatus.updatePending;
      case 'DELETE_PENDING':
        return GeneratedTemplateStatus.deletePending;
      case 'CREATE_IN_PROGRESS':
        return GeneratedTemplateStatus.createInProgress;
      case 'UPDATE_IN_PROGRESS':
        return GeneratedTemplateStatus.updateInProgress;
      case 'DELETE_IN_PROGRESS':
        return GeneratedTemplateStatus.deleteInProgress;
      case 'FAILED':
        return GeneratedTemplateStatus.failed;
      case 'COMPLETE':
        return GeneratedTemplateStatus.complete;
    }
    throw Exception('$this is not known in enum GeneratedTemplateStatus');
  }
}

enum GeneratedTemplateUpdateReplacePolicy {
  delete,
  retain,
}

extension GeneratedTemplateUpdateReplacePolicyValueExtension
    on GeneratedTemplateUpdateReplacePolicy {
  String toValue() {
    switch (this) {
      case GeneratedTemplateUpdateReplacePolicy.delete:
        return 'DELETE';
      case GeneratedTemplateUpdateReplacePolicy.retain:
        return 'RETAIN';
    }
  }
}

extension GeneratedTemplateUpdateReplacePolicyFromString on String {
  GeneratedTemplateUpdateReplacePolicy
      toGeneratedTemplateUpdateReplacePolicy() {
    switch (this) {
      case 'DELETE':
        return GeneratedTemplateUpdateReplacePolicy.delete;
      case 'RETAIN':
        return GeneratedTemplateUpdateReplacePolicy.retain;
    }
    throw Exception(
        '$this is not known in enum GeneratedTemplateUpdateReplacePolicy');
  }
}

class GetGeneratedTemplateOutput {
  /// The status of the template generation. Supported values are:
  ///
  /// <ul>
  /// <li>
  /// <code>CreatePending</code> - the creation of the template is pending.
  /// </li>
  /// <li>
  /// <code>CreateInProgress</code> - the creation of the template is in progress.
  /// </li>
  /// <li>
  /// <code>DeletePending</code> - the deletion of the template is pending.
  /// </li>
  /// <li>
  /// <code>DeleteInProgress</code> - the deletion of the template is in progress.
  /// </li>
  /// <li>
  /// <code>UpdatePending</code> - the update of the template is pending.
  /// </li>
  /// <li>
  /// <code>UpdateInProgress</code> - the update of the template is in progress.
  /// </li>
  /// <li>
  /// <code>Failed</code> - the template operation failed.
  /// </li>
  /// <li>
  /// <code>Complete</code> - the template operation is complete.
  /// </li>
  /// </ul>
  final GeneratedTemplateStatus? status;

  /// The template body of the generated template, in the language specified by
  /// the <code>Language</code> parameter.
  final String? templateBody;

  GetGeneratedTemplateOutput({
    this.status,
    this.templateBody,
  });
  factory GetGeneratedTemplateOutput.fromXml(_s.XmlElement elem) {
    return GetGeneratedTemplateOutput(
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toGeneratedTemplateStatus(),
      templateBody: _s.extractXmlStringValue(elem, 'TemplateBody'),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final templateBody = this.templateBody;
    return {
      if (status != null) 'Status': status.toValue(),
      if (templateBody != null) 'TemplateBody': templateBody,
    };
  }
}

/// The output for the <a>GetStackPolicy</a> action.
class GetStackPolicyOutput {
  /// Structure containing the stack policy body. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html">
  /// Prevent Updates to Stack Resources</a> in the <i>CloudFormation User
  /// Guide</i>.)
  final String? stackPolicyBody;

  GetStackPolicyOutput({
    this.stackPolicyBody,
  });
  factory GetStackPolicyOutput.fromXml(_s.XmlElement elem) {
    return GetStackPolicyOutput(
      stackPolicyBody: _s.extractXmlStringValue(elem, 'StackPolicyBody'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackPolicyBody = this.stackPolicyBody;
    return {
      if (stackPolicyBody != null) 'StackPolicyBody': stackPolicyBody,
    };
  }
}

/// The output for <a>GetTemplate</a> action.
class GetTemplateOutput {
  /// The stage of the template that you can retrieve. For stacks, the
  /// <code>Original</code> and <code>Processed</code> templates are always
  /// available. For change sets, the <code>Original</code> template is always
  /// available. After CloudFormation finishes creating the change set, the
  /// <code>Processed</code> template becomes available.
  final List<TemplateStage>? stagesAvailable;

  /// Structure containing the template body. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template
  /// Anatomy</a> in the <i>CloudFormation User Guide</i>.)
  ///
  /// CloudFormation returns the same template that was used when the stack was
  /// created.
  final String? templateBody;

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

  Map<String, dynamic> toJson() {
    final stagesAvailable = this.stagesAvailable;
    final templateBody = this.templateBody;
    return {
      if (stagesAvailable != null)
        'StagesAvailable': stagesAvailable.map((e) => e.toValue()).toList(),
      if (templateBody != null) 'TemplateBody': templateBody,
    };
  }
}

/// The output for the <a>GetTemplateSummary</a> action.
class GetTemplateSummaryOutput {
  /// The capabilities found within the template. If your template contains IAM
  /// resources, you must specify the <code>CAPABILITY_IAM</code> or
  /// <code>CAPABILITY_NAMED_IAM</code> value for this parameter when you use the
  /// <a>CreateStack</a> or <a>UpdateStack</a> actions with your template;
  /// otherwise, those actions return an <code>InsufficientCapabilities</code>
  /// error.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in CloudFormation Templates</a>.
  final List<Capability>? capabilities;

  /// The list of resources that generated the values in the
  /// <code>Capabilities</code> response element.
  final String? capabilitiesReason;

  /// A list of the transforms that are declared in the template.
  final List<String>? declaredTransforms;

  /// The value that's defined in the <code>Description</code> property of the
  /// template.
  final String? description;

  /// The value that's defined for the <code>Metadata</code> property of the
  /// template.
  final String? metadata;

  /// A list of parameter declarations that describe various properties for each
  /// parameter.
  final List<ParameterDeclaration>? parameters;

  /// A list of resource identifier summaries that describe the target resources
  /// of an import operation and the properties you can provide during the import
  /// to identify the target resources. For example, <code>BucketName</code> is a
  /// possible identifier property for an <code>AWS::S3::Bucket</code> resource.
  final List<ResourceIdentifierSummary>? resourceIdentifierSummaries;

  /// A list of all the template resource types that are defined in the template,
  /// such as <code>AWS::EC2::Instance</code>, <code>AWS::Dynamo::Table</code>,
  /// and <code>Custom::MyCustomInstance</code>.
  final List<String>? resourceTypes;

  /// The Amazon Web Services template format version, which identifies the
  /// capabilities of the template.
  final String? version;

  /// An object containing any warnings returned.
  final Warnings? warnings;

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
    this.warnings,
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
          .map(ParameterDeclaration.fromXml)
          .toList()),
      resourceIdentifierSummaries: _s
          .extractXmlChild(elem, 'ResourceIdentifierSummaries')
          ?.let((elem) => elem
              .findElements('member')
              .map(ResourceIdentifierSummary.fromXml)
              .toList()),
      resourceTypes: _s
          .extractXmlChild(elem, 'ResourceTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      version: _s.extractXmlStringValue(elem, 'Version'),
      warnings: _s.extractXmlChild(elem, 'Warnings')?.let(Warnings.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final capabilitiesReason = this.capabilitiesReason;
    final declaredTransforms = this.declaredTransforms;
    final description = this.description;
    final metadata = this.metadata;
    final parameters = this.parameters;
    final resourceIdentifierSummaries = this.resourceIdentifierSummaries;
    final resourceTypes = this.resourceTypes;
    final version = this.version;
    final warnings = this.warnings;
    return {
      if (capabilities != null)
        'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (capabilitiesReason != null) 'CapabilitiesReason': capabilitiesReason,
      if (declaredTransforms != null) 'DeclaredTransforms': declaredTransforms,
      if (description != null) 'Description': description,
      if (metadata != null) 'Metadata': metadata,
      if (parameters != null) 'Parameters': parameters,
      if (resourceIdentifierSummaries != null)
        'ResourceIdentifierSummaries': resourceIdentifierSummaries,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (version != null) 'Version': version,
      if (warnings != null) 'Warnings': warnings,
    };
  }
}

enum HandlerErrorCode {
  notUpdatable,
  invalidRequest,
  accessDenied,
  invalidCredentials,
  alreadyExists,
  notFound,
  resourceConflict,
  throttling,
  serviceLimitExceeded,
  notStabilized,
  generalServiceException,
  serviceInternalError,
  networkFailure,
  internalFailure,
  invalidTypeConfiguration,
  handlerInternalFailure,
  nonCompliant,
  unknown,
  unsupportedTarget,
}

extension HandlerErrorCodeValueExtension on HandlerErrorCode {
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
      case HandlerErrorCode.invalidTypeConfiguration:
        return 'InvalidTypeConfiguration';
      case HandlerErrorCode.handlerInternalFailure:
        return 'HandlerInternalFailure';
      case HandlerErrorCode.nonCompliant:
        return 'NonCompliant';
      case HandlerErrorCode.unknown:
        return 'Unknown';
      case HandlerErrorCode.unsupportedTarget:
        return 'UnsupportedTarget';
    }
  }
}

extension HandlerErrorCodeFromString on String {
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
      case 'InvalidTypeConfiguration':
        return HandlerErrorCode.invalidTypeConfiguration;
      case 'HandlerInternalFailure':
        return HandlerErrorCode.handlerInternalFailure;
      case 'NonCompliant':
        return HandlerErrorCode.nonCompliant;
      case 'Unknown':
        return HandlerErrorCode.unknown;
      case 'UnsupportedTarget':
        return HandlerErrorCode.unsupportedTarget;
    }
    throw Exception('$this is not known in enum HandlerErrorCode');
  }
}

enum HookFailureMode {
  fail,
  warn,
}

extension HookFailureModeValueExtension on HookFailureMode {
  String toValue() {
    switch (this) {
      case HookFailureMode.fail:
        return 'FAIL';
      case HookFailureMode.warn:
        return 'WARN';
    }
  }
}

extension HookFailureModeFromString on String {
  HookFailureMode toHookFailureMode() {
    switch (this) {
      case 'FAIL':
        return HookFailureMode.fail;
      case 'WARN':
        return HookFailureMode.warn;
    }
    throw Exception('$this is not known in enum HookFailureMode');
  }
}

enum HookInvocationPoint {
  preProvision,
}

extension HookInvocationPointValueExtension on HookInvocationPoint {
  String toValue() {
    switch (this) {
      case HookInvocationPoint.preProvision:
        return 'PRE_PROVISION';
    }
  }
}

extension HookInvocationPointFromString on String {
  HookInvocationPoint toHookInvocationPoint() {
    switch (this) {
      case 'PRE_PROVISION':
        return HookInvocationPoint.preProvision;
    }
    throw Exception('$this is not known in enum HookInvocationPoint');
  }
}

enum HookStatus {
  hookInProgress,
  hookCompleteSucceeded,
  hookCompleteFailed,
  hookFailed,
}

extension HookStatusValueExtension on HookStatus {
  String toValue() {
    switch (this) {
      case HookStatus.hookInProgress:
        return 'HOOK_IN_PROGRESS';
      case HookStatus.hookCompleteSucceeded:
        return 'HOOK_COMPLETE_SUCCEEDED';
      case HookStatus.hookCompleteFailed:
        return 'HOOK_COMPLETE_FAILED';
      case HookStatus.hookFailed:
        return 'HOOK_FAILED';
    }
  }
}

extension HookStatusFromString on String {
  HookStatus toHookStatus() {
    switch (this) {
      case 'HOOK_IN_PROGRESS':
        return HookStatus.hookInProgress;
      case 'HOOK_COMPLETE_SUCCEEDED':
        return HookStatus.hookCompleteSucceeded;
      case 'HOOK_COMPLETE_FAILED':
        return HookStatus.hookCompleteFailed;
      case 'HOOK_FAILED':
        return HookStatus.hookFailed;
    }
    throw Exception('$this is not known in enum HookStatus');
  }
}

enum HookTargetType {
  resource,
}

extension HookTargetTypeValueExtension on HookTargetType {
  String toValue() {
    switch (this) {
      case HookTargetType.resource:
        return 'RESOURCE';
    }
  }
}

extension HookTargetTypeFromString on String {
  HookTargetType toHookTargetType() {
    switch (this) {
      case 'RESOURCE':
        return HookTargetType.resource;
    }
    throw Exception('$this is not known in enum HookTargetType');
  }
}

enum IdentityProvider {
  awsMarketplace,
  gitHub,
  bitbucket,
}

extension IdentityProviderValueExtension on IdentityProvider {
  String toValue() {
    switch (this) {
      case IdentityProvider.awsMarketplace:
        return 'AWS_Marketplace';
      case IdentityProvider.gitHub:
        return 'GitHub';
      case IdentityProvider.bitbucket:
        return 'Bitbucket';
    }
  }
}

extension IdentityProviderFromString on String {
  IdentityProvider toIdentityProvider() {
    switch (this) {
      case 'AWS_Marketplace':
        return IdentityProvider.awsMarketplace;
      case 'GitHub':
        return IdentityProvider.gitHub;
      case 'Bitbucket':
        return IdentityProvider.bitbucket;
    }
    throw Exception('$this is not known in enum IdentityProvider');
  }
}

class ImportStacksToStackSetOutput {
  /// The unique identifier for the stack set operation.
  final String? operationId;

  ImportStacksToStackSetOutput({
    this.operationId,
  });
  factory ImportStacksToStackSetOutput.fromXml(_s.XmlElement elem) {
    return ImportStacksToStackSetOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

/// The output for the <a>ListChangeSets</a> action.
class ListChangeSetsOutput {
  /// If the output exceeds 1 MB, a string that identifies the next page of change
  /// sets. If there is no additional page, this value is <code>null</code>.
  final String? nextToken;

  /// A list of <code>ChangeSetSummary</code> structures that provides the ID and
  /// status of each change set for the specified stack.
  final List<ChangeSetSummary>? summaries;

  ListChangeSetsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListChangeSetsOutput.fromXml(_s.XmlElement elem) {
    return ListChangeSetsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) =>
          elem.findElements('member').map(ChangeSetSummary.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

class ListExportsOutput {
  /// The output for the <a>ListExports</a> action.
  final List<Export>? exports;

  /// If the output exceeds 100 exported output values, a string that identifies
  /// the next page of exports. If there is no additional page, this value is
  /// null.
  final String? nextToken;

  ListExportsOutput({
    this.exports,
    this.nextToken,
  });
  factory ListExportsOutput.fromXml(_s.XmlElement elem) {
    return ListExportsOutput(
      exports: _s.extractXmlChild(elem, 'Exports')?.let(
          (elem) => elem.findElements('member').map(Export.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final exports = this.exports;
    final nextToken = this.nextToken;
    return {
      if (exports != null) 'Exports': exports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGeneratedTemplatesOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListGeneratedTemplates</code> again and use that value
  /// for the <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to an empty string.
  final String? nextToken;

  /// A list of summaries of the generated templates.
  final List<TemplateSummary>? summaries;

  ListGeneratedTemplatesOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListGeneratedTemplatesOutput.fromXml(_s.XmlElement elem) {
    return ListGeneratedTemplatesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) =>
          elem.findElements('member').map(TemplateSummary.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

class ListImportsOutput {
  /// A list of stack names that are importing the specified exported output
  /// value.
  final List<String>? imports;

  /// A string that identifies the next page of exports. If there is no additional
  /// page, this value is null.
  final String? nextToken;

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

  Map<String, dynamic> toJson() {
    final imports = this.imports;
    final nextToken = this.nextToken;
    return {
      if (imports != null) 'Imports': imports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListResourceScanRelatedResourcesOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListResourceScanRelatedResources</code> again and use
  /// that value for the <code>NextToken</code> parameter. If the request returns
  /// all results, <code>NextToken</code> is set to an empty string.
  final String? nextToken;

  /// List of up to <code>MaxResults</code> resources in the specified resource
  /// scan related to the specified resources.
  final List<ScannedResource>? relatedResources;

  ListResourceScanRelatedResourcesOutput({
    this.nextToken,
    this.relatedResources,
  });
  factory ListResourceScanRelatedResourcesOutput.fromXml(_s.XmlElement elem) {
    return ListResourceScanRelatedResourcesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      relatedResources: _s.extractXmlChild(elem, 'RelatedResources')?.let(
          (elem) => elem
              .findElements('member')
              .map(ScannedResource.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final relatedResources = this.relatedResources;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (relatedResources != null) 'RelatedResources': relatedResources,
    };
  }
}

class ListResourceScanResourcesOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListResourceScanResources</code> again and use that
  /// value for the <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to an empty string.
  final String? nextToken;

  /// List of up to <code>MaxResults</code> resources in the specified resource
  /// scan that match all of the specified filters.
  final List<ScannedResource>? resources;

  ListResourceScanResourcesOutput({
    this.nextToken,
    this.resources,
  });
  factory ListResourceScanResourcesOutput.fromXml(_s.XmlElement elem) {
    return ListResourceScanResourcesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      resources: _s.extractXmlChild(elem, 'Resources')?.let((elem) =>
          elem.findElements('member').map(ScannedResource.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resources != null) 'Resources': resources,
    };
  }
}

class ListResourceScansOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListResourceScans</code> again and use that value for
  /// the <code>NextToken</code> parameter. If the request returns all results,
  /// <code>NextToken</code> is set to an empty string.
  final String? nextToken;

  /// The list of scans returned.
  final List<ResourceScanSummary>? resourceScanSummaries;

  ListResourceScansOutput({
    this.nextToken,
    this.resourceScanSummaries,
  });
  factory ListResourceScansOutput.fromXml(_s.XmlElement elem) {
    return ListResourceScansOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      resourceScanSummaries: _s
          .extractXmlChild(elem, 'ResourceScanSummaries')
          ?.let((elem) => elem
              .findElements('member')
              .map(ResourceScanSummary.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceScanSummaries = this.resourceScanSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceScanSummaries != null)
        'ResourceScanSummaries': resourceScanSummaries,
    };
  }
}

class ListStackInstanceResourceDriftsOutput {
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call this action again and
  /// assign that token to the request object's <code>NextToken</code> parameter.
  /// If there are no remaining results, the previous response object's
  /// <code>NextToken</code> parameter is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>StackInstanceResourceDriftsSummary</code> structures that
  /// contain information about the specified stack instances.
  final List<StackInstanceResourceDriftsSummary>? summaries;

  ListStackInstanceResourceDriftsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackInstanceResourceDriftsOutput.fromXml(_s.XmlElement elem) {
    return ListStackInstanceResourceDriftsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map(StackInstanceResourceDriftsSummary.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

class ListStackInstancesOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListStackInstances</code> again and assign that token to
  /// the request object's <code>NextToken</code> parameter. If the request
  /// returns all results, <code>NextToken</code> is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>StackInstanceSummary</code> structures that contain
  /// information about the specified stack instances.
  final List<StackInstanceSummary>? summaries;

  ListStackInstancesOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return ListStackInstancesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map(StackInstanceSummary.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

/// The output for a <a>ListStackResources</a> action.
class ListStackResourcesOutput {
  /// If the output exceeds 1 MB, a string that identifies the next page of stack
  /// resources. If no additional page exists, this value is null.
  final String? nextToken;

  /// A list of <code>StackResourceSummary</code> structures.
  final List<StackResourceSummary>? stackResourceSummaries;

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
              .map(StackResourceSummary.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final stackResourceSummaries = this.stackResourceSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (stackResourceSummaries != null)
        'StackResourceSummaries': stackResourceSummaries,
    };
  }
}

class ListStackSetAutoDeploymentTargetsOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListStackSetAutoDeploymentTargets.html">ListStackSetAutoDeploymentTargets</a>
  /// again and use that value for the <code>NextToken</code> parameter. If the
  /// request returns all results, <code>NextToken</code> is set to an empty
  /// string.
  final String? nextToken;

  /// An array of summaries of the deployment targets for the stack set.
  final List<StackSetAutoDeploymentTargetSummary>? summaries;

  ListStackSetAutoDeploymentTargetsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackSetAutoDeploymentTargetsOutput.fromXml(_s.XmlElement elem) {
    return ListStackSetAutoDeploymentTargetsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map(StackSetAutoDeploymentTargetSummary.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

class ListStackSetOperationResultsOutput {
  /// If the request doesn't return all results, <code>NextToken</code> is set to
  /// a token. To retrieve the next set of results, call
  /// <code>ListOperationResults</code> again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If there are no remaining
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>StackSetOperationResultSummary</code> structures that
  /// contain information about the specified operation results, for accounts and
  /// Amazon Web Services Regions that are included in the operation.
  final List<StackSetOperationResultSummary>? summaries;

  ListStackSetOperationResultsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackSetOperationResultsOutput.fromXml(_s.XmlElement elem) {
    return ListStackSetOperationResultsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map(StackSetOperationResultSummary.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

class ListStackSetOperationsOutput {
  /// If the request doesn't return all results, <code>NextToken</code> is set to
  /// a token. To retrieve the next set of results, call
  /// <code>ListOperationResults</code> again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If there are no remaining
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>StackSetOperationSummary</code> structures that contain
  /// summary information about operations for the specified stack set.
  final List<StackSetOperationSummary>? summaries;

  ListStackSetOperationsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackSetOperationsOutput.fromXml(_s.XmlElement elem) {
    return ListStackSetOperationsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) => elem
          .findElements('member')
          .map(StackSetOperationSummary.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

class ListStackSetsOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListStackInstances</code> again and assign that token to
  /// the request object's <code>NextToken</code> parameter. If the request
  /// returns all results, <code>NextToken</code> is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>StackSetSummary</code> structures that contain information
  /// about the user's stack sets.
  final List<StackSetSummary>? summaries;

  ListStackSetsOutput({
    this.nextToken,
    this.summaries,
  });
  factory ListStackSetsOutput.fromXml(_s.XmlElement elem) {
    return ListStackSetsOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      summaries: _s.extractXmlChild(elem, 'Summaries')?.let((elem) =>
          elem.findElements('member').map(StackSetSummary.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaries != null) 'Summaries': summaries,
    };
  }
}

/// The output for <a>ListStacks</a> action.
class ListStacksOutput {
  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of stacks. If no additional page exists, this value is null.
  final String? nextToken;

  /// A list of <code>StackSummary</code> structures containing information about
  /// the specified stacks.
  final List<StackSummary>? stackSummaries;

  ListStacksOutput({
    this.nextToken,
    this.stackSummaries,
  });
  factory ListStacksOutput.fromXml(_s.XmlElement elem) {
    return ListStacksOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      stackSummaries: _s.extractXmlChild(elem, 'StackSummaries')?.let((elem) =>
          elem.findElements('member').map(StackSummary.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final stackSummaries = this.stackSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (stackSummaries != null) 'StackSummaries': stackSummaries,
    };
  }
}

class ListTypeRegistrationsOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call this action again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String? nextToken;

  /// A list of extension registration tokens.
  ///
  /// Use <a>DescribeTypeRegistration</a> to return detailed information about a
  /// type registration request.
  final List<String>? registrationTokenList;

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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final registrationTokenList = this.registrationTokenList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (registrationTokenList != null)
        'RegistrationTokenList': registrationTokenList,
    };
  }
}

class ListTypeVersionsOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call this action again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>TypeVersionSummary</code> structures that contain
  /// information about the specified extension's versions.
  final List<TypeVersionSummary>? typeVersionSummaries;

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
              .map(TypeVersionSummary.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final typeVersionSummaries = this.typeVersionSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (typeVersionSummaries != null)
        'TypeVersionSummaries': typeVersionSummaries,
    };
  }
}

class ListTypesOutput {
  /// If the request doesn't return all the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call this action again and assign that token to the request
  /// object's <code>NextToken</code> parameter. If the request returns all
  /// results, <code>NextToken</code> is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>TypeSummary</code> structures that contain information about
  /// the specified extensions.
  final List<TypeSummary>? typeSummaries;

  ListTypesOutput({
    this.nextToken,
    this.typeSummaries,
  });
  factory ListTypesOutput.fromXml(_s.XmlElement elem) {
    return ListTypesOutput(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      typeSummaries: _s.extractXmlChild(elem, 'TypeSummaries')?.let((elem) =>
          elem.findElements('member').map(TypeSummary.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final typeSummaries = this.typeSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (typeSummaries != null) 'TypeSummaries': typeSummaries,
    };
  }
}

/// Contains logging configuration information for an extension.
class LoggingConfig {
  /// The Amazon CloudWatch Logs group to which CloudFormation sends error logging
  /// information when invoking the extension's handlers.
  final String logGroupName;

  /// The Amazon Resource Name (ARN) of the role that CloudFormation should assume
  /// when sending log entries to CloudWatch Logs.
  final String logRoleArn;

  LoggingConfig({
    required this.logGroupName,
    required this.logRoleArn,
  });
  factory LoggingConfig.fromXml(_s.XmlElement elem) {
    return LoggingConfig(
      logGroupName: _s.extractXmlStringValue(elem, 'LogGroupName')!,
      logRoleArn: _s.extractXmlStringValue(elem, 'LogRoleArn')!,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final logRoleArn = this.logRoleArn;
    return {
      'LogGroupName': logGroupName,
      'LogRoleArn': logRoleArn,
    };
  }
}

/// Describes whether StackSets performs non-conflicting operations concurrently
/// and queues conflicting operations.
class ManagedExecution {
  /// When <code>true</code>, StackSets performs non-conflicting operations
  /// concurrently and queues conflicting operations. After conflicting operations
  /// finish, StackSets starts queued operations in request order.
  /// <note>
  /// If there are already running or queued operations, StackSets queues all
  /// incoming operations even if they are non-conflicting.
  ///
  /// You can't modify your stack set's execution configuration while there are
  /// running or queued operations for that stack set.
  /// </note>
  /// When <code>false</code> (default), StackSets performs one operation at a
  /// time in request order.
  final bool? active;

  ManagedExecution({
    this.active,
  });
  factory ManagedExecution.fromXml(_s.XmlElement elem) {
    return ManagedExecution(
      active: _s.extractXmlBoolValue(elem, 'Active'),
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    return {
      if (active != null) 'Active': active,
    };
  }
}

/// Contains information about the module from which the resource was created,
/// if the resource was created from a module included in the stack template.
///
/// For more information about modules, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/modules.html">Using
/// modules to encapsulate and reuse resource configurations</a> in the
/// <i>CloudFormation User Guide</i>.
class ModuleInfo {
  /// A concatenated list of the logical IDs of the module or modules containing
  /// the resource. Modules are listed starting with the inner-most nested module,
  /// and separated by <code>/</code>.
  ///
  /// In the following example, the resource was created from a module,
  /// <code>moduleA</code>, that's nested inside a parent module,
  /// <code>moduleB</code>.
  ///
  /// <code>moduleA/moduleB</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/modules.html#module-ref-resources">Referencing
  /// resources in a module</a> in the <i>CloudFormation User Guide</i>.
  final String? logicalIdHierarchy;

  /// A concatenated list of the module type or types containing the resource.
  /// Module types are listed starting with the inner-most nested module, and
  /// separated by <code>/</code>.
  ///
  /// In the following example, the resource was created from a module of type
  /// <code>AWS::First::Example::MODULE</code>, that's nested inside a parent
  /// module of type <code>AWS::Second::Example::MODULE</code>.
  ///
  /// <code>AWS::First::Example::MODULE/AWS::Second::Example::MODULE</code>
  final String? typeHierarchy;

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

  Map<String, dynamic> toJson() {
    final logicalIdHierarchy = this.logicalIdHierarchy;
    final typeHierarchy = this.typeHierarchy;
    return {
      if (logicalIdHierarchy != null) 'LogicalIdHierarchy': logicalIdHierarchy,
      if (typeHierarchy != null) 'TypeHierarchy': typeHierarchy,
    };
  }
}

enum OnFailure {
  doNothing,
  rollback,
  delete,
}

extension OnFailureValueExtension on OnFailure {
  String toValue() {
    switch (this) {
      case OnFailure.doNothing:
        return 'DO_NOTHING';
      case OnFailure.rollback:
        return 'ROLLBACK';
      case OnFailure.delete:
        return 'DELETE';
    }
  }
}

extension OnFailureFromString on String {
  OnFailure toOnFailure() {
    switch (this) {
      case 'DO_NOTHING':
        return OnFailure.doNothing;
      case 'ROLLBACK':
        return OnFailure.rollback;
      case 'DELETE':
        return OnFailure.delete;
    }
    throw Exception('$this is not known in enum OnFailure');
  }
}

enum OnStackFailure {
  doNothing,
  rollback,
  delete,
}

extension OnStackFailureValueExtension on OnStackFailure {
  String toValue() {
    switch (this) {
      case OnStackFailure.doNothing:
        return 'DO_NOTHING';
      case OnStackFailure.rollback:
        return 'ROLLBACK';
      case OnStackFailure.delete:
        return 'DELETE';
    }
  }
}

extension OnStackFailureFromString on String {
  OnStackFailure toOnStackFailure() {
    switch (this) {
      case 'DO_NOTHING':
        return OnStackFailure.doNothing;
      case 'ROLLBACK':
        return OnStackFailure.rollback;
      case 'DELETE':
        return OnStackFailure.delete;
    }
    throw Exception('$this is not known in enum OnStackFailure');
  }
}

/// The status that operation results are filtered by.
class OperationResultFilter {
  /// The type of filter to apply.
  final OperationResultFilterName? name;

  /// The value to filter by.
  final String? values;

  OperationResultFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

enum OperationResultFilterName {
  operationResultStatus,
}

extension OperationResultFilterNameValueExtension on OperationResultFilterName {
  String toValue() {
    switch (this) {
      case OperationResultFilterName.operationResultStatus:
        return 'OPERATION_RESULT_STATUS';
    }
  }
}

extension OperationResultFilterNameFromString on String {
  OperationResultFilterName toOperationResultFilterName() {
    switch (this) {
      case 'OPERATION_RESULT_STATUS':
        return OperationResultFilterName.operationResultStatus;
    }
    throw Exception('$this is not known in enum OperationResultFilterName');
  }
}

enum OperationStatus {
  pending,
  inProgress,
  success,
  failed,
}

extension OperationStatusValueExtension on OperationStatus {
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
  }
}

extension OperationStatusFromString on String {
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
    throw Exception('$this is not known in enum OperationStatus');
  }
}

enum OrganizationStatus {
  enabled,
  disabled,
  disabledPermanently,
}

extension OrganizationStatusValueExtension on OrganizationStatus {
  String toValue() {
    switch (this) {
      case OrganizationStatus.enabled:
        return 'ENABLED';
      case OrganizationStatus.disabled:
        return 'DISABLED';
      case OrganizationStatus.disabledPermanently:
        return 'DISABLED_PERMANENTLY';
    }
  }
}

extension OrganizationStatusFromString on String {
  OrganizationStatus toOrganizationStatus() {
    switch (this) {
      case 'ENABLED':
        return OrganizationStatus.enabled;
      case 'DISABLED':
        return OrganizationStatus.disabled;
      case 'DISABLED_PERMANENTLY':
        return OrganizationStatus.disabledPermanently;
    }
    throw Exception('$this is not known in enum OrganizationStatus');
  }
}

/// The Output data type.
class Output {
  /// User defined description associated with the output.
  final String? description;

  /// The name of the export associated with the output.
  final String? exportName;

  /// The key associated with the output.
  final String? outputKey;

  /// The value associated with the output.
  final String? outputValue;

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

  Map<String, dynamic> toJson() {
    final description = this.description;
    final exportName = this.exportName;
    final outputKey = this.outputKey;
    final outputValue = this.outputValue;
    return {
      if (description != null) 'Description': description,
      if (exportName != null) 'ExportName': exportName,
      if (outputKey != null) 'OutputKey': outputKey,
      if (outputValue != null) 'OutputValue': outputValue,
    };
  }
}

/// The Parameter data type.
class Parameter {
  /// The key associated with the parameter. If you don't specify a key and value
  /// for a particular parameter, CloudFormation uses the default value that's
  /// specified in your template.
  final String? parameterKey;

  /// The input value associated with the parameter.
  final String? parameterValue;

  /// Read-only. The value that corresponds to a SSM parameter key. This field is
  /// returned only for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html#aws-ssm-parameter-types">
  /// SSM</a> parameter types in the template.
  final String? resolvedValue;

  /// During a stack update, use the existing parameter value that the stack is
  /// using for a given parameter key. If you specify <code>true</code>, do not
  /// specify a parameter value.
  final bool? usePreviousValue;

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

  Map<String, dynamic> toJson() {
    final parameterKey = this.parameterKey;
    final parameterValue = this.parameterValue;
    final resolvedValue = this.resolvedValue;
    final usePreviousValue = this.usePreviousValue;
    return {
      if (parameterKey != null) 'ParameterKey': parameterKey,
      if (parameterValue != null) 'ParameterValue': parameterValue,
      if (resolvedValue != null) 'ResolvedValue': resolvedValue,
      if (usePreviousValue != null) 'UsePreviousValue': usePreviousValue,
    };
  }
}

/// A set of criteria that CloudFormation uses to validate parameter values.
/// Although other constraints might be defined in the stack template,
/// CloudFormation returns only the <code>AllowedValues</code> property.
class ParameterConstraints {
  /// A list of values that are permitted for a parameter.
  final List<String>? allowedValues;

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

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
    };
  }
}

/// The ParameterDeclaration data type.
class ParameterDeclaration {
  /// The default value of the parameter.
  final String? defaultValue;

  /// The description that's associate with the parameter.
  final String? description;

  /// Flag that indicates whether the parameter value is shown as plain text in
  /// logs and in the Amazon Web Services Management Console.
  final bool? noEcho;

  /// The criteria that CloudFormation uses to validate parameter values.
  final ParameterConstraints? parameterConstraints;

  /// The name that's associated with the parameter.
  final String? parameterKey;

  /// The type of parameter.
  final String? parameterType;

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
          ?.let(ParameterConstraints.fromXml),
      parameterKey: _s.extractXmlStringValue(elem, 'ParameterKey'),
      parameterType: _s.extractXmlStringValue(elem, 'ParameterType'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final description = this.description;
    final noEcho = this.noEcho;
    final parameterConstraints = this.parameterConstraints;
    final parameterKey = this.parameterKey;
    final parameterType = this.parameterType;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (noEcho != null) 'NoEcho': noEcho,
      if (parameterConstraints != null)
        'ParameterConstraints': parameterConstraints,
      if (parameterKey != null) 'ParameterKey': parameterKey,
      if (parameterType != null) 'ParameterType': parameterType,
    };
  }
}

enum PermissionModels {
  serviceManaged,
  selfManaged,
}

extension PermissionModelsValueExtension on PermissionModels {
  String toValue() {
    switch (this) {
      case PermissionModels.serviceManaged:
        return 'SERVICE_MANAGED';
      case PermissionModels.selfManaged:
        return 'SELF_MANAGED';
    }
  }
}

extension PermissionModelsFromString on String {
  PermissionModels toPermissionModels() {
    switch (this) {
      case 'SERVICE_MANAGED':
        return PermissionModels.serviceManaged;
      case 'SELF_MANAGED':
        return PermissionModels.selfManaged;
    }
    throw Exception('$this is not known in enum PermissionModels');
  }
}

/// Context information that enables CloudFormation to uniquely identify a
/// resource. CloudFormation uses context key-value pairs in cases where a
/// resource's logical and physical IDs aren't enough to uniquely identify that
/// resource. Each context key-value pair specifies a resource that contains the
/// targeted resource.
class PhysicalResourceIdContextKeyValuePair {
  /// The resource context key.
  final String key;

  /// The resource context value.
  final String value;

  PhysicalResourceIdContextKeyValuePair({
    required this.key,
    required this.value,
  });
  factory PhysicalResourceIdContextKeyValuePair.fromXml(_s.XmlElement elem) {
    return PhysicalResourceIdContextKeyValuePair(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

enum PolicyAction {
  delete,
  retain,
  snapshot,
  replaceAndDelete,
  replaceAndRetain,
  replaceAndSnapshot,
}

extension PolicyActionValueExtension on PolicyAction {
  String toValue() {
    switch (this) {
      case PolicyAction.delete:
        return 'Delete';
      case PolicyAction.retain:
        return 'Retain';
      case PolicyAction.snapshot:
        return 'Snapshot';
      case PolicyAction.replaceAndDelete:
        return 'ReplaceAndDelete';
      case PolicyAction.replaceAndRetain:
        return 'ReplaceAndRetain';
      case PolicyAction.replaceAndSnapshot:
        return 'ReplaceAndSnapshot';
    }
  }
}

extension PolicyActionFromString on String {
  PolicyAction toPolicyAction() {
    switch (this) {
      case 'Delete':
        return PolicyAction.delete;
      case 'Retain':
        return PolicyAction.retain;
      case 'Snapshot':
        return PolicyAction.snapshot;
      case 'ReplaceAndDelete':
        return PolicyAction.replaceAndDelete;
      case 'ReplaceAndRetain':
        return PolicyAction.replaceAndRetain;
      case 'ReplaceAndSnapshot':
        return PolicyAction.replaceAndSnapshot;
    }
    throw Exception('$this is not known in enum PolicyAction');
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
  /// <code>ADD</code>: A value has been added to a resource property that's an
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
    required this.actualValue,
    required this.differenceType,
    required this.expectedValue,
    required this.propertyPath,
  });
  factory PropertyDifference.fromXml(_s.XmlElement elem) {
    return PropertyDifference(
      actualValue: _s.extractXmlStringValue(elem, 'ActualValue')!,
      differenceType:
          _s.extractXmlStringValue(elem, 'DifferenceType')!.toDifferenceType(),
      expectedValue: _s.extractXmlStringValue(elem, 'ExpectedValue')!,
      propertyPath: _s.extractXmlStringValue(elem, 'PropertyPath')!,
    );
  }

  Map<String, dynamic> toJson() {
    final actualValue = this.actualValue;
    final differenceType = this.differenceType;
    final expectedValue = this.expectedValue;
    final propertyPath = this.propertyPath;
    return {
      'ActualValue': actualValue,
      'DifferenceType': differenceType.toValue(),
      'ExpectedValue': expectedValue,
      'PropertyPath': propertyPath,
    };
  }
}

enum ProvisioningType {
  nonProvisionable,
  immutable,
  fullyMutable,
}

extension ProvisioningTypeValueExtension on ProvisioningType {
  String toValue() {
    switch (this) {
      case ProvisioningType.nonProvisionable:
        return 'NON_PROVISIONABLE';
      case ProvisioningType.immutable:
        return 'IMMUTABLE';
      case ProvisioningType.fullyMutable:
        return 'FULLY_MUTABLE';
    }
  }
}

extension ProvisioningTypeFromString on String {
  ProvisioningType toProvisioningType() {
    switch (this) {
      case 'NON_PROVISIONABLE':
        return ProvisioningType.nonProvisionable;
      case 'IMMUTABLE':
        return ProvisioningType.immutable;
      case 'FULLY_MUTABLE':
        return ProvisioningType.fullyMutable;
    }
    throw Exception('$this is not known in enum ProvisioningType');
  }
}

class PublishTypeOutput {
  /// The Amazon Resource Name (ARN) assigned to the public extension upon
  /// publication.
  final String? publicTypeArn;

  PublishTypeOutput({
    this.publicTypeArn,
  });
  factory PublishTypeOutput.fromXml(_s.XmlElement elem) {
    return PublishTypeOutput(
      publicTypeArn: _s.extractXmlStringValue(elem, 'PublicTypeArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final publicTypeArn = this.publicTypeArn;
    return {
      if (publicTypeArn != null) 'PublicTypeArn': publicTypeArn,
    };
  }
}

enum PublisherStatus {
  verified,
  unverified,
}

extension PublisherStatusValueExtension on PublisherStatus {
  String toValue() {
    switch (this) {
      case PublisherStatus.verified:
        return 'VERIFIED';
      case PublisherStatus.unverified:
        return 'UNVERIFIED';
    }
  }
}

extension PublisherStatusFromString on String {
  PublisherStatus toPublisherStatus() {
    switch (this) {
      case 'VERIFIED':
        return PublisherStatus.verified;
      case 'UNVERIFIED':
        return PublisherStatus.unverified;
    }
    throw Exception('$this is not known in enum PublisherStatus');
  }
}

class RecordHandlerProgressOutput {
  RecordHandlerProgressOutput();
  factory RecordHandlerProgressOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RecordHandlerProgressOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum RegionConcurrencyType {
  sequential,
  parallel,
}

extension RegionConcurrencyTypeValueExtension on RegionConcurrencyType {
  String toValue() {
    switch (this) {
      case RegionConcurrencyType.sequential:
        return 'SEQUENTIAL';
      case RegionConcurrencyType.parallel:
        return 'PARALLEL';
    }
  }
}

extension RegionConcurrencyTypeFromString on String {
  RegionConcurrencyType toRegionConcurrencyType() {
    switch (this) {
      case 'SEQUENTIAL':
        return RegionConcurrencyType.sequential;
      case 'PARALLEL':
        return RegionConcurrencyType.parallel;
    }
    throw Exception('$this is not known in enum RegionConcurrencyType');
  }
}

class RegisterPublisherOutput {
  /// The ID assigned this account by CloudFormation for publishing extensions.
  final String? publisherId;

  RegisterPublisherOutput({
    this.publisherId,
  });
  factory RegisterPublisherOutput.fromXml(_s.XmlElement elem) {
    return RegisterPublisherOutput(
      publisherId: _s.extractXmlStringValue(elem, 'PublisherId'),
    );
  }

  Map<String, dynamic> toJson() {
    final publisherId = this.publisherId;
    return {
      if (publisherId != null) 'PublisherId': publisherId,
    };
  }
}

class RegisterTypeOutput {
  /// The identifier for this registration request.
  ///
  /// Use this registration token when calling <a>DescribeTypeRegistration</a>,
  /// which returns information about the status and IDs of the extension
  /// registration.
  final String? registrationToken;

  RegisterTypeOutput({
    this.registrationToken,
  });
  factory RegisterTypeOutput.fromXml(_s.XmlElement elem) {
    return RegisterTypeOutput(
      registrationToken: _s.extractXmlStringValue(elem, 'RegistrationToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final registrationToken = this.registrationToken;
    return {
      if (registrationToken != null) 'RegistrationToken': registrationToken,
    };
  }
}

enum RegistrationStatus {
  complete,
  inProgress,
  failed,
}

extension RegistrationStatusValueExtension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.complete:
        return 'COMPLETE';
      case RegistrationStatus.inProgress:
        return 'IN_PROGRESS';
      case RegistrationStatus.failed:
        return 'FAILED';
    }
  }
}

extension RegistrationStatusFromString on String {
  RegistrationStatus toRegistrationStatus() {
    switch (this) {
      case 'COMPLETE':
        return RegistrationStatus.complete;
      case 'IN_PROGRESS':
        return RegistrationStatus.inProgress;
      case 'FAILED':
        return RegistrationStatus.failed;
    }
    throw Exception('$this is not known in enum RegistrationStatus');
  }
}

enum RegistryType {
  resource,
  module,
  hook,
}

extension RegistryTypeValueExtension on RegistryType {
  String toValue() {
    switch (this) {
      case RegistryType.resource:
        return 'RESOURCE';
      case RegistryType.module:
        return 'MODULE';
      case RegistryType.hook:
        return 'HOOK';
    }
  }
}

extension RegistryTypeFromString on String {
  RegistryType toRegistryType() {
    switch (this) {
      case 'RESOURCE':
        return RegistryType.resource;
      case 'MODULE':
        return RegistryType.module;
      case 'HOOK':
        return RegistryType.hook;
    }
    throw Exception('$this is not known in enum RegistryType');
  }
}

enum Replacement {
  $true,
  $false,
  conditional,
}

extension ReplacementValueExtension on Replacement {
  String toValue() {
    switch (this) {
      case Replacement.$true:
        return 'True';
      case Replacement.$false:
        return 'False';
      case Replacement.conditional:
        return 'Conditional';
    }
  }
}

extension ReplacementFromString on String {
  Replacement toReplacement() {
    switch (this) {
      case 'True':
        return Replacement.$true;
      case 'False':
        return Replacement.$false;
      case 'Conditional':
        return Replacement.conditional;
    }
    throw Exception('$this is not known in enum Replacement');
  }
}

/// For extensions that are modules, a public third-party extension that must be
/// activated in your account in order for the module itself to be activated.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/modules.html#module-enabling">Activating
/// public modules for use in your account</a> in the <i>CloudFormation User
/// Guide</i>.
class RequiredActivatedType {
  /// The type name of the public extension.
  ///
  /// If you specified a <code>TypeNameAlias</code> when enabling the extension in
  /// this account and Region, CloudFormation treats that alias as the extension's
  /// type name within the account and Region, not the type name of the public
  /// extension. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias">Specifying
  /// aliases to refer to extensions</a> in the <i>CloudFormation User Guide</i>.
  final String? originalTypeName;

  /// The publisher ID of the extension publisher.
  final String? publisherId;

  /// A list of the major versions of the extension type that the macro supports.
  final List<int>? supportedMajorVersions;

  /// An alias assigned to the public extension, in this account and Region. If
  /// you specify an alias for the extension, CloudFormation treats the alias as
  /// the extension type name within this account and Region. You must use the
  /// alias to refer to the extension in your templates, API calls, and
  /// CloudFormation console.
  final String? typeNameAlias;

  RequiredActivatedType({
    this.originalTypeName,
    this.publisherId,
    this.supportedMajorVersions,
    this.typeNameAlias,
  });
  factory RequiredActivatedType.fromXml(_s.XmlElement elem) {
    return RequiredActivatedType(
      originalTypeName: _s.extractXmlStringValue(elem, 'OriginalTypeName'),
      publisherId: _s.extractXmlStringValue(elem, 'PublisherId'),
      supportedMajorVersions: _s
          .extractXmlChild(elem, 'SupportedMajorVersions')
          ?.let((elem) => _s.extractXmlIntListValues(elem, 'member')),
      typeNameAlias: _s.extractXmlStringValue(elem, 'TypeNameAlias'),
    );
  }

  Map<String, dynamic> toJson() {
    final originalTypeName = this.originalTypeName;
    final publisherId = this.publisherId;
    final supportedMajorVersions = this.supportedMajorVersions;
    final typeNameAlias = this.typeNameAlias;
    return {
      if (originalTypeName != null) 'OriginalTypeName': originalTypeName,
      if (publisherId != null) 'PublisherId': publisherId,
      if (supportedMajorVersions != null)
        'SupportedMajorVersions': supportedMajorVersions,
      if (typeNameAlias != null) 'TypeNameAlias': typeNameAlias,
    };
  }
}

enum RequiresRecreation {
  never,
  conditionally,
  always,
}

extension RequiresRecreationValueExtension on RequiresRecreation {
  String toValue() {
    switch (this) {
      case RequiresRecreation.never:
        return 'Never';
      case RequiresRecreation.conditionally:
        return 'Conditionally';
      case RequiresRecreation.always:
        return 'Always';
    }
  }
}

extension RequiresRecreationFromString on String {
  RequiresRecreation toRequiresRecreation() {
    switch (this) {
      case 'Never':
        return RequiresRecreation.never;
      case 'Conditionally':
        return RequiresRecreation.conditionally;
      case 'Always':
        return RequiresRecreation.always;
    }
    throw Exception('$this is not known in enum RequiresRecreation');
  }
}

enum ResourceAttribute {
  properties,
  metadata,
  creationPolicy,
  updatePolicy,
  deletionPolicy,
  updateReplacePolicy,
  tags,
}

extension ResourceAttributeValueExtension on ResourceAttribute {
  String toValue() {
    switch (this) {
      case ResourceAttribute.properties:
        return 'Properties';
      case ResourceAttribute.metadata:
        return 'Metadata';
      case ResourceAttribute.creationPolicy:
        return 'CreationPolicy';
      case ResourceAttribute.updatePolicy:
        return 'UpdatePolicy';
      case ResourceAttribute.deletionPolicy:
        return 'DeletionPolicy';
      case ResourceAttribute.updateReplacePolicy:
        return 'UpdateReplacePolicy';
      case ResourceAttribute.tags:
        return 'Tags';
    }
  }
}

extension ResourceAttributeFromString on String {
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
      case 'UpdateReplacePolicy':
        return ResourceAttribute.updateReplacePolicy;
      case 'Tags':
        return ResourceAttribute.tags;
    }
    throw Exception('$this is not known in enum ResourceAttribute');
  }
}

/// The <code>ResourceChange</code> structure describes the resource and the
/// action that CloudFormation will perform on it if you execute this change
/// set.
class ResourceChange {
  /// The action that CloudFormation takes on the resource, such as
  /// <code>Add</code> (adds a new resource), <code>Modify</code> (changes a
  /// resource), <code>Remove</code> (deletes a resource), <code>Import</code>
  /// (imports a resource), or <code>Dynamic</code> (exact action for the resource
  /// can't be determined).
  final ChangeAction? action;

  /// An encoded JSON string containing the context of the resource after the
  /// change is executed.
  final String? afterContext;

  /// An encoded JSON string containing the context of the resource before the
  /// change is executed.
  final String? beforeContext;

  /// The change set ID of the nested change set.
  final String? changeSetId;

  /// For the <code>Modify</code> action, a list of
  /// <code>ResourceChangeDetail</code> structures that describes the changes that
  /// CloudFormation will make to the resource.
  final List<ResourceChangeDetail>? details;

  /// The resource's logical ID, which is defined in the stack's template.
  final String? logicalResourceId;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo? moduleInfo;

  /// The resource's physical ID (resource name). Resources that you are adding
  /// don't have physical IDs because they haven't been created.
  final String? physicalResourceId;

  /// The action that will be taken on the physical resource when the change set
  /// is executed.
  ///
  /// <ul>
  /// <li>
  /// <code>Delete</code> The resource will be deleted.
  /// </li>
  /// <li>
  /// <code>Retain</code> The resource will be retained.
  /// </li>
  /// <li>
  /// <code>Snapshot</code> The resource will have a snapshot taken.
  /// </li>
  /// <li>
  /// <code>ReplaceAndDelete</code> The resource will be replaced and then
  /// deleted.
  /// </li>
  /// <li>
  /// <code>ReplaceAndRetain</code> The resource will be replaced and then
  /// retained.
  /// </li>
  /// <li>
  /// <code>ReplaceAndSnapshot</code> The resource will be replaced and then have
  /// a snapshot taken.
  /// </li>
  /// </ul>
  final PolicyAction? policyAction;

  /// For the <code>Modify</code> action, indicates whether CloudFormation will
  /// replace the resource by creating a new one and deleting the old one. This
  /// value depends on the value of the <code>RequiresRecreation</code> property
  /// in the <code>ResourceTargetDefinition</code> structure. For example, if the
  /// <code>RequiresRecreation</code> field is <code>Always</code> and the
  /// <code>Evaluation</code> field is <code>Static</code>,
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
  final Replacement? replacement;

  /// The type of CloudFormation resource, such as <code>AWS::S3::Bucket</code>.
  final String? resourceType;

  /// For the <code>Modify</code> action, indicates which resource attribute is
  /// triggering this update, such as a change in the resource attribute's
  /// <code>Metadata</code>, <code>Properties</code>, or <code>Tags</code>.
  final List<ResourceAttribute>? scope;

  ResourceChange({
    this.action,
    this.afterContext,
    this.beforeContext,
    this.changeSetId,
    this.details,
    this.logicalResourceId,
    this.moduleInfo,
    this.physicalResourceId,
    this.policyAction,
    this.replacement,
    this.resourceType,
    this.scope,
  });
  factory ResourceChange.fromXml(_s.XmlElement elem) {
    return ResourceChange(
      action: _s.extractXmlStringValue(elem, 'Action')?.toChangeAction(),
      afterContext: _s.extractXmlStringValue(elem, 'AfterContext'),
      beforeContext: _s.extractXmlStringValue(elem, 'BeforeContext'),
      changeSetId: _s.extractXmlStringValue(elem, 'ChangeSetId'),
      details: _s.extractXmlChild(elem, 'Details')?.let((elem) => elem
          .findElements('member')
          .map(ResourceChangeDetail.fromXml)
          .toList()),
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      moduleInfo:
          _s.extractXmlChild(elem, 'ModuleInfo')?.let(ModuleInfo.fromXml),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      policyAction:
          _s.extractXmlStringValue(elem, 'PolicyAction')?.toPolicyAction(),
      replacement:
          _s.extractXmlStringValue(elem, 'Replacement')?.toReplacement(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      scope: _s.extractXmlChild(elem, 'Scope')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toResourceAttribute())
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final afterContext = this.afterContext;
    final beforeContext = this.beforeContext;
    final changeSetId = this.changeSetId;
    final details = this.details;
    final logicalResourceId = this.logicalResourceId;
    final moduleInfo = this.moduleInfo;
    final physicalResourceId = this.physicalResourceId;
    final policyAction = this.policyAction;
    final replacement = this.replacement;
    final resourceType = this.resourceType;
    final scope = this.scope;
    return {
      if (action != null) 'Action': action.toValue(),
      if (afterContext != null) 'AfterContext': afterContext,
      if (beforeContext != null) 'BeforeContext': beforeContext,
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (details != null) 'Details': details,
      if (logicalResourceId != null) 'LogicalResourceId': logicalResourceId,
      if (moduleInfo != null) 'ModuleInfo': moduleInfo,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (policyAction != null) 'PolicyAction': policyAction.toValue(),
      if (replacement != null) 'Replacement': replacement.toValue(),
      if (resourceType != null) 'ResourceType': resourceType,
      if (scope != null) 'Scope': scope.map((e) => e.toValue()).toList(),
    };
  }
}

/// For a resource with <code>Modify</code> as the action, the
/// <code>ResourceChange</code> structure describes the changes CloudFormation
/// will make to that resource.
class ResourceChangeDetail {
  /// The identity of the entity that triggered this change. This entity is a
  /// member of the group that's specified by the <code>ChangeSource</code> field.
  /// For example, if you modified the value of the <code>KeyPairName</code>
  /// parameter, the <code>CausingEntity</code> is the name of the parameter
  /// (<code>KeyPairName</code>).
  ///
  /// If the <code>ChangeSource</code> value is <code>DirectModification</code>,
  /// no value is given for <code>CausingEntity</code>.
  final String? causingEntity;

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
  /// changes to the <code>AWS::CloudFormation::Stack</code> resource,
  /// CloudFormation sets the <code>ChangeSource</code> to <code>Automatic</code>
  /// because the nested stack's template might have changed. Changes to a nested
  /// stack's template aren't visible to CloudFormation until you run an update on
  /// the parent stack.
  /// </li>
  /// </ul>
  final ChangeSource? changeSource;

  /// Indicates whether CloudFormation can determine the target value, and whether
  /// the target value will change before you execute a change set.
  ///
  /// For <code>Static</code> evaluations, CloudFormation can determine that the
  /// target value will change, and its value. For example, if you directly modify
  /// the <code>InstanceType</code> property of an EC2 instance, CloudFormation
  /// knows that this property value will change, and its value, so this is a
  /// <code>Static</code> evaluation.
  ///
  /// For <code>Dynamic</code> evaluations, can't determine the target value
  /// because it depends on the result of an intrinsic function, such as a
  /// <code>Ref</code> or <code>Fn::GetAtt</code> intrinsic function, when the
  /// stack is updated. For example, if your template includes a reference to a
  /// resource that's conditionally recreated, the value of the reference (the
  /// physical ID of the resource) might change, depending on if the resource is
  /// recreated. If the resource is recreated, it will have a new physical ID, so
  /// all references to that resource will also be updated.
  final EvaluationType? evaluation;

  /// A <code>ResourceTargetDefinition</code> structure that describes the field
  /// that CloudFormation will change and whether the resource will be recreated.
  final ResourceTargetDefinition? target;

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
          ?.let(ResourceTargetDefinition.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final causingEntity = this.causingEntity;
    final changeSource = this.changeSource;
    final evaluation = this.evaluation;
    final target = this.target;
    return {
      if (causingEntity != null) 'CausingEntity': causingEntity,
      if (changeSource != null) 'ChangeSource': changeSource.toValue(),
      if (evaluation != null) 'Evaluation': evaluation.toValue(),
      if (target != null) 'Target': target,
    };
  }
}

/// A resource included in a generated template. This data type is used with the
/// <code>CreateGeneratedTemplate</code> and
/// <code>UpdateGeneratedTemplate</code> API actions.
class ResourceDefinition {
  /// A list of up to 256 key-value pairs that identifies the scanned resource.
  /// The key is the name of one of the primary identifiers for the resource.
  /// (Primary identifiers are specified in the <code>primaryIdentifier</code>
  /// list in the resource schema.) The value is the value of that primary
  /// identifier. For example, for a <code>AWS::DynamoDB::Table</code> resource,
  /// the primary identifiers is <code>TableName</code> so the key-value pair
  /// could be <code>"TableName": "MyDDBTable"</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier">primaryIdentifier</a>
  /// in the <i>CloudFormation Command Line Interface User guide for extension
  /// development</i>.
  final Map<String, String> resourceIdentifier;

  /// The type of the resource, such as <code>AWS::DynamoDB::Table</code>. For the
  /// list of supported resources, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html">IaC
  /// generator supported resource types</a> in the <i>CloudFormation User
  /// Guide</i>
  final String resourceType;

  /// The logical resource id for this resource in the generated template.
  final String? logicalResourceId;

  ResourceDefinition({
    required this.resourceIdentifier,
    required this.resourceType,
    this.logicalResourceId,
  });

  Map<String, dynamic> toJson() {
    final resourceIdentifier = this.resourceIdentifier;
    final resourceType = this.resourceType;
    final logicalResourceId = this.logicalResourceId;
    return {
      'ResourceIdentifier': resourceIdentifier,
      'ResourceType': resourceType,
      if (logicalResourceId != null) 'LogicalResourceId': logicalResourceId,
    };
  }
}

/// Details about a resource in a generated template
class ResourceDetail {
  /// The logical id for this resource in the final generated template.
  final String? logicalResourceId;

  /// A list of up to 256 key-value pairs that identifies the resource in the
  /// generated template. The key is the name of one of the primary identifiers
  /// for the resource. (Primary identifiers are specified in the
  /// <code>primaryIdentifier</code> list in the resource schema.) The value is
  /// the value of that primary identifier. For example, for a
  /// <code>AWS::DynamoDB::Table</code> resource, the primary identifiers is
  /// <code>TableName</code> so the key-value pair could be <code>"TableName":
  /// "MyDDBTable"</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier">primaryIdentifier</a>
  /// in the <i>CloudFormation Command Line Interface User guide for extension
  /// development</i>.
  final Map<String, String>? resourceIdentifier;

  /// Status of the processing of a resource in a generated template.
  /// <dl> <dt>InProgress</dt> <dd>
  /// The resource processing is still in progress.
  /// </dd> <dt>Complete</dt> <dd>
  /// The resource processing is complete.
  /// </dd> <dt>Pending</dt> <dd>
  /// The resource processing is pending.
  /// </dd> <dt>Failed</dt> <dd>
  /// The resource processing has failed.
  /// </dd> </dl>
  final GeneratedTemplateResourceStatus? resourceStatus;

  /// The reason for the resource detail, providing more information if a failure
  /// happened.
  final String? resourceStatusReason;

  /// The type of the resource, such as <code>AWS::DynamoDB::Table</code>. For the
  /// list of supported resources, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html">IaC
  /// generator supported resource types</a> In the <i>CloudFormation User
  /// Guide</i>
  final String? resourceType;

  /// The warnings generated for this resource.
  final List<WarningDetail>? warnings;

  ResourceDetail({
    this.logicalResourceId,
    this.resourceIdentifier,
    this.resourceStatus,
    this.resourceStatusReason,
    this.resourceType,
    this.warnings,
  });
  factory ResourceDetail.fromXml(_s.XmlElement elem) {
    return ResourceDetail(
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId'),
      resourceIdentifier: Map.fromEntries(
        elem.getElement('ResourceIdentifier')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      resourceStatus: _s
          .extractXmlStringValue(elem, 'ResourceStatus')
          ?.toGeneratedTemplateResourceStatus(),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      warnings: _s.extractXmlChild(elem, 'Warnings')?.let((elem) =>
          elem.findElements('member').map(WarningDetail.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final resourceIdentifier = this.resourceIdentifier;
    final resourceStatus = this.resourceStatus;
    final resourceStatusReason = this.resourceStatusReason;
    final resourceType = this.resourceType;
    final warnings = this.warnings;
    return {
      if (logicalResourceId != null) 'LogicalResourceId': logicalResourceId,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
      if (resourceStatus != null) 'ResourceStatus': resourceStatus.toValue(),
      if (resourceStatusReason != null)
        'ResourceStatusReason': resourceStatusReason,
      if (resourceType != null) 'ResourceType': resourceType,
      if (warnings != null) 'Warnings': warnings,
    };
  }
}

/// Describes the target resources of a specific type in your import template
/// (for example, all <code>AWS::S3::Bucket</code> resources) and the properties
/// you can provide during the import to identify resources of that type.
class ResourceIdentifierSummary {
  /// The logical IDs of the target resources of the specified
  /// <code>ResourceType</code>, as defined in the import template.
  final List<String>? logicalResourceIds;

  /// The resource properties you can provide during the import to identify your
  /// target resources. For example, <code>BucketName</code> is a possible
  /// identifier property for <code>AWS::S3::Bucket</code> resources.
  final List<String>? resourceIdentifiers;

  /// The template resource type of the target resources, such as
  /// <code>AWS::S3::Bucket</code>.
  final String? resourceType;

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

  Map<String, dynamic> toJson() {
    final logicalResourceIds = this.logicalResourceIds;
    final resourceIdentifiers = this.resourceIdentifiers;
    final resourceType = this.resourceType;
    return {
      if (logicalResourceIds != null) 'LogicalResourceIds': logicalResourceIds,
      if (resourceIdentifiers != null)
        'ResourceIdentifiers': resourceIdentifiers,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

enum ResourceScanStatus {
  inProgress,
  failed,
  complete,
  expired,
}

extension ResourceScanStatusValueExtension on ResourceScanStatus {
  String toValue() {
    switch (this) {
      case ResourceScanStatus.inProgress:
        return 'IN_PROGRESS';
      case ResourceScanStatus.failed:
        return 'FAILED';
      case ResourceScanStatus.complete:
        return 'COMPLETE';
      case ResourceScanStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension ResourceScanStatusFromString on String {
  ResourceScanStatus toResourceScanStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ResourceScanStatus.inProgress;
      case 'FAILED':
        return ResourceScanStatus.failed;
      case 'COMPLETE':
        return ResourceScanStatus.complete;
      case 'EXPIRED':
        return ResourceScanStatus.expired;
    }
    throw Exception('$this is not known in enum ResourceScanStatus');
  }
}

/// A summary of the resource scan. This is returned by the
/// <code>ListResourceScan</code> API action.
class ResourceScanSummary {
  /// The time that the resource scan was finished.
  final DateTime? endTime;

  /// The percentage of the resource scan that has been completed.
  final double? percentageCompleted;

  /// The Amazon Resource Name (ARN) of the resource scan.
  final String? resourceScanId;

  /// The time that the resource scan was started.
  final DateTime? startTime;

  /// Status of the resource scan.
  /// <dl> <dt>INPROGRESS</dt> <dd>
  /// The resource scan is still in progress.
  /// </dd> <dt>COMPLETE</dt> <dd>
  /// The resource scan is complete.
  /// </dd> <dt>EXPIRED</dt> <dd>
  /// The resource scan has expired.
  /// </dd> <dt>FAILED</dt> <dd>
  /// The resource scan has failed.
  /// </dd> </dl>
  final ResourceScanStatus? status;

  /// The reason for the resource scan status, providing more information if a
  /// failure happened.
  final String? statusReason;

  ResourceScanSummary({
    this.endTime,
    this.percentageCompleted,
    this.resourceScanId,
    this.startTime,
    this.status,
    this.statusReason,
  });
  factory ResourceScanSummary.fromXml(_s.XmlElement elem) {
    return ResourceScanSummary(
      endTime: _s.extractXmlDateTimeValue(elem, 'EndTime'),
      percentageCompleted:
          _s.extractXmlDoubleValue(elem, 'PercentageCompleted'),
      resourceScanId: _s.extractXmlStringValue(elem, 'ResourceScanId'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toResourceScanStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final percentageCompleted = this.percentageCompleted;
    final resourceScanId = this.resourceScanId;
    final startTime = this.startTime;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (endTime != null) 'EndTime': iso8601ToJson(endTime),
      if (percentageCompleted != null)
        'PercentageCompleted': percentageCompleted,
      if (resourceScanId != null) 'ResourceScanId': resourceScanId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum ResourceSignalStatus {
  success,
  failure,
}

extension ResourceSignalStatusValueExtension on ResourceSignalStatus {
  String toValue() {
    switch (this) {
      case ResourceSignalStatus.success:
        return 'SUCCESS';
      case ResourceSignalStatus.failure:
        return 'FAILURE';
    }
  }
}

extension ResourceSignalStatusFromString on String {
  ResourceSignalStatus toResourceSignalStatus() {
    switch (this) {
      case 'SUCCESS':
        return ResourceSignalStatus.success;
      case 'FAILURE':
        return ResourceSignalStatus.failure;
    }
    throw Exception('$this is not known in enum ResourceSignalStatus');
  }
}

enum ResourceStatus {
  createInProgress,
  createFailed,
  createComplete,
  deleteInProgress,
  deleteFailed,
  deleteComplete,
  deleteSkipped,
  updateInProgress,
  updateFailed,
  updateComplete,
  importFailed,
  importComplete,
  importInProgress,
  importRollbackInProgress,
  importRollbackFailed,
  importRollbackComplete,
  updateRollbackInProgress,
  updateRollbackComplete,
  updateRollbackFailed,
  rollbackInProgress,
  rollbackComplete,
  rollbackFailed,
}

extension ResourceStatusValueExtension on ResourceStatus {
  String toValue() {
    switch (this) {
      case ResourceStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ResourceStatus.createFailed:
        return 'CREATE_FAILED';
      case ResourceStatus.createComplete:
        return 'CREATE_COMPLETE';
      case ResourceStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ResourceStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ResourceStatus.deleteComplete:
        return 'DELETE_COMPLETE';
      case ResourceStatus.deleteSkipped:
        return 'DELETE_SKIPPED';
      case ResourceStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case ResourceStatus.updateFailed:
        return 'UPDATE_FAILED';
      case ResourceStatus.updateComplete:
        return 'UPDATE_COMPLETE';
      case ResourceStatus.importFailed:
        return 'IMPORT_FAILED';
      case ResourceStatus.importComplete:
        return 'IMPORT_COMPLETE';
      case ResourceStatus.importInProgress:
        return 'IMPORT_IN_PROGRESS';
      case ResourceStatus.importRollbackInProgress:
        return 'IMPORT_ROLLBACK_IN_PROGRESS';
      case ResourceStatus.importRollbackFailed:
        return 'IMPORT_ROLLBACK_FAILED';
      case ResourceStatus.importRollbackComplete:
        return 'IMPORT_ROLLBACK_COMPLETE';
      case ResourceStatus.updateRollbackInProgress:
        return 'UPDATE_ROLLBACK_IN_PROGRESS';
      case ResourceStatus.updateRollbackComplete:
        return 'UPDATE_ROLLBACK_COMPLETE';
      case ResourceStatus.updateRollbackFailed:
        return 'UPDATE_ROLLBACK_FAILED';
      case ResourceStatus.rollbackInProgress:
        return 'ROLLBACK_IN_PROGRESS';
      case ResourceStatus.rollbackComplete:
        return 'ROLLBACK_COMPLETE';
      case ResourceStatus.rollbackFailed:
        return 'ROLLBACK_FAILED';
    }
  }
}

extension ResourceStatusFromString on String {
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
      case 'UPDATE_ROLLBACK_IN_PROGRESS':
        return ResourceStatus.updateRollbackInProgress;
      case 'UPDATE_ROLLBACK_COMPLETE':
        return ResourceStatus.updateRollbackComplete;
      case 'UPDATE_ROLLBACK_FAILED':
        return ResourceStatus.updateRollbackFailed;
      case 'ROLLBACK_IN_PROGRESS':
        return ResourceStatus.rollbackInProgress;
      case 'ROLLBACK_COMPLETE':
        return ResourceStatus.rollbackComplete;
      case 'ROLLBACK_FAILED':
        return ResourceStatus.rollbackFailed;
    }
    throw Exception('$this is not known in enum ResourceStatus');
  }
}

/// The field that CloudFormation will change, such as the name of a resource's
/// property, and whether the resource will be recreated.
class ResourceTargetDefinition {
  /// The value of the property after the change is executed. Large values can be
  /// truncated.
  final String? afterValue;

  /// Indicates which resource attribute is triggering this update, such as a
  /// change in the resource attribute's <code>Metadata</code>,
  /// <code>Properties</code>, or <code>Tags</code>.
  final ResourceAttribute? attribute;

  /// The type of change to be made to the property if the change is executed.
  ///
  /// <ul>
  /// <li>
  /// <code>Add</code> The item will be added.
  /// </li>
  /// <li>
  /// <code>Remove</code> The item will be removed.
  /// </li>
  /// <li>
  /// <code>Modify</code> The item will be modified.
  /// </li>
  /// </ul>
  final AttributeChangeType? attributeChangeType;

  /// The value of the property before the change is executed. Large values can be
  /// truncated.
  final String? beforeValue;

  /// If the <code>Attribute</code> value is <code>Properties</code>, the name of
  /// the property. For all other attributes, the value is null.
  final String? name;

  /// The property path of the property.
  final String? path;

  /// If the <code>Attribute</code> value is <code>Properties</code>, indicates
  /// whether a change to this property causes the resource to be recreated. The
  /// value can be <code>Never</code>, <code>Always</code>, or
  /// <code>Conditionally</code>. To determine the conditions for a
  /// <code>Conditionally</code> recreation, see the update behavior for that <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">property</a>
  /// in the <i>CloudFormation User Guide</i>.
  final RequiresRecreation? requiresRecreation;

  ResourceTargetDefinition({
    this.afterValue,
    this.attribute,
    this.attributeChangeType,
    this.beforeValue,
    this.name,
    this.path,
    this.requiresRecreation,
  });
  factory ResourceTargetDefinition.fromXml(_s.XmlElement elem) {
    return ResourceTargetDefinition(
      afterValue: _s.extractXmlStringValue(elem, 'AfterValue'),
      attribute:
          _s.extractXmlStringValue(elem, 'Attribute')?.toResourceAttribute(),
      attributeChangeType: _s
          .extractXmlStringValue(elem, 'AttributeChangeType')
          ?.toAttributeChangeType(),
      beforeValue: _s.extractXmlStringValue(elem, 'BeforeValue'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      requiresRecreation: _s
          .extractXmlStringValue(elem, 'RequiresRecreation')
          ?.toRequiresRecreation(),
    );
  }

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final attribute = this.attribute;
    final attributeChangeType = this.attributeChangeType;
    final beforeValue = this.beforeValue;
    final name = this.name;
    final path = this.path;
    final requiresRecreation = this.requiresRecreation;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (attribute != null) 'Attribute': attribute.toValue(),
      if (attributeChangeType != null)
        'AttributeChangeType': attributeChangeType.toValue(),
      if (beforeValue != null) 'BeforeValue': beforeValue,
      if (name != null) 'Name': name,
      if (path != null) 'Path': path,
      if (requiresRecreation != null)
        'RequiresRecreation': requiresRecreation.toValue(),
    };
  }
}

/// Describes the target resource of an import operation.
class ResourceToImport {
  /// The logical ID of the target resource as specified in the template.
  final String logicalResourceId;

  /// A key-value pair that identifies the target resource. The key is an
  /// identifier property (for example, <code>BucketName</code> for
  /// <code>AWS::S3::Bucket</code> resources) and the value is the actual property
  /// value (for example, <code>MyS3Bucket</code>).
  final Map<String, String> resourceIdentifier;

  /// The type of resource to import into your stack, such as
  /// <code>AWS::S3::Bucket</code>. For a list of supported resource types, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html">Resources
  /// that support import operations</a> in the <i>CloudFormation User Guide</i>.
  final String resourceType;

  ResourceToImport({
    required this.logicalResourceId,
    required this.resourceIdentifier,
    required this.resourceType,
  });

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final resourceIdentifier = this.resourceIdentifier;
    final resourceType = this.resourceType;
    return {
      'LogicalResourceId': logicalResourceId,
      'ResourceIdentifier': resourceIdentifier,
      'ResourceType': resourceType,
    };
  }
}

/// Structure containing the rollback triggers for CloudFormation to monitor
/// during stack creation and updating operations, and for the specified
/// monitoring period afterwards.
///
/// Rollback triggers enable you to have CloudFormation monitor the state of
/// your application during stack creation and updating, and to roll back that
/// operation if the application breaches the threshold of any of the alarms
/// you've specified. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-rollback-triggers.html">Monitor
/// and Roll Back Stack Operations</a>.
class RollbackConfiguration {
  /// The amount of time, in minutes, during which CloudFormation should monitor
  /// all the rollback triggers after the stack creation or update operation
  /// deploys all necessary resources.
  ///
  /// The default is 0 minutes.
  ///
  /// If you specify a monitoring period but don't specify any rollback triggers,
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
  final int? monitoringTimeInMinutes;

  /// The triggers to monitor during stack creation or update actions.
  ///
  /// By default, CloudFormation saves the rollback triggers specified for a stack
  /// and applies them to any subsequent update operations for the stack, unless
  /// you specify otherwise. If you do specify rollback triggers for this
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
  /// triggers that you want used for this stack, even triggers you've specified
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
  final List<RollbackTrigger>? rollbackTriggers;

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
              .map(RollbackTrigger.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final monitoringTimeInMinutes = this.monitoringTimeInMinutes;
    final rollbackTriggers = this.rollbackTriggers;
    return {
      if (monitoringTimeInMinutes != null)
        'MonitoringTimeInMinutes': monitoringTimeInMinutes,
      if (rollbackTriggers != null) 'RollbackTriggers': rollbackTriggers,
    };
  }
}

class RollbackStackOutput {
  /// Unique identifier of the stack.
  final String? stackId;

  RollbackStackOutput({
    this.stackId,
  });
  factory RollbackStackOutput.fromXml(_s.XmlElement elem) {
    return RollbackStackOutput(
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    return {
      if (stackId != null) 'StackId': stackId,
    };
  }
}

/// A rollback trigger CloudFormation monitors during creation and updating of
/// stacks. If any of the alarms you specify goes to ALARM state during the
/// stack operation or within the specified monitoring period afterwards,
/// CloudFormation rolls back the entire stack operation.
class RollbackTrigger {
  /// The Amazon Resource Name (ARN) of the rollback trigger.
  ///
  /// If a specified trigger is missing, the entire stack operation fails and is
  /// rolled back.
  final String arn;

  /// The resource type of the rollback trigger. Specify either <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html">AWS::CloudWatch::Alarm</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cloudwatch-compositealarm.html">AWS::CloudWatch::CompositeAlarm</a>
  /// resource types.
  final String type;

  RollbackTrigger({
    required this.arn,
    required this.type,
  });
  factory RollbackTrigger.fromXml(_s.XmlElement elem) {
    return RollbackTrigger(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      type: _s.extractXmlStringValue(elem, 'Type')!,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final type = this.type;
    return {
      'Arn': arn,
      'Type': type,
    };
  }
}

/// A scanned resource returned by <code>ListResourceScanResources</code> or
/// <code>ListResourceScanRelatedResources</code>.
class ScannedResource {
  /// If <code>true</code>, the resource is managed by a CloudFormation stack.
  final bool? managedByStack;

  /// A list of up to 256 key-value pairs that identifies for the scanned
  /// resource. The key is the name of one of the primary identifiers for the
  /// resource. (Primary identifiers are specified in the
  /// <code>primaryIdentifier</code> list in the resource schema.) The value is
  /// the value of that primary identifier. For example, for a
  /// <code>AWS::DynamoDB::Table</code> resource, the primary identifiers is
  /// <code>TableName</code> so the key-value pair could be <code>"TableName":
  /// "MyDDBTable"</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier">primaryIdentifier</a>
  /// in the <i>CloudFormation Command Line Interface User guide for extension
  /// development</i>.
  final Map<String, String>? resourceIdentifier;

  /// The type of the resource, such as <code>AWS::DynamoDB::Table</code>. For the
  /// list of supported resources, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html">Resource
  /// type support</a> In the <i>CloudFormation User Guide</i>
  final String? resourceType;

  ScannedResource({
    this.managedByStack,
    this.resourceIdentifier,
    this.resourceType,
  });
  factory ScannedResource.fromXml(_s.XmlElement elem) {
    return ScannedResource(
      managedByStack: _s.extractXmlBoolValue(elem, 'ManagedByStack'),
      resourceIdentifier: Map.fromEntries(
        elem.getElement('ResourceIdentifier')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
    );
  }

  Map<String, dynamic> toJson() {
    final managedByStack = this.managedByStack;
    final resourceIdentifier = this.resourceIdentifier;
    final resourceType = this.resourceType;
    return {
      if (managedByStack != null) 'ManagedByStack': managedByStack,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// Identifies a scanned resource. This is used with the
/// <code>ListResourceScanRelatedResources</code> API action.
class ScannedResourceIdentifier {
  /// A list of up to 256 key-value pairs that identifies the scanned resource.
  /// The key is the name of one of the primary identifiers for the resource.
  /// (Primary identifiers are specified in the <code>primaryIdentifier</code>
  /// list in the resource schema.) The value is the value of that primary
  /// identifier. For example, for a <code>AWS::DynamoDB::Table</code> resource,
  /// the primary identifiers is <code>TableName</code> so the key-value pair
  /// could be <code>"TableName": "MyDDBTable"</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier">primaryIdentifier</a>
  /// in the <i>CloudFormation Command Line Interface User guide for extension
  /// development</i>.
  final Map<String, String> resourceIdentifier;

  /// The type of the resource, such as <code>AWS::DynamoDB::Table</code>. For the
  /// list of supported resources, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html">IaC
  /// generator supported resource types</a> In the <i>CloudFormation User
  /// Guide</i>.
  final String resourceType;

  ScannedResourceIdentifier({
    required this.resourceIdentifier,
    required this.resourceType,
  });

  Map<String, dynamic> toJson() {
    final resourceIdentifier = this.resourceIdentifier;
    final resourceType = this.resourceType;
    return {
      'ResourceIdentifier': resourceIdentifier,
      'ResourceType': resourceType,
    };
  }
}

class SetTypeConfigurationOutput {
  /// The Amazon Resource Name (ARN) for the configuration data, in this account
  /// and Region.
  ///
  /// Conditional: You must specify <code>ConfigurationArn</code>, or
  /// <code>Type</code> and <code>TypeName</code>.
  final String? configurationArn;

  SetTypeConfigurationOutput({
    this.configurationArn,
  });
  factory SetTypeConfigurationOutput.fromXml(_s.XmlElement elem) {
    return SetTypeConfigurationOutput(
      configurationArn: _s.extractXmlStringValue(elem, 'ConfigurationArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationArn = this.configurationArn;
    return {
      if (configurationArn != null) 'ConfigurationArn': configurationArn,
    };
  }
}

class SetTypeDefaultVersionOutput {
  SetTypeDefaultVersionOutput();
  factory SetTypeDefaultVersionOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetTypeDefaultVersionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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
  final List<Capability>? capabilities;

  /// The unique ID of the change set.
  final String? changeSetId;

  /// Specifies the deletion mode for the stack. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>STANDARD</code> - Use the standard behavior. Specifying this value is
  /// the same as not specifying this parameter.
  /// </li>
  /// <li>
  /// <code>FORCE_DELETE_STACK</code> - Delete the stack if it's stuck in a
  /// <code>DELETE_FAILED</code> state due to resource deletion failure.
  /// </li>
  /// </ul>
  final DeletionMode? deletionMode;

  /// The time the stack was deleted.
  final DateTime? deletionTime;

  /// A user-defined description associated with the stack.
  final String? description;

  /// The detailed status of the resource or stack. If
  /// <code>CONFIGURATION_COMPLETE</code> is present, the resource or resource
  /// configuration phase has completed and the stabilization of the resources is
  /// in progress. The stack sets <code>CONFIGURATION_COMPLETE</code> when all of
  /// the resources in the stack have reached that event. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html">CloudFormation
  /// stack deployment</a> in the <i>CloudFormation User Guide</i>.
  final DetailedStatus? detailedStatus;

  /// Boolean to enable or disable rollback on stack creation failures:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code>: disable rollback.
  /// </li>
  /// <li>
  /// <code>false</code>: enable rollback.
  /// </li>
  /// </ul>
  final bool? disableRollback;

  /// Information about whether a stack's actual configuration differs, or has
  /// <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackDriftInformation? driftInformation;

  /// Whether termination protection is enabled for the stack.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested
  /// stacks</a>, termination protection is set on the root stack and can't be
  /// changed directly on the nested stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting
  /// a Stack From Being Deleted</a> in the <i>CloudFormation User Guide</i>.
  final bool? enableTerminationProtection;

  /// The time the stack was last updated. This field will only be returned if the
  /// stack has been updated at least once.
  final DateTime? lastUpdatedTime;

  /// Amazon SNS topic Amazon Resource Names (ARNs) to which stack related events
  /// are published.
  final List<String>? notificationARNs;

  /// A list of output structures.
  final List<Output>? outputs;

  /// A list of <code>Parameter</code> structures.
  final List<Parameter>? parameters;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the direct parent of this stack. For the first level of nested stacks,
  /// the root stack is also the parent stack.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>CloudFormation User Guide</i>.
  final String? parentId;

  /// When set to <code>true</code>, newly created resources are deleted when the
  /// operation rolls back. This includes newly created resources marked with a
  /// deletion policy of <code>Retain</code>.
  ///
  /// Default: <code>false</code>
  final bool? retainExceptOnCreate;

  /// The Amazon Resource Name (ARN) of an Identity and Access Management (IAM)
  /// role that's associated with the stack. During a stack operation,
  /// CloudFormation uses this role's credentials to make calls on your behalf.
  final String? roleARN;

  /// The rollback triggers for CloudFormation to monitor during stack creation
  /// and updating operations, and for the specified monitoring period afterwards.
  final RollbackConfiguration? rollbackConfiguration;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the top-level stack to which the nested stack ultimately belongs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>CloudFormation User Guide</i>.
  final String? rootId;

  /// Unique identifier of the stack.
  final String? stackId;

  /// Success/failure message associated with the stack status.
  final String? stackStatusReason;

  /// A list of <code>Tag</code>s that specify information about the stack.
  final List<Tag>? tags;

  /// The amount of time within which stack creation should complete.
  final int? timeoutInMinutes;

  Stack({
    required this.creationTime,
    required this.stackName,
    required this.stackStatus,
    this.capabilities,
    this.changeSetId,
    this.deletionMode,
    this.deletionTime,
    this.description,
    this.detailedStatus,
    this.disableRollback,
    this.driftInformation,
    this.enableTerminationProtection,
    this.lastUpdatedTime,
    this.notificationARNs,
    this.outputs,
    this.parameters,
    this.parentId,
    this.retainExceptOnCreate,
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
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime')!,
      stackName: _s.extractXmlStringValue(elem, 'StackName')!,
      stackStatus:
          _s.extractXmlStringValue(elem, 'StackStatus')!.toStackStatus(),
      capabilities: _s.extractXmlChild(elem, 'Capabilities')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toCapability())
          .toList()),
      changeSetId: _s.extractXmlStringValue(elem, 'ChangeSetId'),
      deletionMode:
          _s.extractXmlStringValue(elem, 'DeletionMode')?.toDeletionMode(),
      deletionTime: _s.extractXmlDateTimeValue(elem, 'DeletionTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      detailedStatus:
          _s.extractXmlStringValue(elem, 'DetailedStatus')?.toDetailedStatus(),
      disableRollback: _s.extractXmlBoolValue(elem, 'DisableRollback'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let(StackDriftInformation.fromXml),
      enableTerminationProtection:
          _s.extractXmlBoolValue(elem, 'EnableTerminationProtection'),
      lastUpdatedTime: _s.extractXmlDateTimeValue(elem, 'LastUpdatedTime'),
      notificationARNs: _s
          .extractXmlChild(elem, 'NotificationARNs')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      outputs: _s.extractXmlChild(elem, 'Outputs')?.let(
          (elem) => elem.findElements('member').map(Output.fromXml).toList()),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('member').map(Parameter.fromXml).toList()),
      parentId: _s.extractXmlStringValue(elem, 'ParentId'),
      retainExceptOnCreate:
          _s.extractXmlBoolValue(elem, 'RetainExceptOnCreate'),
      roleARN: _s.extractXmlStringValue(elem, 'RoleARN'),
      rollbackConfiguration: _s
          .extractXmlChild(elem, 'RollbackConfiguration')
          ?.let(RollbackConfiguration.fromXml),
      rootId: _s.extractXmlStringValue(elem, 'RootId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackStatusReason: _s.extractXmlStringValue(elem, 'StackStatusReason'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
      timeoutInMinutes: _s.extractXmlIntValue(elem, 'TimeoutInMinutes'),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final stackName = this.stackName;
    final stackStatus = this.stackStatus;
    final capabilities = this.capabilities;
    final changeSetId = this.changeSetId;
    final deletionMode = this.deletionMode;
    final deletionTime = this.deletionTime;
    final description = this.description;
    final detailedStatus = this.detailedStatus;
    final disableRollback = this.disableRollback;
    final driftInformation = this.driftInformation;
    final enableTerminationProtection = this.enableTerminationProtection;
    final lastUpdatedTime = this.lastUpdatedTime;
    final notificationARNs = this.notificationARNs;
    final outputs = this.outputs;
    final parameters = this.parameters;
    final parentId = this.parentId;
    final retainExceptOnCreate = this.retainExceptOnCreate;
    final roleARN = this.roleARN;
    final rollbackConfiguration = this.rollbackConfiguration;
    final rootId = this.rootId;
    final stackId = this.stackId;
    final stackStatusReason = this.stackStatusReason;
    final tags = this.tags;
    final timeoutInMinutes = this.timeoutInMinutes;
    return {
      'CreationTime': iso8601ToJson(creationTime),
      'StackName': stackName,
      'StackStatus': stackStatus.toValue(),
      if (capabilities != null)
        'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (deletionMode != null) 'DeletionMode': deletionMode.toValue(),
      if (deletionTime != null) 'DeletionTime': iso8601ToJson(deletionTime),
      if (description != null) 'Description': description,
      if (detailedStatus != null) 'DetailedStatus': detailedStatus.toValue(),
      if (disableRollback != null) 'DisableRollback': disableRollback,
      if (driftInformation != null) 'DriftInformation': driftInformation,
      if (enableTerminationProtection != null)
        'EnableTerminationProtection': enableTerminationProtection,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      if (notificationARNs != null) 'NotificationARNs': notificationARNs,
      if (outputs != null) 'Outputs': outputs,
      if (parameters != null) 'Parameters': parameters,
      if (parentId != null) 'ParentId': parentId,
      if (retainExceptOnCreate != null)
        'RetainExceptOnCreate': retainExceptOnCreate,
      if (roleARN != null) 'RoleARN': roleARN,
      if (rollbackConfiguration != null)
        'RollbackConfiguration': rollbackConfiguration,
      if (rootId != null) 'RootId': rootId,
      if (stackId != null) 'StackId': stackId,
      if (stackStatusReason != null) 'StackStatusReason': stackStatusReason,
      if (tags != null) 'Tags': tags,
      if (timeoutInMinutes != null) 'TimeoutInMinutes': timeoutInMinutes,
    };
  }
}

enum StackDriftDetectionStatus {
  detectionInProgress,
  detectionFailed,
  detectionComplete,
}

extension StackDriftDetectionStatusValueExtension on StackDriftDetectionStatus {
  String toValue() {
    switch (this) {
      case StackDriftDetectionStatus.detectionInProgress:
        return 'DETECTION_IN_PROGRESS';
      case StackDriftDetectionStatus.detectionFailed:
        return 'DETECTION_FAILED';
      case StackDriftDetectionStatus.detectionComplete:
        return 'DETECTION_COMPLETE';
    }
  }
}

extension StackDriftDetectionStatusFromString on String {
  StackDriftDetectionStatus toStackDriftDetectionStatus() {
    switch (this) {
      case 'DETECTION_IN_PROGRESS':
        return StackDriftDetectionStatus.detectionInProgress;
      case 'DETECTION_FAILED':
        return StackDriftDetectionStatus.detectionFailed;
      case 'DETECTION_COMPLETE':
        return StackDriftDetectionStatus.detectionComplete;
    }
    throw Exception('$this is not known in enum StackDriftDetectionStatus');
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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked if the stack differs
  /// from its expected template configuration.
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
  final DateTime? lastCheckTimestamp;

  StackDriftInformation({
    required this.stackDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackDriftInformation.fromXml(_s.XmlElement elem) {
    return StackDriftInformation(
      stackDriftStatus: _s
          .extractXmlStringValue(elem, 'StackDriftStatus')!
          .toStackDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackDriftStatus = this.stackDriftStatus;
    final lastCheckTimestamp = this.lastCheckTimestamp;
    return {
      'StackDriftStatus': stackDriftStatus.toValue(),
      if (lastCheckTimestamp != null)
        'LastCheckTimestamp': iso8601ToJson(lastCheckTimestamp),
    };
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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked if the stack differs
  /// from its expected template configuration.
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
  final DateTime? lastCheckTimestamp;

  StackDriftInformationSummary({
    required this.stackDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackDriftInformationSummary.fromXml(_s.XmlElement elem) {
    return StackDriftInformationSummary(
      stackDriftStatus: _s
          .extractXmlStringValue(elem, 'StackDriftStatus')!
          .toStackDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackDriftStatus = this.stackDriftStatus;
    final lastCheckTimestamp = this.lastCheckTimestamp;
    return {
      'StackDriftStatus': stackDriftStatus.toValue(),
      if (lastCheckTimestamp != null)
        'LastCheckTimestamp': iso8601ToJson(lastCheckTimestamp),
    };
  }
}

enum StackDriftStatus {
  drifted,
  inSync,
  unknown,
  notChecked,
}

extension StackDriftStatusValueExtension on StackDriftStatus {
  String toValue() {
    switch (this) {
      case StackDriftStatus.drifted:
        return 'DRIFTED';
      case StackDriftStatus.inSync:
        return 'IN_SYNC';
      case StackDriftStatus.unknown:
        return 'UNKNOWN';
      case StackDriftStatus.notChecked:
        return 'NOT_CHECKED';
    }
  }
}

extension StackDriftStatusFromString on String {
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
    throw Exception('$this is not known in enum StackDriftStatus');
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
  final String? clientRequestToken;

  /// An optional field containing information about the detailed status of the
  /// stack event.
  ///
  /// <ul>
  /// <li>
  /// <code>CONFIGURATION_COMPLETE</code> - all of the resources in the stack have
  /// reached that event. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html">CloudFormation
  /// stack deployment</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>VALIDATION_FAILED</code> - template validation failed because of
  /// invalid properties in the template. The <code>ResourceStatusReason</code>
  /// field shows what properties are defined incorrectly.
  /// </li>
  /// </ul>
  final DetailedStatus? detailedStatus;

  /// Specify the hook failure mode for non-compliant resources in the followings
  /// ways.
  ///
  /// <ul>
  /// <li>
  /// <code>FAIL</code> Stops provisioning resources.
  /// </li>
  /// <li>
  /// <code>WARN</code> Allows provisioning to continue with a warning message.
  /// </li>
  /// </ul>
  final HookFailureMode? hookFailureMode;

  /// Invocation points are points in provisioning logic where hooks are
  /// initiated.
  final HookInvocationPoint? hookInvocationPoint;

  /// Provides the status of the change set hook.
  final HookStatus? hookStatus;

  /// Provides the reason for the hook status.
  final String? hookStatusReason;

  /// The name of the hook.
  final String? hookType;

  /// The logical name of the resource specified in the template.
  final String? logicalResourceId;

  /// The name or unique identifier associated with the physical instance of the
  /// resource.
  final String? physicalResourceId;

  /// BLOB of the properties used to create the resource.
  final String? resourceProperties;

  /// Current status of the resource.
  final ResourceStatus? resourceStatus;

  /// Success/failure message associated with the resource.
  final String? resourceStatusReason;

  /// Type of resource. (For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a> in the <i>CloudFormation User
  /// Guide</i>.)
  final String? resourceType;

  StackEvent({
    required this.eventId,
    required this.stackId,
    required this.stackName,
    required this.timestamp,
    this.clientRequestToken,
    this.detailedStatus,
    this.hookFailureMode,
    this.hookInvocationPoint,
    this.hookStatus,
    this.hookStatusReason,
    this.hookType,
    this.logicalResourceId,
    this.physicalResourceId,
    this.resourceProperties,
    this.resourceStatus,
    this.resourceStatusReason,
    this.resourceType,
  });
  factory StackEvent.fromXml(_s.XmlElement elem) {
    return StackEvent(
      eventId: _s.extractXmlStringValue(elem, 'EventId')!,
      stackId: _s.extractXmlStringValue(elem, 'StackId')!,
      stackName: _s.extractXmlStringValue(elem, 'StackName')!,
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp')!,
      clientRequestToken: _s.extractXmlStringValue(elem, 'ClientRequestToken'),
      detailedStatus:
          _s.extractXmlStringValue(elem, 'DetailedStatus')?.toDetailedStatus(),
      hookFailureMode: _s
          .extractXmlStringValue(elem, 'HookFailureMode')
          ?.toHookFailureMode(),
      hookInvocationPoint: _s
          .extractXmlStringValue(elem, 'HookInvocationPoint')
          ?.toHookInvocationPoint(),
      hookStatus: _s.extractXmlStringValue(elem, 'HookStatus')?.toHookStatus(),
      hookStatusReason: _s.extractXmlStringValue(elem, 'HookStatusReason'),
      hookType: _s.extractXmlStringValue(elem, 'HookType'),
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

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final stackId = this.stackId;
    final stackName = this.stackName;
    final timestamp = this.timestamp;
    final clientRequestToken = this.clientRequestToken;
    final detailedStatus = this.detailedStatus;
    final hookFailureMode = this.hookFailureMode;
    final hookInvocationPoint = this.hookInvocationPoint;
    final hookStatus = this.hookStatus;
    final hookStatusReason = this.hookStatusReason;
    final hookType = this.hookType;
    final logicalResourceId = this.logicalResourceId;
    final physicalResourceId = this.physicalResourceId;
    final resourceProperties = this.resourceProperties;
    final resourceStatus = this.resourceStatus;
    final resourceStatusReason = this.resourceStatusReason;
    final resourceType = this.resourceType;
    return {
      'EventId': eventId,
      'StackId': stackId,
      'StackName': stackName,
      'Timestamp': iso8601ToJson(timestamp),
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (detailedStatus != null) 'DetailedStatus': detailedStatus.toValue(),
      if (hookFailureMode != null) 'HookFailureMode': hookFailureMode.toValue(),
      if (hookInvocationPoint != null)
        'HookInvocationPoint': hookInvocationPoint.toValue(),
      if (hookStatus != null) 'HookStatus': hookStatus.toValue(),
      if (hookStatusReason != null) 'HookStatusReason': hookStatusReason,
      if (hookType != null) 'HookType': hookType,
      if (logicalResourceId != null) 'LogicalResourceId': logicalResourceId,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (resourceProperties != null) 'ResourceProperties': resourceProperties,
      if (resourceStatus != null) 'ResourceStatus': resourceStatus.toValue(),
      if (resourceStatusReason != null)
        'ResourceStatusReason': resourceStatusReason,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// An CloudFormation stack, in a specific account and Region, that's part of a
/// stack set operation. A stack instance is a reference to an attempted or
/// actual stack in a given account within a given Region. A stack instance can
/// exist without a stack—for example, if the stack couldn't be created for some
/// reason. A stack instance is associated with only one stack set. Each stack
/// instance contains the ID of its associated stack set, in addition to the ID
/// of the actual stack and the stack status.
class StackInstance {
  /// [Self-managed permissions] The name of the Amazon Web Services account that
  /// the stack instance is associated with.
  final String? account;

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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked if the stack
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
  final StackDriftStatus? driftStatus;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack instance. This value will be <code>NULL</code> for any stack
  /// instance on which drift detection hasn't yet been performed.
  final DateTime? lastDriftCheckTimestamp;

  /// The last unique ID of a StackSet operation performed on a stack instance.
  final String? lastOperationId;

  /// [Service-managed permissions] The organization root ID or organizational
  /// unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final String? organizationalUnitId;

  /// A list of parameters from the stack set template whose values have been
  /// overridden in this stack instance.
  final List<Parameter>? parameterOverrides;

  /// The name of the Amazon Web Services Region that the stack instance is
  /// associated with.
  final String? region;

  /// The ID of the stack instance.
  final String? stackId;

  /// The detailed status of the stack instance.
  final StackInstanceComprehensiveStatus? stackInstanceStatus;

  /// The name or unique ID of the stack set that the stack instance is associated
  /// with.
  final String? stackSetId;

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
  /// instance, and then delete the stack manually. <code>INOPERABLE</code> can be
  /// returned here when the cause is a failed import. If it's due to a failed
  /// import, the operation can be retried once the failures are fixed. To see if
  /// this is due to a failed import, look at the <code>DetailedStatus</code>
  /// member in the <code>StackInstanceSummary</code> member that is a peer to
  /// this <code>Status</code> member.
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
  final StackInstanceStatus? status;

  /// The explanation for the specific status code that's assigned to this stack
  /// instance.
  final String? statusReason;

  StackInstance({
    this.account,
    this.driftStatus,
    this.lastDriftCheckTimestamp,
    this.lastOperationId,
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
      lastOperationId: _s.extractXmlStringValue(elem, 'LastOperationId'),
      organizationalUnitId:
          _s.extractXmlStringValue(elem, 'OrganizationalUnitId'),
      parameterOverrides: _s.extractXmlChild(elem, 'ParameterOverrides')?.let(
          (elem) =>
              elem.findElements('member').map(Parameter.fromXml).toList()),
      region: _s.extractXmlStringValue(elem, 'Region'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackInstanceStatus: _s
          .extractXmlChild(elem, 'StackInstanceStatus')
          ?.let(StackInstanceComprehensiveStatus.fromXml),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackInstanceStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final driftStatus = this.driftStatus;
    final lastDriftCheckTimestamp = this.lastDriftCheckTimestamp;
    final lastOperationId = this.lastOperationId;
    final organizationalUnitId = this.organizationalUnitId;
    final parameterOverrides = this.parameterOverrides;
    final region = this.region;
    final stackId = this.stackId;
    final stackInstanceStatus = this.stackInstanceStatus;
    final stackSetId = this.stackSetId;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (account != null) 'Account': account,
      if (driftStatus != null) 'DriftStatus': driftStatus.toValue(),
      if (lastDriftCheckTimestamp != null)
        'LastDriftCheckTimestamp': iso8601ToJson(lastDriftCheckTimestamp),
      if (lastOperationId != null) 'LastOperationId': lastOperationId,
      if (organizationalUnitId != null)
        'OrganizationalUnitId': organizationalUnitId,
      if (parameterOverrides != null) 'ParameterOverrides': parameterOverrides,
      if (region != null) 'Region': region,
      if (stackId != null) 'StackId': stackId,
      if (stackInstanceStatus != null)
        'StackInstanceStatus': stackInstanceStatus,
      if (stackSetId != null) 'StackSetId': stackSetId,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// The detailed status of the stack instance.
class StackInstanceComprehensiveStatus {
  /// <ul>
  /// <li>
  /// <code>CANCELLED</code>: The operation in the specified account and Region
  /// has been canceled. This is either because a user has stopped the stack set
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
  /// <code>FAILED_IMPORT</code>: The import of the stack instance in the
  /// specified account and Region failed and left the stack in an unstable state.
  /// Once the issues causing the failure are fixed, the import operation can be
  /// retried. If enough stack set operations fail in enough accounts within a
  /// Region, the failure tolerance for the stack set operation as a whole might
  /// be exceeded.
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
  /// <code>SKIPPED_SUSPENDED_ACCOUNT</code>: The operation in the specified
  /// account and Region has been skipped because the account was suspended at the
  /// time of the operation.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The operation in the specified account and Region
  /// completed successfully.
  /// </li>
  /// </ul>
  final StackInstanceDetailedStatus? detailedStatus;

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

  Map<String, dynamic> toJson() {
    final detailedStatus = this.detailedStatus;
    return {
      if (detailedStatus != null) 'DetailedStatus': detailedStatus.toValue(),
    };
  }
}

enum StackInstanceDetailedStatus {
  pending,
  running,
  succeeded,
  failed,
  cancelled,
  inoperable,
  skippedSuspendedAccount,
  failedImport,
}

extension StackInstanceDetailedStatusValueExtension
    on StackInstanceDetailedStatus {
  String toValue() {
    switch (this) {
      case StackInstanceDetailedStatus.pending:
        return 'PENDING';
      case StackInstanceDetailedStatus.running:
        return 'RUNNING';
      case StackInstanceDetailedStatus.succeeded:
        return 'SUCCEEDED';
      case StackInstanceDetailedStatus.failed:
        return 'FAILED';
      case StackInstanceDetailedStatus.cancelled:
        return 'CANCELLED';
      case StackInstanceDetailedStatus.inoperable:
        return 'INOPERABLE';
      case StackInstanceDetailedStatus.skippedSuspendedAccount:
        return 'SKIPPED_SUSPENDED_ACCOUNT';
      case StackInstanceDetailedStatus.failedImport:
        return 'FAILED_IMPORT';
    }
  }
}

extension StackInstanceDetailedStatusFromString on String {
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
      case 'SKIPPED_SUSPENDED_ACCOUNT':
        return StackInstanceDetailedStatus.skippedSuspendedAccount;
      case 'FAILED_IMPORT':
        return StackInstanceDetailedStatus.failedImport;
    }
    throw Exception('$this is not known in enum StackInstanceDetailedStatus');
  }
}

/// The filter to apply to stack instances
class StackInstanceFilter {
  /// The type of filter to apply.
  final StackInstanceFilterName? name;

  /// The status to filter by.
  final String? values;

  StackInstanceFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

enum StackInstanceFilterName {
  detailedStatus,
  lastOperationId,
  driftStatus,
}

extension StackInstanceFilterNameValueExtension on StackInstanceFilterName {
  String toValue() {
    switch (this) {
      case StackInstanceFilterName.detailedStatus:
        return 'DETAILED_STATUS';
      case StackInstanceFilterName.lastOperationId:
        return 'LAST_OPERATION_ID';
      case StackInstanceFilterName.driftStatus:
        return 'DRIFT_STATUS';
    }
  }
}

extension StackInstanceFilterNameFromString on String {
  StackInstanceFilterName toStackInstanceFilterName() {
    switch (this) {
      case 'DETAILED_STATUS':
        return StackInstanceFilterName.detailedStatus;
      case 'LAST_OPERATION_ID':
        return StackInstanceFilterName.lastOperationId;
      case 'DRIFT_STATUS':
        return StackInstanceFilterName.driftStatus;
    }
    throw Exception('$this is not known in enum StackInstanceFilterName');
  }
}

/// The structure containing summary information about resource drifts for a
/// stack instance.
class StackInstanceResourceDriftsSummary {
  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// Type of resource. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a> in the <i>CloudFormation User
  /// Guide</i>.
  final String resourceType;

  /// The ID of the stack instance.
  final String stackId;

  /// The drift status of the resource in a stack instance.
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
  /// <code>IN_SYNC</code>: The resource's actual configuration matches its
  /// expected template configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: CloudFormation doesn't currently return this
  /// value.
  /// </li>
  /// </ul>
  final StackResourceDriftStatus stackResourceDriftStatus;

  /// Time at which the stack instance drift detection operation was initiated.
  final DateTime timestamp;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// a resource supported by CloudFormation.
  final String? physicalResourceId;

  /// Context information that enables CloudFormation to uniquely identify a
  /// resource. CloudFormation uses context key-value pairs in cases where a
  /// resource's logical and physical IDs aren't enough to uniquely identify that
  /// resource. Each context key-value pair specifies a unique resource that
  /// contains the targeted resource.
  final List<PhysicalResourceIdContextKeyValuePair>? physicalResourceIdContext;

  /// Status of the actual configuration of the resource compared to its expected
  /// configuration. These will be present only for resources whose
  /// <code>StackInstanceResourceDriftStatus</code> is <code>MODIFIED</code>.
  final List<PropertyDifference>? propertyDifferences;

  StackInstanceResourceDriftsSummary({
    required this.logicalResourceId,
    required this.resourceType,
    required this.stackId,
    required this.stackResourceDriftStatus,
    required this.timestamp,
    this.physicalResourceId,
    this.physicalResourceIdContext,
    this.propertyDifferences,
  });
  factory StackInstanceResourceDriftsSummary.fromXml(_s.XmlElement elem) {
    return StackInstanceResourceDriftsSummary(
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId')!,
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType')!,
      stackId: _s.extractXmlStringValue(elem, 'StackId')!,
      stackResourceDriftStatus: _s
          .extractXmlStringValue(elem, 'StackResourceDriftStatus')!
          .toStackResourceDriftStatus(),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp')!,
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      physicalResourceIdContext: _s
          .extractXmlChild(elem, 'PhysicalResourceIdContext')
          ?.let((elem) => elem
              .findElements('member')
              .map(PhysicalResourceIdContextKeyValuePair.fromXml)
              .toList()),
      propertyDifferences: _s.extractXmlChild(elem, 'PropertyDifferences')?.let(
          (elem) => elem
              .findElements('member')
              .map(PropertyDifference.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final resourceType = this.resourceType;
    final stackId = this.stackId;
    final stackResourceDriftStatus = this.stackResourceDriftStatus;
    final timestamp = this.timestamp;
    final physicalResourceId = this.physicalResourceId;
    final physicalResourceIdContext = this.physicalResourceIdContext;
    final propertyDifferences = this.propertyDifferences;
    return {
      'LogicalResourceId': logicalResourceId,
      'ResourceType': resourceType,
      'StackId': stackId,
      'StackResourceDriftStatus': stackResourceDriftStatus.toValue(),
      'Timestamp': iso8601ToJson(timestamp),
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (physicalResourceIdContext != null)
        'PhysicalResourceIdContext': physicalResourceIdContext,
      if (propertyDifferences != null)
        'PropertyDifferences': propertyDifferences,
    };
  }
}

enum StackInstanceStatus {
  current,
  outdated,
  inoperable,
}

extension StackInstanceStatusValueExtension on StackInstanceStatus {
  String toValue() {
    switch (this) {
      case StackInstanceStatus.current:
        return 'CURRENT';
      case StackInstanceStatus.outdated:
        return 'OUTDATED';
      case StackInstanceStatus.inoperable:
        return 'INOPERABLE';
    }
  }
}

extension StackInstanceStatusFromString on String {
  StackInstanceStatus toStackInstanceStatus() {
    switch (this) {
      case 'CURRENT':
        return StackInstanceStatus.current;
      case 'OUTDATED':
        return StackInstanceStatus.outdated;
      case 'INOPERABLE':
        return StackInstanceStatus.inoperable;
    }
    throw Exception('$this is not known in enum StackInstanceStatus');
  }
}

/// The structure that contains summary information about a stack instance.
class StackInstanceSummary {
  /// [Self-managed permissions] The name of the Amazon Web Services account that
  /// the stack instance is associated with.
  final String? account;

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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked if the stack
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
  final StackDriftStatus? driftStatus;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack instance. This value will be <code>NULL</code> for any stack
  /// instance on which drift detection hasn't yet been performed.
  final DateTime? lastDriftCheckTimestamp;

  /// The last unique ID of a StackSet operation performed on a stack instance.
  final String? lastOperationId;

  /// [Service-managed permissions] The organization root ID or organizational
  /// unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final String? organizationalUnitId;

  /// The name of the Amazon Web Services Region that the stack instance is
  /// associated with.
  final String? region;

  /// The ID of the stack instance.
  final String? stackId;

  /// The detailed status of the stack instance.
  final StackInstanceComprehensiveStatus? stackInstanceStatus;

  /// The name or unique ID of the stack set that the stack instance is associated
  /// with.
  final String? stackSetId;

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
  /// instance, and then delete the stack manually. <code>INOPERABLE</code> can be
  /// returned here when the cause is a failed import. If it's due to a failed
  /// import, the operation can be retried once the failures are fixed. To see if
  /// this is due to a failed import, call the <a>DescribeStackInstance</a> API
  /// operation, look at the <code>DetailedStatus</code> member returned in the
  /// <code>StackInstanceSummary</code> member.
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
  final StackInstanceStatus? status;

  /// The explanation for the specific status code assigned to this stack
  /// instance.
  final String? statusReason;

  StackInstanceSummary({
    this.account,
    this.driftStatus,
    this.lastDriftCheckTimestamp,
    this.lastOperationId,
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
      lastOperationId: _s.extractXmlStringValue(elem, 'LastOperationId'),
      organizationalUnitId:
          _s.extractXmlStringValue(elem, 'OrganizationalUnitId'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackInstanceStatus: _s
          .extractXmlChild(elem, 'StackInstanceStatus')
          ?.let(StackInstanceComprehensiveStatus.fromXml),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackInstanceStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final driftStatus = this.driftStatus;
    final lastDriftCheckTimestamp = this.lastDriftCheckTimestamp;
    final lastOperationId = this.lastOperationId;
    final organizationalUnitId = this.organizationalUnitId;
    final region = this.region;
    final stackId = this.stackId;
    final stackInstanceStatus = this.stackInstanceStatus;
    final stackSetId = this.stackSetId;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (account != null) 'Account': account,
      if (driftStatus != null) 'DriftStatus': driftStatus.toValue(),
      if (lastDriftCheckTimestamp != null)
        'LastDriftCheckTimestamp': iso8601ToJson(lastDriftCheckTimestamp),
      if (lastOperationId != null) 'LastOperationId': lastOperationId,
      if (organizationalUnitId != null)
        'OrganizationalUnitId': organizationalUnitId,
      if (region != null) 'Region': region,
      if (stackId != null) 'StackId': stackId,
      if (stackInstanceStatus != null)
        'StackInstanceStatus': stackInstanceStatus,
      if (stackSetId != null) 'StackSetId': stackSetId,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// The StackResource data type.
class StackResource {
  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// Current status of the resource.
  final ResourceStatus resourceStatus;

  /// Type of resource. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a> in the <i>CloudFormation User
  /// Guide</i>.
  final String resourceType;

  /// Time the status was updated.
  final DateTime timestamp;

  /// User defined description associated with the resource.
  final String? description;

  /// Information about whether the resource's actual configuration differs, or
  /// has <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackResourceDriftInformation? driftInformation;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo? moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// a resource supported by CloudFormation.
  final String? physicalResourceId;

  /// Success/failure message associated with the resource.
  final String? resourceStatusReason;

  /// Unique identifier of the stack.
  final String? stackId;

  /// The name associated with the stack.
  final String? stackName;

  StackResource({
    required this.logicalResourceId,
    required this.resourceStatus,
    required this.resourceType,
    required this.timestamp,
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
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId')!,
      resourceStatus:
          _s.extractXmlStringValue(elem, 'ResourceStatus')!.toResourceStatus(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType')!,
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp')!,
      description: _s.extractXmlStringValue(elem, 'Description'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let(StackResourceDriftInformation.fromXml),
      moduleInfo:
          _s.extractXmlChild(elem, 'ModuleInfo')?.let(ModuleInfo.fromXml),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final resourceStatus = this.resourceStatus;
    final resourceType = this.resourceType;
    final timestamp = this.timestamp;
    final description = this.description;
    final driftInformation = this.driftInformation;
    final moduleInfo = this.moduleInfo;
    final physicalResourceId = this.physicalResourceId;
    final resourceStatusReason = this.resourceStatusReason;
    final stackId = this.stackId;
    final stackName = this.stackName;
    return {
      'LogicalResourceId': logicalResourceId,
      'ResourceStatus': resourceStatus.toValue(),
      'ResourceType': resourceType,
      'Timestamp': iso8601ToJson(timestamp),
      if (description != null) 'Description': description,
      if (driftInformation != null) 'DriftInformation': driftInformation,
      if (moduleInfo != null) 'ModuleInfo': moduleInfo,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (resourceStatusReason != null)
        'ResourceStatusReason': resourceStatusReason,
      if (stackId != null) 'StackId': stackId,
      if (stackName != null) 'StackName': stackName,
    };
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

  /// Type of resource. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a> in the <i>CloudFormation User
  /// Guide</i>.
  final String resourceType;

  /// User defined description associated with the resource.
  final String? description;

  /// Information about whether the resource's actual configuration differs, or
  /// has <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackResourceDriftInformation? driftInformation;

  /// The content of the <code>Metadata</code> attribute declared for the
  /// resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-metadata.html">Metadata
  /// Attribute</a> in the <i>CloudFormation User Guide</i>.
  final String? metadata;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo? moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// a resource supported by CloudFormation.
  final String? physicalResourceId;

  /// Success/failure message associated with the resource.
  final String? resourceStatusReason;

  /// Unique identifier of the stack.
  final String? stackId;

  /// The name associated with the stack.
  final String? stackName;

  StackResourceDetail({
    required this.lastUpdatedTimestamp,
    required this.logicalResourceId,
    required this.resourceStatus,
    required this.resourceType,
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
          _s.extractXmlDateTimeValue(elem, 'LastUpdatedTimestamp')!,
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId')!,
      resourceStatus:
          _s.extractXmlStringValue(elem, 'ResourceStatus')!.toResourceStatus(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType')!,
      description: _s.extractXmlStringValue(elem, 'Description'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let(StackResourceDriftInformation.fromXml),
      metadata: _s.extractXmlStringValue(elem, 'Metadata'),
      moduleInfo:
          _s.extractXmlChild(elem, 'ModuleInfo')?.let(ModuleInfo.fromXml),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackName: _s.extractXmlStringValue(elem, 'StackName'),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final logicalResourceId = this.logicalResourceId;
    final resourceStatus = this.resourceStatus;
    final resourceType = this.resourceType;
    final description = this.description;
    final driftInformation = this.driftInformation;
    final metadata = this.metadata;
    final moduleInfo = this.moduleInfo;
    final physicalResourceId = this.physicalResourceId;
    final resourceStatusReason = this.resourceStatusReason;
    final stackId = this.stackId;
    final stackName = this.stackName;
    return {
      'LastUpdatedTimestamp': iso8601ToJson(lastUpdatedTimestamp),
      'LogicalResourceId': logicalResourceId,
      'ResourceStatus': resourceStatus.toValue(),
      'ResourceType': resourceType,
      if (description != null) 'Description': description,
      if (driftInformation != null) 'DriftInformation': driftInformation,
      if (metadata != null) 'Metadata': metadata,
      if (moduleInfo != null) 'ModuleInfo': moduleInfo,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (resourceStatusReason != null)
        'ResourceStatusReason': resourceStatusReason,
      if (stackId != null) 'StackId': stackId,
      if (stackName != null) 'StackName': stackName,
    };
  }
}

/// Contains the drift information for a resource that has been checked for
/// drift. This includes actual and expected property values for resources in
/// which CloudFormation has detected drift. Only resource properties explicitly
/// defined in the stack template are checked for drift. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
/// Unregulated Configuration Changes to Stacks and Resources</a>.
///
/// Resources that don't currently support drift detection can't be checked. For
/// a list of resources that support drift detection, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
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
  /// configuration.
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
  /// <code>IN_SYNC</code>: The resource's actual configuration matches its
  /// expected template configuration.
  /// </li>
  /// <li>
  /// <code>NOT_CHECKED</code>: CloudFormation does not currently return this
  /// value.
  /// </li>
  /// </ul>
  final StackResourceDriftStatus stackResourceDriftStatus;

  /// Time at which CloudFormation performed drift detection on the stack
  /// resource.
  final DateTime timestamp;

  /// A JSON structure containing the actual property values of the stack
  /// resource.
  ///
  /// For resources whose <code>StackResourceDriftStatus</code> is
  /// <code>DELETED</code>, this structure will not be present.
  final String? actualProperties;

  /// A JSON structure containing the expected property values of the stack
  /// resource, as defined in the stack template and any values specified as
  /// template parameters.
  ///
  /// For resources whose <code>StackResourceDriftStatus</code> is
  /// <code>DELETED</code>, this structure will not be present.
  final String? expectedProperties;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo? moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// a resource supported by CloudFormation.
  final String? physicalResourceId;

  /// Context information that enables CloudFormation to uniquely identify a
  /// resource. CloudFormation uses context key-value pairs in cases where a
  /// resource's logical and physical IDs aren't enough to uniquely identify that
  /// resource. Each context key-value pair specifies a unique resource that
  /// contains the targeted resource.
  final List<PhysicalResourceIdContextKeyValuePair>? physicalResourceIdContext;

  /// A collection of the resource properties whose actual values differ from
  /// their expected values. These will be present only for resources whose
  /// <code>StackResourceDriftStatus</code> is <code>MODIFIED</code>.
  final List<PropertyDifference>? propertyDifferences;

  StackResourceDrift({
    required this.logicalResourceId,
    required this.resourceType,
    required this.stackId,
    required this.stackResourceDriftStatus,
    required this.timestamp,
    this.actualProperties,
    this.expectedProperties,
    this.moduleInfo,
    this.physicalResourceId,
    this.physicalResourceIdContext,
    this.propertyDifferences,
  });
  factory StackResourceDrift.fromXml(_s.XmlElement elem) {
    return StackResourceDrift(
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId')!,
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType')!,
      stackId: _s.extractXmlStringValue(elem, 'StackId')!,
      stackResourceDriftStatus: _s
          .extractXmlStringValue(elem, 'StackResourceDriftStatus')!
          .toStackResourceDriftStatus(),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp')!,
      actualProperties: _s.extractXmlStringValue(elem, 'ActualProperties'),
      expectedProperties: _s.extractXmlStringValue(elem, 'ExpectedProperties'),
      moduleInfo:
          _s.extractXmlChild(elem, 'ModuleInfo')?.let(ModuleInfo.fromXml),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      physicalResourceIdContext: _s
          .extractXmlChild(elem, 'PhysicalResourceIdContext')
          ?.let((elem) => elem
              .findElements('member')
              .map(PhysicalResourceIdContextKeyValuePair.fromXml)
              .toList()),
      propertyDifferences: _s.extractXmlChild(elem, 'PropertyDifferences')?.let(
          (elem) => elem
              .findElements('member')
              .map(PropertyDifference.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final resourceType = this.resourceType;
    final stackId = this.stackId;
    final stackResourceDriftStatus = this.stackResourceDriftStatus;
    final timestamp = this.timestamp;
    final actualProperties = this.actualProperties;
    final expectedProperties = this.expectedProperties;
    final moduleInfo = this.moduleInfo;
    final physicalResourceId = this.physicalResourceId;
    final physicalResourceIdContext = this.physicalResourceIdContext;
    final propertyDifferences = this.propertyDifferences;
    return {
      'LogicalResourceId': logicalResourceId,
      'ResourceType': resourceType,
      'StackId': stackId,
      'StackResourceDriftStatus': stackResourceDriftStatus.toValue(),
      'Timestamp': iso8601ToJson(timestamp),
      if (actualProperties != null) 'ActualProperties': actualProperties,
      if (expectedProperties != null) 'ExpectedProperties': expectedProperties,
      if (moduleInfo != null) 'ModuleInfo': moduleInfo,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (physicalResourceIdContext != null)
        'PhysicalResourceIdContext': physicalResourceIdContext,
      if (propertyDifferences != null)
        'PropertyDifferences': propertyDifferences,
    };
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
  /// <code>NOT_CHECKED</code>: CloudFormation has not checked if the resource
  /// differs from its expected configuration.
  ///
  /// Any resources that do not currently support drift detection have a status of
  /// <code>NOT_CHECKED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The resource's actual configuration matches its
  /// expected configuration.
  /// </li>
  /// </ul>
  final StackResourceDriftStatus stackResourceDriftStatus;

  /// When CloudFormation last checked if the resource had drifted from its
  /// expected configuration.
  final DateTime? lastCheckTimestamp;

  StackResourceDriftInformation({
    required this.stackResourceDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackResourceDriftInformation.fromXml(_s.XmlElement elem) {
    return StackResourceDriftInformation(
      stackResourceDriftStatus: _s
          .extractXmlStringValue(elem, 'StackResourceDriftStatus')!
          .toStackResourceDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackResourceDriftStatus = this.stackResourceDriftStatus;
    final lastCheckTimestamp = this.lastCheckTimestamp;
    return {
      'StackResourceDriftStatus': stackResourceDriftStatus.toValue(),
      if (lastCheckTimestamp != null)
        'LastCheckTimestamp': iso8601ToJson(lastCheckTimestamp),
    };
  }
}

/// Summarizes information about whether the resource's actual configuration
/// differs, or has <i>drifted</i>, from its expected configuration.
class StackResourceDriftInformationSummary {
  /// Status of the resource's actual configuration compared to its expected
  /// configuration.
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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked if the resource
  /// differs from its expected configuration.
  ///
  /// Any resources that don't currently support drift detection have a status of
  /// <code>NOT_CHECKED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources
  /// that Support Drift Detection</a>. If you performed an
  /// <a>ContinueUpdateRollback</a> operation on a stack, any resources included
  /// in <code>ResourcesToSkip</code> will also have a status of
  /// <code>NOT_CHECKED</code>. For more information about skipping resources
  /// during rollback operations, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html">Continue
  /// Rolling Back an Update</a> in the CloudFormation User Guide.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: The resource's actual configuration matches its
  /// expected configuration.
  /// </li>
  /// </ul>
  final StackResourceDriftStatus stackResourceDriftStatus;

  /// When CloudFormation last checked if the resource had drifted from its
  /// expected configuration.
  final DateTime? lastCheckTimestamp;

  StackResourceDriftInformationSummary({
    required this.stackResourceDriftStatus,
    this.lastCheckTimestamp,
  });
  factory StackResourceDriftInformationSummary.fromXml(_s.XmlElement elem) {
    return StackResourceDriftInformationSummary(
      stackResourceDriftStatus: _s
          .extractXmlStringValue(elem, 'StackResourceDriftStatus')!
          .toStackResourceDriftStatus(),
      lastCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastCheckTimestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackResourceDriftStatus = this.stackResourceDriftStatus;
    final lastCheckTimestamp = this.lastCheckTimestamp;
    return {
      'StackResourceDriftStatus': stackResourceDriftStatus.toValue(),
      if (lastCheckTimestamp != null)
        'LastCheckTimestamp': iso8601ToJson(lastCheckTimestamp),
    };
  }
}

enum StackResourceDriftStatus {
  inSync,
  modified,
  deleted,
  notChecked,
}

extension StackResourceDriftStatusValueExtension on StackResourceDriftStatus {
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
  }
}

extension StackResourceDriftStatusFromString on String {
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
    throw Exception('$this is not known in enum StackResourceDriftStatus');
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
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a> in the <i>CloudFormation User
  /// Guide</i>.)
  final String resourceType;

  /// Information about whether the resource's actual configuration differs, or
  /// has <i>drifted</i>, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackResourceDriftInformationSummary? driftInformation;

  /// Contains information about the module from which the resource was created,
  /// if the resource was created from a module included in the stack template.
  final ModuleInfo? moduleInfo;

  /// The name or unique identifier that corresponds to a physical instance ID of
  /// the resource.
  final String? physicalResourceId;

  /// Success/failure message associated with the resource.
  final String? resourceStatusReason;

  StackResourceSummary({
    required this.lastUpdatedTimestamp,
    required this.logicalResourceId,
    required this.resourceStatus,
    required this.resourceType,
    this.driftInformation,
    this.moduleInfo,
    this.physicalResourceId,
    this.resourceStatusReason,
  });
  factory StackResourceSummary.fromXml(_s.XmlElement elem) {
    return StackResourceSummary(
      lastUpdatedTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastUpdatedTimestamp')!,
      logicalResourceId: _s.extractXmlStringValue(elem, 'LogicalResourceId')!,
      resourceStatus:
          _s.extractXmlStringValue(elem, 'ResourceStatus')!.toResourceStatus(),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType')!,
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let(StackResourceDriftInformationSummary.fromXml),
      moduleInfo:
          _s.extractXmlChild(elem, 'ModuleInfo')?.let(ModuleInfo.fromXml),
      physicalResourceId: _s.extractXmlStringValue(elem, 'PhysicalResourceId'),
      resourceStatusReason:
          _s.extractXmlStringValue(elem, 'ResourceStatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final logicalResourceId = this.logicalResourceId;
    final resourceStatus = this.resourceStatus;
    final resourceType = this.resourceType;
    final driftInformation = this.driftInformation;
    final moduleInfo = this.moduleInfo;
    final physicalResourceId = this.physicalResourceId;
    final resourceStatusReason = this.resourceStatusReason;
    return {
      'LastUpdatedTimestamp': iso8601ToJson(lastUpdatedTimestamp),
      'LogicalResourceId': logicalResourceId,
      'ResourceStatus': resourceStatus.toValue(),
      'ResourceType': resourceType,
      if (driftInformation != null) 'DriftInformation': driftInformation,
      if (moduleInfo != null) 'ModuleInfo': moduleInfo,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (resourceStatusReason != null)
        'ResourceStatusReason': resourceStatusReason,
    };
  }
}

/// A structure that contains information about a stack set. A stack set enables
/// you to provision stacks into Amazon Web Services accounts and across Regions
/// by using a single CloudFormation template. In the stack set, you specify the
/// template to use, in addition to any parameters and capabilities that the
/// template requires.
class StackSet {
  /// The Amazon Resource Name (ARN) of the IAM role used to create or update the
  /// stack set.
  ///
  /// Use customized administrator roles to control which users or groups can
  /// manage specific stack sets within the same administrator account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Prerequisites:
  /// Granting Permissions for Stack Set Operations</a> in the <i>CloudFormation
  /// User Guide</i>.
  final String? administrationRoleARN;

  /// [Service-managed permissions] Describes whether StackSets automatically
  /// deploys to Organizations accounts that are added to a target organization or
  /// organizational unit (OU).
  final AutoDeployment? autoDeployment;

  /// The capabilities that are allowed in the stack set. Some stack set templates
  /// might include resources that can affect permissions in your Amazon Web
  /// Services account—for example, by creating new Identity and Access Management
  /// (IAM) users. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging
  /// IAM Resources in CloudFormation Templates.</a>
  final List<Capability>? capabilities;

  /// A description of the stack set that you specify when the stack set is
  /// created or updated.
  final String? description;

  /// The name of the IAM execution role used to create or update the stack set.
  ///
  /// Use customized execution roles to control which stack resources users and
  /// groups can include in their stack sets.
  final String? executionRoleName;

  /// Describes whether StackSets performs non-conflicting operations concurrently
  /// and queues conflicting operations.
  final ManagedExecution? managedExecution;

  /// [Service-managed permissions] The organization root ID or organizational
  /// unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final List<String>? organizationalUnitIds;

  /// A list of input parameters for a stack set.
  final List<Parameter>? parameters;

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
  /// creates the IAM roles required to deploy to accounts managed by
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  final PermissionModels? permissionModel;

  /// Returns a list of all Amazon Web Services Regions the given StackSet has
  /// stack instances deployed in. The Amazon Web Services Regions list output is
  /// in no particular order.
  final List<String>? regions;

  /// The Amazon Resource Name (ARN) of the stack set.
  final String? stackSetARN;

  /// Detailed information about the drift status of the stack set.
  ///
  /// For stack sets, contains information about the last <i>completed</i> drift
  /// operation performed on the stack set. Information about drift operations
  /// currently in progress isn't included.
  final StackSetDriftDetectionDetails? stackSetDriftDetectionDetails;

  /// The ID of the stack set.
  final String? stackSetId;

  /// The name that's associated with the stack set.
  final String? stackSetName;

  /// The status of the stack set.
  final StackSetStatus? status;

  /// A list of tags that specify information about the stack set. A maximum
  /// number of 50 tags can be specified.
  final List<Tag>? tags;

  /// The structure that contains the body of the template that was used to create
  /// or update the stack set.
  final String? templateBody;

  StackSet({
    this.administrationRoleARN,
    this.autoDeployment,
    this.capabilities,
    this.description,
    this.executionRoleName,
    this.managedExecution,
    this.organizationalUnitIds,
    this.parameters,
    this.permissionModel,
    this.regions,
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
          ?.let(AutoDeployment.fromXml),
      capabilities: _s.extractXmlChild(elem, 'Capabilities')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toCapability())
          .toList()),
      description: _s.extractXmlStringValue(elem, 'Description'),
      executionRoleName: _s.extractXmlStringValue(elem, 'ExecutionRoleName'),
      managedExecution: _s
          .extractXmlChild(elem, 'ManagedExecution')
          ?.let(ManagedExecution.fromXml),
      organizationalUnitIds: _s
          .extractXmlChild(elem, 'OrganizationalUnitIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('member').map(Parameter.fromXml).toList()),
      permissionModel: _s
          .extractXmlStringValue(elem, 'PermissionModel')
          ?.toPermissionModels(),
      regions: _s
          .extractXmlChild(elem, 'Regions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      stackSetARN: _s.extractXmlStringValue(elem, 'StackSetARN'),
      stackSetDriftDetectionDetails: _s
          .extractXmlChild(elem, 'StackSetDriftDetectionDetails')
          ?.let(StackSetDriftDetectionDetails.fromXml),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      stackSetName: _s.extractXmlStringValue(elem, 'StackSetName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackSetStatus(),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
      templateBody: _s.extractXmlStringValue(elem, 'TemplateBody'),
    );
  }

  Map<String, dynamic> toJson() {
    final administrationRoleARN = this.administrationRoleARN;
    final autoDeployment = this.autoDeployment;
    final capabilities = this.capabilities;
    final description = this.description;
    final executionRoleName = this.executionRoleName;
    final managedExecution = this.managedExecution;
    final organizationalUnitIds = this.organizationalUnitIds;
    final parameters = this.parameters;
    final permissionModel = this.permissionModel;
    final regions = this.regions;
    final stackSetARN = this.stackSetARN;
    final stackSetDriftDetectionDetails = this.stackSetDriftDetectionDetails;
    final stackSetId = this.stackSetId;
    final stackSetName = this.stackSetName;
    final status = this.status;
    final tags = this.tags;
    final templateBody = this.templateBody;
    return {
      if (administrationRoleARN != null)
        'AdministrationRoleARN': administrationRoleARN,
      if (autoDeployment != null) 'AutoDeployment': autoDeployment,
      if (capabilities != null)
        'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (description != null) 'Description': description,
      if (executionRoleName != null) 'ExecutionRoleName': executionRoleName,
      if (managedExecution != null) 'ManagedExecution': managedExecution,
      if (organizationalUnitIds != null)
        'OrganizationalUnitIds': organizationalUnitIds,
      if (parameters != null) 'Parameters': parameters,
      if (permissionModel != null) 'PermissionModel': permissionModel.toValue(),
      if (regions != null) 'Regions': regions,
      if (stackSetARN != null) 'StackSetARN': stackSetARN,
      if (stackSetDriftDetectionDetails != null)
        'StackSetDriftDetectionDetails': stackSetDriftDetectionDetails,
      if (stackSetId != null) 'StackSetId': stackSetId,
      if (stackSetName != null) 'StackSetName': stackSetName,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (templateBody != null) 'TemplateBody': templateBody,
    };
  }
}

/// One of the targets for the stack set. Returned by the <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListStackSetAutoDeploymentTargets.html">ListStackSetAutoDeploymentTargets</a>
/// API operation.
class StackSetAutoDeploymentTargetSummary {
  /// The organization root ID or organizational unit (OU) IDs where the stack set
  /// is targeted.
  final String? organizationalUnitId;

  /// The list of Regions targeted for this organization or OU.
  final List<String>? regions;

  StackSetAutoDeploymentTargetSummary({
    this.organizationalUnitId,
    this.regions,
  });
  factory StackSetAutoDeploymentTargetSummary.fromXml(_s.XmlElement elem) {
    return StackSetAutoDeploymentTargetSummary(
      organizationalUnitId:
          _s.extractXmlStringValue(elem, 'OrganizationalUnitId'),
      regions: _s
          .extractXmlChild(elem, 'Regions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationalUnitId = this.organizationalUnitId;
    final regions = this.regions;
    return {
      if (organizationalUnitId != null)
        'OrganizationalUnitId': organizationalUnitId,
      if (regions != null) 'Regions': regions,
    };
  }
}

/// Detailed information about the drift status of the stack set.
///
/// For stack sets, contains information about the last <i>completed</i> drift
/// operation performed on the stack set. Information about drift operations
/// in-progress isn't included.
///
/// For stack set operations, includes information about drift operations
/// currently being performed on the stack set.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting
/// unmanaged changes in stack sets</a> in the <i>CloudFormation User Guide</i>.
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
  /// <code>STOPPED</code>: The user has canceled the drift detection operation.
  /// </li>
  /// </ul>
  final StackSetDriftDetectionStatus? driftDetectionStatus;

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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked the stack set for
  /// drift.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: All of the stack instances belonging to the stack set
  /// stack match from the expected template and parameter configuration.
  /// </li>
  /// </ul>
  final StackSetDriftStatus? driftStatus;

  /// The number of stack instances that have drifted from the expected template
  /// and parameter configuration of the stack set. A stack instance is considered
  /// to have drifted if one or more of the resources in the associated stack
  /// don't match their expected configuration.
  final int? driftedStackInstancesCount;

  /// The number of stack instances for which the drift detection operation
  /// failed.
  final int? failedStackInstancesCount;

  /// The number of stack instances that are currently being checked for drift.
  final int? inProgressStackInstancesCount;

  /// The number of stack instances which match the expected template and
  /// parameter configuration of the stack set.
  final int? inSyncStackInstancesCount;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack set. This value will be <code>NULL</code> for any stack set on
  /// which drift detection hasn't yet been performed.
  final DateTime? lastDriftCheckTimestamp;

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
  final int? totalStackInstancesCount;

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

  Map<String, dynamic> toJson() {
    final driftDetectionStatus = this.driftDetectionStatus;
    final driftStatus = this.driftStatus;
    final driftedStackInstancesCount = this.driftedStackInstancesCount;
    final failedStackInstancesCount = this.failedStackInstancesCount;
    final inProgressStackInstancesCount = this.inProgressStackInstancesCount;
    final inSyncStackInstancesCount = this.inSyncStackInstancesCount;
    final lastDriftCheckTimestamp = this.lastDriftCheckTimestamp;
    final totalStackInstancesCount = this.totalStackInstancesCount;
    return {
      if (driftDetectionStatus != null)
        'DriftDetectionStatus': driftDetectionStatus.toValue(),
      if (driftStatus != null) 'DriftStatus': driftStatus.toValue(),
      if (driftedStackInstancesCount != null)
        'DriftedStackInstancesCount': driftedStackInstancesCount,
      if (failedStackInstancesCount != null)
        'FailedStackInstancesCount': failedStackInstancesCount,
      if (inProgressStackInstancesCount != null)
        'InProgressStackInstancesCount': inProgressStackInstancesCount,
      if (inSyncStackInstancesCount != null)
        'InSyncStackInstancesCount': inSyncStackInstancesCount,
      if (lastDriftCheckTimestamp != null)
        'LastDriftCheckTimestamp': iso8601ToJson(lastDriftCheckTimestamp),
      if (totalStackInstancesCount != null)
        'TotalStackInstancesCount': totalStackInstancesCount,
    };
  }
}

enum StackSetDriftDetectionStatus {
  completed,
  failed,
  partialSuccess,
  inProgress,
  stopped,
}

extension StackSetDriftDetectionStatusValueExtension
    on StackSetDriftDetectionStatus {
  String toValue() {
    switch (this) {
      case StackSetDriftDetectionStatus.completed:
        return 'COMPLETED';
      case StackSetDriftDetectionStatus.failed:
        return 'FAILED';
      case StackSetDriftDetectionStatus.partialSuccess:
        return 'PARTIAL_SUCCESS';
      case StackSetDriftDetectionStatus.inProgress:
        return 'IN_PROGRESS';
      case StackSetDriftDetectionStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension StackSetDriftDetectionStatusFromString on String {
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
    throw Exception('$this is not known in enum StackSetDriftDetectionStatus');
  }
}

enum StackSetDriftStatus {
  drifted,
  inSync,
  notChecked,
}

extension StackSetDriftStatusValueExtension on StackSetDriftStatus {
  String toValue() {
    switch (this) {
      case StackSetDriftStatus.drifted:
        return 'DRIFTED';
      case StackSetDriftStatus.inSync:
        return 'IN_SYNC';
      case StackSetDriftStatus.notChecked:
        return 'NOT_CHECKED';
    }
  }
}

extension StackSetDriftStatusFromString on String {
  StackSetDriftStatus toStackSetDriftStatus() {
    switch (this) {
      case 'DRIFTED':
        return StackSetDriftStatus.drifted;
      case 'IN_SYNC':
        return StackSetDriftStatus.inSync;
      case 'NOT_CHECKED':
        return StackSetDriftStatus.notChecked;
    }
    throw Exception('$this is not known in enum StackSetDriftStatus');
  }
}

/// The structure that contains information about a stack set operation.
class StackSetOperation {
  /// The type of stack set operation: <code>CREATE</code>, <code>UPDATE</code>,
  /// or <code>DELETE</code>. Create and delete operations affect only the
  /// specified stack set instances that are associated with the specified stack
  /// set. Update operations affect both the stack set itself, in addition to
  /// <i>all</i> associated stack set instances.
  final StackSetOperationAction? action;

  /// The Amazon Resource Name (ARN) of the IAM role used to perform this stack
  /// set operation.
  ///
  /// Use customized administrator roles to control which users or groups can
  /// manage specific stack sets within the same administrator account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Define
  /// Permissions for Multiple Administrators</a> in the <i>CloudFormation User
  /// Guide</i>.
  final String? administrationRoleARN;

  /// The time at which the operation was initiated. Note that the creation times
  /// for the stack set operation might differ from the creation time of the
  /// individual stacks themselves. This is because CloudFormation needs to
  /// perform preparatory work for the operation, such as dispatching the work to
  /// the requested Regions, before actually creating the first stacks.
  final DateTime? creationTimestamp;

  /// [Service-managed permissions] The Organizations accounts affected by the
  /// stack operation.
  final DeploymentTargets? deploymentTargets;

  /// The time at which the stack set operation ended, across all accounts and
  /// Regions specified. Note that this doesn't necessarily mean that the stack
  /// set operation was successful, or even attempted, in each account or Region.
  final DateTime? endTimestamp;

  /// The name of the IAM execution role used to create or update the stack set.
  ///
  /// Use customized execution roles to control which stack resources users and
  /// groups can include in their stack sets.
  final String? executionRoleName;

  /// The unique ID of a stack set operation.
  final String? operationId;

  /// The preferences for how CloudFormation performs this stack set operation.
  final StackSetOperationPreferences? operationPreferences;

  /// For stack set operations of action type <code>DELETE</code>, specifies
  /// whether to remove the stack instances from the specified stack set, but
  /// doesn't delete the stacks. You can't re-associate a retained stack, or add
  /// an existing, saved stack to a new stack set.
  final bool? retainStacks;

  /// Detailed information about the drift status of the stack set. This includes
  /// information about drift operations currently being performed on the stack
  /// set.
  ///
  /// This information will only be present for stack set operations whose
  /// <code>Action</code> type is <code>DETECT_DRIFT</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting
  /// Unmanaged Changes in Stack Sets</a> in the <i>CloudFormation User Guide</i>.
  final StackSetDriftDetectionDetails? stackSetDriftDetectionDetails;

  /// The ID of the stack set.
  final String? stackSetId;

  /// The status of the operation.
  ///
  /// <ul>
  /// <li>
  /// <code>FAILED</code>: The operation exceeded the specified failure tolerance.
  /// The failure tolerance value that you've set for an operation is applied for
  /// each Region during stack create and update operations. If the number of
  /// failed stacks within a Region exceeds the failure tolerance, the status of
  /// the operation in the Region is set to <code>FAILED</code>. This in turn sets
  /// the status of the operation as a whole to <code>FAILED</code>, and
  /// CloudFormation cancels the operation in any remaining Regions.
  /// </li>
  /// <li>
  /// <code>QUEUED</code>: [Service-managed permissions] For automatic deployments
  /// that require a sequence of operations, the operation is queued to be
  /// performed. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes">stack
  /// set operation status codes</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The operation is currently being performed.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>: The user has canceled the operation.
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
  final StackSetOperationStatus? status;

  /// Detailed information about the StackSet operation.
  final StackSetOperationStatusDetails? statusDetails;

  /// The status of the operation in details.
  final String? statusReason;

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
    this.statusDetails,
    this.statusReason,
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
          ?.let(DeploymentTargets.fromXml),
      endTimestamp: _s.extractXmlDateTimeValue(elem, 'EndTimestamp'),
      executionRoleName: _s.extractXmlStringValue(elem, 'ExecutionRoleName'),
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
      operationPreferences: _s
          .extractXmlChild(elem, 'OperationPreferences')
          ?.let(StackSetOperationPreferences.fromXml),
      retainStacks: _s.extractXmlBoolValue(elem, 'RetainStacks'),
      stackSetDriftDetectionDetails: _s
          .extractXmlChild(elem, 'StackSetDriftDetectionDetails')
          ?.let(StackSetDriftDetectionDetails.fromXml),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toStackSetOperationStatus(),
      statusDetails: _s
          .extractXmlChild(elem, 'StatusDetails')
          ?.let(StackSetOperationStatusDetails.fromXml),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final administrationRoleARN = this.administrationRoleARN;
    final creationTimestamp = this.creationTimestamp;
    final deploymentTargets = this.deploymentTargets;
    final endTimestamp = this.endTimestamp;
    final executionRoleName = this.executionRoleName;
    final operationId = this.operationId;
    final operationPreferences = this.operationPreferences;
    final retainStacks = this.retainStacks;
    final stackSetDriftDetectionDetails = this.stackSetDriftDetectionDetails;
    final stackSetId = this.stackSetId;
    final status = this.status;
    final statusDetails = this.statusDetails;
    final statusReason = this.statusReason;
    return {
      if (action != null) 'Action': action.toValue(),
      if (administrationRoleARN != null)
        'AdministrationRoleARN': administrationRoleARN,
      if (creationTimestamp != null)
        'CreationTimestamp': iso8601ToJson(creationTimestamp),
      if (deploymentTargets != null) 'DeploymentTargets': deploymentTargets,
      if (endTimestamp != null) 'EndTimestamp': iso8601ToJson(endTimestamp),
      if (executionRoleName != null) 'ExecutionRoleName': executionRoleName,
      if (operationId != null) 'OperationId': operationId,
      if (operationPreferences != null)
        'OperationPreferences': operationPreferences,
      if (retainStacks != null) 'RetainStacks': retainStacks,
      if (stackSetDriftDetectionDetails != null)
        'StackSetDriftDetectionDetails': stackSetDriftDetectionDetails,
      if (stackSetId != null) 'StackSetId': stackSetId,
      if (status != null) 'Status': status.toValue(),
      if (statusDetails != null) 'StatusDetails': statusDetails,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum StackSetOperationAction {
  create,
  update,
  delete,
  detectDrift,
}

extension StackSetOperationActionValueExtension on StackSetOperationAction {
  String toValue() {
    switch (this) {
      case StackSetOperationAction.create:
        return 'CREATE';
      case StackSetOperationAction.update:
        return 'UPDATE';
      case StackSetOperationAction.delete:
        return 'DELETE';
      case StackSetOperationAction.detectDrift:
        return 'DETECT_DRIFT';
    }
  }
}

extension StackSetOperationActionFromString on String {
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
    throw Exception('$this is not known in enum StackSetOperationAction');
  }
}

/// The user-specified preferences for how CloudFormation performs a stack set
/// operation.
///
/// For more information about maximum concurrent accounts and failure
/// tolerance, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
/// set operation options</a>.
class StackSetOperationPreferences {
  /// Specifies how the concurrency level behaves during the operation execution.
  ///
  /// <ul>
  /// <li>
  /// <code>STRICT_FAILURE_TOLERANCE</code>: This option dynamically lowers the
  /// concurrency level to ensure the number of failed accounts never exceeds the
  /// value of <code>FailureToleranceCount</code> +1. The initial actual
  /// concurrency is set to the lower of either the value of the
  /// <code>MaxConcurrentCount</code>, or the value of
  /// <code>FailureToleranceCount</code> +1. The actual concurrency is then
  /// reduced proportionally by the number of failures. This is the default
  /// behavior.
  ///
  /// If failure tolerance or Maximum concurrent accounts are set to percentages,
  /// the behavior is similar.
  /// </li>
  /// <li>
  /// <code>SOFT_FAILURE_TOLERANCE</code>: This option decouples
  /// <code>FailureToleranceCount</code> from the actual concurrency. This allows
  /// stack set operations to run at the concurrency level set by the
  /// <code>MaxConcurrentCount</code> value, or
  /// <code>MaxConcurrentPercentage</code>, regardless of the number of failures.
  /// </li>
  /// </ul>
  final ConcurrencyMode? concurrencyMode;

  /// The number of accounts, per Region, for which this operation can fail before
  /// CloudFormation stops the operation in that Region. If the operation is
  /// stopped in a Region, CloudFormation doesn't attempt the operation in any
  /// subsequent Regions.
  ///
  /// Conditional: You must specify either <code>FailureToleranceCount</code> or
  /// <code>FailureTolerancePercentage</code> (but not both).
  ///
  /// By default, <code>0</code> is specified.
  final int? failureToleranceCount;

  /// The percentage of accounts, per Region, for which this stack operation can
  /// fail before CloudFormation stops the operation in that Region. If the
  /// operation is stopped in a Region, CloudFormation doesn't attempt the
  /// operation in any subsequent Regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// CloudFormation rounds <i>down</i> to the next whole number.
  ///
  /// Conditional: You must specify either <code>FailureToleranceCount</code> or
  /// <code>FailureTolerancePercentage</code>, but not both.
  ///
  /// By default, <code>0</code> is specified.
  final int? failureTolerancePercentage;

  /// The maximum number of accounts in which to perform this operation at one
  /// time. This can depend on the value of <code>FailureToleranceCount</code>
  /// depending on your <code>ConcurrencyMode</code>.
  /// <code>MaxConcurrentCount</code> is at most one more than the
  /// <code>FailureToleranceCount</code> if you're using
  /// <code>STRICT_FAILURE_TOLERANCE</code>.
  ///
  /// Note that this setting lets you specify the <i>maximum</i> for operations.
  /// For large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Conditional: You must specify either <code>MaxConcurrentCount</code> or
  /// <code>MaxConcurrentPercentage</code>, but not both.
  ///
  /// By default, <code>1</code> is specified.
  final int? maxConcurrentCount;

  /// The maximum percentage of accounts in which to perform this operation at one
  /// time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// CloudFormation rounds down to the next whole number. This is true except in
  /// cases where rounding down would result is zero. In this case, CloudFormation
  /// sets the number as one instead.
  ///
  /// Note that this setting lets you specify the <i>maximum</i> for operations.
  /// For large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Conditional: You must specify either <code>MaxConcurrentCount</code> or
  /// <code>MaxConcurrentPercentage</code>, but not both.
  ///
  /// By default, <code>1</code> is specified.
  final int? maxConcurrentPercentage;

  /// The concurrency type of deploying StackSets operations in Regions, could be
  /// in parallel or one Region at a time.
  final RegionConcurrencyType? regionConcurrencyType;

  /// The order of the Regions where you want to perform the stack operation.
  /// <note>
  /// <code>RegionOrder</code> isn't followed if <code>AutoDeployment</code> is
  /// enabled.
  /// </note>
  final List<String>? regionOrder;

  StackSetOperationPreferences({
    this.concurrencyMode,
    this.failureToleranceCount,
    this.failureTolerancePercentage,
    this.maxConcurrentCount,
    this.maxConcurrentPercentage,
    this.regionConcurrencyType,
    this.regionOrder,
  });
  factory StackSetOperationPreferences.fromXml(_s.XmlElement elem) {
    return StackSetOperationPreferences(
      concurrencyMode: _s
          .extractXmlStringValue(elem, 'ConcurrencyMode')
          ?.toConcurrencyMode(),
      failureToleranceCount:
          _s.extractXmlIntValue(elem, 'FailureToleranceCount'),
      failureTolerancePercentage:
          _s.extractXmlIntValue(elem, 'FailureTolerancePercentage'),
      maxConcurrentCount: _s.extractXmlIntValue(elem, 'MaxConcurrentCount'),
      maxConcurrentPercentage:
          _s.extractXmlIntValue(elem, 'MaxConcurrentPercentage'),
      regionConcurrencyType: _s
          .extractXmlStringValue(elem, 'RegionConcurrencyType')
          ?.toRegionConcurrencyType(),
      regionOrder: _s
          .extractXmlChild(elem, 'RegionOrder')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final concurrencyMode = this.concurrencyMode;
    final failureToleranceCount = this.failureToleranceCount;
    final failureTolerancePercentage = this.failureTolerancePercentage;
    final maxConcurrentCount = this.maxConcurrentCount;
    final maxConcurrentPercentage = this.maxConcurrentPercentage;
    final regionConcurrencyType = this.regionConcurrencyType;
    final regionOrder = this.regionOrder;
    return {
      if (concurrencyMode != null) 'ConcurrencyMode': concurrencyMode.toValue(),
      if (failureToleranceCount != null)
        'FailureToleranceCount': failureToleranceCount,
      if (failureTolerancePercentage != null)
        'FailureTolerancePercentage': failureTolerancePercentage,
      if (maxConcurrentCount != null) 'MaxConcurrentCount': maxConcurrentCount,
      if (maxConcurrentPercentage != null)
        'MaxConcurrentPercentage': maxConcurrentPercentage,
      if (regionConcurrencyType != null)
        'RegionConcurrencyType': regionConcurrencyType.toValue(),
      if (regionOrder != null) 'RegionOrder': regionOrder,
    };
  }
}

enum StackSetOperationResultStatus {
  pending,
  running,
  succeeded,
  failed,
  cancelled,
}

extension StackSetOperationResultStatusValueExtension
    on StackSetOperationResultStatus {
  String toValue() {
    switch (this) {
      case StackSetOperationResultStatus.pending:
        return 'PENDING';
      case StackSetOperationResultStatus.running:
        return 'RUNNING';
      case StackSetOperationResultStatus.succeeded:
        return 'SUCCEEDED';
      case StackSetOperationResultStatus.failed:
        return 'FAILED';
      case StackSetOperationResultStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension StackSetOperationResultStatusFromString on String {
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
    throw Exception('$this is not known in enum StackSetOperationResultStatus');
  }
}

/// The structure that contains information about a specified operation's
/// results for a given account in a given Region.
class StackSetOperationResultSummary {
  /// [Self-managed permissions] The name of the Amazon Web Services account for
  /// this operation result.
  final String? account;

  /// The results of the account gate function CloudFormation invokes, if present,
  /// before proceeding with stack set operations in an account.
  final AccountGateResult? accountGateResult;

  /// [Service-managed permissions] The organization root ID or organizational
  /// unit (OU) IDs that you specified for <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.
  final String? organizationalUnitId;

  /// The name of the Amazon Web Services Region for this operation result.
  final String? region;

  /// The result status of the stack set operation for the given account in the
  /// given Region.
  ///
  /// <ul>
  /// <li>
  /// <code>CANCELLED</code>: The operation in the specified account and Region
  /// has been canceled. This is either because a user has stopped the stack set
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
  final StackSetOperationResultStatus? status;

  /// The reason for the assigned result status.
  final String? statusReason;

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
          ?.let(AccountGateResult.fromXml),
      organizationalUnitId:
          _s.extractXmlStringValue(elem, 'OrganizationalUnitId'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toStackSetOperationResultStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final accountGateResult = this.accountGateResult;
    final organizationalUnitId = this.organizationalUnitId;
    final region = this.region;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (account != null) 'Account': account,
      if (accountGateResult != null) 'AccountGateResult': accountGateResult,
      if (organizationalUnitId != null)
        'OrganizationalUnitId': organizationalUnitId,
      if (region != null) 'Region': region,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum StackSetOperationStatus {
  running,
  succeeded,
  failed,
  stopping,
  stopped,
  queued,
}

extension StackSetOperationStatusValueExtension on StackSetOperationStatus {
  String toValue() {
    switch (this) {
      case StackSetOperationStatus.running:
        return 'RUNNING';
      case StackSetOperationStatus.succeeded:
        return 'SUCCEEDED';
      case StackSetOperationStatus.failed:
        return 'FAILED';
      case StackSetOperationStatus.stopping:
        return 'STOPPING';
      case StackSetOperationStatus.stopped:
        return 'STOPPED';
      case StackSetOperationStatus.queued:
        return 'QUEUED';
    }
  }
}

extension StackSetOperationStatusFromString on String {
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
    throw Exception('$this is not known in enum StackSetOperationStatus');
  }
}

/// Detailed information about the StackSet operation.
class StackSetOperationStatusDetails {
  /// The number of stack instances for which the StackSet operation failed.
  final int? failedStackInstancesCount;

  StackSetOperationStatusDetails({
    this.failedStackInstancesCount,
  });
  factory StackSetOperationStatusDetails.fromXml(_s.XmlElement elem) {
    return StackSetOperationStatusDetails(
      failedStackInstancesCount:
          _s.extractXmlIntValue(elem, 'FailedStackInstancesCount'),
    );
  }

  Map<String, dynamic> toJson() {
    final failedStackInstancesCount = this.failedStackInstancesCount;
    return {
      if (failedStackInstancesCount != null)
        'FailedStackInstancesCount': failedStackInstancesCount,
    };
  }
}

/// The structures that contain summary information about the specified
/// operation.
class StackSetOperationSummary {
  /// The type of operation: <code>CREATE</code>, <code>UPDATE</code>, or
  /// <code>DELETE</code>. Create and delete operations affect only the specified
  /// stack instances that are associated with the specified stack set. Update
  /// operations affect both the stack set itself and <i>all</i> associated stack
  /// set instances.
  final StackSetOperationAction? action;

  /// The time at which the operation was initiated. Note that the creation times
  /// for the stack set operation might differ from the creation time of the
  /// individual stacks themselves. This is because CloudFormation needs to
  /// perform preparatory work for the operation, such as dispatching the work to
  /// the requested Regions, before actually creating the first stacks.
  final DateTime? creationTimestamp;

  /// The time at which the stack set operation ended, across all accounts and
  /// Regions specified. Note that this doesn't necessarily mean that the stack
  /// set operation was successful, or even attempted, in each account or Region.
  final DateTime? endTimestamp;

  /// The unique ID of the stack set operation.
  final String? operationId;

  /// The user-specified preferences for how CloudFormation performs a stack set
  /// operation.
  ///
  /// For more information about maximum concurrent accounts and failure
  /// tolerance, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
  /// set operation options</a>.
  final StackSetOperationPreferences? operationPreferences;

  /// The overall status of the operation.
  ///
  /// <ul>
  /// <li>
  /// <code>FAILED</code>: The operation exceeded the specified failure tolerance.
  /// The failure tolerance value that you've set for an operation is applied for
  /// each Region during stack create and update operations. If the number of
  /// failed stacks within a Region exceeds the failure tolerance, the status of
  /// the operation in the Region is set to <code>FAILED</code>. This in turn sets
  /// the status of the operation as a whole to <code>FAILED</code>, and
  /// CloudFormation cancels the operation in any remaining Regions.
  /// </li>
  /// <li>
  /// <code>QUEUED</code>: [Service-managed permissions] For automatic deployments
  /// that require a sequence of operations, the operation is queued to be
  /// performed. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes">stack
  /// set operation status codes</a> in the <i>CloudFormation User Guide</i>.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The operation is currently being performed.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>: The user has canceled the operation.
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
  final StackSetOperationStatus? status;

  /// Detailed information about the stack set operation.
  final StackSetOperationStatusDetails? statusDetails;

  /// The status of the operation in details.
  final String? statusReason;

  StackSetOperationSummary({
    this.action,
    this.creationTimestamp,
    this.endTimestamp,
    this.operationId,
    this.operationPreferences,
    this.status,
    this.statusDetails,
    this.statusReason,
  });
  factory StackSetOperationSummary.fromXml(_s.XmlElement elem) {
    return StackSetOperationSummary(
      action:
          _s.extractXmlStringValue(elem, 'Action')?.toStackSetOperationAction(),
      creationTimestamp: _s.extractXmlDateTimeValue(elem, 'CreationTimestamp'),
      endTimestamp: _s.extractXmlDateTimeValue(elem, 'EndTimestamp'),
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
      operationPreferences: _s
          .extractXmlChild(elem, 'OperationPreferences')
          ?.let(StackSetOperationPreferences.fromXml),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toStackSetOperationStatus(),
      statusDetails: _s
          .extractXmlChild(elem, 'StatusDetails')
          ?.let(StackSetOperationStatusDetails.fromXml),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final creationTimestamp = this.creationTimestamp;
    final endTimestamp = this.endTimestamp;
    final operationId = this.operationId;
    final operationPreferences = this.operationPreferences;
    final status = this.status;
    final statusDetails = this.statusDetails;
    final statusReason = this.statusReason;
    return {
      if (action != null) 'Action': action.toValue(),
      if (creationTimestamp != null)
        'CreationTimestamp': iso8601ToJson(creationTimestamp),
      if (endTimestamp != null) 'EndTimestamp': iso8601ToJson(endTimestamp),
      if (operationId != null) 'OperationId': operationId,
      if (operationPreferences != null)
        'OperationPreferences': operationPreferences,
      if (status != null) 'Status': status.toValue(),
      if (statusDetails != null) 'StatusDetails': statusDetails,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum StackSetStatus {
  active,
  deleted,
}

extension StackSetStatusValueExtension on StackSetStatus {
  String toValue() {
    switch (this) {
      case StackSetStatus.active:
        return 'ACTIVE';
      case StackSetStatus.deleted:
        return 'DELETED';
    }
  }
}

extension StackSetStatusFromString on String {
  StackSetStatus toStackSetStatus() {
    switch (this) {
      case 'ACTIVE':
        return StackSetStatus.active;
      case 'DELETED':
        return StackSetStatus.deleted;
    }
    throw Exception('$this is not known in enum StackSetStatus');
  }
}

/// The structures that contain summary information about the specified stack
/// set.
class StackSetSummary {
  /// [Service-managed permissions] Describes whether StackSets automatically
  /// deploys to Organizations accounts that are added to a target organizational
  /// unit (OU).
  final AutoDeployment? autoDeployment;

  /// A description of the stack set that you specify when the stack set is
  /// created or updated.
  final String? description;

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
  /// <code>NOT_CHECKED</code>: CloudFormation hasn't checked the stack set for
  /// drift.
  /// </li>
  /// <li>
  /// <code>IN_SYNC</code>: All the stack instances belonging to the stack set
  /// stack match from the expected template and parameter configuration.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>: This value is reserved for future use.
  /// </li>
  /// </ul>
  final StackDriftStatus? driftStatus;

  /// Most recent time when CloudFormation performed a drift detection operation
  /// on the stack set. This value will be <code>NULL</code> for any stack set on
  /// which drift detection hasn't yet been performed.
  final DateTime? lastDriftCheckTimestamp;

  /// Describes whether StackSets performs non-conflicting operations concurrently
  /// and queues conflicting operations.
  final ManagedExecution? managedExecution;

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
  /// creates the IAM roles required to deploy to accounts managed by
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant
  /// Service-Managed Stack Set Permissions</a>.
  /// </li>
  /// </ul>
  final PermissionModels? permissionModel;

  /// The ID of the stack set.
  final String? stackSetId;

  /// The name of the stack set.
  final String? stackSetName;

  /// The status of the stack set.
  final StackSetStatus? status;

  StackSetSummary({
    this.autoDeployment,
    this.description,
    this.driftStatus,
    this.lastDriftCheckTimestamp,
    this.managedExecution,
    this.permissionModel,
    this.stackSetId,
    this.stackSetName,
    this.status,
  });
  factory StackSetSummary.fromXml(_s.XmlElement elem) {
    return StackSetSummary(
      autoDeployment: _s
          .extractXmlChild(elem, 'AutoDeployment')
          ?.let(AutoDeployment.fromXml),
      description: _s.extractXmlStringValue(elem, 'Description'),
      driftStatus:
          _s.extractXmlStringValue(elem, 'DriftStatus')?.toStackDriftStatus(),
      lastDriftCheckTimestamp:
          _s.extractXmlDateTimeValue(elem, 'LastDriftCheckTimestamp'),
      managedExecution: _s
          .extractXmlChild(elem, 'ManagedExecution')
          ?.let(ManagedExecution.fromXml),
      permissionModel: _s
          .extractXmlStringValue(elem, 'PermissionModel')
          ?.toPermissionModels(),
      stackSetId: _s.extractXmlStringValue(elem, 'StackSetId'),
      stackSetName: _s.extractXmlStringValue(elem, 'StackSetName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStackSetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoDeployment = this.autoDeployment;
    final description = this.description;
    final driftStatus = this.driftStatus;
    final lastDriftCheckTimestamp = this.lastDriftCheckTimestamp;
    final managedExecution = this.managedExecution;
    final permissionModel = this.permissionModel;
    final stackSetId = this.stackSetId;
    final stackSetName = this.stackSetName;
    final status = this.status;
    return {
      if (autoDeployment != null) 'AutoDeployment': autoDeployment,
      if (description != null) 'Description': description,
      if (driftStatus != null) 'DriftStatus': driftStatus.toValue(),
      if (lastDriftCheckTimestamp != null)
        'LastDriftCheckTimestamp': iso8601ToJson(lastDriftCheckTimestamp),
      if (managedExecution != null) 'ManagedExecution': managedExecution,
      if (permissionModel != null) 'PermissionModel': permissionModel.toValue(),
      if (stackSetId != null) 'StackSetId': stackSetId,
      if (stackSetName != null) 'StackSetName': stackSetName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum StackStatus {
  createInProgress,
  createFailed,
  createComplete,
  rollbackInProgress,
  rollbackFailed,
  rollbackComplete,
  deleteInProgress,
  deleteFailed,
  deleteComplete,
  updateInProgress,
  updateCompleteCleanupInProgress,
  updateComplete,
  updateFailed,
  updateRollbackInProgress,
  updateRollbackFailed,
  updateRollbackCompleteCleanupInProgress,
  updateRollbackComplete,
  reviewInProgress,
  importInProgress,
  importComplete,
  importRollbackInProgress,
  importRollbackFailed,
  importRollbackComplete,
}

extension StackStatusValueExtension on StackStatus {
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
      case StackStatus.updateFailed:
        return 'UPDATE_FAILED';
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
  }
}

extension StackStatusFromString on String {
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
      case 'UPDATE_FAILED':
        return StackStatus.updateFailed;
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
    throw Exception('$this is not known in enum StackStatus');
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
  final DateTime? deletionTime;

  /// Summarizes information about whether a stack's actual configuration differs,
  /// or has <i>drifted</i>, from its expected configuration, as defined in the
  /// stack template and any values specified as template parameters. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting
  /// Unregulated Configuration Changes to Stacks and Resources</a>.
  final StackDriftInformationSummary? driftInformation;

  /// The time the stack was last updated. This field will only be returned if the
  /// stack has been updated at least once.
  final DateTime? lastUpdatedTime;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the direct parent of this stack. For the first level of nested stacks,
  /// the root stack is also the parent stack.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>CloudFormation User Guide</i>.
  final String? parentId;

  /// For nested stacks--stacks created as resources for another stack--the stack
  /// ID of the top-level stack to which the nested stack ultimately belongs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working
  /// with Nested Stacks</a> in the <i>CloudFormation User Guide</i>.
  final String? rootId;

  /// Unique stack identifier.
  final String? stackId;

  /// Success/Failure message associated with the stack status.
  final String? stackStatusReason;

  /// The template description of the template used to create the stack.
  final String? templateDescription;

  StackSummary({
    required this.creationTime,
    required this.stackName,
    required this.stackStatus,
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
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime')!,
      stackName: _s.extractXmlStringValue(elem, 'StackName')!,
      stackStatus:
          _s.extractXmlStringValue(elem, 'StackStatus')!.toStackStatus(),
      deletionTime: _s.extractXmlDateTimeValue(elem, 'DeletionTime'),
      driftInformation: _s
          .extractXmlChild(elem, 'DriftInformation')
          ?.let(StackDriftInformationSummary.fromXml),
      lastUpdatedTime: _s.extractXmlDateTimeValue(elem, 'LastUpdatedTime'),
      parentId: _s.extractXmlStringValue(elem, 'ParentId'),
      rootId: _s.extractXmlStringValue(elem, 'RootId'),
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
      stackStatusReason: _s.extractXmlStringValue(elem, 'StackStatusReason'),
      templateDescription:
          _s.extractXmlStringValue(elem, 'TemplateDescription'),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final stackName = this.stackName;
    final stackStatus = this.stackStatus;
    final deletionTime = this.deletionTime;
    final driftInformation = this.driftInformation;
    final lastUpdatedTime = this.lastUpdatedTime;
    final parentId = this.parentId;
    final rootId = this.rootId;
    final stackId = this.stackId;
    final stackStatusReason = this.stackStatusReason;
    final templateDescription = this.templateDescription;
    return {
      'CreationTime': iso8601ToJson(creationTime),
      'StackName': stackName,
      'StackStatus': stackStatus.toValue(),
      if (deletionTime != null) 'DeletionTime': iso8601ToJson(deletionTime),
      if (driftInformation != null) 'DriftInformation': driftInformation,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      if (parentId != null) 'ParentId': parentId,
      if (rootId != null) 'RootId': rootId,
      if (stackId != null) 'StackId': stackId,
      if (stackStatusReason != null) 'StackStatusReason': stackStatusReason,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
    };
  }
}

class StartResourceScanOutput {
  /// The Amazon Resource Name (ARN) of the resource scan. The format is
  /// <code>arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id}</code>.
  /// An example is
  /// <code>arn:aws:cloudformation:<i>us-east-1</i>:<i>123456789012</i>:resourceScan/<i>f5b490f7-7ed4-428a-aa06-31ff25db0772</i>
  /// </code>.
  final String? resourceScanId;

  StartResourceScanOutput({
    this.resourceScanId,
  });
  factory StartResourceScanOutput.fromXml(_s.XmlElement elem) {
    return StartResourceScanOutput(
      resourceScanId: _s.extractXmlStringValue(elem, 'ResourceScanId'),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceScanId = this.resourceScanId;
    return {
      if (resourceScanId != null) 'ResourceScanId': resourceScanId,
    };
  }
}

class StopStackSetOperationOutput {
  StopStackSetOperationOutput();
  factory StopStackSetOperationOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return StopStackSetOperationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The Tag type enables you to specify a key-value pair that can be used to
/// store information about an CloudFormation stack.
class Tag {
  /// <i>Required</i>. A string used to identify this tag. You can specify a
  /// maximum of 128 characters for a tag key. Tags owned by Amazon Web Services
  /// (Amazon Web Services) have the reserved prefix: <code>aws:</code>.
  final String key;

  /// <i>Required</i>. A string containing the value for this tag. You can specify
  /// a maximum of 256 characters for a tag value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// The configuration details of a generated template.
class TemplateConfiguration {
  /// The <code>DeletionPolicy</code> assigned to resources in the generated
  /// template. Supported values are:
  ///
  /// <ul>
  /// <li>
  /// <code>DELETE</code> - delete all resources when the stack is deleted.
  /// </li>
  /// <li>
  /// <code>RETAIN</code> - retain all resources when the stack is deleted.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-deletionpolicy.html">DeletionPolicy
  /// attribute</a> in the <i>CloudFormation User Guide</i>.
  final GeneratedTemplateDeletionPolicy? deletionPolicy;

  /// The <code>UpdateReplacePolicy</code> assigned to resources in the generated
  /// template. Supported values are:
  ///
  /// <ul>
  /// <li>
  /// <code>DELETE</code> - delete all resources when the resource is replaced
  /// during an update operation.
  /// </li>
  /// <li>
  /// <code>RETAIN</code> - retain all resources when the resource is replaced
  /// during an update operation.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-updatereplacepolicy.html">UpdateReplacePolicy
  /// attribute</a> in the <i>CloudFormation User Guide</i>.
  final GeneratedTemplateUpdateReplacePolicy? updateReplacePolicy;

  TemplateConfiguration({
    this.deletionPolicy,
    this.updateReplacePolicy,
  });
  factory TemplateConfiguration.fromXml(_s.XmlElement elem) {
    return TemplateConfiguration(
      deletionPolicy: _s
          .extractXmlStringValue(elem, 'DeletionPolicy')
          ?.toGeneratedTemplateDeletionPolicy(),
      updateReplacePolicy: _s
          .extractXmlStringValue(elem, 'UpdateReplacePolicy')
          ?.toGeneratedTemplateUpdateReplacePolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final deletionPolicy = this.deletionPolicy;
    final updateReplacePolicy = this.updateReplacePolicy;
    return {
      if (deletionPolicy != null) 'DeletionPolicy': deletionPolicy.toValue(),
      if (updateReplacePolicy != null)
        'UpdateReplacePolicy': updateReplacePolicy.toValue(),
    };
  }
}

enum TemplateFormat {
  json,
  yaml,
}

extension TemplateFormatValueExtension on TemplateFormat {
  String toValue() {
    switch (this) {
      case TemplateFormat.json:
        return 'JSON';
      case TemplateFormat.yaml:
        return 'YAML';
    }
  }
}

extension TemplateFormatFromString on String {
  TemplateFormat toTemplateFormat() {
    switch (this) {
      case 'JSON':
        return TemplateFormat.json;
      case 'YAML':
        return TemplateFormat.yaml;
    }
    throw Exception('$this is not known in enum TemplateFormat');
  }
}

/// The TemplateParameter data type.
class TemplateParameter {
  /// The default value associated with the parameter.
  final String? defaultValue;

  /// User defined description associated with the parameter.
  final String? description;

  /// Flag indicating whether the parameter should be displayed as plain text in
  /// logs and UIs.
  final bool? noEcho;

  /// The name associated with the parameter.
  final String? parameterKey;

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

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final description = this.description;
    final noEcho = this.noEcho;
    final parameterKey = this.parameterKey;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (noEcho != null) 'NoEcho': noEcho,
      if (parameterKey != null) 'ParameterKey': parameterKey,
    };
  }
}

/// A summary of the progress of the template generation.
class TemplateProgress {
  /// The number of resources that failed the template generation.
  final int? resourcesFailed;

  /// The number of resources that are still pending the template generation.
  final int? resourcesPending;

  /// The number of resources that are in-process for the template generation.
  final int? resourcesProcessing;

  /// The number of resources that succeeded the template generation.
  final int? resourcesSucceeded;

  TemplateProgress({
    this.resourcesFailed,
    this.resourcesPending,
    this.resourcesProcessing,
    this.resourcesSucceeded,
  });
  factory TemplateProgress.fromXml(_s.XmlElement elem) {
    return TemplateProgress(
      resourcesFailed: _s.extractXmlIntValue(elem, 'ResourcesFailed'),
      resourcesPending: _s.extractXmlIntValue(elem, 'ResourcesPending'),
      resourcesProcessing: _s.extractXmlIntValue(elem, 'ResourcesProcessing'),
      resourcesSucceeded: _s.extractXmlIntValue(elem, 'ResourcesSucceeded'),
    );
  }

  Map<String, dynamic> toJson() {
    final resourcesFailed = this.resourcesFailed;
    final resourcesPending = this.resourcesPending;
    final resourcesProcessing = this.resourcesProcessing;
    final resourcesSucceeded = this.resourcesSucceeded;
    return {
      if (resourcesFailed != null) 'ResourcesFailed': resourcesFailed,
      if (resourcesPending != null) 'ResourcesPending': resourcesPending,
      if (resourcesProcessing != null)
        'ResourcesProcessing': resourcesProcessing,
      if (resourcesSucceeded != null) 'ResourcesSucceeded': resourcesSucceeded,
    };
  }
}

enum TemplateStage {
  original,
  processed,
}

extension TemplateStageValueExtension on TemplateStage {
  String toValue() {
    switch (this) {
      case TemplateStage.original:
        return 'Original';
      case TemplateStage.processed:
        return 'Processed';
    }
  }
}

extension TemplateStageFromString on String {
  TemplateStage toTemplateStage() {
    switch (this) {
      case 'Original':
        return TemplateStage.original;
      case 'Processed':
        return TemplateStage.processed;
    }
    throw Exception('$this is not known in enum TemplateStage');
  }
}

/// The summary of a generated template.
class TemplateSummary {
  /// The time the generated template was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the generated template. The format is
  /// <code>arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}</code>.
  /// For example,
  /// <code>arn:aws:cloudformation:<i>us-east-1</i>:<i>123456789012</i>:generatedtemplate/<i>2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc</i>
  /// </code>.
  final String? generatedTemplateId;

  /// The name of the generated template.
  final String? generatedTemplateName;

  /// The time the generated template was last updated.
  final DateTime? lastUpdatedTime;

  /// The number of resources in the generated template. This is a total of
  /// resources in pending, in-progress, completed, and failed states.
  final int? numberOfResources;

  /// The status of the template generation. Supported values are:
  ///
  /// <ul>
  /// <li>
  /// <code>CreatePending</code> - the creation of the template is pending.
  /// </li>
  /// <li>
  /// <code>CreateInProgress</code> - the creation of the template is in progress.
  /// </li>
  /// <li>
  /// <code>DeletePending</code> - the deletion of the template is pending.
  /// </li>
  /// <li>
  /// <code>DeleteInProgress</code> - the deletion of the template is in progress.
  /// </li>
  /// <li>
  /// <code>UpdatePending</code> - the update of the template is pending.
  /// </li>
  /// <li>
  /// <code>UpdateInProgress</code> - the update of the template is in progress.
  /// </li>
  /// <li>
  /// <code>Failed</code> - the template operation failed.
  /// </li>
  /// <li>
  /// <code>Complete</code> - the template operation is complete.
  /// </li>
  /// </ul>
  final GeneratedTemplateStatus? status;

  /// The reason for the current template generation status. This will provide
  /// more details if a failure happened.
  final String? statusReason;

  TemplateSummary({
    this.creationTime,
    this.generatedTemplateId,
    this.generatedTemplateName,
    this.lastUpdatedTime,
    this.numberOfResources,
    this.status,
    this.statusReason,
  });
  factory TemplateSummary.fromXml(_s.XmlElement elem) {
    return TemplateSummary(
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      generatedTemplateId:
          _s.extractXmlStringValue(elem, 'GeneratedTemplateId'),
      generatedTemplateName:
          _s.extractXmlStringValue(elem, 'GeneratedTemplateName'),
      lastUpdatedTime: _s.extractXmlDateTimeValue(elem, 'LastUpdatedTime'),
      numberOfResources: _s.extractXmlIntValue(elem, 'NumberOfResources'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toGeneratedTemplateStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final generatedTemplateId = this.generatedTemplateId;
    final generatedTemplateName = this.generatedTemplateName;
    final lastUpdatedTime = this.lastUpdatedTime;
    final numberOfResources = this.numberOfResources;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (generatedTemplateId != null)
        'GeneratedTemplateId': generatedTemplateId,
      if (generatedTemplateName != null)
        'GeneratedTemplateName': generatedTemplateName,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      if (numberOfResources != null) 'NumberOfResources': numberOfResources,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// Options for the <code>GetTemplateSummary</code> API action.
class TemplateSummaryConfig {
  /// If set to <code>True</code>, any unrecognized resource types generate
  /// warnings and not an error. Any unrecognized resource types are returned in
  /// the <code>Warnings</code> output parameter.
  final bool? treatUnrecognizedResourceTypesAsWarnings;

  TemplateSummaryConfig({
    this.treatUnrecognizedResourceTypesAsWarnings,
  });

  Map<String, dynamic> toJson() {
    final treatUnrecognizedResourceTypesAsWarnings =
        this.treatUnrecognizedResourceTypesAsWarnings;
    return {
      if (treatUnrecognizedResourceTypesAsWarnings != null)
        'TreatUnrecognizedResourceTypesAsWarnings':
            treatUnrecognizedResourceTypesAsWarnings,
    };
  }
}

class TestTypeOutput {
  /// The Amazon Resource Name (ARN) of the extension.
  final String? typeVersionArn;

  TestTypeOutput({
    this.typeVersionArn,
  });
  factory TestTypeOutput.fromXml(_s.XmlElement elem) {
    return TestTypeOutput(
      typeVersionArn: _s.extractXmlStringValue(elem, 'TypeVersionArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final typeVersionArn = this.typeVersionArn;
    return {
      if (typeVersionArn != null) 'TypeVersionArn': typeVersionArn,
    };
  }
}

enum ThirdPartyType {
  resource,
  module,
  hook,
}

extension ThirdPartyTypeValueExtension on ThirdPartyType {
  String toValue() {
    switch (this) {
      case ThirdPartyType.resource:
        return 'RESOURCE';
      case ThirdPartyType.module:
        return 'MODULE';
      case ThirdPartyType.hook:
        return 'HOOK';
    }
  }
}

extension ThirdPartyTypeFromString on String {
  ThirdPartyType toThirdPartyType() {
    switch (this) {
      case 'RESOURCE':
        return ThirdPartyType.resource;
      case 'MODULE':
        return ThirdPartyType.module;
      case 'HOOK':
        return ThirdPartyType.hook;
    }
    throw Exception('$this is not known in enum ThirdPartyType');
  }
}

/// Detailed information concerning the specification of a CloudFormation
/// extension in a given account and Region.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private.html#registry-set-configuration">Configuring
/// extensions at the account level</a> in the <i>CloudFormation User Guide</i>.
class TypeConfigurationDetails {
  /// The alias specified for this configuration, if one was specified when the
  /// configuration was set.
  final String? alias;

  /// The Amazon Resource Name (ARN) for the configuration data, in this account
  /// and Region.
  final String? arn;

  /// A JSON string specifying the configuration data for the extension, in this
  /// account and Region.
  ///
  /// If a configuration hasn't been set for a specified extension, CloudFormation
  /// returns <code>{}</code>.
  final String? configuration;

  /// Whether this configuration data is the default configuration for the
  /// extension.
  final bool? isDefaultConfiguration;

  /// When the configuration data was last updated for this extension.
  ///
  /// If a configuration hasn't been set for a specified extension, CloudFormation
  /// returns <code>null</code>.
  final DateTime? lastUpdated;

  /// The Amazon Resource Name (ARN) for the extension, in this account and
  /// Region.
  ///
  /// For public extensions, this will be the ARN assigned when you call the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html">ActivateType</a>
  /// API operation in this account and Region. For private extensions, this will
  /// be the ARN assigned when you call the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>
  /// API operation in this account and Region.
  final String? typeArn;

  /// The name of the extension.
  final String? typeName;

  TypeConfigurationDetails({
    this.alias,
    this.arn,
    this.configuration,
    this.isDefaultConfiguration,
    this.lastUpdated,
    this.typeArn,
    this.typeName,
  });
  factory TypeConfigurationDetails.fromXml(_s.XmlElement elem) {
    return TypeConfigurationDetails(
      alias: _s.extractXmlStringValue(elem, 'Alias'),
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      configuration: _s.extractXmlStringValue(elem, 'Configuration'),
      isDefaultConfiguration:
          _s.extractXmlBoolValue(elem, 'IsDefaultConfiguration'),
      lastUpdated: _s.extractXmlDateTimeValue(elem, 'LastUpdated'),
      typeArn: _s.extractXmlStringValue(elem, 'TypeArn'),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final arn = this.arn;
    final configuration = this.configuration;
    final isDefaultConfiguration = this.isDefaultConfiguration;
    final lastUpdated = this.lastUpdated;
    final typeArn = this.typeArn;
    final typeName = this.typeName;
    return {
      if (alias != null) 'Alias': alias,
      if (arn != null) 'Arn': arn,
      if (configuration != null) 'Configuration': configuration,
      if (isDefaultConfiguration != null)
        'IsDefaultConfiguration': isDefaultConfiguration,
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (typeArn != null) 'TypeArn': typeArn,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

/// Identifying information for the configuration of a CloudFormation extension.
class TypeConfigurationIdentifier {
  /// The type of extension.
  final ThirdPartyType? type;

  /// The Amazon Resource Name (ARN) for the extension, in this account and
  /// Region.
  ///
  /// For public extensions, this will be the ARN assigned when you call the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html">ActivateType</a>
  /// API operation in this account and Region. For private extensions, this will
  /// be the ARN assigned when you call the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>
  /// API operation in this account and Region.
  final String? typeArn;

  /// The alias specified for this configuration, if one was specified when the
  /// configuration was set.
  final String? typeConfigurationAlias;

  /// The Amazon Resource Name (ARN) for the configuration, in this account and
  /// Region.
  final String? typeConfigurationArn;

  /// The name of the extension type to which this configuration applies.
  final String? typeName;

  TypeConfigurationIdentifier({
    this.type,
    this.typeArn,
    this.typeConfigurationAlias,
    this.typeConfigurationArn,
    this.typeName,
  });
  factory TypeConfigurationIdentifier.fromXml(_s.XmlElement elem) {
    return TypeConfigurationIdentifier(
      type: _s.extractXmlStringValue(elem, 'Type')?.toThirdPartyType(),
      typeArn: _s.extractXmlStringValue(elem, 'TypeArn'),
      typeConfigurationAlias:
          _s.extractXmlStringValue(elem, 'TypeConfigurationAlias'),
      typeConfigurationArn:
          _s.extractXmlStringValue(elem, 'TypeConfigurationArn'),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final typeArn = this.typeArn;
    final typeConfigurationAlias = this.typeConfigurationAlias;
    final typeConfigurationArn = this.typeConfigurationArn;
    final typeName = this.typeName;
    return {
      if (type != null) 'Type': type.toValue(),
      if (typeArn != null) 'TypeArn': typeArn,
      if (typeConfigurationAlias != null)
        'TypeConfigurationAlias': typeConfigurationAlias,
      if (typeConfigurationArn != null)
        'TypeConfigurationArn': typeConfigurationArn,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

/// Filter criteria to use in determining which extensions to return.
class TypeFilters {
  /// The category of extensions to return.
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTERED</code>: Private extensions that have been registered for
  /// this account and Region.
  /// </li>
  /// <li>
  /// <code>ACTIVATED</code>: Public extensions that have been activated for this
  /// account and Region.
  /// </li>
  /// <li>
  /// <code>THIRD_PARTY</code>: Extensions available for use from publishers other
  /// than Amazon. This includes:
  ///
  /// <ul>
  /// <li>
  /// Private extensions registered in the account.
  /// </li>
  /// <li>
  /// Public extensions from publishers other than Amazon, whether activated or
  /// not.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>AWS_TYPES</code>: Extensions available for use from Amazon.
  /// </li>
  /// </ul>
  final Category? category;

  /// The id of the publisher of the extension.
  ///
  /// Extensions published by Amazon aren't assigned a publisher ID. Use the
  /// <code>AWS_TYPES</code> category to specify a list of types published by
  /// Amazon.
  final String? publisherId;

  /// A prefix to use as a filter for results.
  final String? typeNamePrefix;

  TypeFilters({
    this.category,
    this.publisherId,
    this.typeNamePrefix,
  });

  Map<String, dynamic> toJson() {
    final category = this.category;
    final publisherId = this.publisherId;
    final typeNamePrefix = this.typeNamePrefix;
    return {
      if (category != null) 'Category': category.toValue(),
      if (publisherId != null) 'PublisherId': publisherId,
      if (typeNamePrefix != null) 'TypeNamePrefix': typeNamePrefix,
    };
  }
}

/// Contains summary information about the specified CloudFormation extension.
class TypeSummary {
  /// The ID of the default version of the extension. The default version is used
  /// when the extension version isn't specified.
  ///
  /// This applies only to private extensions you have registered in your account.
  /// For public extensions, both those provided by Amazon and published by third
  /// parties, CloudFormation returns <code>null</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>.
  ///
  /// To set the default version of an extension, use
  /// <a>SetTypeDefaultVersion</a>.
  final String? defaultVersionId;

  /// The description of the extension.
  final String? description;

  /// Whether the extension is activated for this account and Region.
  ///
  /// This applies only to third-party public extensions. Extensions published by
  /// Amazon are activated by default.
  final bool? isActivated;

  /// When the specified extension version was registered. This applies only to:
  ///
  /// <ul>
  /// <li>
  /// Private extensions you have registered in your account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html">RegisterType</a>.
  /// </li>
  /// <li>
  /// Public extensions you have activated in your account with auto-update
  /// specified. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html">ActivateType</a>.
  /// </li>
  /// </ul>
  /// For all other extension types, CloudFormation returns <code>null</code>.
  final DateTime? lastUpdated;

  /// For public extensions that have been activated for this account and Region,
  /// the latest version of the public extension <i>that is available</i>. For any
  /// extensions other than activated third-arty extensions, CloudFormation
  /// returns <code>null</code>.
  ///
  /// How you specified <code>AutoUpdate</code> when enabling the extension
  /// affects whether CloudFormation automatically updates the extension in this
  /// account and Region when a new version is released. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto">Setting
  /// CloudFormation to automatically use new versions of extensions</a> in the
  /// <i>CloudFormation User Guide</i>.
  final String? latestPublicVersion;

  /// For public extensions that have been activated for this account and Region,
  /// the type name of the public extension.
  ///
  /// If you specified a <code>TypeNameAlias</code> when enabling the extension in
  /// this account and Region, CloudFormation treats that alias as the extension's
  /// type name within the account and Region, not the type name of the public
  /// extension. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias">Specifying
  /// aliases to refer to extensions</a> in the <i>CloudFormation User Guide</i>.
  final String? originalTypeName;

  /// For public extensions that have been activated for this account and Region,
  /// the version of the public extension to be used for CloudFormation operations
  /// in this account and Region.
  ///
  /// How you specified <code>AutoUpdate</code> when enabling the extension
  /// affects whether CloudFormation automatically updates the extension in this
  /// account and Region when a new version is released. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto">Setting
  /// CloudFormation to automatically use new versions of extensions</a> in the
  /// <i>CloudFormation User Guide</i>.
  final String? publicVersionNumber;

  /// The ID of the extension publisher, if the extension is published by a third
  /// party. Extensions published by Amazon don't return a publisher ID.
  final String? publisherId;

  /// The service used to verify the publisher identity.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html">Registering
  /// your account to publish CloudFormation extensions</a> in the <i> CFN-CLI
  /// User Guide for Extension Development</i>.
  final IdentityProvider? publisherIdentity;

  /// The publisher name, as defined in the public profile for that publisher in
  /// the service used to verify the publisher identity.
  final String? publisherName;

  /// The kind of extension.
  final RegistryType? type;

  /// The Amazon Resource Name (ARN) of the extension.
  final String? typeArn;

  /// The name of the extension.
  ///
  /// If you specified a <code>TypeNameAlias</code> when you call the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html">ActivateType</a>
  /// API operation in your account and Region, CloudFormation considers that
  /// alias as the type name.
  final String? typeName;

  TypeSummary({
    this.defaultVersionId,
    this.description,
    this.isActivated,
    this.lastUpdated,
    this.latestPublicVersion,
    this.originalTypeName,
    this.publicVersionNumber,
    this.publisherId,
    this.publisherIdentity,
    this.publisherName,
    this.type,
    this.typeArn,
    this.typeName,
  });
  factory TypeSummary.fromXml(_s.XmlElement elem) {
    return TypeSummary(
      defaultVersionId: _s.extractXmlStringValue(elem, 'DefaultVersionId'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isActivated: _s.extractXmlBoolValue(elem, 'IsActivated'),
      lastUpdated: _s.extractXmlDateTimeValue(elem, 'LastUpdated'),
      latestPublicVersion:
          _s.extractXmlStringValue(elem, 'LatestPublicVersion'),
      originalTypeName: _s.extractXmlStringValue(elem, 'OriginalTypeName'),
      publicVersionNumber:
          _s.extractXmlStringValue(elem, 'PublicVersionNumber'),
      publisherId: _s.extractXmlStringValue(elem, 'PublisherId'),
      publisherIdentity: _s
          .extractXmlStringValue(elem, 'PublisherIdentity')
          ?.toIdentityProvider(),
      publisherName: _s.extractXmlStringValue(elem, 'PublisherName'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toRegistryType(),
      typeArn: _s.extractXmlStringValue(elem, 'TypeArn'),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultVersionId = this.defaultVersionId;
    final description = this.description;
    final isActivated = this.isActivated;
    final lastUpdated = this.lastUpdated;
    final latestPublicVersion = this.latestPublicVersion;
    final originalTypeName = this.originalTypeName;
    final publicVersionNumber = this.publicVersionNumber;
    final publisherId = this.publisherId;
    final publisherIdentity = this.publisherIdentity;
    final publisherName = this.publisherName;
    final type = this.type;
    final typeArn = this.typeArn;
    final typeName = this.typeName;
    return {
      if (defaultVersionId != null) 'DefaultVersionId': defaultVersionId,
      if (description != null) 'Description': description,
      if (isActivated != null) 'IsActivated': isActivated,
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (latestPublicVersion != null)
        'LatestPublicVersion': latestPublicVersion,
      if (originalTypeName != null) 'OriginalTypeName': originalTypeName,
      if (publicVersionNumber != null)
        'PublicVersionNumber': publicVersionNumber,
      if (publisherId != null) 'PublisherId': publisherId,
      if (publisherIdentity != null)
        'PublisherIdentity': publisherIdentity.toValue(),
      if (publisherName != null) 'PublisherName': publisherName,
      if (type != null) 'Type': type.toValue(),
      if (typeArn != null) 'TypeArn': typeArn,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

enum TypeTestsStatus {
  passed,
  failed,
  inProgress,
  notTested,
}

extension TypeTestsStatusValueExtension on TypeTestsStatus {
  String toValue() {
    switch (this) {
      case TypeTestsStatus.passed:
        return 'PASSED';
      case TypeTestsStatus.failed:
        return 'FAILED';
      case TypeTestsStatus.inProgress:
        return 'IN_PROGRESS';
      case TypeTestsStatus.notTested:
        return 'NOT_TESTED';
    }
  }
}

extension TypeTestsStatusFromString on String {
  TypeTestsStatus toTypeTestsStatus() {
    switch (this) {
      case 'PASSED':
        return TypeTestsStatus.passed;
      case 'FAILED':
        return TypeTestsStatus.failed;
      case 'IN_PROGRESS':
        return TypeTestsStatus.inProgress;
      case 'NOT_TESTED':
        return TypeTestsStatus.notTested;
    }
    throw Exception('$this is not known in enum TypeTestsStatus');
  }
}

/// Contains summary information about a specific version of a CloudFormation
/// extension.
class TypeVersionSummary {
  /// The Amazon Resource Name (ARN) of the extension version.
  final String? arn;

  /// The description of the extension version.
  final String? description;

  /// Whether the specified extension version is set as the default version.
  ///
  /// This applies only to private extensions you have registered in your account,
  /// and extensions published by Amazon. For public third-party extensions,
  /// CloudFormation returns <code>null</code>.
  final bool? isDefaultVersion;

  /// For public extensions that have been activated for this account and Region,
  /// the version of the public extension to be used for CloudFormation operations
  /// in this account and Region. For any extensions other than activated
  /// third-arty extensions, CloudFormation returns <code>null</code>.
  ///
  /// How you specified <code>AutoUpdate</code> when enabling the extension
  /// affects whether CloudFormation automatically updates the extension in this
  /// account and Region when a new version is released. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto">Setting
  /// CloudFormation to automatically use new versions of extensions</a> in the
  /// <i>CloudFormation User Guide</i>.
  final String? publicVersionNumber;

  /// When the version was registered.
  final DateTime? timeCreated;

  /// The kind of extension.
  final RegistryType? type;

  /// The name of the extension.
  final String? typeName;

  /// The ID of a specific version of the extension. The version ID is the value
  /// at the end of the Amazon Resource Name (ARN) assigned to the extension
  /// version when it's registered.
  final String? versionId;

  TypeVersionSummary({
    this.arn,
    this.description,
    this.isDefaultVersion,
    this.publicVersionNumber,
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
      publicVersionNumber:
          _s.extractXmlStringValue(elem, 'PublicVersionNumber'),
      timeCreated: _s.extractXmlDateTimeValue(elem, 'TimeCreated'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toRegistryType(),
      typeName: _s.extractXmlStringValue(elem, 'TypeName'),
      versionId: _s.extractXmlStringValue(elem, 'VersionId'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final isDefaultVersion = this.isDefaultVersion;
    final publicVersionNumber = this.publicVersionNumber;
    final timeCreated = this.timeCreated;
    final type = this.type;
    final typeName = this.typeName;
    final versionId = this.versionId;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (isDefaultVersion != null) 'IsDefaultVersion': isDefaultVersion,
      if (publicVersionNumber != null)
        'PublicVersionNumber': publicVersionNumber,
      if (timeCreated != null) 'TimeCreated': iso8601ToJson(timeCreated),
      if (type != null) 'Type': type.toValue(),
      if (typeName != null) 'TypeName': typeName,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class UpdateGeneratedTemplateOutput {
  /// The Amazon Resource Name (ARN) of the generated template. The format is
  /// <code>arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}</code>.
  /// For example,
  /// <code>arn:aws:cloudformation:<i>us-east-1</i>:<i>123456789012</i>:generatedtemplate/<i>2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc</i>
  /// </code>.
  final String? generatedTemplateId;

  UpdateGeneratedTemplateOutput({
    this.generatedTemplateId,
  });
  factory UpdateGeneratedTemplateOutput.fromXml(_s.XmlElement elem) {
    return UpdateGeneratedTemplateOutput(
      generatedTemplateId:
          _s.extractXmlStringValue(elem, 'GeneratedTemplateId'),
    );
  }

  Map<String, dynamic> toJson() {
    final generatedTemplateId = this.generatedTemplateId;
    return {
      if (generatedTemplateId != null)
        'GeneratedTemplateId': generatedTemplateId,
    };
  }
}

class UpdateStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String? operationId;

  UpdateStackInstancesOutput({
    this.operationId,
  });
  factory UpdateStackInstancesOutput.fromXml(_s.XmlElement elem) {
    return UpdateStackInstancesOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

/// The output for an <a>UpdateStack</a> action.
class UpdateStackOutput {
  /// Unique identifier of the stack.
  final String? stackId;

  UpdateStackOutput({
    this.stackId,
  });
  factory UpdateStackOutput.fromXml(_s.XmlElement elem) {
    return UpdateStackOutput(
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    return {
      if (stackId != null) 'StackId': stackId,
    };
  }
}

class UpdateStackSetOutput {
  /// The unique ID for this stack set operation.
  final String? operationId;

  UpdateStackSetOutput({
    this.operationId,
  });
  factory UpdateStackSetOutput.fromXml(_s.XmlElement elem) {
    return UpdateStackSetOutput(
      operationId: _s.extractXmlStringValue(elem, 'OperationId'),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class UpdateTerminationProtectionOutput {
  /// The unique ID of the stack.
  final String? stackId;

  UpdateTerminationProtectionOutput({
    this.stackId,
  });
  factory UpdateTerminationProtectionOutput.fromXml(_s.XmlElement elem) {
    return UpdateTerminationProtectionOutput(
      stackId: _s.extractXmlStringValue(elem, 'StackId'),
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    return {
      if (stackId != null) 'StackId': stackId,
    };
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
  /// IAM Resources in CloudFormation Templates</a>.
  final List<Capability>? capabilities;

  /// The list of resources that generated the values in the
  /// <code>Capabilities</code> response element.
  final String? capabilitiesReason;

  /// A list of the transforms that are declared in the template.
  final List<String>? declaredTransforms;

  /// The description found within the template.
  final String? description;

  /// A list of <code>TemplateParameter</code> structures.
  final List<TemplateParameter>? parameters;

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
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('member').map(TemplateParameter.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final capabilitiesReason = this.capabilitiesReason;
    final declaredTransforms = this.declaredTransforms;
    final description = this.description;
    final parameters = this.parameters;
    return {
      if (capabilities != null)
        'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (capabilitiesReason != null) 'CapabilitiesReason': capabilitiesReason,
      if (declaredTransforms != null) 'DeclaredTransforms': declaredTransforms,
      if (description != null) 'Description': description,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

enum VersionBump {
  major,
  minor,
}

extension VersionBumpValueExtension on VersionBump {
  String toValue() {
    switch (this) {
      case VersionBump.major:
        return 'MAJOR';
      case VersionBump.minor:
        return 'MINOR';
    }
  }
}

extension VersionBumpFromString on String {
  VersionBump toVersionBump() {
    switch (this) {
      case 'MAJOR':
        return VersionBump.major;
      case 'MINOR':
        return VersionBump.minor;
    }
    throw Exception('$this is not known in enum VersionBump');
  }
}

enum Visibility {
  public,
  private,
}

extension VisibilityValueExtension on Visibility {
  String toValue() {
    switch (this) {
      case Visibility.public:
        return 'PUBLIC';
      case Visibility.private:
        return 'PRIVATE';
    }
  }
}

extension VisibilityFromString on String {
  Visibility toVisibility() {
    switch (this) {
      case 'PUBLIC':
        return Visibility.public;
      case 'PRIVATE':
        return Visibility.private;
    }
    throw Exception('$this is not known in enum Visibility');
  }
}

/// The warnings generated for a specific resource for this generated template.
class WarningDetail {
  /// The properties of the resource that are impacted by this warning.
  final List<WarningProperty>? properties;

  /// The type of this warning. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/generate-IaC-write-only-properties.html">IaC
  /// generator and write-only properties</a> in the <i>CloudFormation User
  /// Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// <code>MUTUALLY_EXCLUSIVE_PROPERTIES</code> - The resource requires
  /// mutually-exclusive write-only properties. The IaC generator selects one set
  /// of mutually exclusive properties and converts the included properties into
  /// parameters. The parameter names have a suffix <code>OneOf</code> and the
  /// parameter descriptions indicate that the corresponding property can be
  /// replaced with other exclusive properties.
  /// </li>
  /// <li>
  /// <code>UNSUPPORTED_PROPERTIES</code> - Unsupported properties are present in
  /// the resource. One example of unsupported properties would be a required
  /// write-only property that is an array, because a parameter cannot be an
  /// array. Another example is an optional write-only property.
  /// </li>
  /// <li>
  /// <code>MUTUALLY_EXCLUSIVE_TYPES</code> - One or more required write-only
  /// properties are found in the resource, and the type of that property can be
  /// any of several types.
  /// </li>
  /// </ul> <note>
  /// Currently the resource and property reference documentation does not
  /// indicate if a property uses a type of <code>oneOf</code> or
  /// <code>anyOf</code>. You need to look at the resource provider schema.
  /// </note>
  final WarningType? type;

  WarningDetail({
    this.properties,
    this.type,
  });
  factory WarningDetail.fromXml(_s.XmlElement elem) {
    return WarningDetail(
      properties: _s.extractXmlChild(elem, 'Properties')?.let((elem) =>
          elem.findElements('member').map(WarningProperty.fromXml).toList()),
      type: _s.extractXmlStringValue(elem, 'Type')?.toWarningType(),
    );
  }

  Map<String, dynamic> toJson() {
    final properties = this.properties;
    final type = this.type;
    return {
      if (properties != null) 'Properties': properties,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A specific property that is impacted by a warning.
class WarningProperty {
  /// The description of the property from the resource provider schema.
  final String? description;

  /// The path of the property. For example, if this is for the
  /// <code>S3Bucket</code> member of the <code>Code</code> property, the property
  /// path would be <code>Code/S3Bucket</code>.
  final String? propertyPath;

  /// If <code>true</code>, the specified property is required.
  final bool? required;

  WarningProperty({
    this.description,
    this.propertyPath,
    this.required,
  });
  factory WarningProperty.fromXml(_s.XmlElement elem) {
    return WarningProperty(
      description: _s.extractXmlStringValue(elem, 'Description'),
      propertyPath: _s.extractXmlStringValue(elem, 'PropertyPath'),
      required: _s.extractXmlBoolValue(elem, 'Required'),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final propertyPath = this.propertyPath;
    final required = this.required;
    return {
      if (description != null) 'Description': description,
      if (propertyPath != null) 'PropertyPath': propertyPath,
      if (required != null) 'Required': required,
    };
  }
}

enum WarningType {
  mutuallyExclusiveProperties,
  unsupportedProperties,
  mutuallyExclusiveTypes,
}

extension WarningTypeValueExtension on WarningType {
  String toValue() {
    switch (this) {
      case WarningType.mutuallyExclusiveProperties:
        return 'MUTUALLY_EXCLUSIVE_PROPERTIES';
      case WarningType.unsupportedProperties:
        return 'UNSUPPORTED_PROPERTIES';
      case WarningType.mutuallyExclusiveTypes:
        return 'MUTUALLY_EXCLUSIVE_TYPES';
    }
  }
}

extension WarningTypeFromString on String {
  WarningType toWarningType() {
    switch (this) {
      case 'MUTUALLY_EXCLUSIVE_PROPERTIES':
        return WarningType.mutuallyExclusiveProperties;
      case 'UNSUPPORTED_PROPERTIES':
        return WarningType.unsupportedProperties;
      case 'MUTUALLY_EXCLUSIVE_TYPES':
        return WarningType.mutuallyExclusiveTypes;
    }
    throw Exception('$this is not known in enum WarningType');
  }
}

/// Contains any warnings returned by the <code>GetTemplateSummary</code> API
/// action.
class Warnings {
  /// A list of all of the unrecognized resource types. This is only returned if
  /// the <code>TemplateSummaryConfig</code> parameter has the
  /// <code>TreatUnrecognizedResourceTypesAsWarning</code> configuration set to
  /// <code>True</code>.
  final List<String>? unrecognizedResourceTypes;

  Warnings({
    this.unrecognizedResourceTypes,
  });
  factory Warnings.fromXml(_s.XmlElement elem) {
    return Warnings(
      unrecognizedResourceTypes: _s
          .extractXmlChild(elem, 'UnrecognizedResourceTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final unrecognizedResourceTypes = this.unrecognizedResourceTypes;
    return {
      if (unrecognizedResourceTypes != null)
        'UnrecognizedResourceTypes': unrecognizedResourceTypes,
    };
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class CFNRegistryException extends _s.GenericAwsException {
  CFNRegistryException({String? type, String? message})
      : super(type: type, code: 'CFNRegistryException', message: message);
}

class ChangeSetNotFoundException extends _s.GenericAwsException {
  ChangeSetNotFoundException({String? type, String? message})
      : super(type: type, code: 'ChangeSetNotFoundException', message: message);
}

class ConcurrentResourcesLimitExceededException extends _s.GenericAwsException {
  ConcurrentResourcesLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentResourcesLimitExceededException',
            message: message);
}

class CreatedButModifiedException extends _s.GenericAwsException {
  CreatedButModifiedException({String? type, String? message})
      : super(
            type: type, code: 'CreatedButModifiedException', message: message);
}

class GeneratedTemplateNotFoundException extends _s.GenericAwsException {
  GeneratedTemplateNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'GeneratedTemplateNotFoundException',
            message: message);
}

class InsufficientCapabilitiesException extends _s.GenericAwsException {
  InsufficientCapabilitiesException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientCapabilitiesException',
            message: message);
}

class InvalidChangeSetStatusException extends _s.GenericAwsException {
  InvalidChangeSetStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidChangeSetStatusException',
            message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NameAlreadyExistsException extends _s.GenericAwsException {
  NameAlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'NameAlreadyExistsException', message: message);
}

class OperationIdAlreadyExistsException extends _s.GenericAwsException {
  OperationIdAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationIdAlreadyExistsException',
            message: message);
}

class OperationInProgressException extends _s.GenericAwsException {
  OperationInProgressException({String? type, String? message})
      : super(
            type: type, code: 'OperationInProgressException', message: message);
}

class OperationNotFoundException extends _s.GenericAwsException {
  OperationNotFoundException({String? type, String? message})
      : super(type: type, code: 'OperationNotFoundException', message: message);
}

class OperationStatusCheckFailedException extends _s.GenericAwsException {
  OperationStatusCheckFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationStatusCheckFailedException',
            message: message);
}

class ResourceScanInProgressException extends _s.GenericAwsException {
  ResourceScanInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceScanInProgressException',
            message: message);
}

class ResourceScanLimitExceededException extends _s.GenericAwsException {
  ResourceScanLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceScanLimitExceededException',
            message: message);
}

class ResourceScanNotFoundException extends _s.GenericAwsException {
  ResourceScanNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceScanNotFoundException',
            message: message);
}

class StackInstanceNotFoundException extends _s.GenericAwsException {
  StackInstanceNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'StackInstanceNotFoundException',
            message: message);
}

class StackNotFoundException extends _s.GenericAwsException {
  StackNotFoundException({String? type, String? message})
      : super(type: type, code: 'StackNotFoundException', message: message);
}

class StackSetNotEmptyException extends _s.GenericAwsException {
  StackSetNotEmptyException({String? type, String? message})
      : super(type: type, code: 'StackSetNotEmptyException', message: message);
}

class StackSetNotFoundException extends _s.GenericAwsException {
  StackSetNotFoundException({String? type, String? message})
      : super(type: type, code: 'StackSetNotFoundException', message: message);
}

class StaleRequestException extends _s.GenericAwsException {
  StaleRequestException({String? type, String? message})
      : super(type: type, code: 'StaleRequestException', message: message);
}

class TokenAlreadyExistsException extends _s.GenericAwsException {
  TokenAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'TokenAlreadyExistsException', message: message);
}

class TypeConfigurationNotFoundException extends _s.GenericAwsException {
  TypeConfigurationNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'TypeConfigurationNotFoundException',
            message: message);
}

class TypeNotFoundException extends _s.GenericAwsException {
  TypeNotFoundException({String? type, String? message})
      : super(type: type, code: 'TypeNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'CFNRegistryException': (type, message) =>
      CFNRegistryException(type: type, message: message),
  'ChangeSetNotFoundException': (type, message) =>
      ChangeSetNotFoundException(type: type, message: message),
  'ConcurrentResourcesLimitExceededException': (type, message) =>
      ConcurrentResourcesLimitExceededException(type: type, message: message),
  'CreatedButModifiedException': (type, message) =>
      CreatedButModifiedException(type: type, message: message),
  'GeneratedTemplateNotFoundException': (type, message) =>
      GeneratedTemplateNotFoundException(type: type, message: message),
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
  'ResourceScanInProgressException': (type, message) =>
      ResourceScanInProgressException(type: type, message: message),
  'ResourceScanLimitExceededException': (type, message) =>
      ResourceScanLimitExceededException(type: type, message: message),
  'ResourceScanNotFoundException': (type, message) =>
      ResourceScanNotFoundException(type: type, message: message),
  'StackInstanceNotFoundException': (type, message) =>
      StackInstanceNotFoundException(type: type, message: message),
  'StackNotFoundException': (type, message) =>
      StackNotFoundException(type: type, message: message),
  'StackSetNotEmptyException': (type, message) =>
      StackSetNotEmptyException(type: type, message: message),
  'StackSetNotFoundException': (type, message) =>
      StackSetNotFoundException(type: type, message: message),
  'StaleRequestException': (type, message) =>
      StaleRequestException(type: type, message: message),
  'TokenAlreadyExistsException': (type, message) =>
      TokenAlreadyExistsException(type: type, message: message),
  'TypeConfigurationNotFoundException': (type, message) =>
      TypeConfigurationNotFoundException(type: type, message: message),
  'TypeNotFoundException': (type, message) =>
      TypeNotFoundException(type: type, message: message),
};
