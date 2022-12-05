// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

class SSOAdmin {
  final _s.JsonProtocol _protocol;
  SSOAdmin({
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

  /// Attaches an IAM managed policy ARN to a permission set.
  /// <note>
  /// If the permission set is already referenced by one or more account
  /// assignments, you will need to call <code> <a>ProvisionPermissionSet</a>
  /// </code> after this action to apply the corresponding IAM policy updates to
  /// all assigned accounts.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [managedPolicyArn] :
  /// The IAM managed policy ARN to be attached to a permission set.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <a>PermissionSet</a> that the managed policy should be
  /// attached to.
  Future<void> attachManagedPolicyToPermissionSet({
    required String instanceArn,
    required String managedPolicyArn,
    required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(managedPolicyArn, 'managedPolicyArn');
    _s.validateStringLength(
      'managedPolicyArn',
      managedPolicyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Assigns access to a principal for a specified AWS account using a
  /// specified permission set.
  /// <note>
  /// The term <i>principal</i> here refers to a user or group that is defined
  /// in AWS SSO.
  /// </note> <note>
  /// As part of a successful <code>CreateAccountAssignment</code> call, the
  /// specified permission set will automatically be provisioned to the account
  /// in the form of an IAM policy attached to the SSO-created IAM role. If the
  /// permission set is subsequently updated, the corresponding IAM policies
  /// attached to roles in your accounts will not be updated automatically. In
  /// this case, you will need to call <code> <a>ProvisionPermissionSet</a>
  /// </code> to make these updates.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that the admin wants to grant the principal
  /// access to.
  ///
  /// Parameter [principalId] :
  /// An identifier for an object in AWS SSO, such as a user or group.
  /// PrincipalIds are GUIDs (For example,
  /// f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about
  /// PrincipalIds in AWS SSO, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">AWS SSO
  /// Identity Store API Reference</a>.
  ///
  /// Parameter [principalType] :
  /// The entity type for which the assignment will be created.
  ///
  /// Parameter [targetId] :
  /// TargetID is an AWS account identifier, typically a 10-12 digit string (For
  /// example, 123456789012).
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalId, 'principalId');
    _s.validateStringLength(
      'principalId',
      principalId,
      1,
      47,
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalType, 'principalType');
    ArgumentError.checkNotNull(targetId, 'targetId');
    ArgumentError.checkNotNull(targetType, 'targetType');
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

  /// Enables the attributes-based access control (ABAC) feature for the
  /// specified AWS SSO instance. You can also specify new attributes to add to
  /// your ABAC configuration during the enabling process. For more information
  /// about ABAC, see <a
  /// href="/singlesignon/latest/userguide/abac.html">Attribute-Based Access
  /// Control</a> in the <i>AWS SSO User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceAccessControlAttributeConfiguration] :
  /// Specifies the AWS SSO identity store attributes to add to your ABAC
  /// configuration. When using an external identity provider as an identity
  /// source, you can pass attributes through the SAML assertion as an
  /// alternative to configuring attributes from the AWS SSO identity store. If
  /// a SAML assertion passes any of these attributes, AWS SSO will replace the
  /// attribute value with the value from the AWS SSO identity store.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  Future<void> createInstanceAccessControlAttributeConfiguration({
    required InstanceAccessControlAttributeConfiguration
        instanceAccessControlAttributeConfiguration,
    required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(instanceAccessControlAttributeConfiguration,
        'instanceAccessControlAttributeConfiguration');
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Creates a permission set within a specified SSO instance.
  /// <note>
  /// To grant users and groups access to AWS account resources, use <code>
  /// <a>CreateAccountAssignment</a> </code>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      700,
    );
    _s.validateStringLength(
      'relayState',
      relayState,
      1,
      240,
    );
    _s.validateStringLength(
      'sessionDuration',
      sessionDuration,
      1,
      100,
    );
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

  /// Deletes a principal's access from a specified AWS account using a
  /// specified permission set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that will be used to remove access.
  ///
  /// Parameter [principalId] :
  /// An identifier for an object in AWS SSO, such as a user or group.
  /// PrincipalIds are GUIDs (For example,
  /// f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about
  /// PrincipalIds in AWS SSO, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">AWS SSO
  /// Identity Store API Reference</a>.
  ///
  /// Parameter [principalType] :
  /// The entity type for which the assignment will be deleted.
  ///
  /// Parameter [targetId] :
  /// TargetID is an AWS account identifier, typically a 10-12 digit string (For
  /// example, 123456789012).
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalId, 'principalId');
    _s.validateStringLength(
      'principalId',
      principalId,
      1,
      47,
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalType, 'principalType');
    ArgumentError.checkNotNull(targetId, 'targetId');
    ArgumentError.checkNotNull(targetType, 'targetType');
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

  /// Deletes the inline policy from a specified permission set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that will be used to remove access.
  Future<void> deleteInlinePolicyFromPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Disables the attributes-based access control (ABAC) feature for the
  /// specified AWS SSO instance and deletes all of the attribute mappings that
  /// have been configured. Once deleted, any attributes that are received from
  /// an identity source and any custom attributes you have previously
  /// configured will not be passed. For more information about ABAC, see <a
  /// href="/singlesignon/latest/userguide/abac.html">Attribute-Based Access
  /// Control</a> in the <i>AWS SSO User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  Future<void> deleteInstanceAccessControlAttributeConfiguration({
    required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set that should be deleted.
  Future<void> deletePermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Describes the status of the assignment creation request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accountAssignmentCreationRequestId] :
  /// The identifier that is used to track the request operation progress.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<DescribeAccountAssignmentCreationStatusResponse>
      describeAccountAssignmentCreationStatus({
    required String accountAssignmentCreationRequestId,
    required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(accountAssignmentCreationRequestId,
        'accountAssignmentCreationRequestId');
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accountAssignmentDeletionRequestId] :
  /// The identifier that is used to track the request operation progress.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<DescribeAccountAssignmentDeletionStatusResponse>
      describeAccountAssignmentDeletionStatus({
    required String accountAssignmentDeletionRequestId,
    required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(accountAssignmentDeletionRequestId,
        'accountAssignmentDeletionRequestId');
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Returns the list of AWS SSO identity store attributes that have been
  /// configured to work with attributes-based access control (ABAC) for the
  /// specified AWS SSO instance. This will not return attributes configured and
  /// sent by an external identity provider. For more information about ABAC,
  /// see <a href="/singlesignon/latest/userguide/abac.html">Attribute-Based
  /// Access Control</a> in the <i>AWS SSO User Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  Future<DescribeInstanceAccessControlAttributeConfigurationResponse>
      describeInstanceAccessControlAttributeConfiguration({
    required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  Future<DescribePermissionSetResponse> describePermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [provisionPermissionSetRequestId] :
  /// The identifier that is provided by the <a>ProvisionPermissionSet</a> call
  /// to retrieve the current status of the provisioning workflow.
  Future<DescribePermissionSetProvisioningStatusResponse>
      describePermissionSetProvisioningStatus({
    required String instanceArn,
    required String provisionPermissionSetRequestId,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisionPermissionSetRequestId, 'provisionPermissionSetRequestId');
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

  /// Detaches the attached IAM managed policy ARN from the specified permission
  /// set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [managedPolicyArn] :
  /// The IAM managed policy ARN to be attached to a permission set.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <a>PermissionSet</a> from which the policy should be
  /// detached.
  Future<void> detachManagedPolicyFromPermissionSet({
    required String instanceArn,
    required String managedPolicyArn,
    required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(managedPolicyArn, 'managedPolicyArn');
    _s.validateStringLength(
      'managedPolicyArn',
      managedPolicyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Obtains the inline policy assigned to the permission set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  Future<GetInlinePolicyForPermissionSetResponse>
      getInlinePolicyForPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Lists the status of the AWS account assignment creation requests for a
  /// specified SSO instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
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
      0,
      2048,
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

  /// Lists the status of the AWS account assignment deletion requests for a
  /// specified SSO instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
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
      0,
      2048,
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

  /// Lists the assignee of the specified AWS account with the specified
  /// permission set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accountId] :
  /// The identifier of the AWS account from which to list the assignments.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
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
      0,
      2048,
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

  /// Lists all the AWS accounts where the specified permission set is
  /// provisioned.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the <a>PermissionSet</a> from which the associated AWS accounts
  /// will be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display for the <a>PermissionSet</a>.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  ///
  /// Parameter [provisioningStatus] :
  /// The permission set provisioning status for an AWS account.
  Future<ListAccountsForProvisionedPermissionSetResponse>
      listAccountsForProvisionedPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    int? maxResults,
    String? nextToken,
    ProvisioningStatus? provisioningStatus,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
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
      0,
      2048,
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

  /// Lists the SSO instances that the caller has access to.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
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

  /// Lists the IAM managed policy that is attached to a specified permission
  /// set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
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
      0,
      2048,
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
  /// specified SSO instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
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
      0,
      2048,
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

  /// Lists the <a>PermissionSet</a>s in an SSO instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
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
      0,
      2048,
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

  /// Lists all the permission sets that are provisioned to a specified AWS
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accountId] :
  /// The identifier of the AWS account from which to list the assignments.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
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
      0,
      2048,
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource with the tags to be listed.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the list API. Initially the value is null. Use
  /// the output of previous API calls to make subsequent calls.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String instanceArn,
    required String resourceArn,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      10,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
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
        'InstanceArn': instanceArn,
        'ResourceArn': resourceArn,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// The process by which a specified permission set is provisioned to the
  /// specified target.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  ///
  /// Parameter [targetType] :
  /// The entity type for which the assignment will be created.
  ///
  /// Parameter [targetId] :
  /// TargetID is an AWS account identifier, typically a 10-12 digit string (For
  /// example, 123456789012).
  Future<ProvisionPermissionSetResponse> provisionPermissionSet({
    required String instanceArn,
    required String permissionSetArn,
    required ProvisionTargetType targetType,
    String? targetId,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetType, 'targetType');
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

  /// Attaches an IAM inline policy to a permission set.
  /// <note>
  /// If the permission set is already referenced by one or more account
  /// assignments, you will need to call <code> <a>ProvisionPermissionSet</a>
  /// </code> after this action to apply the corresponding IAM policy updates to
  /// all assigned accounts.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inlinePolicy] :
  /// The IAM inline policy to attach to a <a>PermissionSet</a>.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [permissionSetArn] :
  /// The ARN of the permission set.
  Future<void> putInlinePolicyToPermissionSet({
    required String inlinePolicy,
    required String instanceArn,
    required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(inlinePolicy, 'inlinePolicy');
    _s.validateStringLength(
      'inlinePolicy',
      inlinePolicy,
      1,
      10240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
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

  /// Associates a set of tags with a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource with the tags to be listed.
  ///
  /// Parameter [tags] :
  /// A set of key-value pairs that are used to manage the resource.
  Future<void> tagResource({
    required String instanceArn,
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      10,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
        'InstanceArn': instanceArn,
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Disassociates a set of tags from a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource with the tags to be listed.
  ///
  /// Parameter [tagKeys] :
  /// The keys of tags that are attached to the resource.
  Future<void> untagResource({
    required String instanceArn,
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      10,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
        'InstanceArn': instanceArn,
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the AWS SSO identity store attributes to use with the AWS SSO
  /// instance for attributes-based access control (ABAC). When using an
  /// external identity provider as an identity source, you can pass attributes
  /// through the SAML assertion as an alternative to configuring attributes
  /// from the AWS SSO identity store. If a SAML assertion passes any of these
  /// attributes, AWS SSO will replace the attribute value with the value from
  /// the AWS SSO identity store. For more information about ABAC, see <a
  /// href="/singlesignon/latest/userguide/abac.html">Attribute-Based Access
  /// Control</a> in the <i>AWS SSO User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceAccessControlAttributeConfiguration] :
  /// Updates the attributes for your ABAC configuration.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  Future<void> updateInstanceAccessControlAttributeConfiguration({
    required InstanceAccessControlAttributeConfiguration
        instanceAccessControlAttributeConfiguration,
    required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(instanceAccessControlAttributeConfiguration,
        'instanceAccessControlAttributeConfiguration');
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the SSO instance under which the operation will be executed.
  /// For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource
  /// Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
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
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionSetArn, 'permissionSetArn');
    _s.validateStringLength(
      'permissionSetArn',
      permissionSetArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      700,
    );
    _s.validateStringLength(
      'relayState',
      relayState,
      1,
      240,
    );
    _s.validateStringLength(
      'sessionDuration',
      sessionDuration,
      1,
      100,
    );
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
}

/// These are AWS SSO identity store attributes that you can configure for use
/// in attributes-based access control (ABAC). You can create permission
/// policies that determine who can access your AWS resources based upon the
/// configured attribute value(s). When you enable ABAC and specify
/// AccessControlAttributes, AWS SSO passes the attribute(s) value of the
/// authenticated user into IAM for use in policy evaluation.
class AccessControlAttribute {
  /// The name of the attribute associated with your identities in your identity
  /// source. This is used to map a specified attribute in your identity source
  /// with an attribute in AWS SSO.
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

/// The value used for mapping a specified attribute to an identity source.
class AccessControlAttributeValue {
  /// The identity source to use when mapping a specified attribute to AWS SSO.
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
/// AWS account with a specified permission set.
/// <note>
/// The term <i>principal</i> here refers to a user or group that is defined in
/// AWS SSO.
/// </note>
class AccountAssignment {
  /// The identifier of the AWS account.
  final String? accountId;

  /// The ARN of the permission set. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  final String? permissionSetArn;

  /// An identifier for an object in AWS SSO, such as a user or group.
  /// PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6).
  /// For more information about PrincipalIds in AWS SSO, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">AWS SSO
  /// Identity Store API Reference</a>.
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
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  final String? permissionSetArn;

  /// An identifier for an object in AWS SSO, such as a user or group.
  /// PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6).
  /// For more information about PrincipalIds in AWS SSO, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">AWS SSO
  /// Identity Store API Reference</a>.
  final String? principalId;

  /// The entity type for which the assignment will be created.
  final PrincipalType? principalType;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  final String? requestId;

  /// The status of the permission set provisioning process.
  final StatusValues? status;

  /// TargetID is an AWS account identifier, typically a 10-12 digit string (For
  /// example, 123456789012).
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
}

class AttachManagedPolicyToPermissionSetResponse {
  AttachManagedPolicyToPermissionSetResponse();
  factory AttachManagedPolicyToPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return AttachManagedPolicyToPermissionSetResponse();
  }
}

/// A structure that stores the details of the IAM managed policy.
class AttachedManagedPolicy {
  /// The ARN of the IAM managed policy. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  final String? arn;

  /// The name of the IAM managed policy.
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
}

class CreateInstanceAccessControlAttributeConfigurationResponse {
  CreateInstanceAccessControlAttributeConfigurationResponse();
  factory CreateInstanceAccessControlAttributeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateInstanceAccessControlAttributeConfigurationResponse();
  }
}

class CreatePermissionSetResponse {
  /// Defines the level of access on an AWS account.
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
}

class DeleteInlinePolicyFromPermissionSetResponse {
  DeleteInlinePolicyFromPermissionSetResponse();
  factory DeleteInlinePolicyFromPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteInlinePolicyFromPermissionSetResponse();
  }
}

class DeleteInstanceAccessControlAttributeConfigurationResponse {
  DeleteInstanceAccessControlAttributeConfigurationResponse();
  factory DeleteInstanceAccessControlAttributeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteInstanceAccessControlAttributeConfigurationResponse();
  }
}

class DeletePermissionSetResponse {
  DeletePermissionSetResponse();
  factory DeletePermissionSetResponse.fromJson(Map<String, dynamic> _) {
    return DeletePermissionSetResponse();
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
}

class DescribeInstanceAccessControlAttributeConfigurationResponse {
  /// Gets the list of AWS SSO identity store attributes added to your ABAC
  /// configuration.
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
}

class DescribePermissionSetResponse {
  /// Describes the level of access on an AWS account.
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
}

class DetachManagedPolicyFromPermissionSetResponse {
  DetachManagedPolicyFromPermissionSetResponse();
  factory DetachManagedPolicyFromPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return DetachManagedPolicyFromPermissionSetResponse();
  }
}

class GetInlinePolicyForPermissionSetResponse {
  /// The IAM inline policy that is attached to the permission set.
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
}

/// Specifies the attributes to add to your attribute-based access control
/// (ABAC) configuration.
class InstanceAccessControlAttributeConfiguration {
  /// Lists the attributes that are configured for ABAC in the specified AWS SSO
  /// instance.
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

/// Provides information about the SSO instance.
class InstanceMetadata {
  /// The identifier of the identity store that is connected to the SSO instance.
  final String? identityStoreId;

  /// The ARN of the SSO instance under which the operation will be executed. For
  /// more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  final String? instanceArn;

  InstanceMetadata({
    this.identityStoreId,
    this.instanceArn,
  });
  factory InstanceMetadata.fromJson(Map<String, dynamic> json) {
    return InstanceMetadata(
      identityStoreId: json['IdentityStoreId'] as String?,
      instanceArn: json['InstanceArn'] as String?,
    );
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
}

class ListAccountAssignmentsResponse {
  /// The list of assignments that match the input AWS account and permission set.
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
}

class ListAccountsForProvisionedPermissionSetResponse {
  /// The list of AWS <code>AccountIds</code>.
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
}

class ListInstancesResponse {
  /// Lists the SSO instances that the caller has access to.
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
}

class ListManagedPoliciesInPermissionSetResponse {
  /// The array of the <a>AttachedManagedPolicy</a> data type object.
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
}

class ListPermissionSetsProvisionedToAccountResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  /// Defines the level of access that an AWS account has.
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
}

class ListPermissionSetsResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  final String? nextToken;

  /// Defines the level of access on an AWS account.
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
}

/// Filters he operation status list based on the passed attribute value.
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
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
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
}

/// A structure that is used to provide the status of the provisioning operation
/// for a specified permission set.
class PermissionSetProvisioningStatus {
  /// The identifier of the AWS account from which to list the assignments.
  final String? accountId;

  /// The date that the permission set was created.
  final DateTime? createdDate;

  /// The message that contains an error or exception in case of an operation
  /// failure.
  final String? failureReason;

  /// The ARN of the permission set that is being provisioned. For more
  /// information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
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

class PutInlinePolicyToPermissionSetResponse {
  PutInlinePolicyToPermissionSetResponse();
  factory PutInlinePolicyToPermissionSetResponse.fromJson(
      Map<String, dynamic> _) {
    return PutInlinePolicyToPermissionSetResponse();
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
/// that AWS SSO creates in AWS accounts.
class Tag {
  /// The key for the tag.
  final String? key;

  /// The value of the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
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

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateInstanceAccessControlAttributeConfigurationResponse {
  UpdateInstanceAccessControlAttributeConfigurationResponse();
  factory UpdateInstanceAccessControlAttributeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateInstanceAccessControlAttributeConfigurationResponse();
  }
}

class UpdatePermissionSetResponse {
  UpdatePermissionSetResponse();
  factory UpdatePermissionSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePermissionSetResponse();
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
