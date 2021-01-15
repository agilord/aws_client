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

part '2020-07-20.g.dart';

class SsoAdmin {
  final _s.JsonProtocol _protocol;
  SsoAdmin({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sso',
            signingName: 'sso',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String instanceArn,
    @_s.required String managedPolicyArn,
    @_s.required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.AttachManagedPolicyToPermissionSet'
    };
    final jsonResponse = await _protocol.send(
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

    return AttachManagedPolicyToPermissionSetResponse.fromJson(
        jsonResponse.body);
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
    @_s.required String principalId,
    @_s.required PrincipalType principalType,
    @_s.required String targetId,
    @_s.required TargetType targetType,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
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
    _s.validateStringPattern(
      'principalId',
      principalId,
      r'''^([0-9a-f]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalType, 'principalType');
    ArgumentError.checkNotNull(targetId, 'targetId');
    _s.validateStringPattern(
      'targetId',
      targetId,
      r'''\d{12}''',
      isRequired: true,
    );
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
        'PrincipalType': principalType?.toValue() ?? '',
        'TargetId': targetId,
        'TargetType': targetType?.toValue() ?? '',
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
    @_s.required
        InstanceAccessControlAttributeConfiguration
            instanceAccessControlAttributeConfiguration,
    @_s.required String instanceArn,
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
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.CreateInstanceAccessControlAttributeConfiguration'
    };
    final jsonResponse = await _protocol.send(
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

    return CreateInstanceAccessControlAttributeConfigurationResponse.fromJson(
        jsonResponse.body);
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
    @_s.required String instanceArn,
    @_s.required String name,
    String description,
    String relayState,
    String sessionDuration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      700,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
    );
    _s.validateStringLength(
      'relayState',
      relayState,
      1,
      240,
    );
    _s.validateStringPattern(
      'relayState',
      relayState,
      r'''[a-zA-Z0-9&$@#\\\/%?=~\-_'"|!:,.;*+\[\]\ \(\)\{\}]+''',
    );
    _s.validateStringLength(
      'sessionDuration',
      sessionDuration,
      1,
      100,
    );
    _s.validateStringPattern(
      'sessionDuration',
      sessionDuration,
      r'''^(-?)P(?=\d|T\d)(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)([DW]))?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+(?:\.\d+)?)S)?)?$''',
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
    @_s.required String principalId,
    @_s.required PrincipalType principalType,
    @_s.required String targetId,
    @_s.required TargetType targetType,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
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
    _s.validateStringPattern(
      'principalId',
      principalId,
      r'''^([0-9a-f]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalType, 'principalType');
    ArgumentError.checkNotNull(targetId, 'targetId');
    _s.validateStringPattern(
      'targetId',
      targetId,
      r'''\d{12}''',
      isRequired: true,
    );
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
        'PrincipalType': principalType?.toValue() ?? '',
        'TargetId': targetId,
        'TargetType': targetType?.toValue() ?? '',
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeleteInlinePolicyFromPermissionSet'
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

    return DeleteInlinePolicyFromPermissionSetResponse.fromJson(
        jsonResponse.body);
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
    @_s.required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.DeleteInstanceAccessControlAttributeConfiguration'
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

    return DeleteInstanceAccessControlAttributeConfigurationResponse.fromJson(
        jsonResponse.body);
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DeletePermissionSet'
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

    return DeletePermissionSetResponse.fromJson(jsonResponse.body);
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
    @_s.required String accountAssignmentCreationRequestId,
    @_s.required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(accountAssignmentCreationRequestId,
        'accountAssignmentCreationRequestId');
    _s.validateStringPattern(
      'accountAssignmentCreationRequestId',
      accountAssignmentCreationRequestId,
      r'''\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b''',
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
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    @_s.required String accountAssignmentDeletionRequestId,
    @_s.required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(accountAssignmentDeletionRequestId,
        'accountAssignmentDeletionRequestId');
    _s.validateStringPattern(
      'accountAssignmentDeletionRequestId',
      accountAssignmentDeletionRequestId,
      r'''\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b''',
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
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    @_s.required String instanceArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
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
    @_s.required String instanceArn,
    @_s.required String provisionPermissionSetRequestId,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisionPermissionSetRequestId, 'provisionPermissionSetRequestId');
    _s.validateStringPattern(
      'provisionPermissionSetRequestId',
      provisionPermissionSetRequestId,
      r'''\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b''',
      isRequired: true,
    );
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
    @_s.required String instanceArn,
    @_s.required String managedPolicyArn,
    @_s.required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.DetachManagedPolicyFromPermissionSet'
    };
    final jsonResponse = await _protocol.send(
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

    return DetachManagedPolicyFromPermissionSetResponse.fromJson(
        jsonResponse.body);
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
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
    @_s.required String instanceArn,
    OperationStatusFilter filter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String instanceArn,
    OperationStatusFilter filter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String accountId,
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
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
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
    int maxResults,
    String nextToken,
    ProvisioningStatus provisioningStatus,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String instanceArn,
    OperationStatusFilter filter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String instanceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String accountId,
    @_s.required String instanceArn,
    int maxResults,
    String nextToken,
    ProvisioningStatus provisioningStatus,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
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
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String instanceArn,
    @_s.required String resourceArn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:sso:([a-zA-Z0-9-]+)?:(\d{12})?:[a-zA-Z0-9-]+/[a-zA-Z0-9-/.]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/]*''',
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
    @_s.required ProvisionTargetType targetType,
    String targetId,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetType, 'targetType');
    _s.validateStringPattern(
      'targetId',
      targetId,
      r'''\d{12}''',
    );
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
        'TargetType': targetType?.toValue() ?? '',
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
    @_s.required String inlinePolicy,
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
  }) async {
    ArgumentError.checkNotNull(inlinePolicy, 'inlinePolicy');
    _s.validateStringLength(
      'inlinePolicy',
      inlinePolicy,
      1,
      10240,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inlinePolicy',
      inlinePolicy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
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
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.PutInlinePolicyToPermissionSet'
    };
    final jsonResponse = await _protocol.send(
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

    return PutInlinePolicyToPermissionSetResponse.fromJson(jsonResponse.body);
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
    @_s.required String instanceArn,
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:sso:([a-zA-Z0-9-]+)?:(\d{12})?:[a-zA-Z0-9-]+/[a-zA-Z0-9-/.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.TagResource'
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
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String instanceArn,
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:sso:([a-zA-Z0-9-]+)?:(\d{12})?:[a-zA-Z0-9-]+/[a-zA-Z0-9-/.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.UntagResource'
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
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required
        InstanceAccessControlAttributeConfiguration
            instanceAccessControlAttributeConfiguration,
    @_s.required String instanceArn,
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
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'SWBExternalService.UpdateInstanceAccessControlAttributeConfiguration'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateInstanceAccessControlAttributeConfigurationResponse.fromJson(
        jsonResponse.body);
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
    @_s.required String instanceArn,
    @_s.required String permissionSetArn,
    String description,
    String relayState,
    String sessionDuration,
  }) async {
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      10,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}''',
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
    _s.validateStringPattern(
      'permissionSetArn',
      permissionSetArn,
      r'''arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      700,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
    );
    _s.validateStringLength(
      'relayState',
      relayState,
      1,
      240,
    );
    _s.validateStringPattern(
      'relayState',
      relayState,
      r'''[a-zA-Z0-9&$@#\\\/%?=~\-_'"|!:,.;*+\[\]\ \(\)\{\}]+''',
    );
    _s.validateStringLength(
      'sessionDuration',
      sessionDuration,
      1,
      100,
    );
    _s.validateStringPattern(
      'sessionDuration',
      sessionDuration,
      r'''^(-?)P(?=\d|T\d)(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)([DW]))?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+(?:\.\d+)?)S)?)?$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SWBExternalService.UpdatePermissionSet'
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
        if (description != null) 'Description': description,
        if (relayState != null) 'RelayState': relayState,
        if (sessionDuration != null) 'SessionDuration': sessionDuration,
      },
    );

    return UpdatePermissionSetResponse.fromJson(jsonResponse.body);
  }
}

/// These are AWS SSO identity store attributes that you can configure for use
/// in attributes-based access control (ABAC). You can create permission
/// policies that determine who can access your AWS resources based upon the
/// configured attribute value(s). When you enable ABAC and specify
/// AccessControlAttributes, AWS SSO passes the attribute(s) value of the
/// authenticated user into IAM for use in policy evaluation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessControlAttribute {
  /// The name of the attribute associated with your identities in your identity
  /// source. This is used to map a specified attribute in your identity source
  /// with an attribute in AWS SSO.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value used for mapping a specified attribute to an identity source.
  @_s.JsonKey(name: 'Value')
  final AccessControlAttributeValue value;

  AccessControlAttribute({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory AccessControlAttribute.fromJson(Map<String, dynamic> json) =>
      _$AccessControlAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AccessControlAttributeToJson(this);
}

/// The value used for mapping a specified attribute to an identity source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessControlAttributeValue {
  /// The identity source to use when mapping a specified attribute to AWS SSO.
  @_s.JsonKey(name: 'Source')
  final List<String> source;

  AccessControlAttributeValue({
    @_s.required this.source,
  });
  factory AccessControlAttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AccessControlAttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$AccessControlAttributeValueToJson(this);
}

/// The assignment that indicates a principal's limited access to a specified
/// AWS account with a specified permission set.
/// <note>
/// The term <i>principal</i> here refers to a user or group that is defined in
/// AWS SSO.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountAssignment {
  /// The identifier of the AWS account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The ARN of the permission set. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  @_s.JsonKey(name: 'PermissionSetArn')
  final String permissionSetArn;

  /// An identifier for an object in AWS SSO, such as a user or group.
  /// PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6).
  /// For more information about PrincipalIds in AWS SSO, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">AWS SSO
  /// Identity Store API Reference</a>.
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// The entity type for which the assignment will be created.
  @_s.JsonKey(name: 'PrincipalType')
  final PrincipalType principalType;

  AccountAssignment({
    this.accountId,
    this.permissionSetArn,
    this.principalId,
    this.principalType,
  });
  factory AccountAssignment.fromJson(Map<String, dynamic> json) =>
      _$AccountAssignmentFromJson(json);
}

/// The status of the creation or deletion operation of an assignment that a
/// principal needs to access an account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountAssignmentOperationStatus {
  /// The date that the permission set was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The message that contains an error or exception in case of an operation
  /// failure.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The ARN of the permission set. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  @_s.JsonKey(name: 'PermissionSetArn')
  final String permissionSetArn;

  /// An identifier for an object in AWS SSO, such as a user or group.
  /// PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6).
  /// For more information about PrincipalIds in AWS SSO, see the <a
  /// href="/singlesignon/latest/IdentityStoreAPIReference/welcome.html">AWS SSO
  /// Identity Store API Reference</a>.
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// The entity type for which the assignment will be created.
  @_s.JsonKey(name: 'PrincipalType')
  final PrincipalType principalType;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The status of the permission set provisioning process.
  @_s.JsonKey(name: 'Status')
  final StatusValues status;

  /// TargetID is an AWS account identifier, typically a 10-12 digit string (For
  /// example, 123456789012).
  @_s.JsonKey(name: 'TargetId')
  final String targetId;

  /// The entity type for which the assignment will be created.
  @_s.JsonKey(name: 'TargetType')
  final TargetType targetType;

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
  factory AccountAssignmentOperationStatus.fromJson(
          Map<String, dynamic> json) =>
      _$AccountAssignmentOperationStatusFromJson(json);
}

/// Provides information about the <a>AccountAssignment</a> creation request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountAssignmentOperationStatusMetadata {
  /// The date that the permission set was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The status of the permission set provisioning process.
  @_s.JsonKey(name: 'Status')
  final StatusValues status;

  AccountAssignmentOperationStatusMetadata({
    this.createdDate,
    this.requestId,
    this.status,
  });
  factory AccountAssignmentOperationStatusMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$AccountAssignmentOperationStatusMetadataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachManagedPolicyToPermissionSetResponse {
  AttachManagedPolicyToPermissionSetResponse();
  factory AttachManagedPolicyToPermissionSetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AttachManagedPolicyToPermissionSetResponseFromJson(json);
}

/// A structure that stores the details of the IAM managed policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachedManagedPolicy {
  /// The ARN of the IAM managed policy. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the IAM managed policy.
  @_s.JsonKey(name: 'Name')
  final String name;

  AttachedManagedPolicy({
    this.arn,
    this.name,
  });
  factory AttachedManagedPolicy.fromJson(Map<String, dynamic> json) =>
      _$AttachedManagedPolicyFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAccountAssignmentResponse {
  /// The status object for the account assignment creation operation.
  @_s.JsonKey(name: 'AccountAssignmentCreationStatus')
  final AccountAssignmentOperationStatus accountAssignmentCreationStatus;

  CreateAccountAssignmentResponse({
    this.accountAssignmentCreationStatus,
  });
  factory CreateAccountAssignmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountAssignmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInstanceAccessControlAttributeConfigurationResponse {
  CreateInstanceAccessControlAttributeConfigurationResponse();
  factory CreateInstanceAccessControlAttributeConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateInstanceAccessControlAttributeConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePermissionSetResponse {
  /// Defines the level of access on an AWS account.
  @_s.JsonKey(name: 'PermissionSet')
  final PermissionSet permissionSet;

  CreatePermissionSetResponse({
    this.permissionSet,
  });
  factory CreatePermissionSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePermissionSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAccountAssignmentResponse {
  /// The status object for the account assignment deletion operation.
  @_s.JsonKey(name: 'AccountAssignmentDeletionStatus')
  final AccountAssignmentOperationStatus accountAssignmentDeletionStatus;

  DeleteAccountAssignmentResponse({
    this.accountAssignmentDeletionStatus,
  });
  factory DeleteAccountAssignmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountAssignmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInlinePolicyFromPermissionSetResponse {
  DeleteInlinePolicyFromPermissionSetResponse();
  factory DeleteInlinePolicyFromPermissionSetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteInlinePolicyFromPermissionSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInstanceAccessControlAttributeConfigurationResponse {
  DeleteInstanceAccessControlAttributeConfigurationResponse();
  factory DeleteInstanceAccessControlAttributeConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteInstanceAccessControlAttributeConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePermissionSetResponse {
  DeletePermissionSetResponse();
  factory DeletePermissionSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePermissionSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountAssignmentCreationStatusResponse {
  /// The status object for the account assignment creation operation.
  @_s.JsonKey(name: 'AccountAssignmentCreationStatus')
  final AccountAssignmentOperationStatus accountAssignmentCreationStatus;

  DescribeAccountAssignmentCreationStatusResponse({
    this.accountAssignmentCreationStatus,
  });
  factory DescribeAccountAssignmentCreationStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAccountAssignmentCreationStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountAssignmentDeletionStatusResponse {
  /// The status object for the account assignment deletion operation.
  @_s.JsonKey(name: 'AccountAssignmentDeletionStatus')
  final AccountAssignmentOperationStatus accountAssignmentDeletionStatus;

  DescribeAccountAssignmentDeletionStatusResponse({
    this.accountAssignmentDeletionStatus,
  });
  factory DescribeAccountAssignmentDeletionStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAccountAssignmentDeletionStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstanceAccessControlAttributeConfigurationResponse {
  /// Gets the list of AWS SSO identity store attributes added to your ABAC
  /// configuration.
  @_s.JsonKey(name: 'InstanceAccessControlAttributeConfiguration')
  final InstanceAccessControlAttributeConfiguration
      instanceAccessControlAttributeConfiguration;

  /// The status of the attribute configuration process.
  @_s.JsonKey(name: 'Status')
  final InstanceAccessControlAttributeConfigurationStatus status;

  /// Provides more details about the current status of the specified attribute.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

  DescribeInstanceAccessControlAttributeConfigurationResponse({
    this.instanceAccessControlAttributeConfiguration,
    this.status,
    this.statusReason,
  });
  factory DescribeInstanceAccessControlAttributeConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInstanceAccessControlAttributeConfigurationResponseFromJson(
          json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePermissionSetProvisioningStatusResponse {
  /// The status object for the permission set provisioning operation.
  @_s.JsonKey(name: 'PermissionSetProvisioningStatus')
  final PermissionSetProvisioningStatus permissionSetProvisioningStatus;

  DescribePermissionSetProvisioningStatusResponse({
    this.permissionSetProvisioningStatus,
  });
  factory DescribePermissionSetProvisioningStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribePermissionSetProvisioningStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePermissionSetResponse {
  /// Describes the level of access on an AWS account.
  @_s.JsonKey(name: 'PermissionSet')
  final PermissionSet permissionSet;

  DescribePermissionSetResponse({
    this.permissionSet,
  });
  factory DescribePermissionSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePermissionSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachManagedPolicyFromPermissionSetResponse {
  DetachManagedPolicyFromPermissionSetResponse();
  factory DetachManagedPolicyFromPermissionSetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DetachManagedPolicyFromPermissionSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInlinePolicyForPermissionSetResponse {
  /// The IAM inline policy that is attached to the permission set.
  @_s.JsonKey(name: 'InlinePolicy')
  final String inlinePolicy;

  GetInlinePolicyForPermissionSetResponse({
    this.inlinePolicy,
  });
  factory GetInlinePolicyForPermissionSetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetInlinePolicyForPermissionSetResponseFromJson(json);
}

/// Specifies the attributes to add to your attribute-based access control
/// (ABAC) configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InstanceAccessControlAttributeConfiguration {
  /// Lists the attributes that are configured for ABAC in the specified AWS SSO
  /// instance.
  @_s.JsonKey(name: 'AccessControlAttributes')
  final List<AccessControlAttribute> accessControlAttributes;

  InstanceAccessControlAttributeConfiguration({
    @_s.required this.accessControlAttributes,
  });
  factory InstanceAccessControlAttributeConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$InstanceAccessControlAttributeConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InstanceAccessControlAttributeConfigurationToJson(this);
}

enum InstanceAccessControlAttributeConfigurationStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('CREATION_IN_PROGRESS')
  creationInProgress,
  @_s.JsonValue('CREATION_FAILED')
  creationFailed,
}

/// Provides information about the SSO instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceMetadata {
  /// The identifier of the identity store that is connected to the SSO instance.
  @_s.JsonKey(name: 'IdentityStoreId')
  final String identityStoreId;

  /// The ARN of the SSO instance under which the operation will be executed. For
  /// more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  @_s.JsonKey(name: 'InstanceArn')
  final String instanceArn;

  InstanceMetadata({
    this.identityStoreId,
    this.instanceArn,
  });
  factory InstanceMetadata.fromJson(Map<String, dynamic> json) =>
      _$InstanceMetadataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountAssignmentCreationStatusResponse {
  /// The status object for the account assignment creation operation.
  @_s.JsonKey(name: 'AccountAssignmentsCreationStatus')
  final List<AccountAssignmentOperationStatusMetadata>
      accountAssignmentsCreationStatus;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountAssignmentCreationStatusResponse({
    this.accountAssignmentsCreationStatus,
    this.nextToken,
  });
  factory ListAccountAssignmentCreationStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAccountAssignmentCreationStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountAssignmentDeletionStatusResponse {
  /// The status object for the account assignment deletion operation.
  @_s.JsonKey(name: 'AccountAssignmentsDeletionStatus')
  final List<AccountAssignmentOperationStatusMetadata>
      accountAssignmentsDeletionStatus;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountAssignmentDeletionStatusResponse({
    this.accountAssignmentsDeletionStatus,
    this.nextToken,
  });
  factory ListAccountAssignmentDeletionStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAccountAssignmentDeletionStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountAssignmentsResponse {
  /// The list of assignments that match the input AWS account and permission set.
  @_s.JsonKey(name: 'AccountAssignments')
  final List<AccountAssignment> accountAssignments;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountAssignmentsResponse({
    this.accountAssignments,
    this.nextToken,
  });
  factory ListAccountAssignmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccountAssignmentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountsForProvisionedPermissionSetResponse {
  /// The list of AWS <code>AccountIds</code>.
  @_s.JsonKey(name: 'AccountIds')
  final List<String> accountIds;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountsForProvisionedPermissionSetResponse({
    this.accountIds,
    this.nextToken,
  });
  factory ListAccountsForProvisionedPermissionSetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAccountsForProvisionedPermissionSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstancesResponse {
  /// Lists the SSO instances that the caller has access to.
  @_s.JsonKey(name: 'Instances')
  final List<InstanceMetadata> instances;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListInstancesResponse({
    this.instances,
    this.nextToken,
  });
  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInstancesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListManagedPoliciesInPermissionSetResponse {
  /// The array of the <a>AttachedManagedPolicy</a> data type object.
  @_s.JsonKey(name: 'AttachedManagedPolicies')
  final List<AttachedManagedPolicy> attachedManagedPolicies;

  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListManagedPoliciesInPermissionSetResponse({
    this.attachedManagedPolicies,
    this.nextToken,
  });
  factory ListManagedPoliciesInPermissionSetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListManagedPoliciesInPermissionSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPermissionSetProvisioningStatusResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The status object for the permission set provisioning operation.
  @_s.JsonKey(name: 'PermissionSetsProvisioningStatus')
  final List<PermissionSetProvisioningStatusMetadata>
      permissionSetsProvisioningStatus;

  ListPermissionSetProvisioningStatusResponse({
    this.nextToken,
    this.permissionSetsProvisioningStatus,
  });
  factory ListPermissionSetProvisioningStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListPermissionSetProvisioningStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPermissionSetsProvisionedToAccountResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Defines the level of access that an AWS account has.
  @_s.JsonKey(name: 'PermissionSets')
  final List<String> permissionSets;

  ListPermissionSetsProvisionedToAccountResponse({
    this.nextToken,
    this.permissionSets,
  });
  factory ListPermissionSetsProvisionedToAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListPermissionSetsProvisionedToAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPermissionSetsResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Defines the level of access on an AWS account.
  @_s.JsonKey(name: 'PermissionSets')
  final List<String> permissionSets;

  ListPermissionSetsResponse({
    this.nextToken,
    this.permissionSets,
  });
  factory ListPermissionSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPermissionSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The pagination token for the list API. Initially the value is null. Use the
  /// output of previous API calls to make subsequent calls.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A set of key-value pairs that are used to manage the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Filters he operation status list based on the passed attribute value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OperationStatusFilter {
  /// Filters the list operations result based on the status attribute.
  @_s.JsonKey(name: 'Status')
  final StatusValues status;

  OperationStatusFilter({
    this.status,
  });
  Map<String, dynamic> toJson() => _$OperationStatusFilterToJson(this);
}

/// An entity that contains IAM policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PermissionSet {
  /// The date that the permission set was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The description of the <a>PermissionSet</a>.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the permission set.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN of the permission set. For more information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  @_s.JsonKey(name: 'PermissionSetArn')
  final String permissionSetArn;

  /// Used to redirect users within the application during the federation
  /// authentication process.
  @_s.JsonKey(name: 'RelayState')
  final String relayState;

  /// The length of time that the application user sessions are valid for in the
  /// ISO-8601 standard.
  @_s.JsonKey(name: 'SessionDuration')
  final String sessionDuration;

  PermissionSet({
    this.createdDate,
    this.description,
    this.name,
    this.permissionSetArn,
    this.relayState,
    this.sessionDuration,
  });
  factory PermissionSet.fromJson(Map<String, dynamic> json) =>
      _$PermissionSetFromJson(json);
}

/// A structure that is used to provide the status of the provisioning operation
/// for a specified permission set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PermissionSetProvisioningStatus {
  /// The identifier of the AWS account from which to list the assignments.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The date that the permission set was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The message that contains an error or exception in case of an operation
  /// failure.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The ARN of the permission set that is being provisioned. For more
  /// information about ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names
  /// (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.
  @_s.JsonKey(name: 'PermissionSetArn')
  final String permissionSetArn;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The status of the permission set provisioning process.
  @_s.JsonKey(name: 'Status')
  final StatusValues status;

  PermissionSetProvisioningStatus({
    this.accountId,
    this.createdDate,
    this.failureReason,
    this.permissionSetArn,
    this.requestId,
    this.status,
  });
  factory PermissionSetProvisioningStatus.fromJson(Map<String, dynamic> json) =>
      _$PermissionSetProvisioningStatusFromJson(json);
}

/// Provides information about the permission set provisioning status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PermissionSetProvisioningStatusMetadata {
  /// The date that the permission set was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The identifier for tracking the request operation that is generated by the
  /// universally unique identifier (UUID) workflow.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The status of the permission set provisioning process.
  @_s.JsonKey(name: 'Status')
  final StatusValues status;

  PermissionSetProvisioningStatusMetadata({
    this.createdDate,
    this.requestId,
    this.status,
  });
  factory PermissionSetProvisioningStatusMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$PermissionSetProvisioningStatusMetadataFromJson(json);
}

enum PrincipalType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('GROUP')
  group,
}

extension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.user:
        return 'USER';
      case PrincipalType.group:
        return 'GROUP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionPermissionSetResponse {
  /// The status object for the permission set provisioning operation.
  @_s.JsonKey(name: 'PermissionSetProvisioningStatus')
  final PermissionSetProvisioningStatus permissionSetProvisioningStatus;

  ProvisionPermissionSetResponse({
    this.permissionSetProvisioningStatus,
  });
  factory ProvisionPermissionSetResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvisionPermissionSetResponseFromJson(json);
}

enum ProvisionTargetType {
  @_s.JsonValue('AWS_ACCOUNT')
  awsAccount,
  @_s.JsonValue('ALL_PROVISIONED_ACCOUNTS')
  allProvisionedAccounts,
}

extension on ProvisionTargetType {
  String toValue() {
    switch (this) {
      case ProvisionTargetType.awsAccount:
        return 'AWS_ACCOUNT';
      case ProvisionTargetType.allProvisionedAccounts:
        return 'ALL_PROVISIONED_ACCOUNTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ProvisioningStatus {
  @_s.JsonValue('LATEST_PERMISSION_SET_PROVISIONED')
  latestPermissionSetProvisioned,
  @_s.JsonValue('LATEST_PERMISSION_SET_NOT_PROVISIONED')
  latestPermissionSetNotProvisioned,
}

extension on ProvisioningStatus {
  String toValue() {
    switch (this) {
      case ProvisioningStatus.latestPermissionSetProvisioned:
        return 'LATEST_PERMISSION_SET_PROVISIONED';
      case ProvisioningStatus.latestPermissionSetNotProvisioned:
        return 'LATEST_PERMISSION_SET_NOT_PROVISIONED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutInlinePolicyToPermissionSetResponse {
  PutInlinePolicyToPermissionSetResponse();
  factory PutInlinePolicyToPermissionSetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutInlinePolicyToPermissionSetResponseFromJson(json);
}

enum StatusValues {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
}

/// A set of key-value pairs that are used to manage the resource. Tags can only
/// be applied to permission sets and cannot be applied to corresponding roles
/// that AWS SSO creates in AWS accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key for the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

enum TargetType {
  @_s.JsonValue('AWS_ACCOUNT')
  awsAccount,
}

extension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.awsAccount:
        return 'AWS_ACCOUNT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInstanceAccessControlAttributeConfigurationResponse {
  UpdateInstanceAccessControlAttributeConfigurationResponse();
  factory UpdateInstanceAccessControlAttributeConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateInstanceAccessControlAttributeConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePermissionSetResponse {
  UpdatePermissionSetResponse();
  factory UpdatePermissionSetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePermissionSetResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
