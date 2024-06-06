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

/// <a href="http://aws.amazon.com/servicecatalog">Service Catalog</a> enables
/// organizations to create and manage catalogs of IT services that are approved
/// for Amazon Web Services. To get the most out of this documentation, you
/// should be familiar with the terminology discussed in <a
/// href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/what-is_concepts.html">Service
/// Catalog Concepts</a>.
class ServiceCatalog {
  final _s.JsonProtocol _protocol;
  ServiceCatalog({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'servicecatalog',
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

  /// Accepts an offer to share the specified portfolio.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [portfolioShareType] :
  /// The type of shared portfolios to accept. The default is to accept imported
  /// portfolios.
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_ORGANIZATIONS</code> - Accept portfolios shared by the
  /// management account of your organization.
  /// </li>
  /// <li>
  /// <code>IMPORTED</code> - Accept imported portfolios.
  /// </li>
  /// <li>
  /// <code>AWS_SERVICECATALOG</code> - Not supported. (Throws
  /// ResourceNotFoundException.)
  /// </li>
  /// </ul>
  /// For example, <code>aws servicecatalog accept-portfolio-share
  /// --portfolio-id "port-2qwzkwxt3y5fk" --portfolio-share-type
  /// AWS_ORGANIZATIONS</code>
  Future<void> acceptPortfolioShare({
    required String portfolioId,
    String? acceptLanguage,
    PortfolioShareType? portfolioShareType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.AcceptPortfolioShare'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (portfolioShareType != null)
          'PortfolioShareType': portfolioShareType.toValue(),
      },
    );
  }

  /// Associates the specified budget with the specified resource.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [DuplicateResourceException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [budgetName] :
  /// The name of the budget you want to associate.
  ///
  /// Parameter [resourceId] :
  /// The resource identifier. Either a portfolio-id or a product-id.
  Future<void> associateBudgetWithResource({
    required String budgetName,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.AssociateBudgetWithResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BudgetName': budgetName,
        'ResourceId': resourceId,
      },
    );
  }

  /// Associates the specified principal ARN with the specified portfolio.
  ///
  /// If you share the portfolio with principal name sharing enabled, the
  /// <code>PrincipalARN</code> association is included in the share.
  ///
  /// The <code>PortfolioID</code>, <code>PrincipalARN</code>, and
  /// <code>PrincipalType</code> parameters are required.
  ///
  /// You can associate a maximum of 10 Principals with a portfolio using
  /// <code>PrincipalType</code> as <code>IAM_PATTERN</code>.
  /// <note>
  /// When you associate a principal with portfolio, a potential privilege
  /// escalation path may occur when that portfolio is then shared with other
  /// accounts. For a user in a recipient account who is <i>not</i> an Service
  /// Catalog Admin, but still has the ability to create Principals
  /// (Users/Groups/Roles), that user could create a role that matches a
  /// principal name association for the portfolio. Although this user may not
  /// know which principal names are associated through Service Catalog, they
  /// may be able to guess the user. If this potential escalation path is a
  /// concern, then Service Catalog recommends using <code>PrincipalType</code>
  /// as <code>IAM</code>. With this configuration, the
  /// <code>PrincipalARN</code> must already exist in the recipient account
  /// before it can be associated.
  /// </note>
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [principalARN] :
  /// The ARN of the principal (user, role, or group). If the
  /// <code>PrincipalType</code> is <code>IAM</code>, the supported value is a
  /// fully defined <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// Amazon Resource Name (ARN)</a>. If the <code>PrincipalType</code> is
  /// <code>IAM_PATTERN</code>, the supported value is an <code>IAM</code> ARN
  /// <i>without an AccountID</i> in the following format:
  ///
  /// <i>arn:partition:iam:::resource-type/resource-id</i>
  ///
  /// The ARN resource-id can be either:
  ///
  /// <ul>
  /// <li>
  /// A fully formed resource-id. For example,
  /// <i>arn:aws:iam:::role/resource-name</i> or
  /// <i>arn:aws:iam:::role/resource-path/resource-name</i>
  /// </li>
  /// <li>
  /// A wildcard ARN. The wildcard ARN accepts <code>IAM_PATTERN</code> values
  /// with a "*" or "?" in the resource-id segment of the ARN. For example
  /// <i>arn:partition:service:::resource-type/resource-path/resource-name</i>.
  /// The new symbols are exclusive to the <b>resource-path</b> and
  /// <b>resource-name</b> and cannot replace the <b>resource-type</b> or other
  /// ARN values.
  ///
  /// The ARN path and principal name allow unlimited wildcard characters.
  /// </li>
  /// </ul>
  /// Examples of an <b>acceptable</b> wildcard ARN:
  ///
  /// <ul>
  /// <li>
  /// arn:aws:iam:::role/ResourceName_*
  /// </li>
  /// <li>
  /// arn:aws:iam:::role/*/ResourceName_?
  /// </li>
  /// </ul>
  /// Examples of an <b>unacceptable</b> wildcard ARN:
  ///
  /// <ul>
  /// <li>
  /// arn:aws:iam:::*/ResourceName
  /// </li>
  /// </ul>
  /// You can associate multiple <code>IAM_PATTERN</code>s even if the account
  /// has no principal with that name.
  ///
  /// The "?" wildcard character matches zero or one of any character. This is
  /// similar to ".?" in regular regex context. The "*" wildcard character
  /// matches any number of any characters. This is similar to ".*" in regular
  /// regex context.
  ///
  /// In the IAM Principal ARN format
  /// (<i>arn:partition:iam:::resource-type/resource-path/resource-name</i>),
  /// valid resource-type values include <b>user/</b>, <b>group/</b>, or
  /// <b>role/</b>. The "?" and "*" characters are allowed only after the
  /// resource-type in the resource-id segment. You can use special characters
  /// anywhere within the resource-id.
  ///
  /// The "*" character also matches the "/" character, allowing paths to be
  /// formed <i>within</i> the resource-id. For example,
  /// <i>arn:aws:iam:::role/<b>*</b>/ResourceName_?</i> matches both
  /// <i>arn:aws:iam:::role/pathA/pathB/ResourceName_1</i> and
  /// <i>arn:aws:iam:::role/pathA/ResourceName_1</i>.
  ///
  /// Parameter [principalType] :
  /// The principal type. The supported value is <code>IAM</code> if you use a
  /// fully defined Amazon Resource Name (ARN), or <code>IAM_PATTERN</code> if
  /// you use an ARN with no <code>accountID</code>, with or without wildcard
  /// characters.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> associatePrincipalWithPortfolio({
    required String portfolioId,
    required String principalARN,
    required PrincipalType principalType,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociatePrincipalWithPortfolio'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        'PrincipalARN': principalARN,
        'PrincipalType': principalType.toValue(),
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );
  }

  /// Associates the specified product with the specified portfolio.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourcePortfolioId] :
  /// The identifier of the source portfolio.
  Future<void> associateProductWithPortfolio({
    required String portfolioId,
    required String productId,
    String? acceptLanguage,
    String? sourcePortfolioId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociateProductWithPortfolio'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        'ProductId': productId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (sourcePortfolioId != null) 'SourcePortfolioId': sourcePortfolioId,
      },
    );
  }

  /// Associates a self-service action with a provisioning artifact.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DuplicateResourceException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [productId] :
  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  ///
  /// Parameter [serviceActionId] :
  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests from the same Amazon Web Services account use the same
  /// idempotency token, the same response is returned for each repeated
  /// request.
  Future<void> associateServiceActionWithProvisioningArtifact({
    required String productId,
    required String provisioningArtifactId,
    required String serviceActionId,
    String? acceptLanguage,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociateServiceActionWithProvisioningArtifact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        'ProvisioningArtifactId': provisioningArtifactId,
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Associate the specified TagOption with the specified portfolio or product.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [LimitExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [resourceId] :
  /// The resource identifier.
  ///
  /// Parameter [tagOptionId] :
  /// The TagOption identifier.
  Future<void> associateTagOptionWithResource({
    required String resourceId,
    required String tagOptionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociateTagOptionWithResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagOptionId': tagOptionId,
      },
    );
  }

  /// Associates multiple self-service actions with provisioning artifacts.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [serviceActionAssociations] :
  /// One or more associations, each consisting of the Action ID, the Product
  /// ID, and the Provisioning Artifact ID.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<BatchAssociateServiceActionWithProvisioningArtifactOutput>
      batchAssociateServiceActionWithProvisioningArtifact({
    required List<ServiceActionAssociation> serviceActionAssociations,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.BatchAssociateServiceActionWithProvisioningArtifact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceActionAssociations': serviceActionAssociations,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return BatchAssociateServiceActionWithProvisioningArtifactOutput.fromJson(
        jsonResponse.body);
  }

  /// Disassociates a batch of self-service actions from the specified
  /// provisioning artifact.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [serviceActionAssociations] :
  /// One or more associations, each consisting of the Action ID, the Product
  /// ID, and the Provisioning Artifact ID.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<BatchDisassociateServiceActionFromProvisioningArtifactOutput>
      batchDisassociateServiceActionFromProvisioningArtifact({
    required List<ServiceActionAssociation> serviceActionAssociations,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.BatchDisassociateServiceActionFromProvisioningArtifact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceActionAssociations': serviceActionAssociations,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return BatchDisassociateServiceActionFromProvisioningArtifactOutput
        .fromJson(jsonResponse.body);
  }

  /// Copies the specified source product to the specified target product or a
  /// new product.
  ///
  /// You can copy a product to the same account or another account. You can
  /// copy a product to the same Region or another Region. If you copy a product
  /// to another account, you must first share the product in a portfolio using
  /// <a>CreatePortfolioShare</a>.
  ///
  /// This operation is performed asynchronously. To track the progress of the
  /// operation, use <a>DescribeCopyProductStatus</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [sourceProductArn] :
  /// The Amazon Resource Name (ARN) of the source product.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [copyOptions] :
  /// The copy options. If the value is <code>CopyTags</code>, the tags from the
  /// source product are copied to the target product.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [sourceProvisioningArtifactIdentifiers] :
  /// The identifiers of the provisioning artifacts (also known as versions) of
  /// the product to copy. By default, all provisioning artifacts are copied.
  ///
  /// Parameter [targetProductId] :
  /// The identifier of the target product. By default, a new product is
  /// created.
  ///
  /// Parameter [targetProductName] :
  /// A name for the target product. The default is the name of the source
  /// product.
  Future<CopyProductOutput> copyProduct({
    required String sourceProductArn,
    String? acceptLanguage,
    List<CopyOption>? copyOptions,
    String? idempotencyToken,
    List<Map<ProvisioningArtifactPropertyName, String>>?
        sourceProvisioningArtifactIdentifiers,
    String? targetProductId,
    String? targetProductName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CopyProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceProductArn': sourceProductArn,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (copyOptions != null)
          'CopyOptions': copyOptions.map((e) => e.toValue()).toList(),
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (sourceProvisioningArtifactIdentifiers != null)
          'SourceProvisioningArtifactIdentifiers':
              sourceProvisioningArtifactIdentifiers
                  .map((e) => e.map((k, e) => MapEntry(k.toValue(), e)))
                  .toList(),
        if (targetProductId != null) 'TargetProductId': targetProductId,
        if (targetProductName != null) 'TargetProductName': targetProductName,
      },
    );

    return CopyProductOutput.fromJson(jsonResponse.body);
  }

  /// Creates a constraint.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [LimitExceededException].
  /// May throw [DuplicateResourceException].
  ///
  /// Parameter [parameters] :
  /// The constraint parameters, in JSON format. The syntax depends on the
  /// constraint type as follows:
  /// <dl> <dt>LAUNCH</dt> <dd>
  /// You are required to specify either the <code>RoleArn</code> or the
  /// <code>LocalRoleName</code> but can't use both.
  ///
  /// Specify the <code>RoleArn</code> property as follows:
  ///
  /// <code>{"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}</code>
  ///
  /// Specify the <code>LocalRoleName</code> property as follows:
  ///
  /// <code>{"LocalRoleName": "SCBasicLaunchRole"}</code>
  ///
  /// If you specify the <code>LocalRoleName</code> property, when an account
  /// uses the launch constraint, the IAM role with that name in the account
  /// will be used. This allows launch-role constraints to be account-agnostic
  /// so the administrator can create fewer resources per shared account.
  /// <note>
  /// The given role name must exist in the account used to create the launch
  /// constraint and the account of the user who launches a product with this
  /// launch constraint.
  /// </note>
  /// You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code>
  /// constraint.
  ///
  /// You also cannot have more than one <code>LAUNCH</code> constraint on a
  /// product and portfolio.
  /// </dd> <dt>NOTIFICATION</dt> <dd>
  /// Specify the <code>NotificationArns</code> property as follows:
  ///
  /// <code>{"NotificationArns" :
  /// ["arn:aws:sns:us-east-1:123456789012:Topic"]}</code>
  /// </dd> <dt>RESOURCE_UPDATE</dt> <dd>
  /// Specify the <code>TagUpdatesOnProvisionedProduct</code> property as
  /// follows:
  ///
  /// <code>{"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}}</code>
  ///
  /// The <code>TagUpdatesOnProvisionedProduct</code> property accepts a string
  /// value of <code>ALLOWED</code> or <code>NOT_ALLOWED</code>.
  /// </dd> <dt>STACKSET</dt> <dd>
  /// Specify the <code>Parameters</code> property as follows:
  ///
  /// <code>{"Version": "String", "Properties": {"AccountList": [ "String" ],
  /// "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole":
  /// "String"}}</code>
  ///
  /// You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code>
  /// constraint.
  ///
  /// You also cannot have more than one <code>STACKSET</code> constraint on a
  /// product and portfolio.
  ///
  /// Products with a <code>STACKSET</code> constraint will launch an
  /// CloudFormation stack set.
  /// </dd> <dt>TEMPLATE</dt> <dd>
  /// Specify the <code>Rules</code> property. For more information, see <a
  /// href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html">Template
  /// Constraint Rules</a>.
  /// </dd> </dl>
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [type] :
  /// The type of constraint.
  ///
  /// <ul>
  /// <li>
  /// <code>LAUNCH</code>
  /// </li>
  /// <li>
  /// <code>NOTIFICATION</code>
  /// </li>
  /// <li>
  /// <code>RESOURCE_UPDATE</code>
  /// </li>
  /// <li>
  /// <code>STACKSET</code>
  /// </li>
  /// <li>
  /// <code>TEMPLATE</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the constraint.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  Future<CreateConstraintOutput> createConstraint({
    required String parameters,
    required String portfolioId,
    required String productId,
    required String type,
    String? acceptLanguage,
    String? description,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreateConstraint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Parameters': parameters,
        'PortfolioId': portfolioId,
        'ProductId': productId,
        'Type': type,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateConstraintOutput.fromJson(jsonResponse.body);
  }

  /// Creates a portfolio.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [LimitExceededException].
  /// May throw [TagOptionNotMigratedException].
  ///
  /// Parameter [displayName] :
  /// The name to use for display purposes.
  ///
  /// Parameter [providerName] :
  /// The name of the portfolio provider.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the portfolio.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreatePortfolioOutput> createPortfolio({
    required String displayName,
    required String providerName,
    String? acceptLanguage,
    String? description,
    String? idempotencyToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreatePortfolio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DisplayName': displayName,
        'ProviderName': providerName,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePortfolioOutput.fromJson(jsonResponse.body);
  }

  /// Shares the specified portfolio with the specified account or organization
  /// node. Shares to an organization node can only be created by the management
  /// account of an organization or by a delegated administrator. You can share
  /// portfolios to an organization, an organizational unit, or a specific
  /// account.
  ///
  /// Note that if a delegated admin is de-registered, they can no longer create
  /// portfolio shares.
  ///
  /// <code>AWSOrganizationsAccess</code> must be enabled in order to create a
  /// portfolio share to an organization node.
  ///
  /// You can't share a shared resource, including portfolios that contain a
  /// shared product.
  ///
  /// If the portfolio share with the specified account or organization node
  /// already exists, this action will have no effect and will not return an
  /// error. To update an existing share, you must use the <code>
  /// UpdatePortfolioShare</code> API instead.
  /// <note>
  /// When you associate a principal with portfolio, a potential privilege
  /// escalation path may occur when that portfolio is then shared with other
  /// accounts. For a user in a recipient account who is <i>not</i> an Service
  /// Catalog Admin, but still has the ability to create Principals
  /// (Users/Groups/Roles), that user could create a role that matches a
  /// principal name association for the portfolio. Although this user may not
  /// know which principal names are associated through Service Catalog, they
  /// may be able to guess the user. If this potential escalation path is a
  /// concern, then Service Catalog recommends using <code>PrincipalType</code>
  /// as <code>IAM</code>. With this configuration, the
  /// <code>PrincipalARN</code> must already exist in the recipient account
  /// before it can be associated.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParametersException].
  /// May throw [OperationNotSupportedException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID. For example,
  /// <code>123456789012</code>.
  ///
  /// Parameter [organizationNode] :
  /// The organization node to whom you are going to share. When you pass
  /// <code>OrganizationNode</code>, it creates <code>PortfolioShare</code> for
  /// all of the Amazon Web Services accounts that are associated to the
  /// <code>OrganizationNode</code>. The output returns a
  /// <code>PortfolioShareToken</code>, which enables the administrator to
  /// monitor the status of the <code>PortfolioShare</code> creation process.
  ///
  /// Parameter [sharePrincipals] :
  /// This parameter is only supported for portfolios with an
  /// <b>OrganizationalNode</b> Type of <code>ORGANIZATION</code> or
  /// <code>ORGANIZATIONAL_UNIT</code>.
  ///
  /// Enables or disables <code>Principal</code> sharing when creating the
  /// portfolio share. If you do <b>not</b> provide this flag, principal sharing
  /// is disabled.
  ///
  /// When you enable Principal Name Sharing for a portfolio share, the share
  /// recipient account end users with a principal that matches any of the
  /// associated IAM patterns can provision products from the portfolio. Once
  /// shared, the share recipient can view associations of
  /// <code>PrincipalType</code>: <code>IAM_PATTERN</code> on their portfolio.
  /// You can create the principals in the recipient account before or after
  /// creating the share.
  ///
  /// Parameter [shareTagOptions] :
  /// Enables or disables <code>TagOptions </code> sharing when creating the
  /// portfolio share. If this flag is not provided, TagOptions sharing is
  /// disabled.
  Future<CreatePortfolioShareOutput> createPortfolioShare({
    required String portfolioId,
    String? acceptLanguage,
    String? accountId,
    OrganizationNode? organizationNode,
    bool? sharePrincipals,
    bool? shareTagOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreatePortfolioShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (accountId != null) 'AccountId': accountId,
        if (organizationNode != null) 'OrganizationNode': organizationNode,
        if (sharePrincipals != null) 'SharePrincipals': sharePrincipals,
        if (shareTagOptions != null) 'ShareTagOptions': shareTagOptions,
      },
    );

    return CreatePortfolioShareOutput.fromJson(jsonResponse.body);
  }

  /// Creates a product.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// The user or role that performs this operation must have the
  /// <code>cloudformation:GetTemplate</code> IAM policy permission. This policy
  /// permission is required when using the <code>ImportFromPhysicalId</code>
  /// template source in the information data section.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [LimitExceededException].
  /// May throw [TagOptionNotMigratedException].
  ///
  /// Parameter [name] :
  /// The name of the product.
  ///
  /// Parameter [owner] :
  /// The owner of the product.
  ///
  /// Parameter [productType] :
  /// The type of product.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the product.
  ///
  /// Parameter [distributor] :
  /// The distributor of the product.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [provisioningArtifactParameters] :
  /// The configuration of the provisioning artifact.
  ///
  /// Parameter [sourceConnection] :
  /// Specifies connection details for the created product and syncs the product
  /// to the connection source artifact. This automatically manages the
  /// product's artifacts based on changes to the source. The
  /// <code>SourceConnection</code> parameter consists of the following
  /// sub-fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code>
  /// </li>
  /// <li>
  /// <code>ConnectionParamters</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [supportDescription] :
  /// The support information about the product.
  ///
  /// Parameter [supportEmail] :
  /// The contact email for product support.
  ///
  /// Parameter [supportUrl] :
  /// The contact URL for product support.
  ///
  /// <code>^https?:\/\// </code>/ is the pattern used to validate SupportUrl.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateProductOutput> createProduct({
    required String name,
    required String owner,
    required ProductType productType,
    String? acceptLanguage,
    String? description,
    String? distributor,
    String? idempotencyToken,
    ProvisioningArtifactProperties? provisioningArtifactParameters,
    SourceConnection? sourceConnection,
    String? supportDescription,
    String? supportEmail,
    String? supportUrl,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreateProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Owner': owner,
        'ProductType': productType.toValue(),
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
        if (distributor != null) 'Distributor': distributor,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (provisioningArtifactParameters != null)
          'ProvisioningArtifactParameters': provisioningArtifactParameters,
        if (sourceConnection != null) 'SourceConnection': sourceConnection,
        if (supportDescription != null)
          'SupportDescription': supportDescription,
        if (supportEmail != null) 'SupportEmail': supportEmail,
        if (supportUrl != null) 'SupportUrl': supportUrl,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateProductOutput.fromJson(jsonResponse.body);
  }

  /// Creates a plan.
  ///
  /// A plan includes the list of resources to be created (when provisioning a
  /// new product) or modified (when updating a provisioned product) when the
  /// plan is executed.
  ///
  /// You can create one plan for each provisioned product. To create a plan for
  /// an existing provisioned product, the product status must be AVAILABLE or
  /// TAINTED.
  ///
  /// To view the resource changes in the change set, use
  /// <a>DescribeProvisionedProductPlan</a>. To create or modify the provisioned
  /// product, use <a>ExecuteProvisionedProductPlan</a>.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [planName] :
  /// The name of the plan.
  ///
  /// Parameter [planType] :
  /// The plan type.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [provisionedProductName] :
  /// A user-friendly name for the provisioned product. This value must be
  /// unique for the Amazon Web Services account and cannot be updated after the
  /// product is provisioned.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [notificationArns] :
  /// Passed to CloudFormation. The SNS topic ARNs to which to publish
  /// stack-related events.
  ///
  /// Parameter [pathId] :
  /// The path identifier of the product. This value is optional if the product
  /// has a default path, and required if the product has more than one path. To
  /// list the paths for a product, use <a>ListLaunchPaths</a>.
  ///
  /// Parameter [provisioningParameters] :
  /// Parameters specified by the administrator that are required for
  /// provisioning the product.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  ///
  /// If the plan is for an existing provisioned product, the product must have
  /// a <code>RESOURCE_UPDATE</code> constraint with
  /// <code>TagUpdatesOnProvisionedProduct</code> set to <code>ALLOWED</code> to
  /// allow tag updates.
  Future<CreateProvisionedProductPlanOutput> createProvisionedProductPlan({
    required String planName,
    required ProvisionedProductPlanType planType,
    required String productId,
    required String provisionedProductName,
    required String provisioningArtifactId,
    String? acceptLanguage,
    String? idempotencyToken,
    List<String>? notificationArns,
    String? pathId,
    List<UpdateProvisioningParameter>? provisioningParameters,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreateProvisionedProductPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PlanName': planName,
        'PlanType': planType.toValue(),
        'ProductId': productId,
        'ProvisionedProductName': provisionedProductName,
        'ProvisioningArtifactId': provisioningArtifactId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (notificationArns != null) 'NotificationArns': notificationArns,
        if (pathId != null) 'PathId': pathId,
        if (provisioningParameters != null)
          'ProvisioningParameters': provisioningParameters,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateProvisionedProductPlanOutput.fromJson(jsonResponse.body);
  }

  /// Creates a provisioning artifact (also known as a version) for the
  /// specified product.
  ///
  /// You cannot create a provisioning artifact for a product that was shared
  /// with you.
  ///
  /// The user or role that performs this operation must have the
  /// <code>cloudformation:GetTemplate</code> IAM policy permission. This policy
  /// permission is required when using the <code>ImportFromPhysicalId</code>
  /// template source in the information data section.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [parameters] :
  /// The configuration for the provisioning artifact.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  Future<CreateProvisioningArtifactOutput> createProvisioningArtifact({
    required ProvisioningArtifactProperties parameters,
    required String productId,
    String? acceptLanguage,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreateProvisioningArtifact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Parameters': parameters,
        'ProductId': productId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateProvisioningArtifactOutput.fromJson(jsonResponse.body);
  }

  /// Creates a self-service action.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [definition] :
  /// The self-service action definition. Can be one of the following:
  /// <dl> <dt>Name</dt> <dd>
  /// The name of the Amazon Web Services Systems Manager document (SSM
  /// document). For example, <code>AWS-RestartEC2Instance</code>.
  ///
  /// If you are using a shared SSM document, you must provide the ARN instead
  /// of the name.
  /// </dd> <dt>Version</dt> <dd>
  /// The Amazon Web Services Systems Manager automation document version. For
  /// example, <code>"Version": "1"</code>
  /// </dd> <dt>AssumeRole</dt> <dd>
  /// The Amazon Resource Name (ARN) of the role that performs the self-service
  /// actions on your behalf. For example, <code>"AssumeRole":
  /// "arn:aws:iam::12345678910:role/ActionRole"</code>.
  ///
  /// To reuse the provisioned product launch role, set to <code>"AssumeRole":
  /// "LAUNCH_ROLE"</code>.
  /// </dd> <dt>Parameters</dt> <dd>
  /// The list of parameters in JSON format.
  ///
  /// For example: <code>[{\"Name\":\"InstanceId\",\"Type\":\"TARGET\"}]</code>
  /// or <code>[{\"Name\":\"InstanceId\",\"Type\":\"TEXT_VALUE\"}]</code>.
  /// </dd> </dl>
  ///
  /// Parameter [definitionType] :
  /// The service action definition type. For example,
  /// <code>SSM_AUTOMATION</code>.
  ///
  /// Parameter [name] :
  /// The self-service action name.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The self-service action description.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  Future<CreateServiceActionOutput> createServiceAction({
    required Map<ServiceActionDefinitionKey, String> definition,
    required ServiceActionDefinitionType definitionType,
    required String name,
    String? acceptLanguage,
    String? description,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreateServiceAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Definition': definition.map((k, e) => MapEntry(k.toValue(), e)),
        'DefinitionType': definitionType.toValue(),
        'Name': name,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateServiceActionOutput.fromJson(jsonResponse.body);
  }

  /// Creates a TagOption.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [DuplicateResourceException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [key] :
  /// The TagOption key.
  ///
  /// Parameter [value] :
  /// The TagOption value.
  Future<CreateTagOptionOutput> createTagOption({
    required String key,
    required String value,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.CreateTagOption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Key': key,
        'Value': value,
      },
    );

    return CreateTagOptionOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified constraint.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [id] :
  /// The identifier of the constraint.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deleteConstraint({
    required String id,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteConstraint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );
  }

  /// Deletes the specified portfolio.
  ///
  /// You cannot delete a portfolio if it was shared with you or if it has
  /// associated products, users, constraints, or shared accounts.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceInUseException].
  /// May throw [TagOptionNotMigratedException].
  ///
  /// Parameter [id] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deletePortfolio({
    required String id,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeletePortfolio'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );
  }

  /// Stops sharing the specified portfolio with the specified account or
  /// organization node. Shares to an organization node can only be deleted by
  /// the management account of an organization or by a delegated administrator.
  ///
  /// Note that if a delegated admin is de-registered, portfolio shares created
  /// from that account are removed.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [OperationNotSupportedException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID.
  ///
  /// Parameter [organizationNode] :
  /// The organization node to whom you are going to stop sharing.
  Future<DeletePortfolioShareOutput> deletePortfolioShare({
    required String portfolioId,
    String? acceptLanguage,
    String? accountId,
    OrganizationNode? organizationNode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeletePortfolioShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (accountId != null) 'AccountId': accountId,
        if (organizationNode != null) 'OrganizationNode': organizationNode,
      },
    );

    return DeletePortfolioShareOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified product.
  ///
  /// You cannot delete a product if it was shared with you or is associated
  /// with a portfolio.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParametersException].
  /// May throw [TagOptionNotMigratedException].
  ///
  /// Parameter [id] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deleteProduct({
    required String id,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteProduct'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );
  }

  /// Deletes the specified plan.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [planId] :
  /// The plan identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [ignoreErrors] :
  /// If set to true, Service Catalog stops managing the specified provisioned
  /// product even if it cannot delete the underlying resources.
  Future<void> deleteProvisionedProductPlan({
    required String planId,
    String? acceptLanguage,
    bool? ignoreErrors,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteProvisionedProductPlan'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PlanId': planId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (ignoreErrors != null) 'IgnoreErrors': ignoreErrors,
      },
    );
  }

  /// Deletes the specified provisioning artifact (also known as a version) for
  /// the specified product.
  ///
  /// You cannot delete a provisioning artifact associated with a product that
  /// was shared with you. You cannot delete the last provisioning artifact for
  /// a product, because a product must have at least one provisioning artifact.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deleteProvisioningArtifact({
    required String productId,
    required String provisioningArtifactId,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteProvisioningArtifact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        'ProvisioningArtifactId': provisioningArtifactId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );
  }

  /// Deletes a self-service action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [id] :
  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests from the same Amazon Web Services account use the same
  /// idempotency token, the same response is returned for each repeated
  /// request.
  Future<void> deleteServiceAction({
    required String id,
    String? acceptLanguage,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteServiceAction'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Deletes the specified TagOption.
  ///
  /// You cannot delete a TagOption if it is associated with a product or
  /// portfolio.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The TagOption identifier.
  Future<void> deleteTagOption({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteTagOption'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );
  }

  /// Gets information about the specified constraint.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The identifier of the constraint.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeConstraintOutput> describeConstraint({
    required String id,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeConstraint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DescribeConstraintOutput.fromJson(jsonResponse.body);
  }

  /// Gets the status of the specified copy product operation.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [copyProductToken] :
  /// The token for the copy product operation. This token is returned by
  /// <a>CopyProduct</a>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeCopyProductStatusOutput> describeCopyProductStatus({
    required String copyProductToken,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeCopyProductStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CopyProductToken': copyProductToken,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DescribeCopyProductStatusOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified portfolio.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribePortfolioOutput> describePortfolio({
    required String id,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribePortfolio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DescribePortfolioOutput.fromJson(jsonResponse.body);
  }

  /// Gets the status of the specified portfolio share operation. This API can
  /// only be called by the management account in the organization or by a
  /// delegated admin.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [portfolioShareToken] :
  /// The token for the portfolio share operation. This token is returned either
  /// by CreatePortfolioShare or by DeletePortfolioShare.
  Future<DescribePortfolioShareStatusOutput> describePortfolioShareStatus({
    required String portfolioShareToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribePortfolioShareStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioShareToken': portfolioShareToken,
      },
    );

    return DescribePortfolioShareStatusOutput.fromJson(jsonResponse.body);
  }

  /// Returns a summary of each of the portfolio shares that were created for
  /// the specified portfolio.
  ///
  /// You can use this API to determine which accounts or organizational nodes
  /// this portfolio have been shared, whether the recipient entity has imported
  /// the share, and whether TagOptions are included with the share.
  ///
  /// The <code>PortfolioId</code> and <code>Type</code> parameters are both
  /// required.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [portfolioId] :
  /// The unique identifier of the portfolio for which shares will be retrieved.
  ///
  /// Parameter [type] :
  /// The type of portfolio share to summarize. This field acts as a filter on
  /// the type of portfolio share, which can be one of the following:
  ///
  /// 1. <code>ACCOUNT</code> - Represents an external account to account share.
  ///
  /// 2. <code>ORGANIZATION</code> - Represents a share to an organization. This
  /// share is available to every account in the organization.
  ///
  /// 3. <code>ORGANIZATIONAL_UNIT</code> - Represents a share to an
  /// organizational unit.
  ///
  /// 4. <code>ORGANIZATION_MEMBER_ACCOUNT</code> - Represents a share to an
  /// account in the organization.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<DescribePortfolioSharesOutput> describePortfolioShares({
    required String portfolioId,
    required DescribePortfolioShareType type,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribePortfolioShares'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        'Type': type.toValue(),
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return DescribePortfolioSharesOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified product.
  /// <note>
  /// Running this operation with administrator access results in a failure.
  /// <a>DescribeProductAsAdmin</a> should be used instead.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [id] :
  /// The product identifier.
  ///
  /// Parameter [name] :
  /// The product name.
  Future<DescribeProductOutput> describeProduct({
    String? acceptLanguage,
    String? id,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (id != null) 'Id': id,
        if (name != null) 'Name': name,
      },
    );

    return DescribeProductOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified product. This operation is run with
  /// administrator access.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [id] :
  /// The product identifier.
  ///
  /// Parameter [name] :
  /// The product name.
  ///
  /// Parameter [sourcePortfolioId] :
  /// The unique identifier of the shared portfolio that the specified product
  /// is associated with.
  ///
  /// You can provide this parameter to retrieve the shared TagOptions
  /// associated with the product. If this parameter is provided and if
  /// TagOptions sharing is enabled in the portfolio share, the API returns both
  /// local and shared TagOptions associated with the product. Otherwise only
  /// local TagOptions will be returned.
  Future<DescribeProductAsAdminOutput> describeProductAsAdmin({
    String? acceptLanguage,
    String? id,
    String? name,
    String? sourcePortfolioId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeProductAsAdmin'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (id != null) 'Id': id,
        if (name != null) 'Name': name,
        if (sourcePortfolioId != null) 'SourcePortfolioId': sourcePortfolioId,
      },
    );

    return DescribeProductAsAdminOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified product.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [id] :
  /// The product view identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeProductViewOutput> describeProductView({
    required String id,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeProductView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DescribeProductViewOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified provisioned product.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [id] :
  /// The provisioned product identifier. You must provide the name or ID, but
  /// not both.
  ///
  /// If you do not provide a name or ID, or you provide both name and ID, an
  /// <code>InvalidParametersException</code> will occur.
  ///
  /// Parameter [name] :
  /// The name of the provisioned product. You must provide the name or ID, but
  /// not both.
  ///
  /// If you do not provide a name or ID, or you provide both name and ID, an
  /// <code>InvalidParametersException</code> will occur.
  Future<DescribeProvisionedProductOutput> describeProvisionedProduct({
    String? acceptLanguage,
    String? id,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeProvisionedProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (id != null) 'Id': id,
        if (name != null) 'Name': name,
      },
    );

    return DescribeProvisionedProductOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the resource changes for the specified plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [planId] :
  /// The plan identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<DescribeProvisionedProductPlanOutput> describeProvisionedProductPlan({
    required String planId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DescribeProvisionedProductPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PlanId': planId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return DescribeProvisionedProductPlanOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified provisioning artifact (also known as
  /// a version) for the specified product.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [includeProvisioningArtifactParameters] :
  /// Indicates if the API call response does or does not include additional
  /// details about the provisioning parameters.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [productName] :
  /// The product name.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [provisioningArtifactName] :
  /// The provisioning artifact name.
  ///
  /// Parameter [verbose] :
  /// Indicates whether a verbose level of detail is enabled.
  Future<DescribeProvisioningArtifactOutput> describeProvisioningArtifact({
    String? acceptLanguage,
    bool? includeProvisioningArtifactParameters,
    String? productId,
    String? productName,
    String? provisioningArtifactId,
    String? provisioningArtifactName,
    bool? verbose,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeProvisioningArtifact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (includeProvisioningArtifactParameters != null)
          'IncludeProvisioningArtifactParameters':
              includeProvisioningArtifactParameters,
        if (productId != null) 'ProductId': productId,
        if (productName != null) 'ProductName': productName,
        if (provisioningArtifactId != null)
          'ProvisioningArtifactId': provisioningArtifactId,
        if (provisioningArtifactName != null)
          'ProvisioningArtifactName': provisioningArtifactName,
        if (verbose != null) 'Verbose': verbose,
      },
    );

    return DescribeProvisioningArtifactOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the configuration required to provision the
  /// specified product using the specified provisioning artifact.
  ///
  /// If the output contains a TagOption key with an empty list of values, there
  /// is a TagOption conflict for that key. The end user cannot take action to
  /// fix the conflict, and launch is not blocked. In subsequent calls to
  /// <a>ProvisionProduct</a>, do not include conflicted TagOption keys as tags,
  /// or this causes the error "Parameter validation failed: Missing required
  /// parameter in Tags[<i>N</i>]:<i>Value</i>". Tag the provisioned product
  /// with the value <code>sc-tagoption-conflict-portfolioId-productId</code>.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pathId] :
  /// The path identifier of the product. This value is optional if the product
  /// has a default path, and required if the product has more than one path. To
  /// list the paths for a product, use <a>ListLaunchPaths</a>. You must provide
  /// the name or ID, but not both.
  ///
  /// Parameter [pathName] :
  /// The name of the path. You must provide the name or ID, but not both.
  ///
  /// Parameter [productId] :
  /// The product identifier. You must provide the product name or ID, but not
  /// both.
  ///
  /// Parameter [productName] :
  /// The name of the product. You must provide the name or ID, but not both.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact. You must provide the name or
  /// ID, but not both.
  ///
  /// Parameter [provisioningArtifactName] :
  /// The name of the provisioning artifact. You must provide the name or ID,
  /// but not both.
  Future<DescribeProvisioningParametersOutput> describeProvisioningParameters({
    String? acceptLanguage,
    String? pathId,
    String? pathName,
    String? productId,
    String? productName,
    String? provisioningArtifactId,
    String? provisioningArtifactName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DescribeProvisioningParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pathId != null) 'PathId': pathId,
        if (pathName != null) 'PathName': pathName,
        if (productId != null) 'ProductId': productId,
        if (productName != null) 'ProductName': productName,
        if (provisioningArtifactId != null)
          'ProvisioningArtifactId': provisioningArtifactId,
        if (provisioningArtifactName != null)
          'ProvisioningArtifactName': provisioningArtifactName,
      },
    );

    return DescribeProvisioningParametersOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified request operation.
  ///
  /// Use this operation after calling a request operation (for example,
  /// <a>ProvisionProduct</a>, <a>TerminateProvisionedProduct</a>, or
  /// <a>UpdateProvisionedProduct</a>).
  /// <note>
  /// If a provisioned product was transferred to a new owner using
  /// <a>UpdateProvisionedProductProperties</a>, the new owner will be able to
  /// describe all past records for that product. The previous owner will no
  /// longer be able to describe the records, but will be able to use
  /// <a>ListRecordHistory</a> to see the product's history from when he was the
  /// owner.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The record identifier of the provisioned product. This identifier is
  /// returned by the request operation.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<DescribeRecordOutput> describeRecord({
    required String id,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeRecord'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return DescribeRecordOutput.fromJson(jsonResponse.body);
  }

  /// Describes a self-service action.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The self-service action identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeServiceActionOutput> describeServiceAction({
    required String id,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeServiceAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DescribeServiceActionOutput.fromJson(jsonResponse.body);
  }

  /// Finds the default parameters for a specific self-service action on a
  /// specific provisioned product and returns a map of the results to the user.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [provisionedProductId] :
  /// The identifier of the provisioned product.
  ///
  /// Parameter [serviceActionId] :
  /// The self-service action identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeServiceActionExecutionParametersOutput>
      describeServiceActionExecutionParameters({
    required String provisionedProductId,
    required String serviceActionId,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DescribeServiceActionExecutionParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProvisionedProductId': provisionedProductId,
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DescribeServiceActionExecutionParametersOutput.fromJson(
        jsonResponse.body);
  }

  /// Gets information about the specified TagOption.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The TagOption identifier.
  Future<DescribeTagOptionOutput> describeTagOption({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DescribeTagOption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return DescribeTagOptionOutput.fromJson(jsonResponse.body);
  }

  /// Disable portfolio sharing through the Organizations service. This command
  /// will not delete your current shares, but prevents you from creating new
  /// shares throughout your organization. Current shares are not kept in sync
  /// with your organization structure if the structure changes after calling
  /// this API. Only the management account in the organization can call this
  /// API.
  ///
  /// You cannot call this API if there are active delegated administrators in
  /// the organization.
  ///
  /// Note that a delegated administrator is not authorized to invoke
  /// <code>DisableAWSOrganizationsAccess</code>.
  /// <important>
  /// If you share an Service Catalog portfolio in an organization within
  /// Organizations, and then disable Organizations access for Service Catalog,
  /// the portfolio access permissions will not sync with the latest changes to
  /// the organization structure. Specifically, accounts that you removed from
  /// the organization after disabling Service Catalog access will retain access
  /// to the previously shared portfolio.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [OperationNotSupportedException].
  Future<void> disableAWSOrganizationsAccess() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisableAWSOrganizationsAccess'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Disassociates the specified budget from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [budgetName] :
  /// The name of the budget you want to disassociate.
  ///
  /// Parameter [resourceId] :
  /// The resource identifier you want to disassociate from. Either a
  /// portfolio-id or a product-id.
  Future<void> disassociateBudgetFromResource({
    required String budgetName,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateBudgetFromResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BudgetName': budgetName,
        'ResourceId': resourceId,
      },
    );
  }

  /// Disassociates a previously associated principal ARN from a specified
  /// portfolio.
  ///
  /// The <code>PrincipalType</code> and <code>PrincipalARN</code> must match
  /// the <code>AssociatePrincipalWithPortfolio</code> call request details. For
  /// example, to disassociate an association created with a
  /// <code>PrincipalARN</code> of <code>PrincipalType</code> IAM you must use
  /// the <code>PrincipalType</code> IAM when calling
  /// <code>DisassociatePrincipalFromPortfolio</code>.
  ///
  /// For portfolios that have been shared with principal name sharing enabled:
  /// after disassociating a principal, share recipient accounts will no longer
  /// be able to provision products in this portfolio using a role matching the
  /// name of the associated principal.
  ///
  /// For more information, review <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/servicecatalog/associate-principal-with-portfolio.html#options">associate-principal-with-portfolio</a>
  /// in the Amazon Web Services CLI Command Reference.
  /// <note>
  /// If you disassociate a principal from a portfolio, with PrincipalType as
  /// <code>IAM</code>, the same principal will still have access to the
  /// portfolio if it matches one of the associated principals of type
  /// <code>IAM_PATTERN</code>. To fully remove access for a principal, verify
  /// all the associated Principals of type <code>IAM_PATTERN</code>, and then
  /// ensure you disassociate any <code>IAM_PATTERN</code> principals that match
  /// the principal whose access you are removing.
  /// </note>
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [principalARN] :
  /// The ARN of the principal (user, role, or group). This field allows an ARN
  /// with no <code>accountID</code> with or without wildcard characters if
  /// <code>PrincipalType</code> is <code>IAM_PATTERN</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [principalType] :
  /// The supported value is <code>IAM</code> if you use a fully defined ARN, or
  /// <code>IAM_PATTERN</code> if you specify an <code>IAM</code> ARN with no
  /// AccountId, with or without wildcard characters.
  Future<void> disassociatePrincipalFromPortfolio({
    required String portfolioId,
    required String principalARN,
    String? acceptLanguage,
    PrincipalType? principalType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociatePrincipalFromPortfolio'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        'PrincipalARN': principalARN,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (principalType != null) 'PrincipalType': principalType.toValue(),
      },
    );
  }

  /// Disassociates the specified product from the specified portfolio.
  ///
  /// A delegated admin is authorized to invoke this command.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> disassociateProductFromPortfolio({
    required String portfolioId,
    required String productId,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateProductFromPortfolio'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        'ProductId': productId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );
  }

  /// Disassociates the specified self-service action association from the
  /// specified provisioning artifact.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [productId] :
  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  ///
  /// Parameter [serviceActionId] :
  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests from the same Amazon Web Services account use the same
  /// idempotency token, the same response is returned for each repeated
  /// request.
  Future<void> disassociateServiceActionFromProvisioningArtifact({
    required String productId,
    required String provisioningArtifactId,
    required String serviceActionId,
    String? acceptLanguage,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateServiceActionFromProvisioningArtifact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        'ProvisioningArtifactId': provisioningArtifactId,
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Disassociates the specified TagOption from the specified resource.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceId] :
  /// The resource identifier.
  ///
  /// Parameter [tagOptionId] :
  /// The TagOption identifier.
  Future<void> disassociateTagOptionFromResource({
    required String resourceId,
    required String tagOptionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateTagOptionFromResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagOptionId': tagOptionId,
      },
    );
  }

  /// Enable portfolio sharing feature through Organizations. This API will
  /// allow Service Catalog to receive updates on your organization in order to
  /// sync your shares with the current structure. This API can only be called
  /// by the management account in the organization.
  ///
  /// When you call this API, Service Catalog calls
  /// <code>organizations:EnableAWSServiceAccess</code> on your behalf so that
  /// your shares stay in sync with any changes in your Organizations structure.
  ///
  /// Note that a delegated administrator is not authorized to invoke
  /// <code>EnableAWSOrganizationsAccess</code>.
  /// <important>
  /// If you have previously disabled Organizations access for Service Catalog,
  /// and then enable access again, the portfolio access permissions might not
  /// sync with the latest changes to the organization structure. Specifically,
  /// accounts that you removed from the organization after disabling Service
  /// Catalog access, and before you enabled access again, can retain access to
  /// the previously shared portfolio. As a result, an account that has been
  /// removed from the organization might still be able to create or manage
  /// Amazon Web Services resources when it is no longer authorized to do so.
  /// Amazon Web Services is working to resolve this issue.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [OperationNotSupportedException].
  Future<void> enableAWSOrganizationsAccess() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.EnableAWSOrganizationsAccess'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Provisions or modifies a product based on the resource changes for the
  /// specified plan.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [planId] :
  /// The plan identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  Future<ExecuteProvisionedProductPlanOutput> executeProvisionedProductPlan({
    required String planId,
    String? acceptLanguage,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.ExecuteProvisionedProductPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PlanId': planId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );

    return ExecuteProvisionedProductPlanOutput.fromJson(jsonResponse.body);
  }

  /// Executes a self-service action against a provisioned product.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [provisionedProductId] :
  /// The identifier of the provisioned product.
  ///
  /// Parameter [serviceActionId] :
  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [executeToken] :
  /// An idempotency token that uniquely identifies the execute request.
  ///
  /// Parameter [parameters] :
  /// A map of all self-service action parameters and their values. If a
  /// provided parameter is of a special type, such as <code>TARGET</code>, the
  /// provided value will override the default value generated by Service
  /// Catalog. If the parameters field is not provided, no additional parameters
  /// are passed and default values will be used for any special parameters such
  /// as <code>TARGET</code>.
  Future<ExecuteProvisionedProductServiceActionOutput>
      executeProvisionedProductServiceAction({
    required String provisionedProductId,
    required String serviceActionId,
    String? acceptLanguage,
    String? executeToken,
    Map<String, List<String>>? parameters,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.ExecuteProvisionedProductServiceAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProvisionedProductId': provisionedProductId,
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'ExecuteToken': executeToken ?? _s.generateIdempotencyToken(),
        if (parameters != null) 'Parameters': parameters,
      },
    );

    return ExecuteProvisionedProductServiceActionOutput.fromJson(
        jsonResponse.body);
  }

  /// Get the Access Status for Organizations portfolio share feature. This API
  /// can only be called by the management account in the organization or by a
  /// delegated admin.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotSupportedException].
  Future<GetAWSOrganizationsAccessStatusOutput>
      getAWSOrganizationsAccessStatus() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.GetAWSOrganizationsAccessStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAWSOrganizationsAccessStatusOutput.fromJson(jsonResponse.body);
  }

  /// This API takes either a <code>ProvisonedProductId</code> or a
  /// <code>ProvisionedProductName</code>, along with a list of one or more
  /// output keys, and responds with the key/value pairs of those outputs.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [outputKeys] :
  /// The list of keys that the API should return with their values. If none are
  /// provided, the API will return all outputs of the provisioned product.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [provisionedProductId] :
  /// The identifier of the provisioned product that you want the outputs from.
  ///
  /// Parameter [provisionedProductName] :
  /// The name of the provisioned product that you want the outputs from.
  Future<GetProvisionedProductOutputsOutput> getProvisionedProductOutputs({
    String? acceptLanguage,
    List<String>? outputKeys,
    int? pageSize,
    String? pageToken,
    String? provisionedProductId,
    String? provisionedProductName,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.GetProvisionedProductOutputs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (outputKeys != null) 'OutputKeys': outputKeys,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (provisionedProductId != null)
          'ProvisionedProductId': provisionedProductId,
        if (provisionedProductName != null)
          'ProvisionedProductName': provisionedProductName,
      },
    );

    return GetProvisionedProductOutputsOutput.fromJson(jsonResponse.body);
  }

  /// Requests the import of a resource as an Service Catalog provisioned
  /// product that is associated to an Service Catalog product and provisioning
  /// artifact. Once imported, all supported governance actions are supported on
  /// the provisioned product.
  ///
  /// Resource import only supports CloudFormation stack ARNs. CloudFormation
  /// StackSets, and non-root nested stacks, are not supported.
  ///
  /// The CloudFormation stack must have one of the following statuses to be
  /// imported: <code>CREATE_COMPLETE</code>, <code>UPDATE_COMPLETE</code>,
  /// <code>UPDATE_ROLLBACK_COMPLETE</code>, <code>IMPORT_COMPLETE</code>, and
  /// <code>IMPORT_ROLLBACK_COMPLETE</code>.
  ///
  /// Import of the resource requires that the CloudFormation stack template
  /// matches the associated Service Catalog product provisioning artifact.
  /// <note>
  /// When you import an existing CloudFormation stack into a portfolio, Service
  /// Catalog does not apply the product's associated constraints during the
  /// import process. Service Catalog applies the constraints after you call
  /// <code>UpdateProvisionedProduct</code> for the provisioned product.
  /// </note>
  /// The user or role that performs this operation must have the
  /// <code>cloudformation:GetTemplate</code> and
  /// <code>cloudformation:DescribeStacks</code> IAM policy permissions.
  ///
  /// You can only import one provisioned product at a time. The product's
  /// CloudFormation stack must have the <code>IMPORT_COMPLETE</code> status
  /// before you import another.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [physicalId] :
  /// The unique identifier of the resource to be imported. It only currently
  /// supports CloudFormation stack IDs.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [provisionedProductName] :
  /// The user-friendly name of the provisioned product. The value must be
  /// unique for the Amazon Web Services account. The name cannot be updated
  /// after the product is provisioned.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  Future<ImportAsProvisionedProductOutput> importAsProvisionedProduct({
    required String physicalId,
    required String productId,
    required String provisionedProductName,
    required String provisioningArtifactId,
    String? acceptLanguage,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ImportAsProvisionedProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PhysicalId': physicalId,
        'ProductId': productId,
        'ProvisionedProductName': provisionedProductName,
        'ProvisioningArtifactId': provisioningArtifactId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );

    return ImportAsProvisionedProductOutput.fromJson(jsonResponse.body);
  }

  /// Lists all imported portfolios for which account-to-account shares were
  /// accepted by this account. By specifying the
  /// <code>PortfolioShareType</code>, you can list portfolios for which
  /// organizational shares were accepted by this account.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [portfolioShareType] :
  /// The type of shared portfolios to list. The default is to list imported
  /// portfolios.
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_ORGANIZATIONS</code> - List portfolios accepted and shared via
  /// organizational sharing by the management account or delegated
  /// administrator of your organization.
  /// </li>
  /// <li>
  /// <code>AWS_SERVICECATALOG</code> - Deprecated type.
  /// </li>
  /// <li>
  /// <code>IMPORTED</code> - List imported portfolios that have been accepted
  /// and shared through account-to-account sharing.
  /// </li>
  /// </ul>
  Future<ListAcceptedPortfolioSharesOutput> listAcceptedPortfolioShares({
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
    PortfolioShareType? portfolioShareType,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListAcceptedPortfolioShares'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (portfolioShareType != null)
          'PortfolioShareType': portfolioShareType.toValue(),
      },
    );

    return ListAcceptedPortfolioSharesOutput.fromJson(jsonResponse.body);
  }

  /// Lists all the budgets associated to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [resourceId] :
  /// The resource identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListBudgetsForResourceOutput> listBudgetsForResource({
    required String resourceId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListBudgetsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListBudgetsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Lists the constraints for the specified portfolio and product.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [productId] :
  /// The product identifier.
  Future<ListConstraintsForPortfolioOutput> listConstraintsForPortfolio({
    required String portfolioId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
    String? productId,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListConstraintsForPortfolio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (productId != null) 'ProductId': productId,
      },
    );

    return ListConstraintsForPortfolioOutput.fromJson(jsonResponse.body);
  }

  /// Lists the paths to the specified product. A path describes how the user
  /// gets access to a specified product and is necessary when provisioning a
  /// product. A path also determines the constraints that are put on a product.
  /// A path is dependent on a specific product, porfolio, and principal.
  /// <note>
  /// When provisioning a product that's been added to a portfolio, you must
  /// grant your user, group, or role access to the portfolio. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/servicecatalog/latest/adminguide/catalogs_portfolios_users.html">Granting
  /// users access</a> in the <i>Service Catalog User Guide</i>.
  /// </note>
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListLaunchPathsOutput> listLaunchPaths({
    required String productId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListLaunchPaths'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListLaunchPathsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the organization nodes that have access to the specified portfolio.
  /// This API can only be called by the management account in the organization
  /// or by a delegated admin.
  ///
  /// If a delegated admin is de-registered, they can no longer perform this
  /// operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [organizationNodeType] :
  /// The organization node type that will be returned in the output.
  ///
  /// <ul>
  /// <li>
  /// <code>ORGANIZATION</code> - Organization that has access to the portfolio.
  /// </li>
  /// <li>
  /// <code>ORGANIZATIONAL_UNIT</code> - Organizational unit that has access to
  /// the portfolio within your organization.
  /// </li>
  /// <li>
  /// <code>ACCOUNT</code> - Account that has access to the portfolio within
  /// your organization.
  /// </li>
  /// </ul>
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier. For example, <code>port-2abcdext3y5fk</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListOrganizationPortfolioAccessOutput>
      listOrganizationPortfolioAccess({
    required OrganizationNodeType organizationNodeType,
    required String portfolioId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.ListOrganizationPortfolioAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationNodeType': organizationNodeType.toValue(),
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListOrganizationPortfolioAccessOutput.fromJson(jsonResponse.body);
  }

  /// Lists the account IDs that have access to the specified portfolio.
  ///
  /// A delegated admin can list the accounts that have access to the shared
  /// portfolio. Note that if a delegated admin is de-registered, they can no
  /// longer perform this operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationParentId] :
  /// The ID of an organization node the portfolio is shared with. All children
  /// of this node with an inherited portfolio share will be returned.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListPortfolioAccessOutput> listPortfolioAccess({
    required String portfolioId,
    String? acceptLanguage,
    String? organizationParentId,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListPortfolioAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (organizationParentId != null)
          'OrganizationParentId': organizationParentId,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListPortfolioAccessOutput.fromJson(jsonResponse.body);
  }

  /// Lists all portfolios in the catalog.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListPortfoliosOutput> listPortfolios({
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListPortfolios'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListPortfoliosOutput.fromJson(jsonResponse.body);
  }

  /// Lists all portfolios that the specified product is associated with.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListPortfoliosForProductOutput> listPortfoliosForProduct({
    required String productId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListPortfoliosForProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListPortfoliosForProductOutput.fromJson(jsonResponse.body);
  }

  /// Lists all <code>PrincipalARN</code>s and corresponding
  /// <code>PrincipalType</code>s associated with the specified portfolio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListPrincipalsForPortfolioOutput> listPrincipalsForPortfolio({
    required String portfolioId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListPrincipalsForPortfolio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListPrincipalsForPortfolioOutput.fromJson(jsonResponse.body);
  }

  /// Lists the plans for the specified provisioned product or all plans to
  /// which the user has access.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accessLevelFilter] :
  /// The access level to use to obtain results. The default is
  /// <code>User</code>.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [provisionProductId] :
  /// The product identifier.
  Future<ListProvisionedProductPlansOutput> listProvisionedProductPlans({
    String? acceptLanguage,
    AccessLevelFilter? accessLevelFilter,
    int? pageSize,
    String? pageToken,
    String? provisionProductId,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListProvisionedProductPlans'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (provisionProductId != null)
          'ProvisionProductId': provisionProductId,
      },
    );

    return ListProvisionedProductPlansOutput.fromJson(jsonResponse.body);
  }

  /// Lists all provisioning artifacts (also known as versions) for the
  /// specified product.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<ListProvisioningArtifactsOutput> listProvisioningArtifacts({
    required String productId,
    String? acceptLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListProvisioningArtifacts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return ListProvisioningArtifactsOutput.fromJson(jsonResponse.body);
  }

  /// Lists all provisioning artifacts (also known as versions) for the
  /// specified self-service action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [serviceActionId] :
  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListProvisioningArtifactsForServiceActionOutput>
      listProvisioningArtifactsForServiceAction({
    required String serviceActionId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.ListProvisioningArtifactsForServiceAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListProvisioningArtifactsForServiceActionOutput.fromJson(
        jsonResponse.body);
  }

  /// Lists the specified requests or all performed requests.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accessLevelFilter] :
  /// The access level to use to obtain results. The default is
  /// <code>User</code>.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [searchFilter] :
  /// The search filter to scope the results.
  Future<ListRecordHistoryOutput> listRecordHistory({
    String? acceptLanguage,
    AccessLevelFilter? accessLevelFilter,
    int? pageSize,
    String? pageToken,
    ListRecordHistorySearchFilter? searchFilter,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListRecordHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (searchFilter != null) 'SearchFilter': searchFilter,
      },
    );

    return ListRecordHistoryOutput.fromJson(jsonResponse.body);
  }

  /// Lists the resources associated with the specified TagOption.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [tagOptionId] :
  /// The TagOption identifier.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// <ul>
  /// <li>
  /// <code>Portfolio</code>
  /// </li>
  /// <li>
  /// <code>Product</code>
  /// </li>
  /// </ul>
  Future<ListResourcesForTagOptionOutput> listResourcesForTagOption({
    required String tagOptionId,
    int? pageSize,
    String? pageToken,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListResourcesForTagOption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TagOptionId': tagOptionId,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (resourceType != null) 'ResourceType': resourceType,
      },
    );

    return ListResourcesForTagOptionOutput.fromJson(jsonResponse.body);
  }

  /// Lists all self-service actions.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListServiceActionsOutput> listServiceActions({
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListServiceActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListServiceActionsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a paginated list of self-service actions associated with the
  /// specified Product ID and Provisioning Artifact ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [productId] :
  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListServiceActionsForProvisioningArtifactOutput>
      listServiceActionsForProvisioningArtifact({
    required String productId,
    required String provisioningArtifactId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.ListServiceActionsForProvisioningArtifact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        'ProvisioningArtifactId': provisioningArtifactId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListServiceActionsForProvisioningArtifactOutput.fromJson(
        jsonResponse.body);
  }

  /// Returns summary information about stack instances that are associated with
  /// the specified <code>CFN_STACKSET</code> type provisioned product. You can
  /// filter for stack instances that are associated with a specific Amazon Web
  /// Services account name or Region.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [provisionedProductId] :
  /// The identifier of the provisioned product.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListStackInstancesForProvisionedProductOutput>
      listStackInstancesForProvisionedProduct({
    required String provisionedProductId,
    String? acceptLanguage,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.ListStackInstancesForProvisionedProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProvisionedProductId': provisionedProductId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListStackInstancesForProvisionedProductOutput.fromJson(
        jsonResponse.body);
  }

  /// Lists the specified TagOptions or all TagOptions.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [filters] :
  /// The search filters. If no search filters are specified, the output
  /// includes all TagOptions.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ListTagOptionsOutput> listTagOptions({
    ListTagOptionsFilters? filters,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ListTagOptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ListTagOptionsOutput.fromJson(jsonResponse.body);
  }

  /// Notifies the result of the provisioning engine execution.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the record.
  ///
  /// Parameter [status] :
  /// The status of the provisioning engine execution.
  ///
  /// Parameter [workflowToken] :
  /// The encrypted contents of the provisioning engine execution payload that
  /// Service Catalog sends after the Terraform product provisioning workflow
  /// starts.
  ///
  /// Parameter [failureReason] :
  /// The reason why the provisioning engine execution failed.
  ///
  /// Parameter [idempotencyToken] :
  /// The idempotency token that identifies the provisioning engine execution.
  ///
  /// Parameter [outputs] :
  /// The output of the provisioning engine execution.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID for the provisioned product resources that are part of a resource
  /// group.
  Future<void> notifyProvisionProductEngineWorkflowResult({
    required String recordId,
    required EngineWorkflowStatus status,
    required String workflowToken,
    String? failureReason,
    String? idempotencyToken,
    List<RecordOutput>? outputs,
    EngineWorkflowResourceIdentifier? resourceIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.NotifyProvisionProductEngineWorkflowResult'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RecordId': recordId,
        'Status': status.toValue(),
        'WorkflowToken': workflowToken,
        if (failureReason != null) 'FailureReason': failureReason,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (outputs != null) 'Outputs': outputs,
        if (resourceIdentifier != null)
          'ResourceIdentifier': resourceIdentifier,
      },
    );
  }

  /// Notifies the result of the terminate engine execution.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the record.
  ///
  /// Parameter [status] :
  /// The status of the terminate engine execution.
  ///
  /// Parameter [workflowToken] :
  /// The encrypted contents of the terminate engine execution payload that
  /// Service Catalog sends after the Terraform product terminate workflow
  /// starts.
  ///
  /// Parameter [failureReason] :
  /// The reason why the terminate engine execution failed.
  ///
  /// Parameter [idempotencyToken] :
  /// The idempotency token that identifies the terminate engine execution.
  Future<void> notifyTerminateProvisionedProductEngineWorkflowResult({
    required String recordId,
    required EngineWorkflowStatus status,
    required String workflowToken,
    String? failureReason,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.NotifyTerminateProvisionedProductEngineWorkflowResult'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RecordId': recordId,
        'Status': status.toValue(),
        'WorkflowToken': workflowToken,
        if (failureReason != null) 'FailureReason': failureReason,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Notifies the result of the update engine execution.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the record.
  ///
  /// Parameter [status] :
  /// The status of the update engine execution.
  ///
  /// Parameter [workflowToken] :
  /// The encrypted contents of the update engine execution payload that Service
  /// Catalog sends after the Terraform product update workflow starts.
  ///
  /// Parameter [failureReason] :
  /// The reason why the update engine execution failed.
  ///
  /// Parameter [idempotencyToken] :
  /// The idempotency token that identifies the update engine execution.
  ///
  /// Parameter [outputs] :
  /// The output of the update engine execution.
  Future<void> notifyUpdateProvisionedProductEngineWorkflowResult({
    required String recordId,
    required EngineWorkflowStatus status,
    required String workflowToken,
    String? failureReason,
    String? idempotencyToken,
    List<RecordOutput>? outputs,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.NotifyUpdateProvisionedProductEngineWorkflowResult'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RecordId': recordId,
        'Status': status.toValue(),
        'WorkflowToken': workflowToken,
        if (failureReason != null) 'FailureReason': failureReason,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (outputs != null) 'Outputs': outputs,
      },
    );
  }

  /// Provisions the specified product.
  ///
  /// A provisioned product is a resourced instance of a product. For example,
  /// provisioning a product that's based on an CloudFormation template launches
  /// an CloudFormation stack and its underlying resources. You can check the
  /// status of this request using <a>DescribeRecord</a>.
  ///
  /// If the request contains a tag key with an empty list of values, there's a
  /// tag conflict for that key. Don't include conflicted keys as tags, or this
  /// will cause the error "Parameter validation failed: Missing required
  /// parameter in Tags[<i>N</i>]:<i>Value</i>".
  /// <note>
  /// When provisioning a product that's been added to a portfolio, you must
  /// grant your user, group, or role access to the portfolio. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/servicecatalog/latest/adminguide/catalogs_portfolios_users.html">Granting
  /// users access</a> in the <i>Service Catalog User Guide</i>.
  /// </note>
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DuplicateResourceException].
  ///
  /// Parameter [provisionedProductName] :
  /// A user-friendly name for the provisioned product. This value must be
  /// unique for the Amazon Web Services account and cannot be updated after the
  /// product is provisioned.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [notificationArns] :
  /// Passed to CloudFormation. The SNS topic ARNs to which to publish
  /// stack-related events.
  ///
  /// Parameter [pathId] :
  /// The path identifier of the product. This value is optional if the product
  /// has a default path, and required if the product has more than one path. To
  /// list the paths for a product, use <a>ListLaunchPaths</a>. You must provide
  /// the name or ID, but not both.
  ///
  /// Parameter [pathName] :
  /// The name of the path. You must provide the name or ID, but not both.
  ///
  /// Parameter [productId] :
  /// The product identifier. You must provide the name or ID, but not both.
  ///
  /// Parameter [productName] :
  /// The name of the product. You must provide the name or ID, but not both.
  ///
  /// Parameter [provisionToken] :
  /// An idempotency token that uniquely identifies the provisioning request.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact. You must provide the name or
  /// ID, but not both.
  ///
  /// Parameter [provisioningArtifactName] :
  /// The name of the provisioning artifact. You must provide the name or ID,
  /// but not both.
  ///
  /// Parameter [provisioningParameters] :
  /// Parameters specified by the administrator that are required for
  /// provisioning the product.
  ///
  /// Parameter [provisioningPreferences] :
  /// An object that contains information about the provisioning preferences for
  /// a stack set.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<ProvisionProductOutput> provisionProduct({
    required String provisionedProductName,
    String? acceptLanguage,
    List<String>? notificationArns,
    String? pathId,
    String? pathName,
    String? productId,
    String? productName,
    String? provisionToken,
    String? provisioningArtifactId,
    String? provisioningArtifactName,
    List<ProvisioningParameter>? provisioningParameters,
    ProvisioningPreferences? provisioningPreferences,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ProvisionProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProvisionedProductName': provisionedProductName,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (notificationArns != null) 'NotificationArns': notificationArns,
        if (pathId != null) 'PathId': pathId,
        if (pathName != null) 'PathName': pathName,
        if (productId != null) 'ProductId': productId,
        if (productName != null) 'ProductName': productName,
        'ProvisionToken': provisionToken ?? _s.generateIdempotencyToken(),
        if (provisioningArtifactId != null)
          'ProvisioningArtifactId': provisioningArtifactId,
        if (provisioningArtifactName != null)
          'ProvisioningArtifactName': provisioningArtifactName,
        if (provisioningParameters != null)
          'ProvisioningParameters': provisioningParameters,
        if (provisioningPreferences != null)
          'ProvisioningPreferences': provisioningPreferences,
        if (tags != null) 'Tags': tags,
      },
    );

    return ProvisionProductOutput.fromJson(jsonResponse.body);
  }

  /// Rejects an offer to share the specified portfolio.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [portfolioShareType] :
  /// The type of shared portfolios to reject. The default is to reject imported
  /// portfolios.
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_ORGANIZATIONS</code> - Reject portfolios shared by the
  /// management account of your organization.
  /// </li>
  /// <li>
  /// <code>IMPORTED</code> - Reject imported portfolios.
  /// </li>
  /// <li>
  /// <code>AWS_SERVICECATALOG</code> - Not supported. (Throws
  /// ResourceNotFoundException.)
  /// </li>
  /// </ul>
  /// For example, <code>aws servicecatalog reject-portfolio-share
  /// --portfolio-id "port-2qwzkwxt3y5fk" --portfolio-share-type
  /// AWS_ORGANIZATIONS</code>
  Future<void> rejectPortfolioShare({
    required String portfolioId,
    String? acceptLanguage,
    PortfolioShareType? portfolioShareType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.RejectPortfolioShare'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (portfolioShareType != null)
          'PortfolioShareType': portfolioShareType.toValue(),
      },
    );
  }

  /// Lists the provisioned products that are available (not terminated).
  ///
  /// To use additional filtering, see <a>SearchProvisionedProducts</a>.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accessLevelFilter] :
  /// The access level to use to obtain results. The default is
  /// <code>User</code>.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  Future<ScanProvisionedProductsOutput> scanProvisionedProducts({
    String? acceptLanguage,
    AccessLevelFilter? accessLevelFilter,
    int? pageSize,
    String? pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.ScanProvisionedProducts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return ScanProvisionedProductsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the products to which the caller has access.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// The search filters. If no search filters are specified, the output
  /// includes all products to which the caller has access.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [sortBy] :
  /// The sort field. If no value is specified, the results are not sorted.
  ///
  /// Parameter [sortOrder] :
  /// The sort order. If no value is specified, the results are not sorted.
  Future<SearchProductsOutput> searchProducts({
    String? acceptLanguage,
    Map<ProductViewFilterBy, List<String>>? filters,
    int? pageSize,
    String? pageToken,
    ProductViewSortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.SearchProducts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (filters != null)
          'Filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return SearchProductsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the products for the specified portfolio or all
  /// products.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// The search filters. If no search filters are specified, the output
  /// includes all products to which the administrator has access.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [productSource] :
  /// Access level of the source of the product.
  ///
  /// Parameter [sortBy] :
  /// The sort field. If no value is specified, the results are not sorted.
  ///
  /// Parameter [sortOrder] :
  /// The sort order. If no value is specified, the results are not sorted.
  Future<SearchProductsAsAdminOutput> searchProductsAsAdmin({
    String? acceptLanguage,
    Map<ProductViewFilterBy, List<String>>? filters,
    int? pageSize,
    String? pageToken,
    String? portfolioId,
    ProductSource? productSource,
    ProductViewSortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.SearchProductsAsAdmin'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (filters != null)
          'Filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (portfolioId != null) 'PortfolioId': portfolioId,
        if (productSource != null) 'ProductSource': productSource.toValue(),
        if (sortBy != null) 'SortBy': sortBy.toValue(),
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return SearchProductsAsAdminOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the provisioned products that meet the specified
  /// criteria.
  ///
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accessLevelFilter] :
  /// The access level to use to obtain results. The default is
  /// <code>User</code>.
  ///
  /// Parameter [filters] :
  /// The search filters.
  ///
  /// When the key is <code>SearchQuery</code>, the searchable fields are
  /// <code>arn</code>, <code>createdTime</code>, <code>id</code>,
  /// <code>lastRecordId</code>, <code>idempotencyToken</code>,
  /// <code>name</code>, <code>physicalId</code>, <code>productId</code>,
  /// <code>provisioningArtifactId</code>, <code>type</code>,
  /// <code>status</code>, <code>tags</code>, <code>userArn</code>,
  /// <code>userArnSession</code>, <code>lastProvisioningRecordId</code>,
  /// <code>lastSuccessfulProvisioningRecordId</code>, <code>productName</code>,
  /// and <code>provisioningArtifactName</code>.
  ///
  /// Example: <code>"SearchQuery":["status:AVAILABLE"]</code>
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [pageToken] :
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  ///
  /// Parameter [sortBy] :
  /// The sort field. If no value is specified, the results are not sorted. The
  /// valid values are <code>arn</code>, <code>id</code>, <code>name</code>, and
  /// <code>lastRecordId</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order. If no value is specified, the results are not sorted.
  Future<SearchProvisionedProductsOutput> searchProvisionedProducts({
    String? acceptLanguage,
    AccessLevelFilter? accessLevelFilter,
    Map<ProvisionedProductViewFilterBy, List<String>>? filters,
    int? pageSize,
    String? pageToken,
    String? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.SearchProvisionedProducts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
        if (filters != null)
          'Filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
        if (sortBy != null) 'SortBy': sortBy,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return SearchProvisionedProductsOutput.fromJson(jsonResponse.body);
  }

  /// Terminates the specified provisioned product.
  ///
  /// This operation does not delete any records associated with the provisioned
  /// product.
  ///
  /// You can check the status of this request using <a>DescribeRecord</a>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [ignoreErrors] :
  /// If set to true, Service Catalog stops managing the specified provisioned
  /// product even if it cannot delete the underlying resources.
  ///
  /// Parameter [provisionedProductId] :
  /// The identifier of the provisioned product. You cannot specify both
  /// <code>ProvisionedProductName</code> and <code>ProvisionedProductId</code>.
  ///
  /// Parameter [provisionedProductName] :
  /// The name of the provisioned product. You cannot specify both
  /// <code>ProvisionedProductName</code> and <code>ProvisionedProductId</code>.
  ///
  /// Parameter [retainPhysicalResources] :
  /// When this boolean parameter is set to true, the
  /// <code>TerminateProvisionedProduct</code> API deletes the Service Catalog
  /// provisioned product. However, it does not remove the CloudFormation stack,
  /// stack set, or the underlying resources of the deleted provisioned product.
  /// The default value is false.
  ///
  /// Parameter [terminateToken] :
  /// An idempotency token that uniquely identifies the termination request.
  /// This token is only valid during the termination process. After the
  /// provisioned product is terminated, subsequent requests to terminate the
  /// same provisioned product always return <b>ResourceNotFound</b>.
  Future<TerminateProvisionedProductOutput> terminateProvisionedProduct({
    String? acceptLanguage,
    bool? ignoreErrors,
    String? provisionedProductId,
    String? provisionedProductName,
    bool? retainPhysicalResources,
    String? terminateToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.TerminateProvisionedProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (ignoreErrors != null) 'IgnoreErrors': ignoreErrors,
        if (provisionedProductId != null)
          'ProvisionedProductId': provisionedProductId,
        if (provisionedProductName != null)
          'ProvisionedProductName': provisionedProductName,
        if (retainPhysicalResources != null)
          'RetainPhysicalResources': retainPhysicalResources,
        'TerminateToken': terminateToken ?? _s.generateIdempotencyToken(),
      },
    );

    return TerminateProvisionedProductOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified constraint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [id] :
  /// The identifier of the constraint.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The updated description of the constraint.
  ///
  /// Parameter [parameters] :
  /// The constraint parameters, in JSON format. The syntax depends on the
  /// constraint type as follows:
  /// <dl> <dt>LAUNCH</dt> <dd>
  /// You are required to specify either the <code>RoleArn</code> or the
  /// <code>LocalRoleName</code> but can't use both.
  ///
  /// Specify the <code>RoleArn</code> property as follows:
  ///
  /// <code>{"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}</code>
  ///
  /// Specify the <code>LocalRoleName</code> property as follows:
  ///
  /// <code>{"LocalRoleName": "SCBasicLaunchRole"}</code>
  ///
  /// If you specify the <code>LocalRoleName</code> property, when an account
  /// uses the launch constraint, the IAM role with that name in the account
  /// will be used. This allows launch-role constraints to be account-agnostic
  /// so the administrator can create fewer resources per shared account.
  /// <note>
  /// The given role name must exist in the account used to create the launch
  /// constraint and the account of the user who launches a product with this
  /// launch constraint.
  /// </note>
  /// You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code>
  /// constraint.
  ///
  /// You also cannot have more than one <code>LAUNCH</code> constraint on a
  /// product and portfolio.
  /// </dd> <dt>NOTIFICATION</dt> <dd>
  /// Specify the <code>NotificationArns</code> property as follows:
  ///
  /// <code>{"NotificationArns" :
  /// ["arn:aws:sns:us-east-1:123456789012:Topic"]}</code>
  /// </dd> <dt>RESOURCE_UPDATE</dt> <dd>
  /// Specify the <code>TagUpdatesOnProvisionedProduct</code> property as
  /// follows:
  ///
  /// <code>{"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}}</code>
  ///
  /// The <code>TagUpdatesOnProvisionedProduct</code> property accepts a string
  /// value of <code>ALLOWED</code> or <code>NOT_ALLOWED</code>.
  /// </dd> <dt>STACKSET</dt> <dd>
  /// Specify the <code>Parameters</code> property as follows:
  ///
  /// <code>{"Version": "String", "Properties": {"AccountList": [ "String" ],
  /// "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole":
  /// "String"}}</code>
  ///
  /// You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code>
  /// constraint.
  ///
  /// You also cannot have more than one <code>STACKSET</code> constraint on a
  /// product and portfolio.
  ///
  /// Products with a <code>STACKSET</code> constraint will launch an
  /// CloudFormation stack set.
  /// </dd> <dt>TEMPLATE</dt> <dd>
  /// Specify the <code>Rules</code> property. For more information, see <a
  /// href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html">Template
  /// Constraint Rules</a>.
  /// </dd> </dl>
  Future<UpdateConstraintOutput> updateConstraint({
    required String id,
    String? acceptLanguage,
    String? description,
    String? parameters,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdateConstraint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
        if (parameters != null) 'Parameters': parameters,
      },
    );

    return UpdateConstraintOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified portfolio.
  ///
  /// You cannot update a product that was shared with you.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [TagOptionNotMigratedException].
  ///
  /// Parameter [id] :
  /// The portfolio identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [addTags] :
  /// The tags to add.
  ///
  /// Parameter [description] :
  /// The updated description of the portfolio.
  ///
  /// Parameter [displayName] :
  /// The name to use for display purposes.
  ///
  /// Parameter [providerName] :
  /// The updated name of the portfolio provider.
  ///
  /// Parameter [removeTags] :
  /// The tags to remove.
  Future<UpdatePortfolioOutput> updatePortfolio({
    required String id,
    String? acceptLanguage,
    List<Tag>? addTags,
    String? description,
    String? displayName,
    String? providerName,
    List<String>? removeTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdatePortfolio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (addTags != null) 'AddTags': addTags,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (providerName != null) 'ProviderName': providerName,
        if (removeTags != null) 'RemoveTags': removeTags,
      },
    );

    return UpdatePortfolioOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified portfolio share. You can use this API to enable or
  /// disable <code>TagOptions</code> sharing or Principal sharing for an
  /// existing portfolio share.
  ///
  /// The portfolio share cannot be updated if the
  /// <code>CreatePortfolioShare</code> operation is <code>IN_PROGRESS</code>,
  /// as the share is not available to recipient entities. In this case, you
  /// must wait for the portfolio share to be completed.
  ///
  /// You must provide the <code>accountId</code> or organization node in the
  /// input, but not both.
  ///
  /// If the portfolio is shared to both an external account and an organization
  /// node, and both shares need to be updated, you must invoke
  /// <code>UpdatePortfolioShare</code> separately for each share type.
  ///
  /// This API cannot be used for removing the portfolio share. You must use
  /// <code>DeletePortfolioShare</code> API for that action.
  /// <note>
  /// When you associate a principal with portfolio, a potential privilege
  /// escalation path may occur when that portfolio is then shared with other
  /// accounts. For a user in a recipient account who is <i>not</i> an Service
  /// Catalog Admin, but still has the ability to create Principals
  /// (Users/Groups/Roles), that user could create a role that matches a
  /// principal name association for the portfolio. Although this user may not
  /// know which principal names are associated through Service Catalog, they
  /// may be able to guess the user. If this potential escalation path is a
  /// concern, then Service Catalog recommends using <code>PrincipalType</code>
  /// as <code>IAM</code>. With this configuration, the
  /// <code>PrincipalARN</code> must already exist in the recipient account
  /// before it can be associated.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [OperationNotSupportedException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [portfolioId] :
  /// The unique identifier of the portfolio for which the share will be
  /// updated.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account Id of the recipient account. This field is
  /// required when updating an external account to account type share.
  ///
  /// Parameter [sharePrincipals] :
  /// A flag to enables or disables <code>Principals</code> sharing in the
  /// portfolio. If this field is not provided, the current state of the
  /// <code>Principals</code> sharing on the portfolio share will not be
  /// modified.
  ///
  /// Parameter [shareTagOptions] :
  /// Enables or disables <code>TagOptions</code> sharing for the portfolio
  /// share. If this field is not provided, the current state of TagOptions
  /// sharing on the portfolio share will not be modified.
  Future<UpdatePortfolioShareOutput> updatePortfolioShare({
    required String portfolioId,
    String? acceptLanguage,
    String? accountId,
    OrganizationNode? organizationNode,
    bool? sharePrincipals,
    bool? shareTagOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdatePortfolioShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (accountId != null) 'AccountId': accountId,
        if (organizationNode != null) 'OrganizationNode': organizationNode,
        if (sharePrincipals != null) 'SharePrincipals': sharePrincipals,
        if (shareTagOptions != null) 'ShareTagOptions': shareTagOptions,
      },
    );

    return UpdatePortfolioShareOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified product.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  /// May throw [TagOptionNotMigratedException].
  ///
  /// Parameter [id] :
  /// The product identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [addTags] :
  /// The tags to add to the product.
  ///
  /// Parameter [description] :
  /// The updated description of the product.
  ///
  /// Parameter [distributor] :
  /// The updated distributor of the product.
  ///
  /// Parameter [name] :
  /// The updated product name.
  ///
  /// Parameter [owner] :
  /// The updated owner of the product.
  ///
  /// Parameter [removeTags] :
  /// The tags to remove from the product.
  ///
  /// Parameter [sourceConnection] :
  /// Specifies connection details for the updated product and syncs the product
  /// to the connection source artifact. This automatically manages the
  /// product's artifacts based on changes to the source. The
  /// <code>SourceConnection</code> parameter consists of the following
  /// sub-fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code>
  /// </li>
  /// <li>
  /// <code>ConnectionParamters</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [supportDescription] :
  /// The updated support description for the product.
  ///
  /// Parameter [supportEmail] :
  /// The updated support email for the product.
  ///
  /// Parameter [supportUrl] :
  /// The updated support URL for the product.
  Future<UpdateProductOutput> updateProduct({
    required String id,
    String? acceptLanguage,
    List<Tag>? addTags,
    String? description,
    String? distributor,
    String? name,
    String? owner,
    List<String>? removeTags,
    SourceConnection? sourceConnection,
    String? supportDescription,
    String? supportEmail,
    String? supportUrl,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdateProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (addTags != null) 'AddTags': addTags,
        if (description != null) 'Description': description,
        if (distributor != null) 'Distributor': distributor,
        if (name != null) 'Name': name,
        if (owner != null) 'Owner': owner,
        if (removeTags != null) 'RemoveTags': removeTags,
        if (sourceConnection != null) 'SourceConnection': sourceConnection,
        if (supportDescription != null)
          'SupportDescription': supportDescription,
        if (supportEmail != null) 'SupportEmail': supportEmail,
        if (supportUrl != null) 'SupportUrl': supportUrl,
      },
    );

    return UpdateProductOutput.fromJson(jsonResponse.body);
  }

  /// Requests updates to the configuration of the specified provisioned
  /// product.
  ///
  /// If there are tags associated with the object, they cannot be updated or
  /// added. Depending on the specific updates requested, this operation can
  /// update with no interruption, with some interruption, or replace the
  /// provisioned product entirely.
  ///
  /// You can check the status of this request using <a>DescribeRecord</a>.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [pathId] :
  /// The path identifier. This value is optional if the product has a default
  /// path, and required if the product has more than one path. You must provide
  /// the name or ID, but not both.
  ///
  /// Parameter [pathName] :
  /// The name of the path. You must provide the name or ID, but not both.
  ///
  /// Parameter [productId] :
  /// The identifier of the product. You must provide the name or ID, but not
  /// both.
  ///
  /// Parameter [productName] :
  /// The name of the product. You must provide the name or ID, but not both.
  ///
  /// Parameter [provisionedProductId] :
  /// The identifier of the provisioned product. You must provide the name or
  /// ID, but not both.
  ///
  /// Parameter [provisionedProductName] :
  /// The name of the provisioned product. You cannot specify both
  /// <code>ProvisionedProductName</code> and <code>ProvisionedProductId</code>.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [provisioningArtifactName] :
  /// The name of the provisioning artifact. You must provide the name or ID,
  /// but not both.
  ///
  /// Parameter [provisioningParameters] :
  /// The new parameters.
  ///
  /// Parameter [provisioningPreferences] :
  /// An object that contains information about the provisioning preferences for
  /// a stack set.
  ///
  /// Parameter [tags] :
  /// One or more tags. Requires the product to have
  /// <code>RESOURCE_UPDATE</code> constraint with
  /// <code>TagUpdatesOnProvisionedProduct</code> set to <code>ALLOWED</code> to
  /// allow tag updates.
  ///
  /// Parameter [updateToken] :
  /// The idempotency token that uniquely identifies the provisioning update
  /// request.
  Future<UpdateProvisionedProductOutput> updateProvisionedProduct({
    String? acceptLanguage,
    String? pathId,
    String? pathName,
    String? productId,
    String? productName,
    String? provisionedProductId,
    String? provisionedProductName,
    String? provisioningArtifactId,
    String? provisioningArtifactName,
    List<UpdateProvisioningParameter>? provisioningParameters,
    UpdateProvisioningPreferences? provisioningPreferences,
    List<Tag>? tags,
    String? updateToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdateProvisionedProduct'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (pathId != null) 'PathId': pathId,
        if (pathName != null) 'PathName': pathName,
        if (productId != null) 'ProductId': productId,
        if (productName != null) 'ProductName': productName,
        if (provisionedProductId != null)
          'ProvisionedProductId': provisionedProductId,
        if (provisionedProductName != null)
          'ProvisionedProductName': provisionedProductName,
        if (provisioningArtifactId != null)
          'ProvisioningArtifactId': provisioningArtifactId,
        if (provisioningArtifactName != null)
          'ProvisioningArtifactName': provisioningArtifactName,
        if (provisioningParameters != null)
          'ProvisioningParameters': provisioningParameters,
        if (provisioningPreferences != null)
          'ProvisioningPreferences': provisioningPreferences,
        if (tags != null) 'Tags': tags,
        'UpdateToken': updateToken ?? _s.generateIdempotencyToken(),
      },
    );

    return UpdateProvisionedProductOutput.fromJson(jsonResponse.body);
  }

  /// Requests updates to the properties of the specified provisioned product.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [provisionedProductId] :
  /// The identifier of the provisioned product.
  ///
  /// Parameter [provisionedProductProperties] :
  /// A map that contains the provisioned product properties to be updated.
  ///
  /// The <code>LAUNCH_ROLE</code> key accepts role ARNs. This key allows an
  /// administrator to call <code>UpdateProvisionedProductProperties</code> to
  /// update the launch role that is associated with a provisioned product. This
  /// role is used when an end user calls a provisioning operation such as
  /// <code>UpdateProvisionedProduct</code>,
  /// <code>TerminateProvisionedProduct</code>, or
  /// <code>ExecuteProvisionedProductServiceAction</code>. Only a role ARN is
  /// valid. A user ARN is invalid.
  ///
  /// The <code>OWNER</code> key accepts user ARNs, IAM role ARNs, and STS
  /// assumed-role ARNs. The owner is the user that has permission to see,
  /// update, terminate, and execute service actions in the provisioned product.
  ///
  /// The administrator can change the owner of a provisioned product to another
  /// IAM or STS entity within the same account. Both end user owners and
  /// administrators can see ownership history of the provisioned product using
  /// the <code>ListRecordHistory</code> API. The new owner can describe all
  /// past records for the provisioned product using the
  /// <code>DescribeRecord</code> API. The previous owner can no longer use
  /// <code>DescribeRecord</code>, but can still see the product's history from
  /// when he was an owner using <code>ListRecordHistory</code>.
  ///
  /// If a provisioned product ownership is assigned to an end user, they can
  /// see and perform any action through the API or Service Catalog console such
  /// as update, terminate, and execute service actions. If an end user
  /// provisions a product and the owner is updated to someone else, they will
  /// no longer be able to see or perform any actions through API or the Service
  /// Catalog console on that provisioned product.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [idempotencyToken] :
  /// The idempotency token that uniquely identifies the provisioning product
  /// update request.
  Future<UpdateProvisionedProductPropertiesOutput>
      updateProvisionedProductProperties({
    required String provisionedProductId,
    required Map<PropertyKey, String> provisionedProductProperties,
    String? acceptLanguage,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.UpdateProvisionedProductProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProvisionedProductId': provisionedProductId,
        'ProvisionedProductProperties': provisionedProductProperties
            .map((k, e) => MapEntry(k.toValue(), e)),
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );

    return UpdateProvisionedProductPropertiesOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified provisioning artifact (also known as a version) for
  /// the specified product.
  ///
  /// You cannot update a provisioning artifact for a product that was shared
  /// with you.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [productId] :
  /// The product identifier.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [active] :
  /// Indicates whether the product version is active.
  ///
  /// Inactive provisioning artifacts are invisible to end users. End users
  /// cannot launch or update a provisioned product from an inactive
  /// provisioning artifact.
  ///
  /// Parameter [description] :
  /// The updated description of the provisioning artifact.
  ///
  /// Parameter [guidance] :
  /// Information set by the administrator to provide guidance to end users
  /// about which provisioning artifacts to use.
  ///
  /// The <code>DEFAULT</code> value indicates that the product version is
  /// active.
  ///
  /// The administrator can set the guidance to <code>DEPRECATED</code> to
  /// inform users that the product version is deprecated. Users are able to
  /// make updates to a provisioned product of a deprecated version but cannot
  /// launch new provisioned products using a deprecated version.
  ///
  /// Parameter [name] :
  /// The updated name of the provisioning artifact.
  Future<UpdateProvisioningArtifactOutput> updateProvisioningArtifact({
    required String productId,
    required String provisioningArtifactId,
    String? acceptLanguage,
    bool? active,
    String? description,
    ProvisioningArtifactGuidance? guidance,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdateProvisioningArtifact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductId': productId,
        'ProvisioningArtifactId': provisioningArtifactId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (active != null) 'Active': active,
        if (description != null) 'Description': description,
        if (guidance != null) 'Guidance': guidance.toValue(),
        if (name != null) 'Name': name,
      },
    );

    return UpdateProvisioningArtifactOutput.fromJson(jsonResponse.body);
  }

  /// Updates a self-service action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [id] :
  /// The self-service action identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [definition] :
  /// A map that defines the self-service action.
  ///
  /// Parameter [description] :
  /// The self-service action description.
  ///
  /// Parameter [name] :
  /// The self-service action name.
  Future<UpdateServiceActionOutput> updateServiceAction({
    required String id,
    String? acceptLanguage,
    Map<ServiceActionDefinitionKey, String>? definition,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdateServiceAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (definition != null)
          'Definition': definition.map((k, e) => MapEntry(k.toValue(), e)),
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
      },
    );

    return UpdateServiceActionOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified TagOption.
  ///
  /// May throw [TagOptionNotMigratedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [id] :
  /// The TagOption identifier.
  ///
  /// Parameter [active] :
  /// The updated active state.
  ///
  /// Parameter [value] :
  /// The updated value.
  Future<UpdateTagOptionOutput> updateTagOption({
    required String id,
    bool? active,
    String? value,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.UpdateTagOption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (active != null) 'Active': active,
        if (value != null) 'Value': value,
      },
    );

    return UpdateTagOptionOutput.fromJson(jsonResponse.body);
  }
}

class AcceptPortfolioShareOutput {
  AcceptPortfolioShareOutput();

  factory AcceptPortfolioShareOutput.fromJson(Map<String, dynamic> _) {
    return AcceptPortfolioShareOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The access level to use to filter results.
class AccessLevelFilter {
  /// The access level.
  ///
  /// <ul>
  /// <li>
  /// <code>Account</code> - Filter results based on the account.
  /// </li>
  /// <li>
  /// <code>Role</code> - Filter results based on the federated role of the
  /// specified user.
  /// </li>
  /// <li>
  /// <code>User</code> - Filter results based on the specified user.
  /// </li>
  /// </ul>
  final AccessLevelFilterKey? key;

  /// The user to which the access level applies. The only supported value is
  /// <code>self</code>.
  final String? value;

  AccessLevelFilter({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum AccessLevelFilterKey {
  account,
  role,
  user,
}

extension AccessLevelFilterKeyValueExtension on AccessLevelFilterKey {
  String toValue() {
    switch (this) {
      case AccessLevelFilterKey.account:
        return 'Account';
      case AccessLevelFilterKey.role:
        return 'Role';
      case AccessLevelFilterKey.user:
        return 'User';
    }
  }
}

extension AccessLevelFilterKeyFromString on String {
  AccessLevelFilterKey toAccessLevelFilterKey() {
    switch (this) {
      case 'Account':
        return AccessLevelFilterKey.account;
      case 'Role':
        return AccessLevelFilterKey.role;
      case 'User':
        return AccessLevelFilterKey.user;
    }
    throw Exception('$this is not known in enum AccessLevelFilterKey');
  }
}

enum AccessStatus {
  enabled,
  underChange,
  disabled,
}

extension AccessStatusValueExtension on AccessStatus {
  String toValue() {
    switch (this) {
      case AccessStatus.enabled:
        return 'ENABLED';
      case AccessStatus.underChange:
        return 'UNDER_CHANGE';
      case AccessStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension AccessStatusFromString on String {
  AccessStatus toAccessStatus() {
    switch (this) {
      case 'ENABLED':
        return AccessStatus.enabled;
      case 'UNDER_CHANGE':
        return AccessStatus.underChange;
      case 'DISABLED':
        return AccessStatus.disabled;
    }
    throw Exception('$this is not known in enum AccessStatus');
  }
}

class AssociateBudgetWithResourceOutput {
  AssociateBudgetWithResourceOutput();

  factory AssociateBudgetWithResourceOutput.fromJson(Map<String, dynamic> _) {
    return AssociateBudgetWithResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociatePrincipalWithPortfolioOutput {
  AssociatePrincipalWithPortfolioOutput();

  factory AssociatePrincipalWithPortfolioOutput.fromJson(
      Map<String, dynamic> _) {
    return AssociatePrincipalWithPortfolioOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateProductWithPortfolioOutput {
  AssociateProductWithPortfolioOutput();

  factory AssociateProductWithPortfolioOutput.fromJson(Map<String, dynamic> _) {
    return AssociateProductWithPortfolioOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateServiceActionWithProvisioningArtifactOutput {
  AssociateServiceActionWithProvisioningArtifactOutput();

  factory AssociateServiceActionWithProvisioningArtifactOutput.fromJson(
      Map<String, dynamic> _) {
    return AssociateServiceActionWithProvisioningArtifactOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateTagOptionWithResourceOutput {
  AssociateTagOptionWithResourceOutput();

  factory AssociateTagOptionWithResourceOutput.fromJson(
      Map<String, dynamic> _) {
    return AssociateTagOptionWithResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class BatchAssociateServiceActionWithProvisioningArtifactOutput {
  /// An object that contains a list of errors, along with information to help you
  /// identify the self-service action.
  final List<FailedServiceActionAssociation>? failedServiceActionAssociations;

  BatchAssociateServiceActionWithProvisioningArtifactOutput({
    this.failedServiceActionAssociations,
  });

  factory BatchAssociateServiceActionWithProvisioningArtifactOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateServiceActionWithProvisioningArtifactOutput(
      failedServiceActionAssociations:
          (json['FailedServiceActionAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => FailedServiceActionAssociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedServiceActionAssociations =
        this.failedServiceActionAssociations;
    return {
      if (failedServiceActionAssociations != null)
        'FailedServiceActionAssociations': failedServiceActionAssociations,
    };
  }
}

class BatchDisassociateServiceActionFromProvisioningArtifactOutput {
  /// An object that contains a list of errors, along with information to help you
  /// identify the self-service action.
  final List<FailedServiceActionAssociation>? failedServiceActionAssociations;

  BatchDisassociateServiceActionFromProvisioningArtifactOutput({
    this.failedServiceActionAssociations,
  });

  factory BatchDisassociateServiceActionFromProvisioningArtifactOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateServiceActionFromProvisioningArtifactOutput(
      failedServiceActionAssociations:
          (json['FailedServiceActionAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => FailedServiceActionAssociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedServiceActionAssociations =
        this.failedServiceActionAssociations;
    return {
      if (failedServiceActionAssociations != null)
        'FailedServiceActionAssociations': failedServiceActionAssociations,
    };
  }
}

/// Information about a budget.
class BudgetDetail {
  /// Name of the associated budget.
  final String? budgetName;

  BudgetDetail({
    this.budgetName,
  });

  factory BudgetDetail.fromJson(Map<String, dynamic> json) {
    return BudgetDetail(
      budgetName: json['BudgetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgetName = this.budgetName;
    return {
      if (budgetName != null) 'BudgetName': budgetName,
    };
  }
}

enum ChangeAction {
  add,
  modify,
  remove,
}

extension ChangeActionValueExtension on ChangeAction {
  String toValue() {
    switch (this) {
      case ChangeAction.add:
        return 'ADD';
      case ChangeAction.modify:
        return 'MODIFY';
      case ChangeAction.remove:
        return 'REMOVE';
    }
  }
}

extension ChangeActionFromString on String {
  ChangeAction toChangeAction() {
    switch (this) {
      case 'ADD':
        return ChangeAction.add;
      case 'MODIFY':
        return ChangeAction.modify;
      case 'REMOVE':
        return ChangeAction.remove;
    }
    throw Exception('$this is not known in enum ChangeAction');
  }
}

/// Information about a CloudWatch dashboard.
class CloudWatchDashboard {
  /// The name of the CloudWatch dashboard.
  final String? name;

  CloudWatchDashboard({
    this.name,
  });

  factory CloudWatchDashboard.fromJson(Map<String, dynamic> json) {
    return CloudWatchDashboard(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// The subtype containing details about the Codestar connection
/// <code>Type</code>.
class CodeStarParameters {
  /// The absolute path wehre the artifact resides within the repo and branch,
  /// formatted as "folder/file.json."
  final String artifactPath;

  /// The specific branch where the artifact resides.
  final String branch;

  /// The CodeStar ARN, which is the connection between Service Catalog and the
  /// external repository.
  final String connectionArn;

  /// The specific repository where the product’s artifact-to-be-synced resides,
  /// formatted as "Account/Repo."
  final String repository;

  CodeStarParameters({
    required this.artifactPath,
    required this.branch,
    required this.connectionArn,
    required this.repository,
  });

  factory CodeStarParameters.fromJson(Map<String, dynamic> json) {
    return CodeStarParameters(
      artifactPath: json['ArtifactPath'] as String,
      branch: json['Branch'] as String,
      connectionArn: json['ConnectionArn'] as String,
      repository: json['Repository'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactPath = this.artifactPath;
    final branch = this.branch;
    final connectionArn = this.connectionArn;
    final repository = this.repository;
    return {
      'ArtifactPath': artifactPath,
      'Branch': branch,
      'ConnectionArn': connectionArn,
      'Repository': repository,
    };
  }
}

/// Information about a constraint.
class ConstraintDetail {
  /// The identifier of the constraint.
  final String? constraintId;

  /// The description of the constraint.
  final String? description;

  /// The owner of the constraint.
  final String? owner;

  /// The identifier of the portfolio the product resides in. The constraint
  /// applies only to the instance of the product that lives within this
  /// portfolio.
  final String? portfolioId;

  /// The identifier of the product the constraint applies to. Note that a
  /// constraint applies to a specific instance of a product within a certain
  /// portfolio.
  final String? productId;

  /// The type of constraint.
  ///
  /// <ul>
  /// <li>
  /// <code>LAUNCH</code>
  /// </li>
  /// <li>
  /// <code>NOTIFICATION</code>
  /// </li>
  /// <li>
  /// STACKSET
  /// </li>
  /// <li>
  /// <code>TEMPLATE</code>
  /// </li>
  /// </ul>
  final String? type;

  ConstraintDetail({
    this.constraintId,
    this.description,
    this.owner,
    this.portfolioId,
    this.productId,
    this.type,
  });

  factory ConstraintDetail.fromJson(Map<String, dynamic> json) {
    return ConstraintDetail(
      constraintId: json['ConstraintId'] as String?,
      description: json['Description'] as String?,
      owner: json['Owner'] as String?,
      portfolioId: json['PortfolioId'] as String?,
      productId: json['ProductId'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final constraintId = this.constraintId;
    final description = this.description;
    final owner = this.owner;
    final portfolioId = this.portfolioId;
    final productId = this.productId;
    final type = this.type;
    return {
      if (constraintId != null) 'ConstraintId': constraintId,
      if (description != null) 'Description': description,
      if (owner != null) 'Owner': owner,
      if (portfolioId != null) 'PortfolioId': portfolioId,
      if (productId != null) 'ProductId': productId,
      if (type != null) 'Type': type,
    };
  }
}

/// Summary information about a constraint.
class ConstraintSummary {
  /// The description of the constraint.
  final String? description;

  /// The type of constraint.
  ///
  /// <ul>
  /// <li>
  /// <code>LAUNCH</code>
  /// </li>
  /// <li>
  /// <code>NOTIFICATION</code>
  /// </li>
  /// <li>
  /// STACKSET
  /// </li>
  /// <li>
  /// <code>TEMPLATE</code>
  /// </li>
  /// </ul>
  final String? type;

  ConstraintSummary({
    this.description,
    this.type,
  });

  factory ConstraintSummary.fromJson(Map<String, dynamic> json) {
    return ConstraintSummary(
      description: json['Description'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final type = this.type;
    return {
      if (description != null) 'Description': description,
      if (type != null) 'Type': type,
    };
  }
}

enum CopyOption {
  copyTags,
}

extension CopyOptionValueExtension on CopyOption {
  String toValue() {
    switch (this) {
      case CopyOption.copyTags:
        return 'CopyTags';
    }
  }
}

extension CopyOptionFromString on String {
  CopyOption toCopyOption() {
    switch (this) {
      case 'CopyTags':
        return CopyOption.copyTags;
    }
    throw Exception('$this is not known in enum CopyOption');
  }
}

class CopyProductOutput {
  /// The token to use to track the progress of the operation.
  final String? copyProductToken;

  CopyProductOutput({
    this.copyProductToken,
  });

  factory CopyProductOutput.fromJson(Map<String, dynamic> json) {
    return CopyProductOutput(
      copyProductToken: json['CopyProductToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyProductToken = this.copyProductToken;
    return {
      if (copyProductToken != null) 'CopyProductToken': copyProductToken,
    };
  }
}

enum CopyProductStatus {
  succeeded,
  inProgress,
  failed,
}

extension CopyProductStatusValueExtension on CopyProductStatus {
  String toValue() {
    switch (this) {
      case CopyProductStatus.succeeded:
        return 'SUCCEEDED';
      case CopyProductStatus.inProgress:
        return 'IN_PROGRESS';
      case CopyProductStatus.failed:
        return 'FAILED';
    }
  }
}

extension CopyProductStatusFromString on String {
  CopyProductStatus toCopyProductStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return CopyProductStatus.succeeded;
      case 'IN_PROGRESS':
        return CopyProductStatus.inProgress;
      case 'FAILED':
        return CopyProductStatus.failed;
    }
    throw Exception('$this is not known in enum CopyProductStatus');
  }
}

class CreateConstraintOutput {
  /// Information about the constraint.
  final ConstraintDetail? constraintDetail;

  /// The constraint parameters.
  final String? constraintParameters;

  /// The status of the current request.
  final Status? status;

  CreateConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });

  factory CreateConstraintOutput.fromJson(Map<String, dynamic> json) {
    return CreateConstraintOutput(
      constraintDetail: json['ConstraintDetail'] != null
          ? ConstraintDetail.fromJson(
              json['ConstraintDetail'] as Map<String, dynamic>)
          : null,
      constraintParameters: json['ConstraintParameters'] as String?,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final constraintDetail = this.constraintDetail;
    final constraintParameters = this.constraintParameters;
    final status = this.status;
    return {
      if (constraintDetail != null) 'ConstraintDetail': constraintDetail,
      if (constraintParameters != null)
        'ConstraintParameters': constraintParameters,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class CreatePortfolioOutput {
  /// Information about the portfolio.
  final PortfolioDetail? portfolioDetail;

  /// Information about the tags associated with the portfolio.
  final List<Tag>? tags;

  CreatePortfolioOutput({
    this.portfolioDetail,
    this.tags,
  });

  factory CreatePortfolioOutput.fromJson(Map<String, dynamic> json) {
    return CreatePortfolioOutput(
      portfolioDetail: json['PortfolioDetail'] != null
          ? PortfolioDetail.fromJson(
              json['PortfolioDetail'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final portfolioDetail = this.portfolioDetail;
    final tags = this.tags;
    return {
      if (portfolioDetail != null) 'PortfolioDetail': portfolioDetail,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreatePortfolioShareOutput {
  /// The portfolio shares a unique identifier that only returns if the portfolio
  /// is shared to an organization node.
  final String? portfolioShareToken;

  CreatePortfolioShareOutput({
    this.portfolioShareToken,
  });

  factory CreatePortfolioShareOutput.fromJson(Map<String, dynamic> json) {
    return CreatePortfolioShareOutput(
      portfolioShareToken: json['PortfolioShareToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portfolioShareToken = this.portfolioShareToken;
    return {
      if (portfolioShareToken != null)
        'PortfolioShareToken': portfolioShareToken,
    };
  }
}

class CreateProductOutput {
  /// Information about the product view.
  final ProductViewDetail? productViewDetail;

  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail? provisioningArtifactDetail;

  /// Information about the tags associated with the product.
  final List<Tag>? tags;

  CreateProductOutput({
    this.productViewDetail,
    this.provisioningArtifactDetail,
    this.tags,
  });

  factory CreateProductOutput.fromJson(Map<String, dynamic> json) {
    return CreateProductOutput(
      productViewDetail: json['ProductViewDetail'] != null
          ? ProductViewDetail.fromJson(
              json['ProductViewDetail'] as Map<String, dynamic>)
          : null,
      provisioningArtifactDetail: json['ProvisioningArtifactDetail'] != null
          ? ProvisioningArtifactDetail.fromJson(
              json['ProvisioningArtifactDetail'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final productViewDetail = this.productViewDetail;
    final provisioningArtifactDetail = this.provisioningArtifactDetail;
    final tags = this.tags;
    return {
      if (productViewDetail != null) 'ProductViewDetail': productViewDetail,
      if (provisioningArtifactDetail != null)
        'ProvisioningArtifactDetail': provisioningArtifactDetail,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateProvisionedProductPlanOutput {
  /// The plan identifier.
  final String? planId;

  /// The name of the plan.
  final String? planName;

  /// The product identifier.
  final String? provisionProductId;

  /// The user-friendly name of the provisioned product.
  final String? provisionedProductName;

  /// The identifier of the provisioning artifact.
  final String? provisioningArtifactId;

  CreateProvisionedProductPlanOutput({
    this.planId,
    this.planName,
    this.provisionProductId,
    this.provisionedProductName,
    this.provisioningArtifactId,
  });

  factory CreateProvisionedProductPlanOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateProvisionedProductPlanOutput(
      planId: json['PlanId'] as String?,
      planName: json['PlanName'] as String?,
      provisionProductId: json['ProvisionProductId'] as String?,
      provisionedProductName: json['ProvisionedProductName'] as String?,
      provisioningArtifactId: json['ProvisioningArtifactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final planId = this.planId;
    final planName = this.planName;
    final provisionProductId = this.provisionProductId;
    final provisionedProductName = this.provisionedProductName;
    final provisioningArtifactId = this.provisioningArtifactId;
    return {
      if (planId != null) 'PlanId': planId,
      if (planName != null) 'PlanName': planName,
      if (provisionProductId != null) 'ProvisionProductId': provisionProductId,
      if (provisionedProductName != null)
        'ProvisionedProductName': provisionedProductName,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
    };
  }
}

class CreateProvisioningArtifactOutput {
  /// Specify the template source with one of the following options, but not both.
  /// Keys accepted: [ <code>LoadTemplateFromURL</code>,
  /// <code>ImportFromPhysicalId</code> ].
  ///
  /// Use the URL of the CloudFormation template in Amazon S3 or GitHub in JSON
  /// format.
  ///
  /// <code>LoadTemplateFromURL</code>
  ///
  /// Use the URL of the CloudFormation template in Amazon S3 or GitHub in JSON
  /// format.
  ///
  /// <code>ImportFromPhysicalId</code>
  ///
  /// Use the physical id of the resource that contains the template; currently
  /// supports CloudFormation stack ARN.
  final Map<String, String>? info;

  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail? provisioningArtifactDetail;

  /// The status of the current request.
  final Status? status;

  CreateProvisioningArtifactOutput({
    this.info,
    this.provisioningArtifactDetail,
    this.status,
  });

  factory CreateProvisioningArtifactOutput.fromJson(Map<String, dynamic> json) {
    return CreateProvisioningArtifactOutput(
      info: (json['Info'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      provisioningArtifactDetail: json['ProvisioningArtifactDetail'] != null
          ? ProvisioningArtifactDetail.fromJson(
              json['ProvisioningArtifactDetail'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final info = this.info;
    final provisioningArtifactDetail = this.provisioningArtifactDetail;
    final status = this.status;
    return {
      if (info != null) 'Info': info,
      if (provisioningArtifactDetail != null)
        'ProvisioningArtifactDetail': provisioningArtifactDetail,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class CreateServiceActionOutput {
  /// An object containing information about the self-service action.
  final ServiceActionDetail? serviceActionDetail;

  CreateServiceActionOutput({
    this.serviceActionDetail,
  });

  factory CreateServiceActionOutput.fromJson(Map<String, dynamic> json) {
    return CreateServiceActionOutput(
      serviceActionDetail: json['ServiceActionDetail'] != null
          ? ServiceActionDetail.fromJson(
              json['ServiceActionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceActionDetail = this.serviceActionDetail;
    return {
      if (serviceActionDetail != null)
        'ServiceActionDetail': serviceActionDetail,
    };
  }
}

class CreateTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail? tagOptionDetail;

  CreateTagOptionOutput({
    this.tagOptionDetail,
  });

  factory CreateTagOptionOutput.fromJson(Map<String, dynamic> json) {
    return CreateTagOptionOutput(
      tagOptionDetail: json['TagOptionDetail'] != null
          ? TagOptionDetail.fromJson(
              json['TagOptionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tagOptionDetail = this.tagOptionDetail;
    return {
      if (tagOptionDetail != null) 'TagOptionDetail': tagOptionDetail,
    };
  }
}

class DeleteConstraintOutput {
  DeleteConstraintOutput();

  factory DeleteConstraintOutput.fromJson(Map<String, dynamic> _) {
    return DeleteConstraintOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePortfolioOutput {
  DeletePortfolioOutput();

  factory DeletePortfolioOutput.fromJson(Map<String, dynamic> _) {
    return DeletePortfolioOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePortfolioShareOutput {
  /// The portfolio share unique identifier. This will only be returned if delete
  /// is made to an organization node.
  final String? portfolioShareToken;

  DeletePortfolioShareOutput({
    this.portfolioShareToken,
  });

  factory DeletePortfolioShareOutput.fromJson(Map<String, dynamic> json) {
    return DeletePortfolioShareOutput(
      portfolioShareToken: json['PortfolioShareToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portfolioShareToken = this.portfolioShareToken;
    return {
      if (portfolioShareToken != null)
        'PortfolioShareToken': portfolioShareToken,
    };
  }
}

class DeleteProductOutput {
  DeleteProductOutput();

  factory DeleteProductOutput.fromJson(Map<String, dynamic> _) {
    return DeleteProductOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProvisionedProductPlanOutput {
  DeleteProvisionedProductPlanOutput();

  factory DeleteProvisionedProductPlanOutput.fromJson(Map<String, dynamic> _) {
    return DeleteProvisionedProductPlanOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProvisioningArtifactOutput {
  DeleteProvisioningArtifactOutput();

  factory DeleteProvisioningArtifactOutput.fromJson(Map<String, dynamic> _) {
    return DeleteProvisioningArtifactOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteServiceActionOutput {
  DeleteServiceActionOutput();

  factory DeleteServiceActionOutput.fromJson(Map<String, dynamic> _) {
    return DeleteServiceActionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTagOptionOutput {
  DeleteTagOptionOutput();

  factory DeleteTagOptionOutput.fromJson(Map<String, dynamic> _) {
    return DeleteTagOptionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeConstraintOutput {
  /// Information about the constraint.
  final ConstraintDetail? constraintDetail;

  /// The constraint parameters.
  final String? constraintParameters;

  /// The status of the current request.
  final Status? status;

  DescribeConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });

  factory DescribeConstraintOutput.fromJson(Map<String, dynamic> json) {
    return DescribeConstraintOutput(
      constraintDetail: json['ConstraintDetail'] != null
          ? ConstraintDetail.fromJson(
              json['ConstraintDetail'] as Map<String, dynamic>)
          : null,
      constraintParameters: json['ConstraintParameters'] as String?,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final constraintDetail = this.constraintDetail;
    final constraintParameters = this.constraintParameters;
    final status = this.status;
    return {
      if (constraintDetail != null) 'ConstraintDetail': constraintDetail,
      if (constraintParameters != null)
        'ConstraintParameters': constraintParameters,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeCopyProductStatusOutput {
  /// The status of the copy product operation.
  final CopyProductStatus? copyProductStatus;

  /// The status message.
  final String? statusDetail;

  /// The identifier of the copied product.
  final String? targetProductId;

  DescribeCopyProductStatusOutput({
    this.copyProductStatus,
    this.statusDetail,
    this.targetProductId,
  });

  factory DescribeCopyProductStatusOutput.fromJson(Map<String, dynamic> json) {
    return DescribeCopyProductStatusOutput(
      copyProductStatus:
          (json['CopyProductStatus'] as String?)?.toCopyProductStatus(),
      statusDetail: json['StatusDetail'] as String?,
      targetProductId: json['TargetProductId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyProductStatus = this.copyProductStatus;
    final statusDetail = this.statusDetail;
    final targetProductId = this.targetProductId;
    return {
      if (copyProductStatus != null)
        'CopyProductStatus': copyProductStatus.toValue(),
      if (statusDetail != null) 'StatusDetail': statusDetail,
      if (targetProductId != null) 'TargetProductId': targetProductId,
    };
  }
}

class DescribePortfolioOutput {
  /// Information about the associated budgets.
  final List<BudgetDetail>? budgets;

  /// Information about the portfolio.
  final PortfolioDetail? portfolioDetail;

  /// Information about the TagOptions associated with the portfolio.
  final List<TagOptionDetail>? tagOptions;

  /// Information about the tags associated with the portfolio.
  final List<Tag>? tags;

  DescribePortfolioOutput({
    this.budgets,
    this.portfolioDetail,
    this.tagOptions,
    this.tags,
  });

  factory DescribePortfolioOutput.fromJson(Map<String, dynamic> json) {
    return DescribePortfolioOutput(
      budgets: (json['Budgets'] as List?)
          ?.whereNotNull()
          .map((e) => BudgetDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      portfolioDetail: json['PortfolioDetail'] != null
          ? PortfolioDetail.fromJson(
              json['PortfolioDetail'] as Map<String, dynamic>)
          : null,
      tagOptions: (json['TagOptions'] as List?)
          ?.whereNotNull()
          .map((e) => TagOptionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final budgets = this.budgets;
    final portfolioDetail = this.portfolioDetail;
    final tagOptions = this.tagOptions;
    final tags = this.tags;
    return {
      if (budgets != null) 'Budgets': budgets,
      if (portfolioDetail != null) 'PortfolioDetail': portfolioDetail,
      if (tagOptions != null) 'TagOptions': tagOptions,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribePortfolioShareStatusOutput {
  /// Organization node identifier. It can be either account id, organizational
  /// unit id or organization id.
  final String? organizationNodeValue;

  /// The portfolio identifier.
  final String? portfolioId;

  /// The token for the portfolio share operation. For example,
  /// <code>share-6v24abcdefghi</code>.
  final String? portfolioShareToken;

  /// Information about the portfolio share operation.
  final ShareDetails? shareDetails;

  /// Status of the portfolio share operation.
  final ShareStatus? status;

  DescribePortfolioShareStatusOutput({
    this.organizationNodeValue,
    this.portfolioId,
    this.portfolioShareToken,
    this.shareDetails,
    this.status,
  });

  factory DescribePortfolioShareStatusOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribePortfolioShareStatusOutput(
      organizationNodeValue: json['OrganizationNodeValue'] as String?,
      portfolioId: json['PortfolioId'] as String?,
      portfolioShareToken: json['PortfolioShareToken'] as String?,
      shareDetails: json['ShareDetails'] != null
          ? ShareDetails.fromJson(json['ShareDetails'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationNodeValue = this.organizationNodeValue;
    final portfolioId = this.portfolioId;
    final portfolioShareToken = this.portfolioShareToken;
    final shareDetails = this.shareDetails;
    final status = this.status;
    return {
      if (organizationNodeValue != null)
        'OrganizationNodeValue': organizationNodeValue,
      if (portfolioId != null) 'PortfolioId': portfolioId,
      if (portfolioShareToken != null)
        'PortfolioShareToken': portfolioShareToken,
      if (shareDetails != null) 'ShareDetails': shareDetails,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum DescribePortfolioShareType {
  account,
  organization,
  organizationalUnit,
  organizationMemberAccount,
}

extension DescribePortfolioShareTypeValueExtension
    on DescribePortfolioShareType {
  String toValue() {
    switch (this) {
      case DescribePortfolioShareType.account:
        return 'ACCOUNT';
      case DescribePortfolioShareType.organization:
        return 'ORGANIZATION';
      case DescribePortfolioShareType.organizationalUnit:
        return 'ORGANIZATIONAL_UNIT';
      case DescribePortfolioShareType.organizationMemberAccount:
        return 'ORGANIZATION_MEMBER_ACCOUNT';
    }
  }
}

extension DescribePortfolioShareTypeFromString on String {
  DescribePortfolioShareType toDescribePortfolioShareType() {
    switch (this) {
      case 'ACCOUNT':
        return DescribePortfolioShareType.account;
      case 'ORGANIZATION':
        return DescribePortfolioShareType.organization;
      case 'ORGANIZATIONAL_UNIT':
        return DescribePortfolioShareType.organizationalUnit;
      case 'ORGANIZATION_MEMBER_ACCOUNT':
        return DescribePortfolioShareType.organizationMemberAccount;
    }
    throw Exception('$this is not known in enum DescribePortfolioShareType');
  }
}

class DescribePortfolioSharesOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Summaries about each of the portfolio shares.
  final List<PortfolioShareDetail>? portfolioShareDetails;

  DescribePortfolioSharesOutput({
    this.nextPageToken,
    this.portfolioShareDetails,
  });

  factory DescribePortfolioSharesOutput.fromJson(Map<String, dynamic> json) {
    return DescribePortfolioSharesOutput(
      nextPageToken: json['NextPageToken'] as String?,
      portfolioShareDetails: (json['PortfolioShareDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PortfolioShareDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final portfolioShareDetails = this.portfolioShareDetails;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (portfolioShareDetails != null)
        'PortfolioShareDetails': portfolioShareDetails,
    };
  }
}

class DescribeProductAsAdminOutput {
  /// Information about the associated budgets.
  final List<BudgetDetail>? budgets;

  /// Information about the product view.
  final ProductViewDetail? productViewDetail;

  /// Information about the provisioning artifacts (also known as versions) for
  /// the specified product.
  final List<ProvisioningArtifactSummary>? provisioningArtifactSummaries;

  /// Information about the TagOptions associated with the product.
  final List<TagOptionDetail>? tagOptions;

  /// Information about the tags associated with the product.
  final List<Tag>? tags;

  DescribeProductAsAdminOutput({
    this.budgets,
    this.productViewDetail,
    this.provisioningArtifactSummaries,
    this.tagOptions,
    this.tags,
  });

  factory DescribeProductAsAdminOutput.fromJson(Map<String, dynamic> json) {
    return DescribeProductAsAdminOutput(
      budgets: (json['Budgets'] as List?)
          ?.whereNotNull()
          .map((e) => BudgetDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      productViewDetail: json['ProductViewDetail'] != null
          ? ProductViewDetail.fromJson(
              json['ProductViewDetail'] as Map<String, dynamic>)
          : null,
      provisioningArtifactSummaries: (json['ProvisioningArtifactSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisioningArtifactSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagOptions: (json['TagOptions'] as List?)
          ?.whereNotNull()
          .map((e) => TagOptionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final budgets = this.budgets;
    final productViewDetail = this.productViewDetail;
    final provisioningArtifactSummaries = this.provisioningArtifactSummaries;
    final tagOptions = this.tagOptions;
    final tags = this.tags;
    return {
      if (budgets != null) 'Budgets': budgets,
      if (productViewDetail != null) 'ProductViewDetail': productViewDetail,
      if (provisioningArtifactSummaries != null)
        'ProvisioningArtifactSummaries': provisioningArtifactSummaries,
      if (tagOptions != null) 'TagOptions': tagOptions,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeProductOutput {
  /// Information about the associated budgets.
  final List<BudgetDetail>? budgets;

  /// Information about the associated launch paths.
  final List<LaunchPath>? launchPaths;

  /// Summary information about the product view.
  final ProductViewSummary? productViewSummary;

  /// Information about the provisioning artifacts for the specified product.
  final List<ProvisioningArtifact>? provisioningArtifacts;

  DescribeProductOutput({
    this.budgets,
    this.launchPaths,
    this.productViewSummary,
    this.provisioningArtifacts,
  });

  factory DescribeProductOutput.fromJson(Map<String, dynamic> json) {
    return DescribeProductOutput(
      budgets: (json['Budgets'] as List?)
          ?.whereNotNull()
          .map((e) => BudgetDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      launchPaths: (json['LaunchPaths'] as List?)
          ?.whereNotNull()
          .map((e) => LaunchPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      productViewSummary: json['ProductViewSummary'] != null
          ? ProductViewSummary.fromJson(
              json['ProductViewSummary'] as Map<String, dynamic>)
          : null,
      provisioningArtifacts: (json['ProvisioningArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => ProvisioningArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final budgets = this.budgets;
    final launchPaths = this.launchPaths;
    final productViewSummary = this.productViewSummary;
    final provisioningArtifacts = this.provisioningArtifacts;
    return {
      if (budgets != null) 'Budgets': budgets,
      if (launchPaths != null) 'LaunchPaths': launchPaths,
      if (productViewSummary != null) 'ProductViewSummary': productViewSummary,
      if (provisioningArtifacts != null)
        'ProvisioningArtifacts': provisioningArtifacts,
    };
  }
}

class DescribeProductViewOutput {
  /// Summary information about the product.
  final ProductViewSummary? productViewSummary;

  /// Information about the provisioning artifacts for the product.
  final List<ProvisioningArtifact>? provisioningArtifacts;

  DescribeProductViewOutput({
    this.productViewSummary,
    this.provisioningArtifacts,
  });

  factory DescribeProductViewOutput.fromJson(Map<String, dynamic> json) {
    return DescribeProductViewOutput(
      productViewSummary: json['ProductViewSummary'] != null
          ? ProductViewSummary.fromJson(
              json['ProductViewSummary'] as Map<String, dynamic>)
          : null,
      provisioningArtifacts: (json['ProvisioningArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => ProvisioningArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final productViewSummary = this.productViewSummary;
    final provisioningArtifacts = this.provisioningArtifacts;
    return {
      if (productViewSummary != null) 'ProductViewSummary': productViewSummary,
      if (provisioningArtifacts != null)
        'ProvisioningArtifacts': provisioningArtifacts,
    };
  }
}

class DescribeProvisionedProductOutput {
  /// Any CloudWatch dashboards that were created when provisioning the product.
  final List<CloudWatchDashboard>? cloudWatchDashboards;

  /// Information about the provisioned product.
  final ProvisionedProductDetail? provisionedProductDetail;

  DescribeProvisionedProductOutput({
    this.cloudWatchDashboards,
    this.provisionedProductDetail,
  });

  factory DescribeProvisionedProductOutput.fromJson(Map<String, dynamic> json) {
    return DescribeProvisionedProductOutput(
      cloudWatchDashboards: (json['CloudWatchDashboards'] as List?)
          ?.whereNotNull()
          .map((e) => CloudWatchDashboard.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisionedProductDetail: json['ProvisionedProductDetail'] != null
          ? ProvisionedProductDetail.fromJson(
              json['ProvisionedProductDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchDashboards = this.cloudWatchDashboards;
    final provisionedProductDetail = this.provisionedProductDetail;
    return {
      if (cloudWatchDashboards != null)
        'CloudWatchDashboards': cloudWatchDashboards,
      if (provisionedProductDetail != null)
        'ProvisionedProductDetail': provisionedProductDetail,
    };
  }
}

class DescribeProvisionedProductPlanOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the plan.
  final ProvisionedProductPlanDetails? provisionedProductPlanDetails;

  /// Information about the resource changes that will occur when the plan is
  /// executed.
  final List<ResourceChange>? resourceChanges;

  DescribeProvisionedProductPlanOutput({
    this.nextPageToken,
    this.provisionedProductPlanDetails,
    this.resourceChanges,
  });

  factory DescribeProvisionedProductPlanOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeProvisionedProductPlanOutput(
      nextPageToken: json['NextPageToken'] as String?,
      provisionedProductPlanDetails:
          json['ProvisionedProductPlanDetails'] != null
              ? ProvisionedProductPlanDetails.fromJson(
                  json['ProvisionedProductPlanDetails'] as Map<String, dynamic>)
              : null,
      resourceChanges: (json['ResourceChanges'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceChange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final provisionedProductPlanDetails = this.provisionedProductPlanDetails;
    final resourceChanges = this.resourceChanges;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (provisionedProductPlanDetails != null)
        'ProvisionedProductPlanDetails': provisionedProductPlanDetails,
      if (resourceChanges != null) 'ResourceChanges': resourceChanges,
    };
  }
}

class DescribeProvisioningArtifactOutput {
  /// The URL of the CloudFormation template in Amazon S3 or GitHub in JSON
  /// format.
  final Map<String, String>? info;

  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail? provisioningArtifactDetail;

  /// Information about the parameters used to provision the product.
  final List<ProvisioningArtifactParameter>? provisioningArtifactParameters;

  /// The status of the current request.
  final Status? status;

  DescribeProvisioningArtifactOutput({
    this.info,
    this.provisioningArtifactDetail,
    this.provisioningArtifactParameters,
    this.status,
  });

  factory DescribeProvisioningArtifactOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeProvisioningArtifactOutput(
      info: (json['Info'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      provisioningArtifactDetail: json['ProvisioningArtifactDetail'] != null
          ? ProvisioningArtifactDetail.fromJson(
              json['ProvisioningArtifactDetail'] as Map<String, dynamic>)
          : null,
      provisioningArtifactParameters: (json['ProvisioningArtifactParameters']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisioningArtifactParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final info = this.info;
    final provisioningArtifactDetail = this.provisioningArtifactDetail;
    final provisioningArtifactParameters = this.provisioningArtifactParameters;
    final status = this.status;
    return {
      if (info != null) 'Info': info,
      if (provisioningArtifactDetail != null)
        'ProvisioningArtifactDetail': provisioningArtifactDetail,
      if (provisioningArtifactParameters != null)
        'ProvisioningArtifactParameters': provisioningArtifactParameters,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeProvisioningParametersOutput {
  /// Information about the constraints used to provision the product.
  final List<ConstraintSummary>? constraintSummaries;

  /// A list of the keys and descriptions of the outputs. These outputs can be
  /// referenced from a provisioned product launched from this provisioning
  /// artifact.
  final List<ProvisioningArtifactOutput>? provisioningArtifactOutputKeys;

  /// The output of the provisioning artifact.
  final List<ProvisioningArtifactOutput>? provisioningArtifactOutputs;

  /// Information about the parameters used to provision the product.
  final List<ProvisioningArtifactParameter>? provisioningArtifactParameters;

  /// An object that contains information about preferences, such as Regions and
  /// accounts, for the provisioning artifact.
  final ProvisioningArtifactPreferences? provisioningArtifactPreferences;

  /// Information about the TagOptions associated with the resource.
  final List<TagOptionSummary>? tagOptions;

  /// Any additional metadata specifically related to the provisioning of the
  /// product. For example, see the <code>Version</code> field of the
  /// CloudFormation template.
  final List<UsageInstruction>? usageInstructions;

  DescribeProvisioningParametersOutput({
    this.constraintSummaries,
    this.provisioningArtifactOutputKeys,
    this.provisioningArtifactOutputs,
    this.provisioningArtifactParameters,
    this.provisioningArtifactPreferences,
    this.tagOptions,
    this.usageInstructions,
  });

  factory DescribeProvisioningParametersOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeProvisioningParametersOutput(
      constraintSummaries: (json['ConstraintSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ConstraintSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisioningArtifactOutputKeys: (json['ProvisioningArtifactOutputKeys']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisioningArtifactOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisioningArtifactOutputs: (json['ProvisioningArtifactOutputs']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisioningArtifactOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisioningArtifactParameters: (json['ProvisioningArtifactParameters']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisioningArtifactParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisioningArtifactPreferences:
          json['ProvisioningArtifactPreferences'] != null
              ? ProvisioningArtifactPreferences.fromJson(
                  json['ProvisioningArtifactPreferences']
                      as Map<String, dynamic>)
              : null,
      tagOptions: (json['TagOptions'] as List?)
          ?.whereNotNull()
          .map((e) => TagOptionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageInstructions: (json['UsageInstructions'] as List?)
          ?.whereNotNull()
          .map((e) => UsageInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final constraintSummaries = this.constraintSummaries;
    final provisioningArtifactOutputKeys = this.provisioningArtifactOutputKeys;
    final provisioningArtifactOutputs = this.provisioningArtifactOutputs;
    final provisioningArtifactParameters = this.provisioningArtifactParameters;
    final provisioningArtifactPreferences =
        this.provisioningArtifactPreferences;
    final tagOptions = this.tagOptions;
    final usageInstructions = this.usageInstructions;
    return {
      if (constraintSummaries != null)
        'ConstraintSummaries': constraintSummaries,
      if (provisioningArtifactOutputKeys != null)
        'ProvisioningArtifactOutputKeys': provisioningArtifactOutputKeys,
      if (provisioningArtifactOutputs != null)
        'ProvisioningArtifactOutputs': provisioningArtifactOutputs,
      if (provisioningArtifactParameters != null)
        'ProvisioningArtifactParameters': provisioningArtifactParameters,
      if (provisioningArtifactPreferences != null)
        'ProvisioningArtifactPreferences': provisioningArtifactPreferences,
      if (tagOptions != null) 'TagOptions': tagOptions,
      if (usageInstructions != null) 'UsageInstructions': usageInstructions,
    };
  }
}

class DescribeRecordOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the product.
  final RecordDetail? recordDetail;

  /// Information about the product created as the result of a request. For
  /// example, the output for a CloudFormation-backed product that creates an S3
  /// bucket would include the S3 bucket URL.
  final List<RecordOutput>? recordOutputs;

  DescribeRecordOutput({
    this.nextPageToken,
    this.recordDetail,
    this.recordOutputs,
  });

  factory DescribeRecordOutput.fromJson(Map<String, dynamic> json) {
    return DescribeRecordOutput(
      nextPageToken: json['NextPageToken'] as String?,
      recordDetail: json['RecordDetail'] != null
          ? RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>)
          : null,
      recordOutputs: (json['RecordOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => RecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final recordDetail = this.recordDetail;
    final recordOutputs = this.recordOutputs;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (recordDetail != null) 'RecordDetail': recordDetail,
      if (recordOutputs != null) 'RecordOutputs': recordOutputs,
    };
  }
}

class DescribeServiceActionExecutionParametersOutput {
  /// The parameters of the self-service action.
  final List<ExecutionParameter>? serviceActionParameters;

  DescribeServiceActionExecutionParametersOutput({
    this.serviceActionParameters,
  });

  factory DescribeServiceActionExecutionParametersOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeServiceActionExecutionParametersOutput(
      serviceActionParameters: (json['ServiceActionParameters'] as List?)
          ?.whereNotNull()
          .map((e) => ExecutionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceActionParameters = this.serviceActionParameters;
    return {
      if (serviceActionParameters != null)
        'ServiceActionParameters': serviceActionParameters,
    };
  }
}

class DescribeServiceActionOutput {
  /// Detailed information about the self-service action.
  final ServiceActionDetail? serviceActionDetail;

  DescribeServiceActionOutput({
    this.serviceActionDetail,
  });

  factory DescribeServiceActionOutput.fromJson(Map<String, dynamic> json) {
    return DescribeServiceActionOutput(
      serviceActionDetail: json['ServiceActionDetail'] != null
          ? ServiceActionDetail.fromJson(
              json['ServiceActionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceActionDetail = this.serviceActionDetail;
    return {
      if (serviceActionDetail != null)
        'ServiceActionDetail': serviceActionDetail,
    };
  }
}

class DescribeTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail? tagOptionDetail;

  DescribeTagOptionOutput({
    this.tagOptionDetail,
  });

  factory DescribeTagOptionOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTagOptionOutput(
      tagOptionDetail: json['TagOptionDetail'] != null
          ? TagOptionDetail.fromJson(
              json['TagOptionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tagOptionDetail = this.tagOptionDetail;
    return {
      if (tagOptionDetail != null) 'TagOptionDetail': tagOptionDetail,
    };
  }
}

class DisableAWSOrganizationsAccessOutput {
  DisableAWSOrganizationsAccessOutput();

  factory DisableAWSOrganizationsAccessOutput.fromJson(Map<String, dynamic> _) {
    return DisableAWSOrganizationsAccessOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateBudgetFromResourceOutput {
  DisassociateBudgetFromResourceOutput();

  factory DisassociateBudgetFromResourceOutput.fromJson(
      Map<String, dynamic> _) {
    return DisassociateBudgetFromResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociatePrincipalFromPortfolioOutput {
  DisassociatePrincipalFromPortfolioOutput();

  factory DisassociatePrincipalFromPortfolioOutput.fromJson(
      Map<String, dynamic> _) {
    return DisassociatePrincipalFromPortfolioOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateProductFromPortfolioOutput {
  DisassociateProductFromPortfolioOutput();

  factory DisassociateProductFromPortfolioOutput.fromJson(
      Map<String, dynamic> _) {
    return DisassociateProductFromPortfolioOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateServiceActionFromProvisioningArtifactOutput {
  DisassociateServiceActionFromProvisioningArtifactOutput();

  factory DisassociateServiceActionFromProvisioningArtifactOutput.fromJson(
      Map<String, dynamic> _) {
    return DisassociateServiceActionFromProvisioningArtifactOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateTagOptionFromResourceOutput {
  DisassociateTagOptionFromResourceOutput();

  factory DisassociateTagOptionFromResourceOutput.fromJson(
      Map<String, dynamic> _) {
    return DisassociateTagOptionFromResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EnableAWSOrganizationsAccessOutput {
  EnableAWSOrganizationsAccessOutput();

  factory EnableAWSOrganizationsAccessOutput.fromJson(Map<String, dynamic> _) {
    return EnableAWSOrganizationsAccessOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The ID for the provisioned product resources that are part of a resource
/// group.
class EngineWorkflowResourceIdentifier {
  /// The unique key-value pair for a tag that identifies provisioned product
  /// resources.
  final UniqueTagResourceIdentifier? uniqueTag;

  EngineWorkflowResourceIdentifier({
    this.uniqueTag,
  });

  Map<String, dynamic> toJson() {
    final uniqueTag = this.uniqueTag;
    return {
      if (uniqueTag != null) 'UniqueTag': uniqueTag,
    };
  }
}

enum EngineWorkflowStatus {
  succeeded,
  failed,
}

extension EngineWorkflowStatusValueExtension on EngineWorkflowStatus {
  String toValue() {
    switch (this) {
      case EngineWorkflowStatus.succeeded:
        return 'SUCCEEDED';
      case EngineWorkflowStatus.failed:
        return 'FAILED';
    }
  }
}

extension EngineWorkflowStatusFromString on String {
  EngineWorkflowStatus toEngineWorkflowStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return EngineWorkflowStatus.succeeded;
      case 'FAILED':
        return EngineWorkflowStatus.failed;
    }
    throw Exception('$this is not known in enum EngineWorkflowStatus');
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
        return 'STATIC';
      case EvaluationType.$dynamic:
        return 'DYNAMIC';
    }
  }
}

extension EvaluationTypeFromString on String {
  EvaluationType toEvaluationType() {
    switch (this) {
      case 'STATIC':
        return EvaluationType.static;
      case 'DYNAMIC':
        return EvaluationType.$dynamic;
    }
    throw Exception('$this is not known in enum EvaluationType');
  }
}

class ExecuteProvisionedProductPlanOutput {
  /// Information about the result of provisioning the product.
  final RecordDetail? recordDetail;

  ExecuteProvisionedProductPlanOutput({
    this.recordDetail,
  });

  factory ExecuteProvisionedProductPlanOutput.fromJson(
      Map<String, dynamic> json) {
    return ExecuteProvisionedProductPlanOutput(
      recordDetail: json['RecordDetail'] != null
          ? RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordDetail = this.recordDetail;
    return {
      if (recordDetail != null) 'RecordDetail': recordDetail,
    };
  }
}

class ExecuteProvisionedProductServiceActionOutput {
  /// An object containing detailed information about the result of provisioning
  /// the product.
  final RecordDetail? recordDetail;

  ExecuteProvisionedProductServiceActionOutput({
    this.recordDetail,
  });

  factory ExecuteProvisionedProductServiceActionOutput.fromJson(
      Map<String, dynamic> json) {
    return ExecuteProvisionedProductServiceActionOutput(
      recordDetail: json['RecordDetail'] != null
          ? RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordDetail = this.recordDetail;
    return {
      if (recordDetail != null) 'RecordDetail': recordDetail,
    };
  }
}

/// Details of an execution parameter value that is passed to a self-service
/// action when executed on a provisioned product.
class ExecutionParameter {
  /// The default values for the execution parameter.
  final List<String>? defaultValues;

  /// The name of the execution parameter.
  final String? name;

  /// The execution parameter type.
  final String? type;

  ExecutionParameter({
    this.defaultValues,
    this.name,
    this.type,
  });

  factory ExecutionParameter.fromJson(Map<String, dynamic> json) {
    return ExecutionParameter(
      defaultValues: (json['DefaultValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValues = this.defaultValues;
    final name = this.name;
    final type = this.type;
    return {
      if (defaultValues != null) 'DefaultValues': defaultValues,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

/// An object containing information about the error, along with identifying
/// information about the self-service action and its associations.
class FailedServiceActionAssociation {
  /// The error code. Valid values are listed below.
  final ServiceActionAssociationErrorCode? errorCode;

  /// A text description of the error.
  final String? errorMessage;

  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  final String? productId;

  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  final String? provisioningArtifactId;

  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  final String? serviceActionId;

  FailedServiceActionAssociation({
    this.errorCode,
    this.errorMessage,
    this.productId,
    this.provisioningArtifactId,
    this.serviceActionId,
  });

  factory FailedServiceActionAssociation.fromJson(Map<String, dynamic> json) {
    return FailedServiceActionAssociation(
      errorCode:
          (json['ErrorCode'] as String?)?.toServiceActionAssociationErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      productId: json['ProductId'] as String?,
      provisioningArtifactId: json['ProvisioningArtifactId'] as String?,
      serviceActionId: json['ServiceActionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final productId = this.productId;
    final provisioningArtifactId = this.provisioningArtifactId;
    final serviceActionId = this.serviceActionId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (productId != null) 'ProductId': productId,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
      if (serviceActionId != null) 'ServiceActionId': serviceActionId,
    };
  }
}

class GetAWSOrganizationsAccessStatusOutput {
  /// The status of the portfolio share feature.
  final AccessStatus? accessStatus;

  GetAWSOrganizationsAccessStatusOutput({
    this.accessStatus,
  });

  factory GetAWSOrganizationsAccessStatusOutput.fromJson(
      Map<String, dynamic> json) {
    return GetAWSOrganizationsAccessStatusOutput(
      accessStatus: (json['AccessStatus'] as String?)?.toAccessStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessStatus = this.accessStatus;
    return {
      if (accessStatus != null) 'AccessStatus': accessStatus.toValue(),
    };
  }
}

class GetProvisionedProductOutputsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the product created as the result of a request. For
  /// example, the output for a CloudFormation-backed product that creates an S3
  /// bucket would include the S3 bucket URL.
  final List<RecordOutput>? outputs;

  GetProvisionedProductOutputsOutput({
    this.nextPageToken,
    this.outputs,
  });

  factory GetProvisionedProductOutputsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetProvisionedProductOutputsOutput(
      nextPageToken: json['NextPageToken'] as String?,
      outputs: (json['Outputs'] as List?)
          ?.whereNotNull()
          .map((e) => RecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final outputs = this.outputs;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (outputs != null) 'Outputs': outputs,
    };
  }
}

class ImportAsProvisionedProductOutput {
  final RecordDetail? recordDetail;

  ImportAsProvisionedProductOutput({
    this.recordDetail,
  });

  factory ImportAsProvisionedProductOutput.fromJson(Map<String, dynamic> json) {
    return ImportAsProvisionedProductOutput(
      recordDetail: json['RecordDetail'] != null
          ? RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordDetail = this.recordDetail;
    return {
      if (recordDetail != null) 'RecordDetail': recordDetail,
    };
  }
}

/// Provides details about the product's connection sync and contains the
/// following sub-fields.
///
/// <ul>
/// <li>
/// <code>LastSyncTime</code>
/// </li>
/// <li>
/// <code>LastSyncStatus</code>
/// </li>
/// <li>
/// <code>LastSyncStatusMessage</code>
/// </li>
/// <li>
/// <code>LastSuccessfulSyncTime</code>
/// </li>
/// <li>
/// <code>LastSuccessfulSyncProvisioningArtifactID</code>
/// </li>
/// </ul>
class LastSync {
  /// The ProvisioningArtifactID of the ProvisioningArtifact created from the
  /// latest successful sync.
  final String? lastSuccessfulSyncProvisioningArtifactId;

  /// The time of the latest successful sync from the source repo artifact to the
  /// Service Catalog product.
  final DateTime? lastSuccessfulSyncTime;

  /// The current status of the sync. Responses include <code>SUCCEEDED</code> or
  /// <code>FAILED</code>.
  final LastSyncStatus? lastSyncStatus;

  /// The sync's status message.
  final String? lastSyncStatusMessage;

  /// The time of the last attempted sync from the repository to the Service
  /// Catalog product.
  final DateTime? lastSyncTime;

  LastSync({
    this.lastSuccessfulSyncProvisioningArtifactId,
    this.lastSuccessfulSyncTime,
    this.lastSyncStatus,
    this.lastSyncStatusMessage,
    this.lastSyncTime,
  });

  factory LastSync.fromJson(Map<String, dynamic> json) {
    return LastSync(
      lastSuccessfulSyncProvisioningArtifactId:
          json['LastSuccessfulSyncProvisioningArtifactId'] as String?,
      lastSuccessfulSyncTime: timeStampFromJson(json['LastSuccessfulSyncTime']),
      lastSyncStatus: (json['LastSyncStatus'] as String?)?.toLastSyncStatus(),
      lastSyncStatusMessage: json['LastSyncStatusMessage'] as String?,
      lastSyncTime: timeStampFromJson(json['LastSyncTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final lastSuccessfulSyncProvisioningArtifactId =
        this.lastSuccessfulSyncProvisioningArtifactId;
    final lastSuccessfulSyncTime = this.lastSuccessfulSyncTime;
    final lastSyncStatus = this.lastSyncStatus;
    final lastSyncStatusMessage = this.lastSyncStatusMessage;
    final lastSyncTime = this.lastSyncTime;
    return {
      if (lastSuccessfulSyncProvisioningArtifactId != null)
        'LastSuccessfulSyncProvisioningArtifactId':
            lastSuccessfulSyncProvisioningArtifactId,
      if (lastSuccessfulSyncTime != null)
        'LastSuccessfulSyncTime': unixTimestampToJson(lastSuccessfulSyncTime),
      if (lastSyncStatus != null) 'LastSyncStatus': lastSyncStatus.toValue(),
      if (lastSyncStatusMessage != null)
        'LastSyncStatusMessage': lastSyncStatusMessage,
      if (lastSyncTime != null)
        'LastSyncTime': unixTimestampToJson(lastSyncTime),
    };
  }
}

enum LastSyncStatus {
  succeeded,
  failed,
}

extension LastSyncStatusValueExtension on LastSyncStatus {
  String toValue() {
    switch (this) {
      case LastSyncStatus.succeeded:
        return 'SUCCEEDED';
      case LastSyncStatus.failed:
        return 'FAILED';
    }
  }
}

extension LastSyncStatusFromString on String {
  LastSyncStatus toLastSyncStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return LastSyncStatus.succeeded;
      case 'FAILED':
        return LastSyncStatus.failed;
    }
    throw Exception('$this is not known in enum LastSyncStatus');
  }
}

/// A launch path object.
class LaunchPath {
  /// The identifier of the launch path.
  final String? id;

  /// The name of the launch path.
  final String? name;

  LaunchPath({
    this.id,
    this.name,
  });

  factory LaunchPath.fromJson(Map<String, dynamic> json) {
    return LaunchPath(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Summary information about a product path for a user.
class LaunchPathSummary {
  /// The constraints on the portfolio-product relationship.
  final List<ConstraintSummary>? constraintSummaries;

  /// The identifier of the product path.
  final String? id;

  /// The name of the portfolio that contains the product.
  final String? name;

  /// The tags associated with this product path.
  final List<Tag>? tags;

  LaunchPathSummary({
    this.constraintSummaries,
    this.id,
    this.name,
    this.tags,
  });

  factory LaunchPathSummary.fromJson(Map<String, dynamic> json) {
    return LaunchPathSummary(
      constraintSummaries: (json['ConstraintSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ConstraintSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final constraintSummaries = this.constraintSummaries;
    final id = this.id;
    final name = this.name;
    final tags = this.tags;
    return {
      if (constraintSummaries != null)
        'ConstraintSummaries': constraintSummaries,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListAcceptedPortfolioSharesOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the portfolios.
  final List<PortfolioDetail>? portfolioDetails;

  ListAcceptedPortfolioSharesOutput({
    this.nextPageToken,
    this.portfolioDetails,
  });

  factory ListAcceptedPortfolioSharesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListAcceptedPortfolioSharesOutput(
      nextPageToken: json['NextPageToken'] as String?,
      portfolioDetails: (json['PortfolioDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PortfolioDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final portfolioDetails = this.portfolioDetails;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (portfolioDetails != null) 'PortfolioDetails': portfolioDetails,
    };
  }
}

class ListBudgetsForResourceOutput {
  /// Information about the associated budgets.
  final List<BudgetDetail>? budgets;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  ListBudgetsForResourceOutput({
    this.budgets,
    this.nextPageToken,
  });

  factory ListBudgetsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListBudgetsForResourceOutput(
      budgets: (json['Budgets'] as List?)
          ?.whereNotNull()
          .map((e) => BudgetDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgets = this.budgets;
    final nextPageToken = this.nextPageToken;
    return {
      if (budgets != null) 'Budgets': budgets,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class ListConstraintsForPortfolioOutput {
  /// Information about the constraints.
  final List<ConstraintDetail>? constraintDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  ListConstraintsForPortfolioOutput({
    this.constraintDetails,
    this.nextPageToken,
  });

  factory ListConstraintsForPortfolioOutput.fromJson(
      Map<String, dynamic> json) {
    return ListConstraintsForPortfolioOutput(
      constraintDetails: (json['ConstraintDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ConstraintDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final constraintDetails = this.constraintDetails;
    final nextPageToken = this.nextPageToken;
    return {
      if (constraintDetails != null) 'ConstraintDetails': constraintDetails,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class ListLaunchPathsOutput {
  /// Information about the launch path.
  final List<LaunchPathSummary>? launchPathSummaries;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  ListLaunchPathsOutput({
    this.launchPathSummaries,
    this.nextPageToken,
  });

  factory ListLaunchPathsOutput.fromJson(Map<String, dynamic> json) {
    return ListLaunchPathsOutput(
      launchPathSummaries: (json['LaunchPathSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LaunchPathSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchPathSummaries = this.launchPathSummaries;
    final nextPageToken = this.nextPageToken;
    return {
      if (launchPathSummaries != null)
        'LaunchPathSummaries': launchPathSummaries,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class ListOrganizationPortfolioAccessOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Displays information about the organization nodes.
  final List<OrganizationNode>? organizationNodes;

  ListOrganizationPortfolioAccessOutput({
    this.nextPageToken,
    this.organizationNodes,
  });

  factory ListOrganizationPortfolioAccessOutput.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationPortfolioAccessOutput(
      nextPageToken: json['NextPageToken'] as String?,
      organizationNodes: (json['OrganizationNodes'] as List?)
          ?.whereNotNull()
          .map((e) => OrganizationNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final organizationNodes = this.organizationNodes;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (organizationNodes != null) 'OrganizationNodes': organizationNodes,
    };
  }
}

class ListPortfolioAccessOutput {
  /// Information about the Amazon Web Services accounts with access to the
  /// portfolio.
  final List<String>? accountIds;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  ListPortfolioAccessOutput({
    this.accountIds,
    this.nextPageToken,
  });

  factory ListPortfolioAccessOutput.fromJson(Map<String, dynamic> json) {
    return ListPortfolioAccessOutput(
      accountIds: (json['AccountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final nextPageToken = this.nextPageToken;
    return {
      if (accountIds != null) 'AccountIds': accountIds,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class ListPortfoliosForProductOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the portfolios.
  final List<PortfolioDetail>? portfolioDetails;

  ListPortfoliosForProductOutput({
    this.nextPageToken,
    this.portfolioDetails,
  });

  factory ListPortfoliosForProductOutput.fromJson(Map<String, dynamic> json) {
    return ListPortfoliosForProductOutput(
      nextPageToken: json['NextPageToken'] as String?,
      portfolioDetails: (json['PortfolioDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PortfolioDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final portfolioDetails = this.portfolioDetails;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (portfolioDetails != null) 'PortfolioDetails': portfolioDetails,
    };
  }
}

class ListPortfoliosOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the portfolios.
  final List<PortfolioDetail>? portfolioDetails;

  ListPortfoliosOutput({
    this.nextPageToken,
    this.portfolioDetails,
  });

  factory ListPortfoliosOutput.fromJson(Map<String, dynamic> json) {
    return ListPortfoliosOutput(
      nextPageToken: json['NextPageToken'] as String?,
      portfolioDetails: (json['PortfolioDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PortfolioDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final portfolioDetails = this.portfolioDetails;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (portfolioDetails != null) 'PortfolioDetails': portfolioDetails,
    };
  }
}

class ListPrincipalsForPortfolioOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// The <code>PrincipalARN</code>s and corresponding <code>PrincipalType</code>s
  /// associated with the portfolio.
  final List<Principal>? principals;

  ListPrincipalsForPortfolioOutput({
    this.nextPageToken,
    this.principals,
  });

  factory ListPrincipalsForPortfolioOutput.fromJson(Map<String, dynamic> json) {
    return ListPrincipalsForPortfolioOutput(
      nextPageToken: json['NextPageToken'] as String?,
      principals: (json['Principals'] as List?)
          ?.whereNotNull()
          .map((e) => Principal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final principals = this.principals;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (principals != null) 'Principals': principals,
    };
  }
}

class ListProvisionedProductPlansOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the plans.
  final List<ProvisionedProductPlanSummary>? provisionedProductPlans;

  ListProvisionedProductPlansOutput({
    this.nextPageToken,
    this.provisionedProductPlans,
  });

  factory ListProvisionedProductPlansOutput.fromJson(
      Map<String, dynamic> json) {
    return ListProvisionedProductPlansOutput(
      nextPageToken: json['NextPageToken'] as String?,
      provisionedProductPlans: (json['ProvisionedProductPlans'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisionedProductPlanSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final provisionedProductPlans = this.provisionedProductPlans;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (provisionedProductPlans != null)
        'ProvisionedProductPlans': provisionedProductPlans,
    };
  }
}

class ListProvisioningArtifactsForServiceActionOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// An array of objects with information about product views and provisioning
  /// artifacts.
  final List<ProvisioningArtifactView>? provisioningArtifactViews;

  ListProvisioningArtifactsForServiceActionOutput({
    this.nextPageToken,
    this.provisioningArtifactViews,
  });

  factory ListProvisioningArtifactsForServiceActionOutput.fromJson(
      Map<String, dynamic> json) {
    return ListProvisioningArtifactsForServiceActionOutput(
      nextPageToken: json['NextPageToken'] as String?,
      provisioningArtifactViews: (json['ProvisioningArtifactViews'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisioningArtifactView.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final provisioningArtifactViews = this.provisioningArtifactViews;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (provisioningArtifactViews != null)
        'ProvisioningArtifactViews': provisioningArtifactViews,
    };
  }
}

class ListProvisioningArtifactsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the provisioning artifacts.
  final List<ProvisioningArtifactDetail>? provisioningArtifactDetails;

  ListProvisioningArtifactsOutput({
    this.nextPageToken,
    this.provisioningArtifactDetails,
  });

  factory ListProvisioningArtifactsOutput.fromJson(Map<String, dynamic> json) {
    return ListProvisioningArtifactsOutput(
      nextPageToken: json['NextPageToken'] as String?,
      provisioningArtifactDetails: (json['ProvisioningArtifactDetails']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisioningArtifactDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final provisioningArtifactDetails = this.provisioningArtifactDetails;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (provisioningArtifactDetails != null)
        'ProvisioningArtifactDetails': provisioningArtifactDetails,
    };
  }
}

class ListRecordHistoryOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// The records, in reverse chronological order.
  final List<RecordDetail>? recordDetails;

  ListRecordHistoryOutput({
    this.nextPageToken,
    this.recordDetails,
  });

  factory ListRecordHistoryOutput.fromJson(Map<String, dynamic> json) {
    return ListRecordHistoryOutput(
      nextPageToken: json['NextPageToken'] as String?,
      recordDetails: (json['RecordDetails'] as List?)
          ?.whereNotNull()
          .map((e) => RecordDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final recordDetails = this.recordDetails;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (recordDetails != null) 'RecordDetails': recordDetails,
    };
  }
}

/// The search filter to use when listing history records.
class ListRecordHistorySearchFilter {
  /// The filter key.
  ///
  /// <ul>
  /// <li>
  /// <code>product</code> - Filter results based on the specified product
  /// identifier.
  /// </li>
  /// <li>
  /// <code>provisionedproduct</code> - Filter results based on the provisioned
  /// product identifier.
  /// </li>
  /// </ul>
  final String? key;

  /// The filter value.
  final String? value;

  ListRecordHistorySearchFilter({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class ListResourcesForTagOptionOutput {
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  final String? pageToken;

  /// Information about the resources.
  final List<ResourceDetail>? resourceDetails;

  ListResourcesForTagOptionOutput({
    this.pageToken,
    this.resourceDetails,
  });

  factory ListResourcesForTagOptionOutput.fromJson(Map<String, dynamic> json) {
    return ListResourcesForTagOptionOutput(
      pageToken: json['PageToken'] as String?,
      resourceDetails: (json['ResourceDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pageToken = this.pageToken;
    final resourceDetails = this.resourceDetails;
    return {
      if (pageToken != null) 'PageToken': pageToken,
      if (resourceDetails != null) 'ResourceDetails': resourceDetails,
    };
  }
}

class ListServiceActionsForProvisioningArtifactOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// An object containing information about the self-service actions associated
  /// with the provisioning artifact.
  final List<ServiceActionSummary>? serviceActionSummaries;

  ListServiceActionsForProvisioningArtifactOutput({
    this.nextPageToken,
    this.serviceActionSummaries,
  });

  factory ListServiceActionsForProvisioningArtifactOutput.fromJson(
      Map<String, dynamic> json) {
    return ListServiceActionsForProvisioningArtifactOutput(
      nextPageToken: json['NextPageToken'] as String?,
      serviceActionSummaries: (json['ServiceActionSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final serviceActionSummaries = this.serviceActionSummaries;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (serviceActionSummaries != null)
        'ServiceActionSummaries': serviceActionSummaries,
    };
  }
}

class ListServiceActionsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// An object containing information about the service actions associated with
  /// the provisioning artifact.
  final List<ServiceActionSummary>? serviceActionSummaries;

  ListServiceActionsOutput({
    this.nextPageToken,
    this.serviceActionSummaries,
  });

  factory ListServiceActionsOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceActionsOutput(
      nextPageToken: json['NextPageToken'] as String?,
      serviceActionSummaries: (json['ServiceActionSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final serviceActionSummaries = this.serviceActionSummaries;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (serviceActionSummaries != null)
        'ServiceActionSummaries': serviceActionSummaries,
    };
  }
}

class ListStackInstancesForProvisionedProductOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// List of stack instances.
  final List<StackInstance>? stackInstances;

  ListStackInstancesForProvisionedProductOutput({
    this.nextPageToken,
    this.stackInstances,
  });

  factory ListStackInstancesForProvisionedProductOutput.fromJson(
      Map<String, dynamic> json) {
    return ListStackInstancesForProvisionedProductOutput(
      nextPageToken: json['NextPageToken'] as String?,
      stackInstances: (json['StackInstances'] as List?)
          ?.whereNotNull()
          .map((e) => StackInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final stackInstances = this.stackInstances;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (stackInstances != null) 'StackInstances': stackInstances,
    };
  }
}

/// Filters to use when listing TagOptions.
class ListTagOptionsFilters {
  /// The active state.
  final bool? active;

  /// The TagOption key.
  final String? key;

  /// The TagOption value.
  final String? value;

  ListTagOptionsFilters({
    this.active,
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final active = this.active;
    final key = this.key;
    final value = this.value;
    return {
      if (active != null) 'Active': active,
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class ListTagOptionsOutput {
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  final String? pageToken;

  /// Information about the TagOptions.
  final List<TagOptionDetail>? tagOptionDetails;

  ListTagOptionsOutput({
    this.pageToken,
    this.tagOptionDetails,
  });

  factory ListTagOptionsOutput.fromJson(Map<String, dynamic> json) {
    return ListTagOptionsOutput(
      pageToken: json['PageToken'] as String?,
      tagOptionDetails: (json['TagOptionDetails'] as List?)
          ?.whereNotNull()
          .map((e) => TagOptionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pageToken = this.pageToken;
    final tagOptionDetails = this.tagOptionDetails;
    return {
      if (pageToken != null) 'PageToken': pageToken,
      if (tagOptionDetails != null) 'TagOptionDetails': tagOptionDetails,
    };
  }
}

class NotifyProvisionProductEngineWorkflowResultOutput {
  NotifyProvisionProductEngineWorkflowResultOutput();

  factory NotifyProvisionProductEngineWorkflowResultOutput.fromJson(
      Map<String, dynamic> _) {
    return NotifyProvisionProductEngineWorkflowResultOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class NotifyTerminateProvisionedProductEngineWorkflowResultOutput {
  NotifyTerminateProvisionedProductEngineWorkflowResultOutput();

  factory NotifyTerminateProvisionedProductEngineWorkflowResultOutput.fromJson(
      Map<String, dynamic> _) {
    return NotifyTerminateProvisionedProductEngineWorkflowResultOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class NotifyUpdateProvisionedProductEngineWorkflowResultOutput {
  NotifyUpdateProvisionedProductEngineWorkflowResultOutput();

  factory NotifyUpdateProvisionedProductEngineWorkflowResultOutput.fromJson(
      Map<String, dynamic> _) {
    return NotifyUpdateProvisionedProductEngineWorkflowResultOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about the organization node.
class OrganizationNode {
  /// The organization node type.
  final OrganizationNodeType? type;

  /// The identifier of the organization node.
  final String? value;

  OrganizationNode({
    this.type,
    this.value,
  });

  factory OrganizationNode.fromJson(Map<String, dynamic> json) {
    return OrganizationNode(
      type: (json['Type'] as String?)?.toOrganizationNodeType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'Type': type.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum OrganizationNodeType {
  organization,
  organizationalUnit,
  account,
}

extension OrganizationNodeTypeValueExtension on OrganizationNodeType {
  String toValue() {
    switch (this) {
      case OrganizationNodeType.organization:
        return 'ORGANIZATION';
      case OrganizationNodeType.organizationalUnit:
        return 'ORGANIZATIONAL_UNIT';
      case OrganizationNodeType.account:
        return 'ACCOUNT';
    }
  }
}

extension OrganizationNodeTypeFromString on String {
  OrganizationNodeType toOrganizationNodeType() {
    switch (this) {
      case 'ORGANIZATION':
        return OrganizationNodeType.organization;
      case 'ORGANIZATIONAL_UNIT':
        return OrganizationNodeType.organizationalUnit;
      case 'ACCOUNT':
        return OrganizationNodeType.account;
    }
    throw Exception('$this is not known in enum OrganizationNodeType');
  }
}

/// The constraints that the administrator has put on the parameter.
class ParameterConstraints {
  /// A regular expression that represents the patterns that allow for
  /// <code>String</code> types. The pattern must match the entire parameter value
  /// provided.
  final String? allowedPattern;

  /// The values that the administrator has allowed for the parameter.
  final List<String>? allowedValues;

  /// A string that explains a constraint when the constraint is violated. For
  /// example, without a constraint description, a parameter that has an allowed
  /// pattern of <code>[A-Za-z0-9]+</code> displays the following error message
  /// when the user specifies an invalid value:
  ///
  /// <code>Malformed input-Parameter MyParameter must match pattern
  /// [A-Za-z0-9]+</code>
  ///
  /// By adding a constraint description, such as must only contain letters
  /// (uppercase and lowercase) and numbers, you can display the following
  /// customized error message:
  ///
  /// <code>Malformed input-Parameter MyParameter must only contain uppercase and
  /// lowercase letters and numbers.</code>
  final String? constraintDescription;

  /// An integer value that determines the largest number of characters you want
  /// to allow for <code>String</code> types.
  final String? maxLength;

  /// A numeric value that determines the largest numeric value you want to allow
  /// for <code>Number</code> types.
  final String? maxValue;

  /// An integer value that determines the smallest number of characters you want
  /// to allow for <code>String</code> types.
  final String? minLength;

  /// A numeric value that determines the smallest numeric value you want to allow
  /// for <code>Number</code> types.
  final String? minValue;

  ParameterConstraints({
    this.allowedPattern,
    this.allowedValues,
    this.constraintDescription,
    this.maxLength,
    this.maxValue,
    this.minLength,
    this.minValue,
  });

  factory ParameterConstraints.fromJson(Map<String, dynamic> json) {
    return ParameterConstraints(
      allowedPattern: json['AllowedPattern'] as String?,
      allowedValues: (json['AllowedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      constraintDescription: json['ConstraintDescription'] as String?,
      maxLength: json['MaxLength'] as String?,
      maxValue: json['MaxValue'] as String?,
      minLength: json['MinLength'] as String?,
      minValue: json['MinValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedPattern = this.allowedPattern;
    final allowedValues = this.allowedValues;
    final constraintDescription = this.constraintDescription;
    final maxLength = this.maxLength;
    final maxValue = this.maxValue;
    final minLength = this.minLength;
    final minValue = this.minValue;
    return {
      if (allowedPattern != null) 'AllowedPattern': allowedPattern,
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (constraintDescription != null)
        'ConstraintDescription': constraintDescription,
      if (maxLength != null) 'MaxLength': maxLength,
      if (maxValue != null) 'MaxValue': maxValue,
      if (minLength != null) 'MinLength': minLength,
      if (minValue != null) 'MinValue': minValue,
    };
  }
}

/// Information about a portfolio.
class PortfolioDetail {
  /// The ARN assigned to the portfolio.
  final String? arn;

  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The description of the portfolio.
  final String? description;

  /// The name to use for display purposes.
  final String? displayName;

  /// The portfolio identifier.
  final String? id;

  /// The name of the portfolio provider.
  final String? providerName;

  PortfolioDetail({
    this.arn,
    this.createdTime,
    this.description,
    this.displayName,
    this.id,
    this.providerName,
  });

  factory PortfolioDetail.fromJson(Map<String, dynamic> json) {
    return PortfolioDetail(
      arn: json['ARN'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      id: json['Id'] as String?,
      providerName: json['ProviderName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final displayName = this.displayName;
    final id = this.id;
    final providerName = this.providerName;
    return {
      if (arn != null) 'ARN': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (id != null) 'Id': id,
      if (providerName != null) 'ProviderName': providerName,
    };
  }
}

/// Information about the portfolio share.
class PortfolioShareDetail {
  /// Indicates whether the shared portfolio is imported by the recipient account.
  /// If the recipient is in an organization node, the share is automatically
  /// imported, and the field is always set to true.
  final bool? accepted;

  /// The identifier of the recipient entity that received the portfolio share.
  /// The recipient entity can be one of the following:
  ///
  /// 1. An external account.
  ///
  /// 2. An organziation member account.
  ///
  /// 3. An organzational unit (OU).
  ///
  /// 4. The organization itself. (This shares with every account in the
  /// organization).
  final String? principalId;

  /// Indicates if <code>Principal</code> sharing is enabled or disabled for the
  /// portfolio share.
  final bool? sharePrincipals;

  /// Indicates whether TagOptions sharing is enabled or disabled for the
  /// portfolio share.
  final bool? shareTagOptions;

  /// The type of the portfolio share.
  final DescribePortfolioShareType? type;

  PortfolioShareDetail({
    this.accepted,
    this.principalId,
    this.sharePrincipals,
    this.shareTagOptions,
    this.type,
  });

  factory PortfolioShareDetail.fromJson(Map<String, dynamic> json) {
    return PortfolioShareDetail(
      accepted: json['Accepted'] as bool?,
      principalId: json['PrincipalId'] as String?,
      sharePrincipals: json['SharePrincipals'] as bool?,
      shareTagOptions: json['ShareTagOptions'] as bool?,
      type: (json['Type'] as String?)?.toDescribePortfolioShareType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accepted = this.accepted;
    final principalId = this.principalId;
    final sharePrincipals = this.sharePrincipals;
    final shareTagOptions = this.shareTagOptions;
    final type = this.type;
    return {
      if (accepted != null) 'Accepted': accepted,
      if (principalId != null) 'PrincipalId': principalId,
      if (sharePrincipals != null) 'SharePrincipals': sharePrincipals,
      if (shareTagOptions != null) 'ShareTagOptions': shareTagOptions,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum PortfolioShareType {
  imported,
  awsServicecatalog,
  awsOrganizations,
}

extension PortfolioShareTypeValueExtension on PortfolioShareType {
  String toValue() {
    switch (this) {
      case PortfolioShareType.imported:
        return 'IMPORTED';
      case PortfolioShareType.awsServicecatalog:
        return 'AWS_SERVICECATALOG';
      case PortfolioShareType.awsOrganizations:
        return 'AWS_ORGANIZATIONS';
    }
  }
}

extension PortfolioShareTypeFromString on String {
  PortfolioShareType toPortfolioShareType() {
    switch (this) {
      case 'IMPORTED':
        return PortfolioShareType.imported;
      case 'AWS_SERVICECATALOG':
        return PortfolioShareType.awsServicecatalog;
      case 'AWS_ORGANIZATIONS':
        return PortfolioShareType.awsOrganizations;
    }
    throw Exception('$this is not known in enum PortfolioShareType');
  }
}

/// Information about a principal.
class Principal {
  /// The ARN of the principal (user, role, or group). This field allows for an
  /// ARN with no <code>accountID</code>, with or without wildcard characters if
  /// the <code>PrincipalType</code> is an <code>IAM_PATTERN</code>.
  ///
  /// For more information, review <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/servicecatalog/associate-principal-with-portfolio.html#options">associate-principal-with-portfolio</a>
  /// in the Amazon Web Services CLI Command Reference.
  final String? principalARN;

  /// The principal type. The supported value is <code>IAM</code> if you use a
  /// fully defined ARN, or <code>IAM_PATTERN</code> if you use an ARN with no
  /// <code>accountID</code>, with or without wildcard characters.
  final PrincipalType? principalType;

  Principal({
    this.principalARN,
    this.principalType,
  });

  factory Principal.fromJson(Map<String, dynamic> json) {
    return Principal(
      principalARN: json['PrincipalARN'] as String?,
      principalType: (json['PrincipalType'] as String?)?.toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final principalARN = this.principalARN;
    final principalType = this.principalType;
    return {
      if (principalARN != null) 'PrincipalARN': principalARN,
      if (principalType != null) 'PrincipalType': principalType.toValue(),
    };
  }
}

enum PrincipalType {
  iam,
  iamPattern,
}

extension PrincipalTypeValueExtension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.iam:
        return 'IAM';
      case PrincipalType.iamPattern:
        return 'IAM_PATTERN';
    }
  }
}

extension PrincipalTypeFromString on String {
  PrincipalType toPrincipalType() {
    switch (this) {
      case 'IAM':
        return PrincipalType.iam;
      case 'IAM_PATTERN':
        return PrincipalType.iamPattern;
    }
    throw Exception('$this is not known in enum PrincipalType');
  }
}

enum ProductSource {
  account,
}

extension ProductSourceValueExtension on ProductSource {
  String toValue() {
    switch (this) {
      case ProductSource.account:
        return 'ACCOUNT';
    }
  }
}

extension ProductSourceFromString on String {
  ProductSource toProductSource() {
    switch (this) {
      case 'ACCOUNT':
        return ProductSource.account;
    }
    throw Exception('$this is not known in enum ProductSource');
  }
}

enum ProductType {
  cloudFormationTemplate,
  marketplace,
  terraformOpenSource,
  terraformCloud,
  external,
}

extension ProductTypeValueExtension on ProductType {
  String toValue() {
    switch (this) {
      case ProductType.cloudFormationTemplate:
        return 'CLOUD_FORMATION_TEMPLATE';
      case ProductType.marketplace:
        return 'MARKETPLACE';
      case ProductType.terraformOpenSource:
        return 'TERRAFORM_OPEN_SOURCE';
      case ProductType.terraformCloud:
        return 'TERRAFORM_CLOUD';
      case ProductType.external:
        return 'EXTERNAL';
    }
  }
}

extension ProductTypeFromString on String {
  ProductType toProductType() {
    switch (this) {
      case 'CLOUD_FORMATION_TEMPLATE':
        return ProductType.cloudFormationTemplate;
      case 'MARKETPLACE':
        return ProductType.marketplace;
      case 'TERRAFORM_OPEN_SOURCE':
        return ProductType.terraformOpenSource;
      case 'TERRAFORM_CLOUD':
        return ProductType.terraformCloud;
      case 'EXTERNAL':
        return ProductType.external;
    }
    throw Exception('$this is not known in enum ProductType');
  }
}

/// A single product view aggregation value/count pair, containing metadata
/// about each product to which the calling user has access.
class ProductViewAggregationValue {
  /// An approximate count of the products that match the value.
  final int? approximateCount;

  /// The value of the product view aggregation.
  final String? value;

  ProductViewAggregationValue({
    this.approximateCount,
    this.value,
  });

  factory ProductViewAggregationValue.fromJson(Map<String, dynamic> json) {
    return ProductViewAggregationValue(
      approximateCount: json['ApproximateCount'] as int?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateCount = this.approximateCount;
    final value = this.value;
    return {
      if (approximateCount != null) 'ApproximateCount': approximateCount,
      if (value != null) 'Value': value,
    };
  }
}

/// Information about a product view.
class ProductViewDetail {
  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The ARN of the product.
  final String? productARN;

  /// Summary information about the product view.
  final ProductViewSummary? productViewSummary;

  /// A top level <code>ProductViewDetail</code> response containing details about
  /// the product’s connection. Service Catalog returns this field for the
  /// <code>CreateProduct</code>, <code>UpdateProduct</code>,
  /// <code>DescribeProductAsAdmin</code>, and <code>SearchProductAsAdmin</code>
  /// APIs. This response contains the same fields as the
  /// <code>ConnectionParameters</code> request, with the addition of the
  /// <code>LastSync</code> response.
  final SourceConnectionDetail? sourceConnection;

  /// The status of the product.
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The product is ready for use.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - Product creation has started; the product is not
  /// ready for use.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - An action failed.
  /// </li>
  /// </ul>
  final Status? status;

  ProductViewDetail({
    this.createdTime,
    this.productARN,
    this.productViewSummary,
    this.sourceConnection,
    this.status,
  });

  factory ProductViewDetail.fromJson(Map<String, dynamic> json) {
    return ProductViewDetail(
      createdTime: timeStampFromJson(json['CreatedTime']),
      productARN: json['ProductARN'] as String?,
      productViewSummary: json['ProductViewSummary'] != null
          ? ProductViewSummary.fromJson(
              json['ProductViewSummary'] as Map<String, dynamic>)
          : null,
      sourceConnection: json['SourceConnection'] != null
          ? SourceConnectionDetail.fromJson(
              json['SourceConnection'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final productARN = this.productARN;
    final productViewSummary = this.productViewSummary;
    final sourceConnection = this.sourceConnection;
    final status = this.status;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (productARN != null) 'ProductARN': productARN,
      if (productViewSummary != null) 'ProductViewSummary': productViewSummary,
      if (sourceConnection != null) 'SourceConnection': sourceConnection,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ProductViewFilterBy {
  fullTextSearch,
  owner,
  productType,
  sourceProductId,
}

extension ProductViewFilterByValueExtension on ProductViewFilterBy {
  String toValue() {
    switch (this) {
      case ProductViewFilterBy.fullTextSearch:
        return 'FullTextSearch';
      case ProductViewFilterBy.owner:
        return 'Owner';
      case ProductViewFilterBy.productType:
        return 'ProductType';
      case ProductViewFilterBy.sourceProductId:
        return 'SourceProductId';
    }
  }
}

extension ProductViewFilterByFromString on String {
  ProductViewFilterBy toProductViewFilterBy() {
    switch (this) {
      case 'FullTextSearch':
        return ProductViewFilterBy.fullTextSearch;
      case 'Owner':
        return ProductViewFilterBy.owner;
      case 'ProductType':
        return ProductViewFilterBy.productType;
      case 'SourceProductId':
        return ProductViewFilterBy.sourceProductId;
    }
    throw Exception('$this is not known in enum ProductViewFilterBy');
  }
}

enum ProductViewSortBy {
  title,
  versionCount,
  creationDate,
}

extension ProductViewSortByValueExtension on ProductViewSortBy {
  String toValue() {
    switch (this) {
      case ProductViewSortBy.title:
        return 'Title';
      case ProductViewSortBy.versionCount:
        return 'VersionCount';
      case ProductViewSortBy.creationDate:
        return 'CreationDate';
    }
  }
}

extension ProductViewSortByFromString on String {
  ProductViewSortBy toProductViewSortBy() {
    switch (this) {
      case 'Title':
        return ProductViewSortBy.title;
      case 'VersionCount':
        return ProductViewSortBy.versionCount;
      case 'CreationDate':
        return ProductViewSortBy.creationDate;
    }
    throw Exception('$this is not known in enum ProductViewSortBy');
  }
}

/// Summary information about a product view.
class ProductViewSummary {
  /// The distributor of the product. Contact the product administrator for the
  /// significance of this value.
  final String? distributor;

  /// Indicates whether the product has a default path. If the product does not
  /// have a default path, call <a>ListLaunchPaths</a> to disambiguate between
  /// paths. Otherwise, <a>ListLaunchPaths</a> is not required, and the output of
  /// <a>ProductViewSummary</a> can be used directly with
  /// <a>DescribeProvisioningParameters</a>.
  final bool? hasDefaultPath;

  /// The product view identifier.
  final String? id;

  /// The name of the product.
  final String? name;

  /// The owner of the product. Contact the product administrator for the
  /// significance of this value.
  final String? owner;

  /// The product identifier.
  final String? productId;

  /// Short description of the product.
  final String? shortDescription;

  /// The description of the support for this Product.
  final String? supportDescription;

  /// The email contact information to obtain support for this Product.
  final String? supportEmail;

  /// The URL information to obtain support for this Product.
  final String? supportUrl;

  /// The product type. Contact the product administrator for the significance of
  /// this value. If this value is <code>MARKETPLACE</code>, the product was
  /// created by Amazon Web Services Marketplace.
  final ProductType? type;

  ProductViewSummary({
    this.distributor,
    this.hasDefaultPath,
    this.id,
    this.name,
    this.owner,
    this.productId,
    this.shortDescription,
    this.supportDescription,
    this.supportEmail,
    this.supportUrl,
    this.type,
  });

  factory ProductViewSummary.fromJson(Map<String, dynamic> json) {
    return ProductViewSummary(
      distributor: json['Distributor'] as String?,
      hasDefaultPath: json['HasDefaultPath'] as bool?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      productId: json['ProductId'] as String?,
      shortDescription: json['ShortDescription'] as String?,
      supportDescription: json['SupportDescription'] as String?,
      supportEmail: json['SupportEmail'] as String?,
      supportUrl: json['SupportUrl'] as String?,
      type: (json['Type'] as String?)?.toProductType(),
    );
  }

  Map<String, dynamic> toJson() {
    final distributor = this.distributor;
    final hasDefaultPath = this.hasDefaultPath;
    final id = this.id;
    final name = this.name;
    final owner = this.owner;
    final productId = this.productId;
    final shortDescription = this.shortDescription;
    final supportDescription = this.supportDescription;
    final supportEmail = this.supportEmail;
    final supportUrl = this.supportUrl;
    final type = this.type;
    return {
      if (distributor != null) 'Distributor': distributor,
      if (hasDefaultPath != null) 'HasDefaultPath': hasDefaultPath,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (productId != null) 'ProductId': productId,
      if (shortDescription != null) 'ShortDescription': shortDescription,
      if (supportDescription != null) 'SupportDescription': supportDescription,
      if (supportEmail != null) 'SupportEmail': supportEmail,
      if (supportUrl != null) 'SupportUrl': supportUrl,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum PropertyKey {
  owner,
  launchRole,
}

extension PropertyKeyValueExtension on PropertyKey {
  String toValue() {
    switch (this) {
      case PropertyKey.owner:
        return 'OWNER';
      case PropertyKey.launchRole:
        return 'LAUNCH_ROLE';
    }
  }
}

extension PropertyKeyFromString on String {
  PropertyKey toPropertyKey() {
    switch (this) {
      case 'OWNER':
        return PropertyKey.owner;
      case 'LAUNCH_ROLE':
        return PropertyKey.launchRole;
    }
    throw Exception('$this is not known in enum PropertyKey');
  }
}

class ProvisionProductOutput {
  /// Information about the result of provisioning the product.
  final RecordDetail? recordDetail;

  ProvisionProductOutput({
    this.recordDetail,
  });

  factory ProvisionProductOutput.fromJson(Map<String, dynamic> json) {
    return ProvisionProductOutput(
      recordDetail: json['RecordDetail'] != null
          ? RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordDetail = this.recordDetail;
    return {
      if (recordDetail != null) 'RecordDetail': recordDetail,
    };
  }
}

/// Information about a provisioned product.
class ProvisionedProductAttribute {
  /// The ARN of the provisioned product.
  final String? arn;

  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The identifier of the provisioned product.
  final String? id;

  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is returned
  /// for each repeated request.
  final String? idempotencyToken;

  /// The record identifier of the last request performed on this provisioned
  /// product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionProduct
  /// </li>
  /// <li>
  /// UpdateProvisionedProduct
  /// </li>
  /// <li>
  /// ExecuteProvisionedProductPlan
  /// </li>
  /// <li>
  /// TerminateProvisionedProduct
  /// </li>
  /// </ul>
  final String? lastProvisioningRecordId;

  /// The record identifier of the last request performed on this provisioned
  /// product.
  final String? lastRecordId;

  /// The record identifier of the last successful request performed on this
  /// provisioned product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionProduct
  /// </li>
  /// <li>
  /// UpdateProvisionedProduct
  /// </li>
  /// <li>
  /// ExecuteProvisionedProductPlan
  /// </li>
  /// <li>
  /// TerminateProvisionedProduct
  /// </li>
  /// </ul>
  final String? lastSuccessfulProvisioningRecordId;

  /// The user-friendly name of the provisioned product.
  final String? name;

  /// The assigned identifier for the resource, such as an EC2 instance ID or an
  /// S3 bucket name.
  final String? physicalId;

  /// The product identifier.
  final String? productId;

  /// The name of the product.
  final String? productName;

  /// The identifier of the provisioning artifact.
  final String? provisioningArtifactId;

  /// The name of the provisioning artifact.
  final String? provisioningArtifactName;

  /// The current status of the provisioned product.
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - Stable state, ready to perform any operation. The
  /// most recent operation succeeded and completed.
  /// </li>
  /// <li>
  /// <code>UNDER_CHANGE</code> - Transitive state. Operations performed might not
  /// have valid results. Wait for an <code>AVAILABLE</code> status before
  /// performing operations.
  /// </li>
  /// <li>
  /// <code>TAINTED</code> - Stable state, ready to perform any operation. The
  /// stack has completed the requested operation but is not exactly what was
  /// requested. For example, a request to update to a new version failed and the
  /// stack rolled back to the current version.
  /// </li>
  /// <li>
  /// <code>ERROR</code> - An unexpected error occurred. The provisioned product
  /// exists but the stack is not running. For example, CloudFormation received a
  /// parameter value that was not valid and could not launch the stack.
  /// </li>
  /// <li>
  /// <code>PLAN_IN_PROGRESS</code> - Transitive state. The plan operations were
  /// performed to provision a new product, but resources have not yet been
  /// created. After reviewing the list of resources to be created, execute the
  /// plan. Wait for an <code>AVAILABLE</code> status before performing
  /// operations.
  /// </li>
  /// </ul>
  final ProvisionedProductStatus? status;

  /// The current status message of the provisioned product.
  final String? statusMessage;

  /// One or more tags.
  final List<Tag>? tags;

  /// The type of provisioned product. The supported values are
  /// <code>CFN_STACK</code>, <code>CFN_STACKSET</code>,
  /// <code>TERRAFORM_OPEN_SOURCE</code>, <code>TERRAFORM_CLOUD</code>, and
  /// <code>EXTERNAL</code>.
  final String? type;

  /// The Amazon Resource Name (ARN) of the user.
  final String? userArn;

  /// The ARN of the user in the session. This ARN might contain a session ID.
  final String? userArnSession;

  ProvisionedProductAttribute({
    this.arn,
    this.createdTime,
    this.id,
    this.idempotencyToken,
    this.lastProvisioningRecordId,
    this.lastRecordId,
    this.lastSuccessfulProvisioningRecordId,
    this.name,
    this.physicalId,
    this.productId,
    this.productName,
    this.provisioningArtifactId,
    this.provisioningArtifactName,
    this.status,
    this.statusMessage,
    this.tags,
    this.type,
    this.userArn,
    this.userArnSession,
  });

  factory ProvisionedProductAttribute.fromJson(Map<String, dynamic> json) {
    return ProvisionedProductAttribute(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      id: json['Id'] as String?,
      idempotencyToken: json['IdempotencyToken'] as String?,
      lastProvisioningRecordId: json['LastProvisioningRecordId'] as String?,
      lastRecordId: json['LastRecordId'] as String?,
      lastSuccessfulProvisioningRecordId:
          json['LastSuccessfulProvisioningRecordId'] as String?,
      name: json['Name'] as String?,
      physicalId: json['PhysicalId'] as String?,
      productId: json['ProductId'] as String?,
      productName: json['ProductName'] as String?,
      provisioningArtifactId: json['ProvisioningArtifactId'] as String?,
      provisioningArtifactName: json['ProvisioningArtifactName'] as String?,
      status: (json['Status'] as String?)?.toProvisionedProductStatus(),
      statusMessage: json['StatusMessage'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['Type'] as String?,
      userArn: json['UserArn'] as String?,
      userArnSession: json['UserArnSession'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final id = this.id;
    final idempotencyToken = this.idempotencyToken;
    final lastProvisioningRecordId = this.lastProvisioningRecordId;
    final lastRecordId = this.lastRecordId;
    final lastSuccessfulProvisioningRecordId =
        this.lastSuccessfulProvisioningRecordId;
    final name = this.name;
    final physicalId = this.physicalId;
    final productId = this.productId;
    final productName = this.productName;
    final provisioningArtifactId = this.provisioningArtifactId;
    final provisioningArtifactName = this.provisioningArtifactName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    final type = this.type;
    final userArn = this.userArn;
    final userArnSession = this.userArnSession;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (id != null) 'Id': id,
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      if (lastProvisioningRecordId != null)
        'LastProvisioningRecordId': lastProvisioningRecordId,
      if (lastRecordId != null) 'LastRecordId': lastRecordId,
      if (lastSuccessfulProvisioningRecordId != null)
        'LastSuccessfulProvisioningRecordId':
            lastSuccessfulProvisioningRecordId,
      if (name != null) 'Name': name,
      if (physicalId != null) 'PhysicalId': physicalId,
      if (productId != null) 'ProductId': productId,
      if (productName != null) 'ProductName': productName,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
      if (provisioningArtifactName != null)
        'ProvisioningArtifactName': provisioningArtifactName,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
      if (userArn != null) 'UserArn': userArn,
      if (userArnSession != null) 'UserArnSession': userArnSession,
    };
  }
}

/// Information about a provisioned product.
class ProvisionedProductDetail {
  /// The ARN of the provisioned product.
  final String? arn;

  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The identifier of the provisioned product.
  final String? id;

  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is returned
  /// for each repeated request.
  final String? idempotencyToken;

  /// The record identifier of the last request performed on this provisioned
  /// product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionProduct
  /// </li>
  /// <li>
  /// UpdateProvisionedProduct
  /// </li>
  /// <li>
  /// ExecuteProvisionedProductPlan
  /// </li>
  /// <li>
  /// TerminateProvisionedProduct
  /// </li>
  /// </ul>
  final String? lastProvisioningRecordId;

  /// The record identifier of the last request performed on this provisioned
  /// product.
  final String? lastRecordId;

  /// The record identifier of the last successful request performed on this
  /// provisioned product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionProduct
  /// </li>
  /// <li>
  /// UpdateProvisionedProduct
  /// </li>
  /// <li>
  /// ExecuteProvisionedProductPlan
  /// </li>
  /// <li>
  /// TerminateProvisionedProduct
  /// </li>
  /// </ul>
  final String? lastSuccessfulProvisioningRecordId;

  /// The ARN of the launch role associated with the provisioned product.
  final String? launchRoleArn;

  /// The user-friendly name of the provisioned product.
  final String? name;

  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  final String? productId;

  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  final String? provisioningArtifactId;

  /// The current status of the provisioned product.
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - Stable state, ready to perform any operation. The
  /// most recent operation succeeded and completed.
  /// </li>
  /// <li>
  /// <code>UNDER_CHANGE</code> - Transitive state. Operations performed might not
  /// have valid results. Wait for an <code>AVAILABLE</code> status before
  /// performing operations.
  /// </li>
  /// <li>
  /// <code>TAINTED</code> - Stable state, ready to perform any operation. The
  /// stack has completed the requested operation but is not exactly what was
  /// requested. For example, a request to update to a new version failed and the
  /// stack rolled back to the current version.
  /// </li>
  /// <li>
  /// <code>ERROR</code> - An unexpected error occurred. The provisioned product
  /// exists but the stack is not running. For example, CloudFormation received a
  /// parameter value that was not valid and could not launch the stack.
  /// </li>
  /// <li>
  /// <code>PLAN_IN_PROGRESS</code> - Transitive state. The plan operations were
  /// performed to provision a new product, but resources have not yet been
  /// created. After reviewing the list of resources to be created, execute the
  /// plan. Wait for an <code>AVAILABLE</code> status before performing
  /// operations.
  /// </li>
  /// </ul>
  final ProvisionedProductStatus? status;

  /// The current status message of the provisioned product.
  final String? statusMessage;

  /// The type of provisioned product. The supported values are
  /// <code>CFN_STACK</code>, <code>CFN_STACKSET</code>,
  /// <code>TERRAFORM_OPEN_SOURCE</code>, <code>TERRAFORM_CLOUD</code>, and
  /// <code>EXTERNAL</code>.
  final String? type;

  ProvisionedProductDetail({
    this.arn,
    this.createdTime,
    this.id,
    this.idempotencyToken,
    this.lastProvisioningRecordId,
    this.lastRecordId,
    this.lastSuccessfulProvisioningRecordId,
    this.launchRoleArn,
    this.name,
    this.productId,
    this.provisioningArtifactId,
    this.status,
    this.statusMessage,
    this.type,
  });

  factory ProvisionedProductDetail.fromJson(Map<String, dynamic> json) {
    return ProvisionedProductDetail(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      id: json['Id'] as String?,
      idempotencyToken: json['IdempotencyToken'] as String?,
      lastProvisioningRecordId: json['LastProvisioningRecordId'] as String?,
      lastRecordId: json['LastRecordId'] as String?,
      lastSuccessfulProvisioningRecordId:
          json['LastSuccessfulProvisioningRecordId'] as String?,
      launchRoleArn: json['LaunchRoleArn'] as String?,
      name: json['Name'] as String?,
      productId: json['ProductId'] as String?,
      provisioningArtifactId: json['ProvisioningArtifactId'] as String?,
      status: (json['Status'] as String?)?.toProvisionedProductStatus(),
      statusMessage: json['StatusMessage'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final id = this.id;
    final idempotencyToken = this.idempotencyToken;
    final lastProvisioningRecordId = this.lastProvisioningRecordId;
    final lastRecordId = this.lastRecordId;
    final lastSuccessfulProvisioningRecordId =
        this.lastSuccessfulProvisioningRecordId;
    final launchRoleArn = this.launchRoleArn;
    final name = this.name;
    final productId = this.productId;
    final provisioningArtifactId = this.provisioningArtifactId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (id != null) 'Id': id,
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      if (lastProvisioningRecordId != null)
        'LastProvisioningRecordId': lastProvisioningRecordId,
      if (lastRecordId != null) 'LastRecordId': lastRecordId,
      if (lastSuccessfulProvisioningRecordId != null)
        'LastSuccessfulProvisioningRecordId':
            lastSuccessfulProvisioningRecordId,
      if (launchRoleArn != null) 'LaunchRoleArn': launchRoleArn,
      if (name != null) 'Name': name,
      if (productId != null) 'ProductId': productId,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (type != null) 'Type': type,
    };
  }
}

/// Information about a plan.
class ProvisionedProductPlanDetails {
  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// Passed to CloudFormation. The SNS topic ARNs to which to publish
  /// stack-related events.
  final List<String>? notificationArns;

  /// The path identifier of the product. This value is optional if the product
  /// has a default path, and required if the product has more than one path. To
  /// list the paths for a product, use <a>ListLaunchPaths</a>.
  final String? pathId;

  /// The plan identifier.
  final String? planId;

  /// The name of the plan.
  final String? planName;

  /// The plan type.
  final ProvisionedProductPlanType? planType;

  /// The product identifier.
  final String? productId;

  /// The product identifier.
  final String? provisionProductId;

  /// The user-friendly name of the provisioned product.
  final String? provisionProductName;

  /// The identifier of the provisioning artifact.
  final String? provisioningArtifactId;

  /// Parameters specified by the administrator that are required for provisioning
  /// the product.
  final List<UpdateProvisioningParameter>? provisioningParameters;

  /// The status.
  final ProvisionedProductPlanStatus? status;

  /// The status message.
  final String? statusMessage;

  /// One or more tags.
  final List<Tag>? tags;

  /// The UTC time stamp when the plan was last updated.
  final DateTime? updatedTime;

  ProvisionedProductPlanDetails({
    this.createdTime,
    this.notificationArns,
    this.pathId,
    this.planId,
    this.planName,
    this.planType,
    this.productId,
    this.provisionProductId,
    this.provisionProductName,
    this.provisioningArtifactId,
    this.provisioningParameters,
    this.status,
    this.statusMessage,
    this.tags,
    this.updatedTime,
  });

  factory ProvisionedProductPlanDetails.fromJson(Map<String, dynamic> json) {
    return ProvisionedProductPlanDetails(
      createdTime: timeStampFromJson(json['CreatedTime']),
      notificationArns: (json['NotificationArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      pathId: json['PathId'] as String?,
      planId: json['PlanId'] as String?,
      planName: json['PlanName'] as String?,
      planType: (json['PlanType'] as String?)?.toProvisionedProductPlanType(),
      productId: json['ProductId'] as String?,
      provisionProductId: json['ProvisionProductId'] as String?,
      provisionProductName: json['ProvisionProductName'] as String?,
      provisioningArtifactId: json['ProvisioningArtifactId'] as String?,
      provisioningParameters: (json['ProvisioningParameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UpdateProvisioningParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toProvisionedProductPlanStatus(),
      statusMessage: json['StatusMessage'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedTime: timeStampFromJson(json['UpdatedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final notificationArns = this.notificationArns;
    final pathId = this.pathId;
    final planId = this.planId;
    final planName = this.planName;
    final planType = this.planType;
    final productId = this.productId;
    final provisionProductId = this.provisionProductId;
    final provisionProductName = this.provisionProductName;
    final provisioningArtifactId = this.provisioningArtifactId;
    final provisioningParameters = this.provisioningParameters;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    final updatedTime = this.updatedTime;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (notificationArns != null) 'NotificationArns': notificationArns,
      if (pathId != null) 'PathId': pathId,
      if (planId != null) 'PlanId': planId,
      if (planName != null) 'PlanName': planName,
      if (planType != null) 'PlanType': planType.toValue(),
      if (productId != null) 'ProductId': productId,
      if (provisionProductId != null) 'ProvisionProductId': provisionProductId,
      if (provisionProductName != null)
        'ProvisionProductName': provisionProductName,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
      if (provisioningParameters != null)
        'ProvisioningParameters': provisioningParameters,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (tags != null) 'Tags': tags,
      if (updatedTime != null) 'UpdatedTime': unixTimestampToJson(updatedTime),
    };
  }
}

enum ProvisionedProductPlanStatus {
  createInProgress,
  createSuccess,
  createFailed,
  executeInProgress,
  executeSuccess,
  executeFailed,
}

extension ProvisionedProductPlanStatusValueExtension
    on ProvisionedProductPlanStatus {
  String toValue() {
    switch (this) {
      case ProvisionedProductPlanStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ProvisionedProductPlanStatus.createSuccess:
        return 'CREATE_SUCCESS';
      case ProvisionedProductPlanStatus.createFailed:
        return 'CREATE_FAILED';
      case ProvisionedProductPlanStatus.executeInProgress:
        return 'EXECUTE_IN_PROGRESS';
      case ProvisionedProductPlanStatus.executeSuccess:
        return 'EXECUTE_SUCCESS';
      case ProvisionedProductPlanStatus.executeFailed:
        return 'EXECUTE_FAILED';
    }
  }
}

extension ProvisionedProductPlanStatusFromString on String {
  ProvisionedProductPlanStatus toProvisionedProductPlanStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return ProvisionedProductPlanStatus.createInProgress;
      case 'CREATE_SUCCESS':
        return ProvisionedProductPlanStatus.createSuccess;
      case 'CREATE_FAILED':
        return ProvisionedProductPlanStatus.createFailed;
      case 'EXECUTE_IN_PROGRESS':
        return ProvisionedProductPlanStatus.executeInProgress;
      case 'EXECUTE_SUCCESS':
        return ProvisionedProductPlanStatus.executeSuccess;
      case 'EXECUTE_FAILED':
        return ProvisionedProductPlanStatus.executeFailed;
    }
    throw Exception('$this is not known in enum ProvisionedProductPlanStatus');
  }
}

/// Summary information about a plan.
class ProvisionedProductPlanSummary {
  /// The plan identifier.
  final String? planId;

  /// The name of the plan.
  final String? planName;

  /// The plan type.
  final ProvisionedProductPlanType? planType;

  /// The product identifier.
  final String? provisionProductId;

  /// The user-friendly name of the provisioned product.
  final String? provisionProductName;

  /// The identifier of the provisioning artifact.
  final String? provisioningArtifactId;

  ProvisionedProductPlanSummary({
    this.planId,
    this.planName,
    this.planType,
    this.provisionProductId,
    this.provisionProductName,
    this.provisioningArtifactId,
  });

  factory ProvisionedProductPlanSummary.fromJson(Map<String, dynamic> json) {
    return ProvisionedProductPlanSummary(
      planId: json['PlanId'] as String?,
      planName: json['PlanName'] as String?,
      planType: (json['PlanType'] as String?)?.toProvisionedProductPlanType(),
      provisionProductId: json['ProvisionProductId'] as String?,
      provisionProductName: json['ProvisionProductName'] as String?,
      provisioningArtifactId: json['ProvisioningArtifactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final planId = this.planId;
    final planName = this.planName;
    final planType = this.planType;
    final provisionProductId = this.provisionProductId;
    final provisionProductName = this.provisionProductName;
    final provisioningArtifactId = this.provisioningArtifactId;
    return {
      if (planId != null) 'PlanId': planId,
      if (planName != null) 'PlanName': planName,
      if (planType != null) 'PlanType': planType.toValue(),
      if (provisionProductId != null) 'ProvisionProductId': provisionProductId,
      if (provisionProductName != null)
        'ProvisionProductName': provisionProductName,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
    };
  }
}

enum ProvisionedProductPlanType {
  cloudformation,
}

extension ProvisionedProductPlanTypeValueExtension
    on ProvisionedProductPlanType {
  String toValue() {
    switch (this) {
      case ProvisionedProductPlanType.cloudformation:
        return 'CLOUDFORMATION';
    }
  }
}

extension ProvisionedProductPlanTypeFromString on String {
  ProvisionedProductPlanType toProvisionedProductPlanType() {
    switch (this) {
      case 'CLOUDFORMATION':
        return ProvisionedProductPlanType.cloudformation;
    }
    throw Exception('$this is not known in enum ProvisionedProductPlanType');
  }
}

enum ProvisionedProductStatus {
  available,
  underChange,
  tainted,
  error,
  planInProgress,
}

extension ProvisionedProductStatusValueExtension on ProvisionedProductStatus {
  String toValue() {
    switch (this) {
      case ProvisionedProductStatus.available:
        return 'AVAILABLE';
      case ProvisionedProductStatus.underChange:
        return 'UNDER_CHANGE';
      case ProvisionedProductStatus.tainted:
        return 'TAINTED';
      case ProvisionedProductStatus.error:
        return 'ERROR';
      case ProvisionedProductStatus.planInProgress:
        return 'PLAN_IN_PROGRESS';
    }
  }
}

extension ProvisionedProductStatusFromString on String {
  ProvisionedProductStatus toProvisionedProductStatus() {
    switch (this) {
      case 'AVAILABLE':
        return ProvisionedProductStatus.available;
      case 'UNDER_CHANGE':
        return ProvisionedProductStatus.underChange;
      case 'TAINTED':
        return ProvisionedProductStatus.tainted;
      case 'ERROR':
        return ProvisionedProductStatus.error;
      case 'PLAN_IN_PROGRESS':
        return ProvisionedProductStatus.planInProgress;
    }
    throw Exception('$this is not known in enum ProvisionedProductStatus');
  }
}

enum ProvisionedProductViewFilterBy {
  searchQuery,
}

extension ProvisionedProductViewFilterByValueExtension
    on ProvisionedProductViewFilterBy {
  String toValue() {
    switch (this) {
      case ProvisionedProductViewFilterBy.searchQuery:
        return 'SearchQuery';
    }
  }
}

extension ProvisionedProductViewFilterByFromString on String {
  ProvisionedProductViewFilterBy toProvisionedProductViewFilterBy() {
    switch (this) {
      case 'SearchQuery':
        return ProvisionedProductViewFilterBy.searchQuery;
    }
    throw Exception(
        '$this is not known in enum ProvisionedProductViewFilterBy');
  }
}

/// Information about a provisioning artifact. A provisioning artifact is also
/// known as a product version.
class ProvisioningArtifact {
  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The description of the provisioning artifact.
  final String? description;

  /// Information set by the administrator to provide guidance to end users about
  /// which provisioning artifacts to use.
  final ProvisioningArtifactGuidance? guidance;

  /// The identifier of the provisioning artifact.
  final String? id;

  /// The name of the provisioning artifact.
  final String? name;

  ProvisioningArtifact({
    this.createdTime,
    this.description,
    this.guidance,
    this.id,
    this.name,
  });

  factory ProvisioningArtifact.fromJson(Map<String, dynamic> json) {
    return ProvisioningArtifact(
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      guidance: (json['Guidance'] as String?)?.toProvisioningArtifactGuidance(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final description = this.description;
    final guidance = this.guidance;
    final id = this.id;
    final name = this.name;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (guidance != null) 'Guidance': guidance.toValue(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about a provisioning artifact (also known as a version) for a
/// product.
class ProvisioningArtifactDetail {
  /// Indicates whether the product version is active.
  final bool? active;

  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The description of the provisioning artifact.
  final String? description;

  /// Information set by the administrator to provide guidance to end users about
  /// which provisioning artifacts to use.
  final ProvisioningArtifactGuidance? guidance;

  /// The identifier of the provisioning artifact.
  final String? id;

  /// The name of the provisioning artifact.
  final String? name;

  /// Specifies the revision of the external artifact that was used to
  /// automatically sync the Service Catalog product and create the provisioning
  /// artifact. Service Catalog includes this response parameter as a high level
  /// field to the existing <code>ProvisioningArtifactDetail</code> type, which is
  /// returned as part of the response for <code>CreateProduct</code>,
  /// <code>UpdateProduct</code>, <code>DescribeProductAsAdmin</code>,
  /// <code>DescribeProvisioningArtifact</code>,
  /// <code>ListProvisioningArtifact</code>, and
  /// <code>UpdateProvisioningArticat</code> APIs.
  ///
  /// This field only exists for Repo-Synced products.
  final String? sourceRevision;

  /// The type of provisioning artifact.
  ///
  /// <ul>
  /// <li>
  /// <code>CLOUD_FORMATION_TEMPLATE</code> - CloudFormation template
  /// </li>
  /// <li>
  /// <code>TERRAFORM_OPEN_SOURCE</code> - Terraform Open Source configuration
  /// file
  /// </li>
  /// <li>
  /// <code>TERRAFORM_CLOUD</code> - Terraform Cloud configuration file
  /// </li>
  /// <li>
  /// <code>EXTERNAL</code> - External configuration file
  /// </li>
  /// </ul>
  final ProvisioningArtifactType? type;

  ProvisioningArtifactDetail({
    this.active,
    this.createdTime,
    this.description,
    this.guidance,
    this.id,
    this.name,
    this.sourceRevision,
    this.type,
  });

  factory ProvisioningArtifactDetail.fromJson(Map<String, dynamic> json) {
    return ProvisioningArtifactDetail(
      active: json['Active'] as bool?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      guidance: (json['Guidance'] as String?)?.toProvisioningArtifactGuidance(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      sourceRevision: json['SourceRevision'] as String?,
      type: (json['Type'] as String?)?.toProvisioningArtifactType(),
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final createdTime = this.createdTime;
    final description = this.description;
    final guidance = this.guidance;
    final id = this.id;
    final name = this.name;
    final sourceRevision = this.sourceRevision;
    final type = this.type;
    return {
      if (active != null) 'Active': active,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (guidance != null) 'Guidance': guidance.toValue(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (sourceRevision != null) 'SourceRevision': sourceRevision,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ProvisioningArtifactGuidance {
  $default,
  deprecated,
}

extension ProvisioningArtifactGuidanceValueExtension
    on ProvisioningArtifactGuidance {
  String toValue() {
    switch (this) {
      case ProvisioningArtifactGuidance.$default:
        return 'DEFAULT';
      case ProvisioningArtifactGuidance.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension ProvisioningArtifactGuidanceFromString on String {
  ProvisioningArtifactGuidance toProvisioningArtifactGuidance() {
    switch (this) {
      case 'DEFAULT':
        return ProvisioningArtifactGuidance.$default;
      case 'DEPRECATED':
        return ProvisioningArtifactGuidance.deprecated;
    }
    throw Exception('$this is not known in enum ProvisioningArtifactGuidance');
  }
}

/// Provisioning artifact output.
class ProvisioningArtifactOutput {
  /// Description of the provisioning artifact output key.
  final String? description;

  /// The provisioning artifact output key.
  final String? key;

  ProvisioningArtifactOutput({
    this.description,
    this.key,
  });

  factory ProvisioningArtifactOutput.fromJson(Map<String, dynamic> json) {
    return ProvisioningArtifactOutput(
      description: json['Description'] as String?,
      key: json['Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final key = this.key;
    return {
      if (description != null) 'Description': description,
      if (key != null) 'Key': key,
    };
  }
}

/// Information about a parameter used to provision a product.
class ProvisioningArtifactParameter {
  /// The default value.
  final String? defaultValue;

  /// The description of the parameter.
  final String? description;

  /// If this value is true, the value for this parameter is obfuscated from view
  /// when the parameter is retrieved. This parameter is used to hide sensitive
  /// information.
  final bool? isNoEcho;

  /// Constraints that the administrator has put on a parameter.
  final ParameterConstraints? parameterConstraints;

  /// The parameter key.
  final String? parameterKey;

  /// The parameter type.
  final String? parameterType;

  ProvisioningArtifactParameter({
    this.defaultValue,
    this.description,
    this.isNoEcho,
    this.parameterConstraints,
    this.parameterKey,
    this.parameterType,
  });

  factory ProvisioningArtifactParameter.fromJson(Map<String, dynamic> json) {
    return ProvisioningArtifactParameter(
      defaultValue: json['DefaultValue'] as String?,
      description: json['Description'] as String?,
      isNoEcho: json['IsNoEcho'] as bool?,
      parameterConstraints: json['ParameterConstraints'] != null
          ? ParameterConstraints.fromJson(
              json['ParameterConstraints'] as Map<String, dynamic>)
          : null,
      parameterKey: json['ParameterKey'] as String?,
      parameterType: json['ParameterType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final description = this.description;
    final isNoEcho = this.isNoEcho;
    final parameterConstraints = this.parameterConstraints;
    final parameterKey = this.parameterKey;
    final parameterType = this.parameterType;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (isNoEcho != null) 'IsNoEcho': isNoEcho,
      if (parameterConstraints != null)
        'ParameterConstraints': parameterConstraints,
      if (parameterKey != null) 'ParameterKey': parameterKey,
      if (parameterType != null) 'ParameterType': parameterType,
    };
  }
}

/// The user-defined preferences that will be applied during product
/// provisioning, unless overridden by <code>ProvisioningPreferences</code> or
/// <code>UpdateProvisioningPreferences</code>.
///
/// For more information on maximum concurrent accounts and failure tolerance,
/// see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
/// set operation options</a> in the <i>CloudFormation User Guide</i>.
class ProvisioningArtifactPreferences {
  /// One or more Amazon Web Services accounts where stack instances are deployed
  /// from the stack set. These accounts can be scoped in
  /// <code>ProvisioningPreferences$StackSetAccounts</code> and
  /// <code>UpdateProvisioningPreferences$StackSetAccounts</code>.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  final List<String>? stackSetAccounts;

  /// One or more Amazon Web Services Regions where stack instances are deployed
  /// from the stack set. These Regions can be scoped in
  /// <code>ProvisioningPreferences$StackSetRegions</code> and
  /// <code>UpdateProvisioningPreferences$StackSetRegions</code>.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  final List<String>? stackSetRegions;

  ProvisioningArtifactPreferences({
    this.stackSetAccounts,
    this.stackSetRegions,
  });

  factory ProvisioningArtifactPreferences.fromJson(Map<String, dynamic> json) {
    return ProvisioningArtifactPreferences(
      stackSetAccounts: (json['StackSetAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      stackSetRegions: (json['StackSetRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stackSetAccounts = this.stackSetAccounts;
    final stackSetRegions = this.stackSetRegions;
    return {
      if (stackSetAccounts != null) 'StackSetAccounts': stackSetAccounts,
      if (stackSetRegions != null) 'StackSetRegions': stackSetRegions,
    };
  }
}

/// Information about a provisioning artifact (also known as a version) for a
/// product.
class ProvisioningArtifactProperties {
  /// The description of the provisioning artifact, including how it differs from
  /// the previous provisioning artifact.
  final String? description;

  /// If set to true, Service Catalog stops validating the specified provisioning
  /// artifact even if it is invalid.
  ///
  /// Service Catalog does not support template validation for the
  /// <code>TERRAFORM_OS</code> product type.
  final bool? disableTemplateValidation;

  /// Specify the template source with one of the following options, but not both.
  /// Keys accepted: [ <code>LoadTemplateFromURL</code>,
  /// <code>ImportFromPhysicalId</code> ]
  ///
  /// The URL of the CloudFormation template in Amazon S3 or GitHub in JSON
  /// format. Specify the URL in JSON format as follows:
  ///
  /// <code>"LoadTemplateFromURL":
  /// "https://s3.amazonaws.com/cf-templates-ozkq9d3hgiq2-us-east-1/..."</code>
  ///
  /// <code>ImportFromPhysicalId</code>: The physical id of the resource that
  /// contains the template. Currently only supports CloudFormation stack arn.
  /// Specify the physical id in JSON format as follows:
  /// <code>ImportFromPhysicalId:
  /// “arn:aws:cloudformation:[us-east-1]:[accountId]:stack/[StackName]/[resourceId]</code>
  final Map<String, String>? info;

  /// The name of the provisioning artifact (for example, v1 v2beta). No spaces
  /// are allowed.
  final String? name;

  /// The type of provisioning artifact.
  ///
  /// <ul>
  /// <li>
  /// <code>CLOUD_FORMATION_TEMPLATE</code> - CloudFormation template
  /// </li>
  /// <li>
  /// <code>TERRAFORM_OPEN_SOURCE</code> - Terraform Open Source configuration
  /// file
  /// </li>
  /// <li>
  /// <code>TERRAFORM_CLOUD</code> - Terraform Cloud configuration file
  /// </li>
  /// <li>
  /// <code>EXTERNAL</code> - External configuration file
  /// </li>
  /// </ul>
  final ProvisioningArtifactType? type;

  ProvisioningArtifactProperties({
    this.description,
    this.disableTemplateValidation,
    this.info,
    this.name,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final disableTemplateValidation = this.disableTemplateValidation;
    final info = this.info;
    final name = this.name;
    final type = this.type;
    return {
      if (description != null) 'Description': description,
      if (disableTemplateValidation != null)
        'DisableTemplateValidation': disableTemplateValidation,
      if (info != null) 'Info': info,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ProvisioningArtifactPropertyName {
  id,
}

extension ProvisioningArtifactPropertyNameValueExtension
    on ProvisioningArtifactPropertyName {
  String toValue() {
    switch (this) {
      case ProvisioningArtifactPropertyName.id:
        return 'Id';
    }
  }
}

extension ProvisioningArtifactPropertyNameFromString on String {
  ProvisioningArtifactPropertyName toProvisioningArtifactPropertyName() {
    switch (this) {
      case 'Id':
        return ProvisioningArtifactPropertyName.id;
    }
    throw Exception(
        '$this is not known in enum ProvisioningArtifactPropertyName');
  }
}

/// Summary information about a provisioning artifact (also known as a version)
/// for a product.
class ProvisioningArtifactSummary {
  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The description of the provisioning artifact.
  final String? description;

  /// The identifier of the provisioning artifact.
  final String? id;

  /// The name of the provisioning artifact.
  final String? name;

  /// The metadata for the provisioning artifact. This is used with Amazon Web
  /// Services Marketplace products.
  final Map<String, String>? provisioningArtifactMetadata;

  ProvisioningArtifactSummary({
    this.createdTime,
    this.description,
    this.id,
    this.name,
    this.provisioningArtifactMetadata,
  });

  factory ProvisioningArtifactSummary.fromJson(Map<String, dynamic> json) {
    return ProvisioningArtifactSummary(
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      provisioningArtifactMetadata:
          (json['ProvisioningArtifactMetadata'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final provisioningArtifactMetadata = this.provisioningArtifactMetadata;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (provisioningArtifactMetadata != null)
        'ProvisioningArtifactMetadata': provisioningArtifactMetadata,
    };
  }
}

enum ProvisioningArtifactType {
  cloudFormationTemplate,
  marketplaceAmi,
  marketplaceCar,
  terraformOpenSource,
  terraformCloud,
  external,
}

extension ProvisioningArtifactTypeValueExtension on ProvisioningArtifactType {
  String toValue() {
    switch (this) {
      case ProvisioningArtifactType.cloudFormationTemplate:
        return 'CLOUD_FORMATION_TEMPLATE';
      case ProvisioningArtifactType.marketplaceAmi:
        return 'MARKETPLACE_AMI';
      case ProvisioningArtifactType.marketplaceCar:
        return 'MARKETPLACE_CAR';
      case ProvisioningArtifactType.terraformOpenSource:
        return 'TERRAFORM_OPEN_SOURCE';
      case ProvisioningArtifactType.terraformCloud:
        return 'TERRAFORM_CLOUD';
      case ProvisioningArtifactType.external:
        return 'EXTERNAL';
    }
  }
}

extension ProvisioningArtifactTypeFromString on String {
  ProvisioningArtifactType toProvisioningArtifactType() {
    switch (this) {
      case 'CLOUD_FORMATION_TEMPLATE':
        return ProvisioningArtifactType.cloudFormationTemplate;
      case 'MARKETPLACE_AMI':
        return ProvisioningArtifactType.marketplaceAmi;
      case 'MARKETPLACE_CAR':
        return ProvisioningArtifactType.marketplaceCar;
      case 'TERRAFORM_OPEN_SOURCE':
        return ProvisioningArtifactType.terraformOpenSource;
      case 'TERRAFORM_CLOUD':
        return ProvisioningArtifactType.terraformCloud;
      case 'EXTERNAL':
        return ProvisioningArtifactType.external;
    }
    throw Exception('$this is not known in enum ProvisioningArtifactType');
  }
}

/// An object that contains summary information about a product view and a
/// provisioning artifact.
class ProvisioningArtifactView {
  /// Summary information about a product view.
  final ProductViewSummary? productViewSummary;

  /// Information about a provisioning artifact. A provisioning artifact is also
  /// known as a product version.
  final ProvisioningArtifact? provisioningArtifact;

  ProvisioningArtifactView({
    this.productViewSummary,
    this.provisioningArtifact,
  });

  factory ProvisioningArtifactView.fromJson(Map<String, dynamic> json) {
    return ProvisioningArtifactView(
      productViewSummary: json['ProductViewSummary'] != null
          ? ProductViewSummary.fromJson(
              json['ProductViewSummary'] as Map<String, dynamic>)
          : null,
      provisioningArtifact: json['ProvisioningArtifact'] != null
          ? ProvisioningArtifact.fromJson(
              json['ProvisioningArtifact'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final productViewSummary = this.productViewSummary;
    final provisioningArtifact = this.provisioningArtifact;
    return {
      if (productViewSummary != null) 'ProductViewSummary': productViewSummary,
      if (provisioningArtifact != null)
        'ProvisioningArtifact': provisioningArtifact,
    };
  }
}

/// Information about a parameter used to provision a product.
class ProvisioningParameter {
  /// The parameter key.
  final String? key;

  /// The parameter value.
  final String? value;

  ProvisioningParameter({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// The user-defined preferences that will be applied when updating a
/// provisioned product. Not all preferences are applicable to all provisioned
/// product type
///
/// One or more Amazon Web Services accounts that will have access to the
/// provisioned product.
///
/// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
///
/// The Amazon Web Services accounts specified should be within the list of
/// accounts in the <code>STACKSET</code> constraint. To get the list of
/// accounts in the <code>STACKSET</code> constraint, use the
/// <code>DescribeProvisioningParameters</code> operation.
///
/// If no values are specified, the default value is all accounts from the
/// <code>STACKSET</code> constraint.
class ProvisioningPreferences {
  /// One or more Amazon Web Services accounts where the provisioned product will
  /// be available.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// The specified accounts should be within the list of accounts from the
  /// <code>STACKSET</code> constraint. To get the list of accounts in the
  /// <code>STACKSET</code> constraint, use the
  /// <code>DescribeProvisioningParameters</code> operation.
  ///
  /// If no values are specified, the default value is all acounts from the
  /// <code>STACKSET</code> constraint.
  final List<String>? stackSetAccounts;

  /// The number of accounts, per Region, for which this operation can fail before
  /// Service Catalog stops the operation in that Region. If the operation is
  /// stopped in a Region, Service Catalog doesn't attempt the operation in any
  /// subsequent Regions.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  ///
  /// The default value is <code>0</code> if no value is specified.
  final int? stackSetFailureToleranceCount;

  /// The percentage of accounts, per Region, for which this stack operation can
  /// fail before Service Catalog stops the operation in that Region. If the
  /// operation is stopped in a Region, Service Catalog doesn't attempt the
  /// operation in any subsequent Regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// Service Catalog rounds down to the next whole number.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  final int? stackSetFailureTolerancePercentage;

  /// The maximum number of accounts in which to perform this operation at one
  /// time. This is dependent on the value of
  /// <code>StackSetFailureToleranceCount</code>.
  /// <code>StackSetMaxConcurrentCount</code> is at most one more than the
  /// <code>StackSetFailureToleranceCount</code>.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of accounts
  /// acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either <code>StackSetMaxConcurrentCount</code>
  /// or <code>StackSetMaxConcurrentPercentage</code>, but not both.
  final int? stackSetMaxConcurrencyCount;

  /// The maximum percentage of accounts in which to perform this operation at one
  /// time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// Service Catalog rounds down to the next whole number. This is true except in
  /// cases where rounding down would result is zero. In this case, Service
  /// Catalog sets the number as <code>1</code> instead.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of accounts
  /// acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either <code>StackSetMaxConcurrentCount</code>
  /// or <code>StackSetMaxConcurrentPercentage</code>, but not both.
  final int? stackSetMaxConcurrencyPercentage;

  /// One or more Amazon Web Services Regions where the provisioned product will
  /// be available.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// The specified Regions should be within the list of Regions from the
  /// <code>STACKSET</code> constraint. To get the list of Regions in the
  /// <code>STACKSET</code> constraint, use the
  /// <code>DescribeProvisioningParameters</code> operation.
  ///
  /// If no values are specified, the default value is all Regions from the
  /// <code>STACKSET</code> constraint.
  final List<String>? stackSetRegions;

  ProvisioningPreferences({
    this.stackSetAccounts,
    this.stackSetFailureToleranceCount,
    this.stackSetFailureTolerancePercentage,
    this.stackSetMaxConcurrencyCount,
    this.stackSetMaxConcurrencyPercentage,
    this.stackSetRegions,
  });

  Map<String, dynamic> toJson() {
    final stackSetAccounts = this.stackSetAccounts;
    final stackSetFailureToleranceCount = this.stackSetFailureToleranceCount;
    final stackSetFailureTolerancePercentage =
        this.stackSetFailureTolerancePercentage;
    final stackSetMaxConcurrencyCount = this.stackSetMaxConcurrencyCount;
    final stackSetMaxConcurrencyPercentage =
        this.stackSetMaxConcurrencyPercentage;
    final stackSetRegions = this.stackSetRegions;
    return {
      if (stackSetAccounts != null) 'StackSetAccounts': stackSetAccounts,
      if (stackSetFailureToleranceCount != null)
        'StackSetFailureToleranceCount': stackSetFailureToleranceCount,
      if (stackSetFailureTolerancePercentage != null)
        'StackSetFailureTolerancePercentage':
            stackSetFailureTolerancePercentage,
      if (stackSetMaxConcurrencyCount != null)
        'StackSetMaxConcurrencyCount': stackSetMaxConcurrencyCount,
      if (stackSetMaxConcurrencyPercentage != null)
        'StackSetMaxConcurrencyPercentage': stackSetMaxConcurrencyPercentage,
      if (stackSetRegions != null) 'StackSetRegions': stackSetRegions,
    };
  }
}

/// Information about a request operation.
class RecordDetail {
  /// The UTC time stamp of the creation time.
  final DateTime? createdTime;

  /// The ARN of the launch role associated with the provisioned product.
  final String? launchRoleArn;

  /// The path identifier.
  final String? pathId;

  /// The product identifier.
  final String? productId;

  /// The identifier of the provisioned product.
  final String? provisionedProductId;

  /// The user-friendly name of the provisioned product.
  final String? provisionedProductName;

  /// The type of provisioned product. The supported values are
  /// <code>CFN_STACK</code>, <code>CFN_STACKSET</code>,
  /// <code>TERRAFORM_OPEN_SOURCE</code>, <code>TERRAFORM_CLOUD</code>, and
  /// <code>EXTERNAL</code>.
  final String? provisionedProductType;

  /// The identifier of the provisioning artifact.
  final String? provisioningArtifactId;

  /// The errors that occurred.
  final List<RecordError>? recordErrors;

  /// The identifier of the record.
  final String? recordId;

  /// One or more tags.
  final List<RecordTag>? recordTags;

  /// The record type.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISION_PRODUCT</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_PROVISIONED_PRODUCT</code>
  /// </li>
  /// <li>
  /// <code>TERMINATE_PROVISIONED_PRODUCT</code>
  /// </li>
  /// </ul>
  final String? recordType;

  /// The status of the provisioned product.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED</code> - The request was created but the operation has not
  /// started.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - The requested operation is in progress.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS_IN_ERROR</code> - The provisioned product is under change
  /// but the requested operation failed and some remediation is occurring. For
  /// example, a rollback.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code> - The requested operation has successfully completed.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The requested operation has unsuccessfully completed.
  /// Investigate using the error messages returned.
  /// </li>
  /// </ul>
  final RecordStatus? status;

  /// The time when the record was last updated.
  final DateTime? updatedTime;

  RecordDetail({
    this.createdTime,
    this.launchRoleArn,
    this.pathId,
    this.productId,
    this.provisionedProductId,
    this.provisionedProductName,
    this.provisionedProductType,
    this.provisioningArtifactId,
    this.recordErrors,
    this.recordId,
    this.recordTags,
    this.recordType,
    this.status,
    this.updatedTime,
  });

  factory RecordDetail.fromJson(Map<String, dynamic> json) {
    return RecordDetail(
      createdTime: timeStampFromJson(json['CreatedTime']),
      launchRoleArn: json['LaunchRoleArn'] as String?,
      pathId: json['PathId'] as String?,
      productId: json['ProductId'] as String?,
      provisionedProductId: json['ProvisionedProductId'] as String?,
      provisionedProductName: json['ProvisionedProductName'] as String?,
      provisionedProductType: json['ProvisionedProductType'] as String?,
      provisioningArtifactId: json['ProvisioningArtifactId'] as String?,
      recordErrors: (json['RecordErrors'] as List?)
          ?.whereNotNull()
          .map((e) => RecordError.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordId: json['RecordId'] as String?,
      recordTags: (json['RecordTags'] as List?)
          ?.whereNotNull()
          .map((e) => RecordTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordType: json['RecordType'] as String?,
      status: (json['Status'] as String?)?.toRecordStatus(),
      updatedTime: timeStampFromJson(json['UpdatedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final launchRoleArn = this.launchRoleArn;
    final pathId = this.pathId;
    final productId = this.productId;
    final provisionedProductId = this.provisionedProductId;
    final provisionedProductName = this.provisionedProductName;
    final provisionedProductType = this.provisionedProductType;
    final provisioningArtifactId = this.provisioningArtifactId;
    final recordErrors = this.recordErrors;
    final recordId = this.recordId;
    final recordTags = this.recordTags;
    final recordType = this.recordType;
    final status = this.status;
    final updatedTime = this.updatedTime;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (launchRoleArn != null) 'LaunchRoleArn': launchRoleArn,
      if (pathId != null) 'PathId': pathId,
      if (productId != null) 'ProductId': productId,
      if (provisionedProductId != null)
        'ProvisionedProductId': provisionedProductId,
      if (provisionedProductName != null)
        'ProvisionedProductName': provisionedProductName,
      if (provisionedProductType != null)
        'ProvisionedProductType': provisionedProductType,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
      if (recordErrors != null) 'RecordErrors': recordErrors,
      if (recordId != null) 'RecordId': recordId,
      if (recordTags != null) 'RecordTags': recordTags,
      if (recordType != null) 'RecordType': recordType,
      if (status != null) 'Status': status.toValue(),
      if (updatedTime != null) 'UpdatedTime': unixTimestampToJson(updatedTime),
    };
  }
}

/// The error code and description resulting from an operation.
class RecordError {
  /// The numeric value of the error.
  final String? code;

  /// The description of the error.
  final String? description;

  RecordError({
    this.code,
    this.description,
  });

  factory RecordError.fromJson(Map<String, dynamic> json) {
    return RecordError(
      code: json['Code'] as String?,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final description = this.description;
    return {
      if (code != null) 'Code': code,
      if (description != null) 'Description': description,
    };
  }
}

/// The output for the product created as the result of a request. For example,
/// the output for a CloudFormation-backed product that creates an S3 bucket
/// would include the S3 bucket URL.
class RecordOutput {
  /// The description of the output.
  final String? description;

  /// The output key.
  final String? outputKey;

  /// The output value.
  final String? outputValue;

  RecordOutput({
    this.description,
    this.outputKey,
    this.outputValue,
  });

  factory RecordOutput.fromJson(Map<String, dynamic> json) {
    return RecordOutput(
      description: json['Description'] as String?,
      outputKey: json['OutputKey'] as String?,
      outputValue: json['OutputValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final outputKey = this.outputKey;
    final outputValue = this.outputValue;
    return {
      if (description != null) 'Description': description,
      if (outputKey != null) 'OutputKey': outputKey,
      if (outputValue != null) 'OutputValue': outputValue,
    };
  }
}

enum RecordStatus {
  created,
  inProgress,
  inProgressInError,
  succeeded,
  failed,
}

extension RecordStatusValueExtension on RecordStatus {
  String toValue() {
    switch (this) {
      case RecordStatus.created:
        return 'CREATED';
      case RecordStatus.inProgress:
        return 'IN_PROGRESS';
      case RecordStatus.inProgressInError:
        return 'IN_PROGRESS_IN_ERROR';
      case RecordStatus.succeeded:
        return 'SUCCEEDED';
      case RecordStatus.failed:
        return 'FAILED';
    }
  }
}

extension RecordStatusFromString on String {
  RecordStatus toRecordStatus() {
    switch (this) {
      case 'CREATED':
        return RecordStatus.created;
      case 'IN_PROGRESS':
        return RecordStatus.inProgress;
      case 'IN_PROGRESS_IN_ERROR':
        return RecordStatus.inProgressInError;
      case 'SUCCEEDED':
        return RecordStatus.succeeded;
      case 'FAILED':
        return RecordStatus.failed;
    }
    throw Exception('$this is not known in enum RecordStatus');
  }
}

/// Information about a tag, which is a key-value pair.
class RecordTag {
  /// The key for this tag.
  final String? key;

  /// The value for this tag.
  final String? value;

  RecordTag({
    this.key,
    this.value,
  });

  factory RecordTag.fromJson(Map<String, dynamic> json) {
    return RecordTag(
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

class RejectPortfolioShareOutput {
  RejectPortfolioShareOutput();

  factory RejectPortfolioShareOutput.fromJson(Map<String, dynamic> _) {
    return RejectPortfolioShareOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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
        return 'TRUE';
      case Replacement.$false:
        return 'FALSE';
      case Replacement.conditional:
        return 'CONDITIONAL';
    }
  }
}

extension ReplacementFromString on String {
  Replacement toReplacement() {
    switch (this) {
      case 'TRUE':
        return Replacement.$true;
      case 'FALSE':
        return Replacement.$false;
      case 'CONDITIONAL':
        return Replacement.conditional;
    }
    throw Exception('$this is not known in enum Replacement');
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
        return 'NEVER';
      case RequiresRecreation.conditionally:
        return 'CONDITIONALLY';
      case RequiresRecreation.always:
        return 'ALWAYS';
    }
  }
}

extension RequiresRecreationFromString on String {
  RequiresRecreation toRequiresRecreation() {
    switch (this) {
      case 'NEVER':
        return RequiresRecreation.never;
      case 'CONDITIONALLY':
        return RequiresRecreation.conditionally;
      case 'ALWAYS':
        return RequiresRecreation.always;
    }
    throw Exception('$this is not known in enum RequiresRecreation');
  }
}

enum ResourceAttribute {
  properties,
  metadata,
  creationpolicy,
  updatepolicy,
  deletionpolicy,
  tags,
}

extension ResourceAttributeValueExtension on ResourceAttribute {
  String toValue() {
    switch (this) {
      case ResourceAttribute.properties:
        return 'PROPERTIES';
      case ResourceAttribute.metadata:
        return 'METADATA';
      case ResourceAttribute.creationpolicy:
        return 'CREATIONPOLICY';
      case ResourceAttribute.updatepolicy:
        return 'UPDATEPOLICY';
      case ResourceAttribute.deletionpolicy:
        return 'DELETIONPOLICY';
      case ResourceAttribute.tags:
        return 'TAGS';
    }
  }
}

extension ResourceAttributeFromString on String {
  ResourceAttribute toResourceAttribute() {
    switch (this) {
      case 'PROPERTIES':
        return ResourceAttribute.properties;
      case 'METADATA':
        return ResourceAttribute.metadata;
      case 'CREATIONPOLICY':
        return ResourceAttribute.creationpolicy;
      case 'UPDATEPOLICY':
        return ResourceAttribute.updatepolicy;
      case 'DELETIONPOLICY':
        return ResourceAttribute.deletionpolicy;
      case 'TAGS':
        return ResourceAttribute.tags;
    }
    throw Exception('$this is not known in enum ResourceAttribute');
  }
}

/// Information about a resource change that will occur when a plan is executed.
class ResourceChange {
  /// The change action.
  final ChangeAction? action;

  /// Information about the resource changes.
  final List<ResourceChangeDetail>? details;

  /// The ID of the resource, as defined in the CloudFormation template.
  final String? logicalResourceId;

  /// The ID of the resource, if it was already created.
  final String? physicalResourceId;

  /// If the change type is <code>Modify</code>, indicates whether the existing
  /// resource is deleted and replaced with a new one.
  final Replacement? replacement;

  /// The type of resource.
  final String? resourceType;

  /// The change scope.
  final List<ResourceAttribute>? scope;

  ResourceChange({
    this.action,
    this.details,
    this.logicalResourceId,
    this.physicalResourceId,
    this.replacement,
    this.resourceType,
    this.scope,
  });

  factory ResourceChange.fromJson(Map<String, dynamic> json) {
    return ResourceChange(
      action: (json['Action'] as String?)?.toChangeAction(),
      details: (json['Details'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceChangeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      logicalResourceId: json['LogicalResourceId'] as String?,
      physicalResourceId: json['PhysicalResourceId'] as String?,
      replacement: (json['Replacement'] as String?)?.toReplacement(),
      resourceType: json['ResourceType'] as String?,
      scope: (json['Scope'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toResourceAttribute())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final details = this.details;
    final logicalResourceId = this.logicalResourceId;
    final physicalResourceId = this.physicalResourceId;
    final replacement = this.replacement;
    final resourceType = this.resourceType;
    final scope = this.scope;
    return {
      if (action != null) 'Action': action.toValue(),
      if (details != null) 'Details': details,
      if (logicalResourceId != null) 'LogicalResourceId': logicalResourceId,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
      if (replacement != null) 'Replacement': replacement.toValue(),
      if (resourceType != null) 'ResourceType': resourceType,
      if (scope != null) 'Scope': scope.map((e) => e.toValue()).toList(),
    };
  }
}

/// Information about a change to a resource attribute.
class ResourceChangeDetail {
  /// The ID of the entity that caused the change.
  final String? causingEntity;

  /// For static evaluations, the value of the resource attribute will change and
  /// the new value is known. For dynamic evaluations, the value might change, and
  /// any new value will be determined when the plan is updated.
  final EvaluationType? evaluation;

  /// Information about the resource attribute to be modified.
  final ResourceTargetDefinition? target;

  ResourceChangeDetail({
    this.causingEntity,
    this.evaluation,
    this.target,
  });

  factory ResourceChangeDetail.fromJson(Map<String, dynamic> json) {
    return ResourceChangeDetail(
      causingEntity: json['CausingEntity'] as String?,
      evaluation: (json['Evaluation'] as String?)?.toEvaluationType(),
      target: json['Target'] != null
          ? ResourceTargetDefinition.fromJson(
              json['Target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final causingEntity = this.causingEntity;
    final evaluation = this.evaluation;
    final target = this.target;
    return {
      if (causingEntity != null) 'CausingEntity': causingEntity,
      if (evaluation != null) 'Evaluation': evaluation.toValue(),
      if (target != null) 'Target': target,
    };
  }
}

/// Information about a resource.
class ResourceDetail {
  /// The ARN of the resource.
  final String? arn;

  /// The creation time of the resource.
  final DateTime? createdTime;

  /// The description of the resource.
  final String? description;

  /// The identifier of the resource.
  final String? id;

  /// The name of the resource.
  final String? name;

  ResourceDetail({
    this.arn,
    this.createdTime,
    this.description,
    this.id,
    this.name,
  });

  factory ResourceDetail.fromJson(Map<String, dynamic> json) {
    return ResourceDetail(
      arn: json['ARN'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about a change to a resource attribute.
class ResourceTargetDefinition {
  /// The attribute to be changed.
  final ResourceAttribute? attribute;

  /// If the attribute is <code>Properties</code>, the value is the name of the
  /// property. Otherwise, the value is null.
  final String? name;

  /// If the attribute is <code>Properties</code>, indicates whether a change to
  /// this property causes the resource to be re-created.
  final RequiresRecreation? requiresRecreation;

  ResourceTargetDefinition({
    this.attribute,
    this.name,
    this.requiresRecreation,
  });

  factory ResourceTargetDefinition.fromJson(Map<String, dynamic> json) {
    return ResourceTargetDefinition(
      attribute: (json['Attribute'] as String?)?.toResourceAttribute(),
      name: json['Name'] as String?,
      requiresRecreation:
          (json['RequiresRecreation'] as String?)?.toRequiresRecreation(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final name = this.name;
    final requiresRecreation = this.requiresRecreation;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
      if (name != null) 'Name': name,
      if (requiresRecreation != null)
        'RequiresRecreation': requiresRecreation.toValue(),
    };
  }
}

class ScanProvisionedProductsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the provisioned products.
  final List<ProvisionedProductDetail>? provisionedProducts;

  ScanProvisionedProductsOutput({
    this.nextPageToken,
    this.provisionedProducts,
  });

  factory ScanProvisionedProductsOutput.fromJson(Map<String, dynamic> json) {
    return ScanProvisionedProductsOutput(
      nextPageToken: json['NextPageToken'] as String?,
      provisionedProducts: (json['ProvisionedProducts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisionedProductDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final provisionedProducts = this.provisionedProducts;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (provisionedProducts != null)
        'ProvisionedProducts': provisionedProducts,
    };
  }
}

class SearchProductsAsAdminOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the product views.
  final List<ProductViewDetail>? productViewDetails;

  SearchProductsAsAdminOutput({
    this.nextPageToken,
    this.productViewDetails,
  });

  factory SearchProductsAsAdminOutput.fromJson(Map<String, dynamic> json) {
    return SearchProductsAsAdminOutput(
      nextPageToken: json['NextPageToken'] as String?,
      productViewDetails: (json['ProductViewDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ProductViewDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final productViewDetails = this.productViewDetails;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (productViewDetails != null) 'ProductViewDetails': productViewDetails,
    };
  }
}

class SearchProductsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// The product view aggregations.
  final Map<String, List<ProductViewAggregationValue>>? productViewAggregations;

  /// Information about the product views.
  final List<ProductViewSummary>? productViewSummaries;

  SearchProductsOutput({
    this.nextPageToken,
    this.productViewAggregations,
    this.productViewSummaries,
  });

  factory SearchProductsOutput.fromJson(Map<String, dynamic> json) {
    return SearchProductsOutput(
      nextPageToken: json['NextPageToken'] as String?,
      productViewAggregations:
          (json['ProductViewAggregations'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k,
                  (e as List)
                      .whereNotNull()
                      .map((e) => ProductViewAggregationValue.fromJson(
                          e as Map<String, dynamic>))
                      .toList())),
      productViewSummaries: (json['ProductViewSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ProductViewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final productViewAggregations = this.productViewAggregations;
    final productViewSummaries = this.productViewSummaries;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (productViewAggregations != null)
        'ProductViewAggregations': productViewAggregations,
      if (productViewSummaries != null)
        'ProductViewSummaries': productViewSummaries,
    };
  }
}

class SearchProvisionedProductsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String? nextPageToken;

  /// Information about the provisioned products.
  final List<ProvisionedProductAttribute>? provisionedProducts;

  /// The number of provisioned products found.
  final int? totalResultsCount;

  SearchProvisionedProductsOutput({
    this.nextPageToken,
    this.provisionedProducts,
    this.totalResultsCount,
  });

  factory SearchProvisionedProductsOutput.fromJson(Map<String, dynamic> json) {
    return SearchProvisionedProductsOutput(
      nextPageToken: json['NextPageToken'] as String?,
      provisionedProducts: (json['ProvisionedProducts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProvisionedProductAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResultsCount: json['TotalResultsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final provisionedProducts = this.provisionedProducts;
    final totalResultsCount = this.totalResultsCount;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (provisionedProducts != null)
        'ProvisionedProducts': provisionedProducts,
      if (totalResultsCount != null) 'TotalResultsCount': totalResultsCount,
    };
  }
}

/// A self-service action association consisting of the Action ID, the Product
/// ID, and the Provisioning Artifact ID.
class ServiceActionAssociation {
  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  final String productId;

  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  final String provisioningArtifactId;

  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  final String serviceActionId;

  ServiceActionAssociation({
    required this.productId,
    required this.provisioningArtifactId,
    required this.serviceActionId,
  });

  Map<String, dynamic> toJson() {
    final productId = this.productId;
    final provisioningArtifactId = this.provisioningArtifactId;
    final serviceActionId = this.serviceActionId;
    return {
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
      'ServiceActionId': serviceActionId,
    };
  }
}

enum ServiceActionAssociationErrorCode {
  duplicateResource,
  internalFailure,
  limitExceeded,
  resourceNotFound,
  throttling,
  invalidParameter,
}

extension ServiceActionAssociationErrorCodeValueExtension
    on ServiceActionAssociationErrorCode {
  String toValue() {
    switch (this) {
      case ServiceActionAssociationErrorCode.duplicateResource:
        return 'DUPLICATE_RESOURCE';
      case ServiceActionAssociationErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
      case ServiceActionAssociationErrorCode.limitExceeded:
        return 'LIMIT_EXCEEDED';
      case ServiceActionAssociationErrorCode.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case ServiceActionAssociationErrorCode.throttling:
        return 'THROTTLING';
      case ServiceActionAssociationErrorCode.invalidParameter:
        return 'INVALID_PARAMETER';
    }
  }
}

extension ServiceActionAssociationErrorCodeFromString on String {
  ServiceActionAssociationErrorCode toServiceActionAssociationErrorCode() {
    switch (this) {
      case 'DUPLICATE_RESOURCE':
        return ServiceActionAssociationErrorCode.duplicateResource;
      case 'INTERNAL_FAILURE':
        return ServiceActionAssociationErrorCode.internalFailure;
      case 'LIMIT_EXCEEDED':
        return ServiceActionAssociationErrorCode.limitExceeded;
      case 'RESOURCE_NOT_FOUND':
        return ServiceActionAssociationErrorCode.resourceNotFound;
      case 'THROTTLING':
        return ServiceActionAssociationErrorCode.throttling;
      case 'INVALID_PARAMETER':
        return ServiceActionAssociationErrorCode.invalidParameter;
    }
    throw Exception(
        '$this is not known in enum ServiceActionAssociationErrorCode');
  }
}

enum ServiceActionDefinitionKey {
  name,
  version,
  assumeRole,
  parameters,
}

extension ServiceActionDefinitionKeyValueExtension
    on ServiceActionDefinitionKey {
  String toValue() {
    switch (this) {
      case ServiceActionDefinitionKey.name:
        return 'Name';
      case ServiceActionDefinitionKey.version:
        return 'Version';
      case ServiceActionDefinitionKey.assumeRole:
        return 'AssumeRole';
      case ServiceActionDefinitionKey.parameters:
        return 'Parameters';
    }
  }
}

extension ServiceActionDefinitionKeyFromString on String {
  ServiceActionDefinitionKey toServiceActionDefinitionKey() {
    switch (this) {
      case 'Name':
        return ServiceActionDefinitionKey.name;
      case 'Version':
        return ServiceActionDefinitionKey.version;
      case 'AssumeRole':
        return ServiceActionDefinitionKey.assumeRole;
      case 'Parameters':
        return ServiceActionDefinitionKey.parameters;
    }
    throw Exception('$this is not known in enum ServiceActionDefinitionKey');
  }
}

enum ServiceActionDefinitionType {
  ssmAutomation,
}

extension ServiceActionDefinitionTypeValueExtension
    on ServiceActionDefinitionType {
  String toValue() {
    switch (this) {
      case ServiceActionDefinitionType.ssmAutomation:
        return 'SSM_AUTOMATION';
    }
  }
}

extension ServiceActionDefinitionTypeFromString on String {
  ServiceActionDefinitionType toServiceActionDefinitionType() {
    switch (this) {
      case 'SSM_AUTOMATION':
        return ServiceActionDefinitionType.ssmAutomation;
    }
    throw Exception('$this is not known in enum ServiceActionDefinitionType');
  }
}

/// An object containing detailed information about the self-service action.
class ServiceActionDetail {
  /// A map that defines the self-service action.
  final Map<ServiceActionDefinitionKey, String>? definition;

  /// Summary information about the self-service action.
  final ServiceActionSummary? serviceActionSummary;

  ServiceActionDetail({
    this.definition,
    this.serviceActionSummary,
  });

  factory ServiceActionDetail.fromJson(Map<String, dynamic> json) {
    return ServiceActionDetail(
      definition: (json['Definition'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k.toServiceActionDefinitionKey(), e as String)),
      serviceActionSummary: json['ServiceActionSummary'] != null
          ? ServiceActionSummary.fromJson(
              json['ServiceActionSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final serviceActionSummary = this.serviceActionSummary;
    return {
      if (definition != null)
        'Definition': definition.map((k, e) => MapEntry(k.toValue(), e)),
      if (serviceActionSummary != null)
        'ServiceActionSummary': serviceActionSummary,
    };
  }
}

/// Detailed information about the self-service action.
class ServiceActionSummary {
  /// The self-service action definition type. For example,
  /// <code>SSM_AUTOMATION</code>.
  final ServiceActionDefinitionType? definitionType;

  /// The self-service action description.
  final String? description;

  /// The self-service action identifier.
  final String? id;

  /// The self-service action name.
  final String? name;

  ServiceActionSummary({
    this.definitionType,
    this.description,
    this.id,
    this.name,
  });

  factory ServiceActionSummary.fromJson(Map<String, dynamic> json) {
    return ServiceActionSummary(
      definitionType:
          (json['DefinitionType'] as String?)?.toServiceActionDefinitionType(),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitionType = this.definitionType;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (definitionType != null) 'DefinitionType': definitionType.toValue(),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about the portfolio share operation.
class ShareDetails {
  /// List of errors.
  final List<ShareError>? shareErrors;

  /// List of accounts for whom the operation succeeded.
  final List<String>? successfulShares;

  ShareDetails({
    this.shareErrors,
    this.successfulShares,
  });

  factory ShareDetails.fromJson(Map<String, dynamic> json) {
    return ShareDetails(
      shareErrors: (json['ShareErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ShareError.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulShares: (json['SuccessfulShares'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final shareErrors = this.shareErrors;
    final successfulShares = this.successfulShares;
    return {
      if (shareErrors != null) 'ShareErrors': shareErrors,
      if (successfulShares != null) 'SuccessfulShares': successfulShares,
    };
  }
}

/// Errors that occurred during the portfolio share operation.
class ShareError {
  /// List of accounts impacted by the error.
  final List<String>? accounts;

  /// Error type that happened when processing the operation.
  final String? error;

  /// Information about the error.
  final String? message;

  ShareError({
    this.accounts,
    this.error,
    this.message,
  });

  factory ShareError.fromJson(Map<String, dynamic> json) {
    return ShareError(
      accounts: (json['Accounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      error: json['Error'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final error = this.error;
    final message = this.message;
    return {
      if (accounts != null) 'Accounts': accounts,
      if (error != null) 'Error': error,
      if (message != null) 'Message': message,
    };
  }
}

enum ShareStatus {
  notStarted,
  inProgress,
  completed,
  completedWithErrors,
  error,
}

extension ShareStatusValueExtension on ShareStatus {
  String toValue() {
    switch (this) {
      case ShareStatus.notStarted:
        return 'NOT_STARTED';
      case ShareStatus.inProgress:
        return 'IN_PROGRESS';
      case ShareStatus.completed:
        return 'COMPLETED';
      case ShareStatus.completedWithErrors:
        return 'COMPLETED_WITH_ERRORS';
      case ShareStatus.error:
        return 'ERROR';
    }
  }
}

extension ShareStatusFromString on String {
  ShareStatus toShareStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ShareStatus.notStarted;
      case 'IN_PROGRESS':
        return ShareStatus.inProgress;
      case 'COMPLETED':
        return ShareStatus.completed;
      case 'COMPLETED_WITH_ERRORS':
        return ShareStatus.completedWithErrors;
      case 'ERROR':
        return ShareStatus.error;
    }
    throw Exception('$this is not known in enum ShareStatus');
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// A top level <code>ProductViewDetail</code> response containing details about
/// the product’s connection. Service Catalog returns this field for the
/// <code>CreateProduct</code>, <code>UpdateProduct</code>,
/// <code>DescribeProductAsAdmin</code>, and <code>SearchProductAsAdmin</code>
/// APIs. This response contains the same fields as the
/// <code>ConnectionParameters</code> request, with the addition of the
/// <code>LastSync</code> response.
class SourceConnection {
  /// The connection details based on the connection <code>Type</code>.
  final SourceConnectionParameters connectionParameters;

  /// The only supported <code>SourceConnection</code> type is Codestar.
  final SourceType? type;

  SourceConnection({
    required this.connectionParameters,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final connectionParameters = this.connectionParameters;
    final type = this.type;
    return {
      'ConnectionParameters': connectionParameters,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Provides details about the configured <code>SourceConnection</code>.
class SourceConnectionDetail {
  /// The connection details based on the connection <code>Type</code>.
  final SourceConnectionParameters? connectionParameters;

  /// Provides details about the product's connection sync and contains the
  /// following sub-fields.
  ///
  /// <ul>
  /// <li>
  /// <code>LastSyncTime</code>
  /// </li>
  /// <li>
  /// <code>LastSyncStatus</code>
  /// </li>
  /// <li>
  /// <code>LastSyncStatusMessage</code>
  /// </li>
  /// <li>
  /// <code>LastSuccessfulSyncTime</code>
  /// </li>
  /// <li>
  /// <code>LastSuccessfulSyncProvisioningArtifactID</code>
  /// </li>
  /// </ul>
  final LastSync? lastSync;

  /// The only supported <code>SourceConnection</code> type is Codestar.
  final SourceType? type;

  SourceConnectionDetail({
    this.connectionParameters,
    this.lastSync,
    this.type,
  });

  factory SourceConnectionDetail.fromJson(Map<String, dynamic> json) {
    return SourceConnectionDetail(
      connectionParameters: json['ConnectionParameters'] != null
          ? SourceConnectionParameters.fromJson(
              json['ConnectionParameters'] as Map<String, dynamic>)
          : null,
      lastSync: json['LastSync'] != null
          ? LastSync.fromJson(json['LastSync'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionParameters = this.connectionParameters;
    final lastSync = this.lastSync;
    final type = this.type;
    return {
      if (connectionParameters != null)
        'ConnectionParameters': connectionParameters,
      if (lastSync != null) 'LastSync': lastSync,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Provides connection details.
class SourceConnectionParameters {
  /// Provides <code>ConnectionType</code> details.
  final CodeStarParameters? codeStar;

  SourceConnectionParameters({
    this.codeStar,
  });

  factory SourceConnectionParameters.fromJson(Map<String, dynamic> json) {
    return SourceConnectionParameters(
      codeStar: json['CodeStar'] != null
          ? CodeStarParameters.fromJson(
              json['CodeStar'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final codeStar = this.codeStar;
    return {
      if (codeStar != null) 'CodeStar': codeStar,
    };
  }
}

enum SourceType {
  codestar,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.codestar:
        return 'CODESTAR';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'CODESTAR':
        return SourceType.codestar;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// An CloudFormation stack, in a specific account and Region, that's part of a
/// stack set operation. A stack instance is a reference to an attempted or
/// actual stack in a given account within a given Region. A stack instance can
/// exist without a stack—for example, if the stack couldn't be created for some
/// reason. A stack instance is associated with only one stack set. Each stack
/// instance contains the ID of its associated stack set, as well as the ID of
/// the actual stack and the stack status.
class StackInstance {
  /// The name of the Amazon Web Services account that the stack instance is
  /// associated with.
  final String? account;

  /// The name of the Amazon Web Services Region that the stack instance is
  /// associated with.
  final String? region;

  /// The status of the stack instance, in terms of its synchronization with its
  /// associated stack set.
  ///
  /// <ul>
  /// <li>
  /// <code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has
  /// failed and left the stack in an unstable state. Stacks in this state are
  /// excluded from further <code>UpdateStackSet</code> operations. You might need
  /// to perform a <code>DeleteStackInstances</code> operation, with
  /// <code>RetainStacks</code> set to true, to delete the stack instance, and
  /// then delete the stack manually.
  /// </li>
  /// <li>
  /// <code>OUTDATED</code>: The stack isn't currently up to date with the stack
  /// set because either the associated stack failed during a
  /// <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation, or the
  /// stack was part of a <code>CreateStackSet</code> or
  /// <code>UpdateStackSet</code> operation that failed or was stopped before the
  /// stack was created or updated.
  /// </li>
  /// <li>
  /// <code>CURRENT</code>: The stack is currently up to date with the stack set.
  /// </li>
  /// </ul>
  final StackInstanceStatus? stackInstanceStatus;

  StackInstance({
    this.account,
    this.region,
    this.stackInstanceStatus,
  });

  factory StackInstance.fromJson(Map<String, dynamic> json) {
    return StackInstance(
      account: json['Account'] as String?,
      region: json['Region'] as String?,
      stackInstanceStatus:
          (json['StackInstanceStatus'] as String?)?.toStackInstanceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final region = this.region;
    final stackInstanceStatus = this.stackInstanceStatus;
    return {
      if (account != null) 'Account': account,
      if (region != null) 'Region': region,
      if (stackInstanceStatus != null)
        'StackInstanceStatus': stackInstanceStatus.toValue(),
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

enum StackSetOperationType {
  create,
  update,
  delete,
}

extension StackSetOperationTypeValueExtension on StackSetOperationType {
  String toValue() {
    switch (this) {
      case StackSetOperationType.create:
        return 'CREATE';
      case StackSetOperationType.update:
        return 'UPDATE';
      case StackSetOperationType.delete:
        return 'DELETE';
    }
  }
}

extension StackSetOperationTypeFromString on String {
  StackSetOperationType toStackSetOperationType() {
    switch (this) {
      case 'CREATE':
        return StackSetOperationType.create;
      case 'UPDATE':
        return StackSetOperationType.update;
      case 'DELETE':
        return StackSetOperationType.delete;
    }
    throw Exception('$this is not known in enum StackSetOperationType');
  }
}

enum Status {
  available,
  creating,
  failed,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.available:
        return 'AVAILABLE';
      case Status.creating:
        return 'CREATING';
      case Status.failed:
        return 'FAILED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'AVAILABLE':
        return Status.available;
      case 'CREATING':
        return Status.creating;
      case 'FAILED':
        return Status.failed;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// Information about a tag. A tag is a key-value pair. Tags are propagated to
/// the resources created when provisioning a product.
class Tag {
  /// The tag key.
  final String key;

  /// The value for this key.
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

/// Information about a TagOption.
class TagOptionDetail {
  /// The TagOption active state.
  final bool? active;

  /// The TagOption identifier.
  final String? id;

  /// The TagOption key.
  final String? key;

  /// The Amazon Web Services account Id of the owner account that created the
  /// TagOption.
  final String? owner;

  /// The TagOption value.
  final String? value;

  TagOptionDetail({
    this.active,
    this.id,
    this.key,
    this.owner,
    this.value,
  });

  factory TagOptionDetail.fromJson(Map<String, dynamic> json) {
    return TagOptionDetail(
      active: json['Active'] as bool?,
      id: json['Id'] as String?,
      key: json['Key'] as String?,
      owner: json['Owner'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final id = this.id;
    final key = this.key;
    final owner = this.owner;
    final value = this.value;
    return {
      if (active != null) 'Active': active,
      if (id != null) 'Id': id,
      if (key != null) 'Key': key,
      if (owner != null) 'Owner': owner,
      if (value != null) 'Value': value,
    };
  }
}

/// Summary information about a TagOption.
class TagOptionSummary {
  /// The TagOption key.
  final String? key;

  /// The TagOption value.
  final List<String>? values;

  TagOptionSummary({
    this.key,
    this.values,
  });

  factory TagOptionSummary.fromJson(Map<String, dynamic> json) {
    return TagOptionSummary(
      key: json['Key'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      if (key != null) 'Key': key,
      if (values != null) 'Values': values,
    };
  }
}

class TerminateProvisionedProductOutput {
  /// Information about the result of this request.
  final RecordDetail? recordDetail;

  TerminateProvisionedProductOutput({
    this.recordDetail,
  });

  factory TerminateProvisionedProductOutput.fromJson(
      Map<String, dynamic> json) {
    return TerminateProvisionedProductOutput(
      recordDetail: json['RecordDetail'] != null
          ? RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordDetail = this.recordDetail;
    return {
      if (recordDetail != null) 'RecordDetail': recordDetail,
    };
  }
}

/// The unique key-value pair for a tag that identifies provisioned product
/// resources.
class UniqueTagResourceIdentifier {
  /// A unique key that's attached to a resource.
  final String? key;

  /// A unique value that's attached to a resource.
  final String? value;

  UniqueTagResourceIdentifier({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class UpdateConstraintOutput {
  /// Information about the constraint.
  final ConstraintDetail? constraintDetail;

  /// The constraint parameters.
  final String? constraintParameters;

  /// The status of the current request.
  final Status? status;

  UpdateConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });

  factory UpdateConstraintOutput.fromJson(Map<String, dynamic> json) {
    return UpdateConstraintOutput(
      constraintDetail: json['ConstraintDetail'] != null
          ? ConstraintDetail.fromJson(
              json['ConstraintDetail'] as Map<String, dynamic>)
          : null,
      constraintParameters: json['ConstraintParameters'] as String?,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final constraintDetail = this.constraintDetail;
    final constraintParameters = this.constraintParameters;
    final status = this.status;
    return {
      if (constraintDetail != null) 'ConstraintDetail': constraintDetail,
      if (constraintParameters != null)
        'ConstraintParameters': constraintParameters,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class UpdatePortfolioOutput {
  /// Information about the portfolio.
  final PortfolioDetail? portfolioDetail;

  /// Information about the tags associated with the portfolio.
  final List<Tag>? tags;

  UpdatePortfolioOutput({
    this.portfolioDetail,
    this.tags,
  });

  factory UpdatePortfolioOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePortfolioOutput(
      portfolioDetail: json['PortfolioDetail'] != null
          ? PortfolioDetail.fromJson(
              json['PortfolioDetail'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final portfolioDetail = this.portfolioDetail;
    final tags = this.tags;
    return {
      if (portfolioDetail != null) 'PortfolioDetail': portfolioDetail,
      if (tags != null) 'Tags': tags,
    };
  }
}

class UpdatePortfolioShareOutput {
  /// The token that tracks the status of the <code>UpdatePortfolioShare</code>
  /// operation for external account to account or organizational type sharing.
  final String? portfolioShareToken;

  /// The status of <code>UpdatePortfolioShare</code> operation. You can also
  /// obtain the operation status using <code>DescribePortfolioShareStatus</code>
  /// API.
  final ShareStatus? status;

  UpdatePortfolioShareOutput({
    this.portfolioShareToken,
    this.status,
  });

  factory UpdatePortfolioShareOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePortfolioShareOutput(
      portfolioShareToken: json['PortfolioShareToken'] as String?,
      status: (json['Status'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final portfolioShareToken = this.portfolioShareToken;
    final status = this.status;
    return {
      if (portfolioShareToken != null)
        'PortfolioShareToken': portfolioShareToken,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class UpdateProductOutput {
  /// Information about the product view.
  final ProductViewDetail? productViewDetail;

  /// Information about the tags associated with the product.
  final List<Tag>? tags;

  UpdateProductOutput({
    this.productViewDetail,
    this.tags,
  });

  factory UpdateProductOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProductOutput(
      productViewDetail: json['ProductViewDetail'] != null
          ? ProductViewDetail.fromJson(
              json['ProductViewDetail'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final productViewDetail = this.productViewDetail;
    final tags = this.tags;
    return {
      if (productViewDetail != null) 'ProductViewDetail': productViewDetail,
      if (tags != null) 'Tags': tags,
    };
  }
}

class UpdateProvisionedProductOutput {
  /// Information about the result of the request.
  final RecordDetail? recordDetail;

  UpdateProvisionedProductOutput({
    this.recordDetail,
  });

  factory UpdateProvisionedProductOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProvisionedProductOutput(
      recordDetail: json['RecordDetail'] != null
          ? RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordDetail = this.recordDetail;
    return {
      if (recordDetail != null) 'RecordDetail': recordDetail,
    };
  }
}

class UpdateProvisionedProductPropertiesOutput {
  /// The provisioned product identifier.
  final String? provisionedProductId;

  /// A map that contains the properties updated.
  final Map<PropertyKey, String>? provisionedProductProperties;

  /// The identifier of the record.
  final String? recordId;

  /// The status of the request.
  final RecordStatus? status;

  UpdateProvisionedProductPropertiesOutput({
    this.provisionedProductId,
    this.provisionedProductProperties,
    this.recordId,
    this.status,
  });

  factory UpdateProvisionedProductPropertiesOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateProvisionedProductPropertiesOutput(
      provisionedProductId: json['ProvisionedProductId'] as String?,
      provisionedProductProperties:
          (json['ProvisionedProductProperties'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toPropertyKey(), e as String)),
      recordId: json['RecordId'] as String?,
      status: (json['Status'] as String?)?.toRecordStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedProductId = this.provisionedProductId;
    final provisionedProductProperties = this.provisionedProductProperties;
    final recordId = this.recordId;
    final status = this.status;
    return {
      if (provisionedProductId != null)
        'ProvisionedProductId': provisionedProductId,
      if (provisionedProductProperties != null)
        'ProvisionedProductProperties': provisionedProductProperties
            .map((k, e) => MapEntry(k.toValue(), e)),
      if (recordId != null) 'RecordId': recordId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class UpdateProvisioningArtifactOutput {
  /// The URL of the CloudFormation template in Amazon S3 or GitHub in JSON
  /// format.
  final Map<String, String>? info;

  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail? provisioningArtifactDetail;

  /// The status of the current request.
  final Status? status;

  UpdateProvisioningArtifactOutput({
    this.info,
    this.provisioningArtifactDetail,
    this.status,
  });

  factory UpdateProvisioningArtifactOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProvisioningArtifactOutput(
      info: (json['Info'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      provisioningArtifactDetail: json['ProvisioningArtifactDetail'] != null
          ? ProvisioningArtifactDetail.fromJson(
              json['ProvisioningArtifactDetail'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final info = this.info;
    final provisioningArtifactDetail = this.provisioningArtifactDetail;
    final status = this.status;
    return {
      if (info != null) 'Info': info,
      if (provisioningArtifactDetail != null)
        'ProvisioningArtifactDetail': provisioningArtifactDetail,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The parameter key-value pair used to update a provisioned product.
class UpdateProvisioningParameter {
  /// The parameter key.
  final String? key;

  /// If set to true, <code>Value</code> is ignored and the previous parameter
  /// value is kept.
  final bool? usePreviousValue;

  /// The parameter value.
  final String? value;

  UpdateProvisioningParameter({
    this.key,
    this.usePreviousValue,
    this.value,
  });

  factory UpdateProvisioningParameter.fromJson(Map<String, dynamic> json) {
    return UpdateProvisioningParameter(
      key: json['Key'] as String?,
      usePreviousValue: json['UsePreviousValue'] as bool?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final usePreviousValue = this.usePreviousValue;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (usePreviousValue != null) 'UsePreviousValue': usePreviousValue,
      if (value != null) 'Value': value,
    };
  }
}

/// The user-defined preferences that will be applied when updating a
/// provisioned product. Not all preferences are applicable to all provisioned
/// product types.
class UpdateProvisioningPreferences {
  /// One or more Amazon Web Services accounts that will have access to the
  /// provisioned product.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// The Amazon Web Services accounts specified should be within the list of
  /// accounts in the <code>STACKSET</code> constraint. To get the list of
  /// accounts in the <code>STACKSET</code> constraint, use the
  /// <code>DescribeProvisioningParameters</code> operation.
  ///
  /// If no values are specified, the default value is all accounts from the
  /// <code>STACKSET</code> constraint.
  final List<String>? stackSetAccounts;

  /// The number of accounts, per Region, for which this operation can fail before
  /// Service Catalog stops the operation in that Region. If the operation is
  /// stopped in a Region, Service Catalog doesn't attempt the operation in any
  /// subsequent Regions.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  ///
  /// The default value is <code>0</code> if no value is specified.
  final int? stackSetFailureToleranceCount;

  /// The percentage of accounts, per Region, for which this stack operation can
  /// fail before Service Catalog stops the operation in that Region. If the
  /// operation is stopped in a Region, Service Catalog doesn't attempt the
  /// operation in any subsequent Regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// Service Catalog rounds down to the next whole number.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  final int? stackSetFailureTolerancePercentage;

  /// The maximum number of accounts in which to perform this operation at one
  /// time. This is dependent on the value of
  /// <code>StackSetFailureToleranceCount</code>.
  /// <code>StackSetMaxConcurrentCount</code> is at most one more than the
  /// <code>StackSetFailureToleranceCount</code>.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of accounts
  /// acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either <code>StackSetMaxConcurrentCount</code>
  /// or <code>StackSetMaxConcurrentPercentage</code>, but not both.
  final int? stackSetMaxConcurrencyCount;

  /// The maximum percentage of accounts in which to perform this operation at one
  /// time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// Service Catalog rounds down to the next whole number. This is true except in
  /// cases where rounding down would result is zero. In this case, Service
  /// Catalog sets the number as <code>1</code> instead.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of accounts
  /// acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either <code>StackSetMaxConcurrentCount</code>
  /// or <code>StackSetMaxConcurrentPercentage</code>, but not both.
  final int? stackSetMaxConcurrencyPercentage;

  /// Determines what action Service Catalog performs to a stack set or a stack
  /// instance represented by the provisioned product. The default value is
  /// <code>UPDATE</code> if nothing is specified.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  /// <dl> <dt>CREATE</dt> <dd>
  /// Creates a new stack instance in the stack set represented by the provisioned
  /// product. In this case, only new stack instances are created based on
  /// accounts and Regions; if new ProductId or ProvisioningArtifactID are passed,
  /// they will be ignored.
  /// </dd> <dt>UPDATE</dt> <dd>
  /// Updates the stack set represented by the provisioned product and also its
  /// stack instances.
  /// </dd> <dt>DELETE</dt> <dd>
  /// Deletes a stack instance in the stack set represented by the provisioned
  /// product.
  /// </dd> </dl>
  final StackSetOperationType? stackSetOperationType;

  /// One or more Amazon Web Services Regions where the provisioned product will
  /// be available.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// The specified Regions should be within the list of Regions from the
  /// <code>STACKSET</code> constraint. To get the list of Regions in the
  /// <code>STACKSET</code> constraint, use the
  /// <code>DescribeProvisioningParameters</code> operation.
  ///
  /// If no values are specified, the default value is all Regions from the
  /// <code>STACKSET</code> constraint.
  final List<String>? stackSetRegions;

  UpdateProvisioningPreferences({
    this.stackSetAccounts,
    this.stackSetFailureToleranceCount,
    this.stackSetFailureTolerancePercentage,
    this.stackSetMaxConcurrencyCount,
    this.stackSetMaxConcurrencyPercentage,
    this.stackSetOperationType,
    this.stackSetRegions,
  });

  Map<String, dynamic> toJson() {
    final stackSetAccounts = this.stackSetAccounts;
    final stackSetFailureToleranceCount = this.stackSetFailureToleranceCount;
    final stackSetFailureTolerancePercentage =
        this.stackSetFailureTolerancePercentage;
    final stackSetMaxConcurrencyCount = this.stackSetMaxConcurrencyCount;
    final stackSetMaxConcurrencyPercentage =
        this.stackSetMaxConcurrencyPercentage;
    final stackSetOperationType = this.stackSetOperationType;
    final stackSetRegions = this.stackSetRegions;
    return {
      if (stackSetAccounts != null) 'StackSetAccounts': stackSetAccounts,
      if (stackSetFailureToleranceCount != null)
        'StackSetFailureToleranceCount': stackSetFailureToleranceCount,
      if (stackSetFailureTolerancePercentage != null)
        'StackSetFailureTolerancePercentage':
            stackSetFailureTolerancePercentage,
      if (stackSetMaxConcurrencyCount != null)
        'StackSetMaxConcurrencyCount': stackSetMaxConcurrencyCount,
      if (stackSetMaxConcurrencyPercentage != null)
        'StackSetMaxConcurrencyPercentage': stackSetMaxConcurrencyPercentage,
      if (stackSetOperationType != null)
        'StackSetOperationType': stackSetOperationType.toValue(),
      if (stackSetRegions != null) 'StackSetRegions': stackSetRegions,
    };
  }
}

class UpdateServiceActionOutput {
  /// Detailed information about the self-service action.
  final ServiceActionDetail? serviceActionDetail;

  UpdateServiceActionOutput({
    this.serviceActionDetail,
  });

  factory UpdateServiceActionOutput.fromJson(Map<String, dynamic> json) {
    return UpdateServiceActionOutput(
      serviceActionDetail: json['ServiceActionDetail'] != null
          ? ServiceActionDetail.fromJson(
              json['ServiceActionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceActionDetail = this.serviceActionDetail;
    return {
      if (serviceActionDetail != null)
        'ServiceActionDetail': serviceActionDetail,
    };
  }
}

class UpdateTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail? tagOptionDetail;

  UpdateTagOptionOutput({
    this.tagOptionDetail,
  });

  factory UpdateTagOptionOutput.fromJson(Map<String, dynamic> json) {
    return UpdateTagOptionOutput(
      tagOptionDetail: json['TagOptionDetail'] != null
          ? TagOptionDetail.fromJson(
              json['TagOptionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tagOptionDetail = this.tagOptionDetail;
    return {
      if (tagOptionDetail != null) 'TagOptionDetail': tagOptionDetail,
    };
  }
}

/// Additional information provided by the administrator.
class UsageInstruction {
  /// The usage instruction type for the value.
  final String? type;

  /// The usage instruction value for this type.
  final String? value;

  UsageInstruction({
    this.type,
    this.value,
  });

  factory UsageInstruction.fromJson(Map<String, dynamic> json) {
    return UsageInstruction(
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

class DuplicateResourceException extends _s.GenericAwsException {
  DuplicateResourceException({String? type, String? message})
      : super(type: type, code: 'DuplicateResourceException', message: message);
}

class InvalidParametersException extends _s.GenericAwsException {
  InvalidParametersException({String? type, String? message})
      : super(type: type, code: 'InvalidParametersException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OperationNotSupportedException extends _s.GenericAwsException {
  OperationNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotSupportedException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TagOptionNotMigratedException extends _s.GenericAwsException {
  TagOptionNotMigratedException({String? type, String? message})
      : super(
            type: type,
            code: 'TagOptionNotMigratedException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DuplicateResourceException': (type, message) =>
      DuplicateResourceException(type: type, message: message),
  'InvalidParametersException': (type, message) =>
      InvalidParametersException(type: type, message: message),
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'OperationNotSupportedException': (type, message) =>
      OperationNotSupportedException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TagOptionNotMigratedException': (type, message) =>
      TagOptionNotMigratedException(type: type, message: message),
};
