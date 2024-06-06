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

/// This is the <i>Resource Access Manager API Reference</i>. This documentation
/// provides descriptions and syntax for each of the actions and data types in
/// RAM. RAM is a service that helps you securely share your Amazon Web Services
/// resources to other Amazon Web Services accounts. If you use Organizations to
/// manage your accounts, then you can share your resources with your entire
/// organization or to organizational units (OUs). For supported resource types,
/// you can also share resources with individual Identity and Access Management
/// (IAM) roles and users.
///
/// To learn more about RAM, see the following resources:
///
/// <ul>
/// <li>
/// <a href="http://aws.amazon.com/ram">Resource Access Manager product page</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/ram/latest/userguide/">Resource Access
/// Manager User Guide</a>
/// </li>
/// </ul>
class Ram {
  final _s.RestJsonProtocol _protocol;
  Ram({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ram',
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

  /// Accepts an invitation to a resource share from another Amazon Web Services
  /// account. After you accept the invitation, the resources included in the
  /// resource share are available to interact with in the relevant Amazon Web
  /// Services Management Consoles and tools.
  ///
  /// May throw [MalformedArnException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [ResourceShareInvitationAlreadyAcceptedException].
  /// May throw [ResourceShareInvitationAlreadyRejectedException].
  /// May throw [ResourceShareInvitationExpiredException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [resourceShareInvitationArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the invitation that you want to accept.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<AcceptResourceShareInvitationResponse> acceptResourceShareInvitation({
    required String resourceShareInvitationArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/acceptresourceshareinvitation',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptResourceShareInvitationResponse.fromJson(response);
  }

  /// Adds the specified list of principals and list of resources to a resource
  /// share. Principals that already have access to this resource share
  /// immediately receive access to the added resources. Newly added principals
  /// immediately receive access to the resources shared in this resource share.
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share that you want to add
  /// principals or resources to.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [principals] :
  /// Specifies a list of principals to whom you want to the resource share.
  /// This can be <code>null</code> if you want to add only resources.
  ///
  /// What the principals can do with the resources in the share is determined
  /// by the RAM permissions that you associate with the resource share. See
  /// <a>AssociateResourceSharePermission</a>.
  ///
  /// You can include the following values:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Web Services account ID, for example: <code>123456789012</code>
  /// </li>
  /// <li>
  /// An <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an organization in Organizations, for example:
  /// <code>organizations::123456789012:organization/o-exampleorgid</code>
  /// </li>
  /// <li>
  /// An ARN of an organizational unit (OU) in Organizations, for example:
  /// <code>organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM role, for example:
  /// <code>iam::123456789012:role/rolename</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM user, for example:
  /// <code>iam::123456789012user/username</code>
  /// </li>
  /// </ul> <note>
  /// Not all resource types can be shared with IAM roles and users. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ram/latest/userguide/permissions.html#permissions-rbp-supported-resource-types">Sharing
  /// with IAM roles and users</a> in the <i>Resource Access Manager User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [resourceArns] :
  /// Specifies a list of <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> of the resources that you want to share. This
  /// can be <code>null</code> if you want to add only principals.
  ///
  /// Parameter [sources] :
  /// Specifies from which source accounts the service principal has access to
  /// the resources in this resource share.
  Future<AssociateResourceShareResponse> associateResourceShare({
    required String resourceShareArn,
    String? clientToken,
    List<String>? principals,
    List<String>? resourceArns,
    List<String>? sources,
  }) async {
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (principals != null) 'principals': principals,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (sources != null) 'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associateresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateResourceShareResponse.fromJson(response);
  }

  /// Adds or replaces the RAM permission for a resource type included in a
  /// resource share. You can have exactly one permission associated with each
  /// resource type in the resource share. You can add a new RAM permission only
  /// if there are currently no resources of that resource type currently in the
  /// resource share.
  ///
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidClientTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the RAM permission to associate with the
  /// resource share. To find the ARN for a permission, use either the
  /// <a>ListPermissions</a> operation or go to the <a
  /// href="https://console.aws.amazon.com/ram/home#Permissions:">Permissions
  /// library</a> page in the RAM console and then choose the name of the
  /// permission. The ARN is displayed on the detail page.
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share to which you want to add or
  /// replace permissions.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [permissionVersion] :
  /// Specifies the version of the RAM permission to associate with the resource
  /// share. You can specify <i>only</i> the version that is currently set as
  /// the default version for the permission. If you also set the
  /// <code>replace</code> pararameter to <code>true</code>, then this operation
  /// updates an outdated version of the permission to the current default
  /// version.
  /// <note>
  /// You don't need to specify this parameter because the default behavior is
  /// to use the version that is currently set as the default version for the
  /// permission. This parameter is supported for backwards compatibility.
  /// </note>
  ///
  /// Parameter [replace] :
  /// Specifies whether the specified permission should replace the existing
  /// permission associated with the resource share. Use <code>true</code> to
  /// replace the current permissions. Use <code>false</code> to add the
  /// permission to a resource share that currently doesn't have a permission.
  /// The default value is <code>false</code>.
  /// <note>
  /// A resource share can have only one permission per resource type. If a
  /// resource share already has a permission for the specified resource type
  /// and you don't set <code>replace</code> to <code>true</code> then the
  /// operation returns an error. This helps prevent accidental overwriting of a
  /// permission.
  /// </note>
  Future<AssociateResourceSharePermissionResponse>
      associateResourceSharePermission({
    required String permissionArn,
    required String resourceShareArn,
    String? clientToken,
    int? permissionVersion,
    bool? replace,
  }) async {
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (permissionVersion != null) 'permissionVersion': permissionVersion,
      if (replace != null) 'replace': replace,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associateresourcesharepermission',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateResourceSharePermissionResponse.fromJson(response);
  }

  /// Creates a customer managed permission for a specified resource type that
  /// you can attach to resource shares. It is created in the Amazon Web
  /// Services Region in which you call the operation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPolicyException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [PermissionAlreadyExistsException].
  /// May throw [MalformedPolicyTemplateException].
  /// May throw [InvalidClientTokenException].
  /// May throw [PermissionLimitExceededException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [name] :
  /// Specifies the name of the customer managed permission. The name must be
  /// unique within the Amazon Web Services Region.
  ///
  /// Parameter [policyTemplate] :
  /// A string in JSON format string that contains the following elements of a
  /// resource-based policy:
  ///
  /// <ul>
  /// <li>
  /// <b>Effect</b>: must be set to <code>ALLOW</code>.
  /// </li>
  /// <li>
  /// <b>Action</b>: specifies the actions that are allowed by this customer
  /// managed permission. The list must contain only actions that are supported
  /// by the specified resource type. For a list of all actions supported by
  /// each resource type, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Actions,
  /// resources, and condition keys for Amazon Web Services services</a> in the
  /// <i>Identity and Access Management User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Condition</b>: (optional) specifies conditional parameters that must
  /// evaluate to true when a user attempts an action for that action to be
  /// allowed. For more information about the Condition element, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition.html">IAM
  /// policies: Condition element</a> in the <i>Identity and Access Management
  /// User Guide</i>.
  /// </li>
  /// </ul>
  /// This template can't include either the <code>Resource</code> or
  /// <code>Principal</code> elements. Those are both filled in by RAM when it
  /// instantiates the resource-based policy on each resource shared using this
  /// managed permission. The <code>Resource</code> comes from the ARN of the
  /// specific resource that you are sharing. The <code>Principal</code> comes
  /// from the list of identities added to the resource share.
  ///
  /// Parameter [resourceType] :
  /// Specifies the name of the resource type that this customer managed
  /// permission applies to.
  ///
  /// The format is <code>
  /// <i>&lt;service-code&gt;</i>:<i>&lt;resource-type&gt;</i> </code> and is
  /// not case sensitive. For example, to specify an Amazon EC2 Subnet, you can
  /// use the string <code>ec2:subnet</code>. To see the list of valid values
  /// for this parameter, query the <a>ListResourceTypes</a> operation.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [tags] :
  /// Specifies a list of one or more tag key and value pairs to attach to the
  /// permission.
  Future<CreatePermissionResponse> createPermission({
    required String name,
    required String policyTemplate,
    required String resourceType,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'policyTemplate': policyTemplate,
      'resourceType': resourceType,
      if (clientToken != null) 'clientToken': clientToken,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createpermission',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePermissionResponse.fromJson(response);
  }

  /// Creates a new version of the specified customer managed permission. The
  /// new version is automatically set as the default version of the customer
  /// managed permission. New resource shares automatically use the default
  /// permission. Existing resource shares continue to use their original
  /// permission versions, but you can use <a>ReplacePermissionAssociations</a>
  /// to update them.
  ///
  /// If the specified customer managed permission already has the maximum of 5
  /// versions, then you must delete one of the existing versions before you can
  /// create a new one.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPolicyException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedPolicyTemplateException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [PermissionVersionsLimitExceededException].
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the customer managed permission you're creating
  /// a new version for.
  ///
  /// Parameter [policyTemplate] :
  /// A string in JSON format string that contains the following elements of a
  /// resource-based policy:
  ///
  /// <ul>
  /// <li>
  /// <b>Effect</b>: must be set to <code>ALLOW</code>.
  /// </li>
  /// <li>
  /// <b>Action</b>: specifies the actions that are allowed by this customer
  /// managed permission. The list must contain only actions that are supported
  /// by the specified resource type. For a list of all actions supported by
  /// each resource type, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Actions,
  /// resources, and condition keys for Amazon Web Services services</a> in the
  /// <i>Identity and Access Management User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Condition</b>: (optional) specifies conditional parameters that must
  /// evaluate to true when a user attempts an action for that action to be
  /// allowed. For more information about the Condition element, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition.html">IAM
  /// policies: Condition element</a> in the <i>Identity and Access Management
  /// User Guide</i>.
  /// </li>
  /// </ul>
  /// This template can't include either the <code>Resource</code> or
  /// <code>Principal</code> elements. Those are both filled in by RAM when it
  /// instantiates the resource-based policy on each resource shared using this
  /// managed permission. The <code>Resource</code> comes from the ARN of the
  /// specific resource that you are sharing. The <code>Principal</code> comes
  /// from the list of identities added to the resource share.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<CreatePermissionVersionResponse> createPermissionVersion({
    required String permissionArn,
    required String policyTemplate,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      'policyTemplate': policyTemplate,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createpermissionversion',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePermissionVersionResponse.fromJson(response);
  }

  /// Creates a resource share. You can provide a list of the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> for the resources that you want to share, a list
  /// of principals you want to share the resources with, and the permissions to
  /// grant those principals.
  /// <note>
  /// Sharing a resource makes it available for use by principals outside of the
  /// Amazon Web Services account that created the resource. Sharing doesn't
  /// change any permissions or quotas that apply to the resource in the account
  /// that created it.
  /// </note>
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [TagPolicyViolationException].
  /// May throw [TagLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// Specifies the name of the resource share.
  ///
  /// Parameter [allowExternalPrincipals] :
  /// Specifies whether principals outside your organization in Organizations
  /// can be associated with a resource share. A value of <code>true</code> lets
  /// you share with individual Amazon Web Services accounts that are <i>not</i>
  /// in your organization. A value of <code>false</code> only has meaning if
  /// your account is a member of an Amazon Web Services Organization. The
  /// default value is <code>true</code>.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [permissionArns] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> of the RAM permission to associate with the
  /// resource share. If you do not specify an ARN for the permission, RAM
  /// automatically attaches the default version of the permission for each
  /// resource type. You can associate only one permission with each resource
  /// type included in the resource share.
  ///
  /// Parameter [principals] :
  /// Specifies a list of one or more principals to associate with the resource
  /// share.
  ///
  /// You can include the following values:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Web Services account ID, for example: <code>123456789012</code>
  /// </li>
  /// <li>
  /// An <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an organization in Organizations, for example:
  /// <code>organizations::123456789012:organization/o-exampleorgid</code>
  /// </li>
  /// <li>
  /// An ARN of an organizational unit (OU) in Organizations, for example:
  /// <code>organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM role, for example:
  /// <code>iam::123456789012:role/rolename</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM user, for example:
  /// <code>iam::123456789012user/username</code>
  /// </li>
  /// </ul> <note>
  /// Not all resource types can be shared with IAM roles and users. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ram/latest/userguide/permissions.html#permissions-rbp-supported-resource-types">Sharing
  /// with IAM roles and users</a> in the <i>Resource Access Manager User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [resourceArns] :
  /// Specifies a list of one or more ARNs of the resources to associate with
  /// the resource share.
  ///
  /// Parameter [sources] :
  /// Specifies from which source accounts the service principal has access to
  /// the resources in this resource share.
  ///
  /// Parameter [tags] :
  /// Specifies one or more tags to attach to the resource share itself. It
  /// doesn't attach the tags to the resources associated with the resource
  /// share.
  Future<CreateResourceShareResponse> createResourceShare({
    required String name,
    bool? allowExternalPrincipals,
    String? clientToken,
    List<String>? permissionArns,
    List<String>? principals,
    List<String>? resourceArns,
    List<String>? sources,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (clientToken != null) 'clientToken': clientToken,
      if (permissionArns != null) 'permissionArns': permissionArns,
      if (principals != null) 'principals': principals,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourceShareResponse.fromJson(response);
  }

  /// Deletes the specified customer managed permission in the Amazon Web
  /// Services Region in which you call this operation. You can delete a
  /// customer managed permission only if it isn't attached to any resource
  /// share. The operation deletes all versions associated with the customer
  /// managed permission.
  ///
  /// May throw [MalformedArnException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the customer managed permission that you want
  /// to delete.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<DeletePermissionResponse> deletePermission({
    required String permissionArn,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'permissionArn': [permissionArn],
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/deletepermission',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePermissionResponse.fromJson(response);
  }

  /// Deletes one version of a customer managed permission. The version you
  /// specify must not be attached to any resource share and must not be the
  /// default version for the permission.
  ///
  /// If a customer managed permission has the maximum of 5 versions, then you
  /// must delete at least one version before you can create another.
  ///
  /// May throw [MalformedArnException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the permission with the version you want to
  /// delete.
  ///
  /// Parameter [permissionVersion] :
  /// Specifies the version number to delete.
  ///
  /// You can't delete the default version for a customer managed permission.
  ///
  /// You can't delete a version if it's the only version of the permission. You
  /// must either first create another version, or delete the permission
  /// completely.
  ///
  /// You can't delete a version if it is attached to any resource shares. If
  /// the version is the default, you must first use
  /// <a>SetDefaultPermissionVersion</a> to set a different version as the
  /// default for the customer managed permission, and then use
  /// <a>AssociateResourceSharePermission</a> to update your resource shares to
  /// use the new default version.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<DeletePermissionVersionResponse> deletePermissionVersion({
    required String permissionArn,
    required int permissionVersion,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'permissionArn': [permissionArn],
      'permissionVersion': [permissionVersion.toString()],
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/deletepermissionversion',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePermissionVersionResponse.fromJson(response);
  }

  /// Deletes the specified resource share.
  /// <important>
  /// This doesn't delete any of the resources that were associated with the
  /// resource share; it only stops the sharing of those resources through this
  /// resource share.
  /// </important>
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share to delete.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<DeleteResourceShareResponse> deleteResourceShare({
    required String resourceShareArn,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'resourceShareArn': [resourceShareArn],
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/deleteresourceshare',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourceShareResponse.fromJson(response);
  }

  /// Removes the specified principals or resources from participating in the
  /// specified resource share.
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share that you want to remove
  /// resources or principals from.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [principals] :
  /// Specifies a list of one or more principals that no longer are to have
  /// access to the resources in this resource share.
  ///
  /// You can include the following values:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Web Services account ID, for example: <code>123456789012</code>
  /// </li>
  /// <li>
  /// An <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an organization in Organizations, for example:
  /// <code>organizations::123456789012:organization/o-exampleorgid</code>
  /// </li>
  /// <li>
  /// An ARN of an organizational unit (OU) in Organizations, for example:
  /// <code>organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM role, for example:
  /// <code>iam::123456789012:role/rolename</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM user, for example:
  /// <code>iam::123456789012user/username</code>
  /// </li>
  /// </ul> <note>
  /// Not all resource types can be shared with IAM roles and users. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ram/latest/userguide/permissions.html#permissions-rbp-supported-resource-types">Sharing
  /// with IAM roles and users</a> in the <i>Resource Access Manager User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [resourceArns] :
  /// Specifies a list of <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> for one or more resources that you want to
  /// remove from the resource share. After the operation runs, these resources
  /// are no longer shared with principals associated with the resource share.
  ///
  /// Parameter [sources] :
  /// Specifies from which source accounts the service principal no longer has
  /// access to the resources in this resource share.
  Future<DisassociateResourceShareResponse> disassociateResourceShare({
    required String resourceShareArn,
    String? clientToken,
    List<String>? principals,
    List<String>? resourceArns,
    List<String>? sources,
  }) async {
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (principals != null) 'principals': principals,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (sources != null) 'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociateresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateResourceShareResponse.fromJson(response);
  }

  /// Removes a managed permission from a resource share. Permission changes
  /// take effect immediately. You can remove a managed permission from a
  /// resource share only if there are currently no resources of the relevant
  /// resource type currently attached to the resource share.
  ///
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidClientTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidStateTransitionException].
  ///
  /// Parameter [permissionArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the managed permission to disassociate from the
  /// resource share. Changes to permissions take effect immediately.
  ///
  /// Parameter [resourceShareArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share that you want to remove the
  /// managed permission from.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<DisassociateResourceSharePermissionResponse>
      disassociateResourceSharePermission({
    required String permissionArn,
    required String resourceShareArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociateresourcesharepermission',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateResourceSharePermissionResponse.fromJson(response);
  }

  /// Enables resource sharing within your organization in Organizations. This
  /// operation creates a service-linked role called
  /// <code>AWSServiceRoleForResourceAccessManager</code> that has the IAM
  /// managed policy named AWSResourceAccessManagerServiceRolePolicy attached.
  /// This role permits RAM to retrieve information about the organization and
  /// its structure. This lets you share resources with all of the accounts in
  /// the calling account's organization by specifying the organization ID, or
  /// all of the accounts in an organizational unit (OU) by specifying the OU
  /// ID. Until you enable sharing within the organization, you can specify only
  /// individual Amazon Web Services accounts, or for supported resource types,
  /// IAM roles and users.
  ///
  /// You must call this operation from an IAM role or user in the
  /// organization's management account.
  /// <p/>
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  Future<EnableSharingWithAwsOrganizationResponse>
      enableSharingWithAwsOrganization() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/enablesharingwithawsorganization',
      exceptionFnMap: _exceptionFns,
    );
    return EnableSharingWithAwsOrganizationResponse.fromJson(response);
  }

  /// Retrieves the contents of a managed permission in JSON format.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the permission whose contents you want to
  /// retrieve. To find the ARN for a permission, use either the
  /// <a>ListPermissions</a> operation or go to the <a
  /// href="https://console.aws.amazon.com/ram/home#Permissions:">Permissions
  /// library</a> page in the RAM console and then choose the name of the
  /// permission. The ARN is displayed on the detail page.
  ///
  /// Parameter [permissionVersion] :
  /// Specifies the version number of the RAM permission to retrieve. If you
  /// don't specify this parameter, the operation retrieves the default version.
  ///
  /// To see the list of available versions, use <a>ListPermissionVersions</a>.
  Future<GetPermissionResponse> getPermission({
    required String permissionArn,
    int? permissionVersion,
  }) async {
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      if (permissionVersion != null) 'permissionVersion': permissionVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getpermission',
      exceptionFnMap: _exceptionFns,
    );
    return GetPermissionResponse.fromJson(response);
  }

  /// Retrieves the resource policies for the specified resources that you own
  /// and have shared.
  ///
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceArnNotFoundException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArns] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> of the resources whose policies you want to
  /// retrieve.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [principal] :
  /// Specifies the principal.
  Future<GetResourcePoliciesResponse> getResourcePolicies({
    required List<String> resourceArns,
    int? maxResults,
    String? nextToken,
    String? principal,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceArns': resourceArns,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principal != null) 'principal': principal,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourcepolicies',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePoliciesResponse.fromJson(response);
  }

  /// Retrieves the lists of resources and principals that associated for
  /// resource shares that you own.
  ///
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [associationType] :
  /// Specifies whether you want to retrieve the associations that involve a
  /// specified resource or principal.
  ///
  /// <ul>
  /// <li>
  /// <code>PRINCIPAL</code> – list the principals whose associations you want
  /// to see.
  /// </li>
  /// <li>
  /// <code>RESOURCE</code> – list the resources whose associations you want to
  /// see.
  /// </li>
  /// </ul>
  ///
  /// Parameter [associationStatus] :
  /// Specifies that you want to retrieve only associations that have this
  /// status.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [principal] :
  /// Specifies the ID of the principal whose resource shares you want to
  /// retrieve. This can be an Amazon Web Services account ID, an organization
  /// ID, an organizational unit ID, or the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an individual IAM role or user.
  ///
  /// You cannot specify this parameter if the association type is
  /// <code>RESOURCE</code>.
  ///
  /// Parameter [resourceArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of a resource whose resource shares you want to
  /// retrieve.
  ///
  /// You cannot specify this parameter if the association type is
  /// <code>PRINCIPAL</code>.
  ///
  /// Parameter [resourceShareArns] :
  /// Specifies a list of <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> of the resource share whose associations you
  /// want to retrieve.
  Future<GetResourceShareAssociationsResponse> getResourceShareAssociations({
    required ResourceShareAssociationType associationType,
    ResourceShareAssociationStatus? associationStatus,
    int? maxResults,
    String? nextToken,
    String? principal,
    String? resourceArn,
    List<String>? resourceShareArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'associationType': associationType.toValue(),
      if (associationStatus != null)
        'associationStatus': associationStatus.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principal != null) 'principal': principal,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourceshareassociations',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceShareAssociationsResponse.fromJson(response);
  }

  /// Retrieves details about invitations that you have received for resource
  /// shares.
  ///
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [resourceShareArns] :
  /// Specifies that you want details about invitations only for the resource
  /// shares described by this list of <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>
  ///
  /// Parameter [resourceShareInvitationArns] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> of the resource share invitations you want
  /// information about.
  Future<GetResourceShareInvitationsResponse> getResourceShareInvitations({
    int? maxResults,
    String? nextToken,
    List<String>? resourceShareArns,
    List<String>? resourceShareInvitationArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceShareInvitationArns != null)
        'resourceShareInvitationArns': resourceShareInvitationArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourceshareinvitations',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceShareInvitationsResponse.fromJson(response);
  }

  /// Retrieves details about the resource shares that you own or that are
  /// shared with you.
  ///
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceOwner] :
  /// Specifies that you want to retrieve details of only those resource shares
  /// that match the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>SELF</code> </b> – resource shares that your account shares with
  /// other accounts
  /// </li>
  /// <li>
  /// <b> <code>OTHER-ACCOUNTS</code> </b> – resource shares that other accounts
  /// share with your account
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [name] :
  /// Specifies the name of an individual resource share that you want to
  /// retrieve details about.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [permissionArn] :
  /// Specifies that you want to retrieve details of only those resource shares
  /// that use the managed permission with this <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a>.
  ///
  /// Parameter [permissionVersion] :
  /// Specifies that you want to retrieve details for only those resource shares
  /// that use the specified version of the managed permission.
  ///
  /// Parameter [resourceShareArns] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> of individual resource shares that you want
  /// information about.
  ///
  /// Parameter [resourceShareStatus] :
  /// Specifies that you want to retrieve details of only those resource shares
  /// that have this status.
  ///
  /// Parameter [tagFilters] :
  /// Specifies that you want to retrieve details of only those resource shares
  /// that match the specified tag keys and values.
  Future<GetResourceSharesResponse> getResourceShares({
    required ResourceOwner resourceOwner,
    int? maxResults,
    String? name,
    String? nextToken,
    String? permissionArn,
    int? permissionVersion,
    List<String>? resourceShareArns,
    ResourceShareStatus? resourceShareStatus,
    List<TagFilter>? tagFilters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (name != null) 'name': name,
      if (nextToken != null) 'nextToken': nextToken,
      if (permissionArn != null) 'permissionArn': permissionArn,
      if (permissionVersion != null) 'permissionVersion': permissionVersion,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceShareStatus != null)
        'resourceShareStatus': resourceShareStatus.toValue(),
      if (tagFilters != null) 'tagFilters': tagFilters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourceshares',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceSharesResponse.fromJson(response);
  }

  /// Lists the resources in a resource share that is shared with you but for
  /// which the invitation is still <code>PENDING</code>. That means that you
  /// haven't accepted or rejected the invitation and the invitation hasn't
  /// expired.
  ///
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ResourceShareInvitationAlreadyRejectedException].
  /// May throw [ResourceShareInvitationExpiredException].
  ///
  /// Parameter [resourceShareInvitationArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the invitation. You can use
  /// <a>GetResourceShareInvitations</a> to find the ARN of the invitation.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [resourceRegionScope] :
  /// Specifies that you want the results to include only resources that have
  /// the specified scope.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – the results include both global and regional resources
  /// or resource types.
  /// </li>
  /// <li>
  /// <code>GLOBAL</code> – the results include only global resources or
  /// resource types.
  /// </li>
  /// <li>
  /// <code>REGIONAL</code> – the results include only regional resources or
  /// resource types.
  /// </li>
  /// </ul>
  /// The default value is <code>ALL</code>.
  Future<ListPendingInvitationResourcesResponse>
      listPendingInvitationResources({
    required String resourceShareInvitationArn,
    int? maxResults,
    String? nextToken,
    ResourceRegionScopeFilter? resourceRegionScope,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceRegionScope != null)
        'resourceRegionScope': resourceRegionScope.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listpendinginvitationresources',
      exceptionFnMap: _exceptionFns,
    );
    return ListPendingInvitationResourcesResponse.fromJson(response);
  }

  /// Lists information about the managed permission and its associations to any
  /// resource shares that use this managed permission. This lets you see which
  /// resource shares use which versions of the specified managed permission.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [associationStatus] :
  /// Specifies that you want to list only those associations with resource
  /// shares that match this status.
  ///
  /// Parameter [defaultVersion] :
  /// When <code>true</code>, specifies that you want to list only those
  /// associations with resource shares that use the default version of the
  /// specified managed permission.
  ///
  /// When <code>false</code> (the default value), lists associations with
  /// resource shares that use any version of the specified managed permission.
  ///
  /// Parameter [featureSet] :
  /// Specifies that you want to list only those associations with resource
  /// shares that have a <code>featureSet</code> with this value.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the managed permission.
  ///
  /// Parameter [permissionVersion] :
  /// Specifies that you want to list only those associations with resource
  /// shares that use this version of the managed permission. If you don't
  /// provide a value for this parameter, then the operation returns information
  /// about associations with resource shares that use any version of the
  /// managed permission.
  ///
  /// Parameter [resourceType] :
  /// Specifies that you want to list only those associations with resource
  /// shares that include at least one resource of this resource type.
  Future<ListPermissionAssociationsResponse> listPermissionAssociations({
    ResourceShareAssociationStatus? associationStatus,
    bool? defaultVersion,
    PermissionFeatureSet? featureSet,
    int? maxResults,
    String? nextToken,
    String? permissionArn,
    int? permissionVersion,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (associationStatus != null)
        'associationStatus': associationStatus.toValue(),
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (featureSet != null) 'featureSet': featureSet.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (permissionArn != null) 'permissionArn': permissionArn,
      if (permissionVersion != null) 'permissionVersion': permissionVersion,
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listpermissionassociations',
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionAssociationsResponse.fromJson(response);
  }

  /// Lists the available versions of the specified RAM permission.
  ///
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the RAM permission whose versions you want to
  /// list. You can use the <code>permissionVersion</code> parameter on the
  /// <a>AssociateResourceSharePermission</a> operation to specify a non-default
  /// version to attach.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListPermissionVersionsResponse> listPermissionVersions({
    required String permissionArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listpermissionversions',
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of available RAM permissions that you can use for the
  /// supported resource types.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [permissionType] :
  /// Specifies that you want to list only permissions of this type:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS</code> – returns only Amazon Web Services managed permissions.
  /// </li>
  /// <li>
  /// <code>LOCAL</code> – returns only customer managed permissions
  /// </li>
  /// <li>
  /// <code>ALL</code> – returns both Amazon Web Services managed permissions
  /// and customer managed permissions.
  /// </li>
  /// </ul>
  /// If you don't specify this parameter, the default is <code>All</code>.
  ///
  /// Parameter [resourceType] :
  /// Specifies that you want to list only those permissions that apply to the
  /// specified resource type. This parameter is not case sensitive.
  ///
  /// For example, to list only permissions that apply to Amazon EC2 subnets,
  /// specify <code>ec2:subnet</code>. You can use the <a>ListResourceTypes</a>
  /// operation to get the specific string required.
  Future<ListPermissionsResponse> listPermissions({
    int? maxResults,
    String? nextToken,
    PermissionTypeFilter? permissionType,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (permissionType != null) 'permissionType': permissionType.toValue(),
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listpermissions',
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionsResponse.fromJson(response);
  }

  /// Lists the principals that you are sharing resources with or that are
  /// sharing resources with you.
  ///
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceOwner] :
  /// Specifies that you want to list information for only resource shares that
  /// match the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>SELF</code> </b> – principals that your account is sharing
  /// resources with
  /// </li>
  /// <li>
  /// <b> <code>OTHER-ACCOUNTS</code> </b> – principals that are sharing
  /// resources with your account
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [principals] :
  /// Specifies that you want to list information for only the listed
  /// principals.
  ///
  /// You can include the following values:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Web Services account ID, for example: <code>123456789012</code>
  /// </li>
  /// <li>
  /// An <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an organization in Organizations, for example:
  /// <code>organizations::123456789012:organization/o-exampleorgid</code>
  /// </li>
  /// <li>
  /// An ARN of an organizational unit (OU) in Organizations, for example:
  /// <code>organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM role, for example:
  /// <code>iam::123456789012:role/rolename</code>
  /// </li>
  /// <li>
  /// An ARN of an IAM user, for example:
  /// <code>iam::123456789012user/username</code>
  /// </li>
  /// </ul> <note>
  /// Not all resource types can be shared with IAM roles and users. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ram/latest/userguide/permissions.html#permissions-rbp-supported-resource-types">Sharing
  /// with IAM roles and users</a> in the <i>Resource Access Manager User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [resourceArn] :
  /// Specifies that you want to list principal information for the resource
  /// share with the specified <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a>.
  ///
  /// Parameter [resourceShareArns] :
  /// Specifies that you want to list information for only principals associated
  /// with the resource shares specified by a list the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  ///
  /// Parameter [resourceType] :
  /// Specifies that you want to list information for only principals associated
  /// with resource shares that include the specified resource type.
  ///
  /// For a list of valid values, query the <a>ListResourceTypes</a> operation.
  Future<ListPrincipalsResponse> listPrincipals({
    required ResourceOwner resourceOwner,
    int? maxResults,
    String? nextToken,
    List<String>? principals,
    String? resourceArn,
    List<String>? resourceShareArns,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principals != null) 'principals': principals,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listprincipals',
      exceptionFnMap: _exceptionFns,
    );
    return ListPrincipalsResponse.fromJson(response);
  }

  /// Retrieves the current status of the asynchronous tasks performed by RAM
  /// when you perform the <a>ReplacePermissionAssociationsWork</a> operation.
  ///
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [status] :
  /// Specifies that you want to see only the details about requests with a
  /// status that matches this value.
  ///
  /// Parameter [workIds] :
  /// A list of IDs. These values come from the <code>id</code>field of the
  /// <code>replacePermissionAssociationsWork</code>structure returned by the
  /// <a>ReplacePermissionAssociations</a> operation.
  Future<ListReplacePermissionAssociationsWorkResponse>
      listReplacePermissionAssociationsWork({
    int? maxResults,
    String? nextToken,
    ReplacePermissionAssociationsWorkStatus? status,
    List<String>? workIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (status != null) 'status': status.toValue(),
      if (workIds != null) 'workIds': workIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listreplacepermissionassociationswork',
      exceptionFnMap: _exceptionFns,
    );
    return ListReplacePermissionAssociationsWorkResponse.fromJson(response);
  }

  /// Lists the RAM permissions that are associated with a resource share.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share for which you want to
  /// retrieve the associated permissions.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListResourceSharePermissionsResponse> listResourceSharePermissions({
    required String resourceShareArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listresourcesharepermissions',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceSharePermissionsResponse.fromJson(response);
  }

  /// Lists the resource types that can be shared by RAM.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [resourceRegionScope] :
  /// Specifies that you want the results to include only resources that have
  /// the specified scope.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – the results include both global and regional resources
  /// or resource types.
  /// </li>
  /// <li>
  /// <code>GLOBAL</code> – the results include only global resources or
  /// resource types.
  /// </li>
  /// <li>
  /// <code>REGIONAL</code> – the results include only regional resources or
  /// resource types.
  /// </li>
  /// </ul>
  /// The default value is <code>ALL</code>.
  Future<ListResourceTypesResponse> listResourceTypes({
    int? maxResults,
    String? nextToken,
    ResourceRegionScopeFilter? resourceRegionScope,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceRegionScope != null)
        'resourceRegionScope': resourceRegionScope.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listresourcetypes',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceTypesResponse.fromJson(response);
  }

  /// Lists the resources that you added to a resource share or the resources
  /// that are shared with you.
  ///
  /// May throw [InvalidResourceTypeException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceOwner] :
  /// Specifies that you want to list only the resource shares that match the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>SELF</code> </b> – resources that your account shares with other
  /// accounts
  /// </li>
  /// <li>
  /// <b> <code>OTHER-ACCOUNTS</code> </b> – resources that other accounts share
  /// with your account
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included on each page
  /// of the response. If you do not include this parameter, it defaults to a
  /// value that is specific to the operation. If additional items exist beyond
  /// the number you specify, the <code>NextToken</code> response element is
  /// returned with a value (not null). Include the specified value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [principal] :
  /// Specifies that you want to list only the resource shares that are
  /// associated with the specified principal.
  ///
  /// Parameter [resourceArns] :
  /// Specifies that you want to list only the resource shares that include
  /// resources with the specified <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  ///
  /// Parameter [resourceRegionScope] :
  /// Specifies that you want the results to include only resources that have
  /// the specified scope.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – the results include both global and regional resources
  /// or resource types.
  /// </li>
  /// <li>
  /// <code>GLOBAL</code> – the results include only global resources or
  /// resource types.
  /// </li>
  /// <li>
  /// <code>REGIONAL</code> – the results include only regional resources or
  /// resource types.
  /// </li>
  /// </ul>
  /// The default value is <code>ALL</code>.
  ///
  /// Parameter [resourceShareArns] :
  /// Specifies that you want to list only resources in the resource shares
  /// identified by the specified <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  ///
  /// Parameter [resourceType] :
  /// Specifies that you want to list only the resource shares that include
  /// resources of the specified resource type.
  ///
  /// For valid values, query the <a>ListResourceTypes</a> operation.
  Future<ListResourcesResponse> listResources({
    required ResourceOwner resourceOwner,
    int? maxResults,
    String? nextToken,
    String? principal,
    List<String>? resourceArns,
    ResourceRegionScopeFilter? resourceRegionScope,
    List<String>? resourceShareArns,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principal != null) 'principal': principal,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceRegionScope != null)
        'resourceRegionScope': resourceRegionScope.toValue(),
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listresources',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcesResponse.fromJson(response);
  }

  /// When you attach a resource-based policy to a resource, RAM automatically
  /// creates a resource share of
  /// <code>featureSet</code>=<code>CREATED_FROM_POLICY</code> with a managed
  /// permission that has the same IAM permissions as the original
  /// resource-based policy. However, this type of managed permission is visible
  /// to only the resource share owner, and the associated resource share can't
  /// be modified by using RAM.
  ///
  /// This operation creates a separate, fully manageable customer managed
  /// permission that has the same IAM permissions as the original
  /// resource-based policy. You can associate this customer managed permission
  /// to any resource shares.
  ///
  /// Before you use <a>PromoteResourceShareCreatedFromPolicy</a>, you should
  /// first run this operation to ensure that you have an appropriate customer
  /// managed permission that can be associated with the promoted resource
  /// share.
  /// <note>
  /// <ul>
  /// <li>
  /// The original <code>CREATED_FROM_POLICY</code> policy isn't deleted, and
  /// resource shares using that original policy aren't automatically updated.
  /// </li>
  /// <li>
  /// You can't modify a <code>CREATED_FROM_POLICY</code> resource share so you
  /// can't associate the new customer managed permission by using
  /// <code>ReplacePermsissionAssociations</code>. However, if you use
  /// <a>PromoteResourceShareCreatedFromPolicy</a>, that operation automatically
  /// associates the fully manageable customer managed permission to the newly
  /// promoted <code>STANDARD</code> resource share.
  /// </li>
  /// <li>
  /// After you promote a resource share, if the original
  /// <code>CREATED_FROM_POLICY</code> managed permission has no other
  /// associations to A resource share, then RAM automatically deletes it.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [MalformedArnException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  ///
  /// Parameter [name] :
  /// Specifies a name for the promoted customer managed permission.
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the <code>CREATED_FROM_POLICY</code> permission
  /// that you want to promote. You can get this <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> by calling the <a>ListResourceSharePermissions</a>
  /// operation.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<PromotePermissionCreatedFromPolicyResponse>
      promotePermissionCreatedFromPolicy({
    required String name,
    required String permissionArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'permissionArn': permissionArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/promotepermissioncreatedfrompolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PromotePermissionCreatedFromPolicyResponse.fromJson(response);
  }

  /// When you attach a resource-based policy to a resource, RAM automatically
  /// creates a resource share of
  /// <code>featureSet</code>=<code>CREATED_FROM_POLICY</code> with a managed
  /// permission that has the same IAM permissions as the original
  /// resource-based policy. However, this type of managed permission is visible
  /// to only the resource share owner, and the associated resource share can't
  /// be modified by using RAM.
  ///
  /// This operation promotes the resource share to a <code>STANDARD</code>
  /// resource share that is fully manageable in RAM. When you promote a
  /// resource share, you can then manage the resource share in RAM and it
  /// becomes visible to all of the principals you shared it with.
  /// <important>
  /// Before you perform this operation, you should first run
  /// <a>PromotePermissionCreatedFromPolicy</a>to ensure that you have an
  /// appropriate customer managed permission that can be associated with this
  /// resource share after its is promoted. If this operation can't find a
  /// managed permission that exactly matches the existing
  /// <code>CREATED_FROM_POLICY</code> permission, then this operation fails.
  /// </important>
  ///
  /// May throw [MalformedArnException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [UnmatchedPolicyPermissionException].
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share to promote.
  Future<PromoteResourceShareCreatedFromPolicyResponse>
      promoteResourceShareCreatedFromPolicy({
    required String resourceShareArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceShareArn': [resourceShareArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/promoteresourcesharecreatedfrompolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PromoteResourceShareCreatedFromPolicyResponse.fromJson(response);
  }

  /// Rejects an invitation to a resource share from another Amazon Web Services
  /// account.
  ///
  /// May throw [MalformedArnException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [ResourceShareInvitationAlreadyAcceptedException].
  /// May throw [ResourceShareInvitationAlreadyRejectedException].
  /// May throw [ResourceShareInvitationExpiredException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [resourceShareInvitationArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the invitation that you want to reject.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<RejectResourceShareInvitationResponse> rejectResourceShareInvitation({
    required String resourceShareInvitationArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/rejectresourceshareinvitation',
      exceptionFnMap: _exceptionFns,
    );
    return RejectResourceShareInvitationResponse.fromJson(response);
  }

  /// Updates all resource shares that use a managed permission to a different
  /// managed permission. This operation always applies the default version of
  /// the target managed permission. You can optionally specify that the update
  /// applies to only resource shares that currently use a specified version.
  /// This enables you to update to the latest version, without changing the
  /// which managed permission is used.
  ///
  /// You can use this operation to update all of your resource shares to use
  /// the current default version of the permission by specifying the same value
  /// for the <code>fromPermissionArn</code> and <code>toPermissionArn</code>
  /// parameters.
  ///
  /// You can use the optional <code>fromPermissionVersion</code> parameter to
  /// update only those resources that use a specified version of the managed
  /// permission to the new managed permission.
  /// <important>
  /// To successfully perform this operation, you must have permission to update
  /// the resource-based policy on all affected resource types.
  /// </important>
  ///
  /// May throw [MalformedArnException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [fromPermissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the managed permission that you want to
  /// replace.
  ///
  /// Parameter [toPermissionArn] :
  /// Specifies the ARN of the managed permission that you want to associate
  /// with resource shares in place of the one specified by
  /// <code>fromPerssionArn</code> and <code>fromPermissionVersion</code>.
  ///
  /// The operation always associates the version that is currently the default
  /// for the specified managed permission.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [fromPermissionVersion] :
  /// Specifies that you want to updated the permissions for only those resource
  /// shares that use the specified version of the managed permission.
  Future<ReplacePermissionAssociationsResponse> replacePermissionAssociations({
    required String fromPermissionArn,
    required String toPermissionArn,
    String? clientToken,
    int? fromPermissionVersion,
  }) async {
    final $payload = <String, dynamic>{
      'fromPermissionArn': fromPermissionArn,
      'toPermissionArn': toPermissionArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (fromPermissionVersion != null)
        'fromPermissionVersion': fromPermissionVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/replacepermissionassociations',
      exceptionFnMap: _exceptionFns,
    );
    return ReplacePermissionAssociationsResponse.fromJson(response);
  }

  /// Designates the specified version number as the default version for the
  /// specified customer managed permission. New resource shares automatically
  /// use this new default permission. Existing resource shares continue to use
  /// their original permission version, but you can use
  /// <a>ReplacePermissionAssociations</a> to update them.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [permissionArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the customer managed permission whose default
  /// version you want to change.
  ///
  /// Parameter [permissionVersion] :
  /// Specifies the version number that you want to designate as the default for
  /// customer managed permission. To see a list of all available version
  /// numbers, use <a>ListPermissionVersions</a>.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<SetDefaultPermissionVersionResponse> setDefaultPermissionVersion({
    required String permissionArn,
    required int permissionVersion,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      'permissionVersion': permissionVersion,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/setdefaultpermissionversion',
      exceptionFnMap: _exceptionFns,
    );
    return SetDefaultPermissionVersionResponse.fromJson(response);
  }

  /// Adds the specified tag keys and values to a resource share or managed
  /// permission. If you choose a resource share, the tags are attached to only
  /// the resource share, not to the resources that are in the resource share.
  ///
  /// The tags on a managed permission are the same for all versions of the
  /// managed permission.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [TagLimitExceededException].
  /// May throw [ResourceArnNotFoundException].
  /// May throw [TagPolicyViolationException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [tags] :
  /// A list of one or more tag key and value pairs. The tag key must be present
  /// and not be an empty string. The tag value must be present but can be an
  /// empty string.
  ///
  /// Parameter [resourceArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the managed permission that you want to add
  /// tags to. You must specify <i>either</i> <code>resourceArn</code>, or
  /// <code>resourceShareArn</code>, but not both.
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share that you want to add tags
  /// to. You must specify <i>either</i> <code>resourceShareArn</code>, or
  /// <code>resourceArn</code>, but not both.
  Future<void> tagResource({
    required List<Tag> tags,
    String? resourceArn,
    String? resourceShareArn,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tagresource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tag key and value pairs from the specified resource
  /// share or managed permission.
  ///
  /// May throw [UnknownResourceException].
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [tagKeys] :
  /// Specifies a list of one or more tag keys that you want to remove.
  ///
  /// Parameter [resourceArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the managed permission that you want to remove
  /// tags from. You must specify either <code>resourceArn</code>, or
  /// <code>resourceShareArn</code>, but not both.
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share that you want to remove tags
  /// from. The tags are removed from the resource share, not the resources in
  /// the resource share. You must specify either <code>resourceShareArn</code>,
  /// or <code>resourceArn</code>, but not both.
  Future<void> untagResource({
    required List<String> tagKeys,
    String? resourceArn,
    String? resourceShareArn,
  }) async {
    final $payload = <String, dynamic>{
      'tagKeys': tagKeys,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untagresource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Modifies some of the properties of the specified resource share.
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceShareArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share that you want to modify.
  ///
  /// Parameter [allowExternalPrincipals] :
  /// Specifies whether principals outside your organization in Organizations
  /// can be associated with a resource share.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value.</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [name] :
  /// If specified, the new name that you want to attach to the resource share.
  Future<UpdateResourceShareResponse> updateResourceShare({
    required String resourceShareArn,
    bool? allowExternalPrincipals,
    String? clientToken,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (clientToken != null) 'clientToken': clientToken,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResourceShareResponse.fromJson(response);
  }
}

class AcceptResourceShareInvitationResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// An object that contains information about the specified invitation.
  final ResourceShareInvitation? resourceShareInvitation;

  AcceptResourceShareInvitationResponse({
    this.clientToken,
    this.resourceShareInvitation,
  });

  factory AcceptResourceShareInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return AcceptResourceShareInvitationResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareInvitation: json['resourceShareInvitation'] != null
          ? ResourceShareInvitation.fromJson(
              json['resourceShareInvitation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareInvitation = this.resourceShareInvitation;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareInvitation != null)
        'resourceShareInvitation': resourceShareInvitation,
    };
  }
}

class AssociateResourceSharePermissionResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// A return value of <code>true</code> indicates that the request succeeded. A
  /// value of <code>false</code> indicates that the request failed.
  final bool? returnValue;

  AssociateResourceSharePermissionResponse({
    this.clientToken,
    this.returnValue,
  });

  factory AssociateResourceSharePermissionResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateResourceSharePermissionResponse(
      clientToken: json['clientToken'] as String?,
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class AssociateResourceShareResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// An array of objects that contain information about the associations.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  AssociateResourceShareResponse({
    this.clientToken,
    this.resourceShareAssociations,
  });

  factory AssociateResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return AssociateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareAssociations = this.resourceShareAssociations;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
    };
  }
}

/// An object that describes a managed permission associated with a resource
/// share.
class AssociatedPermission {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the associated managed permission.
  final String? arn;

  /// Indicates whether the associated resource share is using the default version
  /// of the permission.
  final bool? defaultVersion;

  /// Indicates what features are available for this resource share. This
  /// parameter can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <b>STANDARD</b> – A resource share that supports all functionality. These
  /// resource shares are visible to all principals you share the resource share
  /// with. You can modify these resource shares in RAM using the console or APIs.
  /// This resource share might have been created by RAM, or it might have been
  /// <b>CREATED_FROM_POLICY</b> and then promoted.
  /// </li>
  /// <li>
  /// <b>CREATED_FROM_POLICY</b> – The customer manually shared a resource by
  /// attaching a resource-based policy. That policy did not match any existing
  /// managed permissions, so RAM created this customer managed permission
  /// automatically on the customer's behalf based on the attached policy
  /// document. This type of resource share is visible only to the Amazon Web
  /// Services account that created it. You can't modify it in RAM unless you
  /// promote it. For more information, see
  /// <a>PromoteResourceShareCreatedFromPolicy</a>.
  /// </li>
  /// <li>
  /// <b>PROMOTING_TO_STANDARD</b> – This resource share was originally
  /// <code>CREATED_FROM_POLICY</code>, but the customer ran the
  /// <a>PromoteResourceShareCreatedFromPolicy</a> and that operation is still in
  /// progress. This value changes to <code>STANDARD</code> when complete.
  /// </li>
  /// </ul>
  final PermissionFeatureSet? featureSet;

  /// The date and time when the association between the permission and the
  /// resource share was last updated.
  final DateTime? lastUpdatedTime;

  /// The version of the permission currently associated with the resource share.
  final String? permissionVersion;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of a resource share associated with this permission.
  final String? resourceShareArn;

  /// The resource type to which this permission applies.
  final String? resourceType;

  /// The current status of the association between the permission and the
  /// resource share. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>ATTACHABLE</code> – This permission or version can be associated with
  /// resource shares.
  /// </li>
  /// <li>
  /// <code>UNATTACHABLE</code> – This permission or version can't currently be
  /// associated with resource shares.
  /// </li>
  /// <li>
  /// <code>DELETING</code> – This permission or version is in the process of
  /// being deleted.
  /// </li>
  /// <li>
  /// <code>DELETED</code> – This permission or version is deleted.
  /// </li>
  /// </ul>
  final String? status;

  AssociatedPermission({
    this.arn,
    this.defaultVersion,
    this.featureSet,
    this.lastUpdatedTime,
    this.permissionVersion,
    this.resourceShareArn,
    this.resourceType,
    this.status,
  });

  factory AssociatedPermission.fromJson(Map<String, dynamic> json) {
    return AssociatedPermission(
      arn: json['arn'] as String?,
      defaultVersion: json['defaultVersion'] as bool?,
      featureSet: (json['featureSet'] as String?)?.toPermissionFeatureSet(),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      permissionVersion: json['permissionVersion'] as String?,
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceType: json['resourceType'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final defaultVersion = this.defaultVersion;
    final featureSet = this.featureSet;
    final lastUpdatedTime = this.lastUpdatedTime;
    final permissionVersion = this.permissionVersion;
    final resourceShareArn = this.resourceShareArn;
    final resourceType = this.resourceType;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (featureSet != null) 'featureSet': featureSet.toValue(),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (permissionVersion != null) 'permissionVersion': permissionVersion,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceType != null) 'resourceType': resourceType,
      if (status != null) 'status': status,
    };
  }
}

class CreatePermissionResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// A structure with information about this customer managed permission.
  final ResourceSharePermissionSummary? permission;

  CreatePermissionResponse({
    this.clientToken,
    this.permission,
  });

  factory CreatePermissionResponse.fromJson(Map<String, dynamic> json) {
    return CreatePermissionResponse(
      clientToken: json['clientToken'] as String?,
      permission: json['permission'] != null
          ? ResourceSharePermissionSummary.fromJson(
              json['permission'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final permission = this.permission;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (permission != null) 'permission': permission,
    };
  }
}

class CreatePermissionVersionResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;
  final ResourceSharePermissionDetail? permission;

  CreatePermissionVersionResponse({
    this.clientToken,
    this.permission,
  });

  factory CreatePermissionVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreatePermissionVersionResponse(
      clientToken: json['clientToken'] as String?,
      permission: json['permission'] != null
          ? ResourceSharePermissionDetail.fromJson(
              json['permission'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final permission = this.permission;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (permission != null) 'permission': permission,
    };
  }
}

class CreateResourceShareResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// An object with information about the new resource share.
  final ResourceShare? resourceShare;

  CreateResourceShareResponse({
    this.clientToken,
    this.resourceShare,
  });

  factory CreateResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShare: json['resourceShare'] != null
          ? ResourceShare.fromJson(
              json['resourceShare'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShare = this.resourceShare;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShare != null) 'resourceShare': resourceShare,
    };
  }
}

class DeletePermissionResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// This operation is performed asynchronously, and this response parameter
  /// indicates the current status.
  final PermissionStatus? permissionStatus;

  /// A boolean that indicates whether the delete operations succeeded.
  final bool? returnValue;

  DeletePermissionResponse({
    this.clientToken,
    this.permissionStatus,
    this.returnValue,
  });

  factory DeletePermissionResponse.fromJson(Map<String, dynamic> json) {
    return DeletePermissionResponse(
      clientToken: json['clientToken'] as String?,
      permissionStatus:
          (json['permissionStatus'] as String?)?.toPermissionStatus(),
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final permissionStatus = this.permissionStatus;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (permissionStatus != null)
        'permissionStatus': permissionStatus.toValue(),
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class DeletePermissionVersionResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// This operation is performed asynchronously, and this response parameter
  /// indicates the current status.
  final PermissionStatus? permissionStatus;

  /// A boolean value that indicates whether the operation is successful.
  final bool? returnValue;

  DeletePermissionVersionResponse({
    this.clientToken,
    this.permissionStatus,
    this.returnValue,
  });

  factory DeletePermissionVersionResponse.fromJson(Map<String, dynamic> json) {
    return DeletePermissionVersionResponse(
      clientToken: json['clientToken'] as String?,
      permissionStatus:
          (json['permissionStatus'] as String?)?.toPermissionStatus(),
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final permissionStatus = this.permissionStatus;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (permissionStatus != null)
        'permissionStatus': permissionStatus.toValue(),
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class DeleteResourceShareResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// A return value of <code>true</code> indicates that the request succeeded. A
  /// value of <code>false</code> indicates that the request failed.
  final bool? returnValue;

  DeleteResourceShareResponse({
    this.clientToken,
    this.returnValue,
  });

  factory DeleteResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class DisassociateResourceSharePermissionResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// A return value of <code>true</code> indicates that the request succeeded. A
  /// value of <code>false</code> indicates that the request failed.
  final bool? returnValue;

  DisassociateResourceSharePermissionResponse({
    this.clientToken,
    this.returnValue,
  });

  factory DisassociateResourceSharePermissionResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResourceSharePermissionResponse(
      clientToken: json['clientToken'] as String?,
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class DisassociateResourceShareResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// An array of objects with information about the updated associations for this
  /// resource share.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  DisassociateResourceShareResponse({
    this.clientToken,
    this.resourceShareAssociations,
  });

  factory DisassociateResourceShareResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareAssociations = this.resourceShareAssociations;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
    };
  }
}

class EnableSharingWithAwsOrganizationResponse {
  /// A return value of <code>true</code> indicates that the request succeeded. A
  /// value of <code>false</code> indicates that the request failed.
  final bool? returnValue;

  EnableSharingWithAwsOrganizationResponse({
    this.returnValue,
  });

  factory EnableSharingWithAwsOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return EnableSharingWithAwsOrganizationResponse(
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnValue = this.returnValue;
    return {
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class GetPermissionResponse {
  /// An object with details about the permission.
  final ResourceSharePermissionDetail? permission;

  GetPermissionResponse({
    this.permission,
  });

  factory GetPermissionResponse.fromJson(Map<String, dynamic> json) {
    return GetPermissionResponse(
      permission: json['permission'] != null
          ? ResourceSharePermissionDetail.fromJson(
              json['permission'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permission = this.permission;
    return {
      if (permission != null) 'permission': permission,
    };
  }
}

class GetResourcePoliciesResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of resource policy documents in JSON format.
  final List<String>? policies;

  GetResourcePoliciesResponse({
    this.nextToken,
    this.policies,
  });

  factory GetResourcePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePoliciesResponse(
      nextToken: json['nextToken'] as String?,
      policies: (json['policies'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policies = this.policies;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (policies != null) 'policies': policies,
    };
  }
}

class GetResourceShareAssociationsResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain the details about the associations.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  GetResourceShareAssociationsResponse({
    this.nextToken,
    this.resourceShareAssociations,
  });

  factory GetResourceShareAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResourceShareAssociationsResponse(
      nextToken: json['nextToken'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceShareAssociations = this.resourceShareAssociations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
    };
  }
}

class GetResourceShareInvitationsResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain the details about the invitations.
  final List<ResourceShareInvitation>? resourceShareInvitations;

  GetResourceShareInvitationsResponse({
    this.nextToken,
    this.resourceShareInvitations,
  });

  factory GetResourceShareInvitationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResourceShareInvitationsResponse(
      nextToken: json['nextToken'] as String?,
      resourceShareInvitations: (json['resourceShareInvitations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareInvitation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceShareInvitations = this.resourceShareInvitations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShareInvitations != null)
        'resourceShareInvitations': resourceShareInvitations,
    };
  }
}

class GetResourceSharesResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain the information about the resource shares.
  final List<ResourceShare>? resourceShares;

  GetResourceSharesResponse({
    this.nextToken,
    this.resourceShares,
  });

  factory GetResourceSharesResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceSharesResponse(
      nextToken: json['nextToken'] as String?,
      resourceShares: (json['resourceShares'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceShare.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceShares = this.resourceShares;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShares != null) 'resourceShares': resourceShares,
    };
  }
}

class ListPendingInvitationResourcesResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain the information about the resources
  /// included the specified resource share.
  final List<Resource>? resources;

  ListPendingInvitationResourcesResponse({
    this.nextToken,
    this.resources,
  });

  factory ListPendingInvitationResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPendingInvitationResourcesResponse(
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

class ListPermissionAssociationsResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// A structure with information about this customer managed permission.
  final List<AssociatedPermission>? permissions;

  ListPermissionAssociationsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListPermissionAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPermissionAssociationsResponse(
      nextToken: json['nextToken'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => AssociatedPermission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissions != null) 'permissions': permissions,
    };
  }
}

class ListPermissionVersionsResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain details for each of the available versions.
  final List<ResourceSharePermissionSummary>? permissions;

  ListPermissionVersionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListPermissionVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionVersionsResponse(
      nextToken: json['nextToken'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceSharePermissionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissions != null) 'permissions': permissions,
    };
  }
}

class ListPermissionsResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects with information about the permissions.
  final List<ResourceSharePermissionSummary>? permissions;

  ListPermissionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionsResponse(
      nextToken: json['nextToken'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceSharePermissionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissions != null) 'permissions': permissions,
    };
  }
}

class ListPrincipalsResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain the details about the principals.
  final List<Principal>? principals;

  ListPrincipalsResponse({
    this.nextToken,
    this.principals,
  });

  factory ListPrincipalsResponse.fromJson(Map<String, dynamic> json) {
    return ListPrincipalsResponse(
      nextToken: json['nextToken'] as String?,
      principals: (json['principals'] as List?)
          ?.whereNotNull()
          .map((e) => Principal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final principals = this.principals;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (principals != null) 'principals': principals,
    };
  }
}

class ListReplacePermissionAssociationsWorkResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of data structures that provide details of the matching work IDs.
  final List<ReplacePermissionAssociationsWork>?
      replacePermissionAssociationsWorks;

  ListReplacePermissionAssociationsWorkResponse({
    this.nextToken,
    this.replacePermissionAssociationsWorks,
  });

  factory ListReplacePermissionAssociationsWorkResponse.fromJson(
      Map<String, dynamic> json) {
    return ListReplacePermissionAssociationsWorkResponse(
      nextToken: json['nextToken'] as String?,
      replacePermissionAssociationsWorks:
          (json['replacePermissionAssociationsWorks'] as List?)
              ?.whereNotNull()
              .map((e) => ReplacePermissionAssociationsWork.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final replacePermissionAssociationsWorks =
        this.replacePermissionAssociationsWorks;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (replacePermissionAssociationsWorks != null)
        'replacePermissionAssociationsWorks':
            replacePermissionAssociationsWorks,
    };
  }
}

class ListResourceSharePermissionsResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that describe the permissions associated with the
  /// resource share.
  final List<ResourceSharePermissionSummary>? permissions;

  ListResourceSharePermissionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListResourceSharePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourceSharePermissionsResponse(
      nextToken: json['nextToken'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceSharePermissionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissions != null) 'permissions': permissions,
    };
  }
}

class ListResourceTypesResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain information about the resource types that
  /// can be shared using RAM.
  final List<ServiceNameAndResourceType>? resourceTypes;

  ListResourceTypesResponse({
    this.nextToken,
    this.resourceTypes,
  });

  factory ListResourceTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceTypesResponse(
      nextToken: json['nextToken'] as String?,
      resourceTypes: (json['resourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ServiceNameAndResourceType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceTypes = this.resourceTypes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceTypes != null) 'resourceTypes': resourceTypes,
    };
  }
}

class ListResourcesResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array of objects that contain information about the resources.
  final List<Resource>? resources;

  ListResourcesResponse({
    this.nextToken,
    this.resources,
  });

  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesResponse(
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

enum PermissionFeatureSet {
  createdFromPolicy,
  promotingToStandard,
  standard,
}

extension PermissionFeatureSetValueExtension on PermissionFeatureSet {
  String toValue() {
    switch (this) {
      case PermissionFeatureSet.createdFromPolicy:
        return 'CREATED_FROM_POLICY';
      case PermissionFeatureSet.promotingToStandard:
        return 'PROMOTING_TO_STANDARD';
      case PermissionFeatureSet.standard:
        return 'STANDARD';
    }
  }
}

extension PermissionFeatureSetFromString on String {
  PermissionFeatureSet toPermissionFeatureSet() {
    switch (this) {
      case 'CREATED_FROM_POLICY':
        return PermissionFeatureSet.createdFromPolicy;
      case 'PROMOTING_TO_STANDARD':
        return PermissionFeatureSet.promotingToStandard;
      case 'STANDARD':
        return PermissionFeatureSet.standard;
    }
    throw Exception('$this is not known in enum PermissionFeatureSet');
  }
}

enum PermissionStatus {
  attachable,
  unattachable,
  deleting,
  deleted,
}

extension PermissionStatusValueExtension on PermissionStatus {
  String toValue() {
    switch (this) {
      case PermissionStatus.attachable:
        return 'ATTACHABLE';
      case PermissionStatus.unattachable:
        return 'UNATTACHABLE';
      case PermissionStatus.deleting:
        return 'DELETING';
      case PermissionStatus.deleted:
        return 'DELETED';
    }
  }
}

extension PermissionStatusFromString on String {
  PermissionStatus toPermissionStatus() {
    switch (this) {
      case 'ATTACHABLE':
        return PermissionStatus.attachable;
      case 'UNATTACHABLE':
        return PermissionStatus.unattachable;
      case 'DELETING':
        return PermissionStatus.deleting;
      case 'DELETED':
        return PermissionStatus.deleted;
    }
    throw Exception('$this is not known in enum PermissionStatus');
  }
}

enum PermissionType {
  customerManaged,
  awsManaged,
}

extension PermissionTypeValueExtension on PermissionType {
  String toValue() {
    switch (this) {
      case PermissionType.customerManaged:
        return 'CUSTOMER_MANAGED';
      case PermissionType.awsManaged:
        return 'AWS_MANAGED';
    }
  }
}

extension PermissionTypeFromString on String {
  PermissionType toPermissionType() {
    switch (this) {
      case 'CUSTOMER_MANAGED':
        return PermissionType.customerManaged;
      case 'AWS_MANAGED':
        return PermissionType.awsManaged;
    }
    throw Exception('$this is not known in enum PermissionType');
  }
}

enum PermissionTypeFilter {
  all,
  awsManaged,
  customerManaged,
}

extension PermissionTypeFilterValueExtension on PermissionTypeFilter {
  String toValue() {
    switch (this) {
      case PermissionTypeFilter.all:
        return 'ALL';
      case PermissionTypeFilter.awsManaged:
        return 'AWS_MANAGED';
      case PermissionTypeFilter.customerManaged:
        return 'CUSTOMER_MANAGED';
    }
  }
}

extension PermissionTypeFilterFromString on String {
  PermissionTypeFilter toPermissionTypeFilter() {
    switch (this) {
      case 'ALL':
        return PermissionTypeFilter.all;
      case 'AWS_MANAGED':
        return PermissionTypeFilter.awsManaged;
      case 'CUSTOMER_MANAGED':
        return PermissionTypeFilter.customerManaged;
    }
    throw Exception('$this is not known in enum PermissionTypeFilter');
  }
}

/// Describes a principal for use with Resource Access Manager.
class Principal {
  /// The date and time when the principal was associated with the resource share.
  final DateTime? creationTime;

  /// Indicates the relationship between the Amazon Web Services account the
  /// principal belongs to and the account that owns the resource share:
  ///
  /// <ul>
  /// <li>
  /// <code>True</code> – The two accounts belong to same organization.
  /// </li>
  /// <li>
  /// <code>False</code> – The two accounts do not belong to the same
  /// organization.
  /// </li>
  /// </ul>
  final bool? external;

  /// The ID of the principal that can be associated with a resource share.
  final String? id;

  /// The date and time when the association between the resource share and the
  /// principal was last updated.
  final DateTime? lastUpdatedTime;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of a resource share the principal is associated
  /// with.
  final String? resourceShareArn;

  Principal({
    this.creationTime,
    this.external,
    this.id,
    this.lastUpdatedTime,
    this.resourceShareArn,
  });

  factory Principal.fromJson(Map<String, dynamic> json) {
    return Principal(
      creationTime: timeStampFromJson(json['creationTime']),
      external: json['external'] as bool?,
      id: json['id'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      resourceShareArn: json['resourceShareArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final external = this.external;
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final resourceShareArn = this.resourceShareArn;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (external != null) 'external': external,
      if (id != null) 'id': id,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
    };
  }
}

class PromotePermissionCreatedFromPolicyResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;
  final ResourceSharePermissionSummary? permission;

  PromotePermissionCreatedFromPolicyResponse({
    this.clientToken,
    this.permission,
  });

  factory PromotePermissionCreatedFromPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PromotePermissionCreatedFromPolicyResponse(
      clientToken: json['clientToken'] as String?,
      permission: json['permission'] != null
          ? ResourceSharePermissionSummary.fromJson(
              json['permission'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final permission = this.permission;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (permission != null) 'permission': permission,
    };
  }
}

class PromoteResourceShareCreatedFromPolicyResponse {
  /// A return value of <code>true</code> indicates that the request succeeded. A
  /// value of <code>false</code> indicates that the request failed.
  final bool? returnValue;

  PromoteResourceShareCreatedFromPolicyResponse({
    this.returnValue,
  });

  factory PromoteResourceShareCreatedFromPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PromoteResourceShareCreatedFromPolicyResponse(
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnValue = this.returnValue;
    return {
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class RejectResourceShareInvitationResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// An object that contains the details about the rejected invitation.
  final ResourceShareInvitation? resourceShareInvitation;

  RejectResourceShareInvitationResponse({
    this.clientToken,
    this.resourceShareInvitation,
  });

  factory RejectResourceShareInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return RejectResourceShareInvitationResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareInvitation: json['resourceShareInvitation'] != null
          ? ResourceShareInvitation.fromJson(
              json['resourceShareInvitation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareInvitation = this.resourceShareInvitation;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareInvitation != null)
        'resourceShareInvitation': resourceShareInvitation,
    };
  }
}

class ReplacePermissionAssociationsResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// Specifies a data structure that you can use to track the asynchronous tasks
  /// that RAM performs to complete this operation. You can use the
  /// <a>ListReplacePermissionAssociationsWork</a> operation and pass the
  /// <code>id</code> value returned in this structure.
  final ReplacePermissionAssociationsWork? replacePermissionAssociationsWork;

  ReplacePermissionAssociationsResponse({
    this.clientToken,
    this.replacePermissionAssociationsWork,
  });

  factory ReplacePermissionAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ReplacePermissionAssociationsResponse(
      clientToken: json['clientToken'] as String?,
      replacePermissionAssociationsWork:
          json['replacePermissionAssociationsWork'] != null
              ? ReplacePermissionAssociationsWork.fromJson(
                  json['replacePermissionAssociationsWork']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final replacePermissionAssociationsWork =
        this.replacePermissionAssociationsWork;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (replacePermissionAssociationsWork != null)
        'replacePermissionAssociationsWork': replacePermissionAssociationsWork,
    };
  }
}

/// A structure that represents the background work that RAM performs when you
/// invoke the <a>ReplacePermissionAssociations</a> operation.
class ReplacePermissionAssociationsWork {
  /// The date and time when this asynchronous background task was created.
  final DateTime? creationTime;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the managed permission that this background task
  /// is replacing.
  final String? fromPermissionArn;

  /// The version of the managed permission that this background task is
  /// replacing.
  final String? fromPermissionVersion;

  /// The unique identifier for the background task associated with one
  /// <a>ReplacePermissionAssociations</a> request.
  final String? id;

  /// The date and time when the status of this background task was last updated.
  final DateTime? lastUpdatedTime;

  /// Specifies the current status of the background tasks for the specified ID.
  /// The output is one of the following strings:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code>
  /// </li>
  /// <li>
  /// <code>COMPLETED</code>
  /// </li>
  /// <li>
  /// <code>FAILED</code>
  /// </li>
  /// </ul>
  final ReplacePermissionAssociationsWorkStatus? status;

  /// Specifies the reason for a <code>FAILED</code> status. This field is present
  /// only when there <code>status</code> is <code>FAILED</code>.
  final String? statusMessage;

  /// The ARN of the managed permission that this background task is associating
  /// with the resource shares in place of the managed permission and version
  /// specified in <code>fromPermissionArn</code> and
  /// <code>fromPermissionVersion</code>.
  final String? toPermissionArn;

  /// The version of the managed permission that this background task is
  /// associating with the resource shares. This is always the version that is
  /// currently the default for this managed permission.
  final String? toPermissionVersion;

  ReplacePermissionAssociationsWork({
    this.creationTime,
    this.fromPermissionArn,
    this.fromPermissionVersion,
    this.id,
    this.lastUpdatedTime,
    this.status,
    this.statusMessage,
    this.toPermissionArn,
    this.toPermissionVersion,
  });

  factory ReplacePermissionAssociationsWork.fromJson(
      Map<String, dynamic> json) {
    return ReplacePermissionAssociationsWork(
      creationTime: timeStampFromJson(json['creationTime']),
      fromPermissionArn: json['fromPermissionArn'] as String?,
      fromPermissionVersion: json['fromPermissionVersion'] as String?,
      id: json['id'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      status: (json['status'] as String?)
          ?.toReplacePermissionAssociationsWorkStatus(),
      statusMessage: json['statusMessage'] as String?,
      toPermissionArn: json['toPermissionArn'] as String?,
      toPermissionVersion: json['toPermissionVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final fromPermissionArn = this.fromPermissionArn;
    final fromPermissionVersion = this.fromPermissionVersion;
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final toPermissionArn = this.toPermissionArn;
    final toPermissionVersion = this.toPermissionVersion;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (fromPermissionArn != null) 'fromPermissionArn': fromPermissionArn,
      if (fromPermissionVersion != null)
        'fromPermissionVersion': fromPermissionVersion,
      if (id != null) 'id': id,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (toPermissionArn != null) 'toPermissionArn': toPermissionArn,
      if (toPermissionVersion != null)
        'toPermissionVersion': toPermissionVersion,
    };
  }
}

enum ReplacePermissionAssociationsWorkStatus {
  inProgress,
  completed,
  failed,
}

extension ReplacePermissionAssociationsWorkStatusValueExtension
    on ReplacePermissionAssociationsWorkStatus {
  String toValue() {
    switch (this) {
      case ReplacePermissionAssociationsWorkStatus.inProgress:
        return 'IN_PROGRESS';
      case ReplacePermissionAssociationsWorkStatus.completed:
        return 'COMPLETED';
      case ReplacePermissionAssociationsWorkStatus.failed:
        return 'FAILED';
    }
  }
}

extension ReplacePermissionAssociationsWorkStatusFromString on String {
  ReplacePermissionAssociationsWorkStatus
      toReplacePermissionAssociationsWorkStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ReplacePermissionAssociationsWorkStatus.inProgress;
      case 'COMPLETED':
        return ReplacePermissionAssociationsWorkStatus.completed;
      case 'FAILED':
        return ReplacePermissionAssociationsWorkStatus.failed;
    }
    throw Exception(
        '$this is not known in enum ReplacePermissionAssociationsWorkStatus');
  }
}

/// Describes a resource associated with a resource share in RAM.
class Resource {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource.
  final String? arn;

  /// The date and time when the resource was associated with the resource share.
  final DateTime? creationTime;

  /// The date an time when the association between the resource and the resource
  /// share was last updated.
  final DateTime? lastUpdatedTime;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource group. This value is available only
  /// if the resource is part of a resource group.
  final String? resourceGroupArn;

  /// Specifies the scope of visibility of this resource:
  ///
  /// <ul>
  /// <li>
  /// <b>REGIONAL</b> – The resource can be accessed only by using requests that
  /// target the Amazon Web Services Region in which the resource exists.
  /// </li>
  /// <li>
  /// <b>GLOBAL</b> – The resource can be accessed from any Amazon Web Services
  /// Region.
  /// </li>
  /// </ul>
  final ResourceRegionScope? resourceRegionScope;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share this resource is associated
  /// with.
  final String? resourceShareArn;

  /// The current status of the resource.
  final ResourceStatus? status;

  /// A message about the status of the resource.
  final String? statusMessage;

  /// The resource type. This takes the form of:
  /// <code>service-code</code>:<code>resource-code</code>, and is
  /// case-insensitive. For example, an Amazon EC2 Subnet would be represented by
  /// the string <code>ec2:subnet</code>.
  final String? type;

  Resource({
    this.arn,
    this.creationTime,
    this.lastUpdatedTime,
    this.resourceGroupArn,
    this.resourceRegionScope,
    this.resourceShareArn,
    this.status,
    this.statusMessage,
    this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      resourceGroupArn: json['resourceGroupArn'] as String?,
      resourceRegionScope:
          (json['resourceRegionScope'] as String?)?.toResourceRegionScope(),
      resourceShareArn: json['resourceShareArn'] as String?,
      status: (json['status'] as String?)?.toResourceStatus(),
      statusMessage: json['statusMessage'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final resourceGroupArn = this.resourceGroupArn;
    final resourceRegionScope = this.resourceRegionScope;
    final resourceShareArn = this.resourceShareArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (resourceGroupArn != null) 'resourceGroupArn': resourceGroupArn,
      if (resourceRegionScope != null)
        'resourceRegionScope': resourceRegionScope.toValue(),
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (type != null) 'type': type,
    };
  }
}

enum ResourceOwner {
  self,
  otherAccounts,
}

extension ResourceOwnerValueExtension on ResourceOwner {
  String toValue() {
    switch (this) {
      case ResourceOwner.self:
        return 'SELF';
      case ResourceOwner.otherAccounts:
        return 'OTHER-ACCOUNTS';
    }
  }
}

extension ResourceOwnerFromString on String {
  ResourceOwner toResourceOwner() {
    switch (this) {
      case 'SELF':
        return ResourceOwner.self;
      case 'OTHER-ACCOUNTS':
        return ResourceOwner.otherAccounts;
    }
    throw Exception('$this is not known in enum ResourceOwner');
  }
}

enum ResourceRegionScope {
  regional,
  global,
}

extension ResourceRegionScopeValueExtension on ResourceRegionScope {
  String toValue() {
    switch (this) {
      case ResourceRegionScope.regional:
        return 'REGIONAL';
      case ResourceRegionScope.global:
        return 'GLOBAL';
    }
  }
}

extension ResourceRegionScopeFromString on String {
  ResourceRegionScope toResourceRegionScope() {
    switch (this) {
      case 'REGIONAL':
        return ResourceRegionScope.regional;
      case 'GLOBAL':
        return ResourceRegionScope.global;
    }
    throw Exception('$this is not known in enum ResourceRegionScope');
  }
}

enum ResourceRegionScopeFilter {
  all,
  regional,
  global,
}

extension ResourceRegionScopeFilterValueExtension on ResourceRegionScopeFilter {
  String toValue() {
    switch (this) {
      case ResourceRegionScopeFilter.all:
        return 'ALL';
      case ResourceRegionScopeFilter.regional:
        return 'REGIONAL';
      case ResourceRegionScopeFilter.global:
        return 'GLOBAL';
    }
  }
}

extension ResourceRegionScopeFilterFromString on String {
  ResourceRegionScopeFilter toResourceRegionScopeFilter() {
    switch (this) {
      case 'ALL':
        return ResourceRegionScopeFilter.all;
      case 'REGIONAL':
        return ResourceRegionScopeFilter.regional;
      case 'GLOBAL':
        return ResourceRegionScopeFilter.global;
    }
    throw Exception('$this is not known in enum ResourceRegionScopeFilter');
  }
}

/// Describes a resource share in RAM.
class ResourceShare {
  /// Indicates whether principals outside your organization in Organizations can
  /// be associated with a resource share.
  ///
  /// <ul>
  /// <li>
  /// <code>True</code> – the resource share can be shared with any Amazon Web
  /// Services account.
  /// </li>
  /// <li>
  /// <code>False</code> – the resource share can be shared with only accounts in
  /// the same organization as the account that owns the resource share.
  /// </li>
  /// </ul>
  final bool? allowExternalPrincipals;

  /// The date and time when the resource share was created.
  final DateTime? creationTime;

  /// Indicates what features are available for this resource share. This
  /// parameter can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <b>STANDARD</b> – A resource share that supports all functionality. These
  /// resource shares are visible to all principals you share the resource share
  /// with. You can modify these resource shares in RAM using the console or APIs.
  /// This resource share might have been created by RAM, or it might have been
  /// <b>CREATED_FROM_POLICY</b> and then promoted.
  /// </li>
  /// <li>
  /// <b>CREATED_FROM_POLICY</b> – The customer manually shared a resource by
  /// attaching a resource-based policy. That policy did not match any existing
  /// managed permissions, so RAM created this customer managed permission
  /// automatically on the customer's behalf based on the attached policy
  /// document. This type of resource share is visible only to the Amazon Web
  /// Services account that created it. You can't modify it in RAM unless you
  /// promote it. For more information, see
  /// <a>PromoteResourceShareCreatedFromPolicy</a>.
  /// </li>
  /// <li>
  /// <b>PROMOTING_TO_STANDARD</b> – This resource share was originally
  /// <code>CREATED_FROM_POLICY</code>, but the customer ran the
  /// <a>PromoteResourceShareCreatedFromPolicy</a> and that operation is still in
  /// progress. This value changes to <code>STANDARD</code> when complete.
  /// </li>
  /// </ul>
  final ResourceShareFeatureSet? featureSet;

  /// The date and time when the resource share was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the resource share.
  final String? name;

  /// The ID of the Amazon Web Services account that owns the resource share.
  final String? owningAccountId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share
  final String? resourceShareArn;

  /// The current status of the resource share.
  final ResourceShareStatus? status;

  /// A message about the status of the resource share.
  final String? statusMessage;

  /// The tag key and value pairs attached to the resource share.
  final List<Tag>? tags;

  ResourceShare({
    this.allowExternalPrincipals,
    this.creationTime,
    this.featureSet,
    this.lastUpdatedTime,
    this.name,
    this.owningAccountId,
    this.resourceShareArn,
    this.status,
    this.statusMessage,
    this.tags,
  });

  factory ResourceShare.fromJson(Map<String, dynamic> json) {
    return ResourceShare(
      allowExternalPrincipals: json['allowExternalPrincipals'] as bool?,
      creationTime: timeStampFromJson(json['creationTime']),
      featureSet: (json['featureSet'] as String?)?.toResourceShareFeatureSet(),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      owningAccountId: json['owningAccountId'] as String?,
      resourceShareArn: json['resourceShareArn'] as String?,
      status: (json['status'] as String?)?.toResourceShareStatus(),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowExternalPrincipals = this.allowExternalPrincipals;
    final creationTime = this.creationTime;
    final featureSet = this.featureSet;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final owningAccountId = this.owningAccountId;
    final resourceShareArn = this.resourceShareArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (featureSet != null) 'featureSet': featureSet.toValue(),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (owningAccountId != null) 'owningAccountId': owningAccountId,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes an association between a resource share and either a principal or
/// a resource.
class ResourceShareAssociation {
  /// The associated entity. This can be either of the following:
  ///
  /// <ul>
  /// <li>
  /// For a resource association, this is the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource.
  /// </li>
  /// <li>
  /// For principal associations, this is one of the following:
  ///
  /// <ul>
  /// <li>
  /// The ID of an Amazon Web Services account
  /// </li>
  /// <li>
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an organization in Organizations
  /// </li>
  /// <li>
  /// The ARN of an organizational unit (OU) in Organizations
  /// </li>
  /// <li>
  /// The ARN of an IAM role
  /// </li>
  /// <li>
  /// The ARN of an IAM user
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? associatedEntity;

  /// The type of entity included in this association.
  final ResourceShareAssociationType? associationType;

  /// The date and time when the association was created.
  final DateTime? creationTime;

  /// Indicates whether the principal belongs to the same organization in
  /// Organizations as the Amazon Web Services account that owns the resource
  /// share.
  final bool? external;

  /// The date and time when the association was last updated.
  final DateTime? lastUpdatedTime;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share.
  final String? resourceShareArn;

  /// The name of the resource share.
  final String? resourceShareName;

  /// The current status of the association.
  final ResourceShareAssociationStatus? status;

  /// A message about the status of the association.
  final String? statusMessage;

  ResourceShareAssociation({
    this.associatedEntity,
    this.associationType,
    this.creationTime,
    this.external,
    this.lastUpdatedTime,
    this.resourceShareArn,
    this.resourceShareName,
    this.status,
    this.statusMessage,
  });

  factory ResourceShareAssociation.fromJson(Map<String, dynamic> json) {
    return ResourceShareAssociation(
      associatedEntity: json['associatedEntity'] as String?,
      associationType: (json['associationType'] as String?)
          ?.toResourceShareAssociationType(),
      creationTime: timeStampFromJson(json['creationTime']),
      external: json['external'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceShareName: json['resourceShareName'] as String?,
      status: (json['status'] as String?)?.toResourceShareAssociationStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedEntity = this.associatedEntity;
    final associationType = this.associationType;
    final creationTime = this.creationTime;
    final external = this.external;
    final lastUpdatedTime = this.lastUpdatedTime;
    final resourceShareArn = this.resourceShareArn;
    final resourceShareName = this.resourceShareName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (associatedEntity != null) 'associatedEntity': associatedEntity,
      if (associationType != null) 'associationType': associationType.toValue(),
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (external != null) 'external': external,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceShareName != null) 'resourceShareName': resourceShareName,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum ResourceShareAssociationStatus {
  associating,
  associated,
  failed,
  disassociating,
  disassociated,
}

extension ResourceShareAssociationStatusValueExtension
    on ResourceShareAssociationStatus {
  String toValue() {
    switch (this) {
      case ResourceShareAssociationStatus.associating:
        return 'ASSOCIATING';
      case ResourceShareAssociationStatus.associated:
        return 'ASSOCIATED';
      case ResourceShareAssociationStatus.failed:
        return 'FAILED';
      case ResourceShareAssociationStatus.disassociating:
        return 'DISASSOCIATING';
      case ResourceShareAssociationStatus.disassociated:
        return 'DISASSOCIATED';
    }
  }
}

extension ResourceShareAssociationStatusFromString on String {
  ResourceShareAssociationStatus toResourceShareAssociationStatus() {
    switch (this) {
      case 'ASSOCIATING':
        return ResourceShareAssociationStatus.associating;
      case 'ASSOCIATED':
        return ResourceShareAssociationStatus.associated;
      case 'FAILED':
        return ResourceShareAssociationStatus.failed;
      case 'DISASSOCIATING':
        return ResourceShareAssociationStatus.disassociating;
      case 'DISASSOCIATED':
        return ResourceShareAssociationStatus.disassociated;
    }
    throw Exception(
        '$this is not known in enum ResourceShareAssociationStatus');
  }
}

enum ResourceShareAssociationType {
  principal,
  resource,
}

extension ResourceShareAssociationTypeValueExtension
    on ResourceShareAssociationType {
  String toValue() {
    switch (this) {
      case ResourceShareAssociationType.principal:
        return 'PRINCIPAL';
      case ResourceShareAssociationType.resource:
        return 'RESOURCE';
    }
  }
}

extension ResourceShareAssociationTypeFromString on String {
  ResourceShareAssociationType toResourceShareAssociationType() {
    switch (this) {
      case 'PRINCIPAL':
        return ResourceShareAssociationType.principal;
      case 'RESOURCE':
        return ResourceShareAssociationType.resource;
    }
    throw Exception('$this is not known in enum ResourceShareAssociationType');
  }
}

enum ResourceShareFeatureSet {
  createdFromPolicy,
  promotingToStandard,
  standard,
}

extension ResourceShareFeatureSetValueExtension on ResourceShareFeatureSet {
  String toValue() {
    switch (this) {
      case ResourceShareFeatureSet.createdFromPolicy:
        return 'CREATED_FROM_POLICY';
      case ResourceShareFeatureSet.promotingToStandard:
        return 'PROMOTING_TO_STANDARD';
      case ResourceShareFeatureSet.standard:
        return 'STANDARD';
    }
  }
}

extension ResourceShareFeatureSetFromString on String {
  ResourceShareFeatureSet toResourceShareFeatureSet() {
    switch (this) {
      case 'CREATED_FROM_POLICY':
        return ResourceShareFeatureSet.createdFromPolicy;
      case 'PROMOTING_TO_STANDARD':
        return ResourceShareFeatureSet.promotingToStandard;
      case 'STANDARD':
        return ResourceShareFeatureSet.standard;
    }
    throw Exception('$this is not known in enum ResourceShareFeatureSet');
  }
}

/// Describes an invitation for an Amazon Web Services account to join a
/// resource share.
class ResourceShareInvitation {
  /// The date and time when the invitation was sent.
  final DateTime? invitationTimestamp;

  /// The ID of the Amazon Web Services account that received the invitation.
  final String? receiverAccountId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the IAM user or role that received the
  /// invitation.
  final String? receiverArn;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the resource share
  final String? resourceShareArn;

  /// To view the resources associated with a pending resource share invitation,
  /// use <a>ListPendingInvitationResources</a>.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the invitation.
  final String? resourceShareInvitationArn;

  /// The name of the resource share.
  final String? resourceShareName;

  /// The ID of the Amazon Web Services account that sent the invitation.
  final String? senderAccountId;

  /// The current status of the invitation.
  final ResourceShareInvitationStatus? status;

  ResourceShareInvitation({
    this.invitationTimestamp,
    this.receiverAccountId,
    this.receiverArn,
    this.resourceShareArn,
    this.resourceShareAssociations,
    this.resourceShareInvitationArn,
    this.resourceShareName,
    this.senderAccountId,
    this.status,
  });

  factory ResourceShareInvitation.fromJson(Map<String, dynamic> json) {
    return ResourceShareInvitation(
      invitationTimestamp: timeStampFromJson(json['invitationTimestamp']),
      receiverAccountId: json['receiverAccountId'] as String?,
      receiverArn: json['receiverArn'] as String?,
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceShareInvitationArn: json['resourceShareInvitationArn'] as String?,
      resourceShareName: json['resourceShareName'] as String?,
      senderAccountId: json['senderAccountId'] as String?,
      status: (json['status'] as String?)?.toResourceShareInvitationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final invitationTimestamp = this.invitationTimestamp;
    final receiverAccountId = this.receiverAccountId;
    final receiverArn = this.receiverArn;
    final resourceShareArn = this.resourceShareArn;
    final resourceShareAssociations = this.resourceShareAssociations;
    final resourceShareInvitationArn = this.resourceShareInvitationArn;
    final resourceShareName = this.resourceShareName;
    final senderAccountId = this.senderAccountId;
    final status = this.status;
    return {
      if (invitationTimestamp != null)
        'invitationTimestamp': unixTimestampToJson(invitationTimestamp),
      if (receiverAccountId != null) 'receiverAccountId': receiverAccountId,
      if (receiverArn != null) 'receiverArn': receiverArn,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
      if (resourceShareInvitationArn != null)
        'resourceShareInvitationArn': resourceShareInvitationArn,
      if (resourceShareName != null) 'resourceShareName': resourceShareName,
      if (senderAccountId != null) 'senderAccountId': senderAccountId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ResourceShareInvitationStatus {
  pending,
  accepted,
  rejected,
  expired,
}

extension ResourceShareInvitationStatusValueExtension
    on ResourceShareInvitationStatus {
  String toValue() {
    switch (this) {
      case ResourceShareInvitationStatus.pending:
        return 'PENDING';
      case ResourceShareInvitationStatus.accepted:
        return 'ACCEPTED';
      case ResourceShareInvitationStatus.rejected:
        return 'REJECTED';
      case ResourceShareInvitationStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension ResourceShareInvitationStatusFromString on String {
  ResourceShareInvitationStatus toResourceShareInvitationStatus() {
    switch (this) {
      case 'PENDING':
        return ResourceShareInvitationStatus.pending;
      case 'ACCEPTED':
        return ResourceShareInvitationStatus.accepted;
      case 'REJECTED':
        return ResourceShareInvitationStatus.rejected;
      case 'EXPIRED':
        return ResourceShareInvitationStatus.expired;
    }
    throw Exception('$this is not known in enum ResourceShareInvitationStatus');
  }
}

/// Information about a RAM managed permission.
class ResourceSharePermissionDetail {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of this RAM managed permission.
  final String? arn;

  /// The date and time when the permission was created.
  final DateTime? creationTime;

  /// Specifies whether the version of the permission represented in this response
  /// is the default version for this permission.
  final bool? defaultVersion;

  /// Indicates what features are available for this resource share. This
  /// parameter can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <b>STANDARD</b> – A resource share that supports all functionality. These
  /// resource shares are visible to all principals you share the resource share
  /// with. You can modify these resource shares in RAM using the console or APIs.
  /// This resource share might have been created by RAM, or it might have been
  /// <b>CREATED_FROM_POLICY</b> and then promoted.
  /// </li>
  /// <li>
  /// <b>CREATED_FROM_POLICY</b> – The customer manually shared a resource by
  /// attaching a resource-based policy. That policy did not match any existing
  /// managed permissions, so RAM created this customer managed permission
  /// automatically on the customer's behalf based on the attached policy
  /// document. This type of resource share is visible only to the Amazon Web
  /// Services account that created it. You can't modify it in RAM unless you
  /// promote it. For more information, see
  /// <a>PromoteResourceShareCreatedFromPolicy</a>.
  /// </li>
  /// <li>
  /// <b>PROMOTING_TO_STANDARD</b> – This resource share was originally
  /// <code>CREATED_FROM_POLICY</code>, but the customer ran the
  /// <a>PromoteResourceShareCreatedFromPolicy</a> and that operation is still in
  /// progress. This value changes to <code>STANDARD</code> when complete.
  /// </li>
  /// </ul>
  final PermissionFeatureSet? featureSet;

  /// Specifies whether the version of the permission represented in this response
  /// is the default version for all resources of this resource type.
  final bool? isResourceTypeDefault;

  /// The date and time when the permission was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of this permission.
  final String? name;

  /// The permission's effect and actions in JSON format. The <code>effect</code>
  /// indicates whether the specified actions are allowed or denied. The
  /// <code>actions</code> list the operations to which the principal is granted
  /// or denied access.
  final String? permission;

  /// The type of managed permission. This can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_MANAGED</code> – Amazon Web Services created and manages this
  /// managed permission. You can associate it with your resource shares, but you
  /// can't modify it.
  /// </li>
  /// <li>
  /// <code>CUSTOMER_MANAGED</code> – You, or another principal in your account
  /// created this managed permission. You can associate it with your resource
  /// shares and create new versions that have different permissions.
  /// </li>
  /// </ul>
  final PermissionType? permissionType;

  /// The resource type to which this permission applies.
  final String? resourceType;

  /// The current status of the association between the permission and the
  /// resource share. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>ATTACHABLE</code> – This permission or version can be associated with
  /// resource shares.
  /// </li>
  /// <li>
  /// <code>UNATTACHABLE</code> – This permission or version can't currently be
  /// associated with resource shares.
  /// </li>
  /// <li>
  /// <code>DELETING</code> – This permission or version is in the process of
  /// being deleted.
  /// </li>
  /// <li>
  /// <code>DELETED</code> – This permission or version is deleted.
  /// </li>
  /// </ul>
  final PermissionStatus? status;

  /// The tag key and value pairs attached to the resource share.
  final List<Tag>? tags;

  /// The version of the permission described in this response.
  final String? version;

  ResourceSharePermissionDetail({
    this.arn,
    this.creationTime,
    this.defaultVersion,
    this.featureSet,
    this.isResourceTypeDefault,
    this.lastUpdatedTime,
    this.name,
    this.permission,
    this.permissionType,
    this.resourceType,
    this.status,
    this.tags,
    this.version,
  });

  factory ResourceSharePermissionDetail.fromJson(Map<String, dynamic> json) {
    return ResourceSharePermissionDetail(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      defaultVersion: json['defaultVersion'] as bool?,
      featureSet: (json['featureSet'] as String?)?.toPermissionFeatureSet(),
      isResourceTypeDefault: json['isResourceTypeDefault'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      permission: json['permission'] as String?,
      permissionType: (json['permissionType'] as String?)?.toPermissionType(),
      resourceType: json['resourceType'] as String?,
      status: (json['status'] as String?)?.toPermissionStatus(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultVersion = this.defaultVersion;
    final featureSet = this.featureSet;
    final isResourceTypeDefault = this.isResourceTypeDefault;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final permission = this.permission;
    final permissionType = this.permissionType;
    final resourceType = this.resourceType;
    final status = this.status;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (featureSet != null) 'featureSet': featureSet.toValue(),
      if (isResourceTypeDefault != null)
        'isResourceTypeDefault': isResourceTypeDefault,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (permission != null) 'permission': permission,
      if (permissionType != null) 'permissionType': permissionType.toValue(),
      if (resourceType != null) 'resourceType': resourceType,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

/// Information about an RAM permission.
class ResourceSharePermissionSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the permission you want information about.
  final String? arn;

  /// The date and time when the permission was created.
  final DateTime? creationTime;

  /// Specifies whether the version of the managed permission used by this
  /// resource share is the default version for this managed permission.
  final bool? defaultVersion;

  /// Indicates what features are available for this resource share. This
  /// parameter can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <b>STANDARD</b> – A resource share that supports all functionality. These
  /// resource shares are visible to all principals you share the resource share
  /// with. You can modify these resource shares in RAM using the console or APIs.
  /// This resource share might have been created by RAM, or it might have been
  /// <b>CREATED_FROM_POLICY</b> and then promoted.
  /// </li>
  /// <li>
  /// <b>CREATED_FROM_POLICY</b> – The customer manually shared a resource by
  /// attaching a resource-based policy. That policy did not match any existing
  /// managed permissions, so RAM created this customer managed permission
  /// automatically on the customer's behalf based on the attached policy
  /// document. This type of resource share is visible only to the Amazon Web
  /// Services account that created it. You can't modify it in RAM unless you
  /// promote it. For more information, see
  /// <a>PromoteResourceShareCreatedFromPolicy</a>.
  /// </li>
  /// <li>
  /// <b>PROMOTING_TO_STANDARD</b> – This resource share was originally
  /// <code>CREATED_FROM_POLICY</code>, but the customer ran the
  /// <a>PromoteResourceShareCreatedFromPolicy</a> and that operation is still in
  /// progress. This value changes to <code>STANDARD</code> when complete.
  /// </li>
  /// </ul>
  final PermissionFeatureSet? featureSet;

  /// Specifies whether the managed permission associated with this resource share
  /// is the default managed permission for all resources of this resource type.
  final bool? isResourceTypeDefault;

  /// The date and time when the permission was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of this managed permission.
  final String? name;

  /// The type of managed permission. This can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_MANAGED</code> – Amazon Web Services created and manages this
  /// managed permission. You can associate it with your resource shares, but you
  /// can't modify it.
  /// </li>
  /// <li>
  /// <code>CUSTOMER_MANAGED</code> – You, or another principal in your account
  /// created this managed permission. You can associate it with your resource
  /// shares and create new versions that have different permissions.
  /// </li>
  /// </ul>
  final PermissionType? permissionType;

  /// The type of resource to which this permission applies. This takes the form
  /// of: <code>service-code</code>:<code>resource-code</code>, and is
  /// case-insensitive. For example, an Amazon EC2 Subnet would be represented by
  /// the string <code>ec2:subnet</code>.
  final String? resourceType;

  /// The current status of the permission.
  final String? status;

  /// A list of the tag key value pairs currently attached to the permission.
  final List<Tag>? tags;

  /// The version of the permission associated with this resource share.
  final String? version;

  ResourceSharePermissionSummary({
    this.arn,
    this.creationTime,
    this.defaultVersion,
    this.featureSet,
    this.isResourceTypeDefault,
    this.lastUpdatedTime,
    this.name,
    this.permissionType,
    this.resourceType,
    this.status,
    this.tags,
    this.version,
  });

  factory ResourceSharePermissionSummary.fromJson(Map<String, dynamic> json) {
    return ResourceSharePermissionSummary(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      defaultVersion: json['defaultVersion'] as bool?,
      featureSet: (json['featureSet'] as String?)?.toPermissionFeatureSet(),
      isResourceTypeDefault: json['isResourceTypeDefault'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      permissionType: (json['permissionType'] as String?)?.toPermissionType(),
      resourceType: json['resourceType'] as String?,
      status: json['status'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultVersion = this.defaultVersion;
    final featureSet = this.featureSet;
    final isResourceTypeDefault = this.isResourceTypeDefault;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final permissionType = this.permissionType;
    final resourceType = this.resourceType;
    final status = this.status;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (featureSet != null) 'featureSet': featureSet.toValue(),
      if (isResourceTypeDefault != null)
        'isResourceTypeDefault': isResourceTypeDefault,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (permissionType != null) 'permissionType': permissionType.toValue(),
      if (resourceType != null) 'resourceType': resourceType,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

enum ResourceShareStatus {
  pending,
  active,
  failed,
  deleting,
  deleted,
}

extension ResourceShareStatusValueExtension on ResourceShareStatus {
  String toValue() {
    switch (this) {
      case ResourceShareStatus.pending:
        return 'PENDING';
      case ResourceShareStatus.active:
        return 'ACTIVE';
      case ResourceShareStatus.failed:
        return 'FAILED';
      case ResourceShareStatus.deleting:
        return 'DELETING';
      case ResourceShareStatus.deleted:
        return 'DELETED';
    }
  }
}

extension ResourceShareStatusFromString on String {
  ResourceShareStatus toResourceShareStatus() {
    switch (this) {
      case 'PENDING':
        return ResourceShareStatus.pending;
      case 'ACTIVE':
        return ResourceShareStatus.active;
      case 'FAILED':
        return ResourceShareStatus.failed;
      case 'DELETING':
        return ResourceShareStatus.deleting;
      case 'DELETED':
        return ResourceShareStatus.deleted;
    }
    throw Exception('$this is not known in enum ResourceShareStatus');
  }
}

enum ResourceStatus {
  available,
  zonalResourceInaccessible,
  limitExceeded,
  unavailable,
  pending,
}

extension ResourceStatusValueExtension on ResourceStatus {
  String toValue() {
    switch (this) {
      case ResourceStatus.available:
        return 'AVAILABLE';
      case ResourceStatus.zonalResourceInaccessible:
        return 'ZONAL_RESOURCE_INACCESSIBLE';
      case ResourceStatus.limitExceeded:
        return 'LIMIT_EXCEEDED';
      case ResourceStatus.unavailable:
        return 'UNAVAILABLE';
      case ResourceStatus.pending:
        return 'PENDING';
    }
  }
}

extension ResourceStatusFromString on String {
  ResourceStatus toResourceStatus() {
    switch (this) {
      case 'AVAILABLE':
        return ResourceStatus.available;
      case 'ZONAL_RESOURCE_INACCESSIBLE':
        return ResourceStatus.zonalResourceInaccessible;
      case 'LIMIT_EXCEEDED':
        return ResourceStatus.limitExceeded;
      case 'UNAVAILABLE':
        return ResourceStatus.unavailable;
      case 'PENDING':
        return ResourceStatus.pending;
    }
    throw Exception('$this is not known in enum ResourceStatus');
  }
}

/// Information about a shareable resource type and the Amazon Web Services
/// service to which resources of that type belong.
class ServiceNameAndResourceType {
  /// Specifies the scope of visibility of resources of this type:
  ///
  /// <ul>
  /// <li>
  /// <b>REGIONAL</b> – The resource can be accessed only by using requests that
  /// target the Amazon Web Services Region in which the resource exists.
  /// </li>
  /// <li>
  /// <b>GLOBAL</b> – The resource can be accessed from any Amazon Web Services
  /// Region.
  /// </li>
  /// </ul>
  final ResourceRegionScope? resourceRegionScope;

  /// The type of the resource. This takes the form of:
  /// <code>service-code</code>:<code>resource-code</code>, and is
  /// case-insensitive. For example, an Amazon EC2 Subnet would be represented by
  /// the string <code>ec2:subnet</code>.
  final String? resourceType;

  /// The name of the Amazon Web Services service to which resources of this type
  /// belong.
  final String? serviceName;

  ServiceNameAndResourceType({
    this.resourceRegionScope,
    this.resourceType,
    this.serviceName,
  });

  factory ServiceNameAndResourceType.fromJson(Map<String, dynamic> json) {
    return ServiceNameAndResourceType(
      resourceRegionScope:
          (json['resourceRegionScope'] as String?)?.toResourceRegionScope(),
      resourceType: json['resourceType'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceRegionScope = this.resourceRegionScope;
    final resourceType = this.resourceType;
    final serviceName = this.serviceName;
    return {
      if (resourceRegionScope != null)
        'resourceRegionScope': resourceRegionScope.toValue(),
      if (resourceType != null) 'resourceType': resourceType,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

class SetDefaultPermissionVersionResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// A boolean value that indicates whether the operation was successful.
  final bool? returnValue;

  SetDefaultPermissionVersionResponse({
    this.clientToken,
    this.returnValue,
  });

  factory SetDefaultPermissionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return SetDefaultPermissionVersionResponse(
      clientToken: json['clientToken'] as String?,
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

/// A structure containing a tag. A tag is metadata that you can attach to your
/// resources to help organize and categorize them. You can also use them to
/// help you secure your resources. For more information, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling
/// access to Amazon Web Services resources using tags</a>.
///
/// For more information about tags, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// Amazon Web Services resources</a> in the <i>Amazon Web Services General
/// Reference Guide</i>.
class Tag {
  /// The key, or name, attached to the tag. Every tag must have a key. Key names
  /// are case sensitive.
  final String? key;

  /// The string value attached to the tag. The value can be an empty string. Key
  /// values are case sensitive.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// A tag key and optional list of possible values that you can use to filter
/// results for tagged resources.
class TagFilter {
  /// The tag key. This must have a valid string value and can't be empty.
  final String? tagKey;

  /// A list of zero or more tag values. If no values are provided, then the
  /// filter matches any tag with the specified key, regardless of its value.
  final List<String>? tagValues;

  TagFilter({
    this.tagKey,
    this.tagValues,
  });

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValues = this.tagValues;
    return {
      if (tagKey != null) 'tagKey': tagKey,
      if (tagValues != null) 'tagValues': tagValues,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResourceShareResponse {
  /// The idempotency identifier associated with this request. If you want to
  /// repeat the same operation in an idempotent manner then you must include this
  /// value in the <code>clientToken</code> request parameter of that later call.
  /// All other parameters must also have the same values that you used in the
  /// first call.
  final String? clientToken;

  /// Information about the resource share.
  final ResourceShare? resourceShare;

  UpdateResourceShareResponse({
    this.clientToken,
    this.resourceShare,
  });

  factory UpdateResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShare: json['resourceShare'] != null
          ? ResourceShare.fromJson(
              json['resourceShare'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShare = this.resourceShare;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShare != null) 'resourceShare': resourceShare,
    };
  }
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InvalidClientTokenException extends _s.GenericAwsException {
  InvalidClientTokenException({String? type, String? message})
      : super(
            type: type, code: 'InvalidClientTokenException', message: message);
}

class InvalidMaxResultsException extends _s.GenericAwsException {
  InvalidMaxResultsException({String? type, String? message})
      : super(type: type, code: 'InvalidMaxResultsException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPolicyException extends _s.GenericAwsException {
  InvalidPolicyException({String? type, String? message})
      : super(type: type, code: 'InvalidPolicyException', message: message);
}

class InvalidResourceTypeException extends _s.GenericAwsException {
  InvalidResourceTypeException({String? type, String? message})
      : super(
            type: type, code: 'InvalidResourceTypeException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class MalformedArnException extends _s.GenericAwsException {
  MalformedArnException({String? type, String? message})
      : super(type: type, code: 'MalformedArnException', message: message);
}

class MalformedPolicyTemplateException extends _s.GenericAwsException {
  MalformedPolicyTemplateException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedPolicyTemplateException',
            message: message);
}

class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class PermissionAlreadyExistsException extends _s.GenericAwsException {
  PermissionAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'PermissionAlreadyExistsException',
            message: message);
}

class PermissionLimitExceededException extends _s.GenericAwsException {
  PermissionLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PermissionLimitExceededException',
            message: message);
}

class PermissionVersionsLimitExceededException extends _s.GenericAwsException {
  PermissionVersionsLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PermissionVersionsLimitExceededException',
            message: message);
}

class ResourceArnNotFoundException extends _s.GenericAwsException {
  ResourceArnNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'ResourceArnNotFoundException', message: message);
}

class ResourceShareInvitationAlreadyAcceptedException
    extends _s.GenericAwsException {
  ResourceShareInvitationAlreadyAcceptedException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationAlreadyAcceptedException',
            message: message);
}

class ResourceShareInvitationAlreadyRejectedException
    extends _s.GenericAwsException {
  ResourceShareInvitationAlreadyRejectedException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationAlreadyRejectedException',
            message: message);
}

class ResourceShareInvitationArnNotFoundException
    extends _s.GenericAwsException {
  ResourceShareInvitationArnNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationArnNotFoundException',
            message: message);
}

class ResourceShareInvitationExpiredException extends _s.GenericAwsException {
  ResourceShareInvitationExpiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationExpiredException',
            message: message);
}

class ResourceShareLimitExceededException extends _s.GenericAwsException {
  ResourceShareLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareLimitExceededException',
            message: message);
}

class ServerInternalException extends _s.GenericAwsException {
  ServerInternalException({String? type, String? message})
      : super(type: type, code: 'ServerInternalException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class TagPolicyViolationException extends _s.GenericAwsException {
  TagPolicyViolationException({String? type, String? message})
      : super(
            type: type, code: 'TagPolicyViolationException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnknownResourceException extends _s.GenericAwsException {
  UnknownResourceException({String? type, String? message})
      : super(type: type, code: 'UnknownResourceException', message: message);
}

class UnmatchedPolicyPermissionException extends _s.GenericAwsException {
  UnmatchedPolicyPermissionException({String? type, String? message})
      : super(
            type: type,
            code: 'UnmatchedPolicyPermissionException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InvalidClientTokenException': (type, message) =>
      InvalidClientTokenException(type: type, message: message),
  'InvalidMaxResultsException': (type, message) =>
      InvalidMaxResultsException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPolicyException': (type, message) =>
      InvalidPolicyException(type: type, message: message),
  'InvalidResourceTypeException': (type, message) =>
      InvalidResourceTypeException(type: type, message: message),
  'InvalidStateTransitionException': (type, message) =>
      InvalidStateTransitionException(type: type, message: message),
  'MalformedArnException': (type, message) =>
      MalformedArnException(type: type, message: message),
  'MalformedPolicyTemplateException': (type, message) =>
      MalformedPolicyTemplateException(type: type, message: message),
  'MissingRequiredParameterException': (type, message) =>
      MissingRequiredParameterException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'PermissionAlreadyExistsException': (type, message) =>
      PermissionAlreadyExistsException(type: type, message: message),
  'PermissionLimitExceededException': (type, message) =>
      PermissionLimitExceededException(type: type, message: message),
  'PermissionVersionsLimitExceededException': (type, message) =>
      PermissionVersionsLimitExceededException(type: type, message: message),
  'ResourceArnNotFoundException': (type, message) =>
      ResourceArnNotFoundException(type: type, message: message),
  'ResourceShareInvitationAlreadyAcceptedException': (type, message) =>
      ResourceShareInvitationAlreadyAcceptedException(
          type: type, message: message),
  'ResourceShareInvitationAlreadyRejectedException': (type, message) =>
      ResourceShareInvitationAlreadyRejectedException(
          type: type, message: message),
  'ResourceShareInvitationArnNotFoundException': (type, message) =>
      ResourceShareInvitationArnNotFoundException(type: type, message: message),
  'ResourceShareInvitationExpiredException': (type, message) =>
      ResourceShareInvitationExpiredException(type: type, message: message),
  'ResourceShareLimitExceededException': (type, message) =>
      ResourceShareLimitExceededException(type: type, message: message),
  'ServerInternalException': (type, message) =>
      ServerInternalException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TagLimitExceededException': (type, message) =>
      TagLimitExceededException(type: type, message: message),
  'TagPolicyViolationException': (type, message) =>
      TagPolicyViolationException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnknownResourceException': (type, message) =>
      UnknownResourceException(type: type, message: message),
  'UnmatchedPolicyPermissionException': (type, message) =>
      UnmatchedPolicyPermissionException(type: type, message: message),
};
