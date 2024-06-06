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

/// Amazon Verified Permissions is a permissions management service from Amazon
/// Web Services. You can use Verified Permissions to manage permissions for
/// your application, and authorize user access based on those permissions.
/// Using Verified Permissions, application developers can grant access based on
/// information about the users, resources, and requested actions. You can also
/// evaluate additional information like group membership, attributes of the
/// resources, and session context, such as time of request and IP addresses.
/// Verified Permissions manages these permissions by letting you create and
/// store authorization policies for your applications, such as consumer-facing
/// web sites and enterprise business systems.
///
/// Verified Permissions uses Cedar as the policy language to express your
/// permission requirements. Cedar supports both role-based access control
/// (RBAC) and attribute-based access control (ABAC) authorization models.
///
/// For more information about configuring, administering, and using Amazon
/// Verified Permissions in your applications, see the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/userguide/">Amazon
/// Verified Permissions User Guide</a>.
///
/// For more information about the Cedar policy language, see the <a
/// href="https://docs.cedarpolicy.com/">Cedar Policy Language Guide</a>.
/// <important>
/// When you write Cedar policies that reference principals, resources and
/// actions, you can define the unique identifiers used for each of those
/// elements. We strongly recommend that you follow these best practices:
///
/// <ul>
/// <li>
/// <b>Use values like universally unique identifiers (UUIDs) for all principal
/// and resource identifiers.</b>
///
/// For example, if user <code>jane</code> leaves the company, and you later let
/// someone else use the name <code>jane</code>, then that new user
/// automatically gets access to everything granted by policies that still
/// reference <code>User::"jane"</code>. Cedar can’t distinguish between the new
/// user and the old. This applies to both principal and resource identifiers.
/// Always use identifiers that are guaranteed unique and never reused to ensure
/// that you don’t unintentionally grant access because of the presence of an
/// old identifier in a policy.
///
/// Where you use a UUID for an entity, we recommend that you follow it with the
/// // comment specifier and the ‘friendly’ name of your entity. This helps to
/// make your policies easier to understand. For example: principal ==
/// User::"a1b2c3d4-e5f6-a1b2-c3d4-EXAMPLE11111", // alice
/// </li>
/// <li>
/// <b>Do not include personally identifying, confidential, or sensitive
/// information as part of the unique identifier for your principals or
/// resources.</b> These identifiers are included in log entries shared in
/// CloudTrail trails.
/// </li>
/// </ul> </important>
/// Several operations return structures that appear similar, but have different
/// purposes. As new functionality is added to the product, the structure used
/// in a parameter of one operation might need to change in a way that wouldn't
/// make sense for the same parameter in a different operation. To help you
/// understand the purpose of each, the following naming convention is used for
/// the structures:
///
/// <ul>
/// <li>
/// Parameter type structures that end in <code>Detail</code> are used in
/// <code>Get</code> operations.
/// </li>
/// <li>
/// Parameter type structures that end in <code>Item</code> are used in
/// <code>List</code> operations.
/// </li>
/// <li>
/// Parameter type structures that use neither suffix are used in the mutating
/// (create and update) operations.
/// </li>
/// </ul>
class VerifiedPermissions {
  final _s.JsonProtocol _protocol;
  VerifiedPermissions({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'verifiedpermissions',
            signingName: 'verifiedpermissions',
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

  /// Makes a series of decisions about multiple authorization requests for one
  /// principal or resource. Each request contains the equivalent content of an
  /// <code>IsAuthorized</code> request: principal, action, resource, and
  /// context. Either the <code>principal</code> or the <code>resource</code>
  /// parameter must be identical across all requests. For example, Verified
  /// Permissions won't evaluate a pair of requests where <code>bob</code> views
  /// <code>photo1</code> and <code>alice</code> views <code>photo2</code>.
  /// Authorization of <code>bob</code> to view <code>photo1</code> and
  /// <code>photo2</code>, or <code>bob</code> and <code>alice</code> to view
  /// <code>photo1</code>, are valid batches.
  ///
  /// The request is evaluated against all policies in the specified policy
  /// store that match the entities that you declare. The result of the
  /// decisions is a series of <code>Allow</code> or <code>Deny</code>
  /// responses, along with the IDs of the policies that produced each decision.
  ///
  /// The <code>entities</code> of a <code>BatchIsAuthorized</code> API request
  /// can contain up to 100 principals and up to 100 resources. The
  /// <code>requests</code> of a <code>BatchIsAuthorized</code> API request can
  /// contain up to 30 requests.
  /// <note>
  /// The <code>BatchIsAuthorized</code> operation doesn't have its own IAM
  /// permission. To authorize this operation for Amazon Web Services
  /// principals, include the permission
  /// <code>verifiedpermissions:IsAuthorized</code> in their IAM policies.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store. Policies in this policy store will
  /// be used to make the authorization decisions for the input.
  ///
  /// Parameter [requests] :
  /// An array of up to 30 requests that you want Verified Permissions to
  /// evaluate.
  ///
  /// Parameter [entities] :
  /// Specifies the list of resources and principals and their associated
  /// attributes that Verified Permissions can examine when evaluating the
  /// policies.
  /// <note>
  /// You can include only principal and resource entities in this parameter;
  /// you can't include actions. You must specify actions in the schema.
  /// </note>
  Future<BatchIsAuthorizedOutput> batchIsAuthorized({
    required String policyStoreId,
    required List<BatchIsAuthorizedInputItem> requests,
    EntitiesDefinition? entities,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.BatchIsAuthorized'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        'requests': requests,
        if (entities != null) 'entities': entities,
      },
    );

    return BatchIsAuthorizedOutput.fromJson(jsonResponse.body);
  }

  /// Makes a series of decisions about multiple authorization requests for one
  /// token. The principal in this request comes from an external identity
  /// source in the form of an identity or access token, formatted as a <a
  /// href="https://wikipedia.org/wiki/JSON_Web_Token">JSON web token (JWT)</a>.
  /// The information in the parameters can also define additional context that
  /// Verified Permissions can include in the evaluations.
  ///
  /// The request is evaluated against all policies in the specified policy
  /// store that match the entities that you provide in the entities declaration
  /// and in the token. The result of the decisions is a series of
  /// <code>Allow</code> or <code>Deny</code> responses, along with the IDs of
  /// the policies that produced each decision.
  ///
  /// The <code>entities</code> of a <code>BatchIsAuthorizedWithToken</code> API
  /// request can contain up to 100 resources and up to 99 user groups. The
  /// <code>requests</code> of a <code>BatchIsAuthorizedWithToken</code> API
  /// request can contain up to 30 requests.
  /// <note>
  /// The <code>BatchIsAuthorizedWithToken</code> operation doesn't have its own
  /// IAM permission. To authorize this operation for Amazon Web Services
  /// principals, include the permission
  /// <code>verifiedpermissions:IsAuthorizedWithToken</code> in their IAM
  /// policies.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store. Policies in this policy store will
  /// be used to make an authorization decision for the input.
  ///
  /// Parameter [requests] :
  /// An array of up to 30 requests that you want Verified Permissions to
  /// evaluate.
  ///
  /// Parameter [accessToken] :
  /// Specifies an access token for the principal that you want to authorize in
  /// each request. This token is provided to you by the identity provider (IdP)
  /// associated with the specified identity source. You must specify either an
  /// <code>accessToken</code>, an <code>identityToken</code>, or both.
  ///
  /// Must be an access token. Verified Permissions returns an error if the
  /// <code>token_use</code> claim in the submitted token isn't
  /// <code>access</code>.
  ///
  /// Parameter [entities] :
  /// Specifies the list of resources and their associated attributes that
  /// Verified Permissions can examine when evaluating the policies.
  /// <important>
  /// You can't include principals in this parameter, only resource and action
  /// entities. This parameter can't include any entities of a type that matches
  /// the user or group entity types that you defined in your identity source.
  ///
  /// <ul>
  /// <li>
  /// The <code>BatchIsAuthorizedWithToken</code> operation takes principal
  /// attributes from <b> <i>only</i> </b> the <code>identityToken</code> or
  /// <code>accessToken</code> passed to the operation.
  /// </li>
  /// <li>
  /// For action entities, you can include only their <code>Identifier</code>
  /// and <code>EntityType</code>.
  /// </li>
  /// </ul> </important>
  ///
  /// Parameter [identityToken] :
  /// Specifies an identity (ID) token for the principal that you want to
  /// authorize in each request. This token is provided to you by the identity
  /// provider (IdP) associated with the specified identity source. You must
  /// specify either an <code>accessToken</code>, an <code>identityToken</code>,
  /// or both.
  ///
  /// Must be an ID token. Verified Permissions returns an error if the
  /// <code>token_use</code> claim in the submitted token isn't <code>id</code>.
  Future<BatchIsAuthorizedWithTokenOutput> batchIsAuthorizedWithToken({
    required String policyStoreId,
    required List<BatchIsAuthorizedWithTokenInputItem> requests,
    String? accessToken,
    EntitiesDefinition? entities,
    String? identityToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.BatchIsAuthorizedWithToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        'requests': requests,
        if (accessToken != null) 'accessToken': accessToken,
        if (entities != null) 'entities': entities,
        if (identityToken != null) 'identityToken': identityToken,
      },
    );

    return BatchIsAuthorizedWithTokenOutput.fromJson(jsonResponse.body);
  }

  /// Creates a reference to an Amazon Cognito user pool as an external identity
  /// provider (IdP).
  ///
  /// After you create an identity source, you can use the identities provided
  /// by the IdP as proxies for the principal in authorization queries that use
  /// the <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>
  /// operation. These identities take the form of tokens that contain claims
  /// about the user, such as IDs, attributes and group memberships. Amazon
  /// Cognito provides both identity tokens and access tokens, and Verified
  /// Permissions can use either or both. Any combination of identity and access
  /// tokens results in the same Cedar principal. Verified Permissions
  /// automatically translates the information about the identities into the
  /// standard Cedar attributes that can be evaluated by your policies. Because
  /// the Amazon Cognito identity and access tokens can contain different
  /// information, the tokens you choose to use determine which principal
  /// attributes are available to access when evaluating Cedar policies.
  /// <important>
  /// If you delete a Amazon Cognito user pool or user, tokens from that deleted
  /// pool or that deleted user continue to be usable until they expire.
  /// </important> <note>
  /// To reference a user from this identity source in your Cedar policies, use
  /// the following syntax.
  ///
  /// <i>IdentityType::"&lt;CognitoUserPoolIdentifier&gt;|&lt;CognitoClientId&gt;</i>
  ///
  /// Where <code>IdentityType</code> is the string that you provide to the
  /// <code>PrincipalEntityType</code> parameter for this operation. The
  /// <code>CognitoUserPoolId</code> and <code>CognitoClientId</code> are
  /// defined by the Amazon Cognito user pool.
  /// </note> <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configuration] :
  /// Specifies the details required to communicate with the identity provider
  /// (IdP) associated with this identity source.
  /// <note>
  /// At this time, the only valid member of this structure is a Amazon Cognito
  /// user pool configuration.
  ///
  /// You must specify a <code>UserPoolArn</code>, and optionally, a
  /// <code>ClientId</code>.
  /// </note>
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store in which you want to store this
  /// identity source. Only policies and requests made using this policy store
  /// can reference identities from the identity provider configured in the new
  /// identity source.
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
  /// <code>ConflictException</code> error.
  ///
  /// Verified Permissions recognizes a <code>ClientToken</code> for eight
  /// hours. After eight hours, the next request with the same parameters
  /// performs the operation again regardless of the value of
  /// <code>ClientToken</code>.
  ///
  /// Parameter [principalEntityType] :
  /// Specifies the namespace and data type of the principals generated for
  /// identities authenticated by the new identity source.
  Future<CreateIdentitySourceOutput> createIdentitySource({
    required Configuration configuration,
    required String policyStoreId,
    String? clientToken,
    String? principalEntityType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.CreateIdentitySource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configuration': configuration,
        'policyStoreId': policyStoreId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (principalEntityType != null)
          'principalEntityType': principalEntityType,
      },
    );

    return CreateIdentitySourceOutput.fromJson(jsonResponse.body);
  }

  /// Creates a Cedar policy and saves it in the specified policy store. You can
  /// create either a static policy or a policy linked to a policy template.
  ///
  /// <ul>
  /// <li>
  /// To create a static policy, provide the Cedar policy text in the
  /// <code>StaticPolicy</code> section of the <code>PolicyDefinition</code>.
  /// </li>
  /// <li>
  /// To create a policy that is dynamically linked to a policy template,
  /// specify the policy template ID and the principal and resource to associate
  /// with this policy in the <code>templateLinked</code> section of the
  /// <code>PolicyDefinition</code>. If the policy template is ever updated, any
  /// policies linked to the policy template automatically use the updated
  /// template.
  /// </li>
  /// </ul> <note>
  /// Creating a policy causes it to be validated against the schema in the
  /// policy store. If the policy doesn't pass validation, the operation fails
  /// and the policy isn't stored.
  /// </note> <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [definition] :
  /// A structure that specifies the policy type and content to use for the new
  /// policy. You must include either a static or a templateLinked element. The
  /// policy content must be written in the Cedar policy language.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the <code>PolicyStoreId</code> of the policy store you want to
  /// store the policy in.
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
  /// <code>ConflictException</code> error.
  ///
  /// Verified Permissions recognizes a <code>ClientToken</code> for eight
  /// hours. After eight hours, the next request with the same parameters
  /// performs the operation again regardless of the value of
  /// <code>ClientToken</code>.
  Future<CreatePolicyOutput> createPolicy({
    required PolicyDefinition definition,
    required String policyStoreId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.CreatePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        'policyStoreId': policyStoreId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreatePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Creates a policy store. A policy store is a container for policy
  /// resources.
  /// <note>
  /// Although <a
  /// href="https://docs.cedarpolicy.com/schema/schema.html#namespace">Cedar
  /// supports multiple namespaces</a>, Verified Permissions currently supports
  /// only one namespace per policy store.
  /// </note> <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [validationSettings] :
  /// Specifies the validation setting for this policy store.
  ///
  /// Currently, the only valid and required value is <code>Mode</code>.
  /// <important>
  /// We recommend that you turn on <code>STRICT</code> mode only after you
  /// define a schema. If a schema doesn't exist, then <code>STRICT</code> mode
  /// causes any policy to fail validation, and Verified Permissions rejects the
  /// policy. You can turn off validation by using the <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyStore">UpdatePolicyStore</a>.
  /// Then, when you have a schema defined, use <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyStore">UpdatePolicyStore</a>
  /// again to turn validation back on.
  /// </important>
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
  /// <code>ConflictException</code> error.
  ///
  /// Verified Permissions recognizes a <code>ClientToken</code> for eight
  /// hours. After eight hours, the next request with the same parameters
  /// performs the operation again regardless of the value of
  /// <code>ClientToken</code>.
  ///
  /// Parameter [description] :
  /// Descriptive text that you can provide to help with identification of the
  /// current policy store.
  Future<CreatePolicyStoreOutput> createPolicyStore({
    required ValidationSettings validationSettings,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.CreatePolicyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'validationSettings': validationSettings,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return CreatePolicyStoreOutput.fromJson(jsonResponse.body);
  }

  /// Creates a policy template. A template can use placeholders for the
  /// principal and resource. A template must be instantiated into a policy by
  /// associating it with specific principals and resources to use for the
  /// placeholders. That instantiated policy can then be considered in
  /// authorization decisions. The instantiated policy works identically to any
  /// other policy, except that it is dynamically linked to the template. If the
  /// template changes, then any policies that are linked to that template are
  /// immediately updated as well.
  /// <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// The ID of the policy store in which to create the policy template.
  ///
  /// Parameter [statement] :
  /// Specifies the content that you want to use for the new policy template,
  /// written in the Cedar policy language.
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
  /// <code>ConflictException</code> error.
  ///
  /// Verified Permissions recognizes a <code>ClientToken</code> for eight
  /// hours. After eight hours, the next request with the same parameters
  /// performs the operation again regardless of the value of
  /// <code>ClientToken</code>.
  ///
  /// Parameter [description] :
  /// Specifies a description for the policy template.
  Future<CreatePolicyTemplateOutput> createPolicyTemplate({
    required String policyStoreId,
    required String statement,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.CreatePolicyTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        'statement': statement,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return CreatePolicyTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an identity source that references an identity provider (IdP) such
  /// as Amazon Cognito. After you delete the identity source, you can no longer
  /// use tokens for identities from that identity source to represent
  /// principals in authorization queries made using <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>.
  /// operations.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identitySourceId] :
  /// Specifies the ID of the identity source that you want to delete.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the identity source
  /// that you want to delete.
  Future<void> deleteIdentitySource({
    required String identitySourceId,
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.DeleteIdentitySource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identitySourceId': identitySourceId,
        'policyStoreId': policyStoreId,
      },
    );
  }

  /// Deletes the specified policy from the policy store.
  ///
  /// This operation is idempotent; if you specify a policy that doesn't exist,
  /// the request response returns a successful <code>HTTP 200</code> status
  /// code.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyId] :
  /// Specifies the ID of the policy that you want to delete.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the policy that you
  /// want to delete.
  Future<void> deletePolicy({
    required String policyId,
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.DeletePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyId': policyId,
        'policyStoreId': policyStoreId,
      },
    );
  }

  /// Deletes the specified policy store.
  ///
  /// This operation is idempotent. If you specify a policy store that does not
  /// exist, the request response will still return a successful HTTP 200 status
  /// code.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that you want to delete.
  Future<void> deletePolicyStore({
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.DeletePolicyStore'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
      },
    );
  }

  /// Deletes the specified policy template from the policy store.
  /// <important>
  /// This operation also deletes any policies that were created from the
  /// specified policy template. Those policies are immediately removed from all
  /// future API responses, and are asynchronously deleted from the policy
  /// store.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the policy template
  /// that you want to delete.
  ///
  /// Parameter [policyTemplateId] :
  /// Specifies the ID of the policy template that you want to delete.
  Future<void> deletePolicyTemplate({
    required String policyStoreId,
    required String policyTemplateId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.DeletePolicyTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        'policyTemplateId': policyTemplateId,
      },
    );
  }

  /// Retrieves the details about the specified identity source.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identitySourceId] :
  /// Specifies the ID of the identity source you want information about.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the identity source you
  /// want information about.
  Future<GetIdentitySourceOutput> getIdentitySource({
    required String identitySourceId,
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.GetIdentitySource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identitySourceId': identitySourceId,
        'policyStoreId': policyStoreId,
      },
    );

    return GetIdentitySourceOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the specified policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyId] :
  /// Specifies the ID of the policy you want information about.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the policy that you
  /// want information about.
  Future<GetPolicyOutput> getPolicy({
    required String policyId,
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.GetPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyId': policyId,
        'policyStoreId': policyStoreId,
      },
    );

    return GetPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a policy store.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that you want information about.
  Future<GetPolicyStoreOutput> getPolicyStore({
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.GetPolicyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
      },
    );

    return GetPolicyStoreOutput.fromJson(jsonResponse.body);
  }

  /// Retrieve the details for the specified policy template in the specified
  /// policy store.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the policy template
  /// that you want information about.
  ///
  /// Parameter [policyTemplateId] :
  /// Specifies the ID of the policy template that you want information about.
  Future<GetPolicyTemplateOutput> getPolicyTemplate({
    required String policyStoreId,
    required String policyTemplateId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.GetPolicyTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        'policyTemplateId': policyTemplateId,
      },
    );

    return GetPolicyTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Retrieve the details for the specified schema in the specified policy
  /// store.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the schema.
  Future<GetSchemaOutput> getSchema({
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.GetSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
      },
    );

    return GetSchemaOutput.fromJson(jsonResponse.body);
  }

  /// Makes an authorization decision about a service request described in the
  /// parameters. The information in the parameters can also define additional
  /// context that Verified Permissions can include in the evaluation. The
  /// request is evaluated against all matching policies in the specified policy
  /// store. The result of the decision is either <code>Allow</code> or
  /// <code>Deny</code>, along with a list of the policies that resulted in the
  /// decision.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store. Policies in this policy store will
  /// be used to make an authorization decision for the input.
  ///
  /// Parameter [action] :
  /// Specifies the requested action to be authorized. For example, is the
  /// principal authorized to perform this action on the resource?
  ///
  /// Parameter [context] :
  /// Specifies additional context that can be used to make more granular
  /// authorization decisions.
  ///
  /// Parameter [entities] :
  /// Specifies the list of resources and principals and their associated
  /// attributes that Verified Permissions can examine when evaluating the
  /// policies.
  /// <note>
  /// You can include only principal and resource entities in this parameter;
  /// you can't include actions. You must specify actions in the schema.
  /// </note>
  ///
  /// Parameter [principal] :
  /// Specifies the principal for which the authorization decision is to be
  /// made.
  ///
  /// Parameter [resource] :
  /// Specifies the resource for which the authorization decision is to be made.
  Future<IsAuthorizedOutput> isAuthorized({
    required String policyStoreId,
    ActionIdentifier? action,
    ContextDefinition? context,
    EntitiesDefinition? entities,
    EntityIdentifier? principal,
    EntityIdentifier? resource,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.IsAuthorized'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        if (action != null) 'action': action,
        if (context != null) 'context': context,
        if (entities != null) 'entities': entities,
        if (principal != null) 'principal': principal,
        if (resource != null) 'resource': resource,
      },
    );

    return IsAuthorizedOutput.fromJson(jsonResponse.body);
  }

  /// Makes an authorization decision about a service request described in the
  /// parameters. The principal in this request comes from an external identity
  /// source in the form of an identity token formatted as a <a
  /// href="https://wikipedia.org/wiki/JSON_Web_Token">JSON web token (JWT)</a>.
  /// The information in the parameters can also define additional context that
  /// Verified Permissions can include in the evaluation. The request is
  /// evaluated against all matching policies in the specified policy store. The
  /// result of the decision is either <code>Allow</code> or <code>Deny</code>,
  /// along with a list of the policies that resulted in the decision.
  ///
  /// At this time, Verified Permissions accepts tokens from only Amazon
  /// Cognito.
  ///
  /// Verified Permissions validates each token that is specified in a request
  /// by checking its expiration date and its signature.
  /// <important>
  /// If you delete a Amazon Cognito user pool or user, tokens from that deleted
  /// pool or that deleted user continue to be usable until they expire.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store. Policies in this policy store will
  /// be used to make an authorization decision for the input.
  ///
  /// Parameter [accessToken] :
  /// Specifies an access token for the principal to be authorized. This token
  /// is provided to you by the identity provider (IdP) associated with the
  /// specified identity source. You must specify either an
  /// <code>accessToken</code>, an <code>identityToken</code>, or both.
  ///
  /// Must be an access token. Verified Permissions returns an error if the
  /// <code>token_use</code> claim in the submitted token isn't
  /// <code>access</code>.
  ///
  /// Parameter [action] :
  /// Specifies the requested action to be authorized. Is the specified
  /// principal authorized to perform this action on the specified resource.
  ///
  /// Parameter [context] :
  /// Specifies additional context that can be used to make more granular
  /// authorization decisions.
  ///
  /// Parameter [entities] :
  /// Specifies the list of resources and their associated attributes that
  /// Verified Permissions can examine when evaluating the policies.
  /// <important>
  /// You can't include principals in this parameter, only resource and action
  /// entities. This parameter can't include any entities of a type that matches
  /// the user or group entity types that you defined in your identity source.
  ///
  /// <ul>
  /// <li>
  /// The <code>IsAuthorizedWithToken</code> operation takes principal
  /// attributes from <b> <i>only</i> </b> the <code>identityToken</code> or
  /// <code>accessToken</code> passed to the operation.
  /// </li>
  /// <li>
  /// For action entities, you can include only their <code>Identifier</code>
  /// and <code>EntityType</code>.
  /// </li>
  /// </ul> </important>
  ///
  /// Parameter [identityToken] :
  /// Specifies an identity token for the principal to be authorized. This token
  /// is provided to you by the identity provider (IdP) associated with the
  /// specified identity source. You must specify either an
  /// <code>accessToken</code>, an <code>identityToken</code>, or both.
  ///
  /// Must be an ID token. Verified Permissions returns an error if the
  /// <code>token_use</code> claim in the submitted token isn't <code>id</code>.
  ///
  /// Parameter [resource] :
  /// Specifies the resource for which the authorization decision is made. For
  /// example, is the principal allowed to perform the action on the resource?
  Future<IsAuthorizedWithTokenOutput> isAuthorizedWithToken({
    required String policyStoreId,
    String? accessToken,
    ActionIdentifier? action,
    ContextDefinition? context,
    EntitiesDefinition? entities,
    String? identityToken,
    EntityIdentifier? resource,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.IsAuthorizedWithToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        if (accessToken != null) 'accessToken': accessToken,
        if (action != null) 'action': action,
        if (context != null) 'context': context,
        if (entities != null) 'entities': entities,
        if (identityToken != null) 'identityToken': identityToken,
        if (resource != null) 'resource': resource,
      },
    );

    return IsAuthorizedWithTokenOutput.fromJson(jsonResponse.body);
  }

  /// Returns a paginated list of all of the identity sources defined in the
  /// specified policy store.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the identity sources
  /// that you want to list.
  ///
  /// Parameter [filters] :
  /// Specifies characteristics of an identity source that you can use to limit
  /// the output to matching identity sources.
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
  /// If you do not specify this parameter, the operation defaults to 10
  /// identity sources per response. You can specify a maximum of 50 identity
  /// sources per response.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListIdentitySourcesOutput> listIdentitySources({
    required String policyStoreId,
    List<IdentitySourceFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.ListIdentitySources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListIdentitySourcesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a paginated list of all policies stored in the specified policy
  /// store.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store you want to list policies from.
  ///
  /// Parameter [filter] :
  /// Specifies a filter that limits the response to only policies that match
  /// the specified criteria. For example, you list only the policies that
  /// reference a specified principal.
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
  /// If you do not specify this parameter, the operation defaults to 10
  /// policies per response. You can specify a maximum of 50 policies per
  /// response.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListPoliciesOutput> listPolicies({
    required String policyStoreId,
    PolicyFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.ListPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListPoliciesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a paginated list of all policy stores in the calling Amazon Web
  /// Services account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// If you do not specify this parameter, the operation defaults to 10 policy
  /// stores per response. You can specify a maximum of 50 policy stores per
  /// response.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListPolicyStoresOutput> listPolicyStores({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.ListPolicyStores'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListPolicyStoresOutput.fromJson(jsonResponse.body);
  }

  /// Returns a paginated list of all policy templates in the specified policy
  /// store.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the policy templates
  /// you want to list.
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
  /// If you do not specify this parameter, the operation defaults to 10 policy
  /// templates per response. You can specify a maximum of 50 policy templates
  /// per response.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListPolicyTemplatesOutput> listPolicyTemplates({
    required String policyStoreId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.ListPolicyTemplates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListPolicyTemplatesOutput.fromJson(jsonResponse.body);
  }

  /// Creates or updates the policy schema in the specified policy store. The
  /// schema is used to validate any Cedar policies and policy templates
  /// submitted to the policy store. Any changes to the schema validate only
  /// policies and templates submitted after the schema change. Existing
  /// policies and templates are not re-evaluated against the changed schema. If
  /// you later update a policy, then it is evaluated against the new schema at
  /// that time.
  /// <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [definition] :
  /// Specifies the definition of the schema to be stored. The schema definition
  /// must be written in Cedar schema JSON.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store in which to place the schema.
  Future<PutSchemaOutput> putSchema({
    required SchemaDefinition definition,
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.PutSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        'policyStoreId': policyStoreId,
      },
    );

    return PutSchemaOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified identity source to use a new identity provider (IdP)
  /// source, or to change the mapping of identities from the IdP to a different
  /// principal entity type.
  /// <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identitySourceId] :
  /// Specifies the ID of the identity source that you want to update.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the identity source
  /// that you want to update.
  ///
  /// Parameter [updateConfiguration] :
  /// Specifies the details required to communicate with the identity provider
  /// (IdP) associated with this identity source.
  /// <note>
  /// At this time, the only valid member of this structure is a Amazon Cognito
  /// user pool configuration.
  ///
  /// You must specify a <code>userPoolArn</code>, and optionally, a
  /// <code>ClientId</code>.
  /// </note>
  ///
  /// Parameter [principalEntityType] :
  /// Specifies the data type of principals generated for identities
  /// authenticated by the identity source.
  Future<UpdateIdentitySourceOutput> updateIdentitySource({
    required String identitySourceId,
    required String policyStoreId,
    required UpdateConfiguration updateConfiguration,
    String? principalEntityType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.UpdateIdentitySource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identitySourceId': identitySourceId,
        'policyStoreId': policyStoreId,
        'updateConfiguration': updateConfiguration,
        if (principalEntityType != null)
          'principalEntityType': principalEntityType,
      },
    );

    return UpdateIdentitySourceOutput.fromJson(jsonResponse.body);
  }

  /// Modifies a Cedar static policy in the specified policy store. You can
  /// change only certain elements of the <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyInput.html#amazonverifiedpermissions-UpdatePolicy-request-UpdatePolicyDefinition">UpdatePolicyDefinition</a>
  /// parameter. You can directly update only static policies. To change a
  /// template-linked policy, you must update the template instead, using <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyTemplate.html">UpdatePolicyTemplate</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// If policy validation is enabled in the policy store, then updating a
  /// static policy causes Verified Permissions to validate the policy against
  /// the schema in the policy store. If the updated static policy doesn't pass
  /// validation, the operation fails and the update isn't stored.
  /// </li>
  /// <li>
  /// When you edit a static policy, you can change only certain elements of a
  /// static policy:
  ///
  /// <ul>
  /// <li>
  /// The action referenced by the policy.
  /// </li>
  /// <li>
  /// A condition clause, such as when and unless.
  /// </li>
  /// </ul>
  /// You can't change these elements of a static policy:
  ///
  /// <ul>
  /// <li>
  /// Changing a policy from a static policy to a template-linked policy.
  /// </li>
  /// <li>
  /// Changing the effect of a static policy from permit or forbid.
  /// </li>
  /// <li>
  /// The principal referenced by a static policy.
  /// </li>
  /// <li>
  /// The resource referenced by a static policy.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// To update a template-linked policy, you must update the template instead.
  /// </li>
  /// </ul> </note> <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [definition] :
  /// Specifies the updated policy content that you want to replace on the
  /// specified policy. The content must be valid Cedar policy language text.
  ///
  /// You can change only the following elements from the policy definition:
  ///
  /// <ul>
  /// <li>
  /// The <code>action</code> referenced by the policy.
  /// </li>
  /// <li>
  /// Any conditional clauses, such as <code>when</code> or <code>unless</code>
  /// clauses.
  /// </li>
  /// </ul>
  /// You <b>can't</b> change the following elements:
  ///
  /// <ul>
  /// <li>
  /// Changing from <code>static</code> to <code>templateLinked</code>.
  /// </li>
  /// <li>
  /// Changing the effect of the policy from <code>permit</code> or
  /// <code>forbid</code>.
  /// </li>
  /// <li>
  /// The <code>principal</code> referenced by the policy.
  /// </li>
  /// <li>
  /// The <code>resource</code> referenced by the policy.
  /// </li>
  /// </ul>
  ///
  /// Parameter [policyId] :
  /// Specifies the ID of the policy that you want to update. To find this
  /// value, you can use <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html">ListPolicies</a>.
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the policy that you
  /// want to update.
  Future<UpdatePolicyOutput> updatePolicy({
    required UpdatePolicyDefinition definition,
    required String policyId,
    required String policyStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.UpdatePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        'policyId': policyId,
        'policyStoreId': policyStoreId,
      },
    );

    return UpdatePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Modifies the validation setting for a policy store.
  /// <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that you want to update
  ///
  /// Parameter [validationSettings] :
  /// A structure that defines the validation settings that want to enable for
  /// the policy store.
  ///
  /// Parameter [description] :
  /// Descriptive text that you can provide to help with identification of the
  /// current policy store.
  Future<UpdatePolicyStoreOutput> updatePolicyStore({
    required String policyStoreId,
    required ValidationSettings validationSettings,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.UpdatePolicyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        'validationSettings': validationSettings,
        if (description != null) 'description': description,
      },
    );

    return UpdatePolicyStoreOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified policy template. You can update only the description
  /// and the some elements of the <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyTemplate.html#amazonverifiedpermissions-UpdatePolicyTemplate-request-policyBody">policyBody</a>.
  /// <important>
  /// Changes you make to the policy template content are immediately (within
  /// the constraints of eventual consistency) reflected in authorization
  /// decisions that involve all template-linked policies instantiated from this
  /// template.
  /// </important> <note>
  /// Verified Permissions is <i> <a
  /// href="https://wikipedia.org/wiki/Eventual_consistency">eventually
  /// consistent</a> </i>. It can take a few seconds for a new or changed
  /// element to propagate through the service and be visible in the results of
  /// other Verified Permissions operations.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyStoreId] :
  /// Specifies the ID of the policy store that contains the policy template
  /// that you want to update.
  ///
  /// Parameter [policyTemplateId] :
  /// Specifies the ID of the policy template that you want to update.
  ///
  /// Parameter [statement] :
  /// Specifies new statement content written in Cedar policy language to
  /// replace the current body of the policy template.
  ///
  /// You can change only the following elements of the policy body:
  ///
  /// <ul>
  /// <li>
  /// The <code>action</code> referenced by the policy template.
  /// </li>
  /// <li>
  /// Any conditional clauses, such as <code>when</code> or <code>unless</code>
  /// clauses.
  /// </li>
  /// </ul>
  /// You <b>can't</b> change the following elements:
  ///
  /// <ul>
  /// <li>
  /// The effect (<code>permit</code> or <code>forbid</code>) of the policy
  /// template.
  /// </li>
  /// <li>
  /// The <code>principal</code> referenced by the policy template.
  /// </li>
  /// <li>
  /// The <code>resource</code> referenced by the policy template.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// Specifies a new description to apply to the policy template.
  Future<UpdatePolicyTemplateOutput> updatePolicyTemplate({
    required String policyStoreId,
    required String policyTemplateId,
    required String statement,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VerifiedPermissions.UpdatePolicyTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyStoreId': policyStoreId,
        'policyTemplateId': policyTemplateId,
        'statement': statement,
        if (description != null) 'description': description,
      },
    );

    return UpdatePolicyTemplateOutput.fromJson(jsonResponse.body);
  }
}

/// Contains information about an action for a request for which an
/// authorization decision is made.
///
/// This data type is used as a request parameter to the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html">IsAuthorized</a>,
/// <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html">BatchIsAuthorized</a>,
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>
/// operations.
///
/// Example: <code>{ "actionId": "&lt;action name&gt;", "actionType": "Action"
/// }</code>
class ActionIdentifier {
  /// The ID of an action.
  final String actionId;

  /// The type of an action.
  final String actionType;

  ActionIdentifier({
    required this.actionId,
    required this.actionType,
  });

  factory ActionIdentifier.fromJson(Map<String, dynamic> json) {
    return ActionIdentifier(
      actionId: json['actionId'] as String,
      actionType: json['actionType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final actionType = this.actionType;
    return {
      'actionId': actionId,
      'actionType': actionType,
    };
  }
}

/// The value of an attribute.
///
/// Contains information about the runtime context for a request for which an
/// authorization decision is made.
///
/// This data type is used as a member of the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ContextDefinition.html">ContextDefinition</a>
/// structure which is uses as a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html">IsAuthorized</a>,
/// <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html">BatchIsAuthorized</a>,
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>
/// operations.
class AttributeValue {
  /// An attribute value of <a
  /// href="https://docs.cedarpolicy.com/policies/syntax-datatypes.html#boolean">Boolean</a>
  /// type.
  ///
  /// Example: <code>{"boolean": true}</code>
  final bool? boolean;

  /// An attribute value of type <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EntityIdentifier.html">EntityIdentifier</a>.
  ///
  /// Example: <code>"entityIdentifier": { "entityId": "&lt;id&gt;", "entityType":
  /// "&lt;entity type&gt;"}</code>
  final EntityIdentifier? entityIdentifier;

  /// An attribute value of <a
  /// href="https://docs.cedarpolicy.com/policies/syntax-datatypes.html#long">Long</a>
  /// type.
  ///
  /// Example: <code>{"long": 0}</code>
  final int? long;

  /// An attribute value of <a
  /// href="https://docs.cedarpolicy.com/policies/syntax-datatypes.html#record">Record</a>
  /// type.
  ///
  /// Example: <code>{"record": { "keyName": {} } }</code>
  final Map<String, AttributeValue>? record;

  /// An attribute value of <a
  /// href="https://docs.cedarpolicy.com/policies/syntax-datatypes.html#set">Set</a>
  /// type.
  ///
  /// Example: <code>{"set": [ {} ] }</code>
  final List<AttributeValue>? set;

  /// An attribute value of <a
  /// href="https://docs.cedarpolicy.com/policies/syntax-datatypes.html#string">String</a>
  /// type.
  ///
  /// Example: <code>{"string": "abc"}</code>
  final String? string;

  AttributeValue({
    this.boolean,
    this.entityIdentifier,
    this.long,
    this.record,
    this.set,
    this.string,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) {
    return AttributeValue(
      boolean: json['boolean'] as bool?,
      entityIdentifier: json['entityIdentifier'] != null
          ? EntityIdentifier.fromJson(
              json['entityIdentifier'] as Map<String, dynamic>)
          : null,
      long: json['long'] as int?,
      record: (json['record'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      set: (json['set'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      string: json['string'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final boolean = this.boolean;
    final entityIdentifier = this.entityIdentifier;
    final long = this.long;
    final record = this.record;
    final set = this.set;
    final string = this.string;
    return {
      if (boolean != null) 'boolean': boolean,
      if (entityIdentifier != null) 'entityIdentifier': entityIdentifier,
      if (long != null) 'long': long,
      if (record != null) 'record': record,
      if (set != null) 'set': set,
      if (string != null) 'string': string,
    };
  }
}

/// An authorization request that you include in a
/// <code>BatchIsAuthorized</code> API request.
class BatchIsAuthorizedInputItem {
  /// Specifies the requested action to be authorized. For example,
  /// <code>PhotoFlash::ReadPhoto</code>.
  final ActionIdentifier? action;

  /// Specifies additional context that can be used to make more granular
  /// authorization decisions.
  final ContextDefinition? context;

  /// Specifies the principal for which the authorization decision is to be made.
  final EntityIdentifier? principal;

  /// Specifies the resource that you want an authorization decision for. For
  /// example, <code>PhotoFlash::Photo</code>.
  final EntityIdentifier? resource;

  BatchIsAuthorizedInputItem({
    this.action,
    this.context,
    this.principal,
    this.resource,
  });

  factory BatchIsAuthorizedInputItem.fromJson(Map<String, dynamic> json) {
    return BatchIsAuthorizedInputItem(
      action: json['action'] != null
          ? ActionIdentifier.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      context: json['context'] != null
          ? ContextDefinition.fromJson(json['context'] as Map<String, dynamic>)
          : null,
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final context = this.context;
    final principal = this.principal;
    final resource = this.resource;
    return {
      if (action != null) 'action': action,
      if (context != null) 'context': context,
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

class BatchIsAuthorizedOutput {
  /// A series of <code>Allow</code> or <code>Deny</code> decisions for each
  /// request, and the policies that produced them.
  final List<BatchIsAuthorizedOutputItem> results;

  BatchIsAuthorizedOutput({
    required this.results,
  });

  factory BatchIsAuthorizedOutput.fromJson(Map<String, dynamic> json) {
    return BatchIsAuthorizedOutput(
      results: (json['results'] as List)
          .whereNotNull()
          .map((e) =>
              BatchIsAuthorizedOutputItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      'results': results,
    };
  }
}

/// The decision, based on policy evaluation, from an individual authorization
/// request in a <code>BatchIsAuthorized</code> API request.
class BatchIsAuthorizedOutputItem {
  /// An authorization decision that indicates if the authorization request should
  /// be allowed or denied.
  final Decision decision;

  /// The list of determining policies used to make the authorization decision.
  /// For example, if there are two matching policies, where one is a forbid and
  /// the other is a permit, then the forbid policy will be the determining
  /// policy. In the case of multiple matching permit policies then there would be
  /// multiple determining policies. In the case that no policies match, and hence
  /// the response is DENY, there would be no determining policies.
  final List<DeterminingPolicyItem> determiningPolicies;

  /// Errors that occurred while making an authorization decision. For example, a
  /// policy might reference an entity or attribute that doesn't exist in the
  /// request.
  final List<EvaluationErrorItem> errors;

  /// The authorization request that initiated the decision.
  final BatchIsAuthorizedInputItem request;

  BatchIsAuthorizedOutputItem({
    required this.decision,
    required this.determiningPolicies,
    required this.errors,
    required this.request,
  });

  factory BatchIsAuthorizedOutputItem.fromJson(Map<String, dynamic> json) {
    return BatchIsAuthorizedOutputItem(
      decision: (json['decision'] as String).toDecision(),
      determiningPolicies: (json['determiningPolicies'] as List)
          .whereNotNull()
          .map((e) => DeterminingPolicyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => EvaluationErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      request: BatchIsAuthorizedInputItem.fromJson(
          json['request'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final decision = this.decision;
    final determiningPolicies = this.determiningPolicies;
    final errors = this.errors;
    final request = this.request;
    return {
      'decision': decision.toValue(),
      'determiningPolicies': determiningPolicies,
      'errors': errors,
      'request': request,
    };
  }
}

/// An authorization request that you include in a
/// <code>BatchIsAuthorizedWithToken</code> API request.
class BatchIsAuthorizedWithTokenInputItem {
  /// Specifies the requested action to be authorized. For example,
  /// <code>PhotoFlash::ReadPhoto</code>.
  final ActionIdentifier? action;

  /// Specifies additional context that can be used to make more granular
  /// authorization decisions.
  final ContextDefinition? context;

  /// Specifies the resource that you want an authorization decision for. For
  /// example, <code>PhotoFlash::Photo</code>.
  final EntityIdentifier? resource;

  BatchIsAuthorizedWithTokenInputItem({
    this.action,
    this.context,
    this.resource,
  });

  factory BatchIsAuthorizedWithTokenInputItem.fromJson(
      Map<String, dynamic> json) {
    return BatchIsAuthorizedWithTokenInputItem(
      action: json['action'] != null
          ? ActionIdentifier.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      context: json['context'] != null
          ? ContextDefinition.fromJson(json['context'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final context = this.context;
    final resource = this.resource;
    return {
      if (action != null) 'action': action,
      if (context != null) 'context': context,
      if (resource != null) 'resource': resource,
    };
  }
}

class BatchIsAuthorizedWithTokenOutput {
  /// A series of <code>Allow</code> or <code>Deny</code> decisions for each
  /// request, and the policies that produced them.
  final List<BatchIsAuthorizedWithTokenOutputItem> results;

  /// The identifier of the principal in the ID or access token.
  final EntityIdentifier? principal;

  BatchIsAuthorizedWithTokenOutput({
    required this.results,
    this.principal,
  });

  factory BatchIsAuthorizedWithTokenOutput.fromJson(Map<String, dynamic> json) {
    return BatchIsAuthorizedWithTokenOutput(
      results: (json['results'] as List)
          .whereNotNull()
          .map((e) => BatchIsAuthorizedWithTokenOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final principal = this.principal;
    return {
      'results': results,
      if (principal != null) 'principal': principal,
    };
  }
}

/// The decision, based on policy evaluation, from an individual authorization
/// request in a <code>BatchIsAuthorizedWithToken</code> API request.
class BatchIsAuthorizedWithTokenOutputItem {
  /// An authorization decision that indicates if the authorization request should
  /// be allowed or denied.
  final Decision decision;

  /// The list of determining policies used to make the authorization decision.
  /// For example, if there are two matching policies, where one is a forbid and
  /// the other is a permit, then the forbid policy will be the determining
  /// policy. In the case of multiple matching permit policies then there would be
  /// multiple determining policies. In the case that no policies match, and hence
  /// the response is DENY, there would be no determining policies.
  final List<DeterminingPolicyItem> determiningPolicies;

  /// Errors that occurred while making an authorization decision. For example, a
  /// policy might reference an entity or attribute that doesn't exist in the
  /// request.
  final List<EvaluationErrorItem> errors;

  /// The authorization request that initiated the decision.
  final BatchIsAuthorizedWithTokenInputItem request;

  BatchIsAuthorizedWithTokenOutputItem({
    required this.decision,
    required this.determiningPolicies,
    required this.errors,
    required this.request,
  });

  factory BatchIsAuthorizedWithTokenOutputItem.fromJson(
      Map<String, dynamic> json) {
    return BatchIsAuthorizedWithTokenOutputItem(
      decision: (json['decision'] as String).toDecision(),
      determiningPolicies: (json['determiningPolicies'] as List)
          .whereNotNull()
          .map((e) => DeterminingPolicyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => EvaluationErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      request: BatchIsAuthorizedWithTokenInputItem.fromJson(
          json['request'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final decision = this.decision;
    final determiningPolicies = this.determiningPolicies;
    final errors = this.errors;
    final request = this.request;
    return {
      'decision': decision.toValue(),
      'determiningPolicies': determiningPolicies,
      'errors': errors,
      'request': request,
    };
  }
}

/// The type of entity that a policy store maps to groups from an Amazon Cognito
/// user pool identity source.
///
/// This data type is part of a <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CognitoUserPoolConfiguration.html">CognitoUserPoolConfiguration</a>
/// structure and is a request parameter in <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html">CreateIdentitySource</a>.
class CognitoGroupConfiguration {
  /// The name of the schema entity type that's mapped to the user pool group.
  /// Defaults to <code>AWS::CognitoGroup</code>.
  final String groupEntityType;

  CognitoGroupConfiguration({
    required this.groupEntityType,
  });

  Map<String, dynamic> toJson() {
    final groupEntityType = this.groupEntityType;
    return {
      'groupEntityType': groupEntityType,
    };
  }
}

/// The type of entity that a policy store maps to groups from an Amazon Cognito
/// user pool identity source.
///
/// This data type is part of an <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CognitoUserPoolConfigurationItem.html">CognitoUserPoolConfigurationDetail</a>
/// structure and is a response parameter to <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html">GetIdentitySource</a>.
class CognitoGroupConfigurationDetail {
  /// The name of the schema entity type that's mapped to the user pool group.
  /// Defaults to <code>AWS::CognitoGroup</code>.
  final String? groupEntityType;

  CognitoGroupConfigurationDetail({
    this.groupEntityType,
  });

  factory CognitoGroupConfigurationDetail.fromJson(Map<String, dynamic> json) {
    return CognitoGroupConfigurationDetail(
      groupEntityType: json['groupEntityType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupEntityType = this.groupEntityType;
    return {
      if (groupEntityType != null) 'groupEntityType': groupEntityType,
    };
  }
}

/// The type of entity that a policy store maps to groups from an Amazon Cognito
/// user pool identity source.
///
/// This data type is part of an <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CognitoUserPoolConfigurationDetail.html">CognitoUserPoolConfigurationItem</a>
/// structure and is a response parameter to <a
/// href="http://forums.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html">ListIdentitySources</a>.
class CognitoGroupConfigurationItem {
  /// The name of the schema entity type that's mapped to the user pool group.
  /// Defaults to <code>AWS::CognitoGroup</code>.
  final String? groupEntityType;

  CognitoGroupConfigurationItem({
    this.groupEntityType,
  });

  factory CognitoGroupConfigurationItem.fromJson(Map<String, dynamic> json) {
    return CognitoGroupConfigurationItem(
      groupEntityType: json['groupEntityType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupEntityType = this.groupEntityType;
    return {
      if (groupEntityType != null) 'groupEntityType': groupEntityType,
    };
  }
}

/// The configuration for an identity source that represents a connection to an
/// Amazon Cognito user pool used as an identity provider for Verified
/// Permissions.
///
/// This data type is used as a field that is part of an <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_Configuration.html">Configuration</a>
/// structure that is used as a parameter to <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html">CreateIdentitySource</a>.
///
/// Example:<code>"CognitoUserPoolConfiguration":{"UserPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","ClientIds":
/// ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType":
/// "MyCorp::Group"}}</code>
class CognitoUserPoolConfiguration {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the Amazon Cognito user pool that contains the
  /// identities to be authorized.
  ///
  /// Example: <code>"UserPoolArn":
  /// "arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5"</code>
  final String userPoolArn;

  /// The unique application client IDs that are associated with the specified
  /// Amazon Cognito user pool.
  ///
  /// Example: <code>"ClientIds": ["&amp;ExampleCogClientId;"]</code>
  final List<String>? clientIds;

  /// The type of entity that a policy store maps to groups from an Amazon Cognito
  /// user pool identity source.
  final CognitoGroupConfiguration? groupConfiguration;

  CognitoUserPoolConfiguration({
    required this.userPoolArn,
    this.clientIds,
    this.groupConfiguration,
  });

  Map<String, dynamic> toJson() {
    final userPoolArn = this.userPoolArn;
    final clientIds = this.clientIds;
    final groupConfiguration = this.groupConfiguration;
    return {
      'userPoolArn': userPoolArn,
      if (clientIds != null) 'clientIds': clientIds,
      if (groupConfiguration != null) 'groupConfiguration': groupConfiguration,
    };
  }
}

/// The configuration for an identity source that represents a connection to an
/// Amazon Cognito user pool used as an identity provider for Verified
/// Permissions.
///
/// This data type is used as a field that is part of an <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationDetail.html">ConfigurationDetail</a>
/// structure that is part of the response to <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html">GetIdentitySource</a>.
///
/// Example:<code>"CognitoUserPoolConfiguration":{"UserPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","ClientIds":
/// ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType":
/// "MyCorp::Group"}}</code>
class CognitoUserPoolConfigurationDetail {
  /// The unique application client IDs that are associated with the specified
  /// Amazon Cognito user pool.
  ///
  /// Example: <code>"clientIds": ["&amp;ExampleCogClientId;"]</code>
  final List<String> clientIds;

  /// The OpenID Connect (OIDC) <code>issuer</code> ID of the Amazon Cognito user
  /// pool that contains the identities to be authorized.
  ///
  /// Example: <code>"issuer":
  /// "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_1a2b3c4d5"</code>
  final String issuer;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the Amazon Cognito user pool that contains the
  /// identities to be authorized.
  ///
  /// Example: <code>"userPoolArn":
  /// "arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5"</code>
  final String userPoolArn;

  /// The type of entity that a policy store maps to groups from an Amazon Cognito
  /// user pool identity source.
  final CognitoGroupConfigurationDetail? groupConfiguration;

  CognitoUserPoolConfigurationDetail({
    required this.clientIds,
    required this.issuer,
    required this.userPoolArn,
    this.groupConfiguration,
  });

  factory CognitoUserPoolConfigurationDetail.fromJson(
      Map<String, dynamic> json) {
    return CognitoUserPoolConfigurationDetail(
      clientIds: (json['clientIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      issuer: json['issuer'] as String,
      userPoolArn: json['userPoolArn'] as String,
      groupConfiguration: json['groupConfiguration'] != null
          ? CognitoGroupConfigurationDetail.fromJson(
              json['groupConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientIds = this.clientIds;
    final issuer = this.issuer;
    final userPoolArn = this.userPoolArn;
    final groupConfiguration = this.groupConfiguration;
    return {
      'clientIds': clientIds,
      'issuer': issuer,
      'userPoolArn': userPoolArn,
      if (groupConfiguration != null) 'groupConfiguration': groupConfiguration,
    };
  }
}

/// The configuration for an identity source that represents a connection to an
/// Amazon Cognito user pool used as an identity provider for Verified
/// Permissions.
///
/// This data type is used as a field that is part of the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationItem.html">ConfigurationItem</a>
/// structure that is part of the response to <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html">ListIdentitySources</a>.
///
/// Example:<code>"CognitoUserPoolConfiguration":{"UserPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","ClientIds":
/// ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType":
/// "MyCorp::Group"}}</code>
class CognitoUserPoolConfigurationItem {
  /// The unique application client IDs that are associated with the specified
  /// Amazon Cognito user pool.
  ///
  /// Example: <code>"clientIds": ["&amp;ExampleCogClientId;"]</code>
  final List<String> clientIds;

  /// The OpenID Connect (OIDC) <code>issuer</code> ID of the Amazon Cognito user
  /// pool that contains the identities to be authorized.
  ///
  /// Example: <code>"issuer":
  /// "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_1a2b3c4d5"</code>
  final String issuer;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the Amazon Cognito user pool that contains the
  /// identities to be authorized.
  ///
  /// Example: <code>"userPoolArn":
  /// "arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5"</code>
  final String userPoolArn;

  /// The type of entity that a policy store maps to groups from an Amazon Cognito
  /// user pool identity source.
  final CognitoGroupConfigurationItem? groupConfiguration;

  CognitoUserPoolConfigurationItem({
    required this.clientIds,
    required this.issuer,
    required this.userPoolArn,
    this.groupConfiguration,
  });

  factory CognitoUserPoolConfigurationItem.fromJson(Map<String, dynamic> json) {
    return CognitoUserPoolConfigurationItem(
      clientIds: (json['clientIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      issuer: json['issuer'] as String,
      userPoolArn: json['userPoolArn'] as String,
      groupConfiguration: json['groupConfiguration'] != null
          ? CognitoGroupConfigurationItem.fromJson(
              json['groupConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientIds = this.clientIds;
    final issuer = this.issuer;
    final userPoolArn = this.userPoolArn;
    final groupConfiguration = this.groupConfiguration;
    return {
      'clientIds': clientIds,
      'issuer': issuer,
      'userPoolArn': userPoolArn,
      if (groupConfiguration != null) 'groupConfiguration': groupConfiguration,
    };
  }
}

/// Contains configuration information used when creating a new identity source.
/// <note>
/// At this time, the only valid member of this structure is a Amazon Cognito
/// user pool configuration.
///
/// Specifies a <code>userPoolArn</code>, a <code>groupConfiguration</code>, and
/// a <code>ClientId</code>.
/// </note>
/// This data type is used as a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html">CreateIdentitySource</a>
/// operation.
class Configuration {
  /// Contains configuration details of a Amazon Cognito user pool that Verified
  /// Permissions can use as a source of authenticated identities as entities. It
  /// specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of a Amazon Cognito user pool and one or more
  /// application client IDs.
  ///
  /// Example:
  /// <code>"configuration":{"cognitoUserPoolConfiguration":{"userPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","clientIds":
  /// ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType":
  /// "MyCorp::Group"}}}</code>
  final CognitoUserPoolConfiguration? cognitoUserPoolConfiguration;

  Configuration({
    this.cognitoUserPoolConfiguration,
  });

  Map<String, dynamic> toJson() {
    final cognitoUserPoolConfiguration = this.cognitoUserPoolConfiguration;
    return {
      if (cognitoUserPoolConfiguration != null)
        'cognitoUserPoolConfiguration': cognitoUserPoolConfiguration,
    };
  }
}

/// Contains configuration information about an identity source.
///
/// This data type is a response parameter to the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html">GetIdentitySource</a>
/// operation.
class ConfigurationDetail {
  /// Contains configuration details of a Amazon Cognito user pool that Verified
  /// Permissions can use as a source of authenticated identities as entities. It
  /// specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of a Amazon Cognito user pool, the policy store
  /// entity that you want to assign to user groups, and one or more application
  /// client IDs.
  ///
  /// Example:
  /// <code>"configuration":{"cognitoUserPoolConfiguration":{"userPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","clientIds":
  /// ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType":
  /// "MyCorp::Group"}}}</code>
  final CognitoUserPoolConfigurationDetail? cognitoUserPoolConfiguration;

  ConfigurationDetail({
    this.cognitoUserPoolConfiguration,
  });

  factory ConfigurationDetail.fromJson(Map<String, dynamic> json) {
    return ConfigurationDetail(
      cognitoUserPoolConfiguration: json['cognitoUserPoolConfiguration'] != null
          ? CognitoUserPoolConfigurationDetail.fromJson(
              json['cognitoUserPoolConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cognitoUserPoolConfiguration = this.cognitoUserPoolConfiguration;
    return {
      if (cognitoUserPoolConfiguration != null)
        'cognitoUserPoolConfiguration': cognitoUserPoolConfiguration,
    };
  }
}

/// Contains configuration information about an identity source.
///
/// This data type is a response parameter to the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html">ListIdentitySources</a>
/// operation.
class ConfigurationItem {
  /// Contains configuration details of a Amazon Cognito user pool that Verified
  /// Permissions can use as a source of authenticated identities as entities. It
  /// specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of a Amazon Cognito user pool, the policy store
  /// entity that you want to assign to user groups, and one or more application
  /// client IDs.
  ///
  /// Example:
  /// <code>"configuration":{"cognitoUserPoolConfiguration":{"userPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","clientIds":
  /// ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType":
  /// "MyCorp::Group"}}}</code>
  final CognitoUserPoolConfigurationItem? cognitoUserPoolConfiguration;

  ConfigurationItem({
    this.cognitoUserPoolConfiguration,
  });

  factory ConfigurationItem.fromJson(Map<String, dynamic> json) {
    return ConfigurationItem(
      cognitoUserPoolConfiguration: json['cognitoUserPoolConfiguration'] != null
          ? CognitoUserPoolConfigurationItem.fromJson(
              json['cognitoUserPoolConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cognitoUserPoolConfiguration = this.cognitoUserPoolConfiguration;
    return {
      if (cognitoUserPoolConfiguration != null)
        'cognitoUserPoolConfiguration': cognitoUserPoolConfiguration,
    };
  }
}

/// Contains additional details about the context of the request. Verified
/// Permissions evaluates this information in an authorization request as part
/// of the <code>when</code> and <code>unless</code> clauses in a policy.
///
/// This data type is used as a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html">IsAuthorized</a>,
/// <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html">BatchIsAuthorized</a>,
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>
/// operations.
///
/// Example:
/// <code>"context":{"contextMap":{"&lt;KeyName1&gt;":{"boolean":true},"&lt;KeyName2&gt;":{"long":1234}}}</code>
class ContextDefinition {
  /// An list of attributes that are needed to successfully evaluate an
  /// authorization request. Each attribute in this array must include a map of a
  /// data type and its value.
  ///
  /// Example:
  /// <code>"contextMap":{"&lt;KeyName1&gt;":{"boolean":true},"&lt;KeyName2&gt;":{"long":1234}}</code>
  final Map<String, AttributeValue>? contextMap;

  ContextDefinition({
    this.contextMap,
  });

  factory ContextDefinition.fromJson(Map<String, dynamic> json) {
    return ContextDefinition(
      contextMap: (json['contextMap'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final contextMap = this.contextMap;
    return {
      if (contextMap != null) 'contextMap': contextMap,
    };
  }
}

class CreateIdentitySourceOutput {
  /// The date and time the identity source was originally created.
  final DateTime createdDate;

  /// The unique ID of the new identity source.
  final String identitySourceId;

  /// The date and time the identity source was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store that contains the identity source.
  final String policyStoreId;

  CreateIdentitySourceOutput({
    required this.createdDate,
    required this.identitySourceId,
    required this.lastUpdatedDate,
    required this.policyStoreId,
  });

  factory CreateIdentitySourceOutput.fromJson(Map<String, dynamic> json) {
    return CreateIdentitySourceOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      identitySourceId: json['identitySourceId'] as String,
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final identitySourceId = this.identitySourceId;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'identitySourceId': identitySourceId,
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
    };
  }
}

class CreatePolicyOutput {
  /// The date and time the policy was originally created.
  final DateTime createdDate;

  /// The date and time the policy was last updated.
  final DateTime lastUpdatedDate;

  /// The unique ID of the new policy.
  final String policyId;

  /// The ID of the policy store that contains the new policy.
  final String policyStoreId;

  /// The policy type of the new policy.
  final PolicyType policyType;

  /// The action that a policy permits or forbids. For example, <code>{"actions":
  /// [{"actionId": "ViewPhoto", "actionType": "PhotoFlash::Action"}, {"entityID":
  /// "SharePhoto", "entityType": "PhotoFlash::Action"}]}</code>.
  final List<ActionIdentifier>? actions;

  /// The effect of the decision that a policy returns to an authorization
  /// request. For example, <code>"effect": "Permit"</code>.
  final PolicyEffect? effect;

  /// The principal specified in the new policy's scope. This response element
  /// isn't present when <code>principal</code> isn't specified in the policy
  /// content.
  final EntityIdentifier? principal;

  /// The resource specified in the new policy's scope. This response element
  /// isn't present when the <code>resource</code> isn't specified in the policy
  /// content.
  final EntityIdentifier? resource;

  CreatePolicyOutput({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyId,
    required this.policyStoreId,
    required this.policyType,
    this.actions,
    this.effect,
    this.principal,
    this.resource,
  });

  factory CreatePolicyOutput.fromJson(Map<String, dynamic> json) {
    return CreatePolicyOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyId: json['policyId'] as String,
      policyStoreId: json['policyStoreId'] as String,
      policyType: (json['policyType'] as String).toPolicyType(),
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => ActionIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      effect: (json['effect'] as String?)?.toPolicyEffect(),
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyId = this.policyId;
    final policyStoreId = this.policyStoreId;
    final policyType = this.policyType;
    final actions = this.actions;
    final effect = this.effect;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyId': policyId,
      'policyStoreId': policyStoreId,
      'policyType': policyType.toValue(),
      if (actions != null) 'actions': actions,
      if (effect != null) 'effect': effect.toValue(),
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

class CreatePolicyStoreOutput {
  /// The Amazon Resource Name (ARN) of the new policy store.
  final String arn;

  /// The date and time the policy store was originally created.
  final DateTime createdDate;

  /// The date and time the policy store was last updated.
  final DateTime lastUpdatedDate;

  /// The unique ID of the new policy store.
  final String policyStoreId;

  CreatePolicyStoreOutput({
    required this.arn,
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
  });

  factory CreatePolicyStoreOutput.fromJson(Map<String, dynamic> json) {
    return CreatePolicyStoreOutput(
      arn: json['arn'] as String,
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    return {
      'arn': arn,
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
    };
  }
}

class CreatePolicyTemplateOutput {
  /// The date and time the policy template was originally created.
  final DateTime createdDate;

  /// The date and time the policy template was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store that contains the policy template.
  final String policyStoreId;

  /// The unique ID of the new policy template.
  final String policyTemplateId;

  CreatePolicyTemplateOutput({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.policyTemplateId,
  });

  factory CreatePolicyTemplateOutput.fromJson(Map<String, dynamic> json) {
    return CreatePolicyTemplateOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      policyTemplateId: json['policyTemplateId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final policyTemplateId = this.policyTemplateId;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'policyTemplateId': policyTemplateId,
    };
  }
}

enum Decision {
  allow,
  deny,
}

extension DecisionValueExtension on Decision {
  String toValue() {
    switch (this) {
      case Decision.allow:
        return 'ALLOW';
      case Decision.deny:
        return 'DENY';
    }
  }
}

extension DecisionFromString on String {
  Decision toDecision() {
    switch (this) {
      case 'ALLOW':
        return Decision.allow;
      case 'DENY':
        return Decision.deny;
    }
    throw Exception('$this is not known in enum Decision');
  }
}

class DeleteIdentitySourceOutput {
  DeleteIdentitySourceOutput();

  factory DeleteIdentitySourceOutput.fromJson(Map<String, dynamic> _) {
    return DeleteIdentitySourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePolicyOutput {
  DeletePolicyOutput();

  factory DeletePolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeletePolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePolicyStoreOutput {
  DeletePolicyStoreOutput();

  factory DeletePolicyStoreOutput.fromJson(Map<String, dynamic> _) {
    return DeletePolicyStoreOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePolicyTemplateOutput {
  DeletePolicyTemplateOutput();

  factory DeletePolicyTemplateOutput.fromJson(Map<String, dynamic> _) {
    return DeletePolicyTemplateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about one of the policies that determined an
/// authorization decision.
///
/// This data type is used as an element in a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html">IsAuthorized</a>,
/// <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html">BatchIsAuthorized</a>,
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>
/// operations.
///
/// Example:
/// <code>"determiningPolicies":[{"policyId":"SPEXAMPLEabcdefg111111"}]</code>
class DeterminingPolicyItem {
  /// The Id of a policy that determined to an authorization decision.
  ///
  /// Example: <code>"policyId":"SPEXAMPLEabcdefg111111"</code>
  final String policyId;

  DeterminingPolicyItem({
    required this.policyId,
  });

  factory DeterminingPolicyItem.fromJson(Map<String, dynamic> json) {
    return DeterminingPolicyItem(
      policyId: json['policyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policyId = this.policyId;
    return {
      'policyId': policyId,
    };
  }
}

/// Contains the list of entities to be considered during an authorization
/// request. This includes all principals, resources, and actions required to
/// successfully evaluate the request.
///
/// This data type is used as a field in the response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html">IsAuthorized</a>
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>
/// operations.
class EntitiesDefinition {
  /// An array of entities that are needed to successfully evaluate an
  /// authorization request. Each entity in this array must include an identifier
  /// for the entity, the attributes of the entity, and a list of any parent
  /// entities.
  final List<EntityItem>? entityList;

  EntitiesDefinition({
    this.entityList,
  });

  Map<String, dynamic> toJson() {
    final entityList = this.entityList;
    return {
      if (entityList != null) 'entityList': entityList,
    };
  }
}

/// Contains the identifier of an entity, including its ID and type.
///
/// This data type is used as a request parameter for <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html">IsAuthorized</a>
/// operation, and as a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html">CreatePolicy</a>,
/// <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetPolicy.html">GetPolicy</a>,
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicy.html">UpdatePolicy</a>
/// operations.
///
/// Example:
/// <code>{"entityId":"<i>string</i>","entityType":"<i>string</i>"}</code>
class EntityIdentifier {
  /// The identifier of an entity.
  ///
  /// <code>"entityId":"<i>identifier</i>"</code>
  final String entityId;

  /// The type of an entity.
  ///
  /// Example: <code>"entityType":"<i>typeName</i>"</code>
  final String entityType;

  EntityIdentifier({
    required this.entityId,
    required this.entityType,
  });

  factory EntityIdentifier.fromJson(Map<String, dynamic> json) {
    return EntityIdentifier(
      entityId: json['entityId'] as String,
      entityType: json['entityType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final entityType = this.entityType;
    return {
      'entityId': entityId,
      'entityType': entityType,
    };
  }
}

/// Contains information about an entity that can be referenced in a Cedar
/// policy.
///
/// This data type is used as one of the fields in the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EntitiesDefinition.html">EntitiesDefinition</a>
/// structure.
///
/// <code>{ "identifier": { "entityType": "Photo", "entityId":
/// "VacationPhoto94.jpg" }, "attributes": {}, "parents": [ { "entityType":
/// "Album", "entityId": "alice_folder" } ] }</code>
class EntityItem {
  /// The identifier of the entity.
  final EntityIdentifier identifier;

  /// A list of attributes for the entity.
  final Map<String, AttributeValue>? attributes;

  /// The parents in the hierarchy that contains the entity.
  final List<EntityIdentifier>? parents;

  EntityItem({
    required this.identifier,
    this.attributes,
    this.parents,
  });

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final attributes = this.attributes;
    final parents = this.parents;
    return {
      'identifier': identifier,
      if (attributes != null) 'attributes': attributes,
      if (parents != null) 'parents': parents,
    };
  }
}

/// Contains information about a principal or resource that can be referenced in
/// a Cedar policy.
///
/// This data type is used as part of the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyFilter.html">PolicyFilter</a>
/// structure that is used as a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html">ListPolicies</a>
/// operation..
class EntityReference {
  /// The identifier of the entity. It can consist of either an EntityType and
  /// EntityId, a principal, or a resource.
  final EntityIdentifier? identifier;

  /// Used to indicate that a principal or resource is not specified. This can be
  /// used to search for policies that are not associated with a specific
  /// principal or resource.
  final bool? unspecified;

  EntityReference({
    this.identifier,
    this.unspecified,
  });

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final unspecified = this.unspecified;
    return {
      if (identifier != null) 'identifier': identifier,
      if (unspecified != null) 'unspecified': unspecified,
    };
  }
}

/// Contains a description of an evaluation error.
///
/// This data type is a response parameter of the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html">IsAuthorized</a>,
/// <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html">BatchIsAuthorized</a>,
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html">IsAuthorizedWithToken</a>
/// operations.
class EvaluationErrorItem {
  /// The error description.
  final String errorDescription;

  EvaluationErrorItem({
    required this.errorDescription,
  });

  factory EvaluationErrorItem.fromJson(Map<String, dynamic> json) {
    return EvaluationErrorItem(
      errorDescription: json['errorDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorDescription = this.errorDescription;
    return {
      'errorDescription': errorDescription,
    };
  }
}

class GetIdentitySourceOutput {
  /// The date and time that the identity source was originally created.
  final DateTime createdDate;

  /// The ID of the identity source.
  final String identitySourceId;

  /// The date and time that the identity source was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store that contains the identity source.
  final String policyStoreId;

  /// The data type of principals generated for identities authenticated by this
  /// identity source.
  final String principalEntityType;

  /// Contains configuration information about an identity source.
  final ConfigurationDetail? configuration;

  /// A structure that describes the configuration of the identity source.
  final IdentitySourceDetails? details;

  GetIdentitySourceOutput({
    required this.createdDate,
    required this.identitySourceId,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.principalEntityType,
    this.configuration,
    this.details,
  });

  factory GetIdentitySourceOutput.fromJson(Map<String, dynamic> json) {
    return GetIdentitySourceOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      identitySourceId: json['identitySourceId'] as String,
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      principalEntityType: json['principalEntityType'] as String,
      configuration: json['configuration'] != null
          ? ConfigurationDetail.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      details: json['details'] != null
          ? IdentitySourceDetails.fromJson(
              json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final identitySourceId = this.identitySourceId;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final principalEntityType = this.principalEntityType;
    final configuration = this.configuration;
    final details = this.details;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'identitySourceId': identitySourceId,
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'principalEntityType': principalEntityType,
      if (configuration != null) 'configuration': configuration,
      if (details != null) 'details': details,
    };
  }
}

class GetPolicyOutput {
  /// The date and time that the policy was originally created.
  final DateTime createdDate;

  /// The definition of the requested policy.
  final PolicyDefinitionDetail definition;

  /// The date and time that the policy was last updated.
  final DateTime lastUpdatedDate;

  /// The unique ID of the policy that you want information about.
  final String policyId;

  /// The ID of the policy store that contains the policy that you want
  /// information about.
  final String policyStoreId;

  /// The type of the policy.
  final PolicyType policyType;

  /// The action that a policy permits or forbids. For example, <code>{"actions":
  /// [{"actionId": "ViewPhoto", "actionType": "PhotoFlash::Action"}, {"entityID":
  /// "SharePhoto", "entityType": "PhotoFlash::Action"}]}</code>.
  final List<ActionIdentifier>? actions;

  /// The effect of the decision that a policy returns to an authorization
  /// request. For example, <code>"effect": "Permit"</code>.
  final PolicyEffect? effect;

  /// The principal specified in the policy's scope. This element isn't included
  /// in the response when <code>Principal</code> isn't present in the policy
  /// content.
  final EntityIdentifier? principal;

  /// The resource specified in the policy's scope. This element isn't included in
  /// the response when <code>Resource</code> isn't present in the policy content.
  final EntityIdentifier? resource;

  GetPolicyOutput({
    required this.createdDate,
    required this.definition,
    required this.lastUpdatedDate,
    required this.policyId,
    required this.policyStoreId,
    required this.policyType,
    this.actions,
    this.effect,
    this.principal,
    this.resource,
  });

  factory GetPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetPolicyOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      definition: PolicyDefinitionDetail.fromJson(
          json['definition'] as Map<String, dynamic>),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyId: json['policyId'] as String,
      policyStoreId: json['policyStoreId'] as String,
      policyType: (json['policyType'] as String).toPolicyType(),
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => ActionIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      effect: (json['effect'] as String?)?.toPolicyEffect(),
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final definition = this.definition;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyId = this.policyId;
    final policyStoreId = this.policyStoreId;
    final policyType = this.policyType;
    final actions = this.actions;
    final effect = this.effect;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'definition': definition,
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyId': policyId,
      'policyStoreId': policyStoreId,
      'policyType': policyType.toValue(),
      if (actions != null) 'actions': actions,
      if (effect != null) 'effect': effect.toValue(),
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

class GetPolicyStoreOutput {
  /// The Amazon Resource Name (ARN) of the policy store.
  final String arn;

  /// The date and time that the policy store was originally created.
  final DateTime createdDate;

  /// The date and time that the policy store was last updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store;
  final String policyStoreId;

  /// The current validation settings for the policy store.
  final ValidationSettings validationSettings;

  /// Descriptive text that you can provide to help with identification of the
  /// current policy store.
  final String? description;

  GetPolicyStoreOutput({
    required this.arn,
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.validationSettings,
    this.description,
  });

  factory GetPolicyStoreOutput.fromJson(Map<String, dynamic> json) {
    return GetPolicyStoreOutput(
      arn: json['arn'] as String,
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      validationSettings: ValidationSettings.fromJson(
          json['validationSettings'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final validationSettings = this.validationSettings;
    final description = this.description;
    return {
      'arn': arn,
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'validationSettings': validationSettings,
      if (description != null) 'description': description,
    };
  }
}

class GetPolicyTemplateOutput {
  /// The date and time that the policy template was originally created.
  final DateTime createdDate;

  /// The date and time that the policy template was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store that contains the policy template.
  final String policyStoreId;

  /// The ID of the policy template.
  final String policyTemplateId;

  /// The content of the body of the policy template written in the Cedar policy
  /// language.
  final String statement;

  /// The description of the policy template.
  final String? description;

  GetPolicyTemplateOutput({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.policyTemplateId,
    required this.statement,
    this.description,
  });

  factory GetPolicyTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetPolicyTemplateOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      policyTemplateId: json['policyTemplateId'] as String,
      statement: json['statement'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final policyTemplateId = this.policyTemplateId;
    final statement = this.statement;
    final description = this.description;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'policyTemplateId': policyTemplateId,
      'statement': statement,
      if (description != null) 'description': description,
    };
  }
}

class GetSchemaOutput {
  /// The date and time that the schema was originally created.
  final DateTime createdDate;

  /// The date and time that the schema was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store that contains the schema.
  final String policyStoreId;

  /// The body of the schema, written in Cedar schema JSON.
  final String schema;

  /// The namespaces of the entities referenced by this schema.
  final List<String>? namespaces;

  GetSchemaOutput({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.schema,
    this.namespaces,
  });

  factory GetSchemaOutput.fromJson(Map<String, dynamic> json) {
    return GetSchemaOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      schema: json['schema'] as String,
      namespaces: (json['namespaces'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final schema = this.schema;
    final namespaces = this.namespaces;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'schema': schema,
      if (namespaces != null) 'namespaces': namespaces,
    };
  }
}

/// A structure that contains configuration of the identity source.
///
/// This data type was a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html">GetIdentitySource</a>
/// operation. Replaced by <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationDetail.html">ConfigurationDetail</a>.
@Deprecated('This shape has been replaced by ConfigurationDetail')
class IdentitySourceDetails {
  /// The application client IDs associated with the specified Amazon Cognito user
  /// pool that are enabled for this identity source.
  final List<String>? clientIds;

  /// The well-known URL that points to this user pool's OIDC discovery endpoint.
  /// This is a URL string in the following format. This URL replaces the
  /// placeholders for both the Amazon Web Services Region and the user pool
  /// identifier with those appropriate for this user pool.
  ///
  /// <code>https://cognito-idp.<i>&lt;region&gt;</i>.amazonaws.com/<i>&lt;user-pool-id&gt;</i>/.well-known/openid-configuration</code>
  final String? discoveryUrl;

  /// A string that identifies the type of OIDC service represented by this
  /// identity source.
  ///
  /// At this time, the only valid value is <code>cognito</code>.
  final OpenIdIssuer? openIdIssuer;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the Amazon Cognito user pool whose identities are
  /// accessible to this Verified Permissions policy store.
  final String? userPoolArn;

  IdentitySourceDetails({
    this.clientIds,
    this.discoveryUrl,
    this.openIdIssuer,
    this.userPoolArn,
  });

  factory IdentitySourceDetails.fromJson(Map<String, dynamic> json) {
    return IdentitySourceDetails(
      clientIds: (json['clientIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      discoveryUrl: json['discoveryUrl'] as String?,
      openIdIssuer: (json['openIdIssuer'] as String?)?.toOpenIdIssuer(),
      userPoolArn: json['userPoolArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientIds = this.clientIds;
    final discoveryUrl = this.discoveryUrl;
    final openIdIssuer = this.openIdIssuer;
    final userPoolArn = this.userPoolArn;
    return {
      if (clientIds != null) 'clientIds': clientIds,
      if (discoveryUrl != null) 'discoveryUrl': discoveryUrl,
      if (openIdIssuer != null) 'openIdIssuer': openIdIssuer.toValue(),
      if (userPoolArn != null) 'userPoolArn': userPoolArn,
    };
  }
}

/// A structure that defines characteristics of an identity source that you can
/// use to filter.
///
/// This data type is a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentityStores.html">ListIdentityStores</a>
/// operation.
class IdentitySourceFilter {
  /// The Cedar entity type of the principals returned by the identity provider
  /// (IdP) associated with this identity source.
  final String? principalEntityType;

  IdentitySourceFilter({
    this.principalEntityType,
  });

  Map<String, dynamic> toJson() {
    final principalEntityType = this.principalEntityType;
    return {
      if (principalEntityType != null)
        'principalEntityType': principalEntityType,
    };
  }
}

/// A structure that defines an identity source.
///
/// This data type is a response parameter to the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html">ListIdentitySources</a>
/// operation.
class IdentitySourceItem {
  /// The date and time the identity source was originally created.
  final DateTime createdDate;

  /// The unique identifier of the identity source.
  final String identitySourceId;

  /// The date and time the identity source was most recently updated.
  final DateTime lastUpdatedDate;

  /// The identifier of the policy store that contains the identity source.
  final String policyStoreId;

  /// The Cedar entity type of the principals returned from the IdP associated
  /// with this identity source.
  final String principalEntityType;

  /// Contains configuration information about an identity source.
  final ConfigurationItem? configuration;

  /// A structure that contains the details of the associated identity provider
  /// (IdP).
  final IdentitySourceItemDetails? details;

  IdentitySourceItem({
    required this.createdDate,
    required this.identitySourceId,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.principalEntityType,
    this.configuration,
    this.details,
  });

  factory IdentitySourceItem.fromJson(Map<String, dynamic> json) {
    return IdentitySourceItem(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      identitySourceId: json['identitySourceId'] as String,
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      principalEntityType: json['principalEntityType'] as String,
      configuration: json['configuration'] != null
          ? ConfigurationItem.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      details: json['details'] != null
          ? IdentitySourceItemDetails.fromJson(
              json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final identitySourceId = this.identitySourceId;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final principalEntityType = this.principalEntityType;
    final configuration = this.configuration;
    final details = this.details;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'identitySourceId': identitySourceId,
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'principalEntityType': principalEntityType,
      if (configuration != null) 'configuration': configuration,
      if (details != null) 'details': details,
    };
  }
}

/// A structure that contains configuration of the identity source.
///
/// This data type was a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html">ListIdentitySources</a>
/// operation. Replaced by <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationItem.html">ConfigurationItem</a>.
@Deprecated('This shape has been replaced by ConfigurationItem')
class IdentitySourceItemDetails {
  /// The application client IDs associated with the specified Amazon Cognito user
  /// pool that are enabled for this identity source.
  final List<String>? clientIds;

  /// The well-known URL that points to this user pool's OIDC discovery endpoint.
  /// This is a URL string in the following format. This URL replaces the
  /// placeholders for both the Amazon Web Services Region and the user pool
  /// identifier with those appropriate for this user pool.
  ///
  /// <code>https://cognito-idp.<i>&lt;region&gt;</i>.amazonaws.com/<i>&lt;user-pool-id&gt;</i>/.well-known/openid-configuration</code>
  final String? discoveryUrl;

  /// A string that identifies the type of OIDC service represented by this
  /// identity source.
  ///
  /// At this time, the only valid value is <code>cognito</code>.
  final OpenIdIssuer? openIdIssuer;

  /// The Amazon Cognito user pool whose identities are accessible to this
  /// Verified Permissions policy store.
  final String? userPoolArn;

  IdentitySourceItemDetails({
    this.clientIds,
    this.discoveryUrl,
    this.openIdIssuer,
    this.userPoolArn,
  });

  factory IdentitySourceItemDetails.fromJson(Map<String, dynamic> json) {
    return IdentitySourceItemDetails(
      clientIds: (json['clientIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      discoveryUrl: json['discoveryUrl'] as String?,
      openIdIssuer: (json['openIdIssuer'] as String?)?.toOpenIdIssuer(),
      userPoolArn: json['userPoolArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientIds = this.clientIds;
    final discoveryUrl = this.discoveryUrl;
    final openIdIssuer = this.openIdIssuer;
    final userPoolArn = this.userPoolArn;
    return {
      if (clientIds != null) 'clientIds': clientIds,
      if (discoveryUrl != null) 'discoveryUrl': discoveryUrl,
      if (openIdIssuer != null) 'openIdIssuer': openIdIssuer.toValue(),
      if (userPoolArn != null) 'userPoolArn': userPoolArn,
    };
  }
}

class IsAuthorizedOutput {
  /// An authorization decision that indicates if the authorization request should
  /// be allowed or denied.
  final Decision decision;

  /// The list of determining policies used to make the authorization decision.
  /// For example, if there are two matching policies, where one is a forbid and
  /// the other is a permit, then the forbid policy will be the determining
  /// policy. In the case of multiple matching permit policies then there would be
  /// multiple determining policies. In the case that no policies match, and hence
  /// the response is DENY, there would be no determining policies.
  final List<DeterminingPolicyItem> determiningPolicies;

  /// Errors that occurred while making an authorization decision, for example, a
  /// policy references an Entity or entity Attribute that does not exist in the
  /// slice.
  final List<EvaluationErrorItem> errors;

  IsAuthorizedOutput({
    required this.decision,
    required this.determiningPolicies,
    required this.errors,
  });

  factory IsAuthorizedOutput.fromJson(Map<String, dynamic> json) {
    return IsAuthorizedOutput(
      decision: (json['decision'] as String).toDecision(),
      determiningPolicies: (json['determiningPolicies'] as List)
          .whereNotNull()
          .map((e) => DeterminingPolicyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => EvaluationErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final decision = this.decision;
    final determiningPolicies = this.determiningPolicies;
    final errors = this.errors;
    return {
      'decision': decision.toValue(),
      'determiningPolicies': determiningPolicies,
      'errors': errors,
    };
  }
}

class IsAuthorizedWithTokenOutput {
  /// An authorization decision that indicates if the authorization request should
  /// be allowed or denied.
  final Decision decision;

  /// The list of determining policies used to make the authorization decision.
  /// For example, if there are multiple matching policies, where at least one is
  /// a forbid policy, then because forbid always overrides permit the forbid
  /// policies are the determining policies. If all matching policies are permit
  /// policies, then those policies are the determining policies. When no policies
  /// match and the response is the default DENY, there are no determining
  /// policies.
  final List<DeterminingPolicyItem> determiningPolicies;

  /// Errors that occurred while making an authorization decision. For example, a
  /// policy references an entity or entity attribute that does not exist in the
  /// slice.
  final List<EvaluationErrorItem> errors;

  /// The identifier of the principal in the ID or access token.
  final EntityIdentifier? principal;

  IsAuthorizedWithTokenOutput({
    required this.decision,
    required this.determiningPolicies,
    required this.errors,
    this.principal,
  });

  factory IsAuthorizedWithTokenOutput.fromJson(Map<String, dynamic> json) {
    return IsAuthorizedWithTokenOutput(
      decision: (json['decision'] as String).toDecision(),
      determiningPolicies: (json['determiningPolicies'] as List)
          .whereNotNull()
          .map((e) => DeterminingPolicyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => EvaluationErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final decision = this.decision;
    final determiningPolicies = this.determiningPolicies;
    final errors = this.errors;
    final principal = this.principal;
    return {
      'decision': decision.toValue(),
      'determiningPolicies': determiningPolicies,
      'errors': errors,
      if (principal != null) 'principal': principal,
    };
  }
}

class ListIdentitySourcesOutput {
  /// The list of identity sources stored in the specified policy store.
  final List<IdentitySourceItem> identitySources;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListIdentitySourcesOutput({
    required this.identitySources,
    this.nextToken,
  });

  factory ListIdentitySourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListIdentitySourcesOutput(
      identitySources: (json['identitySources'] as List)
          .whereNotNull()
          .map((e) => IdentitySourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identitySources = this.identitySources;
    final nextToken = this.nextToken;
    return {
      'identitySources': identitySources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPoliciesOutput {
  /// Lists all policies that are available in the specified policy store.
  final List<PolicyItem> policies;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListPoliciesOutput({
    required this.policies,
    this.nextToken,
  });

  factory ListPoliciesOutput.fromJson(Map<String, dynamic> json) {
    return ListPoliciesOutput(
      policies: (json['policies'] as List)
          .whereNotNull()
          .map((e) => PolicyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    final nextToken = this.nextToken;
    return {
      'policies': policies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPolicyStoresOutput {
  /// The list of policy stores in the account.
  final List<PolicyStoreItem> policyStores;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListPolicyStoresOutput({
    required this.policyStores,
    this.nextToken,
  });

  factory ListPolicyStoresOutput.fromJson(Map<String, dynamic> json) {
    return ListPolicyStoresOutput(
      policyStores: (json['policyStores'] as List)
          .whereNotNull()
          .map((e) => PolicyStoreItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyStores = this.policyStores;
    final nextToken = this.nextToken;
    return {
      'policyStores': policyStores,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPolicyTemplatesOutput {
  /// The list of the policy templates in the specified policy store.
  final List<PolicyTemplateItem> policyTemplates;

  /// If present, this value indicates that more output is available than is
  /// included in the current response. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back as <code>null</code>.
  /// This indicates that this is the last page of results.
  final String? nextToken;

  ListPolicyTemplatesOutput({
    required this.policyTemplates,
    this.nextToken,
  });

  factory ListPolicyTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListPolicyTemplatesOutput(
      policyTemplates: (json['policyTemplates'] as List)
          .whereNotNull()
          .map((e) => PolicyTemplateItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyTemplates = this.policyTemplates;
    final nextToken = this.nextToken;
    return {
      'policyTemplates': policyTemplates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum OpenIdIssuer {
  cognito,
}

extension OpenIdIssuerValueExtension on OpenIdIssuer {
  String toValue() {
    switch (this) {
      case OpenIdIssuer.cognito:
        return 'COGNITO';
    }
  }
}

extension OpenIdIssuerFromString on String {
  OpenIdIssuer toOpenIdIssuer() {
    switch (this) {
      case 'COGNITO':
        return OpenIdIssuer.cognito;
    }
    throw Exception('$this is not known in enum OpenIdIssuer');
  }
}

/// A structure that contains the details for a Cedar policy definition. It
/// includes the policy type, a description, and a policy body. This is a top
/// level data type used to create a policy.
///
/// This data type is used as a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html">CreatePolicy</a>
/// operation. This structure must always have either an <code>static</code> or
/// a <code>templateLinked</code> element.
class PolicyDefinition {
  /// A structure that describes a static policy. An static policy doesn't use a
  /// template or allow placeholders for entities.
  final StaticPolicyDefinition? static;

  /// A structure that describes a policy that was instantiated from a template.
  /// The template can specify placeholders for <code>principal</code> and
  /// <code>resource</code>. When you use <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html">CreatePolicy</a>
  /// to create a policy from a template, you specify the exact principal and
  /// resource to use for the instantiated policy.
  final TemplateLinkedPolicyDefinition? templateLinked;

  PolicyDefinition({
    this.static,
    this.templateLinked,
  });

  Map<String, dynamic> toJson() {
    final static = this.static;
    final templateLinked = this.templateLinked;
    return {
      if (static != null) 'static': static,
      if (templateLinked != null) 'templateLinked': templateLinked,
    };
  }
}

/// A structure that describes a policy definition. It must always have either
/// an <code>static</code> or a <code>templateLinked</code> element.
///
/// This data type is used as a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetPolicy.html">GetPolicy</a>
/// operation.
class PolicyDefinitionDetail {
  /// Information about a static policy that wasn't created with a policy
  /// template.
  final StaticPolicyDefinitionDetail? static;

  /// Information about a template-linked policy that was created by instantiating
  /// a policy template.
  final TemplateLinkedPolicyDefinitionDetail? templateLinked;

  PolicyDefinitionDetail({
    this.static,
    this.templateLinked,
  });

  factory PolicyDefinitionDetail.fromJson(Map<String, dynamic> json) {
    return PolicyDefinitionDetail(
      static: json['static'] != null
          ? StaticPolicyDefinitionDetail.fromJson(
              json['static'] as Map<String, dynamic>)
          : null,
      templateLinked: json['templateLinked'] != null
          ? TemplateLinkedPolicyDefinitionDetail.fromJson(
              json['templateLinked'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final static = this.static;
    final templateLinked = this.templateLinked;
    return {
      if (static != null) 'static': static,
      if (templateLinked != null) 'templateLinked': templateLinked,
    };
  }
}

/// A structure that describes a <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinintion.html">PolicyDefinintion</a>.
/// It will always have either an <code>StaticPolicy</code> or a
/// <code>TemplateLinkedPolicy</code> element.
///
/// This data type is used as a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html">CreatePolicy</a>
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html">ListPolicies</a>
/// operations.
class PolicyDefinitionItem {
  /// Information about a static policy that wasn't created with a policy
  /// template.
  final StaticPolicyDefinitionItem? static;

  /// Information about a template-linked policy that was created by instantiating
  /// a policy template.
  final TemplateLinkedPolicyDefinitionItem? templateLinked;

  PolicyDefinitionItem({
    this.static,
    this.templateLinked,
  });

  factory PolicyDefinitionItem.fromJson(Map<String, dynamic> json) {
    return PolicyDefinitionItem(
      static: json['static'] != null
          ? StaticPolicyDefinitionItem.fromJson(
              json['static'] as Map<String, dynamic>)
          : null,
      templateLinked: json['templateLinked'] != null
          ? TemplateLinkedPolicyDefinitionItem.fromJson(
              json['templateLinked'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final static = this.static;
    final templateLinked = this.templateLinked;
    return {
      if (static != null) 'static': static,
      if (templateLinked != null) 'templateLinked': templateLinked,
    };
  }
}

enum PolicyEffect {
  permit,
  forbid,
}

extension PolicyEffectValueExtension on PolicyEffect {
  String toValue() {
    switch (this) {
      case PolicyEffect.permit:
        return 'Permit';
      case PolicyEffect.forbid:
        return 'Forbid';
    }
  }
}

extension PolicyEffectFromString on String {
  PolicyEffect toPolicyEffect() {
    switch (this) {
      case 'Permit':
        return PolicyEffect.permit;
      case 'Forbid':
        return PolicyEffect.forbid;
    }
    throw Exception('$this is not known in enum PolicyEffect');
  }
}

/// Contains information about a filter to refine policies returned in a query.
///
/// This data type is used as a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html">ListPolicies</a>
/// operation.
class PolicyFilter {
  /// Filters the output to only template-linked policies that were instantiated
  /// from the specified policy template.
  final String? policyTemplateId;

  /// Filters the output to only policies of the specified type.
  final PolicyType? policyType;

  /// Filters the output to only policies that reference the specified principal.
  final EntityReference? principal;

  /// Filters the output to only policies that reference the specified resource.
  final EntityReference? resource;

  PolicyFilter({
    this.policyTemplateId,
    this.policyType,
    this.principal,
    this.resource,
  });

  Map<String, dynamic> toJson() {
    final policyTemplateId = this.policyTemplateId;
    final policyType = this.policyType;
    final principal = this.principal;
    final resource = this.resource;
    return {
      if (policyTemplateId != null) 'policyTemplateId': policyTemplateId,
      if (policyType != null) 'policyType': policyType.toValue(),
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

/// Contains information about a policy.
///
/// This data type is used as a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html">ListPolicies</a>
/// operation.
class PolicyItem {
  /// The date and time the policy was created.
  final DateTime createdDate;

  /// The policy definition of an item in the list of policies returned.
  final PolicyDefinitionItem definition;

  /// The date and time the policy was most recently updated.
  final DateTime lastUpdatedDate;

  /// The identifier of the policy you want information about.
  final String policyId;

  /// The identifier of the PolicyStore where the policy you want information
  /// about is stored.
  final String policyStoreId;

  /// The type of the policy. This is one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>static</code>
  /// </li>
  /// <li>
  /// <code>templateLinked</code>
  /// </li>
  /// </ul>
  final PolicyType policyType;

  /// The action that a policy permits or forbids. For example, <code>{"actions":
  /// [{"actionId": "ViewPhoto", "actionType": "PhotoFlash::Action"}, {"entityID":
  /// "SharePhoto", "entityType": "PhotoFlash::Action"}]}</code>.
  final List<ActionIdentifier>? actions;

  /// The effect of the decision that a policy returns to an authorization
  /// request. For example, <code>"effect": "Permit"</code>.
  final PolicyEffect? effect;

  /// The principal associated with the policy.
  final EntityIdentifier? principal;

  /// The resource associated with the policy.
  final EntityIdentifier? resource;

  PolicyItem({
    required this.createdDate,
    required this.definition,
    required this.lastUpdatedDate,
    required this.policyId,
    required this.policyStoreId,
    required this.policyType,
    this.actions,
    this.effect,
    this.principal,
    this.resource,
  });

  factory PolicyItem.fromJson(Map<String, dynamic> json) {
    return PolicyItem(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      definition: PolicyDefinitionItem.fromJson(
          json['definition'] as Map<String, dynamic>),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyId: json['policyId'] as String,
      policyStoreId: json['policyStoreId'] as String,
      policyType: (json['policyType'] as String).toPolicyType(),
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => ActionIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      effect: (json['effect'] as String?)?.toPolicyEffect(),
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final definition = this.definition;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyId = this.policyId;
    final policyStoreId = this.policyStoreId;
    final policyType = this.policyType;
    final actions = this.actions;
    final effect = this.effect;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'definition': definition,
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyId': policyId,
      'policyStoreId': policyStoreId,
      'policyType': policyType.toValue(),
      if (actions != null) 'actions': actions,
      if (effect != null) 'effect': effect.toValue(),
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

/// Contains information about a policy store.
///
/// This data type is used as a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStores.html">ListPolicyStores</a>
/// operation.
class PolicyStoreItem {
  /// The Amazon Resource Name (ARN) of the policy store.
  final String arn;

  /// The date and time the policy was created.
  final DateTime createdDate;

  /// The unique identifier of the policy store.
  final String policyStoreId;

  /// Descriptive text that you can provide to help with identification of the
  /// current policy store.
  final String? description;

  /// The date and time the policy store was most recently updated.
  final DateTime? lastUpdatedDate;

  PolicyStoreItem({
    required this.arn,
    required this.createdDate,
    required this.policyStoreId,
    this.description,
    this.lastUpdatedDate,
  });

  factory PolicyStoreItem.fromJson(Map<String, dynamic> json) {
    return PolicyStoreItem(
      arn: json['arn'] as String,
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      description: json['description'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final policyStoreId = this.policyStoreId;
    final description = this.description;
    final lastUpdatedDate = this.lastUpdatedDate;
    return {
      'arn': arn,
      'createdDate': iso8601ToJson(createdDate),
      'policyStoreId': policyStoreId,
      if (description != null) 'description': description,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
    };
  }
}

/// Contains details about a policy template
///
/// This data type is used as a response parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyTemplates.html">ListPolicyTemplates</a>
/// operation.
class PolicyTemplateItem {
  /// The date and time that the policy template was created.
  final DateTime createdDate;

  /// The date and time that the policy template was most recently updated.
  final DateTime lastUpdatedDate;

  /// The unique identifier of the policy store that contains the template.
  final String policyStoreId;

  /// The unique identifier of the policy template.
  final String policyTemplateId;

  /// The description attached to the policy template.
  final String? description;

  PolicyTemplateItem({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.policyTemplateId,
    this.description,
  });

  factory PolicyTemplateItem.fromJson(Map<String, dynamic> json) {
    return PolicyTemplateItem(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      policyTemplateId: json['policyTemplateId'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final policyTemplateId = this.policyTemplateId;
    final description = this.description;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'policyTemplateId': policyTemplateId,
      if (description != null) 'description': description,
    };
  }
}

enum PolicyType {
  static,
  templateLinked,
}

extension PolicyTypeValueExtension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.static:
        return 'STATIC';
      case PolicyType.templateLinked:
        return 'TEMPLATE_LINKED';
    }
  }
}

extension PolicyTypeFromString on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'STATIC':
        return PolicyType.static;
      case 'TEMPLATE_LINKED':
        return PolicyType.templateLinked;
    }
    throw Exception('$this is not known in enum PolicyType');
  }
}

class PutSchemaOutput {
  /// The date and time that the schema was originally created.
  final DateTime createdDate;

  /// The date and time that the schema was last updated.
  final DateTime lastUpdatedDate;

  /// Identifies the namespaces of the entities referenced by this schema.
  final List<String> namespaces;

  /// The unique ID of the policy store that contains the schema.
  final String policyStoreId;

  PutSchemaOutput({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.namespaces,
    required this.policyStoreId,
  });

  factory PutSchemaOutput.fromJson(Map<String, dynamic> json) {
    return PutSchemaOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      namespaces: (json['namespaces'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      policyStoreId: json['policyStoreId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final namespaces = this.namespaces;
    final policyStoreId = this.policyStoreId;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'namespaces': namespaces,
      'policyStoreId': policyStoreId,
    };
  }
}

/// Contains a list of principal types, resource types, and actions that can be
/// specified in policies stored in the same policy store. If the validation
/// mode for the policy store is set to <code>STRICT</code>, then policies that
/// can't be validated by this schema are rejected by Verified Permissions and
/// can't be stored in the policy store.
class SchemaDefinition {
  /// A JSON string representation of the schema supported by applications that
  /// use this policy store. For more information, see <a
  /// href="https://docs.aws.amazon.com/verifiedpermissions/latest/userguide/schema.html">Policy
  /// store schema</a> in the <i>Amazon Verified Permissions User Guide</i>.
  final String? cedarJson;

  SchemaDefinition({
    this.cedarJson,
  });

  Map<String, dynamic> toJson() {
    final cedarJson = this.cedarJson;
    return {
      if (cedarJson != null) 'cedarJson': cedarJson,
    };
  }
}

/// Contains information about a static policy.
///
/// This data type is used as a field that is part of the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinitionDetail.html">PolicyDefinitionDetail</a>
/// type.
class StaticPolicyDefinition {
  /// The policy content of the static policy, written in the Cedar policy
  /// language.
  final String statement;

  /// The description of the static policy.
  final String? description;

  StaticPolicyDefinition({
    required this.statement,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    final description = this.description;
    return {
      'statement': statement,
      if (description != null) 'description': description,
    };
  }
}

/// A structure that contains details about a static policy. It includes the
/// description and policy body.
///
/// This data type is used within a <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinition.html">PolicyDefinition</a>
/// structure as part of a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html">CreatePolicy</a>
/// operation.
class StaticPolicyDefinitionDetail {
  /// The content of the static policy written in the Cedar policy language.
  final String statement;

  /// A description of the static policy.
  final String? description;

  StaticPolicyDefinitionDetail({
    required this.statement,
    this.description,
  });

  factory StaticPolicyDefinitionDetail.fromJson(Map<String, dynamic> json) {
    return StaticPolicyDefinitionDetail(
      statement: json['statement'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    final description = this.description;
    return {
      'statement': statement,
      if (description != null) 'description': description,
    };
  }
}

/// A structure that contains details about a static policy. It includes the
/// description and policy statement.
///
/// This data type is used within a <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinition.html">PolicyDefinition</a>
/// structure as part of a request parameter for the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html">CreatePolicy</a>
/// operation.
class StaticPolicyDefinitionItem {
  /// A description of the static policy.
  final String? description;

  StaticPolicyDefinitionItem({
    this.description,
  });

  factory StaticPolicyDefinitionItem.fromJson(Map<String, dynamic> json) {
    return StaticPolicyDefinitionItem(
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      if (description != null) 'description': description,
    };
  }
}

/// Contains information about a policy created by instantiating a policy
/// template.
class TemplateLinkedPolicyDefinition {
  /// The unique identifier of the policy template used to create this policy.
  final String policyTemplateId;

  /// The principal associated with this template-linked policy. Verified
  /// Permissions substitutes this principal for the <code>?principal</code>
  /// placeholder in the policy template when it evaluates an authorization
  /// request.
  final EntityIdentifier? principal;

  /// The resource associated with this template-linked policy. Verified
  /// Permissions substitutes this resource for the <code>?resource</code>
  /// placeholder in the policy template when it evaluates an authorization
  /// request.
  final EntityIdentifier? resource;

  TemplateLinkedPolicyDefinition({
    required this.policyTemplateId,
    this.principal,
    this.resource,
  });

  Map<String, dynamic> toJson() {
    final policyTemplateId = this.policyTemplateId;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'policyTemplateId': policyTemplateId,
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

/// Contains information about a policy that was created by instantiating a
/// policy template.
class TemplateLinkedPolicyDefinitionDetail {
  /// The unique identifier of the policy template used to create this policy.
  final String policyTemplateId;

  /// The principal associated with this template-linked policy. Verified
  /// Permissions substitutes this principal for the <code>?principal</code>
  /// placeholder in the policy template when it evaluates an authorization
  /// request.
  final EntityIdentifier? principal;

  /// The resource associated with this template-linked policy. Verified
  /// Permissions substitutes this resource for the <code>?resource</code>
  /// placeholder in the policy template when it evaluates an authorization
  /// request.
  final EntityIdentifier? resource;

  TemplateLinkedPolicyDefinitionDetail({
    required this.policyTemplateId,
    this.principal,
    this.resource,
  });

  factory TemplateLinkedPolicyDefinitionDetail.fromJson(
      Map<String, dynamic> json) {
    return TemplateLinkedPolicyDefinitionDetail(
      policyTemplateId: json['policyTemplateId'] as String,
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyTemplateId = this.policyTemplateId;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'policyTemplateId': policyTemplateId,
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

/// Contains information about a policy created by instantiating a policy
/// template.
///
/// This
class TemplateLinkedPolicyDefinitionItem {
  /// The unique identifier of the policy template used to create this policy.
  final String policyTemplateId;

  /// The principal associated with this template-linked policy. Verified
  /// Permissions substitutes this principal for the <code>?principal</code>
  /// placeholder in the policy template when it evaluates an authorization
  /// request.
  final EntityIdentifier? principal;

  /// The resource associated with this template-linked policy. Verified
  /// Permissions substitutes this resource for the <code>?resource</code>
  /// placeholder in the policy template when it evaluates an authorization
  /// request.
  final EntityIdentifier? resource;

  TemplateLinkedPolicyDefinitionItem({
    required this.policyTemplateId,
    this.principal,
    this.resource,
  });

  factory TemplateLinkedPolicyDefinitionItem.fromJson(
      Map<String, dynamic> json) {
    return TemplateLinkedPolicyDefinitionItem(
      policyTemplateId: json['policyTemplateId'] as String,
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyTemplateId = this.policyTemplateId;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'policyTemplateId': policyTemplateId,
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

/// The user group entities from an Amazon Cognito user pool identity source.
class UpdateCognitoGroupConfiguration {
  /// The name of the schema entity type that's mapped to the user pool group.
  /// Defaults to <code>AWS::CognitoGroup</code>.
  final String groupEntityType;

  UpdateCognitoGroupConfiguration({
    required this.groupEntityType,
  });

  Map<String, dynamic> toJson() {
    final groupEntityType = this.groupEntityType;
    return {
      'groupEntityType': groupEntityType,
    };
  }
}

/// Contains configuration details of a Amazon Cognito user pool for use with an
/// identity source.
class UpdateCognitoUserPoolConfiguration {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the Amazon Cognito user pool associated with this
  /// identity source.
  final String userPoolArn;

  /// The client ID of an app client that is configured for the specified Amazon
  /// Cognito user pool.
  final List<String>? clientIds;

  /// The configuration of the user groups from an Amazon Cognito user pool
  /// identity source.
  final UpdateCognitoGroupConfiguration? groupConfiguration;

  UpdateCognitoUserPoolConfiguration({
    required this.userPoolArn,
    this.clientIds,
    this.groupConfiguration,
  });

  Map<String, dynamic> toJson() {
    final userPoolArn = this.userPoolArn;
    final clientIds = this.clientIds;
    final groupConfiguration = this.groupConfiguration;
    return {
      'userPoolArn': userPoolArn,
      if (clientIds != null) 'clientIds': clientIds,
      if (groupConfiguration != null) 'groupConfiguration': groupConfiguration,
    };
  }
}

/// Contains an updated configuration to replace the configuration in an
/// existing identity source.
/// <note>
/// At this time, the only valid member of this structure is a Amazon Cognito
/// user pool configuration.
///
/// You must specify a <code>userPoolArn</code>, and optionally, a
/// <code>ClientId</code>.
/// </note>
class UpdateConfiguration {
  /// Contains configuration details of a Amazon Cognito user pool.
  final UpdateCognitoUserPoolConfiguration? cognitoUserPoolConfiguration;

  UpdateConfiguration({
    this.cognitoUserPoolConfiguration,
  });

  Map<String, dynamic> toJson() {
    final cognitoUserPoolConfiguration = this.cognitoUserPoolConfiguration;
    return {
      if (cognitoUserPoolConfiguration != null)
        'cognitoUserPoolConfiguration': cognitoUserPoolConfiguration,
    };
  }
}

class UpdateIdentitySourceOutput {
  /// The date and time that the updated identity source was originally created.
  final DateTime createdDate;

  /// The ID of the updated identity source.
  final String identitySourceId;

  /// The date and time that the identity source was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store that contains the updated identity source.
  final String policyStoreId;

  UpdateIdentitySourceOutput({
    required this.createdDate,
    required this.identitySourceId,
    required this.lastUpdatedDate,
    required this.policyStoreId,
  });

  factory UpdateIdentitySourceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateIdentitySourceOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      identitySourceId: json['identitySourceId'] as String,
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final identitySourceId = this.identitySourceId;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'identitySourceId': identitySourceId,
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
    };
  }
}

/// Contains information about updates to be applied to a policy.
///
/// This data type is used as a request parameter in the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicy.html">UpdatePolicy</a>
/// operation.
class UpdatePolicyDefinition {
  /// Contains details about the updates to be applied to a static policy.
  final UpdateStaticPolicyDefinition? static;

  UpdatePolicyDefinition({
    this.static,
  });

  Map<String, dynamic> toJson() {
    final static = this.static;
    return {
      if (static != null) 'static': static,
    };
  }
}

class UpdatePolicyOutput {
  /// The date and time that the policy was originally created.
  final DateTime createdDate;

  /// The date and time that the policy was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy that was updated.
  final String policyId;

  /// The ID of the policy store that contains the policy that was updated.
  final String policyStoreId;

  /// The type of the policy that was updated.
  final PolicyType policyType;

  /// The action that a policy permits or forbids. For example, <code>{"actions":
  /// [{"actionId": "ViewPhoto", "actionType": "PhotoFlash::Action"}, {"entityID":
  /// "SharePhoto", "entityType": "PhotoFlash::Action"}]}</code>.
  final List<ActionIdentifier>? actions;

  /// The effect of the decision that a policy returns to an authorization
  /// request. For example, <code>"effect": "Permit"</code>.
  final PolicyEffect? effect;

  /// The principal specified in the policy's scope. This element isn't included
  /// in the response when <code>Principal</code> isn't present in the policy
  /// content.
  final EntityIdentifier? principal;

  /// The resource specified in the policy's scope. This element isn't included in
  /// the response when <code>Resource</code> isn't present in the policy content.
  final EntityIdentifier? resource;

  UpdatePolicyOutput({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyId,
    required this.policyStoreId,
    required this.policyType,
    this.actions,
    this.effect,
    this.principal,
    this.resource,
  });

  factory UpdatePolicyOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePolicyOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyId: json['policyId'] as String,
      policyStoreId: json['policyStoreId'] as String,
      policyType: (json['policyType'] as String).toPolicyType(),
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => ActionIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      effect: (json['effect'] as String?)?.toPolicyEffect(),
      principal: json['principal'] != null
          ? EntityIdentifier.fromJson(json['principal'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? EntityIdentifier.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyId = this.policyId;
    final policyStoreId = this.policyStoreId;
    final policyType = this.policyType;
    final actions = this.actions;
    final effect = this.effect;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyId': policyId,
      'policyStoreId': policyStoreId,
      'policyType': policyType.toValue(),
      if (actions != null) 'actions': actions,
      if (effect != null) 'effect': effect.toValue(),
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
    };
  }
}

class UpdatePolicyStoreOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the updated policy store.
  final String arn;

  /// The date and time that the policy store was originally created.
  final DateTime createdDate;

  /// The date and time that the policy store was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the updated policy store.
  final String policyStoreId;

  UpdatePolicyStoreOutput({
    required this.arn,
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
  });

  factory UpdatePolicyStoreOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePolicyStoreOutput(
      arn: json['arn'] as String,
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    return {
      'arn': arn,
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
    };
  }
}

class UpdatePolicyTemplateOutput {
  /// The date and time that the policy template was originally created.
  final DateTime createdDate;

  /// The date and time that the policy template was most recently updated.
  final DateTime lastUpdatedDate;

  /// The ID of the policy store that contains the updated policy template.
  final String policyStoreId;

  /// The ID of the updated policy template.
  final String policyTemplateId;

  UpdatePolicyTemplateOutput({
    required this.createdDate,
    required this.lastUpdatedDate,
    required this.policyStoreId,
    required this.policyTemplateId,
  });

  factory UpdatePolicyTemplateOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePolicyTemplateOutput(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      lastUpdatedDate:
          nonNullableTimeStampFromJson(json['lastUpdatedDate'] as Object),
      policyStoreId: json['policyStoreId'] as String,
      policyTemplateId: json['policyTemplateId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final policyStoreId = this.policyStoreId;
    final policyTemplateId = this.policyTemplateId;
    return {
      'createdDate': iso8601ToJson(createdDate),
      'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      'policyStoreId': policyStoreId,
      'policyTemplateId': policyTemplateId,
    };
  }
}

/// Contains information about an update to a static policy.
class UpdateStaticPolicyDefinition {
  /// Specifies the Cedar policy language text to be added to or replaced on the
  /// static policy.
  /// <important>
  /// You can change only the following elements from the original content:
  ///
  /// <ul>
  /// <li>
  /// The <code>action</code> referenced by the policy.
  /// </li>
  /// <li>
  /// Any conditional clauses, such as <code>when</code> or <code>unless</code>
  /// clauses.
  /// </li>
  /// </ul>
  /// You <b>can't</b> change the following elements:
  ///
  /// <ul>
  /// <li>
  /// Changing from <code>StaticPolicy</code> to
  /// <code>TemplateLinkedPolicy</code>.
  /// </li>
  /// <li>
  /// The effect (<code>permit</code> or <code>forbid</code>) of the policy.
  /// </li>
  /// <li>
  /// The <code>principal</code> referenced by the policy.
  /// </li>
  /// <li>
  /// The <code>resource</code> referenced by the policy.
  /// </li>
  /// </ul> </important>
  final String statement;

  /// Specifies the description to be added to or replaced on the static policy.
  final String? description;

  UpdateStaticPolicyDefinition({
    required this.statement,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    final description = this.description;
    return {
      'statement': statement,
      if (description != null) 'description': description,
    };
  }
}

enum ValidationMode {
  off,
  strict,
}

extension ValidationModeValueExtension on ValidationMode {
  String toValue() {
    switch (this) {
      case ValidationMode.off:
        return 'OFF';
      case ValidationMode.strict:
        return 'STRICT';
    }
  }
}

extension ValidationModeFromString on String {
  ValidationMode toValidationMode() {
    switch (this) {
      case 'OFF':
        return ValidationMode.off;
      case 'STRICT':
        return ValidationMode.strict;
    }
    throw Exception('$this is not known in enum ValidationMode');
  }
}

/// A structure that contains Cedar policy validation settings for the policy
/// store. The validation mode determines which validation failures that Cedar
/// considers serious enough to block acceptance of a new or edited static
/// policy or policy template.
///
/// This data type is used as a request parameter in the <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicyStore.html">CreatePolicyStore</a>
/// and <a
/// href="https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyStore.html">UpdatePolicyStore</a>
/// operations.
class ValidationSettings {
  /// The validation mode currently configured for this policy store. The valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <b>OFF</b> – Neither Verified Permissions nor Cedar perform any validation
  /// on policies. No validation errors are reported by either service.
  /// </li>
  /// <li>
  /// <b>STRICT</b> – Requires a schema to be present in the policy store. Cedar
  /// performs validation on all submitted new or updated static policies and
  /// policy templates. Any that fail validation are rejected and Cedar doesn't
  /// store them in the policy store.
  /// </li>
  /// </ul> <important>
  /// If <code>Mode=STRICT</code> and the policy store doesn't contain a schema,
  /// Verified Permissions rejects all static policies and policy templates
  /// because there is no schema to validate against.
  ///
  /// To submit a static policy or policy template without a schema, you must turn
  /// off validation.
  /// </important>
  final ValidationMode mode;

  ValidationSettings({
    required this.mode,
  });

  factory ValidationSettings.fromJson(Map<String, dynamic> json) {
    return ValidationSettings(
      mode: (json['mode'] as String).toValidationMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      'mode': mode.toValue(),
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
