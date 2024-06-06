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

/// IAM Identity Center (successor to Single Sign-On) helps you securely create,
/// or connect, your workforce identities and manage their access centrally
/// across Amazon Web Services accounts and applications. IAM Identity Center is
/// the recommended approach for workforce authentication and authorization in
/// Amazon Web Services, for organizations of any size and type.
/// <note>
/// IAM Identity Center uses the <code>sso</code> and <code>identitystore</code>
/// API namespaces.
/// </note>
/// This reference guide provides information on single sign-on operations which
/// could be used for access management of Amazon Web Services accounts. For
/// information about IAM Identity Center features, see the <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">IAM
/// Identity Center User Guide</a>.
///
/// Many operations in the IAM Identity Center APIs rely on identifiers for
/// users and groups, known as principals. For more information about how to
/// work with principals and principal IDs in IAM Identity Center, see the <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/welcome.html">Identity
/// Store API Reference</a>.
/// <note>
/// Amazon Web Services provides SDKs that consist of libraries and sample code
/// for various programming languages and platforms (Java, Ruby, .Net, iOS,
/// Android, and more). The SDKs provide a convenient way to create programmatic
/// access to IAM Identity Center and other Amazon Web Services services. For
/// more information about the Amazon Web Services SDKs, including how to
/// download and install them, see <a href="http://aws.amazon.com/tools/">Tools
/// for Amazon Web Services</a>.
/// </note>
class SsoAdmin {
  final _s.JsonProtocol _protocol;
  SsoAdmin({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sso',
            signingName: 'sso',
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

  /// Attaches the specified customer managed policy to the specified
  /// <a>PermissionSet</a>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [customerManagedPolicyReference] :
  /// Specifies the name and path of a customer managed policy. You must have an
  /// IAM policy that matches the name and path in each Amazon Web Services
  /// account where you want to deploy your permission set.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <code>PermissionSet</code>.
  Future<void> attachCustomerManagedPolicyReferenceToPermissionSet({
    required CustomerManagedPolicyReference customerManagedPolicyReference,
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.AttachCustomerManagedPolicyReferenceToPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomerManagedPolicyReference': customerManagedPolicyReference,
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Attaches an Amazon Web Services managed policy ARN to a permission set.
  /// <note>
  /// If the permission set is already referenced by one or more account
  /// assignments, you will need to call <code> <a>ProvisionPermissionSet</a>
  /// </code> after this operation. Calling <code>ProvisionPermissionSet</code>
  /// applies the corresponding IAM policy updates to all assigned accounts.
  /// </note>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [managedPolicyArn] :
  /// The Amazon Web Services managed policy ARN to be attached to a permission
  /// set.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <a>PermissionSet</a> that the managed policy should be
  /// attached to.
  Future<void> attachManagedPolicyToPermissionSet({
    required String instanceArn,
    required String managedPolicyArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.AttachManagedPolicyToPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'ManagedPolicyArn': managedPolicyArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Assigns access to a principal for a specified Amazon Web Services account
  /// using a specified permission set.
  /// <note>
  /// The term <i>principal</i> here refers to a user or group that is defined
  /// in IAM Identity Center.
  /// </note> <note>
  /// As part of a successful <code>CreateAccountAssignment</code> call, the
  /// specified permission set will automatically be provisioned to the account
  /// in the form of an IAM policy. That policy is attached to the IAM role
  /// created in IAM Identity Center. If the permission set is subsequently
  /// updated, the corresponding IAM policies attached to roles in your accounts
  /// will not be updated automatically. In this case, you must call <code>
  /// <a>ProvisionPermissionSet</a> </code> to make these updates.
  /// </note> <note>
  /// After a successful response, call
  /// <code>DescribeAccountAssignmentCreationStatus</code> to describe the
  /// status of an assignment creation request.
  /// </note>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that the admin wants to grant the principal
  /// access to.
  ///
  /// Parameter [principalId] :
  /// An identifier for an object in IAM Identity Center, such as a user or
  /// group. PrincipalIds are GUIDs (For example,
  /// f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about
  /// PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  ///
  /// Parameter [principalType] :
  /// The entity type for which the assignment will be created.
  ///
  /// Parameter [targetId] :
  /// TargetID is an Amazon Web Services account identifier, (For example,
  /// 123456789012).
  ///
  /// Parameter [targetType] :
  /// The entity type for which the assignment will be created.
  Future<CreateAccountAssignmentResponse> createAccountAssignment({
    required String instanceArn,
    required String permissionSetArn,
    required String principalId,
    required PrincipalType principalType,
    required String targetId,
    required TargetType targetType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.CreateAccountAssignment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        'PrincipalId': principalId,
        'PrincipalType': principalType.toValue(),
        'TargetId': targetId,
        'TargetType': targetType.toValue(),
      },
    );

    return CreateAccountAssignmentResponse.fromJson(jsonResponse.body);
  }

  /// Creates an application in IAM Identity Center for the given application
  /// provider.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationProviderArn] :
  /// The ARN of the application provider under which the operation will run.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the instance of IAM Identity Center under which the operation
  /// will run. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [name] :
  /// The name of the .
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive ID that you provide to ensure the
  /// idempotency of the request. This lets you safely retry the request without
  /// accidentally performing the same operation a second time. Passing the same
  /// value to a later call to an operation requires that you also pass the same
  /// value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [description] :
  /// The description of the .
  ///
  /// Parameter [portalOptions] :
  /// A structure that describes the options for the portal associated with an
  /// application.
  ///
  /// Parameter [status] :
  /// Specifies whether the application is enabled or disabled.
  ///
  /// Parameter [tags] :
  /// Specifies tags to be attached to the application.
  Future<CreateApplicationResponse> createApplication({
    required String applicationProviderArn,
    required String instanceArn,
    required String name,
    String? clientToken,
    String? description,
    PortalOptions? portalOptions,
    ApplicationStatus? status,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.CreateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationProviderArn': applicationProviderArn,
        'InstanceArn': instanceArn,
        'Name': name,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (portalOptions != null) 'PortalOptions': portalOptions,
        if (status != null) 'Status': status.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Grant application access to a user or group.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// The ARN of the application provider under which the operation will run.
  ///
  /// Parameter [principalId] :
  /// An identifier for an object in IAM Identity Center, such as a user or
  /// group. PrincipalIds are GUIDs (For example,
  /// f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about
  /// PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  ///
  /// Parameter [principalType] :
  /// The entity type for which the assignment will be created.
  Future<void> createApplicationAssignment({
    required String applicationArn,
    required String principalId,
    required PrincipalType principalType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.CreateApplicationAssignment'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'PrincipalId': principalId,
        'PrincipalType': principalType.toValue(),
      },
    );
  }

  /// Creates an instance of IAM Identity Center for a standalone Amazon Web
  /// Services account that is not managed by Organizations or a member Amazon
  /// Web Services account in an organization. You can create only one instance
  /// per account and across all Amazon Web Services Regions.
  ///
  /// The CreateInstance request is rejected if the following apply:
  ///
  /// <ul>
  /// <li>
  /// The instance is created within the organization management account.
  /// </li>
  /// <li>
  /// An instance already exists in the same account.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive ID that you provide to ensure the
  /// idempotency of the request. This lets you safely retry the request without
  /// accidentally performing the same operation a second time. Passing the same
  /// value to a later call to an operation requires that you also pass the same
  /// value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [name] :
  /// The name of the instance of IAM Identity Center.
  ///
  /// Parameter [tags] :
  /// Specifies tags to be attached to the instance of IAM Identity Center.
  Future<CreateInstanceResponse> createInstance({
    String? clientToken,
    String? name,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.CreateInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (name != null) 'Name': name,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Enables the attributes-based access control (ABAC) feature for the
  /// specified IAM Identity Center instance. You can also specify new
  /// attributes to add to your ABAC configuration during the enabling process.
  /// For more information about ABAC, see <a
  /// href="/singlesignon/latest/userguide/abac.html">Attribute-Based Access
  /// Control</a> in the <i>IAM Identity Center User Guide</i>.
  /// <note>
  /// After a successful response, call
  /// <code>DescribeInstanceAccessControlAttributeConfiguration</code> to
  /// validate that <code>InstanceAccessControlAttributeConfiguration</code> was
  /// created.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceAccessControlAttributeConfiguration] :
  /// Specifies the IAM Identity Center identity store attributes to add to your
  /// ABAC configuration. When using an external identity provider as an
  /// identity source, you can pass attributes through the SAML assertion. Doing
  /// so provides an alternative to configuring attributes from the IAM Identity
  /// Center identity store. If a SAML assertion passes any of these attributes,
  /// IAM Identity Center will replace the attribute value with the value from
  /// the IAM Identity Center identity store.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  Future<void> createInstanceAccessControlAttributeConfiguration({
    required InstanceAccessControlAttributeConfiguration
        instanceAccessControlAttributeConfiguration,
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.CreateInstanceAccessControlAttributeConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceAccessControlAttributeConfiguration':
            instanceAccessControlAttributeConfiguration,
        'InstanceArn': instanceArn,
      },
    );
  }

  /// Creates a permission set within a specified IAM Identity Center instance.
  /// <note>
  /// To grant users and groups access to Amazon Web Services account resources,
  /// use <code> <a>CreateAccountAssignment</a> </code>.
  /// </note>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [name] :
  /// The name of the <a>PermissionSet</a>.
  ///
  /// Parameter [description] :
  /// The description of the <a>PermissionSet</a>.
  ///
  /// Parameter [relayState] :
  /// Used to redirect users within the application during the federation
  /// authentication process.
  ///
  /// Parameter [sessionDuration] :
  /// The length of time that the application user sessions are valid in the
  /// ISO-8601 standard.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the new <a>PermissionSet</a>.
  Future<CreatePermissionSetResponse> createPermissionSet({
    required String instanceArn,
    required String name,
    String? description,
    String? relayState,
    String? sessionDuration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.CreatePermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'Name': name,
        if (description != null) 'Description': description,
        if (relayState != null) 'RelayState': relayState,
        if (sessionDuration != null) 'SessionDuration': sessionDuration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePermissionSetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a connection to a trusted token issuer in an instance of IAM
  /// Identity Center. A trusted token issuer enables trusted identity
  /// propagation to be used with applications that authenticate outside of
  /// Amazon Web Services.
  ///
  /// This trusted token issuer describes an external identity provider (IdP)
  /// that can generate claims or assertions in the form of access tokens for a
  /// user. Applications enabled for IAM Identity Center can use these tokens
  /// for authentication.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// Specifies the ARN of the instance of IAM Identity Center to contain the
  /// new trusted token issuer configuration.
  ///
  /// Parameter [name] :
  /// Specifies the name of the new trusted token issuer configuration.
  ///
  /// Parameter [trustedTokenIssuerConfiguration] :
  /// Specifies settings that apply to the new trusted token issuer
  /// configuration. The settings that are available depend on what
  /// <code>TrustedTokenIssuerType</code> you specify.
  ///
  /// Parameter [trustedTokenIssuerType] :
  /// Specifies the type of the new trusted token issuer.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive ID that you provide to ensure the
  /// idempotency of the request. This lets you safely retry the request without
  /// accidentally performing the same operation a second time. Passing the same
  /// value to a later call to an operation requires that you also pass the same
  /// value for all other parameters. We recommend that you use a <a
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
  /// Specifies tags to be attached to the new trusted token issuer
  /// configuration.
  Future<CreateTrustedTokenIssuerResponse> createTrustedTokenIssuer({
    required String instanceArn,
    required String name,
    required TrustedTokenIssuerConfiguration trustedTokenIssuerConfiguration,
    required TrustedTokenIssuerType trustedTokenIssuerType,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.CreateTrustedTokenIssuer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'Name': name,
        'TrustedTokenIssuerConfiguration': trustedTokenIssuerConfiguration,
        'TrustedTokenIssuerType': trustedTokenIssuerType.toValue(),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTrustedTokenIssuerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a principal's access from a specified Amazon Web Services account
  /// using a specified permission set.
  /// <note>
  /// After a successful response, call
  /// <code>DescribeAccountAssignmentDeletionStatus</code> to describe the
  /// status of an assignment deletion request.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that will be used to remove access.
  ///
  /// Parameter [principalId] :
  /// An identifier for an object in IAM Identity Center, such as a user or
  /// group. PrincipalIds are GUIDs (For example,
  /// f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about
  /// PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  ///
  /// Parameter [principalType] :
  /// The entity type for which the assignment will be deleted.
  ///
  /// Parameter [targetId] :
  /// TargetID is an Amazon Web Services account identifier, (For example,
  /// 123456789012).
  ///
  /// Parameter [targetType] :
  /// The entity type for which the assignment will be deleted.
  Future<DeleteAccountAssignmentResponse> deleteAccountAssignment({
    required String instanceArn,
    required String permissionSetArn,
    required String principalId,
    required PrincipalType principalType,
    required String targetId,
    required TargetType targetType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteAccountAssignment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        'PrincipalId': principalId,
        'PrincipalType': principalType.toValue(),
        'TargetId': targetId,
        'TargetType': targetType.toValue(),
      },
    );

    return DeleteAccountAssignmentResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the association with the application. The connected service
  /// resource still exists.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application. For more information about ARNs, see
  /// <a href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  Future<void> deleteApplication({
    required String applicationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
      },
    );
  }

  /// Deletes an IAM Identity Center access scope from an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application with the access scope to delete.
  ///
  /// Parameter [scope] :
  /// Specifies the name of the access scope to remove from the application.
  Future<void> deleteApplicationAccessScope({
    required String applicationArn,
    required String scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteApplicationAccessScope'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'Scope': scope,
      },
    );
  }

  /// Revoke application access to an application by deleting application
  /// assignments for a user or group.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application.
  ///
  /// Parameter [principalId] :
  /// An identifier for an object in IAM Identity Center, such as a user or
  /// group. PrincipalIds are GUIDs (For example,
  /// f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about
  /// PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  ///
  /// Parameter [principalType] :
  /// The entity type for which the assignment will be deleted.
  Future<void> deleteApplicationAssignment({
    required String applicationArn,
    required String principalId,
    required PrincipalType principalType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteApplicationAssignment'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'PrincipalId': principalId,
        'PrincipalType': principalType.toValue(),
      },
    );
  }

  /// Deletes an authentication method from an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application with the authentication method to
  /// delete.
  ///
  /// Parameter [authenticationMethodType] :
  /// Specifies the authentication method type to delete from the application.
  Future<void> deleteApplicationAuthenticationMethod({
    required String applicationArn,
    required AuthenticationMethodType authenticationMethodType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteApplicationAuthenticationMethod'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'AuthenticationMethodType': authenticationMethodType.toValue(),
      },
    );
  }

  /// Deletes a grant from an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application with the grant to delete.
  ///
  /// Parameter [grantType] :
  /// Specifies the type of grant to delete from the application.
  Future<void> deleteApplicationGrant({
    required String applicationArn,
    required GrantType grantType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteApplicationGrant'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'GrantType': grantType.toValue(),
      },
    );
  }

  /// Deletes the inline policy from a specified permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that will be used to remove access.
  Future<void> deleteInlinePolicyFromPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteInlinePolicyFromPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Deletes the instance of IAM Identity Center. Only the account that owns
  /// the instance can call this API. Neither the delegated administrator nor
  /// member account can delete the organization instance, but those roles can
  /// delete their own instance.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the instance of IAM Identity Center under which the operation
  /// will run.
  Future<void> deleteInstance({
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteInstance'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
      },
    );
  }

  /// Disables the attributes-based access control (ABAC) feature for the
  /// specified IAM Identity Center instance and deletes all of the attribute
  /// mappings that have been configured. Once deleted, any attributes that are
  /// received from an identity source and any custom attributes you have
  /// previously configured will not be passed. For more information about ABAC,
  /// see <a href="/singlesignon/latest/userguide/abac.html">Attribute-Based
  /// Access Control</a> in the <i>IAM Identity Center User Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  Future<void> deleteInstanceAccessControlAttributeConfiguration({
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DeleteInstanceAccessControlAttributeConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
      },
    );
  }

  /// Deletes the specified permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that should be deleted.
  Future<void> deletePermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeletePermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Deletes the permissions boundary from a specified <a>PermissionSet</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <code>PermissionSet</code>.
  Future<void> deletePermissionsBoundaryFromPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DeletePermissionsBoundaryFromPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Deletes a trusted token issuer configuration from an instance of IAM
  /// Identity Center.
  /// <note>
  /// Deleting this trusted token issuer configuration will cause users to lose
  /// access to any applications that are configured to use the trusted token
  /// issuer.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [trustedTokenIssuerArn] :
  /// Specifies the ARN of the trusted token issuer configuration to delete.
  Future<void> deleteTrustedTokenIssuer({
    required String trustedTokenIssuerArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteTrustedTokenIssuer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
      },
    );
  }

  /// Describes the status of the assignment creation request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssignmentCreationRequestId] :
  /// The identifier that is used to track the request operation progress.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  Future<DescribeAccountAssignmentCreationStatusResponse>
      describeAccountAssignmentCreationStatus({
    required String accountAssignmentCreationRequestId,
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DescribeAccountAssignmentCreationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountAssignmentCreationRequestId':
            accountAssignmentCreationRequestId,
        'InstanceArn': instanceArn,
      },
    );

    return DescribeAccountAssignmentCreationStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Describes the status of the assignment deletion request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssignmentDeletionRequestId] :
  /// The identifier that is used to track the request operation progress.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  Future<DescribeAccountAssignmentDeletionStatusResponse>
      describeAccountAssignmentDeletionStatus({
    required String accountAssignmentDeletionRequestId,
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DescribeAccountAssignmentDeletionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountAssignmentDeletionRequestId':
            accountAssignmentDeletionRequestId,
        'InstanceArn': instanceArn,
      },
    );

    return DescribeAccountAssignmentDeletionStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the details of an application associated with an instance of IAM
  /// Identity Center.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application. For more information about ARNs, see
  /// <a href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  Future<DescribeApplicationResponse> describeApplication({
    required String applicationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DescribeApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
      },
    );

    return DescribeApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a direct assignment of a user or group to an application. If the
  /// user doesn’t have a direct assignment to the application, the user may
  /// still have access to the application through a group. Therefore, don’t use
  /// this API to test access to an application for a user. Instead use
  /// <a>ListApplicationAssignmentsForPrincipal</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application. For more information about ARNs, see
  /// <a href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [principalId] :
  /// An identifier for an object in IAM Identity Center, such as a user or
  /// group. PrincipalIds are GUIDs (For example,
  /// f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about
  /// PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  ///
  /// Parameter [principalType] :
  /// The entity type for which the assignment will be created.
  Future<DescribeApplicationAssignmentResponse> describeApplicationAssignment({
    required String applicationArn,
    required String principalId,
    required PrincipalType principalType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DescribeApplicationAssignment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'PrincipalId': principalId,
        'PrincipalType': principalType.toValue(),
      },
    );

    return DescribeApplicationAssignmentResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a provider that can be used to connect an Amazon
  /// Web Services managed application or customer managed application to IAM
  /// Identity Center.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationProviderArn] :
  /// Specifies the ARN of the application provider for which you want details.
  Future<DescribeApplicationProviderResponse> describeApplicationProvider({
    required String applicationProviderArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DescribeApplicationProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationProviderArn': applicationProviderArn,
      },
    );

    return DescribeApplicationProviderResponse.fromJson(jsonResponse.body);
  }

  /// Returns the details of an instance of IAM Identity Center. The status can
  /// be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The instance is in the process of being
  /// created. When the instance is ready for use, DescribeInstance returns the
  /// status of <code>ACTIVE</code>. While the instance is in the
  /// <code>CREATE_IN_PROGRESS</code> state, you can call only DescribeInstance
  /// and DeleteInstance operations.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> - The instance is being deleted. Returns
  /// <code>AccessDeniedException</code> after the delete operation completes.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The instance is active.
  /// </li>
  /// </ul>
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the instance of IAM Identity Center under which the operation
  /// will run.
  Future<DescribeInstanceResponse> describeInstance({
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DescribeInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
      },
    );

    return DescribeInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Returns the list of IAM Identity Center identity store attributes that
  /// have been configured to work with attributes-based access control (ABAC)
  /// for the specified IAM Identity Center instance. This will not return
  /// attributes configured and sent by an external identity provider. For more
  /// information about ABAC, see <a
  /// href="/singlesignon/latest/userguide/abac.html">Attribute-Based Access
  /// Control</a> in the <i>IAM Identity Center User Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  Future<DescribeInstanceAccessControlAttributeConfigurationResponse>
      describeInstanceAccessControlAttributeConfiguration({
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DescribeInstanceAccessControlAttributeConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
      },
    );

    return DescribeInstanceAccessControlAttributeConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets the details of the permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  Future<DescribePermissionSetResponse> describePermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DescribePermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );

    return DescribePermissionSetResponse.fromJson(jsonResponse.body);
  }

  /// Describes the status for the given permission set provisioning request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [provisionPermissionSetRequestId] :
  /// The identifier that is provided by the <a>ProvisionPermissionSet</a> call
  /// to retrieve the current status of the provisioning workflow.
  Future<DescribePermissionSetProvisioningStatusResponse>
      describePermissionSetProvisioningStatus({
    required String instanceArn,
    required String provisionPermissionSetRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DescribePermissionSetProvisioningStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'ProvisionPermissionSetRequestId': provisionPermissionSetRequestId,
      },
    );

    return DescribePermissionSetProvisioningStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves details about a trusted token issuer configuration stored in an
  /// instance of IAM Identity Center. Details include the name of the trusted
  /// token issuer, the issuer URL, and the path of the source attribute and the
  /// destination attribute for a trusted token issuer configuration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trustedTokenIssuerArn] :
  /// Specifies the ARN of the trusted token issuer configuration that you want
  /// details about.
  Future<DescribeTrustedTokenIssuerResponse> describeTrustedTokenIssuer({
    required String trustedTokenIssuerArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DescribeTrustedTokenIssuer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
      },
    );

    return DescribeTrustedTokenIssuerResponse.fromJson(jsonResponse.body);
  }

  /// Detaches the specified customer managed policy from the specified
  /// <a>PermissionSet</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [customerManagedPolicyReference] :
  /// Specifies the name and path of a customer managed policy. You must have an
  /// IAM policy that matches the name and path in each Amazon Web Services
  /// account where you want to deploy your permission set.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <code>PermissionSet</code>.
  Future<void> detachCustomerManagedPolicyReferenceFromPermissionSet({
    required CustomerManagedPolicyReference customerManagedPolicyReference,
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DetachCustomerManagedPolicyReferenceFromPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomerManagedPolicyReference': customerManagedPolicyReference,
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Detaches the attached Amazon Web Services managed policy ARN from the
  /// specified permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [managedPolicyArn] :
  /// The Amazon Web Services managed policy ARN to be detached from a
  /// permission set.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <a>PermissionSet</a> from which the policy should be
  /// detached.
  Future<void> detachManagedPolicyFromPermissionSet({
    required String instanceArn,
    required String managedPolicyArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DetachManagedPolicyFromPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'ManagedPolicyArn': managedPolicyArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Retrieves the authorized targets for an IAM Identity Center access scope
  /// for an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application with the access scope that you want
  /// to retrieve.
  ///
  /// Parameter [scope] :
  /// Specifies the name of the access scope for which you want the authorized
  /// targets.
  Future<GetApplicationAccessScopeResponse> getApplicationAccessScope({
    required String applicationArn,
    required String scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.GetApplicationAccessScope'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'Scope': scope,
      },
    );

    return GetApplicationAccessScopeResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the configuration of
  /// <a>PutApplicationAssignmentConfiguration</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application. For more information about ARNs, see
  /// <a href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  Future<GetApplicationAssignmentConfigurationResponse>
      getApplicationAssignmentConfiguration({
    required String applicationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.GetApplicationAssignmentConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
      },
    );

    return GetApplicationAssignmentConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves details about an authentication method used by an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application.
  ///
  /// Parameter [authenticationMethodType] :
  /// Specifies the type of authentication method for which you want details.
  Future<GetApplicationAuthenticationMethodResponse>
      getApplicationAuthenticationMethod({
    required String applicationArn,
    required AuthenticationMethodType authenticationMethodType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.GetApplicationAuthenticationMethod'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'AuthenticationMethodType': authenticationMethodType.toValue(),
      },
    );

    return GetApplicationAuthenticationMethodResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves details about an application grant.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application that contains the grant.
  ///
  /// Parameter [grantType] :
  /// Specifies the type of grant.
  Future<GetApplicationGrantResponse> getApplicationGrant({
    required String applicationArn,
    required GrantType grantType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.GetApplicationGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'GrantType': grantType.toValue(),
      },
    );

    return GetApplicationGrantResponse.fromJson(jsonResponse.body);
  }

  /// Obtains the inline policy assigned to the permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  Future<GetInlinePolicyForPermissionSetResponse>
      getInlinePolicyForPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.GetInlinePolicyForPermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );

    return GetInlinePolicyForPermissionSetResponse.fromJson(jsonResponse.body);
  }

  /// Obtains the permissions boundary for a specified <a>PermissionSet</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <code>PermissionSet</code>.
  Future<GetPermissionsBoundaryForPermissionSetResponse>
      getPermissionsBoundaryForPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.GetPermissionsBoundaryForPermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );

    return GetPermissionsBoundaryForPermissionSetResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the status of the Amazon Web Services account assignment creation
  /// requests for a specified IAM Identity Center instance.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [filter] :
  /// Filters results based on the passed attribute value.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the assignment.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListAccountAssignmentCreationStatusResponse>
      listAccountAssignmentCreationStatus({
    required String instanceArn,
    OperationStatusFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListAccountAssignmentCreationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAccountAssignmentCreationStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the status of the Amazon Web Services account assignment deletion
  /// requests for a specified IAM Identity Center instance.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [filter] :
  /// Filters results based on the passed attribute value.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the assignment.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListAccountAssignmentDeletionStatusResponse>
      listAccountAssignmentDeletionStatus({
    required String instanceArn,
    OperationStatusFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListAccountAssignmentDeletionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAccountAssignmentDeletionStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the assignee of the specified Amazon Web Services account with the
  /// specified permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The identifier of the Amazon Web Services account from which to list the
  /// assignments.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set from which to list assignments.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the assignment.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListAccountAssignmentsResponse> listAccountAssignments({
    required String accountId,
    required String instanceArn,
    required String permissionSetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListAccountAssignments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAccountAssignmentsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the IAM Identity Center associated Amazon Web Services
  /// accounts that the principal has access to.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// Specifies the ARN of the instance of IAM Identity Center that contains the
  /// principal.
  ///
  /// Parameter [principalId] :
  /// Specifies the principal for which you want to retrieve the list of account
  /// assignments.
  ///
  /// Parameter [principalType] :
  /// Specifies the type of the principal.
  ///
  /// Parameter [filter] :
  /// Specifies an Amazon Web Services account ID number. Results are filtered
  /// to only those that match this ID number.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included in each
  /// response. If additional items exist beyond the number you specify, the
  /// <code>NextToken</code> response element is returned with a value (not
  /// null). Include the specified value as the <code>NextToken</code> request
  /// parameter in the next call to the operation to get the next set of
  /// results. Note that the service might return fewer results than the maximum
  /// even when there are more results available. You should check
  /// <code>NextToken</code> after every operation to ensure that you receive
  /// all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListAccountAssignmentsForPrincipalResponse>
      listAccountAssignmentsForPrincipal({
    required String instanceArn,
    required String principalId,
    required PrincipalType principalType,
    ListAccountAssignmentsFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListAccountAssignmentsForPrincipal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PrincipalId': principalId,
        'PrincipalType': principalType.toValue(),
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAccountAssignmentsForPrincipalResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all the Amazon Web Services accounts where the specified permission
  /// set is provisioned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <a>PermissionSet</a> from which the associated Amazon Web
  /// Services accounts will be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the <a>PermissionSet</a>.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  ///
  /// Parameter [provisioningStatus] :
  /// The permission set provisioning status for an Amazon Web Services account.
  Future<ListAccountsForProvisionedPermissionSetResponse>
      listAccountsForProvisionedPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    int? maxResults,
    String? nextToken,
    ProvisioningStatus? provisioningStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.ListAccountsForProvisionedPermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (provisioningStatus != null)
          'ProvisioningStatus': provisioningStatus.toValue(),
      },
    );

    return ListAccountsForProvisionedPermissionSetResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the access scopes and authorized targets associated with an
  /// application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included in each
  /// response. If additional items exist beyond the number you specify, the
  /// <code>NextToken</code> response element is returned with a value (not
  /// null). Include the specified value as the <code>NextToken</code> request
  /// parameter in the next call to the operation to get the next set of
  /// results. Note that the service might return fewer results than the maximum
  /// even when there are more results available. You should check
  /// <code>NextToken</code> after every operation to ensure that you receive
  /// all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListApplicationAccessScopesResponse> listApplicationAccessScopes({
    required String applicationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListApplicationAccessScopes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationAccessScopesResponse.fromJson(jsonResponse.body);
  }

  /// Lists Amazon Web Services account users that are assigned to an
  /// application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included in each
  /// response. If additional items exist beyond the number you specify, the
  /// <code>NextToken</code> response element is returned with a value (not
  /// null). Include the specified value as the <code>NextToken</code> request
  /// parameter in the next call to the operation to get the next set of
  /// results. Note that the service might return fewer results than the maximum
  /// even when there are more results available. You should check
  /// <code>NextToken</code> after every operation to ensure that you receive
  /// all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListApplicationAssignmentsResponse> listApplicationAssignments({
    required String applicationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListApplicationAssignments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationAssignmentsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the applications to which a specified principal is assigned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// Specifies the instance of IAM Identity Center that contains principal and
  /// applications.
  ///
  /// Parameter [principalId] :
  /// Specifies the unique identifier of the principal for which you want to
  /// retrieve its assignments.
  ///
  /// Parameter [principalType] :
  /// Specifies the type of the principal for which you want to retrieve its
  /// assignments.
  ///
  /// Parameter [filter] :
  /// Filters the output to include only assignments associated with the
  /// application that has the specified ARN.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included in each
  /// response. If additional items exist beyond the number you specify, the
  /// <code>NextToken</code> response element is returned with a value (not
  /// null). Include the specified value as the <code>NextToken</code> request
  /// parameter in the next call to the operation to get the next set of
  /// results. Note that the service might return fewer results than the maximum
  /// even when there are more results available. You should check
  /// <code>NextToken</code> after every operation to ensure that you receive
  /// all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListApplicationAssignmentsForPrincipalResponse>
      listApplicationAssignmentsForPrincipal({
    required String instanceArn,
    required String principalId,
    required PrincipalType principalType,
    ListApplicationAssignmentsFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.ListApplicationAssignmentsForPrincipal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PrincipalId': principalId,
        'PrincipalType': principalType.toValue(),
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationAssignmentsForPrincipalResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all of the authentication methods supported by the specified
  /// application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application with the authentication methods you
  /// want to list.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListApplicationAuthenticationMethodsResponse>
      listApplicationAuthenticationMethods({
    required String applicationArn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListApplicationAuthenticationMethods'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationAuthenticationMethodsResponse.fromJson(
        jsonResponse.body);
  }

  /// List the grants associated with an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application whose grants you want to list.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListApplicationGrantsResponse> listApplicationGrants({
    required String applicationArn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListApplicationGrants'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationGrantsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the application providers configured in the IAM Identity Center
  /// identity store.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included in each
  /// response. If additional items exist beyond the number you specify, the
  /// <code>NextToken</code> response element is returned with a value (not
  /// null). Include the specified value as the <code>NextToken</code> request
  /// parameter in the next call to the operation to get the next set of
  /// results. Note that the service might return fewer results than the maximum
  /// even when there are more results available. You should check
  /// <code>NextToken</code> after every operation to ensure that you receive
  /// all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListApplicationProvidersResponse> listApplicationProviders({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListApplicationProviders'
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
      },
    );

    return ListApplicationProvidersResponse.fromJson(jsonResponse.body);
  }

  /// Lists all applications associated with the instance of IAM Identity
  /// Center. When listing applications for an instance in the management
  /// account, member accounts must use the <code>applicationAccount</code>
  /// parameter to filter the list to only applications created from that
  /// account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center application under which the operation
  /// will run. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [filter] :
  /// Filters response results.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included in each
  /// response. If additional items exist beyond the number you specify, the
  /// <code>NextToken</code> response element is returned with a value (not
  /// null). Include the specified value as the <code>NextToken</code> request
  /// parameter in the next call to the operation to get the next set of
  /// results. Note that the service might return fewer results than the maximum
  /// even when there are more results available. You should check
  /// <code>NextToken</code> after every operation to ensure that you receive
  /// all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListApplicationsResponse> listApplications({
    required String instanceArn,
    ListApplicationsFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all customer managed policies attached to a specified
  /// <a>PermissionSet</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <code>PermissionSet</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the list call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListCustomerManagedPolicyReferencesInPermissionSetResponse>
      listCustomerManagedPolicyReferencesInPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.ListCustomerManagedPolicyReferencesInPermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCustomerManagedPolicyReferencesInPermissionSetResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the details of the organization and account instances of IAM
  /// Identity Center that were created in or visible to the account calling
  /// this API.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the instance.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListInstancesResponse> listInstances({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListInstances'
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
      },
    );

    return ListInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Amazon Web Services managed policy that is attached to a
  /// specified permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <a>PermissionSet</a> whose managed policies will be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the <a>PermissionSet</a>.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListManagedPoliciesInPermissionSetResponse>
      listManagedPoliciesInPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListManagedPoliciesInPermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListManagedPoliciesInPermissionSetResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the status of the permission set provisioning requests for a
  /// specified IAM Identity Center instance.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [filter] :
  /// Filters results based on the passed attribute value.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the assignment.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListPermissionSetProvisioningStatusResponse>
      listPermissionSetProvisioningStatus({
    required String instanceArn,
    OperationStatusFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListPermissionSetProvisioningStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPermissionSetProvisioningStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the <a>PermissionSet</a>s in an IAM Identity Center instance.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the assignment.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListPermissionSetsResponse> listPermissionSets({
    required String instanceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListPermissionSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPermissionSetsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the permission sets that are provisioned to a specified Amazon
  /// Web Services account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The identifier of the Amazon Web Services account from which to list the
  /// assignments.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the assignment.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  ///
  /// Parameter [provisioningStatus] :
  /// The status object for the permission set provisioning operation.
  Future<ListPermissionSetsProvisionedToAccountResponse>
      listPermissionSetsProvisionedToAccount({
    required String accountId,
    required String instanceArn,
    int? maxResults,
    String? nextToken,
    ProvisioningStatus? provisioningStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.ListPermissionSetsProvisionedToAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'InstanceArn': instanceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (provisioningStatus != null)
          'ProvisioningStatus': provisioningStatus.toValue(),
      },
    );

    return ListPermissionSetsProvisionedToAccountResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the tags that are attached to a specified resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource with the tags to be listed.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    String? instanceArn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (instanceArn != null) 'InstanceArn': instanceArn,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the trusted token issuers configured in an instance of IAM
  /// Identity Center.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// Specifies the ARN of the instance of IAM Identity Center with the trusted
  /// token issuer configurations that you want to list.
  ///
  /// Parameter [maxResults] :
  /// Specifies the total number of results that you want included in each
  /// response. If additional items exist beyond the number you specify, the
  /// <code>NextToken</code> response element is returned with a value (not
  /// null). Include the specified value as the <code>NextToken</code> request
  /// parameter in the next call to the operation to get the next set of
  /// results. Note that the service might return fewer results than the maximum
  /// even when there are more results available. You should check
  /// <code>NextToken</code> after every operation to ensure that you receive
  /// all of the results.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListTrustedTokenIssuersResponse> listTrustedTokenIssuers({
    required String instanceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ListTrustedTokenIssuers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTrustedTokenIssuersResponse.fromJson(jsonResponse.body);
  }

  /// The process by which a specified permission set is provisioned to the
  /// specified target.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  ///
  /// Parameter [targetType] :
  /// The entity type for which the assignment will be created.
  ///
  /// Parameter [targetId] :
  /// TargetID is an Amazon Web Services account identifier, (For example,
  /// 123456789012).
  Future<ProvisionPermissionSetResponse> provisionPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    required ProvisionTargetType targetType,
    String? targetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.ProvisionPermissionSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        'TargetType': targetType.toValue(),
        if (targetId != null) 'TargetId': targetId,
      },
    );

    return ProvisionPermissionSetResponse.fromJson(jsonResponse.body);
  }

  /// Adds or updates the list of authorized targets for an IAM Identity Center
  /// access scope for an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application with the access scope with the
  /// targets to add or update.
  ///
  /// Parameter [scope] :
  /// Specifies the name of the access scope to be associated with the specified
  /// targets.
  ///
  /// Parameter [authorizedTargets] :
  /// Specifies an array list of ARNs that represent the authorized targets for
  /// this access scope.
  Future<void> putApplicationAccessScope({
    required String applicationArn,
    required String scope,
    List<String>? authorizedTargets,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.PutApplicationAccessScope'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'Scope': scope,
        if (authorizedTargets != null) 'AuthorizedTargets': authorizedTargets,
      },
    );
  }

  /// Configure how users gain access to an application. If
  /// <code>AssignmentsRequired</code> is <code>true</code> (default value),
  /// users don’t have access to the application unless an assignment is created
  /// using the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html">CreateApplicationAssignment
  /// API</a>. If <code>false</code>, all users have access to the application.
  /// If an assignment is created using <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html">CreateApplicationAssignment</a>.,
  /// the user retains access if <code>AssignmentsRequired</code> is set to
  /// <code>true</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application. For more information about ARNs, see
  /// <a href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [assignmentRequired] :
  /// If <code>AssignmentsRequired</code> is <code>true</code> (default value),
  /// users don’t have access to the application unless an assignment is created
  /// using the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html">CreateApplicationAssignment
  /// API</a>. If <code>false</code>, all users have access to the application.
  Future<void> putApplicationAssignmentConfiguration({
    required String applicationArn,
    required bool assignmentRequired,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.PutApplicationAssignmentConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'AssignmentRequired': assignmentRequired,
      },
    );
  }

  /// Adds or updates an authentication method for an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application with the authentication method to add
  /// or update.
  ///
  /// Parameter [authenticationMethod] :
  /// Specifies a structure that describes the authentication method to add or
  /// update. The structure type you provide is determined by the
  /// <code>AuthenticationMethodType</code> parameter.
  ///
  /// Parameter [authenticationMethodType] :
  /// Specifies the type of the authentication method that you want to add or
  /// update.
  Future<void> putApplicationAuthenticationMethod({
    required String applicationArn,
    required AuthenticationMethod authenticationMethod,
    required AuthenticationMethodType authenticationMethodType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.PutApplicationAuthenticationMethod'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'AuthenticationMethod': authenticationMethod,
        'AuthenticationMethodType': authenticationMethodType.toValue(),
      },
    );
  }

  /// Adds a grant to an application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application to update.
  ///
  /// Parameter [grant] :
  /// Specifies a structure that describes the grant to update.
  ///
  /// Parameter [grantType] :
  /// Specifies the type of grant to update.
  Future<void> putApplicationGrant({
    required String applicationArn,
    required Grant grant,
    required GrantType grantType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.PutApplicationGrant'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'Grant': grant,
        'GrantType': grantType.toValue(),
      },
    );
  }

  /// Attaches an inline policy to a permission set.
  /// <note>
  /// If the permission set is already referenced by one or more account
  /// assignments, you will need to call <code> <a>ProvisionPermissionSet</a>
  /// </code> after this action to apply the corresponding IAM policy updates to
  /// all assigned accounts.
  /// </note>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inlinePolicy] :
  /// The inline policy to attach to a <a>PermissionSet</a>.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  Future<void> putInlinePolicyToPermissionSet({
    required String inlinePolicy,
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.PutInlinePolicyToPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InlinePolicy': inlinePolicy,
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
      },
    );
  }

  /// Attaches an Amazon Web Services managed or customer managed policy to the
  /// specified <a>PermissionSet</a> as a permissions boundary.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <code>PermissionSet</code>.
  ///
  /// Parameter [permissionsBoundary] :
  /// The permissions boundary that you want to attach to a
  /// <code>PermissionSet</code>.
  Future<void> putPermissionsBoundaryToPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    required PermissionsBoundary permissionsBoundary,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.PutPermissionsBoundaryToPermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        'PermissionsBoundary': permissionsBoundary,
      },
    );
  }

  /// Associates a set of tags with a specified resource.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource with the tags to be listed.
  ///
  /// Parameter [tags] :
  /// A set of key-value pairs that are used to manage the resource.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
    String? instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
        if (instanceArn != null) 'InstanceArn': instanceArn,
      },
    );
  }

  /// Disassociates a set of tags from a specified resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource with the tags to be listed.
  ///
  /// Parameter [tagKeys] :
  /// The keys of tags that are attached to the resource.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
    String? instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
        if (instanceArn != null) 'InstanceArn': instanceArn,
      },
    );
  }

  /// Updates application properties.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationArn] :
  /// Specifies the ARN of the application. For more information about ARNs, see
  /// <a href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [description] :
  /// The description of the .
  ///
  /// Parameter [name] :
  /// Specifies the updated name for the application.
  ///
  /// Parameter [portalOptions] :
  /// A structure that describes the options for the portal associated with an
  /// application.
  ///
  /// Parameter [status] :
  /// Specifies whether the application is enabled or disabled.
  Future<void> updateApplication({
    required String applicationArn,
    String? description,
    String? name,
    UpdateApplicationPortalOptions? portalOptions,
    ApplicationStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.UpdateApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (portalOptions != null) 'PortalOptions': portalOptions,
        if (status != null) 'Status': status.toValue(),
      },
    );
  }

  /// Update the details for the instance of IAM Identity Center that is owned
  /// by the Amazon Web Services account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the instance of IAM Identity Center under which the operation
  /// will run. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [name] :
  /// Updates the instance name.
  Future<void> updateInstance({
    required String instanceArn,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.UpdateInstance'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'Name': name,
      },
    );
  }

  /// Updates the IAM Identity Center identity store attributes that you can use
  /// with the IAM Identity Center instance for attributes-based access control
  /// (ABAC). When using an external identity provider as an identity source,
  /// you can pass attributes through the SAML assertion as an alternative to
  /// configuring attributes from the IAM Identity Center identity store. If a
  /// SAML assertion passes any of these attributes, IAM Identity Center
  /// replaces the attribute value with the value from the IAM Identity Center
  /// identity store. For more information about ABAC, see <a
  /// href="/singlesignon/latest/userguide/abac.html">Attribute-Based Access
  /// Control</a> in the <i>IAM Identity Center User Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceAccessControlAttributeConfiguration] :
  /// Updates the attributes for your ABAC configuration.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed.
  Future<void> updateInstanceAccessControlAttributeConfiguration({
    required InstanceAccessControlAttributeConfiguration
        instanceAccessControlAttributeConfiguration,
    required String instanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.UpdateInstanceAccessControlAttributeConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceAccessControlAttributeConfiguration':
            instanceAccessControlAttributeConfiguration,
        'InstanceArn': instanceArn,
      },
    );
  }

  /// Updates an existing permission set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance under which the operation will
  /// be executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the
  /// <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  ///
  /// Parameter [description] :
  /// The description of the <a>PermissionSet</a>.
  ///
  /// Parameter [relayState] :
  /// Used to redirect users within the application during the federation
  /// authentication process.
  ///
  /// Parameter [sessionDuration] :
  /// The length of time that the application user sessions are valid for in the
  /// ISO-8601 standard.
  Future<void> updatePermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    String? description,
    String? relayState,
    String? sessionDuration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.UpdatePermissionSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceArn': instanceArn,
        'PermissionSetArn': permissionSetArn,
        if (description != null) 'Description': description,
        if (relayState != null) 'RelayState': relayState,
        if (sessionDuration != null) 'SessionDuration': sessionDuration,
      },
    );
  }

  /// Updates the name of the trusted token issuer, or the path of a source
  /// attribute or destination attribute for a trusted token issuer
  /// configuration.
  /// <note>
  /// Updating this trusted token issuer configuration might cause users to lose
  /// access to any applications that are configured to use the trusted token
  /// issuer.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [trustedTokenIssuerArn] :
  /// Specifies the ARN of the trusted token issuer configuration that you want
  /// to update.
  ///
  /// Parameter [name] :
  /// Specifies the updated name to be applied to the trusted token issuer
  /// configuration.
  ///
  /// Parameter [trustedTokenIssuerConfiguration] :
  /// Specifies a structure with settings to apply to the specified trusted
  /// token issuer. The settings that you can provide are determined by the type
  /// of the trusted token issuer that you are updating.
  Future<void> updateTrustedTokenIssuer({
    required String trustedTokenIssuerArn,
    String? name,
    TrustedTokenIssuerUpdateConfiguration? trustedTokenIssuerConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.UpdateTrustedTokenIssuer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
        if (name != null) 'Name': name,
        if (trustedTokenIssuerConfiguration != null)
          'TrustedTokenIssuerConfiguration': trustedTokenIssuerConfiguration,
      },
    );
  }
}

/// These are IAM Identity Center identity store attributes that you can
/// configure for use in attributes-based access control (ABAC). You can create
/// permissions policies that determine who can access your Amazon Web Services
/// resources based upon the configured attribute values. When you enable ABAC
/// and specify <code>AccessControlAttributes</code>, IAM Identity Center passes
/// the attribute values of the authenticated user into IAM for use in policy
/// evaluation.
class AccessControlAttribute {
  /// The name of the attribute associated with your identities in your identity
  /// source. This is used to map a specified attribute in your identity source
  /// with an attribute in IAM Identity Center.
  final String key;

  /// The value used for mapping a specified attribute to an identity source.
  final AccessControlAttributeValue value;

  AccessControlAttribute({
    required this.key,
    required this.value,
  });

  factory AccessControlAttribute.fromJson(Map<String, dynamic> json) {
    return AccessControlAttribute(
      key: json['Key'] as String,
      value: AccessControlAttributeValue.fromJson(
          json['Value'] as Map<String, dynamic>),
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

/// The value used for mapping a specified attribute to an identity source. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/attributemappingsconcept.html">Attribute
/// mappings</a> in the <i>IAM Identity Center User Guide</i>.
class AccessControlAttributeValue {
  /// The identity source to use when mapping a specified attribute to IAM
  /// Identity Center.
  final List<String> source;

  AccessControlAttributeValue({
    required this.source,
  });

  factory AccessControlAttributeValue.fromJson(Map<String, dynamic> json) {
    return AccessControlAttributeValue(
      source: (json['Source'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      'Source': source,
    };
  }
}

/// The assignment that indicates a principal's limited access to a specified
/// Amazon Web Services account with a specified permission set.
/// <note>
/// The term <i>principal</i> here refers to a user or group that is defined in
/// IAM Identity Center.
/// </note>
class AccountAssignment {
  /// The identifier of the Amazon Web Services account.
  final String? accountId;

  /// The ARN of the permission set. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? permissionSetArn;

  /// An identifier for an object in IAM Identity Center, such as a user or group.
  /// PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6).
  /// For more information about PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  final String? principalId;

  /// The entity type for which the assignment will be created.
  final PrincipalType? principalType;

  AccountAssignment({
    this.accountId,
    this.permissionSetArn,
    this.principalId,
    this.principalType,
  });

  factory AccountAssignment.fromJson(Map<String, dynamic> json) {
    return AccountAssignment(
      accountId: json['AccountId'] as String?,
      permissionSetArn: json['PermissionSetArn'] as String?,
      principalId: json['PrincipalId'] as String?,
      principalType: (json['PrincipalType'] as String?)?.toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final permissionSetArn = this.permissionSetArn;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (permissionSetArn != null) 'PermissionSetArn': permissionSetArn,
      if (principalId != null) 'PrincipalId': principalId,
      if (principalType != null) 'PrincipalType': principalType.toValue(),
    };
  }
}

/// A structure that describes an assignment of an Amazon Web Services account
/// to a principal and the permissions that principal has in the account.
class AccountAssignmentForPrincipal {
  /// The account ID number of the Amazon Web Services account.
  final String? accountId;

  /// The ARN of the IAM Identity Center permission set assigned to this principal
  /// for this Amazon Web Services account.
  final String? permissionSetArn;

  /// The ID of the principal.
  final String? principalId;

  /// The type of the principal.
  final PrincipalType? principalType;

  AccountAssignmentForPrincipal({
    this.accountId,
    this.permissionSetArn,
    this.principalId,
    this.principalType,
  });

  factory AccountAssignmentForPrincipal.fromJson(Map<String, dynamic> json) {
    return AccountAssignmentForPrincipal(
      accountId: json['AccountId'] as String?,
      permissionSetArn: json['PermissionSetArn'] as String?,
      principalId: json['PrincipalId'] as String?,
      principalType: (json['PrincipalType'] as String?)?.toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final permissionSetArn = this.permissionSetArn;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (permissionSetArn != null) 'PermissionSetArn': permissionSetArn,
      if (principalId != null) 'PrincipalId': principalId,
      if (principalType != null) 'PrincipalType': principalType.toValue(),
    };
  }
}

/// The status of the creation or deletion operation of an assignment that a
/// principal needs to access an account.
class AccountAssignmentOperationStatus {
  /// The date that the permission set was created.
  final DateTime? createdDate;

  /// The message that contains an error or exception in case of an operation
  /// failure.
  final String? failureReason;

  /// The ARN of the permission set. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? permissionSetArn;

  /// An identifier for an object in IAM Identity Center, such as a user or group.
  /// PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6).
  /// For more information about PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  final String? principalId;

  /// The entity type for which the assignment will be created.
  final PrincipalType? principalType;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  final String? requestId;

  /// The status of the permission set provisioning process.
  final StatusValues? status;

  /// TargetID is an Amazon Web Services account identifier, (For example,
  /// 123456789012).
  final String? targetId;

  /// The entity type for which the assignment will be created.
  final TargetType? targetType;

  AccountAssignmentOperationStatus({
    this.createdDate,
    this.failureReason,
    this.permissionSetArn,
    this.principalId,
    this.principalType,
    this.requestId,
    this.status,
    this.targetId,
    this.targetType,
  });

  factory AccountAssignmentOperationStatus.fromJson(Map<String, dynamic> json) {
    return AccountAssignmentOperationStatus(
      createdDate: timeStampFromJson(json['CreatedDate']),
      failureReason: json['FailureReason'] as String?,
      permissionSetArn: json['PermissionSetArn'] as String?,
      principalId: json['PrincipalId'] as String?,
      principalType: (json['PrincipalType'] as String?)?.toPrincipalType(),
      requestId: json['RequestId'] as String?,
      status: (json['Status'] as String?)?.toStatusValues(),
      targetId: json['TargetId'] as String?,
      targetType: (json['TargetType'] as String?)?.toTargetType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final failureReason = this.failureReason;
    final permissionSetArn = this.permissionSetArn;
    final principalId = this.principalId;
    final principalType = this.principalType;
    final requestId = this.requestId;
    final status = this.status;
    final targetId = this.targetId;
    final targetType = this.targetType;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (failureReason != null) 'FailureReason': failureReason,
      if (permissionSetArn != null) 'PermissionSetArn': permissionSetArn,
      if (principalId != null) 'PrincipalId': principalId,
      if (principalType != null) 'PrincipalType': principalType.toValue(),
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status.toValue(),
      if (targetId != null) 'TargetId': targetId,
      if (targetType != null) 'TargetType': targetType.toValue(),
    };
  }
}

/// Provides information about the <a>AccountAssignment</a> creation request.
class AccountAssignmentOperationStatusMetadata {
  /// The date that the permission set was created.
  final DateTime? createdDate;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  final String? requestId;

  /// The status of the permission set provisioning process.
  final StatusValues? status;

  AccountAssignmentOperationStatusMetadata({
    this.createdDate,
    this.requestId,
    this.status,
  });

  factory AccountAssignmentOperationStatusMetadata.fromJson(
      Map<String, dynamic> json) {
    return AccountAssignmentOperationStatusMetadata(
      createdDate: timeStampFromJson(json['CreatedDate']),
      requestId: json['RequestId'] as String?,
      status: (json['Status'] as String?)?.toStatusValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ActorPolicyDocument {
  ActorPolicyDocument();

  factory ActorPolicyDocument.fromJson(Map<String, dynamic> _) {
    return ActorPolicyDocument();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that describes an application that uses IAM Identity Center for
/// access management.
class Application {
  /// The Amazon Web Services account ID number of the application.
  final String? applicationAccount;

  /// The ARN of the application.
  final String? applicationArn;

  /// The ARN of the application provider for this application.
  final String? applicationProviderArn;

  /// The date and time when the application was originally created.
  final DateTime? createdDate;

  /// The description of the application.
  final String? description;

  /// The ARN of the instance of IAM Identity Center that is configured with this
  /// application.
  final String? instanceArn;

  /// The name of the application.
  final String? name;

  /// A structure that describes the options for the access portal associated with
  /// this application.
  final PortalOptions? portalOptions;

  /// The current status of the application in this instance of IAM Identity
  /// Center.
  final ApplicationStatus? status;

  Application({
    this.applicationAccount,
    this.applicationArn,
    this.applicationProviderArn,
    this.createdDate,
    this.description,
    this.instanceArn,
    this.name,
    this.portalOptions,
    this.status,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationAccount: json['ApplicationAccount'] as String?,
      applicationArn: json['ApplicationArn'] as String?,
      applicationProviderArn: json['ApplicationProviderArn'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      description: json['Description'] as String?,
      instanceArn: json['InstanceArn'] as String?,
      name: json['Name'] as String?,
      portalOptions: json['PortalOptions'] != null
          ? PortalOptions.fromJson(
              json['PortalOptions'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toApplicationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationAccount = this.applicationAccount;
    final applicationArn = this.applicationArn;
    final applicationProviderArn = this.applicationProviderArn;
    final createdDate = this.createdDate;
    final description = this.description;
    final instanceArn = this.instanceArn;
    final name = this.name;
    final portalOptions = this.portalOptions;
    final status = this.status;
    return {
      if (applicationAccount != null) 'ApplicationAccount': applicationAccount,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (applicationProviderArn != null)
        'ApplicationProviderArn': applicationProviderArn,
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (description != null) 'Description': description,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (name != null) 'Name': name,
      if (portalOptions != null) 'PortalOptions': portalOptions,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A structure that describes an assignment of a principal to an application.
class ApplicationAssignment {
  /// The ARN of the application that has principals assigned.
  final String applicationArn;

  /// The unique identifier of the principal assigned to the application.
  final String principalId;

  /// The type of the principal assigned to the application.
  final PrincipalType principalType;

  ApplicationAssignment({
    required this.applicationArn,
    required this.principalId,
    required this.principalType,
  });

  factory ApplicationAssignment.fromJson(Map<String, dynamic> json) {
    return ApplicationAssignment(
      applicationArn: json['ApplicationArn'] as String,
      principalId: json['PrincipalId'] as String,
      principalType: (json['PrincipalType'] as String).toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      'ApplicationArn': applicationArn,
      'PrincipalId': principalId,
      'PrincipalType': principalType.toValue(),
    };
  }
}

/// A structure that describes an application to which a principal is assigned.
class ApplicationAssignmentForPrincipal {
  /// The ARN of the application to which the specified principal is assigned.
  final String? applicationArn;

  /// The unique identifier of the principal assigned to the application.
  final String? principalId;

  /// The type of the principal assigned to the application.
  final PrincipalType? principalType;

  ApplicationAssignmentForPrincipal({
    this.applicationArn,
    this.principalId,
    this.principalType,
  });

  factory ApplicationAssignmentForPrincipal.fromJson(
      Map<String, dynamic> json) {
    return ApplicationAssignmentForPrincipal(
      applicationArn: json['ApplicationArn'] as String?,
      principalId: json['PrincipalId'] as String?,
      principalType: (json['PrincipalType'] as String?)?.toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (principalId != null) 'PrincipalId': principalId,
      if (principalType != null) 'PrincipalType': principalType.toValue(),
    };
  }
}

/// A structure that describes a provider that can be used to connect an Amazon
/// Web Services managed application or customer managed application to IAM
/// Identity Center.
class ApplicationProvider {
  /// The ARN of the application provider.
  final String applicationProviderArn;

  /// A structure that describes how IAM Identity Center represents the
  /// application provider in the portal.
  final DisplayData? displayData;

  /// The protocol that the application provider uses to perform federation.
  final FederationProtocol? federationProtocol;

  /// A structure that describes the application provider's resource server.
  final ResourceServerConfig? resourceServerConfig;

  ApplicationProvider({
    required this.applicationProviderArn,
    this.displayData,
    this.federationProtocol,
    this.resourceServerConfig,
  });

  factory ApplicationProvider.fromJson(Map<String, dynamic> json) {
    return ApplicationProvider(
      applicationProviderArn: json['ApplicationProviderArn'] as String,
      displayData: json['DisplayData'] != null
          ? DisplayData.fromJson(json['DisplayData'] as Map<String, dynamic>)
          : null,
      federationProtocol:
          (json['FederationProtocol'] as String?)?.toFederationProtocol(),
      resourceServerConfig: json['ResourceServerConfig'] != null
          ? ResourceServerConfig.fromJson(
              json['ResourceServerConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationProviderArn = this.applicationProviderArn;
    final displayData = this.displayData;
    final federationProtocol = this.federationProtocol;
    final resourceServerConfig = this.resourceServerConfig;
    return {
      'ApplicationProviderArn': applicationProviderArn,
      if (displayData != null) 'DisplayData': displayData,
      if (federationProtocol != null)
        'FederationProtocol': federationProtocol.toValue(),
      if (resourceServerConfig != null)
        'ResourceServerConfig': resourceServerConfig,
    };
  }
}

enum ApplicationStatus {
  enabled,
  disabled,
}

extension ApplicationStatusValueExtension on ApplicationStatus {
  String toValue() {
    switch (this) {
      case ApplicationStatus.enabled:
        return 'ENABLED';
      case ApplicationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ApplicationStatusFromString on String {
  ApplicationStatus toApplicationStatus() {
    switch (this) {
      case 'ENABLED':
        return ApplicationStatus.enabled;
      case 'DISABLED':
        return ApplicationStatus.disabled;
    }
    throw Exception('$this is not known in enum ApplicationStatus');
  }
}

enum ApplicationVisibility {
  enabled,
  disabled,
}

extension ApplicationVisibilityValueExtension on ApplicationVisibility {
  String toValue() {
    switch (this) {
      case ApplicationVisibility.enabled:
        return 'ENABLED';
      case ApplicationVisibility.disabled:
        return 'DISABLED';
    }
  }
}

extension ApplicationVisibilityFromString on String {
  ApplicationVisibility toApplicationVisibility() {
    switch (this) {
      case 'ENABLED':
        return ApplicationVisibility.enabled;
      case 'DISABLED':
        return ApplicationVisibility.disabled;
    }
    throw Exception('$this is not known in enum ApplicationVisibility');
  }
}

class AttachCustomerManagedPolicyReferenceToPermissionSetResponse {
  AttachCustomerManagedPolicyReferenceToPermissionSetResponse();

  factory AttachCustomerManagedPolicyReferenceToPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return AttachCustomerManagedPolicyReferenceToPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AttachManagedPolicyToPermissionSetResponse {
  AttachManagedPolicyToPermissionSetResponse();

  factory AttachManagedPolicyToPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return AttachManagedPolicyToPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that stores the details of the Amazon Web Services managed
/// policy.
class AttachedManagedPolicy {
  /// The ARN of the Amazon Web Services managed policy. For more information
  /// about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? arn;

  /// The name of the Amazon Web Services managed policy.
  final String? name;

  AttachedManagedPolicy({
    this.arn,
    this.name,
  });

  factory AttachedManagedPolicy.fromJson(Map<String, dynamic> json) {
    return AttachedManagedPolicy(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// A structure that describes an authentication method that can be used by an
/// application.
class AuthenticationMethod {
  /// A structure that describes details for IAM authentication.
  final IamAuthenticationMethod? iam;

  AuthenticationMethod({
    this.iam,
  });

  factory AuthenticationMethod.fromJson(Map<String, dynamic> json) {
    return AuthenticationMethod(
      iam: json['Iam'] != null
          ? IamAuthenticationMethod.fromJson(
              json['Iam'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    return {
      if (iam != null) 'Iam': iam,
    };
  }
}

/// A structure that describes an authentication method and its type.
class AuthenticationMethodItem {
  /// A structure that describes an authentication method. The contents of this
  /// structure is determined by the <code>AuthenticationMethodType</code>.
  final AuthenticationMethod? authenticationMethod;

  /// The type of authentication that is used by this method.
  final AuthenticationMethodType? authenticationMethodType;

  AuthenticationMethodItem({
    this.authenticationMethod,
    this.authenticationMethodType,
  });

  factory AuthenticationMethodItem.fromJson(Map<String, dynamic> json) {
    return AuthenticationMethodItem(
      authenticationMethod: json['AuthenticationMethod'] != null
          ? AuthenticationMethod.fromJson(
              json['AuthenticationMethod'] as Map<String, dynamic>)
          : null,
      authenticationMethodType: (json['AuthenticationMethodType'] as String?)
          ?.toAuthenticationMethodType(),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationMethod = this.authenticationMethod;
    final authenticationMethodType = this.authenticationMethodType;
    return {
      if (authenticationMethod != null)
        'AuthenticationMethod': authenticationMethod,
      if (authenticationMethodType != null)
        'AuthenticationMethodType': authenticationMethodType.toValue(),
    };
  }
}

enum AuthenticationMethodType {
  iam,
}

extension AuthenticationMethodTypeValueExtension on AuthenticationMethodType {
  String toValue() {
    switch (this) {
      case AuthenticationMethodType.iam:
        return 'IAM';
    }
  }
}

extension AuthenticationMethodTypeFromString on String {
  AuthenticationMethodType toAuthenticationMethodType() {
    switch (this) {
      case 'IAM':
        return AuthenticationMethodType.iam;
    }
    throw Exception('$this is not known in enum AuthenticationMethodType');
  }
}

/// A structure that defines configuration settings for an application that
/// supports the OAuth 2.0 Authorization Code Grant.
class AuthorizationCodeGrant {
  /// A list of URIs that are valid locations to redirect a user's browser after
  /// the user is authorized.
  final List<String>? redirectUris;

  AuthorizationCodeGrant({
    this.redirectUris,
  });

  factory AuthorizationCodeGrant.fromJson(Map<String, dynamic> json) {
    return AuthorizationCodeGrant(
      redirectUris: (json['RedirectUris'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final redirectUris = this.redirectUris;
    return {
      if (redirectUris != null) 'RedirectUris': redirectUris,
    };
  }
}

/// A structure that describes a trusted token issuer and associates it with a
/// set of authorized audiences.
class AuthorizedTokenIssuer {
  /// An array list of authorized audiences, or applications, that can consume the
  /// tokens generated by the associated trusted token issuer.
  final List<String>? authorizedAudiences;

  /// The ARN of the trusted token issuer.
  final String? trustedTokenIssuerArn;

  AuthorizedTokenIssuer({
    this.authorizedAudiences,
    this.trustedTokenIssuerArn,
  });

  factory AuthorizedTokenIssuer.fromJson(Map<String, dynamic> json) {
    return AuthorizedTokenIssuer(
      authorizedAudiences: (json['AuthorizedAudiences'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      trustedTokenIssuerArn: json['TrustedTokenIssuerArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedAudiences = this.authorizedAudiences;
    final trustedTokenIssuerArn = this.trustedTokenIssuerArn;
    return {
      if (authorizedAudiences != null)
        'AuthorizedAudiences': authorizedAudiences,
      if (trustedTokenIssuerArn != null)
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
    };
  }
}

class CreateAccountAssignmentResponse {
  /// The status object for the account assignment creation operation.
  final AccountAssignmentOperationStatus? accountAssignmentCreationStatus;

  CreateAccountAssignmentResponse({
    this.accountAssignmentCreationStatus,
  });

  factory CreateAccountAssignmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccountAssignmentResponse(
      accountAssignmentCreationStatus:
          json['AccountAssignmentCreationStatus'] != null
              ? AccountAssignmentOperationStatus.fromJson(
                  json['AccountAssignmentCreationStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignmentCreationStatus =
        this.accountAssignmentCreationStatus;
    return {
      if (accountAssignmentCreationStatus != null)
        'AccountAssignmentCreationStatus': accountAssignmentCreationStatus,
    };
  }
}

class CreateApplicationAssignmentResponse {
  CreateApplicationAssignmentResponse();

  factory CreateApplicationAssignmentResponse.fromJson(Map<String, dynamic> _) {
    return CreateApplicationAssignmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateApplicationResponse {
  /// Specifies the ARN of the application.
  final String? applicationArn;

  CreateApplicationResponse({
    this.applicationArn,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationArn: json['ApplicationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
    };
  }
}

class CreateInstanceAccessControlAttributeConfigurationResponse {
  CreateInstanceAccessControlAttributeConfigurationResponse();

  factory CreateInstanceAccessControlAttributeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateInstanceAccessControlAttributeConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateInstanceResponse {
  /// The ARN of the instance of IAM Identity Center under which the operation
  /// will run.
  ///
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? instanceArn;

  CreateInstanceResponse({
    this.instanceArn,
  });

  factory CreateInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateInstanceResponse(
      instanceArn: json['InstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceArn = this.instanceArn;
    return {
      if (instanceArn != null) 'InstanceArn': instanceArn,
    };
  }
}

class CreatePermissionSetResponse {
  /// Defines the level of access on an Amazon Web Services account.
  final PermissionSet? permissionSet;

  CreatePermissionSetResponse({
    this.permissionSet,
  });

  factory CreatePermissionSetResponse.fromJson(Map<String, dynamic> json) {
    return CreatePermissionSetResponse(
      permissionSet: json['PermissionSet'] != null
          ? PermissionSet.fromJson(
              json['PermissionSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionSet = this.permissionSet;
    return {
      if (permissionSet != null) 'PermissionSet': permissionSet,
    };
  }
}

class CreateTrustedTokenIssuerResponse {
  /// The ARN of the new trusted token issuer configuration.
  final String? trustedTokenIssuerArn;

  CreateTrustedTokenIssuerResponse({
    this.trustedTokenIssuerArn,
  });

  factory CreateTrustedTokenIssuerResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrustedTokenIssuerResponse(
      trustedTokenIssuerArn: json['TrustedTokenIssuerArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trustedTokenIssuerArn = this.trustedTokenIssuerArn;
    return {
      if (trustedTokenIssuerArn != null)
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
    };
  }
}

/// Specifies the name and path of a customer managed policy. You must have an
/// IAM policy that matches the name and path in each Amazon Web Services
/// account where you want to deploy your permission set.
class CustomerManagedPolicyReference {
  /// The name of the IAM policy that you have configured in each account where
  /// you want to deploy your permission set.
  final String name;

  /// The path to the IAM policy that you have configured in each account where
  /// you want to deploy your permission set. The default is <code>/</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-friendly-names">Friendly
  /// names and paths</a> in the <i>IAM User Guide</i>.
  final String? path;

  CustomerManagedPolicyReference({
    required this.name,
    this.path,
  });

  factory CustomerManagedPolicyReference.fromJson(Map<String, dynamic> json) {
    return CustomerManagedPolicyReference(
      name: json['Name'] as String,
      path: json['Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final path = this.path;
    return {
      'Name': name,
      if (path != null) 'Path': path,
    };
  }
}

class DeleteAccountAssignmentResponse {
  /// The status object for the account assignment deletion operation.
  final AccountAssignmentOperationStatus? accountAssignmentDeletionStatus;

  DeleteAccountAssignmentResponse({
    this.accountAssignmentDeletionStatus,
  });

  factory DeleteAccountAssignmentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAccountAssignmentResponse(
      accountAssignmentDeletionStatus:
          json['AccountAssignmentDeletionStatus'] != null
              ? AccountAssignmentOperationStatus.fromJson(
                  json['AccountAssignmentDeletionStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignmentDeletionStatus =
        this.accountAssignmentDeletionStatus;
    return {
      if (accountAssignmentDeletionStatus != null)
        'AccountAssignmentDeletionStatus': accountAssignmentDeletionStatus,
    };
  }
}

class DeleteApplicationAssignmentResponse {
  DeleteApplicationAssignmentResponse();

  factory DeleteApplicationAssignmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationAssignmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteInlinePolicyFromPermissionSetResponse {
  DeleteInlinePolicyFromPermissionSetResponse();

  factory DeleteInlinePolicyFromPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteInlinePolicyFromPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteInstanceAccessControlAttributeConfigurationResponse {
  DeleteInstanceAccessControlAttributeConfigurationResponse();

  factory DeleteInstanceAccessControlAttributeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteInstanceAccessControlAttributeConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteInstanceResponse {
  DeleteInstanceResponse();

  factory DeleteInstanceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePermissionSetResponse {
  DeletePermissionSetResponse();

  factory DeletePermissionSetResponse.fromJson(Map<String, dynamic> _) {
    return DeletePermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePermissionsBoundaryFromPermissionSetResponse {
  DeletePermissionsBoundaryFromPermissionSetResponse();

  factory DeletePermissionsBoundaryFromPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return DeletePermissionsBoundaryFromPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTrustedTokenIssuerResponse {
  DeleteTrustedTokenIssuerResponse();

  factory DeleteTrustedTokenIssuerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrustedTokenIssuerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccountAssignmentCreationStatusResponse {
  /// The status object for the account assignment creation operation.
  final AccountAssignmentOperationStatus? accountAssignmentCreationStatus;

  DescribeAccountAssignmentCreationStatusResponse({
    this.accountAssignmentCreationStatus,
  });

  factory DescribeAccountAssignmentCreationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountAssignmentCreationStatusResponse(
      accountAssignmentCreationStatus:
          json['AccountAssignmentCreationStatus'] != null
              ? AccountAssignmentOperationStatus.fromJson(
                  json['AccountAssignmentCreationStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignmentCreationStatus =
        this.accountAssignmentCreationStatus;
    return {
      if (accountAssignmentCreationStatus != null)
        'AccountAssignmentCreationStatus': accountAssignmentCreationStatus,
    };
  }
}

class DescribeAccountAssignmentDeletionStatusResponse {
  /// The status object for the account assignment deletion operation.
  final AccountAssignmentOperationStatus? accountAssignmentDeletionStatus;

  DescribeAccountAssignmentDeletionStatusResponse({
    this.accountAssignmentDeletionStatus,
  });

  factory DescribeAccountAssignmentDeletionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountAssignmentDeletionStatusResponse(
      accountAssignmentDeletionStatus:
          json['AccountAssignmentDeletionStatus'] != null
              ? AccountAssignmentOperationStatus.fromJson(
                  json['AccountAssignmentDeletionStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignmentDeletionStatus =
        this.accountAssignmentDeletionStatus;
    return {
      if (accountAssignmentDeletionStatus != null)
        'AccountAssignmentDeletionStatus': accountAssignmentDeletionStatus,
    };
  }
}

class DescribeApplicationAssignmentResponse {
  /// Specifies the ARN of the application. For more information about ARNs, see
  /// <a href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon
  /// Web Services General Reference</i>.
  final String? applicationArn;

  /// An identifier for an object in IAM Identity Center, such as a user or group.
  /// PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6).
  /// For more information about PrincipalIds in IAM Identity Center, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">IAM
  /// Identity Center Identity Store API Reference</a>.
  final String? principalId;

  /// The entity type for which the assignment will be created.
  final PrincipalType? principalType;

  DescribeApplicationAssignmentResponse({
    this.applicationArn,
    this.principalId,
    this.principalType,
  });

  factory DescribeApplicationAssignmentResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationAssignmentResponse(
      applicationArn: json['ApplicationArn'] as String?,
      principalId: json['PrincipalId'] as String?,
      principalType: (json['PrincipalType'] as String?)?.toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (principalId != null) 'PrincipalId': principalId,
      if (principalType != null) 'PrincipalType': principalType.toValue(),
    };
  }
}

class DescribeApplicationProviderResponse {
  /// The ARN of the application provider.
  final String applicationProviderArn;

  /// A structure with details about the display data for the application
  /// provider.
  final DisplayData? displayData;

  /// The protocol used to federate to the application provider.
  final FederationProtocol? federationProtocol;

  /// A structure with details about the receiving application.
  final ResourceServerConfig? resourceServerConfig;

  DescribeApplicationProviderResponse({
    required this.applicationProviderArn,
    this.displayData,
    this.federationProtocol,
    this.resourceServerConfig,
  });

  factory DescribeApplicationProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationProviderResponse(
      applicationProviderArn: json['ApplicationProviderArn'] as String,
      displayData: json['DisplayData'] != null
          ? DisplayData.fromJson(json['DisplayData'] as Map<String, dynamic>)
          : null,
      federationProtocol:
          (json['FederationProtocol'] as String?)?.toFederationProtocol(),
      resourceServerConfig: json['ResourceServerConfig'] != null
          ? ResourceServerConfig.fromJson(
              json['ResourceServerConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationProviderArn = this.applicationProviderArn;
    final displayData = this.displayData;
    final federationProtocol = this.federationProtocol;
    final resourceServerConfig = this.resourceServerConfig;
    return {
      'ApplicationProviderArn': applicationProviderArn,
      if (displayData != null) 'DisplayData': displayData,
      if (federationProtocol != null)
        'FederationProtocol': federationProtocol.toValue(),
      if (resourceServerConfig != null)
        'ResourceServerConfig': resourceServerConfig,
    };
  }
}

class DescribeApplicationResponse {
  /// The account ID.
  final String? applicationAccount;

  /// Specifies the ARN of the application.
  final String? applicationArn;

  /// The ARN of the application provider under which the operation will run.
  final String? applicationProviderArn;

  /// The date the application was created.
  final DateTime? createdDate;

  /// The description of the .
  final String? description;

  /// The ARN of the IAM Identity Center application under which the operation
  /// will run. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? instanceArn;

  /// The application name.
  final String? name;

  /// A structure that describes the options for the portal associated with an
  /// application.
  final PortalOptions? portalOptions;

  /// Specifies whether the application is enabled or disabled.
  final ApplicationStatus? status;

  DescribeApplicationResponse({
    this.applicationAccount,
    this.applicationArn,
    this.applicationProviderArn,
    this.createdDate,
    this.description,
    this.instanceArn,
    this.name,
    this.portalOptions,
    this.status,
  });

  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeApplicationResponse(
      applicationAccount: json['ApplicationAccount'] as String?,
      applicationArn: json['ApplicationArn'] as String?,
      applicationProviderArn: json['ApplicationProviderArn'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      description: json['Description'] as String?,
      instanceArn: json['InstanceArn'] as String?,
      name: json['Name'] as String?,
      portalOptions: json['PortalOptions'] != null
          ? PortalOptions.fromJson(
              json['PortalOptions'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toApplicationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationAccount = this.applicationAccount;
    final applicationArn = this.applicationArn;
    final applicationProviderArn = this.applicationProviderArn;
    final createdDate = this.createdDate;
    final description = this.description;
    final instanceArn = this.instanceArn;
    final name = this.name;
    final portalOptions = this.portalOptions;
    final status = this.status;
    return {
      if (applicationAccount != null) 'ApplicationAccount': applicationAccount,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (applicationProviderArn != null)
        'ApplicationProviderArn': applicationProviderArn,
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (description != null) 'Description': description,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (name != null) 'Name': name,
      if (portalOptions != null) 'PortalOptions': portalOptions,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeInstanceAccessControlAttributeConfigurationResponse {
  /// Gets the list of IAM Identity Center identity store attributes that have
  /// been added to your ABAC configuration.
  final InstanceAccessControlAttributeConfiguration?
      instanceAccessControlAttributeConfiguration;

  /// The status of the attribute configuration process.
  final InstanceAccessControlAttributeConfigurationStatus? status;

  /// Provides more details about the current status of the specified attribute.
  final String? statusReason;

  DescribeInstanceAccessControlAttributeConfigurationResponse({
    this.instanceAccessControlAttributeConfiguration,
    this.status,
    this.statusReason,
  });

  factory DescribeInstanceAccessControlAttributeConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInstanceAccessControlAttributeConfigurationResponse(
      instanceAccessControlAttributeConfiguration:
          json['InstanceAccessControlAttributeConfiguration'] != null
              ? InstanceAccessControlAttributeConfiguration.fromJson(
                  json['InstanceAccessControlAttributeConfiguration']
                      as Map<String, dynamic>)
              : null,
      status: (json['Status'] as String?)
          ?.toInstanceAccessControlAttributeConfigurationStatus(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceAccessControlAttributeConfiguration =
        this.instanceAccessControlAttributeConfiguration;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (instanceAccessControlAttributeConfiguration != null)
        'InstanceAccessControlAttributeConfiguration':
            instanceAccessControlAttributeConfiguration,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

class DescribeInstanceResponse {
  /// The date the instance was created.
  final DateTime? createdDate;

  /// The identifier of the identity store that is connected to the instance of
  /// IAM Identity Center.
  final String? identityStoreId;

  /// The ARN of the instance of IAM Identity Center under which the operation
  /// will run. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? instanceArn;

  /// Specifies the instance name.
  final String? name;

  /// The identifier of the Amazon Web Services account for which the instance was
  /// created.
  final String? ownerAccountId;

  /// The status of the instance.
  final InstanceStatus? status;

  DescribeInstanceResponse({
    this.createdDate,
    this.identityStoreId,
    this.instanceArn,
    this.name,
    this.ownerAccountId,
    this.status,
  });

  factory DescribeInstanceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInstanceResponse(
      createdDate: timeStampFromJson(json['CreatedDate']),
      identityStoreId: json['IdentityStoreId'] as String?,
      instanceArn: json['InstanceArn'] as String?,
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      status: (json['Status'] as String?)?.toInstanceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final identityStoreId = this.identityStoreId;
    final instanceArn = this.instanceArn;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final status = this.status;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (identityStoreId != null) 'IdentityStoreId': identityStoreId,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribePermissionSetProvisioningStatusResponse {
  /// The status object for the permission set provisioning operation.
  final PermissionSetProvisioningStatus? permissionSetProvisioningStatus;

  DescribePermissionSetProvisioningStatusResponse({
    this.permissionSetProvisioningStatus,
  });

  factory DescribePermissionSetProvisioningStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePermissionSetProvisioningStatusResponse(
      permissionSetProvisioningStatus:
          json['PermissionSetProvisioningStatus'] != null
              ? PermissionSetProvisioningStatus.fromJson(
                  json['PermissionSetProvisioningStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionSetProvisioningStatus =
        this.permissionSetProvisioningStatus;
    return {
      if (permissionSetProvisioningStatus != null)
        'PermissionSetProvisioningStatus': permissionSetProvisioningStatus,
    };
  }
}

class DescribePermissionSetResponse {
  /// Describes the level of access on an Amazon Web Services account.
  final PermissionSet? permissionSet;

  DescribePermissionSetResponse({
    this.permissionSet,
  });

  factory DescribePermissionSetResponse.fromJson(Map<String, dynamic> json) {
    return DescribePermissionSetResponse(
      permissionSet: json['PermissionSet'] != null
          ? PermissionSet.fromJson(
              json['PermissionSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionSet = this.permissionSet;
    return {
      if (permissionSet != null) 'PermissionSet': permissionSet,
    };
  }
}

class DescribeTrustedTokenIssuerResponse {
  /// The name of the trusted token issuer configuration.
  final String? name;

  /// The ARN of the trusted token issuer configuration.
  final String? trustedTokenIssuerArn;

  /// A structure the describes the settings that apply of this trusted token
  /// issuer.
  final TrustedTokenIssuerConfiguration? trustedTokenIssuerConfiguration;

  /// The type of the trusted token issuer.
  final TrustedTokenIssuerType? trustedTokenIssuerType;

  DescribeTrustedTokenIssuerResponse({
    this.name,
    this.trustedTokenIssuerArn,
    this.trustedTokenIssuerConfiguration,
    this.trustedTokenIssuerType,
  });

  factory DescribeTrustedTokenIssuerResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTrustedTokenIssuerResponse(
      name: json['Name'] as String?,
      trustedTokenIssuerArn: json['TrustedTokenIssuerArn'] as String?,
      trustedTokenIssuerConfiguration:
          json['TrustedTokenIssuerConfiguration'] != null
              ? TrustedTokenIssuerConfiguration.fromJson(
                  json['TrustedTokenIssuerConfiguration']
                      as Map<String, dynamic>)
              : null,
      trustedTokenIssuerType: (json['TrustedTokenIssuerType'] as String?)
          ?.toTrustedTokenIssuerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final trustedTokenIssuerArn = this.trustedTokenIssuerArn;
    final trustedTokenIssuerConfiguration =
        this.trustedTokenIssuerConfiguration;
    final trustedTokenIssuerType = this.trustedTokenIssuerType;
    return {
      if (name != null) 'Name': name,
      if (trustedTokenIssuerArn != null)
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
      if (trustedTokenIssuerConfiguration != null)
        'TrustedTokenIssuerConfiguration': trustedTokenIssuerConfiguration,
      if (trustedTokenIssuerType != null)
        'TrustedTokenIssuerType': trustedTokenIssuerType.toValue(),
    };
  }
}

class DetachCustomerManagedPolicyReferenceFromPermissionSetResponse {
  DetachCustomerManagedPolicyReferenceFromPermissionSetResponse();

  factory DetachCustomerManagedPolicyReferenceFromPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return DetachCustomerManagedPolicyReferenceFromPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DetachManagedPolicyFromPermissionSetResponse {
  DetachManagedPolicyFromPermissionSetResponse();

  factory DetachManagedPolicyFromPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return DetachManagedPolicyFromPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that describes how the portal represents an application
/// provider.
class DisplayData {
  /// The description of the application provider that appears in the portal.
  final String? description;

  /// The name of the application provider that appears in the portal.
  final String? displayName;

  /// A URL that points to an icon that represents the application provider.
  final String? iconUrl;

  DisplayData({
    this.description,
    this.displayName,
    this.iconUrl,
  });

  factory DisplayData.fromJson(Map<String, dynamic> json) {
    return DisplayData(
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      iconUrl: json['IconUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final iconUrl = this.iconUrl;
    return {
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (iconUrl != null) 'IconUrl': iconUrl,
    };
  }
}

enum FederationProtocol {
  saml,
  oauth,
}

extension FederationProtocolValueExtension on FederationProtocol {
  String toValue() {
    switch (this) {
      case FederationProtocol.saml:
        return 'SAML';
      case FederationProtocol.oauth:
        return 'OAUTH';
    }
  }
}

extension FederationProtocolFromString on String {
  FederationProtocol toFederationProtocol() {
    switch (this) {
      case 'SAML':
        return FederationProtocol.saml;
      case 'OAUTH':
        return FederationProtocol.oauth;
    }
    throw Exception('$this is not known in enum FederationProtocol');
  }
}

class GetApplicationAccessScopeResponse {
  /// The name of the access scope that can be used with the authorized targets.
  final String scope;

  /// An array of authorized targets associated with this access scope.
  final List<String>? authorizedTargets;

  GetApplicationAccessScopeResponse({
    required this.scope,
    this.authorizedTargets,
  });

  factory GetApplicationAccessScopeResponse.fromJson(
      Map<String, dynamic> json) {
    return GetApplicationAccessScopeResponse(
      scope: json['Scope'] as String,
      authorizedTargets: (json['AuthorizedTargets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scope = this.scope;
    final authorizedTargets = this.authorizedTargets;
    return {
      'Scope': scope,
      if (authorizedTargets != null) 'AuthorizedTargets': authorizedTargets,
    };
  }
}

class GetApplicationAssignmentConfigurationResponse {
  /// If <code>AssignmentsRequired</code> is <code>true</code> (default value),
  /// users don’t have access to the application unless an assignment is created
  /// using the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html">CreateApplicationAssignment
  /// API</a>. If <code>false</code>, all users have access to the application.
  final bool assignmentRequired;

  GetApplicationAssignmentConfigurationResponse({
    required this.assignmentRequired,
  });

  factory GetApplicationAssignmentConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetApplicationAssignmentConfigurationResponse(
      assignmentRequired: json['AssignmentRequired'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentRequired = this.assignmentRequired;
    return {
      'AssignmentRequired': assignmentRequired,
    };
  }
}

class GetApplicationAuthenticationMethodResponse {
  /// A structure that contains details about the requested authentication method.
  final AuthenticationMethod? authenticationMethod;

  GetApplicationAuthenticationMethodResponse({
    this.authenticationMethod,
  });

  factory GetApplicationAuthenticationMethodResponse.fromJson(
      Map<String, dynamic> json) {
    return GetApplicationAuthenticationMethodResponse(
      authenticationMethod: json['AuthenticationMethod'] != null
          ? AuthenticationMethod.fromJson(
              json['AuthenticationMethod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationMethod = this.authenticationMethod;
    return {
      if (authenticationMethod != null)
        'AuthenticationMethod': authenticationMethod,
    };
  }
}

class GetApplicationGrantResponse {
  /// A structure that describes the requested grant.
  final Grant grant;

  GetApplicationGrantResponse({
    required this.grant,
  });

  factory GetApplicationGrantResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationGrantResponse(
      grant: Grant.fromJson(json['Grant'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final grant = this.grant;
    return {
      'Grant': grant,
    };
  }
}

class GetInlinePolicyForPermissionSetResponse {
  /// The inline policy that is attached to the permission set.
  /// <note>
  /// For <code>Length Constraints</code>, if a valid ARN is provided for a
  /// permission set, it is possible for an empty inline policy to be returned.
  /// </note>
  final String? inlinePolicy;

  GetInlinePolicyForPermissionSetResponse({
    this.inlinePolicy,
  });

  factory GetInlinePolicyForPermissionSetResponse.fromJson(
      Map<String, dynamic> json) {
    return GetInlinePolicyForPermissionSetResponse(
      inlinePolicy: json['InlinePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlinePolicy = this.inlinePolicy;
    return {
      if (inlinePolicy != null) 'InlinePolicy': inlinePolicy,
    };
  }
}

class GetPermissionsBoundaryForPermissionSetResponse {
  /// The permissions boundary attached to the specified permission set.
  final PermissionsBoundary? permissionsBoundary;

  GetPermissionsBoundaryForPermissionSetResponse({
    this.permissionsBoundary,
  });

  factory GetPermissionsBoundaryForPermissionSetResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPermissionsBoundaryForPermissionSetResponse(
      permissionsBoundary: json['PermissionsBoundary'] != null
          ? PermissionsBoundary.fromJson(
              json['PermissionsBoundary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionsBoundary = this.permissionsBoundary;
    return {
      if (permissionsBoundary != null)
        'PermissionsBoundary': permissionsBoundary,
    };
  }
}

/// The Grant union represents the set of possible configuration options for the
/// selected grant type. Exactly one member of the union must be specified, and
/// must match the grant type selected.
class Grant {
  /// Configuration options for the <code>authorization_code</code> grant type.
  final AuthorizationCodeGrant? authorizationCode;

  /// Configuration options for the
  /// <code>urn:ietf:params:oauth:grant-type:jwt-bearer</code> grant type.
  final JwtBearerGrant? jwtBearer;

  /// Configuration options for the <code>refresh_token</code> grant type.
  final RefreshTokenGrant? refreshToken;

  /// Configuration options for the
  /// <code>urn:ietf:params:oauth:grant-type:token-exchange</code> grant type.
  final TokenExchangeGrant? tokenExchange;

  Grant({
    this.authorizationCode,
    this.jwtBearer,
    this.refreshToken,
    this.tokenExchange,
  });

  factory Grant.fromJson(Map<String, dynamic> json) {
    return Grant(
      authorizationCode: json['AuthorizationCode'] != null
          ? AuthorizationCodeGrant.fromJson(
              json['AuthorizationCode'] as Map<String, dynamic>)
          : null,
      jwtBearer: json['JwtBearer'] != null
          ? JwtBearerGrant.fromJson(json['JwtBearer'] as Map<String, dynamic>)
          : null,
      refreshToken: json['RefreshToken'] != null
          ? RefreshTokenGrant.fromJson(
              json['RefreshToken'] as Map<String, dynamic>)
          : null,
      tokenExchange: json['TokenExchange'] != null
          ? TokenExchangeGrant.fromJson(
              json['TokenExchange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationCode = this.authorizationCode;
    final jwtBearer = this.jwtBearer;
    final refreshToken = this.refreshToken;
    final tokenExchange = this.tokenExchange;
    return {
      if (authorizationCode != null) 'AuthorizationCode': authorizationCode,
      if (jwtBearer != null) 'JwtBearer': jwtBearer,
      if (refreshToken != null) 'RefreshToken': refreshToken,
      if (tokenExchange != null) 'TokenExchange': tokenExchange,
    };
  }
}

/// A structure that defines a single grant and its configuration.
class GrantItem {
  /// The configuration structure for the selected grant.
  final Grant grant;

  /// The type of the selected grant.
  final GrantType grantType;

  GrantItem({
    required this.grant,
    required this.grantType,
  });

  factory GrantItem.fromJson(Map<String, dynamic> json) {
    return GrantItem(
      grant: Grant.fromJson(json['Grant'] as Map<String, dynamic>),
      grantType: (json['GrantType'] as String).toGrantType(),
    );
  }

  Map<String, dynamic> toJson() {
    final grant = this.grant;
    final grantType = this.grantType;
    return {
      'Grant': grant,
      'GrantType': grantType.toValue(),
    };
  }
}

enum GrantType {
  authorizationCode,
  refreshToken,
  urnIetfParamsOauthGrantTypeJwtBearer,
  urnIetfParamsOauthGrantTypeTokenExchange,
}

extension GrantTypeValueExtension on GrantType {
  String toValue() {
    switch (this) {
      case GrantType.authorizationCode:
        return 'authorization_code';
      case GrantType.refreshToken:
        return 'refresh_token';
      case GrantType.urnIetfParamsOauthGrantTypeJwtBearer:
        return 'urn:ietf:params:oauth:grant-type:jwt-bearer';
      case GrantType.urnIetfParamsOauthGrantTypeTokenExchange:
        return 'urn:ietf:params:oauth:grant-type:token-exchange';
    }
  }
}

extension GrantTypeFromString on String {
  GrantType toGrantType() {
    switch (this) {
      case 'authorization_code':
        return GrantType.authorizationCode;
      case 'refresh_token':
        return GrantType.refreshToken;
      case 'urn:ietf:params:oauth:grant-type:jwt-bearer':
        return GrantType.urnIetfParamsOauthGrantTypeJwtBearer;
      case 'urn:ietf:params:oauth:grant-type:token-exchange':
        return GrantType.urnIetfParamsOauthGrantTypeTokenExchange;
    }
    throw Exception('$this is not known in enum GrantType');
  }
}

/// A structure that describes details for authentication that uses IAM.
class IamAuthenticationMethod {
  /// An IAM policy document in JSON.
  final ActorPolicyDocument actorPolicy;

  IamAuthenticationMethod({
    required this.actorPolicy,
  });

  factory IamAuthenticationMethod.fromJson(Map<String, dynamic> json) {
    return IamAuthenticationMethod(
      actorPolicy: ActorPolicyDocument.fromJson(
          json['ActorPolicy'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final actorPolicy = this.actorPolicy;
    return {
      'ActorPolicy': actorPolicy,
    };
  }
}

/// Specifies the attributes to add to your attribute-based access control
/// (ABAC) configuration.
class InstanceAccessControlAttributeConfiguration {
  /// Lists the attributes that are configured for ABAC in the specified IAM
  /// Identity Center instance.
  final List<AccessControlAttribute> accessControlAttributes;

  InstanceAccessControlAttributeConfiguration({
    required this.accessControlAttributes,
  });

  factory InstanceAccessControlAttributeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return InstanceAccessControlAttributeConfiguration(
      accessControlAttributes: (json['AccessControlAttributes'] as List)
          .whereNotNull()
          .map(
              (e) => AccessControlAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessControlAttributes = this.accessControlAttributes;
    return {
      'AccessControlAttributes': accessControlAttributes,
    };
  }
}

enum InstanceAccessControlAttributeConfigurationStatus {
  enabled,
  creationInProgress,
  creationFailed,
}

extension InstanceAccessControlAttributeConfigurationStatusValueExtension
    on InstanceAccessControlAttributeConfigurationStatus {
  String toValue() {
    switch (this) {
      case InstanceAccessControlAttributeConfigurationStatus.enabled:
        return 'ENABLED';
      case InstanceAccessControlAttributeConfigurationStatus.creationInProgress:
        return 'CREATION_IN_PROGRESS';
      case InstanceAccessControlAttributeConfigurationStatus.creationFailed:
        return 'CREATION_FAILED';
    }
  }
}

extension InstanceAccessControlAttributeConfigurationStatusFromString
    on String {
  InstanceAccessControlAttributeConfigurationStatus
      toInstanceAccessControlAttributeConfigurationStatus() {
    switch (this) {
      case 'ENABLED':
        return InstanceAccessControlAttributeConfigurationStatus.enabled;
      case 'CREATION_IN_PROGRESS':
        return InstanceAccessControlAttributeConfigurationStatus
            .creationInProgress;
      case 'CREATION_FAILED':
        return InstanceAccessControlAttributeConfigurationStatus.creationFailed;
    }
    throw Exception(
        '$this is not known in enum InstanceAccessControlAttributeConfigurationStatus');
  }
}

/// Provides information about the IAM Identity Center instance.
class InstanceMetadata {
  /// The date and time that the Identity Center instance was created.
  final DateTime? createdDate;

  /// The identifier of the identity store that is connected to the Identity
  /// Center instance.
  final String? identityStoreId;

  /// The ARN of the Identity Center instance under which the operation will be
  /// executed. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? instanceArn;

  /// The name of the Identity Center instance.
  final String? name;

  /// The Amazon Web Services account ID number of the owner of the Identity
  /// Center instance.
  final String? ownerAccountId;

  /// The current status of this Identity Center instance.
  final InstanceStatus? status;

  InstanceMetadata({
    this.createdDate,
    this.identityStoreId,
    this.instanceArn,
    this.name,
    this.ownerAccountId,
    this.status,
  });

  factory InstanceMetadata.fromJson(Map<String, dynamic> json) {
    return InstanceMetadata(
      createdDate: timeStampFromJson(json['CreatedDate']),
      identityStoreId: json['IdentityStoreId'] as String?,
      instanceArn: json['InstanceArn'] as String?,
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      status: (json['Status'] as String?)?.toInstanceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final identityStoreId = this.identityStoreId;
    final instanceArn = this.instanceArn;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final status = this.status;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (identityStoreId != null) 'IdentityStoreId': identityStoreId,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum InstanceStatus {
  createInProgress,
  deleteInProgress,
  active,
}

extension InstanceStatusValueExtension on InstanceStatus {
  String toValue() {
    switch (this) {
      case InstanceStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case InstanceStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case InstanceStatus.active:
        return 'ACTIVE';
    }
  }
}

extension InstanceStatusFromString on String {
  InstanceStatus toInstanceStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return InstanceStatus.createInProgress;
      case 'DELETE_IN_PROGRESS':
        return InstanceStatus.deleteInProgress;
      case 'ACTIVE':
        return InstanceStatus.active;
    }
    throw Exception('$this is not known in enum InstanceStatus');
  }
}

enum JwksRetrievalOption {
  openIdDiscovery,
}

extension JwksRetrievalOptionValueExtension on JwksRetrievalOption {
  String toValue() {
    switch (this) {
      case JwksRetrievalOption.openIdDiscovery:
        return 'OPEN_ID_DISCOVERY';
    }
  }
}

extension JwksRetrievalOptionFromString on String {
  JwksRetrievalOption toJwksRetrievalOption() {
    switch (this) {
      case 'OPEN_ID_DISCOVERY':
        return JwksRetrievalOption.openIdDiscovery;
    }
    throw Exception('$this is not known in enum JwksRetrievalOption');
  }
}

/// A structure that defines configuration settings for an application that
/// supports the JWT Bearer Token Authorization Grant.
class JwtBearerGrant {
  /// A list of allowed token issuers trusted by the Identity Center instances for
  /// this application.
  final List<AuthorizedTokenIssuer>? authorizedTokenIssuers;

  JwtBearerGrant({
    this.authorizedTokenIssuers,
  });

  factory JwtBearerGrant.fromJson(Map<String, dynamic> json) {
    return JwtBearerGrant(
      authorizedTokenIssuers: (json['AuthorizedTokenIssuers'] as List?)
          ?.whereNotNull()
          .map((e) => AuthorizedTokenIssuer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedTokenIssuers = this.authorizedTokenIssuers;
    return {
      if (authorizedTokenIssuers != null)
        'AuthorizedTokenIssuers': authorizedTokenIssuers,
    };
  }
}

class ListAccountAssignmentCreationStatusResponse {
  /// The status object for the account assignment creation operation.
  final List<AccountAssignmentOperationStatusMetadata>?
      accountAssignmentsCreationStatus;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  ListAccountAssignmentCreationStatusResponse({
    this.accountAssignmentsCreationStatus,
    this.nextToken,
  });

  factory ListAccountAssignmentCreationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAccountAssignmentCreationStatusResponse(
      accountAssignmentsCreationStatus:
          (json['AccountAssignmentsCreationStatus'] as List?)
              ?.whereNotNull()
              .map((e) => AccountAssignmentOperationStatusMetadata.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignmentsCreationStatus =
        this.accountAssignmentsCreationStatus;
    final nextToken = this.nextToken;
    return {
      if (accountAssignmentsCreationStatus != null)
        'AccountAssignmentsCreationStatus': accountAssignmentsCreationStatus,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAccountAssignmentDeletionStatusResponse {
  /// The status object for the account assignment deletion operation.
  final List<AccountAssignmentOperationStatusMetadata>?
      accountAssignmentsDeletionStatus;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  ListAccountAssignmentDeletionStatusResponse({
    this.accountAssignmentsDeletionStatus,
    this.nextToken,
  });

  factory ListAccountAssignmentDeletionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAccountAssignmentDeletionStatusResponse(
      accountAssignmentsDeletionStatus:
          (json['AccountAssignmentsDeletionStatus'] as List?)
              ?.whereNotNull()
              .map((e) => AccountAssignmentOperationStatusMetadata.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignmentsDeletionStatus =
        this.accountAssignmentsDeletionStatus;
    final nextToken = this.nextToken;
    return {
      if (accountAssignmentsDeletionStatus != null)
        'AccountAssignmentsDeletionStatus': accountAssignmentsDeletionStatus,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A structure that describes a filter for account assignments.
class ListAccountAssignmentsFilter {
  /// The ID number of an Amazon Web Services account that filters the results in
  /// the response.
  final String? accountId;

  ListAccountAssignmentsFilter({
    this.accountId,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      if (accountId != null) 'AccountId': accountId,
    };
  }
}

class ListAccountAssignmentsForPrincipalResponse {
  /// An array list of the account assignments for the principal.
  final List<AccountAssignmentForPrincipal>? accountAssignments;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListAccountAssignmentsForPrincipalResponse({
    this.accountAssignments,
    this.nextToken,
  });

  factory ListAccountAssignmentsForPrincipalResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAccountAssignmentsForPrincipalResponse(
      accountAssignments: (json['AccountAssignments'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AccountAssignmentForPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignments = this.accountAssignments;
    final nextToken = this.nextToken;
    return {
      if (accountAssignments != null) 'AccountAssignments': accountAssignments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAccountAssignmentsResponse {
  /// The list of assignments that match the input Amazon Web Services account and
  /// permission set.
  final List<AccountAssignment>? accountAssignments;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  ListAccountAssignmentsResponse({
    this.accountAssignments,
    this.nextToken,
  });

  factory ListAccountAssignmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountAssignmentsResponse(
      accountAssignments: (json['AccountAssignments'] as List?)
          ?.whereNotNull()
          .map((e) => AccountAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssignments = this.accountAssignments;
    final nextToken = this.nextToken;
    return {
      if (accountAssignments != null) 'AccountAssignments': accountAssignments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAccountsForProvisionedPermissionSetResponse {
  /// The list of Amazon Web Services <code>AccountIds</code>.
  final List<String>? accountIds;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  ListAccountsForProvisionedPermissionSetResponse({
    this.accountIds,
    this.nextToken,
  });

  factory ListAccountsForProvisionedPermissionSetResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAccountsForProvisionedPermissionSetResponse(
      accountIds: (json['AccountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final nextToken = this.nextToken;
    return {
      if (accountIds != null) 'AccountIds': accountIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApplicationAccessScopesResponse {
  /// An array list of access scopes and their authorized targets that are
  /// associated with the application.
  final List<ScopeDetails> scopes;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListApplicationAccessScopesResponse({
    required this.scopes,
    this.nextToken,
  });

  factory ListApplicationAccessScopesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationAccessScopesResponse(
      scopes: (json['Scopes'] as List)
          .whereNotNull()
          .map((e) => ScopeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scopes = this.scopes;
    final nextToken = this.nextToken;
    return {
      'Scopes': scopes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A structure that describes a filter for application assignments.
class ListApplicationAssignmentsFilter {
  /// The ARN of an application.
  final String? applicationArn;

  ListApplicationAssignmentsFilter({
    this.applicationArn,
  });

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
    };
  }
}

class ListApplicationAssignmentsForPrincipalResponse {
  /// An array list of the application assignments for the specified principal.
  final List<ApplicationAssignmentForPrincipal>? applicationAssignments;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListApplicationAssignmentsForPrincipalResponse({
    this.applicationAssignments,
    this.nextToken,
  });

  factory ListApplicationAssignmentsForPrincipalResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationAssignmentsForPrincipalResponse(
      applicationAssignments: (json['ApplicationAssignments'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationAssignmentForPrincipal.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationAssignments = this.applicationAssignments;
    final nextToken = this.nextToken;
    return {
      if (applicationAssignments != null)
        'ApplicationAssignments': applicationAssignments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApplicationAssignmentsResponse {
  /// The list of users assigned to an application.
  final List<ApplicationAssignment>? applicationAssignments;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListApplicationAssignmentsResponse({
    this.applicationAssignments,
    this.nextToken,
  });

  factory ListApplicationAssignmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationAssignmentsResponse(
      applicationAssignments: (json['ApplicationAssignments'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationAssignments = this.applicationAssignments;
    final nextToken = this.nextToken;
    return {
      if (applicationAssignments != null)
        'ApplicationAssignments': applicationAssignments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApplicationAuthenticationMethodsResponse {
  /// An array list of authentication methods for the specified application.
  final List<AuthenticationMethodItem>? authenticationMethods;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListApplicationAuthenticationMethodsResponse({
    this.authenticationMethods,
    this.nextToken,
  });

  factory ListApplicationAuthenticationMethodsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationAuthenticationMethodsResponse(
      authenticationMethods: (json['AuthenticationMethods'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AuthenticationMethodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationMethods = this.authenticationMethods;
    final nextToken = this.nextToken;
    return {
      if (authenticationMethods != null)
        'AuthenticationMethods': authenticationMethods,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApplicationGrantsResponse {
  /// An array list of structures that describe the requested grants.
  final List<GrantItem> grants;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListApplicationGrantsResponse({
    required this.grants,
    this.nextToken,
  });

  factory ListApplicationGrantsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationGrantsResponse(
      grants: (json['Grants'] as List)
          .whereNotNull()
          .map((e) => GrantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grants = this.grants;
    final nextToken = this.nextToken;
    return {
      'Grants': grants,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApplicationProvidersResponse {
  /// An array list of structures that describe application providers.
  final List<ApplicationProvider>? applicationProviders;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListApplicationProvidersResponse({
    this.applicationProviders,
    this.nextToken,
  });

  factory ListApplicationProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationProvidersResponse(
      applicationProviders: (json['ApplicationProviders'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationProviders = this.applicationProviders;
    final nextToken = this.nextToken;
    return {
      if (applicationProviders != null)
        'ApplicationProviders': applicationProviders,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A structure that describes a filter for applications.
class ListApplicationsFilter {
  /// An Amazon Web Services account ID number that filters the results in the
  /// response.
  final String? applicationAccount;

  /// The ARN of an application provider that can filter the results in the
  /// response.
  final String? applicationProvider;

  ListApplicationsFilter({
    this.applicationAccount,
    this.applicationProvider,
  });

  Map<String, dynamic> toJson() {
    final applicationAccount = this.applicationAccount;
    final applicationProvider = this.applicationProvider;
    return {
      if (applicationAccount != null) 'ApplicationAccount': applicationAccount,
      if (applicationProvider != null)
        'ApplicationProvider': applicationProvider,
    };
  }
}

class ListApplicationsResponse {
  /// Retrieves all applications associated with the instance.
  final List<Application>? applications;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListApplicationsResponse({
    this.applications,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'Applications': applications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCustomerManagedPolicyReferencesInPermissionSetResponse {
  /// Specifies the names and paths of the customer managed policies that you have
  /// attached to your permission set.
  final List<CustomerManagedPolicyReference>? customerManagedPolicyReferences;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  ListCustomerManagedPolicyReferencesInPermissionSetResponse({
    this.customerManagedPolicyReferences,
    this.nextToken,
  });

  factory ListCustomerManagedPolicyReferencesInPermissionSetResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCustomerManagedPolicyReferencesInPermissionSetResponse(
      customerManagedPolicyReferences:
          (json['CustomerManagedPolicyReferences'] as List?)
              ?.whereNotNull()
              .map((e) => CustomerManagedPolicyReference.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedPolicyReferences =
        this.customerManagedPolicyReferences;
    final nextToken = this.nextToken;
    return {
      if (customerManagedPolicyReferences != null)
        'CustomerManagedPolicyReferences': customerManagedPolicyReferences,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInstancesResponse {
  /// Lists the IAM Identity Center instances that the caller has access to.
  final List<InstanceMetadata>? instances;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  ListInstancesResponse({
    this.instances,
    this.nextToken,
  });

  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstancesResponse(
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final nextToken = this.nextToken;
    return {
      if (instances != null) 'Instances': instances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListManagedPoliciesInPermissionSetResponse {
  /// An array of the <a>AttachedManagedPolicy</a> data type object.
  final List<AttachedManagedPolicy>? attachedManagedPolicies;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  ListManagedPoliciesInPermissionSetResponse({
    this.attachedManagedPolicies,
    this.nextToken,
  });

  factory ListManagedPoliciesInPermissionSetResponse.fromJson(
      Map<String, dynamic> json) {
    return ListManagedPoliciesInPermissionSetResponse(
      attachedManagedPolicies: (json['AttachedManagedPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => AttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedManagedPolicies = this.attachedManagedPolicies;
    final nextToken = this.nextToken;
    return {
      if (attachedManagedPolicies != null)
        'AttachedManagedPolicies': attachedManagedPolicies,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPermissionSetProvisioningStatusResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  /// The status object for the permission set provisioning operation.
  final List<PermissionSetProvisioningStatusMetadata>?
      permissionSetsProvisioningStatus;

  ListPermissionSetProvisioningStatusResponse({
    this.nextToken,
    this.permissionSetsProvisioningStatus,
  });

  factory ListPermissionSetProvisioningStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPermissionSetProvisioningStatusResponse(
      nextToken: json['NextToken'] as String?,
      permissionSetsProvisioningStatus:
          (json['PermissionSetsProvisioningStatus'] as List?)
              ?.whereNotNull()
              .map((e) => PermissionSetProvisioningStatusMetadata.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissionSetsProvisioningStatus =
        this.permissionSetsProvisioningStatus;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (permissionSetsProvisioningStatus != null)
        'PermissionSetsProvisioningStatus': permissionSetsProvisioningStatus,
    };
  }
}

class ListPermissionSetsProvisionedToAccountResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  /// Defines the level of access that an Amazon Web Services account has.
  final List<String>? permissionSets;

  ListPermissionSetsProvisionedToAccountResponse({
    this.nextToken,
    this.permissionSets,
  });

  factory ListPermissionSetsProvisionedToAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPermissionSetsProvisionedToAccountResponse(
      nextToken: json['NextToken'] as String?,
      permissionSets: (json['PermissionSets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissionSets = this.permissionSets;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (permissionSets != null) 'PermissionSets': permissionSets,
    };
  }
}

class ListPermissionSetsResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  /// Defines the level of access on an Amazon Web Services account.
  final List<String>? permissionSets;

  ListPermissionSetsResponse({
    this.nextToken,
    this.permissionSets,
  });

  factory ListPermissionSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionSetsResponse(
      nextToken: json['NextToken'] as String?,
      permissionSets: (json['PermissionSets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissionSets = this.permissionSets;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (permissionSets != null) 'PermissionSets': permissionSets,
    };
  }
}

class ListTagsForResourceResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  /// A set of key-value pairs that are used to manage the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTrustedTokenIssuersResponse {
  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  /// An array list of the trusted token issuer configurations.
  final List<TrustedTokenIssuerMetadata>? trustedTokenIssuers;

  ListTrustedTokenIssuersResponse({
    this.nextToken,
    this.trustedTokenIssuers,
  });

  factory ListTrustedTokenIssuersResponse.fromJson(Map<String, dynamic> json) {
    return ListTrustedTokenIssuersResponse(
      nextToken: json['NextToken'] as String?,
      trustedTokenIssuers: (json['TrustedTokenIssuers'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TrustedTokenIssuerMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final trustedTokenIssuers = this.trustedTokenIssuers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (trustedTokenIssuers != null)
        'TrustedTokenIssuers': trustedTokenIssuers,
    };
  }
}

/// A structure that describes configuration settings for a trusted token issuer
/// that supports OpenID Connect (OIDC) and JSON Web Tokens (JWTs).
class OidcJwtConfiguration {
  /// The path of the source attribute in the JWT from the trusted token issuer.
  /// The attribute mapped by this JMESPath expression is compared against the
  /// attribute mapped by <code>IdentityStoreAttributePath</code> when a trusted
  /// token issuer token is exchanged for an IAM Identity Center token.
  final String claimAttributePath;

  /// The path of the destination attribute in a JWT from IAM Identity Center. The
  /// attribute mapped by this JMESPath expression is compared against the
  /// attribute mapped by <code>ClaimAttributePath</code> when a trusted token
  /// issuer token is exchanged for an IAM Identity Center token.
  final String identityStoreAttributePath;

  /// The URL that IAM Identity Center uses for OpenID Discovery. OpenID Discovery
  /// is used to obtain the information required to verify the tokens that the
  /// trusted token issuer generates.
  final String issuerUrl;

  /// The method that the trusted token issuer can use to retrieve the JSON Web
  /// Key Set used to verify a JWT.
  final JwksRetrievalOption jwksRetrievalOption;

  OidcJwtConfiguration({
    required this.claimAttributePath,
    required this.identityStoreAttributePath,
    required this.issuerUrl,
    required this.jwksRetrievalOption,
  });

  factory OidcJwtConfiguration.fromJson(Map<String, dynamic> json) {
    return OidcJwtConfiguration(
      claimAttributePath: json['ClaimAttributePath'] as String,
      identityStoreAttributePath: json['IdentityStoreAttributePath'] as String,
      issuerUrl: json['IssuerUrl'] as String,
      jwksRetrievalOption:
          (json['JwksRetrievalOption'] as String).toJwksRetrievalOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final claimAttributePath = this.claimAttributePath;
    final identityStoreAttributePath = this.identityStoreAttributePath;
    final issuerUrl = this.issuerUrl;
    final jwksRetrievalOption = this.jwksRetrievalOption;
    return {
      'ClaimAttributePath': claimAttributePath,
      'IdentityStoreAttributePath': identityStoreAttributePath,
      'IssuerUrl': issuerUrl,
      'JwksRetrievalOption': jwksRetrievalOption.toValue(),
    };
  }
}

/// A structure that describes updated configuration settings for a trusted
/// token issuer that supports OpenID Connect (OIDC) and JSON Web Tokens (JWTs).
class OidcJwtUpdateConfiguration {
  /// The path of the source attribute in the JWT from the trusted token issuer.
  /// The attribute mapped by this JMESPath expression is compared against the
  /// attribute mapped by <code>IdentityStoreAttributePath</code> when a trusted
  /// token issuer token is exchanged for an IAM Identity Center token.
  final String? claimAttributePath;

  /// The path of the destination attribute in a JWT from IAM Identity Center. The
  /// attribute mapped by this JMESPath expression is compared against the
  /// attribute mapped by <code>ClaimAttributePath</code> when a trusted token
  /// issuer token is exchanged for an IAM Identity Center token.
  final String? identityStoreAttributePath;

  /// The method that the trusted token issuer can use to retrieve the JSON Web
  /// Key Set used to verify a JWT.
  final JwksRetrievalOption? jwksRetrievalOption;

  OidcJwtUpdateConfiguration({
    this.claimAttributePath,
    this.identityStoreAttributePath,
    this.jwksRetrievalOption,
  });

  Map<String, dynamic> toJson() {
    final claimAttributePath = this.claimAttributePath;
    final identityStoreAttributePath = this.identityStoreAttributePath;
    final jwksRetrievalOption = this.jwksRetrievalOption;
    return {
      if (claimAttributePath != null) 'ClaimAttributePath': claimAttributePath,
      if (identityStoreAttributePath != null)
        'IdentityStoreAttributePath': identityStoreAttributePath,
      if (jwksRetrievalOption != null)
        'JwksRetrievalOption': jwksRetrievalOption.toValue(),
    };
  }
}

/// Filters the operation status list based on the passed attribute value.
class OperationStatusFilter {
  /// Filters the list operations result based on the status attribute.
  final StatusValues? status;

  OperationStatusFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// An entity that contains IAM policies.
class PermissionSet {
  /// The date that the permission set was created.
  final DateTime? createdDate;

  /// The description of the <a>PermissionSet</a>.
  final String? description;

  /// The name of the permission set.
  final String? name;

  /// The ARN of the permission set. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? permissionSetArn;

  /// Used to redirect users within the application during the federation
  /// authentication process.
  final String? relayState;

  /// The length of time that the application user sessions are valid for in the
  /// ISO-8601 standard.
  final String? sessionDuration;

  PermissionSet({
    this.createdDate,
    this.description,
    this.name,
    this.permissionSetArn,
    this.relayState,
    this.sessionDuration,
  });

  factory PermissionSet.fromJson(Map<String, dynamic> json) {
    return PermissionSet(
      createdDate: timeStampFromJson(json['CreatedDate']),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      permissionSetArn: json['PermissionSetArn'] as String?,
      relayState: json['RelayState'] as String?,
      sessionDuration: json['SessionDuration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final name = this.name;
    final permissionSetArn = this.permissionSetArn;
    final relayState = this.relayState;
    final sessionDuration = this.sessionDuration;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (permissionSetArn != null) 'PermissionSetArn': permissionSetArn,
      if (relayState != null) 'RelayState': relayState,
      if (sessionDuration != null) 'SessionDuration': sessionDuration,
    };
  }
}

/// A structure that is used to provide the status of the provisioning operation
/// for a specified permission set.
class PermissionSetProvisioningStatus {
  /// The identifier of the Amazon Web Services account from which to list the
  /// assignments.
  final String? accountId;

  /// The date that the permission set was created.
  final DateTime? createdDate;

  /// The message that contains an error or exception in case of an operation
  /// failure.
  final String? failureReason;

  /// The ARN of the permission set that is being provisioned. For more
  /// information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  final String? permissionSetArn;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  final String? requestId;

  /// The status of the permission set provisioning process.
  final StatusValues? status;

  PermissionSetProvisioningStatus({
    this.accountId,
    this.createdDate,
    this.failureReason,
    this.permissionSetArn,
    this.requestId,
    this.status,
  });

  factory PermissionSetProvisioningStatus.fromJson(Map<String, dynamic> json) {
    return PermissionSetProvisioningStatus(
      accountId: json['AccountId'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      failureReason: json['FailureReason'] as String?,
      permissionSetArn: json['PermissionSetArn'] as String?,
      requestId: json['RequestId'] as String?,
      status: (json['Status'] as String?)?.toStatusValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdDate = this.createdDate;
    final failureReason = this.failureReason;
    final permissionSetArn = this.permissionSetArn;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (failureReason != null) 'FailureReason': failureReason,
      if (permissionSetArn != null) 'PermissionSetArn': permissionSetArn,
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Provides information about the permission set provisioning status.
class PermissionSetProvisioningStatusMetadata {
  /// The date that the permission set was created.
  final DateTime? createdDate;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  final String? requestId;

  /// The status of the permission set provisioning process.
  final StatusValues? status;

  PermissionSetProvisioningStatusMetadata({
    this.createdDate,
    this.requestId,
    this.status,
  });

  factory PermissionSetProvisioningStatusMetadata.fromJson(
      Map<String, dynamic> json) {
    return PermissionSetProvisioningStatusMetadata(
      createdDate: timeStampFromJson(json['CreatedDate']),
      requestId: json['RequestId'] as String?,
      status: (json['Status'] as String?)?.toStatusValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Specifies the configuration of the Amazon Web Services managed or customer
/// managed policy that you want to set as a permissions boundary. Specify
/// either <code>CustomerManagedPolicyReference</code> to use the name and path
/// of a customer managed policy, or <code>ManagedPolicyArn</code> to use the
/// ARN of an Amazon Web Services managed policy. A permissions boundary
/// represents the maximum permissions that any policy can grant your role. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
/// boundaries for IAM entities</a> in the <i>IAM User Guide</i>.
/// <important>
/// Policies used as permissions boundaries don't provide permissions. You must
/// also attach an IAM policy to the role. To learn how the effective
/// permissions for a role are evaluated, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html">IAM
/// JSON policy evaluation logic</a> in the <i>IAM User Guide</i>.
/// </important>
class PermissionsBoundary {
  /// Specifies the name and path of a customer managed policy. You must have an
  /// IAM policy that matches the name and path in each Amazon Web Services
  /// account where you want to deploy your permission set.
  final CustomerManagedPolicyReference? customerManagedPolicyReference;

  /// The Amazon Web Services managed policy ARN that you want to attach to a
  /// permission set as a permissions boundary.
  final String? managedPolicyArn;

  PermissionsBoundary({
    this.customerManagedPolicyReference,
    this.managedPolicyArn,
  });

  factory PermissionsBoundary.fromJson(Map<String, dynamic> json) {
    return PermissionsBoundary(
      customerManagedPolicyReference: json['CustomerManagedPolicyReference'] !=
              null
          ? CustomerManagedPolicyReference.fromJson(
              json['CustomerManagedPolicyReference'] as Map<String, dynamic>)
          : null,
      managedPolicyArn: json['ManagedPolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedPolicyReference = this.customerManagedPolicyReference;
    final managedPolicyArn = this.managedPolicyArn;
    return {
      if (customerManagedPolicyReference != null)
        'CustomerManagedPolicyReference': customerManagedPolicyReference,
      if (managedPolicyArn != null) 'ManagedPolicyArn': managedPolicyArn,
    };
  }
}

/// A structure that describes the options for the access portal associated with
/// an application.
class PortalOptions {
  /// A structure that describes the sign-in options for the access portal.
  final SignInOptions? signInOptions;

  /// Indicates whether this application is visible in the access portal.
  final ApplicationVisibility? visibility;

  PortalOptions({
    this.signInOptions,
    this.visibility,
  });

  factory PortalOptions.fromJson(Map<String, dynamic> json) {
    return PortalOptions(
      signInOptions: json['SignInOptions'] != null
          ? SignInOptions.fromJson(
              json['SignInOptions'] as Map<String, dynamic>)
          : null,
      visibility: (json['Visibility'] as String?)?.toApplicationVisibility(),
    );
  }

  Map<String, dynamic> toJson() {
    final signInOptions = this.signInOptions;
    final visibility = this.visibility;
    return {
      if (signInOptions != null) 'SignInOptions': signInOptions,
      if (visibility != null) 'Visibility': visibility.toValue(),
    };
  }
}

enum PrincipalType {
  user,
  group,
}

extension PrincipalTypeValueExtension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.user:
        return 'USER';
      case PrincipalType.group:
        return 'GROUP';
    }
  }
}

extension PrincipalTypeFromString on String {
  PrincipalType toPrincipalType() {
    switch (this) {
      case 'USER':
        return PrincipalType.user;
      case 'GROUP':
        return PrincipalType.group;
    }
    throw Exception('$this is not known in enum PrincipalType');
  }
}

class ProvisionPermissionSetResponse {
  /// The status object for the permission set provisioning operation.
  final PermissionSetProvisioningStatus? permissionSetProvisioningStatus;

  ProvisionPermissionSetResponse({
    this.permissionSetProvisioningStatus,
  });

  factory ProvisionPermissionSetResponse.fromJson(Map<String, dynamic> json) {
    return ProvisionPermissionSetResponse(
      permissionSetProvisioningStatus:
          json['PermissionSetProvisioningStatus'] != null
              ? PermissionSetProvisioningStatus.fromJson(
                  json['PermissionSetProvisioningStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionSetProvisioningStatus =
        this.permissionSetProvisioningStatus;
    return {
      if (permissionSetProvisioningStatus != null)
        'PermissionSetProvisioningStatus': permissionSetProvisioningStatus,
    };
  }
}

enum ProvisionTargetType {
  awsAccount,
  allProvisionedAccounts,
}

extension ProvisionTargetTypeValueExtension on ProvisionTargetType {
  String toValue() {
    switch (this) {
      case ProvisionTargetType.awsAccount:
        return 'AWS_ACCOUNT';
      case ProvisionTargetType.allProvisionedAccounts:
        return 'ALL_PROVISIONED_ACCOUNTS';
    }
  }
}

extension ProvisionTargetTypeFromString on String {
  ProvisionTargetType toProvisionTargetType() {
    switch (this) {
      case 'AWS_ACCOUNT':
        return ProvisionTargetType.awsAccount;
      case 'ALL_PROVISIONED_ACCOUNTS':
        return ProvisionTargetType.allProvisionedAccounts;
    }
    throw Exception('$this is not known in enum ProvisionTargetType');
  }
}

enum ProvisioningStatus {
  latestPermissionSetProvisioned,
  latestPermissionSetNotProvisioned,
}

extension ProvisioningStatusValueExtension on ProvisioningStatus {
  String toValue() {
    switch (this) {
      case ProvisioningStatus.latestPermissionSetProvisioned:
        return 'LATEST_PERMISSION_SET_PROVISIONED';
      case ProvisioningStatus.latestPermissionSetNotProvisioned:
        return 'LATEST_PERMISSION_SET_NOT_PROVISIONED';
    }
  }
}

extension ProvisioningStatusFromString on String {
  ProvisioningStatus toProvisioningStatus() {
    switch (this) {
      case 'LATEST_PERMISSION_SET_PROVISIONED':
        return ProvisioningStatus.latestPermissionSetProvisioned;
      case 'LATEST_PERMISSION_SET_NOT_PROVISIONED':
        return ProvisioningStatus.latestPermissionSetNotProvisioned;
    }
    throw Exception('$this is not known in enum ProvisioningStatus');
  }
}

class PutApplicationAssignmentConfigurationResponse {
  PutApplicationAssignmentConfigurationResponse();

  factory PutApplicationAssignmentConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutApplicationAssignmentConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutInlinePolicyToPermissionSetResponse {
  PutInlinePolicyToPermissionSetResponse();

  factory PutInlinePolicyToPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return PutInlinePolicyToPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutPermissionsBoundaryToPermissionSetResponse {
  PutPermissionsBoundaryToPermissionSetResponse();

  factory PutPermissionsBoundaryToPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return PutPermissionsBoundaryToPermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that defines configuration settings for an application that
/// supports the OAuth 2.0 Refresh Token Grant.
class RefreshTokenGrant {
  RefreshTokenGrant();

  factory RefreshTokenGrant.fromJson(Map<String, dynamic> _) {
    return RefreshTokenGrant();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that describes the configuration of a resource server.
class ResourceServerConfig {
  /// A list of the IAM Identity Center access scopes that are associated with
  /// this resource server.
  final Map<String, ResourceServerScopeDetails>? scopes;

  ResourceServerConfig({
    this.scopes,
  });

  factory ResourceServerConfig.fromJson(Map<String, dynamic> json) {
    return ResourceServerConfig(
      scopes: (json['Scopes'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k, ResourceServerScopeDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final scopes = this.scopes;
    return {
      if (scopes != null) 'Scopes': scopes,
    };
  }
}

/// A structure that describes details for an IAM Identity Center access scope
/// that is associated with a resource server.
class ResourceServerScopeDetails {
  /// The title of an access scope for a resource server.
  final String? detailedTitle;

  /// The description of an access scope for a resource server.
  final String? longDescription;

  ResourceServerScopeDetails({
    this.detailedTitle,
    this.longDescription,
  });

  factory ResourceServerScopeDetails.fromJson(Map<String, dynamic> json) {
    return ResourceServerScopeDetails(
      detailedTitle: json['DetailedTitle'] as String?,
      longDescription: json['LongDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detailedTitle = this.detailedTitle;
    final longDescription = this.longDescription;
    return {
      if (detailedTitle != null) 'DetailedTitle': detailedTitle,
      if (longDescription != null) 'LongDescription': longDescription,
    };
  }
}

/// A structure that describes an IAM Identity Center access scope and its
/// authorized targets.
class ScopeDetails {
  /// The name of the access scope.
  final String scope;

  /// An array list of ARNs of applications.
  final List<String>? authorizedTargets;

  ScopeDetails({
    required this.scope,
    this.authorizedTargets,
  });

  factory ScopeDetails.fromJson(Map<String, dynamic> json) {
    return ScopeDetails(
      scope: json['Scope'] as String,
      authorizedTargets: (json['AuthorizedTargets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scope = this.scope;
    final authorizedTargets = this.authorizedTargets;
    return {
      'Scope': scope,
      if (authorizedTargets != null) 'AuthorizedTargets': authorizedTargets,
    };
  }
}

/// A structure that describes the sign-in options for an application portal.
class SignInOptions {
  /// This determines how IAM Identity Center navigates the user to the target
  /// application. It can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>APPLICATION</code>: IAM Identity Center redirects the customer to the
  /// configured <code>ApplicationUrl</code>.
  /// </li>
  /// <li>
  /// <code>IDENTITY_CENTER</code>: IAM Identity Center uses SAML
  /// identity-provider initiated authentication to sign the customer directly
  /// into a SAML-based application.
  /// </li>
  /// </ul>
  final SignInOrigin origin;

  /// The URL that accepts authentication requests for an application. This is a
  /// required parameter if the <code>Origin</code> parameter is
  /// <code>APPLICATION</code>.
  final String? applicationUrl;

  SignInOptions({
    required this.origin,
    this.applicationUrl,
  });

  factory SignInOptions.fromJson(Map<String, dynamic> json) {
    return SignInOptions(
      origin: (json['Origin'] as String).toSignInOrigin(),
      applicationUrl: json['ApplicationUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final origin = this.origin;
    final applicationUrl = this.applicationUrl;
    return {
      'Origin': origin.toValue(),
      if (applicationUrl != null) 'ApplicationUrl': applicationUrl,
    };
  }
}

enum SignInOrigin {
  identityCenter,
  application,
}

extension SignInOriginValueExtension on SignInOrigin {
  String toValue() {
    switch (this) {
      case SignInOrigin.identityCenter:
        return 'IDENTITY_CENTER';
      case SignInOrigin.application:
        return 'APPLICATION';
    }
  }
}

extension SignInOriginFromString on String {
  SignInOrigin toSignInOrigin() {
    switch (this) {
      case 'IDENTITY_CENTER':
        return SignInOrigin.identityCenter;
      case 'APPLICATION':
        return SignInOrigin.application;
    }
    throw Exception('$this is not known in enum SignInOrigin');
  }
}

enum StatusValues {
  inProgress,
  failed,
  succeeded,
}

extension StatusValuesValueExtension on StatusValues {
  String toValue() {
    switch (this) {
      case StatusValues.inProgress:
        return 'IN_PROGRESS';
      case StatusValues.failed:
        return 'FAILED';
      case StatusValues.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension StatusValuesFromString on String {
  StatusValues toStatusValues() {
    switch (this) {
      case 'IN_PROGRESS':
        return StatusValues.inProgress;
      case 'FAILED':
        return StatusValues.failed;
      case 'SUCCEEDED':
        return StatusValues.succeeded;
    }
    throw Exception('$this is not known in enum StatusValues');
  }
}

/// A set of key-value pairs that are used to manage the resource. Tags can only
/// be applied to permission sets and cannot be applied to corresponding roles
/// that IAM Identity Center creates in Amazon Web Services accounts.
class Tag {
  /// The key for the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TargetType {
  awsAccount,
}

extension TargetTypeValueExtension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.awsAccount:
        return 'AWS_ACCOUNT';
    }
  }
}

extension TargetTypeFromString on String {
  TargetType toTargetType() {
    switch (this) {
      case 'AWS_ACCOUNT':
        return TargetType.awsAccount;
    }
    throw Exception('$this is not known in enum TargetType');
  }
}

/// A structure that defines configuration settings for an application that
/// supports the OAuth 2.0 Token Exchange Grant.
class TokenExchangeGrant {
  TokenExchangeGrant();

  factory TokenExchangeGrant.fromJson(Map<String, dynamic> _) {
    return TokenExchangeGrant();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that describes the configuration of a trusted token issuer. The
/// structure and available settings are determined by the type of the trusted
/// token issuer.
class TrustedTokenIssuerConfiguration {
  /// A structure that describes the settings for a trusted token issuer that
  /// works with OpenID Connect (OIDC) by using JSON Web Tokens (JWT).
  final OidcJwtConfiguration? oidcJwtConfiguration;

  TrustedTokenIssuerConfiguration({
    this.oidcJwtConfiguration,
  });

  factory TrustedTokenIssuerConfiguration.fromJson(Map<String, dynamic> json) {
    return TrustedTokenIssuerConfiguration(
      oidcJwtConfiguration: json['OidcJwtConfiguration'] != null
          ? OidcJwtConfiguration.fromJson(
              json['OidcJwtConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oidcJwtConfiguration = this.oidcJwtConfiguration;
    return {
      if (oidcJwtConfiguration != null)
        'OidcJwtConfiguration': oidcJwtConfiguration,
    };
  }
}

/// A structure that describes a trusted token issuer.
class TrustedTokenIssuerMetadata {
  /// The name of the trusted token issuer configuration in the instance of IAM
  /// Identity Center.
  final String? name;

  /// The ARN of the trusted token issuer configuration in the instance of IAM
  /// Identity Center.
  final String? trustedTokenIssuerArn;

  /// The type of trusted token issuer.
  final TrustedTokenIssuerType? trustedTokenIssuerType;

  TrustedTokenIssuerMetadata({
    this.name,
    this.trustedTokenIssuerArn,
    this.trustedTokenIssuerType,
  });

  factory TrustedTokenIssuerMetadata.fromJson(Map<String, dynamic> json) {
    return TrustedTokenIssuerMetadata(
      name: json['Name'] as String?,
      trustedTokenIssuerArn: json['TrustedTokenIssuerArn'] as String?,
      trustedTokenIssuerType: (json['TrustedTokenIssuerType'] as String?)
          ?.toTrustedTokenIssuerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final trustedTokenIssuerArn = this.trustedTokenIssuerArn;
    final trustedTokenIssuerType = this.trustedTokenIssuerType;
    return {
      if (name != null) 'Name': name,
      if (trustedTokenIssuerArn != null)
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
      if (trustedTokenIssuerType != null)
        'TrustedTokenIssuerType': trustedTokenIssuerType.toValue(),
    };
  }
}

enum TrustedTokenIssuerType {
  oidcJwt,
}

extension TrustedTokenIssuerTypeValueExtension on TrustedTokenIssuerType {
  String toValue() {
    switch (this) {
      case TrustedTokenIssuerType.oidcJwt:
        return 'OIDC_JWT';
    }
  }
}

extension TrustedTokenIssuerTypeFromString on String {
  TrustedTokenIssuerType toTrustedTokenIssuerType() {
    switch (this) {
      case 'OIDC_JWT':
        return TrustedTokenIssuerType.oidcJwt;
    }
    throw Exception('$this is not known in enum TrustedTokenIssuerType');
  }
}

/// A structure that contains details to be updated for a trusted token issuer
/// configuration. The structure and settings that you can include depend on the
/// type of the trusted token issuer being updated.
class TrustedTokenIssuerUpdateConfiguration {
  /// A structure that describes an updated configuration for a trusted token
  /// issuer that uses OpenID Connect (OIDC) with JSON web tokens (JWT).
  final OidcJwtUpdateConfiguration? oidcJwtConfiguration;

  TrustedTokenIssuerUpdateConfiguration({
    this.oidcJwtConfiguration,
  });

  Map<String, dynamic> toJson() {
    final oidcJwtConfiguration = this.oidcJwtConfiguration;
    return {
      if (oidcJwtConfiguration != null)
        'OidcJwtConfiguration': oidcJwtConfiguration,
    };
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

/// A structure that describes the options for the access portal associated with
/// an application that can be updated.
class UpdateApplicationPortalOptions {
  final SignInOptions? signInOptions;

  UpdateApplicationPortalOptions({
    this.signInOptions,
  });

  Map<String, dynamic> toJson() {
    final signInOptions = this.signInOptions;
    return {
      if (signInOptions != null) 'SignInOptions': signInOptions,
    };
  }
}

class UpdateApplicationResponse {
  UpdateApplicationResponse();

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateInstanceAccessControlAttributeConfigurationResponse {
  UpdateInstanceAccessControlAttributeConfigurationResponse();

  factory UpdateInstanceAccessControlAttributeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateInstanceAccessControlAttributeConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateInstanceResponse {
  UpdateInstanceResponse();

  factory UpdateInstanceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdatePermissionSetResponse {
  UpdatePermissionSetResponse();

  factory UpdatePermissionSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePermissionSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTrustedTokenIssuerResponse {
  UpdateTrustedTokenIssuerResponse();

  factory UpdateTrustedTokenIssuerResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTrustedTokenIssuerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
