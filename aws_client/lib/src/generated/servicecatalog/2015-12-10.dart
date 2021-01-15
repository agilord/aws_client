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

part '2015-12-10.g.dart';

/// <a href="https://aws.amazon.com/servicecatalog/">AWS Service Catalog</a>
/// enables organizations to create and manage catalogs of IT services that are
/// approved for AWS. To get the most out of this documentation, you should be
/// familiar with the terminology discussed in <a
/// href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/what-is_concepts.html">AWS
/// Service Catalog Concepts</a>.
class ServiceCatalog {
  final _s.JsonProtocol _protocol;
  ServiceCatalog({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'servicecatalog',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String portfolioId,
    String acceptLanguage,
    PortfolioShareType portfolioShareType,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.AcceptPortfolioShare'
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
        if (portfolioShareType != null)
          'PortfolioShareType': portfolioShareType.toValue(),
      },
    );

    return AcceptPortfolioShareOutput.fromJson(jsonResponse.body);
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
    @_s.required String budgetName,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.AssociateBudgetWithResource'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateBudgetWithResourceOutput.fromJson(jsonResponse.body);
  }

  /// Associates the specified principal ARN with the specified portfolio.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [principalARN] :
  /// The ARN of the principal (IAM user, role, or group).
  ///
  /// Parameter [principalType] :
  /// The principal type. The supported value is <code>IAM</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> associatePrincipalWithPortfolio({
    @_s.required String portfolioId,
    @_s.required String principalARN,
    @_s.required PrincipalType principalType,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalARN, 'principalARN');
    _s.validateStringLength(
      'principalARN',
      principalARN,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalType, 'principalType');
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociatePrincipalWithPortfolio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        'PrincipalARN': principalARN,
        'PrincipalType': principalType?.toValue() ?? '',
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return AssociatePrincipalWithPortfolioOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String portfolioId,
    @_s.required String productId,
    String acceptLanguage,
    String sourcePortfolioId,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'sourcePortfolioId',
      sourcePortfolioId,
      1,
      100,
    );
    _s.validateStringPattern(
      'sourcePortfolioId',
      sourcePortfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociateProductWithPortfolio'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateProductWithPortfolioOutput.fromJson(jsonResponse.body);
  }

  /// Associates a self-service action with a provisioning artifact.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DuplicateResourceException].
  /// May throw [LimitExceededException].
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> associateServiceActionWithProvisioningArtifact({
    @_s.required String productId,
    @_s.required String provisioningArtifactId,
    @_s.required String serviceActionId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisioningArtifactId, 'provisioningArtifactId');
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceActionId, 'serviceActionId');
    _s.validateStringLength(
      'serviceActionId',
      serviceActionId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceActionId',
      serviceActionId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociateServiceActionWithProvisioningArtifact'
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
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return AssociateServiceActionWithProvisioningArtifactOutput.fromJson(
        jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required String tagOptionId,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(tagOptionId, 'tagOptionId');
    _s.validateStringLength(
      'tagOptionId',
      tagOptionId,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.AssociateTagOptionWithResource'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateTagOptionWithResourceOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<BatchAssociateServiceActionWithProvisioningArtifactOutput>
      batchAssociateServiceActionWithProvisioningArtifact({
    @_s.required List<ServiceActionAssociation> serviceActionAssociations,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(
        serviceActionAssociations, 'serviceActionAssociations');
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<BatchDisassociateServiceActionFromProvisioningArtifactOutput>
      batchDisassociateServiceActionFromProvisioningArtifact({
    @_s.required List<ServiceActionAssociation> serviceActionAssociations,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(
        serviceActionAssociations, 'serviceActionAssociations');
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
  /// copy a product to the same region or another region.
  ///
  /// This operation is performed asynchronously. To track the progress of the
  /// operation, use <a>DescribeCopyProductStatus</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [sourceProductArn] :
  /// The Amazon Resource Name (ARN) of the source product.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String idempotencyToken,
    @_s.required String sourceProductArn,
    String acceptLanguage,
    List<CopyOption> copyOptions,
    List<Map<ProvisioningArtifactPropertyName, String>>
        sourceProvisioningArtifactIdentifiers,
    String targetProductId,
    String targetProductName,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceProductArn, 'sourceProductArn');
    _s.validateStringLength(
      'sourceProductArn',
      sourceProductArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sourceProductArn',
      sourceProductArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'targetProductId',
      targetProductId,
      1,
      100,
    );
    _s.validateStringPattern(
      'targetProductId',
      targetProductId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'targetProductName',
      targetProductName,
      0,
      8191,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'SourceProductArn': sourceProductArn,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (copyOptions != null)
          'CopyOptions': copyOptions.map((e) => e?.toValue() ?? '').toList(),
        if (sourceProvisioningArtifactIdentifiers != null)
          'SourceProvisioningArtifactIdentifiers':
              sourceProvisioningArtifactIdentifiers
                  .map((e) => e?.map((k, e) => MapEntry(k.toValue(), e)))
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
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
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
  /// Products with a <code>STACKSET</code> constraint will launch an AWS
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
  /// <code>en</code> - English (default)
  /// </li>
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
  Future<CreateConstraintOutput> createConstraint({
    @_s.required String idempotencyToken,
    @_s.required String parameters,
    @_s.required String portfolioId,
    @_s.required String productId,
    @_s.required String type,
    String acceptLanguage,
    String description,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parameters, 'parameters');
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'type',
      type,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2000,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'Parameters': parameters,
        'PortfolioId': portfolioId,
        'ProductId': productId,
        'Type': type,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
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
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [providerName] :
  /// The name of the portfolio provider.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreatePortfolioOutput> createPortfolio({
    @_s.required String displayName,
    @_s.required String idempotencyToken,
    @_s.required String providerName,
    String acceptLanguage,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(displayName, 'displayName');
    _s.validateStringLength(
      'displayName',
      displayName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(providerName, 'providerName');
    _s.validateStringLength(
      'providerName',
      providerName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2000,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'ProviderName': providerName,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID. For example, <code>123456789012</code>.
  ///
  /// Parameter [organizationNode] :
  /// The organization node to whom you are going to share. If
  /// <code>OrganizationNode</code> is passed in, <code>PortfolioShare</code>
  /// will be created for the node an ListOrganizationPortfolioAccessd its
  /// children (when applies), and a <code>PortfolioShareToken</code> will be
  /// returned in the output in order for the administrator to monitor the
  /// status of the <code>PortfolioShare</code> creation process.
  ///
  /// Parameter [shareTagOptions] :
  /// Enables or disables <code>TagOptions </code> sharing when creating the
  /// portfolio share. If this flag is not provided, TagOptions sharing is
  /// disabled.
  Future<CreatePortfolioShareOutput> createPortfolioShare({
    @_s.required String portfolioId,
    String acceptLanguage,
    String accountId,
    OrganizationNode organizationNode,
    bool shareTagOptions,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^[0-9]{12}$''',
    );
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
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
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
  /// Parameter [provisioningArtifactParameters] :
  /// The configuration of the provisioning artifact.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String idempotencyToken,
    @_s.required String name,
    @_s.required String owner,
    @_s.required ProductType productType,
    @_s.required ProvisioningArtifactProperties provisioningArtifactParameters,
    String acceptLanguage,
    String description,
    String distributor,
    String supportDescription,
    String supportEmail,
    String supportUrl,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      8191,
      isRequired: true,
    );
    ArgumentError.checkNotNull(owner, 'owner');
    _s.validateStringLength(
      'owner',
      owner,
      0,
      8191,
      isRequired: true,
    );
    ArgumentError.checkNotNull(productType, 'productType');
    ArgumentError.checkNotNull(
        provisioningArtifactParameters, 'provisioningArtifactParameters');
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      8191,
    );
    _s.validateStringLength(
      'distributor',
      distributor,
      0,
      8191,
    );
    _s.validateStringLength(
      'supportDescription',
      supportDescription,
      0,
      8191,
    );
    _s.validateStringLength(
      'supportEmail',
      supportEmail,
      0,
      254,
    );
    _s.validateStringLength(
      'supportUrl',
      supportUrl,
      0,
      2083,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'Name': name,
        'Owner': owner,
        'ProductType': productType?.toValue() ?? '',
        'ProvisioningArtifactParameters': provisioningArtifactParameters,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
        if (distributor != null) 'Distributor': distributor,
        if (supportDescription != null)
          'SupportDescription': supportDescription,
        if (supportEmail != null) 'SupportEmail': supportEmail,
        if (supportUrl != null) 'SupportUrl': supportUrl,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateProductOutput.fromJson(jsonResponse.body);
  }

  /// Creates a plan. A plan includes the list of resources to be created (when
  /// provisioning a new product) or modified (when updating a provisioned
  /// product) when the plan is executed.
  ///
  /// You can create one plan per provisioned product. To create a plan for an
  /// existing provisioned product, the product status must be AVAILBLE or
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
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
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
  /// unique for the AWS account and cannot be updated after the product is
  /// provisioned.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String idempotencyToken,
    @_s.required String planName,
    @_s.required ProvisionedProductPlanType planType,
    @_s.required String productId,
    @_s.required String provisionedProductName,
    @_s.required String provisioningArtifactId,
    String acceptLanguage,
    List<String> notificationArns,
    String pathId,
    List<UpdateProvisioningParameter> provisioningParameters,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(planName, 'planName');
    ArgumentError.checkNotNull(planType, 'planType');
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisionedProductName, 'provisionedProductName');
    _s.validateStringLength(
      'provisionedProductName',
      provisionedProductName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionedProductName',
      provisionedProductName,
      r'''[a-zA-Z0-9][a-zA-Z0-9._-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisioningArtifactId, 'provisioningArtifactId');
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'pathId',
      pathId,
      1,
      100,
    );
    _s.validateStringPattern(
      'pathId',
      pathId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'PlanName': planName,
        'PlanType': planType?.toValue() ?? '',
        'ProductId': productId,
        'ProvisionedProductName': provisionedProductName,
        'ProvisioningArtifactId': provisioningArtifactId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
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
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<CreateProvisioningArtifactOutput> createProvisioningArtifact({
    @_s.required String idempotencyToken,
    @_s.required ProvisioningArtifactProperties parameters,
    @_s.required String productId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parameters, 'parameters');
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'Parameters': parameters,
        'ProductId': productId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
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
  /// The name of the AWS Systems Manager document (SSM document). For example,
  /// <code>AWS-RestartEC2Instance</code>.
  ///
  /// If you are using a shared SSM document, you must provide the ARN instead
  /// of the name.
  /// </dd> <dt>Version</dt> <dd>
  /// The AWS Systems Manager automation document version. For example,
  /// <code>"Version": "1"</code>
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
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [name] :
  /// The self-service action name.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
  Future<CreateServiceActionOutput> createServiceAction({
    @_s.required Map<ServiceActionDefinitionKey, String> definition,
    @_s.required ServiceActionDefinitionType definitionType,
    @_s.required String idempotencyToken,
    @_s.required String name,
    String acceptLanguage,
    String description,
  }) async {
    ArgumentError.checkNotNull(definition, 'definition');
    ArgumentError.checkNotNull(definitionType, 'definitionType');
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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
        'Definition': definition?.map((k, e) => MapEntry(k.toValue(), e)),
        'DefinitionType': definitionType?.toValue() ?? '',
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'Name': name,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (description != null) 'Description': description,
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
    @_s.required String key,
    @_s.required String value,
  }) async {
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'key',
      key,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(value, 'value');
    _s.validateStringLength(
      'value',
      value,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'value',
      value,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deleteConstraint({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteConstraint'
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

    return DeleteConstraintOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deletePortfolio({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeletePortfolio'
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

    return DeletePortfolioOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID.
  ///
  /// Parameter [organizationNode] :
  /// The organization node to whom you are going to stop sharing.
  Future<DeletePortfolioShareOutput> deletePortfolioShare({
    @_s.required String portfolioId,
    String acceptLanguage,
    String accountId,
    OrganizationNode organizationNode,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^[0-9]{12}$''',
    );
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deleteProduct({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteProduct'
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

    return DeleteProductOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [ignoreErrors] :
  /// If set to true, AWS Service Catalog stops managing the specified
  /// provisioned product even if it cannot delete the underlying resources.
  Future<void> deleteProvisionedProductPlan({
    @_s.required String planId,
    String acceptLanguage,
    bool ignoreErrors,
  }) async {
    ArgumentError.checkNotNull(planId, 'planId');
    _s.validateStringLength(
      'planId',
      planId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'planId',
      planId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteProvisionedProductPlan'
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
        if (ignoreErrors != null) 'IgnoreErrors': ignoreErrors,
      },
    );

    return DeleteProvisionedProductPlanOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deleteProvisioningArtifact({
    @_s.required String productId,
    @_s.required String provisioningArtifactId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisioningArtifactId, 'provisioningArtifactId');
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteProvisioningArtifact'
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
      },
    );

    return DeleteProvisioningArtifactOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> deleteServiceAction({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteServiceAction'
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

    return DeleteServiceActionOutput.fromJson(jsonResponse.body);
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.DeleteTagOption'
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

    return DeleteTagOptionOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeConstraintOutput> describeConstraint({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeCopyProductStatusOutput> describeCopyProductStatus({
    @_s.required String copyProductToken,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(copyProductToken, 'copyProductToken');
    _s.validateStringLength(
      'copyProductToken',
      copyProductToken,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'copyProductToken',
      copyProductToken,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribePortfolioOutput> describePortfolio({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
    @_s.required String portfolioShareToken,
  }) async {
    ArgumentError.checkNotNull(portfolioShareToken, 'portfolioShareToken');
    _s.validateStringLength(
      'portfolioShareToken',
      portfolioShareToken,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioShareToken',
      portfolioShareToken,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
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
    @_s.required String portfolioId,
    @_s.required DescribePortfolioShareType type,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
        'Type': type?.toValue() ?? '',
        if (pageSize != null) 'PageSize': pageSize,
        if (pageToken != null) 'PageToken': pageToken,
      },
    );

    return DescribePortfolioSharesOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified product.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    String id,
    String name,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      8191,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    String id,
    String name,
    String sourcePortfolioId,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      8191,
    );
    _s.validateStringLength(
      'sourcePortfolioId',
      sourcePortfolioId,
      1,
      100,
    );
    _s.validateStringPattern(
      'sourcePortfolioId',
      sourcePortfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeProductViewOutput> describeProductView({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    String id,
    String name,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9][a-zA-Z0-9._-]*''',
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String planId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(planId, 'planId');
    _s.validateStringLength(
      'planId',
      planId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'planId',
      planId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
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
    String acceptLanguage,
    String productId,
    String productName,
    String provisioningArtifactId,
    String provisioningArtifactName,
    bool verbose,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'productName',
      productName,
      0,
      8191,
    );
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'provisioningArtifactName',
      provisioningArtifactName,
      0,
      8192,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    String pathId,
    String pathName,
    String productId,
    String productName,
    String provisioningArtifactId,
    String provisioningArtifactName,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'pathId',
      pathId,
      1,
      100,
    );
    _s.validateStringPattern(
      'pathId',
      pathId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'pathName',
      pathName,
      1,
      100,
    );
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'productName',
      productName,
      0,
      8191,
    );
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'provisioningArtifactName',
      provisioningArtifactName,
      0,
      8192,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String id,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeServiceActionOutput> describeServiceAction({
    @_s.required String id,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<DescribeServiceActionExecutionParametersOutput>
      describeServiceActionExecutionParameters({
    @_s.required String provisionedProductId,
    @_s.required String serviceActionId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(provisionedProductId, 'provisionedProductId');
    _s.validateStringLength(
      'provisionedProductId',
      provisionedProductId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionedProductId',
      provisionedProductId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceActionId, 'serviceActionId');
    _s.validateStringLength(
      'serviceActionId',
      serviceActionId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceActionId',
      serviceActionId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
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

  /// Disable portfolio sharing through AWS Organizations feature. This feature
  /// will not delete your current shares but it will prevent you from creating
  /// new shares throughout your organization. Current shares will not be in
  /// sync with your organization structure if it changes after calling this
  /// API. This API can only be called by the management account in the
  /// organization.
  ///
  /// This API can't be invoked if there are active delegated administrators in
  /// the organization.
  ///
  /// Note that a delegated administrator is not authorized to invoke
  /// <code>DisableAWSOrganizationsAccess</code>.
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DisableAWSOrganizationsAccessOutput.fromJson(jsonResponse.body);
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
    @_s.required String budgetName,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateBudgetFromResource'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateBudgetFromResourceOutput.fromJson(jsonResponse.body);
  }

  /// Disassociates a previously associated principal ARN from a specified
  /// portfolio.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [portfolioId] :
  /// The portfolio identifier.
  ///
  /// Parameter [principalARN] :
  /// The ARN of the principal (IAM user, role, or group).
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> disassociatePrincipalFromPortfolio({
    @_s.required String portfolioId,
    @_s.required String principalARN,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalARN, 'principalARN');
    _s.validateStringLength(
      'principalARN',
      principalARN,
      1,
      1000,
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociatePrincipalFromPortfolio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PortfolioId': portfolioId,
        'PrincipalARN': principalARN,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DisassociatePrincipalFromPortfolioOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> disassociateProductFromPortfolio({
    @_s.required String portfolioId,
    @_s.required String productId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateProductFromPortfolio'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateProductFromPortfolioOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<void> disassociateServiceActionFromProvisioningArtifact({
    @_s.required String productId,
    @_s.required String provisioningArtifactId,
    @_s.required String serviceActionId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisioningArtifactId, 'provisioningArtifactId');
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceActionId, 'serviceActionId');
    _s.validateStringLength(
      'serviceActionId',
      serviceActionId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceActionId',
      serviceActionId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateServiceActionFromProvisioningArtifact'
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
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return DisassociateServiceActionFromProvisioningArtifactOutput.fromJson(
        jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required String tagOptionId,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(tagOptionId, 'tagOptionId');
    _s.validateStringLength(
      'tagOptionId',
      tagOptionId,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWS242ServiceCatalogService.DisassociateTagOptionFromResource'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateTagOptionFromResourceOutput.fromJson(jsonResponse.body);
  }

  /// Enable portfolio sharing feature through AWS Organizations. This API will
  /// allow Service Catalog to receive updates on your organization in order to
  /// sync your shares with the current structure. This API can only be called
  /// by the management account in the organization.
  ///
  /// By calling this API Service Catalog will make a call to
  /// organizations:EnableAWSServiceAccess on your behalf so that your shares
  /// can be in sync with any changes in your AWS Organizations structure.
  ///
  /// Note that a delegated administrator is not authorized to invoke
  /// <code>EnableAWSOrganizationsAccess</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [OperationNotSupportedException].
  Future<void> enableAWSOrganizationsAccess() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.EnableAWSOrganizationsAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return EnableAWSOrganizationsAccessOutput.fromJson(jsonResponse.body);
  }

  /// Provisions or modifies a product based on the resource changes for the
  /// specified plan.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  ///
  /// Parameter [planId] :
  /// The plan identifier.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<ExecuteProvisionedProductPlanOutput> executeProvisionedProductPlan({
    @_s.required String idempotencyToken,
    @_s.required String planId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(planId, 'planId');
    _s.validateStringLength(
      'planId',
      planId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'planId',
      planId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'PlanId': planId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
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
  /// Parameter [executeToken] :
  /// An idempotency token that uniquely identifies the execute request.
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// A map of all self-service action parameters and their values. If a
  /// provided parameter is of a special type, such as <code>TARGET</code>, the
  /// provided value will override the default value generated by AWS Service
  /// Catalog. If the parameters field is not provided, no additional parameters
  /// are passed and default values will be used for any special parameters such
  /// as <code>TARGET</code>.
  Future<ExecuteProvisionedProductServiceActionOutput>
      executeProvisionedProductServiceAction({
    @_s.required String executeToken,
    @_s.required String provisionedProductId,
    @_s.required String serviceActionId,
    String acceptLanguage,
    Map<String, List<String>> parameters,
  }) async {
    ArgumentError.checkNotNull(executeToken, 'executeToken');
    _s.validateStringLength(
      'executeToken',
      executeToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'executeToken',
      executeToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(provisionedProductId, 'provisionedProductId');
    _s.validateStringLength(
      'provisionedProductId',
      provisionedProductId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionedProductId',
      provisionedProductId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceActionId, 'serviceActionId');
    _s.validateStringLength(
      'serviceActionId',
      serviceActionId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceActionId',
      serviceActionId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
        'ExecuteToken': executeToken ?? _s.generateIdempotencyToken(),
        'ProvisionedProductId': provisionedProductId,
        'ServiceActionId': serviceActionId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (parameters != null) 'Parameters': parameters,
      },
    );

    return ExecuteProvisionedProductServiceActionOutput.fromJson(
        jsonResponse.body);
  }

  /// Get the Access Status for AWS Organization portfolio share feature. This
  /// API can only be called by the management account in the organization or by
  /// a delegated admin.
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    List<String> outputKeys,
    int pageSize,
    String pageToken,
    String provisionedProductId,
    String provisionedProductName,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
    );
    _s.validateStringLength(
      'provisionedProductId',
      provisionedProductId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisionedProductId',
      provisionedProductId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'provisionedProductName',
      provisionedProductName,
      1,
      128,
    );
    _s.validateStringPattern(
      'provisionedProductName',
      provisionedProductName,
      r'''[a-zA-Z0-9][a-zA-Z0-9._-]*''',
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

  /// Requests the import of a resource as a Service Catalog provisioned product
  /// that is associated to a Service Catalog product and provisioning artifact.
  /// Once imported, all supported Service Catalog governance actions are
  /// supported on the provisioned product.
  ///
  /// Resource import only supports CloudFormation stack ARNs. CloudFormation
  /// StackSets and non-root nested stacks are not supported.
  ///
  /// The CloudFormation stack must have one of the following statuses to be
  /// imported: <code>CREATE_COMPLETE</code>, <code>UPDATE_COMPLETE</code>,
  /// <code>UPDATE_ROLLBACK_COMPLETE</code>, <code>IMPORT_COMPLETE</code>,
  /// <code>IMPORT_ROLLBACK_COMPLETE</code>.
  ///
  /// Import of the resource requires that the CloudFormation stack template
  /// matches the associated Service Catalog product provisioning artifact.
  ///
  /// The user or role that performs this operation must have the
  /// <code>cloudformation:GetTemplate</code> and
  /// <code>cloudformation:DescribeStacks</code> IAM policy permissions.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParametersException].
  ///
  /// Parameter [idempotencyToken] :
  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
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
  /// unique for the AWS account. The name cannot be updated after the product
  /// is provisioned.
  ///
  /// Parameter [provisioningArtifactId] :
  /// The identifier of the provisioning artifact.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<ImportAsProvisionedProductOutput> importAsProvisionedProduct({
    @_s.required String idempotencyToken,
    @_s.required String physicalId,
    @_s.required String productId,
    @_s.required String provisionedProductName,
    @_s.required String provisioningArtifactId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(physicalId, 'physicalId');
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisionedProductName, 'provisionedProductName');
    _s.validateStringLength(
      'provisionedProductName',
      provisionedProductName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionedProductName',
      provisionedProductName,
      r'''[a-zA-Z0-9][a-zA-Z0-9._-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisioningArtifactId, 'provisioningArtifactId');
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'PhysicalId': physicalId,
        'ProductId': productId,
        'ProvisionedProductName': provisionedProductName,
        'ProvisioningArtifactId': provisioningArtifactId,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      },
    );

    return ImportAsProvisionedProductOutput.fromJson(jsonResponse.body);
  }

  /// Lists all portfolios for which sharing was accepted by this account.
  ///
  /// May throw [InvalidParametersException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
  /// <code>AWS_ORGANIZATIONS</code> - List portfolios shared by the management
  /// account of your organization
  /// </li>
  /// <li>
  /// <code>AWS_SERVICECATALOG</code> - List default portfolios
  /// </li>
  /// <li>
  /// <code>IMPORTED</code> - List imported portfolios
  /// </li>
  /// </ul>
  Future<ListAcceptedPortfolioSharesOutput> listAcceptedPortfolioShares({
    String acceptLanguage,
    int pageSize,
    String pageToken,
    PortfolioShareType portfolioShareType,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String resourceId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String portfolioId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
    String productId,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
    );
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
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

  /// Lists the paths to the specified product. A path is how the user has
  /// access to a specified product, and is necessary when provisioning a
  /// product. A path also determines the constraints put on the product.
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String productId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required OrganizationNodeType organizationNodeType,
    @_s.required String portfolioId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(organizationNodeType, 'organizationNodeType');
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
        'OrganizationNodeType': organizationNodeType?.toValue() ?? '',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String portfolioId,
    String acceptLanguage,
    String organizationParentId,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'organizationParentId',
      organizationParentId,
      1,
      100,
    );
    _s.validateStringPattern(
      'organizationParentId',
      organizationParentId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String productId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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

  /// Lists all principal ARNs associated with the specified portfolio.
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String portfolioId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    AccessLevelFilter accessLevelFilter,
    int pageSize,
    String pageToken,
    String provisionProductId,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
    );
    _s.validateStringLength(
      'provisionProductId',
      provisionProductId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisionProductId',
      provisionProductId,
      r'''^[a-zA-Z0-9_\-]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<ListProvisioningArtifactsOutput> listProvisioningArtifacts({
    @_s.required String productId,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String serviceActionId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(serviceActionId, 'serviceActionId');
    _s.validateStringLength(
      'serviceActionId',
      serviceActionId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceActionId',
      serviceActionId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    AccessLevelFilter accessLevelFilter,
    int pageSize,
    String pageToken,
    ListRecordHistorySearchFilter searchFilter,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
    @_s.required String tagOptionId,
    int pageSize,
    String pageToken,
    String resourceType,
  }) async {
    ArgumentError.checkNotNull(tagOptionId, 'tagOptionId');
    _s.validateStringLength(
      'tagOptionId',
      tagOptionId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String productId,
    @_s.required String provisioningArtifactId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisioningArtifactId, 'provisioningArtifactId');
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// filter for stack instances that are associated with a specific AWS account
  /// name or region.
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String provisionedProductId,
    String acceptLanguage,
    int pageSize,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(provisionedProductId, 'provisionedProductId');
    _s.validateStringLength(
      'provisionedProductId',
      provisionedProductId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionedProductId',
      provisionedProductId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
    ListTagOptionsFilters filters,
    int pageSize,
    String pageToken,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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

  /// Provisions the specified product.
  ///
  /// A provisioned product is a resourced instance of a product. For example,
  /// provisioning a product based on a CloudFormation template launches a
  /// CloudFormation stack and its underlying resources. You can check the
  /// status of this request using <a>DescribeRecord</a>.
  ///
  /// If the request contains a tag key with an empty list of values, there is a
  /// tag conflict for that key. Do not include conflicted keys as tags, or this
  /// causes the error "Parameter validation failed: Missing required parameter
  /// in Tags[<i>N</i>]:<i>Value</i>".
  ///
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DuplicateResourceException].
  ///
  /// Parameter [provisionToken] :
  /// An idempotency token that uniquely identifies the provisioning request.
  ///
  /// Parameter [provisionedProductName] :
  /// A user-friendly name for the provisioned product. This value must be
  /// unique for the AWS account and cannot be updated after the product is
  /// provisioned.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String provisionToken,
    @_s.required String provisionedProductName,
    String acceptLanguage,
    List<String> notificationArns,
    String pathId,
    String pathName,
    String productId,
    String productName,
    String provisioningArtifactId,
    String provisioningArtifactName,
    List<ProvisioningParameter> provisioningParameters,
    ProvisioningPreferences provisioningPreferences,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(provisionToken, 'provisionToken');
    _s.validateStringLength(
      'provisionToken',
      provisionToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionToken',
      provisionToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisionedProductName, 'provisionedProductName');
    _s.validateStringLength(
      'provisionedProductName',
      provisionedProductName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionedProductName',
      provisionedProductName,
      r'''[a-zA-Z0-9][a-zA-Z0-9._-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'pathId',
      pathId,
      1,
      100,
    );
    _s.validateStringPattern(
      'pathId',
      pathId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'pathName',
      pathName,
      1,
      100,
    );
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'productName',
      productName,
      0,
      8191,
    );
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'provisioningArtifactName',
      provisioningArtifactName,
      0,
      8192,
    );
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
        'ProvisionToken': provisionToken ?? _s.generateIdempotencyToken(),
        'ProvisionedProductName': provisionedProductName,
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (notificationArns != null) 'NotificationArns': notificationArns,
        if (pathId != null) 'PathId': pathId,
        if (pathName != null) 'PathName': pathName,
        if (productId != null) 'ProductId': productId,
        if (productName != null) 'ProductName': productName,
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String portfolioId,
    String acceptLanguage,
    PortfolioShareType portfolioShareType,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWS242ServiceCatalogService.RejectPortfolioShare'
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
        if (portfolioShareType != null)
          'PortfolioShareType': portfolioShareType.toValue(),
      },
    );

    return RejectPortfolioShareOutput.fromJson(jsonResponse.body);
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    AccessLevelFilter accessLevelFilter,
    int pageSize,
    String pageToken,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    Map<ProductViewFilterBy, List<String>> filters,
    int pageSize,
    String pageToken,
    ProductViewSortBy sortBy,
    SortOrder sortOrder,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
    String acceptLanguage,
    Map<ProductViewFilterBy, List<String>> filters,
    int pageSize,
    String pageToken,
    String portfolioId,
    ProductSource productSource,
    ProductViewSortBy sortBy,
    SortOrder sortOrder,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      20,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
    );
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
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
  /// <code>en</code> - English (default)
  /// </li>
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
  /// <code>provisioningArtifact</code>, <code>type</code>, <code>status</code>,
  /// <code>tags</code>, <code>userArn</code>, <code>userArnSession</code>,
  /// <code>lastProvisioningRecordId</code>,
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
    String acceptLanguage,
    AccessLevelFilter accessLevelFilter,
    Map<ProvisionedProductViewFilterBy, List<String>> filters,
    int pageSize,
    String pageToken,
    String sortBy,
    SortOrder sortOrder,
  }) async {
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      100,
    );
    _s.validateStringLength(
      'pageToken',
      pageToken,
      0,
      2024,
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''[\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]*''',
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
  /// Parameter [terminateToken] :
  /// An idempotency token that uniquely identifies the termination request.
  /// This token is only valid during the termination process. After the
  /// provisioned product is terminated, subsequent requests to terminate the
  /// same provisioned product always return <b>ResourceNotFound</b>.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [ignoreErrors] :
  /// If set to true, AWS Service Catalog stops managing the specified
  /// provisioned product even if it cannot delete the underlying resources.
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
  Future<TerminateProvisionedProductOutput> terminateProvisionedProduct({
    @_s.required String terminateToken,
    String acceptLanguage,
    bool ignoreErrors,
    String provisionedProductId,
    String provisionedProductName,
    bool retainPhysicalResources,
  }) async {
    ArgumentError.checkNotNull(terminateToken, 'terminateToken');
    _s.validateStringLength(
      'terminateToken',
      terminateToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'terminateToken',
      terminateToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'provisionedProductId',
      provisionedProductId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisionedProductId',
      provisionedProductId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'provisionedProductName',
      provisionedProductName,
      1,
      1224,
    );
    _s.validateStringPattern(
      'provisionedProductName',
      provisionedProductName,
      r'''[a-zA-Z0-9][a-zA-Z0-9._-]{0,127}|arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
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
        'TerminateToken': terminateToken ?? _s.generateIdempotencyToken(),
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
        if (ignoreErrors != null) 'IgnoreErrors': ignoreErrors,
        if (provisionedProductId != null)
          'ProvisionedProductId': provisionedProductId,
        if (provisionedProductName != null)
          'ProvisionedProductName': provisionedProductName,
        if (retainPhysicalResources != null)
          'RetainPhysicalResources': retainPhysicalResources,
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
  /// <code>en</code> - English (default)
  /// </li>
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
  /// Products with a <code>STACKSET</code> constraint will launch an AWS
  /// CloudFormation stack set.
  /// </dd> <dt>TEMPLATE</dt> <dd>
  /// Specify the <code>Rules</code> property. For more information, see <a
  /// href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html">Template
  /// Constraint Rules</a>.
  /// </dd> </dl>
  Future<UpdateConstraintOutput> updateConstraint({
    @_s.required String id,
    String acceptLanguage,
    String description,
    String parameters,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2000,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String id,
    String acceptLanguage,
    List<Tag> addTags,
    String description,
    String displayName,
    String providerName,
    List<String> removeTags,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2000,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      1,
      100,
    );
    _s.validateStringLength(
      'providerName',
      providerName,
      1,
      50,
    );
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
  /// disable TagOptions sharing for an existing portfolio share.
  ///
  /// The portfolio share cannot be updated if the <code>
  /// CreatePortfolioShare</code> operation is <code>IN_PROGRESS</code>, as the
  /// share is not available to recipient entities. In this case, you must wait
  /// for the portfolio share to be COMPLETED.
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS Account Id of the recipient account. This field is required when
  /// updating an external account to account type share.
  ///
  /// Parameter [shareTagOptions] :
  /// A flag to enable or disable TagOptions sharing for the portfolio share. If
  /// this field is not provided, the current state of TagOptions sharing on the
  /// portfolio share will not be modified.
  Future<UpdatePortfolioShareOutput> updatePortfolioShare({
    @_s.required String portfolioId,
    String acceptLanguage,
    String accountId,
    OrganizationNode organizationNode,
    bool shareTagOptions,
  }) async {
    ArgumentError.checkNotNull(portfolioId, 'portfolioId');
    _s.validateStringLength(
      'portfolioId',
      portfolioId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portfolioId',
      portfolioId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^[0-9]{12}$''',
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
  /// Parameter [supportDescription] :
  /// The updated support description for the product.
  ///
  /// Parameter [supportEmail] :
  /// The updated support email for the product.
  ///
  /// Parameter [supportUrl] :
  /// The updated support URL for the product.
  Future<UpdateProductOutput> updateProduct({
    @_s.required String id,
    String acceptLanguage,
    List<Tag> addTags,
    String description,
    String distributor,
    String name,
    String owner,
    List<String> removeTags,
    String supportDescription,
    String supportEmail,
    String supportUrl,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      8191,
    );
    _s.validateStringLength(
      'distributor',
      distributor,
      0,
      8191,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      8191,
    );
    _s.validateStringLength(
      'owner',
      owner,
      0,
      8191,
    );
    _s.validateStringLength(
      'supportDescription',
      supportDescription,
      0,
      8191,
    );
    _s.validateStringLength(
      'supportEmail',
      supportEmail,
      0,
      254,
    );
    _s.validateStringLength(
      'supportUrl',
      supportUrl,
      0,
      2083,
    );
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
  /// Parameter [updateToken] :
  /// The idempotency token that uniquely identifies the provisioning update
  /// request.
  ///
  /// Parameter [acceptLanguage] :
  /// The language code.
  ///
  /// <ul>
  /// <li>
  /// <code>en</code> - English (default)
  /// </li>
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
  Future<UpdateProvisionedProductOutput> updateProvisionedProduct({
    @_s.required String updateToken,
    String acceptLanguage,
    String pathId,
    String pathName,
    String productId,
    String productName,
    String provisionedProductId,
    String provisionedProductName,
    String provisioningArtifactId,
    String provisioningArtifactName,
    List<UpdateProvisioningParameter> provisioningParameters,
    UpdateProvisioningPreferences provisioningPreferences,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(updateToken, 'updateToken');
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'pathId',
      pathId,
      1,
      100,
    );
    _s.validateStringPattern(
      'pathId',
      pathId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'pathName',
      pathName,
      1,
      100,
    );
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'productName',
      productName,
      0,
      8191,
    );
    _s.validateStringLength(
      'provisionedProductId',
      provisionedProductId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisionedProductId',
      provisionedProductId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'provisionedProductName',
      provisionedProductName,
      1,
      1224,
    );
    _s.validateStringPattern(
      'provisionedProductName',
      provisionedProductName,
      r'''[a-zA-Z0-9][a-zA-Z0-9._-]{0,127}|arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
    );
    _s.validateStringLength(
      'provisioningArtifactName',
      provisioningArtifactName,
      0,
      8192,
    );
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
        'UpdateToken': updateToken ?? _s.generateIdempotencyToken(),
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
  /// Parameter [idempotencyToken] :
  /// The idempotency token that uniquely identifies the provisioning product
  /// update request.
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
  /// The <code>OWNER</code> key accepts user ARNs and role ARNs. The owner is
  /// the user that has permission to see, update, terminate, and execute
  /// service actions in the provisioned product.
  ///
  /// The administrator can change the owner of a provisioned product to another
  /// IAM user within the same account. Both end user owners and administrators
  /// can see ownership history of the provisioned product using the
  /// <code>ListRecordHistory</code> API. The new owner can describe all past
  /// records for the provisioned product using the <code>DescribeRecord</code>
  /// API. The previous owner can no longer use <code>DescribeRecord</code>, but
  /// can still see the product's history from when he was an owner using
  /// <code>ListRecordHistory</code>.
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
  /// <code>en</code> - English (default)
  /// </li>
  /// <li>
  /// <code>jp</code> - Japanese
  /// </li>
  /// <li>
  /// <code>zh</code> - Chinese
  /// </li>
  /// </ul>
  Future<UpdateProvisionedProductPropertiesOutput>
      updateProvisionedProductProperties({
    @_s.required String idempotencyToken,
    @_s.required String provisionedProductId,
    @_s.required Map<PropertyKey, String> provisionedProductProperties,
    String acceptLanguage,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(provisionedProductId, 'provisionedProductId');
    _s.validateStringLength(
      'provisionedProductId',
      provisionedProductId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisionedProductId',
      provisionedProductId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisionedProductProperties, 'provisionedProductProperties');
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
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
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'ProvisionedProductId': provisionedProductId,
        'ProvisionedProductProperties': provisionedProductProperties
            ?.map((k, e) => MapEntry(k.toValue(), e)),
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String productId,
    @_s.required String provisioningArtifactId,
    String acceptLanguage,
    bool active,
    String description,
    ProvisioningArtifactGuidance guidance,
    String name,
  }) async {
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringLength(
      'productId',
      productId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisioningArtifactId, 'provisioningArtifactId');
    _s.validateStringLength(
      'provisioningArtifactId',
      provisioningArtifactId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'provisioningArtifactId',
      provisioningArtifactId,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      8192,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      8192,
    );
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
  /// <code>en</code> - English (default)
  /// </li>
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
    @_s.required String id,
    String acceptLanguage,
    Map<ServiceActionDefinitionKey, String> definition,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'acceptLanguage',
      acceptLanguage,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_\-.]*''',
    );
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
    @_s.required String id,
    bool active,
    String value,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'value',
      value,
      1,
      256,
    );
    _s.validateStringPattern(
      'value',
      value,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
    );
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptPortfolioShareOutput {
  AcceptPortfolioShareOutput();
  factory AcceptPortfolioShareOutput.fromJson(Map<String, dynamic> json) =>
      _$AcceptPortfolioShareOutputFromJson(json);
}

/// The access level to use to filter results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Key')
  final AccessLevelFilterKey key;

  /// The user to which the access level applies. The only supported value is
  /// <code>Self</code>.
  @_s.JsonKey(name: 'Value')
  final String value;

  AccessLevelFilter({
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => _$AccessLevelFilterToJson(this);
}

enum AccessLevelFilterKey {
  @_s.JsonValue('Account')
  account,
  @_s.JsonValue('Role')
  role,
  @_s.JsonValue('User')
  user,
}

enum AccessStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('UNDER_CHANGE')
  underChange,
  @_s.JsonValue('DISABLED')
  disabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateBudgetWithResourceOutput {
  AssociateBudgetWithResourceOutput();
  factory AssociateBudgetWithResourceOutput.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateBudgetWithResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociatePrincipalWithPortfolioOutput {
  AssociatePrincipalWithPortfolioOutput();
  factory AssociatePrincipalWithPortfolioOutput.fromJson(
          Map<String, dynamic> json) =>
      _$AssociatePrincipalWithPortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateProductWithPortfolioOutput {
  AssociateProductWithPortfolioOutput();
  factory AssociateProductWithPortfolioOutput.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateProductWithPortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateServiceActionWithProvisioningArtifactOutput {
  AssociateServiceActionWithProvisioningArtifactOutput();
  factory AssociateServiceActionWithProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateServiceActionWithProvisioningArtifactOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateTagOptionWithResourceOutput {
  AssociateTagOptionWithResourceOutput();
  factory AssociateTagOptionWithResourceOutput.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateTagOptionWithResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAssociateServiceActionWithProvisioningArtifactOutput {
  /// An object that contains a list of errors, along with information to help you
  /// identify the self-service action.
  @_s.JsonKey(name: 'FailedServiceActionAssociations')
  final List<FailedServiceActionAssociation> failedServiceActionAssociations;

  BatchAssociateServiceActionWithProvisioningArtifactOutput({
    this.failedServiceActionAssociations,
  });
  factory BatchAssociateServiceActionWithProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchAssociateServiceActionWithProvisioningArtifactOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDisassociateServiceActionFromProvisioningArtifactOutput {
  /// An object that contains a list of errors, along with information to help you
  /// identify the self-service action.
  @_s.JsonKey(name: 'FailedServiceActionAssociations')
  final List<FailedServiceActionAssociation> failedServiceActionAssociations;

  BatchDisassociateServiceActionFromProvisioningArtifactOutput({
    this.failedServiceActionAssociations,
  });
  factory BatchDisassociateServiceActionFromProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDisassociateServiceActionFromProvisioningArtifactOutputFromJson(
          json);
}

/// Information about a budget.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BudgetDetail {
  /// Name of the associated budget.
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  BudgetDetail({
    this.budgetName,
  });
  factory BudgetDetail.fromJson(Map<String, dynamic> json) =>
      _$BudgetDetailFromJson(json);
}

enum ChangeAction {
  @_s.JsonValue('ADD')
  add,
  @_s.JsonValue('MODIFY')
  modify,
  @_s.JsonValue('REMOVE')
  remove,
}

/// Information about a CloudWatch dashboard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudWatchDashboard {
  /// The name of the CloudWatch dashboard.
  @_s.JsonKey(name: 'Name')
  final String name;

  CloudWatchDashboard({
    this.name,
  });
  factory CloudWatchDashboard.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchDashboardFromJson(json);
}

/// Information about a constraint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConstraintDetail {
  /// The identifier of the constraint.
  @_s.JsonKey(name: 'ConstraintId')
  final String constraintId;

  /// The description of the constraint.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The owner of the constraint.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The identifier of the portfolio the product resides in. The constraint
  /// applies only to the instance of the product that lives within this
  /// portfolio.
  @_s.JsonKey(name: 'PortfolioId')
  final String portfolioId;

  /// The identifier of the product the constraint applies to. Note that a
  /// constraint applies to a specific instance of a product within a certain
  /// portfolio.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

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
  @_s.JsonKey(name: 'Type')
  final String type;

  ConstraintDetail({
    this.constraintId,
    this.description,
    this.owner,
    this.portfolioId,
    this.productId,
    this.type,
  });
  factory ConstraintDetail.fromJson(Map<String, dynamic> json) =>
      _$ConstraintDetailFromJson(json);
}

/// Summary information about a constraint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConstraintSummary {
  /// The description of the constraint.
  @_s.JsonKey(name: 'Description')
  final String description;

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
  @_s.JsonKey(name: 'Type')
  final String type;

  ConstraintSummary({
    this.description,
    this.type,
  });
  factory ConstraintSummary.fromJson(Map<String, dynamic> json) =>
      _$ConstraintSummaryFromJson(json);
}

enum CopyOption {
  @_s.JsonValue('CopyTags')
  copyTags,
}

extension on CopyOption {
  String toValue() {
    switch (this) {
      case CopyOption.copyTags:
        return 'CopyTags';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CopyProductOutput {
  /// The token to use to track the progress of the operation.
  @_s.JsonKey(name: 'CopyProductToken')
  final String copyProductToken;

  CopyProductOutput({
    this.copyProductToken,
  });
  factory CopyProductOutput.fromJson(Map<String, dynamic> json) =>
      _$CopyProductOutputFromJson(json);
}

enum CopyProductStatus {
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConstraintOutput {
  /// Information about the constraint.
  @_s.JsonKey(name: 'ConstraintDetail')
  final ConstraintDetail constraintDetail;

  /// The constraint parameters.
  @_s.JsonKey(name: 'ConstraintParameters')
  final String constraintParameters;

  /// The status of the current request.
  @_s.JsonKey(name: 'Status')
  final Status status;

  CreateConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });
  factory CreateConstraintOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateConstraintOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePortfolioOutput {
  /// Information about the portfolio.
  @_s.JsonKey(name: 'PortfolioDetail')
  final PortfolioDetail portfolioDetail;

  /// Information about the tags associated with the portfolio.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  CreatePortfolioOutput({
    this.portfolioDetail,
    this.tags,
  });
  factory CreatePortfolioOutput.fromJson(Map<String, dynamic> json) =>
      _$CreatePortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePortfolioShareOutput {
  /// The portfolio shares a unique identifier that only returns if the portfolio
  /// is shared to an organization node.
  @_s.JsonKey(name: 'PortfolioShareToken')
  final String portfolioShareToken;

  CreatePortfolioShareOutput({
    this.portfolioShareToken,
  });
  factory CreatePortfolioShareOutput.fromJson(Map<String, dynamic> json) =>
      _$CreatePortfolioShareOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProductOutput {
  /// Information about the product view.
  @_s.JsonKey(name: 'ProductViewDetail')
  final ProductViewDetail productViewDetail;

  /// Information about the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactDetail')
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// Information about the tags associated with the product.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  CreateProductOutput({
    this.productViewDetail,
    this.provisioningArtifactDetail,
    this.tags,
  });
  factory CreateProductOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProvisionedProductPlanOutput {
  /// The plan identifier.
  @_s.JsonKey(name: 'PlanId')
  final String planId;

  /// The name of the plan.
  @_s.JsonKey(name: 'PlanName')
  final String planName;

  /// The product identifier.
  @_s.JsonKey(name: 'ProvisionProductId')
  final String provisionProductId;

  /// The user-friendly name of the provisioned product.
  @_s.JsonKey(name: 'ProvisionedProductName')
  final String provisionedProductName;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

  CreateProvisionedProductPlanOutput({
    this.planId,
    this.planName,
    this.provisionProductId,
    this.provisionedProductName,
    this.provisioningArtifactId,
  });
  factory CreateProvisionedProductPlanOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProvisionedProductPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProvisioningArtifactOutput {
  /// Specify the template source with one of the following options, but not both.
  /// Keys accepted: [ <code>LoadTemplateFromURL</code>,
  /// <code>ImportFromPhysicalId</code> ].
  ///
  /// The URL of the CloudFormation template in Amazon S3, in JSON format.
  ///
  /// <code>LoadTemplateFromURL</code>
  ///
  /// Use the URL of the CloudFormation template in Amazon S3 in JSON format.
  ///
  /// <code>ImportFromPhysicalId</code>
  ///
  /// Use the physical id of the resource that contains the template; currently
  /// supports CloudFormation stack ARN.
  @_s.JsonKey(name: 'Info')
  final Map<String, String> info;

  /// Information about the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactDetail')
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// The status of the current request.
  @_s.JsonKey(name: 'Status')
  final Status status;

  CreateProvisioningArtifactOutput({
    this.info,
    this.provisioningArtifactDetail,
    this.status,
  });
  factory CreateProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProvisioningArtifactOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateServiceActionOutput {
  /// An object containing information about the self-service action.
  @_s.JsonKey(name: 'ServiceActionDetail')
  final ServiceActionDetail serviceActionDetail;

  CreateServiceActionOutput({
    this.serviceActionDetail,
  });
  factory CreateServiceActionOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateServiceActionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTagOptionOutput {
  /// Information about the TagOption.
  @_s.JsonKey(name: 'TagOptionDetail')
  final TagOptionDetail tagOptionDetail;

  CreateTagOptionOutput({
    this.tagOptionDetail,
  });
  factory CreateTagOptionOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateTagOptionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConstraintOutput {
  DeleteConstraintOutput();
  factory DeleteConstraintOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteConstraintOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePortfolioOutput {
  DeletePortfolioOutput();
  factory DeletePortfolioOutput.fromJson(Map<String, dynamic> json) =>
      _$DeletePortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePortfolioShareOutput {
  /// The portfolio share unique identifier. This will only be returned if delete
  /// is made to an organization node.
  @_s.JsonKey(name: 'PortfolioShareToken')
  final String portfolioShareToken;

  DeletePortfolioShareOutput({
    this.portfolioShareToken,
  });
  factory DeletePortfolioShareOutput.fromJson(Map<String, dynamic> json) =>
      _$DeletePortfolioShareOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProductOutput {
  DeleteProductOutput();
  factory DeleteProductOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProvisionedProductPlanOutput {
  DeleteProvisionedProductPlanOutput();
  factory DeleteProvisionedProductPlanOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteProvisionedProductPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProvisioningArtifactOutput {
  DeleteProvisioningArtifactOutput();
  factory DeleteProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteProvisioningArtifactOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteServiceActionOutput {
  DeleteServiceActionOutput();
  factory DeleteServiceActionOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteServiceActionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTagOptionOutput {
  DeleteTagOptionOutput();
  factory DeleteTagOptionOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTagOptionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConstraintOutput {
  /// Information about the constraint.
  @_s.JsonKey(name: 'ConstraintDetail')
  final ConstraintDetail constraintDetail;

  /// The constraint parameters.
  @_s.JsonKey(name: 'ConstraintParameters')
  final String constraintParameters;

  /// The status of the current request.
  @_s.JsonKey(name: 'Status')
  final Status status;

  DescribeConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });
  factory DescribeConstraintOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeConstraintOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCopyProductStatusOutput {
  /// The status of the copy product operation.
  @_s.JsonKey(name: 'CopyProductStatus')
  final CopyProductStatus copyProductStatus;

  /// The status message.
  @_s.JsonKey(name: 'StatusDetail')
  final String statusDetail;

  /// The identifier of the copied product.
  @_s.JsonKey(name: 'TargetProductId')
  final String targetProductId;

  DescribeCopyProductStatusOutput({
    this.copyProductStatus,
    this.statusDetail,
    this.targetProductId,
  });
  factory DescribeCopyProductStatusOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeCopyProductStatusOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePortfolioOutput {
  /// Information about the associated budgets.
  @_s.JsonKey(name: 'Budgets')
  final List<BudgetDetail> budgets;

  /// Information about the portfolio.
  @_s.JsonKey(name: 'PortfolioDetail')
  final PortfolioDetail portfolioDetail;

  /// Information about the TagOptions associated with the portfolio.
  @_s.JsonKey(name: 'TagOptions')
  final List<TagOptionDetail> tagOptions;

  /// Information about the tags associated with the portfolio.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  DescribePortfolioOutput({
    this.budgets,
    this.portfolioDetail,
    this.tagOptions,
    this.tags,
  });
  factory DescribePortfolioOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribePortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePortfolioShareStatusOutput {
  /// Organization node identifier. It can be either account id, organizational
  /// unit id or organization id.
  @_s.JsonKey(name: 'OrganizationNodeValue')
  final String organizationNodeValue;

  /// The portfolio identifier.
  @_s.JsonKey(name: 'PortfolioId')
  final String portfolioId;

  /// The token for the portfolio share operation. For example,
  /// <code>share-6v24abcdefghi</code>.
  @_s.JsonKey(name: 'PortfolioShareToken')
  final String portfolioShareToken;

  /// Information about the portfolio share operation.
  @_s.JsonKey(name: 'ShareDetails')
  final ShareDetails shareDetails;

  /// Status of the portfolio share operation.
  @_s.JsonKey(name: 'Status')
  final ShareStatus status;

  DescribePortfolioShareStatusOutput({
    this.organizationNodeValue,
    this.portfolioId,
    this.portfolioShareToken,
    this.shareDetails,
    this.status,
  });
  factory DescribePortfolioShareStatusOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribePortfolioShareStatusOutputFromJson(json);
}

enum DescribePortfolioShareType {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('ORGANIZATION')
  organization,
  @_s.JsonValue('ORGANIZATIONAL_UNIT')
  organizationalUnit,
  @_s.JsonValue('ORGANIZATION_MEMBER_ACCOUNT')
  organizationMemberAccount,
}

extension on DescribePortfolioShareType {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePortfolioSharesOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Summaries about each of the portfolio shares.
  @_s.JsonKey(name: 'PortfolioShareDetails')
  final List<PortfolioShareDetail> portfolioShareDetails;

  DescribePortfolioSharesOutput({
    this.nextPageToken,
    this.portfolioShareDetails,
  });
  factory DescribePortfolioSharesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribePortfolioSharesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProductAsAdminOutput {
  /// Information about the associated budgets.
  @_s.JsonKey(name: 'Budgets')
  final List<BudgetDetail> budgets;

  /// Information about the product view.
  @_s.JsonKey(name: 'ProductViewDetail')
  final ProductViewDetail productViewDetail;

  /// Information about the provisioning artifacts (also known as versions) for
  /// the specified product.
  @_s.JsonKey(name: 'ProvisioningArtifactSummaries')
  final List<ProvisioningArtifactSummary> provisioningArtifactSummaries;

  /// Information about the TagOptions associated with the product.
  @_s.JsonKey(name: 'TagOptions')
  final List<TagOptionDetail> tagOptions;

  /// Information about the tags associated with the product.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  DescribeProductAsAdminOutput({
    this.budgets,
    this.productViewDetail,
    this.provisioningArtifactSummaries,
    this.tagOptions,
    this.tags,
  });
  factory DescribeProductAsAdminOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeProductAsAdminOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProductOutput {
  /// Information about the associated budgets.
  @_s.JsonKey(name: 'Budgets')
  final List<BudgetDetail> budgets;

  /// Information about the associated launch paths.
  @_s.JsonKey(name: 'LaunchPaths')
  final List<LaunchPath> launchPaths;

  /// Summary information about the product view.
  @_s.JsonKey(name: 'ProductViewSummary')
  final ProductViewSummary productViewSummary;

  /// Information about the provisioning artifacts for the specified product.
  @_s.JsonKey(name: 'ProvisioningArtifacts')
  final List<ProvisioningArtifact> provisioningArtifacts;

  DescribeProductOutput({
    this.budgets,
    this.launchPaths,
    this.productViewSummary,
    this.provisioningArtifacts,
  });
  factory DescribeProductOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProductViewOutput {
  /// Summary information about the product.
  @_s.JsonKey(name: 'ProductViewSummary')
  final ProductViewSummary productViewSummary;

  /// Information about the provisioning artifacts for the product.
  @_s.JsonKey(name: 'ProvisioningArtifacts')
  final List<ProvisioningArtifact> provisioningArtifacts;

  DescribeProductViewOutput({
    this.productViewSummary,
    this.provisioningArtifacts,
  });
  factory DescribeProductViewOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeProductViewOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProvisionedProductOutput {
  /// Any CloudWatch dashboards that were created when provisioning the product.
  @_s.JsonKey(name: 'CloudWatchDashboards')
  final List<CloudWatchDashboard> cloudWatchDashboards;

  /// Information about the provisioned product.
  @_s.JsonKey(name: 'ProvisionedProductDetail')
  final ProvisionedProductDetail provisionedProductDetail;

  DescribeProvisionedProductOutput({
    this.cloudWatchDashboards,
    this.provisionedProductDetail,
  });
  factory DescribeProvisionedProductOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeProvisionedProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProvisionedProductPlanOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the plan.
  @_s.JsonKey(name: 'ProvisionedProductPlanDetails')
  final ProvisionedProductPlanDetails provisionedProductPlanDetails;

  /// Information about the resource changes that will occur when the plan is
  /// executed.
  @_s.JsonKey(name: 'ResourceChanges')
  final List<ResourceChange> resourceChanges;

  DescribeProvisionedProductPlanOutput({
    this.nextPageToken,
    this.provisionedProductPlanDetails,
    this.resourceChanges,
  });
  factory DescribeProvisionedProductPlanOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeProvisionedProductPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProvisioningArtifactOutput {
  /// The URL of the CloudFormation template in Amazon S3.
  @_s.JsonKey(name: 'Info')
  final Map<String, String> info;

  /// Information about the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactDetail')
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// The status of the current request.
  @_s.JsonKey(name: 'Status')
  final Status status;

  DescribeProvisioningArtifactOutput({
    this.info,
    this.provisioningArtifactDetail,
    this.status,
  });
  factory DescribeProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeProvisioningArtifactOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProvisioningParametersOutput {
  /// Information about the constraints used to provision the product.
  @_s.JsonKey(name: 'ConstraintSummaries')
  final List<ConstraintSummary> constraintSummaries;

  /// The output of the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactOutputs')
  final List<ProvisioningArtifactOutput> provisioningArtifactOutputs;

  /// Information about the parameters used to provision the product.
  @_s.JsonKey(name: 'ProvisioningArtifactParameters')
  final List<ProvisioningArtifactParameter> provisioningArtifactParameters;

  /// An object that contains information about preferences, such as regions and
  /// accounts, for the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactPreferences')
  final ProvisioningArtifactPreferences provisioningArtifactPreferences;

  /// Information about the TagOptions associated with the resource.
  @_s.JsonKey(name: 'TagOptions')
  final List<TagOptionSummary> tagOptions;

  /// Any additional metadata specifically related to the provisioning of the
  /// product. For example, see the <code>Version</code> field of the
  /// CloudFormation template.
  @_s.JsonKey(name: 'UsageInstructions')
  final List<UsageInstruction> usageInstructions;

  DescribeProvisioningParametersOutput({
    this.constraintSummaries,
    this.provisioningArtifactOutputs,
    this.provisioningArtifactParameters,
    this.provisioningArtifactPreferences,
    this.tagOptions,
    this.usageInstructions,
  });
  factory DescribeProvisioningParametersOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeProvisioningParametersOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRecordOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the product.
  @_s.JsonKey(name: 'RecordDetail')
  final RecordDetail recordDetail;

  /// Information about the product created as the result of a request. For
  /// example, the output for a CloudFormation-backed product that creates an S3
  /// bucket would include the S3 bucket URL.
  @_s.JsonKey(name: 'RecordOutputs')
  final List<RecordOutput> recordOutputs;

  DescribeRecordOutput({
    this.nextPageToken,
    this.recordDetail,
    this.recordOutputs,
  });
  factory DescribeRecordOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeRecordOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeServiceActionExecutionParametersOutput {
  /// The parameters of the self-service action.
  @_s.JsonKey(name: 'ServiceActionParameters')
  final List<ExecutionParameter> serviceActionParameters;

  DescribeServiceActionExecutionParametersOutput({
    this.serviceActionParameters,
  });
  factory DescribeServiceActionExecutionParametersOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeServiceActionExecutionParametersOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeServiceActionOutput {
  /// Detailed information about the self-service action.
  @_s.JsonKey(name: 'ServiceActionDetail')
  final ServiceActionDetail serviceActionDetail;

  DescribeServiceActionOutput({
    this.serviceActionDetail,
  });
  factory DescribeServiceActionOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeServiceActionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTagOptionOutput {
  /// Information about the TagOption.
  @_s.JsonKey(name: 'TagOptionDetail')
  final TagOptionDetail tagOptionDetail;

  DescribeTagOptionOutput({
    this.tagOptionDetail,
  });
  factory DescribeTagOptionOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTagOptionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableAWSOrganizationsAccessOutput {
  DisableAWSOrganizationsAccessOutput();
  factory DisableAWSOrganizationsAccessOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DisableAWSOrganizationsAccessOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateBudgetFromResourceOutput {
  DisassociateBudgetFromResourceOutput();
  factory DisassociateBudgetFromResourceOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateBudgetFromResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociatePrincipalFromPortfolioOutput {
  DisassociatePrincipalFromPortfolioOutput();
  factory DisassociatePrincipalFromPortfolioOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociatePrincipalFromPortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateProductFromPortfolioOutput {
  DisassociateProductFromPortfolioOutput();
  factory DisassociateProductFromPortfolioOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateProductFromPortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateServiceActionFromProvisioningArtifactOutput {
  DisassociateServiceActionFromProvisioningArtifactOutput();
  factory DisassociateServiceActionFromProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateServiceActionFromProvisioningArtifactOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateTagOptionFromResourceOutput {
  DisassociateTagOptionFromResourceOutput();
  factory DisassociateTagOptionFromResourceOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateTagOptionFromResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableAWSOrganizationsAccessOutput {
  EnableAWSOrganizationsAccessOutput();
  factory EnableAWSOrganizationsAccessOutput.fromJson(
          Map<String, dynamic> json) =>
      _$EnableAWSOrganizationsAccessOutputFromJson(json);
}

enum EvaluationType {
  @_s.JsonValue('STATIC')
  static,
  @_s.JsonValue('DYNAMIC')
  dynamic,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecuteProvisionedProductPlanOutput {
  /// Information about the result of provisioning the product.
  @_s.JsonKey(name: 'RecordDetail')
  final RecordDetail recordDetail;

  ExecuteProvisionedProductPlanOutput({
    this.recordDetail,
  });
  factory ExecuteProvisionedProductPlanOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ExecuteProvisionedProductPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecuteProvisionedProductServiceActionOutput {
  /// An object containing detailed information about the result of provisioning
  /// the product.
  @_s.JsonKey(name: 'RecordDetail')
  final RecordDetail recordDetail;

  ExecuteProvisionedProductServiceActionOutput({
    this.recordDetail,
  });
  factory ExecuteProvisionedProductServiceActionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ExecuteProvisionedProductServiceActionOutputFromJson(json);
}

/// Details of an execution parameter value that is passed to a self-service
/// action when executed on a provisioned product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecutionParameter {
  /// The default values for the execution parameter.
  @_s.JsonKey(name: 'DefaultValues')
  final List<String> defaultValues;

  /// The name of the execution parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The execution parameter type.
  @_s.JsonKey(name: 'Type')
  final String type;

  ExecutionParameter({
    this.defaultValues,
    this.name,
    this.type,
  });
  factory ExecutionParameter.fromJson(Map<String, dynamic> json) =>
      _$ExecutionParameterFromJson(json);
}

/// An object containing information about the error, along with identifying
/// information about the self-service action and its associations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedServiceActionAssociation {
  /// The error code. Valid values are listed below.
  @_s.JsonKey(name: 'ErrorCode')
  final ServiceActionAssociationErrorCode errorCode;

  /// A text description of the error.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  @_s.JsonKey(name: 'ServiceActionId')
  final String serviceActionId;

  FailedServiceActionAssociation({
    this.errorCode,
    this.errorMessage,
    this.productId,
    this.provisioningArtifactId,
    this.serviceActionId,
  });
  factory FailedServiceActionAssociation.fromJson(Map<String, dynamic> json) =>
      _$FailedServiceActionAssociationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAWSOrganizationsAccessStatusOutput {
  /// The status of the portfolio share feature.
  @_s.JsonKey(name: 'AccessStatus')
  final AccessStatus accessStatus;

  GetAWSOrganizationsAccessStatusOutput({
    this.accessStatus,
  });
  factory GetAWSOrganizationsAccessStatusOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetAWSOrganizationsAccessStatusOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProvisionedProductOutputsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the product created as the result of a request. For
  /// example, the output for a CloudFormation-backed product that creates an S3
  /// bucket would include the S3 bucket URL.
  @_s.JsonKey(name: 'Outputs')
  final List<RecordOutput> outputs;

  GetProvisionedProductOutputsOutput({
    this.nextPageToken,
    this.outputs,
  });
  factory GetProvisionedProductOutputsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetProvisionedProductOutputsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportAsProvisionedProductOutput {
  @_s.JsonKey(name: 'RecordDetail')
  final RecordDetail recordDetail;

  ImportAsProvisionedProductOutput({
    this.recordDetail,
  });
  factory ImportAsProvisionedProductOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ImportAsProvisionedProductOutputFromJson(json);
}

/// A launch path object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LaunchPath {
  /// The identifier of the launch path.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the launch path.
  @_s.JsonKey(name: 'Name')
  final String name;

  LaunchPath({
    this.id,
    this.name,
  });
  factory LaunchPath.fromJson(Map<String, dynamic> json) =>
      _$LaunchPathFromJson(json);
}

/// Summary information about a product path for a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LaunchPathSummary {
  /// The constraints on the portfolio-product relationship.
  @_s.JsonKey(name: 'ConstraintSummaries')
  final List<ConstraintSummary> constraintSummaries;

  /// The identifier of the product path.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the portfolio to which the user was assigned.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The tags associated with this product path.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  LaunchPathSummary({
    this.constraintSummaries,
    this.id,
    this.name,
    this.tags,
  });
  factory LaunchPathSummary.fromJson(Map<String, dynamic> json) =>
      _$LaunchPathSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAcceptedPortfolioSharesOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the portfolios.
  @_s.JsonKey(name: 'PortfolioDetails')
  final List<PortfolioDetail> portfolioDetails;

  ListAcceptedPortfolioSharesOutput({
    this.nextPageToken,
    this.portfolioDetails,
  });
  factory ListAcceptedPortfolioSharesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListAcceptedPortfolioSharesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBudgetsForResourceOutput {
  /// Information about the associated budgets.
  @_s.JsonKey(name: 'Budgets')
  final List<BudgetDetail> budgets;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  ListBudgetsForResourceOutput({
    this.budgets,
    this.nextPageToken,
  });
  factory ListBudgetsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBudgetsForResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConstraintsForPortfolioOutput {
  /// Information about the constraints.
  @_s.JsonKey(name: 'ConstraintDetails')
  final List<ConstraintDetail> constraintDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  ListConstraintsForPortfolioOutput({
    this.constraintDetails,
    this.nextPageToken,
  });
  factory ListConstraintsForPortfolioOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListConstraintsForPortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLaunchPathsOutput {
  /// Information about the launch path.
  @_s.JsonKey(name: 'LaunchPathSummaries')
  final List<LaunchPathSummary> launchPathSummaries;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  ListLaunchPathsOutput({
    this.launchPathSummaries,
    this.nextPageToken,
  });
  factory ListLaunchPathsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListLaunchPathsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOrganizationPortfolioAccessOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Displays information about the organization nodes.
  @_s.JsonKey(name: 'OrganizationNodes')
  final List<OrganizationNode> organizationNodes;

  ListOrganizationPortfolioAccessOutput({
    this.nextPageToken,
    this.organizationNodes,
  });
  factory ListOrganizationPortfolioAccessOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListOrganizationPortfolioAccessOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPortfolioAccessOutput {
  /// Information about the AWS accounts with access to the portfolio.
  @_s.JsonKey(name: 'AccountIds')
  final List<String> accountIds;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  ListPortfolioAccessOutput({
    this.accountIds,
    this.nextPageToken,
  });
  factory ListPortfolioAccessOutput.fromJson(Map<String, dynamic> json) =>
      _$ListPortfolioAccessOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPortfoliosForProductOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the portfolios.
  @_s.JsonKey(name: 'PortfolioDetails')
  final List<PortfolioDetail> portfolioDetails;

  ListPortfoliosForProductOutput({
    this.nextPageToken,
    this.portfolioDetails,
  });
  factory ListPortfoliosForProductOutput.fromJson(Map<String, dynamic> json) =>
      _$ListPortfoliosForProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPortfoliosOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the portfolios.
  @_s.JsonKey(name: 'PortfolioDetails')
  final List<PortfolioDetail> portfolioDetails;

  ListPortfoliosOutput({
    this.nextPageToken,
    this.portfolioDetails,
  });
  factory ListPortfoliosOutput.fromJson(Map<String, dynamic> json) =>
      _$ListPortfoliosOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPrincipalsForPortfolioOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// The IAM principals (users or roles) associated with the portfolio.
  @_s.JsonKey(name: 'Principals')
  final List<Principal> principals;

  ListPrincipalsForPortfolioOutput({
    this.nextPageToken,
    this.principals,
  });
  factory ListPrincipalsForPortfolioOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListPrincipalsForPortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProvisionedProductPlansOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the plans.
  @_s.JsonKey(name: 'ProvisionedProductPlans')
  final List<ProvisionedProductPlanSummary> provisionedProductPlans;

  ListProvisionedProductPlansOutput({
    this.nextPageToken,
    this.provisionedProductPlans,
  });
  factory ListProvisionedProductPlansOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListProvisionedProductPlansOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProvisioningArtifactsForServiceActionOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// An array of objects with information about product views and provisioning
  /// artifacts.
  @_s.JsonKey(name: 'ProvisioningArtifactViews')
  final List<ProvisioningArtifactView> provisioningArtifactViews;

  ListProvisioningArtifactsForServiceActionOutput({
    this.nextPageToken,
    this.provisioningArtifactViews,
  });
  factory ListProvisioningArtifactsForServiceActionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListProvisioningArtifactsForServiceActionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProvisioningArtifactsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the provisioning artifacts.
  @_s.JsonKey(name: 'ProvisioningArtifactDetails')
  final List<ProvisioningArtifactDetail> provisioningArtifactDetails;

  ListProvisioningArtifactsOutput({
    this.nextPageToken,
    this.provisioningArtifactDetails,
  });
  factory ListProvisioningArtifactsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListProvisioningArtifactsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecordHistoryOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// The records, in reverse chronological order.
  @_s.JsonKey(name: 'RecordDetails')
  final List<RecordDetail> recordDetails;

  ListRecordHistoryOutput({
    this.nextPageToken,
    this.recordDetails,
  });
  factory ListRecordHistoryOutput.fromJson(Map<String, dynamic> json) =>
      _$ListRecordHistoryOutputFromJson(json);
}

/// The search filter to use when listing history records.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The filter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  ListRecordHistorySearchFilter({
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => _$ListRecordHistorySearchFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourcesForTagOptionOutput {
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  @_s.JsonKey(name: 'PageToken')
  final String pageToken;

  /// Information about the resources.
  @_s.JsonKey(name: 'ResourceDetails')
  final List<ResourceDetail> resourceDetails;

  ListResourcesForTagOptionOutput({
    this.pageToken,
    this.resourceDetails,
  });
  factory ListResourcesForTagOptionOutput.fromJson(Map<String, dynamic> json) =>
      _$ListResourcesForTagOptionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServiceActionsForProvisioningArtifactOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// An object containing information about the self-service actions associated
  /// with the provisioning artifact.
  @_s.JsonKey(name: 'ServiceActionSummaries')
  final List<ServiceActionSummary> serviceActionSummaries;

  ListServiceActionsForProvisioningArtifactOutput({
    this.nextPageToken,
    this.serviceActionSummaries,
  });
  factory ListServiceActionsForProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListServiceActionsForProvisioningArtifactOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServiceActionsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// An object containing information about the service actions associated with
  /// the provisioning artifact.
  @_s.JsonKey(name: 'ServiceActionSummaries')
  final List<ServiceActionSummary> serviceActionSummaries;

  ListServiceActionsOutput({
    this.nextPageToken,
    this.serviceActionSummaries,
  });
  factory ListServiceActionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListServiceActionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStackInstancesForProvisionedProductOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// List of stack instances.
  @_s.JsonKey(name: 'StackInstances')
  final List<StackInstance> stackInstances;

  ListStackInstancesForProvisionedProductOutput({
    this.nextPageToken,
    this.stackInstances,
  });
  factory ListStackInstancesForProvisionedProductOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListStackInstancesForProvisionedProductOutputFromJson(json);
}

/// Filters to use when listing TagOptions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTagOptionsFilters {
  /// The active state.
  @_s.JsonKey(name: 'Active')
  final bool active;

  /// The TagOption key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The TagOption value.
  @_s.JsonKey(name: 'Value')
  final String value;

  ListTagOptionsFilters({
    this.active,
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => _$ListTagOptionsFiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagOptionsOutput {
  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  @_s.JsonKey(name: 'PageToken')
  final String pageToken;

  /// Information about the TagOptions.
  @_s.JsonKey(name: 'TagOptionDetails')
  final List<TagOptionDetail> tagOptionDetails;

  ListTagOptionsOutput({
    this.pageToken,
    this.tagOptionDetails,
  });
  factory ListTagOptionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagOptionsOutputFromJson(json);
}

/// Information about the organization node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrganizationNode {
  /// The organization node type.
  @_s.JsonKey(name: 'Type')
  final OrganizationNodeType type;

  /// The identifier of the organization node.
  @_s.JsonKey(name: 'Value')
  final String value;

  OrganizationNode({
    this.type,
    this.value,
  });
  factory OrganizationNode.fromJson(Map<String, dynamic> json) =>
      _$OrganizationNodeFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationNodeToJson(this);
}

enum OrganizationNodeType {
  @_s.JsonValue('ORGANIZATION')
  organization,
  @_s.JsonValue('ORGANIZATIONAL_UNIT')
  organizationalUnit,
  @_s.JsonValue('ACCOUNT')
  account,
}

extension on OrganizationNodeType {
  String toValue() {
    switch (this) {
      case OrganizationNodeType.organization:
        return 'ORGANIZATION';
      case OrganizationNodeType.organizationalUnit:
        return 'ORGANIZATIONAL_UNIT';
      case OrganizationNodeType.account:
        return 'ACCOUNT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The constraints that the administrator has put on the parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParameterConstraints {
  /// A regular expression that represents the patterns that allow for
  /// <code>String</code> types. The pattern must match the entire parameter value
  /// provided.
  @_s.JsonKey(name: 'AllowedPattern')
  final String allowedPattern;

  /// The values that the administrator has allowed for the parameter.
  @_s.JsonKey(name: 'AllowedValues')
  final List<String> allowedValues;

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
  @_s.JsonKey(name: 'ConstraintDescription')
  final String constraintDescription;

  /// An integer value that determines the largest number of characters you want
  /// to allow for <code>String</code> types.
  @_s.JsonKey(name: 'MaxLength')
  final String maxLength;

  /// A numeric value that determines the largest numeric value you want to allow
  /// for <code>Number</code> types.
  @_s.JsonKey(name: 'MaxValue')
  final String maxValue;

  /// An integer value that determines the smallest number of characters you want
  /// to allow for <code>String</code> types.
  @_s.JsonKey(name: 'MinLength')
  final String minLength;

  /// A numeric value that determines the smallest numeric value you want to allow
  /// for <code>Number</code> types.
  @_s.JsonKey(name: 'MinValue')
  final String minValue;

  ParameterConstraints({
    this.allowedPattern,
    this.allowedValues,
    this.constraintDescription,
    this.maxLength,
    this.maxValue,
    this.minLength,
    this.minValue,
  });
  factory ParameterConstraints.fromJson(Map<String, dynamic> json) =>
      _$ParameterConstraintsFromJson(json);
}

/// Information about a portfolio.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortfolioDetail {
  /// The ARN assigned to the portfolio.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description of the portfolio.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name to use for display purposes.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The portfolio identifier.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the portfolio provider.
  @_s.JsonKey(name: 'ProviderName')
  final String providerName;

  PortfolioDetail({
    this.arn,
    this.createdTime,
    this.description,
    this.displayName,
    this.id,
    this.providerName,
  });
  factory PortfolioDetail.fromJson(Map<String, dynamic> json) =>
      _$PortfolioDetailFromJson(json);
}

/// Information about the portfolio share.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortfolioShareDetail {
  /// Indicates whether the shared portfolio is imported by the recipient account.
  /// If the recipient is in an organization node, the share is automatically
  /// imported, and the field is always set to true.
  @_s.JsonKey(name: 'Accepted')
  final bool accepted;

  /// The identifier of the recipient entity that received the portfolio share.
  /// The recipient entities can be one of the following:
  ///
  /// 1. An external account.
  ///
  /// 2. An organziation member account.
  ///
  /// 3. An organzational unit (OU).
  ///
  /// 4. The organization itself. (This shares with every account in the
  /// organization).
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// Indicates whether TagOptions sharing is enabled or disabled for the
  /// portfolio share.
  @_s.JsonKey(name: 'ShareTagOptions')
  final bool shareTagOptions;

  /// The type of the portfolio share.
  @_s.JsonKey(name: 'Type')
  final DescribePortfolioShareType type;

  PortfolioShareDetail({
    this.accepted,
    this.principalId,
    this.shareTagOptions,
    this.type,
  });
  factory PortfolioShareDetail.fromJson(Map<String, dynamic> json) =>
      _$PortfolioShareDetailFromJson(json);
}

enum PortfolioShareType {
  @_s.JsonValue('IMPORTED')
  imported,
  @_s.JsonValue('AWS_SERVICECATALOG')
  awsServicecatalog,
  @_s.JsonValue('AWS_ORGANIZATIONS')
  awsOrganizations,
}

extension on PortfolioShareType {
  String toValue() {
    switch (this) {
      case PortfolioShareType.imported:
        return 'IMPORTED';
      case PortfolioShareType.awsServicecatalog:
        return 'AWS_SERVICECATALOG';
      case PortfolioShareType.awsOrganizations:
        return 'AWS_ORGANIZATIONS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Principal {
  /// The ARN of the principal (IAM user, role, or group).
  @_s.JsonKey(name: 'PrincipalARN')
  final String principalARN;

  /// The principal type. The supported value is <code>IAM</code>.
  @_s.JsonKey(name: 'PrincipalType')
  final PrincipalType principalType;

  Principal({
    this.principalARN,
    this.principalType,
  });
  factory Principal.fromJson(Map<String, dynamic> json) =>
      _$PrincipalFromJson(json);
}

enum PrincipalType {
  @_s.JsonValue('IAM')
  iam,
}

extension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.iam:
        return 'IAM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ProductSource {
  @_s.JsonValue('ACCOUNT')
  account,
}

extension on ProductSource {
  String toValue() {
    switch (this) {
      case ProductSource.account:
        return 'ACCOUNT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ProductType {
  @_s.JsonValue('CLOUD_FORMATION_TEMPLATE')
  cloudFormationTemplate,
  @_s.JsonValue('MARKETPLACE')
  marketplace,
}

extension on ProductType {
  String toValue() {
    switch (this) {
      case ProductType.cloudFormationTemplate:
        return 'CLOUD_FORMATION_TEMPLATE';
      case ProductType.marketplace:
        return 'MARKETPLACE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A single product view aggregation value/count pair, containing metadata
/// about each product to which the calling user has access.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductViewAggregationValue {
  /// An approximate count of the products that match the value.
  @_s.JsonKey(name: 'ApproximateCount')
  final int approximateCount;

  /// The value of the product view aggregation.
  @_s.JsonKey(name: 'Value')
  final String value;

  ProductViewAggregationValue({
    this.approximateCount,
    this.value,
  });
  factory ProductViewAggregationValue.fromJson(Map<String, dynamic> json) =>
      _$ProductViewAggregationValueFromJson(json);
}

/// Information about a product view.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductViewDetail {
  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The ARN of the product.
  @_s.JsonKey(name: 'ProductARN')
  final String productARN;

  /// Summary information about the product view.
  @_s.JsonKey(name: 'ProductViewSummary')
  final ProductViewSummary productViewSummary;

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
  @_s.JsonKey(name: 'Status')
  final Status status;

  ProductViewDetail({
    this.createdTime,
    this.productARN,
    this.productViewSummary,
    this.status,
  });
  factory ProductViewDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductViewDetailFromJson(json);
}

enum ProductViewFilterBy {
  @_s.JsonValue('FullTextSearch')
  fullTextSearch,
  @_s.JsonValue('Owner')
  owner,
  @_s.JsonValue('ProductType')
  productType,
  @_s.JsonValue('SourceProductId')
  sourceProductId,
}

extension on ProductViewFilterBy {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ProductViewSortBy {
  @_s.JsonValue('Title')
  title,
  @_s.JsonValue('VersionCount')
  versionCount,
  @_s.JsonValue('CreationDate')
  creationDate,
}

extension on ProductViewSortBy {
  String toValue() {
    switch (this) {
      case ProductViewSortBy.title:
        return 'Title';
      case ProductViewSortBy.versionCount:
        return 'VersionCount';
      case ProductViewSortBy.creationDate:
        return 'CreationDate';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Summary information about a product view.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductViewSummary {
  /// The distributor of the product. Contact the product administrator for the
  /// significance of this value.
  @_s.JsonKey(name: 'Distributor')
  final String distributor;

  /// Indicates whether the product has a default path. If the product does not
  /// have a default path, call <a>ListLaunchPaths</a> to disambiguate between
  /// paths. Otherwise, <a>ListLaunchPaths</a> is not required, and the output of
  /// <a>ProductViewSummary</a> can be used directly with
  /// <a>DescribeProvisioningParameters</a>.
  @_s.JsonKey(name: 'HasDefaultPath')
  final bool hasDefaultPath;

  /// The product view identifier.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the product.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the product. Contact the product administrator for the
  /// significance of this value.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The product identifier.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// Short description of the product.
  @_s.JsonKey(name: 'ShortDescription')
  final String shortDescription;

  /// The description of the support for this Product.
  @_s.JsonKey(name: 'SupportDescription')
  final String supportDescription;

  /// The email contact information to obtain support for this Product.
  @_s.JsonKey(name: 'SupportEmail')
  final String supportEmail;

  /// The URL information to obtain support for this Product.
  @_s.JsonKey(name: 'SupportUrl')
  final String supportUrl;

  /// The product type. Contact the product administrator for the significance of
  /// this value. If this value is <code>MARKETPLACE</code>, the product was
  /// created by AWS Marketplace.
  @_s.JsonKey(name: 'Type')
  final ProductType type;

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
  factory ProductViewSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductViewSummaryFromJson(json);
}

enum PropertyKey {
  @_s.JsonValue('OWNER')
  owner,
  @_s.JsonValue('LAUNCH_ROLE')
  launchRole,
}

extension on PropertyKey {
  String toValue() {
    switch (this) {
      case PropertyKey.owner:
        return 'OWNER';
      case PropertyKey.launchRole:
        return 'LAUNCH_ROLE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionProductOutput {
  /// Information about the result of provisioning the product.
  @_s.JsonKey(name: 'RecordDetail')
  final RecordDetail recordDetail;

  ProvisionProductOutput({
    this.recordDetail,
  });
  factory ProvisionProductOutput.fromJson(Map<String, dynamic> json) =>
      _$ProvisionProductOutputFromJson(json);
}

/// Information about a provisioned product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionedProductAttribute {
  /// The ARN of the provisioned product.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The identifier of the provisioned product.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is returned
  /// for each repeated request.
  @_s.JsonKey(name: 'IdempotencyToken')
  final String idempotencyToken;

  /// The record identifier of the last request performed on this provisioned
  /// product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionedProduct
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
  @_s.JsonKey(name: 'LastProvisioningRecordId')
  final String lastProvisioningRecordId;

  /// The record identifier of the last request performed on this provisioned
  /// product.
  @_s.JsonKey(name: 'LastRecordId')
  final String lastRecordId;

  /// The record identifier of the last successful request performed on this
  /// provisioned product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionedProduct
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
  @_s.JsonKey(name: 'LastSuccessfulProvisioningRecordId')
  final String lastSuccessfulProvisioningRecordId;

  /// The user-friendly name of the provisioned product.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The assigned identifier for the resource, such as an EC2 instance ID or an
  /// S3 bucket name.
  @_s.JsonKey(name: 'PhysicalId')
  final String physicalId;

  /// The product identifier.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// The name of the product.
  @_s.JsonKey(name: 'ProductName')
  final String productName;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

  /// The name of the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactName')
  final String provisioningArtifactName;

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
  @_s.JsonKey(name: 'Status')
  final ProvisionedProductStatus status;

  /// The current status message of the provisioned product.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// One or more tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The type of provisioned product. The supported values are
  /// <code>CFN_STACK</code> and <code>CFN_STACKSET</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The Amazon Resource Name (ARN) of the IAM user.
  @_s.JsonKey(name: 'UserArn')
  final String userArn;

  /// The ARN of the IAM user in the session. This ARN might contain a session ID.
  @_s.JsonKey(name: 'UserArnSession')
  final String userArnSession;

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
  factory ProvisionedProductAttribute.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedProductAttributeFromJson(json);
}

/// Information about a provisioned product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionedProductDetail {
  /// The ARN of the provisioned product.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The identifier of the provisioned product.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is returned
  /// for each repeated request.
  @_s.JsonKey(name: 'IdempotencyToken')
  final String idempotencyToken;

  /// The record identifier of the last request performed on this provisioned
  /// product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionedProduct
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
  @_s.JsonKey(name: 'LastProvisioningRecordId')
  final String lastProvisioningRecordId;

  /// The record identifier of the last request performed on this provisioned
  /// product.
  @_s.JsonKey(name: 'LastRecordId')
  final String lastRecordId;

  /// The record identifier of the last successful request performed on this
  /// provisioned product of the following types:
  ///
  /// <ul>
  /// <li>
  /// ProvisionedProduct
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
  @_s.JsonKey(name: 'LastSuccessfulProvisioningRecordId')
  final String lastSuccessfulProvisioningRecordId;

  /// The ARN of the launch role associated with the provisioned product.
  @_s.JsonKey(name: 'LaunchRoleArn')
  final String launchRoleArn;

  /// The user-friendly name of the provisioned product.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

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
  @_s.JsonKey(name: 'Status')
  final ProvisionedProductStatus status;

  /// The current status message of the provisioned product.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// The type of provisioned product. The supported values are
  /// <code>CFN_STACK</code> and <code>CFN_STACKSET</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

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
  factory ProvisionedProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedProductDetailFromJson(json);
}

/// Information about a plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionedProductPlanDetails {
  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Passed to CloudFormation. The SNS topic ARNs to which to publish
  /// stack-related events.
  @_s.JsonKey(name: 'NotificationArns')
  final List<String> notificationArns;

  /// The path identifier of the product. This value is optional if the product
  /// has a default path, and required if the product has more than one path. To
  /// list the paths for a product, use <a>ListLaunchPaths</a>.
  @_s.JsonKey(name: 'PathId')
  final String pathId;

  /// The plan identifier.
  @_s.JsonKey(name: 'PlanId')
  final String planId;

  /// The name of the plan.
  @_s.JsonKey(name: 'PlanName')
  final String planName;

  /// The plan type.
  @_s.JsonKey(name: 'PlanType')
  final ProvisionedProductPlanType planType;

  /// The product identifier.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// The product identifier.
  @_s.JsonKey(name: 'ProvisionProductId')
  final String provisionProductId;

  /// The user-friendly name of the provisioned product.
  @_s.JsonKey(name: 'ProvisionProductName')
  final String provisionProductName;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

  /// Parameters specified by the administrator that are required for provisioning
  /// the product.
  @_s.JsonKey(name: 'ProvisioningParameters')
  final List<UpdateProvisioningParameter> provisioningParameters;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final ProvisionedProductPlanStatus status;

  /// The status message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// One or more tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The time when the plan was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTime')
  final DateTime updatedTime;

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
  factory ProvisionedProductPlanDetails.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedProductPlanDetailsFromJson(json);
}

enum ProvisionedProductPlanStatus {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_SUCCESS')
  createSuccess,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('EXECUTE_IN_PROGRESS')
  executeInProgress,
  @_s.JsonValue('EXECUTE_SUCCESS')
  executeSuccess,
  @_s.JsonValue('EXECUTE_FAILED')
  executeFailed,
}

/// Summary information about a plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionedProductPlanSummary {
  /// The plan identifier.
  @_s.JsonKey(name: 'PlanId')
  final String planId;

  /// The name of the plan.
  @_s.JsonKey(name: 'PlanName')
  final String planName;

  /// The plan type.
  @_s.JsonKey(name: 'PlanType')
  final ProvisionedProductPlanType planType;

  /// The product identifier.
  @_s.JsonKey(name: 'ProvisionProductId')
  final String provisionProductId;

  /// The user-friendly name of the provisioned product.
  @_s.JsonKey(name: 'ProvisionProductName')
  final String provisionProductName;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

  ProvisionedProductPlanSummary({
    this.planId,
    this.planName,
    this.planType,
    this.provisionProductId,
    this.provisionProductName,
    this.provisioningArtifactId,
  });
  factory ProvisionedProductPlanSummary.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedProductPlanSummaryFromJson(json);
}

enum ProvisionedProductPlanType {
  @_s.JsonValue('CLOUDFORMATION')
  cloudformation,
}

extension on ProvisionedProductPlanType {
  String toValue() {
    switch (this) {
      case ProvisionedProductPlanType.cloudformation:
        return 'CLOUDFORMATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ProvisionedProductStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('UNDER_CHANGE')
  underChange,
  @_s.JsonValue('TAINTED')
  tainted,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('PLAN_IN_PROGRESS')
  planInProgress,
}

enum ProvisionedProductViewFilterBy {
  @_s.JsonValue('SearchQuery')
  searchQuery,
}

extension on ProvisionedProductViewFilterBy {
  String toValue() {
    switch (this) {
      case ProvisionedProductViewFilterBy.searchQuery:
        return 'SearchQuery';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a provisioning artifact. A provisioning artifact is also
/// known as a product version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningArtifact {
  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description of the provisioning artifact.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Information set by the administrator to provide guidance to end users about
  /// which provisioning artifacts to use.
  @_s.JsonKey(name: 'Guidance')
  final ProvisioningArtifactGuidance guidance;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the provisioning artifact.
  @_s.JsonKey(name: 'Name')
  final String name;

  ProvisioningArtifact({
    this.createdTime,
    this.description,
    this.guidance,
    this.id,
    this.name,
  });
  factory ProvisioningArtifact.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningArtifactFromJson(json);
}

/// Information about a provisioning artifact (also known as a version) for a
/// product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningArtifactDetail {
  /// Indicates whether the product version is active.
  @_s.JsonKey(name: 'Active')
  final bool active;

  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description of the provisioning artifact.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Information set by the administrator to provide guidance to end users about
  /// which provisioning artifacts to use.
  @_s.JsonKey(name: 'Guidance')
  final ProvisioningArtifactGuidance guidance;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the provisioning artifact.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of provisioning artifact.
  ///
  /// <ul>
  /// <li>
  /// <code>CLOUD_FORMATION_TEMPLATE</code> - AWS CloudFormation template
  /// </li>
  /// <li>
  /// <code>MARKETPLACE_AMI</code> - AWS Marketplace AMI
  /// </li>
  /// <li>
  /// <code>MARKETPLACE_CAR</code> - AWS Marketplace Clusters and AWS Resources
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final ProvisioningArtifactType type;

  ProvisioningArtifactDetail({
    this.active,
    this.createdTime,
    this.description,
    this.guidance,
    this.id,
    this.name,
    this.type,
  });
  factory ProvisioningArtifactDetail.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningArtifactDetailFromJson(json);
}

enum ProvisioningArtifactGuidance {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('DEPRECATED')
  deprecated,
}

extension on ProvisioningArtifactGuidance {
  String toValue() {
    switch (this) {
      case ProvisioningArtifactGuidance.$default:
        return 'DEFAULT';
      case ProvisioningArtifactGuidance.deprecated:
        return 'DEPRECATED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provisioning artifact output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningArtifactOutput {
  /// Description of the provisioning artifact output key.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The provisioning artifact output key.
  @_s.JsonKey(name: 'Key')
  final String key;

  ProvisioningArtifactOutput({
    this.description,
    this.key,
  });
  factory ProvisioningArtifactOutput.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningArtifactOutputFromJson(json);
}

/// Information about a parameter used to provision a product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningArtifactParameter {
  /// The default value.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;

  /// The description of the parameter.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// If this value is true, the value for this parameter is obfuscated from view
  /// when the parameter is retrieved. This parameter is used to hide sensitive
  /// information.
  @_s.JsonKey(name: 'IsNoEcho')
  final bool isNoEcho;

  /// Constraints that the administrator has put on a parameter.
  @_s.JsonKey(name: 'ParameterConstraints')
  final ParameterConstraints parameterConstraints;

  /// The parameter key.
  @_s.JsonKey(name: 'ParameterKey')
  final String parameterKey;

  /// The parameter type.
  @_s.JsonKey(name: 'ParameterType')
  final String parameterType;

  ProvisioningArtifactParameter({
    this.defaultValue,
    this.description,
    this.isNoEcho,
    this.parameterConstraints,
    this.parameterKey,
    this.parameterType,
  });
  factory ProvisioningArtifactParameter.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningArtifactParameterFromJson(json);
}

/// The user-defined preferences that will be applied during product
/// provisioning, unless overridden by <code>ProvisioningPreferences</code> or
/// <code>UpdateProvisioningPreferences</code>.
///
/// For more information on maximum concurrent accounts and failure tolerance,
/// see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack
/// set operation options</a> in the <i>AWS CloudFormation User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningArtifactPreferences {
  /// One or more AWS accounts where stack instances are deployed from the stack
  /// set. These accounts can be scoped in
  /// <code>ProvisioningPreferences$StackSetAccounts</code> and
  /// <code>UpdateProvisioningPreferences$StackSetAccounts</code>.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  @_s.JsonKey(name: 'StackSetAccounts')
  final List<String> stackSetAccounts;

  /// One or more AWS Regions where stack instances are deployed from the stack
  /// set. These regions can be scoped in
  /// <code>ProvisioningPreferences$StackSetRegions</code> and
  /// <code>UpdateProvisioningPreferences$StackSetRegions</code>.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  @_s.JsonKey(name: 'StackSetRegions')
  final List<String> stackSetRegions;

  ProvisioningArtifactPreferences({
    this.stackSetAccounts,
    this.stackSetRegions,
  });
  factory ProvisioningArtifactPreferences.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningArtifactPreferencesFromJson(json);
}

/// Information about a provisioning artifact (also known as a version) for a
/// product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ProvisioningArtifactProperties {
  /// Specify the template source with one of the following options, but not both.
  /// Keys accepted: [ <code>LoadTemplateFromURL</code>,
  /// <code>ImportFromPhysicalId</code> ]
  ///
  /// The URL of the CloudFormation template in Amazon S3. Specify the URL in JSON
  /// format as follows:
  ///
  /// <code>"LoadTemplateFromURL":
  /// "https://s3.amazonaws.com/cf-templates-ozkq9d3hgiq2-us-east-1/..."</code>
  ///
  /// <code>ImportFromPhysicalId</code>: The physical id of the resource that
  /// contains the template. Currently only supports CloudFormation stack arn.
  /// Specify the physical id in JSON format as follows:
  /// <code>ImportFromPhysicalId:
  /// “arn:aws:cloudformation:[us-east-1]:[accountId]:stack/[StackName]/[resourceId]</code>
  @_s.JsonKey(name: 'Info')
  final Map<String, String> info;

  /// The description of the provisioning artifact, including how it differs from
  /// the previous provisioning artifact.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// If set to true, AWS Service Catalog stops validating the specified
  /// provisioning artifact even if it is invalid.
  @_s.JsonKey(name: 'DisableTemplateValidation')
  final bool disableTemplateValidation;

  /// The name of the provisioning artifact (for example, v1 v2beta). No spaces
  /// are allowed.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of provisioning artifact.
  ///
  /// <ul>
  /// <li>
  /// <code>CLOUD_FORMATION_TEMPLATE</code> - AWS CloudFormation template
  /// </li>
  /// <li>
  /// <code>MARKETPLACE_AMI</code> - AWS Marketplace AMI
  /// </li>
  /// <li>
  /// <code>MARKETPLACE_CAR</code> - AWS Marketplace Clusters and AWS Resources
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final ProvisioningArtifactType type;

  ProvisioningArtifactProperties({
    @_s.required this.info,
    this.description,
    this.disableTemplateValidation,
    this.name,
    this.type,
  });
  Map<String, dynamic> toJson() => _$ProvisioningArtifactPropertiesToJson(this);
}

enum ProvisioningArtifactPropertyName {
  @_s.JsonValue('Id')
  id,
}

extension on ProvisioningArtifactPropertyName {
  String toValue() {
    switch (this) {
      case ProvisioningArtifactPropertyName.id:
        return 'Id';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Summary information about a provisioning artifact (also known as a version)
/// for a product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningArtifactSummary {
  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description of the provisioning artifact.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the provisioning artifact.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The metadata for the provisioning artifact. This is used with AWS
  /// Marketplace products.
  @_s.JsonKey(name: 'ProvisioningArtifactMetadata')
  final Map<String, String> provisioningArtifactMetadata;

  ProvisioningArtifactSummary({
    this.createdTime,
    this.description,
    this.id,
    this.name,
    this.provisioningArtifactMetadata,
  });
  factory ProvisioningArtifactSummary.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningArtifactSummaryFromJson(json);
}

enum ProvisioningArtifactType {
  @_s.JsonValue('CLOUD_FORMATION_TEMPLATE')
  cloudFormationTemplate,
  @_s.JsonValue('MARKETPLACE_AMI')
  marketplaceAmi,
  @_s.JsonValue('MARKETPLACE_CAR')
  marketplaceCar,
}

/// An object that contains summary information about a product view and a
/// provisioning artifact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningArtifactView {
  /// Summary information about a product view.
  @_s.JsonKey(name: 'ProductViewSummary')
  final ProductViewSummary productViewSummary;

  /// Information about a provisioning artifact. A provisioning artifact is also
  /// known as a product version.
  @_s.JsonKey(name: 'ProvisioningArtifact')
  final ProvisioningArtifact provisioningArtifact;

  ProvisioningArtifactView({
    this.productViewSummary,
    this.provisioningArtifact,
  });
  factory ProvisioningArtifactView.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningArtifactViewFromJson(json);
}

/// Information about a parameter used to provision a product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ProvisioningParameter {
  /// The parameter key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The parameter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  ProvisioningParameter({
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => _$ProvisioningParameterToJson(this);
}

/// The user-defined preferences that will be applied when updating a
/// provisioned product. Not all preferences are applicable to all provisioned
/// product type
///
/// One or more AWS accounts that will have access to the provisioned product.
///
/// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
///
/// The AWS accounts specified should be within the list of accounts in the
/// <code>STACKSET</code> constraint. To get the list of accounts in the
/// <code>STACKSET</code> constraint, use the
/// <code>DescribeProvisioningParameters</code> operation.
///
/// If no values are specified, the default value is all accounts from the
/// <code>STACKSET</code> constraint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ProvisioningPreferences {
  /// One or more AWS accounts where the provisioned product will be available.
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
  @_s.JsonKey(name: 'StackSetAccounts')
  final List<String> stackSetAccounts;

  /// The number of accounts, per region, for which this operation can fail before
  /// AWS Service Catalog stops the operation in that region. If the operation is
  /// stopped in a region, AWS Service Catalog doesn't attempt the operation in
  /// any subsequent regions.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  ///
  /// The default value is <code>0</code> if no value is specified.
  @_s.JsonKey(name: 'StackSetFailureToleranceCount')
  final int stackSetFailureToleranceCount;

  /// The percentage of accounts, per region, for which this stack operation can
  /// fail before AWS Service Catalog stops the operation in that region. If the
  /// operation is stopped in a region, AWS Service Catalog doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  @_s.JsonKey(name: 'StackSetFailureTolerancePercentage')
  final int stackSetFailureTolerancePercentage;

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
  @_s.JsonKey(name: 'StackSetMaxConcurrencyCount')
  final int stackSetMaxConcurrencyCount;

  /// The maximum percentage of accounts in which to perform this operation at one
  /// time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number. This is true
  /// except in cases where rounding down would result is zero. In this case, AWS
  /// Service Catalog sets the number as <code>1</code> instead.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of accounts
  /// acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either <code>StackSetMaxConcurrentCount</code>
  /// or <code>StackSetMaxConcurrentPercentage</code>, but not both.
  @_s.JsonKey(name: 'StackSetMaxConcurrencyPercentage')
  final int stackSetMaxConcurrencyPercentage;

  /// One or more AWS Regions where the provisioned product will be available.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// The specified regions should be within the list of regions from the
  /// <code>STACKSET</code> constraint. To get the list of regions in the
  /// <code>STACKSET</code> constraint, use the
  /// <code>DescribeProvisioningParameters</code> operation.
  ///
  /// If no values are specified, the default value is all regions from the
  /// <code>STACKSET</code> constraint.
  @_s.JsonKey(name: 'StackSetRegions')
  final List<String> stackSetRegions;

  ProvisioningPreferences({
    this.stackSetAccounts,
    this.stackSetFailureToleranceCount,
    this.stackSetFailureTolerancePercentage,
    this.stackSetMaxConcurrencyCount,
    this.stackSetMaxConcurrencyPercentage,
    this.stackSetRegions,
  });
  Map<String, dynamic> toJson() => _$ProvisioningPreferencesToJson(this);
}

/// Information about a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecordDetail {
  /// The UTC time stamp of the creation time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The ARN of the launch role associated with the provisioned product.
  @_s.JsonKey(name: 'LaunchRoleArn')
  final String launchRoleArn;

  /// The path identifier.
  @_s.JsonKey(name: 'PathId')
  final String pathId;

  /// The product identifier.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// The identifier of the provisioned product.
  @_s.JsonKey(name: 'ProvisionedProductId')
  final String provisionedProductId;

  /// The user-friendly name of the provisioned product.
  @_s.JsonKey(name: 'ProvisionedProductName')
  final String provisionedProductName;

  /// The type of provisioned product. The supported values are
  /// <code>CFN_STACK</code> and <code>CFN_STACKSET</code>.
  @_s.JsonKey(name: 'ProvisionedProductType')
  final String provisionedProductType;

  /// The identifier of the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

  /// The errors that occurred.
  @_s.JsonKey(name: 'RecordErrors')
  final List<RecordError> recordErrors;

  /// The identifier of the record.
  @_s.JsonKey(name: 'RecordId')
  final String recordId;

  /// One or more tags.
  @_s.JsonKey(name: 'RecordTags')
  final List<RecordTag> recordTags;

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
  @_s.JsonKey(name: 'RecordType')
  final String recordType;

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
  @_s.JsonKey(name: 'Status')
  final RecordStatus status;

  /// The time when the record was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTime')
  final DateTime updatedTime;

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
  factory RecordDetail.fromJson(Map<String, dynamic> json) =>
      _$RecordDetailFromJson(json);
}

/// The error code and description resulting from an operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecordError {
  /// The numeric value of the error.
  @_s.JsonKey(name: 'Code')
  final String code;

  /// The description of the error.
  @_s.JsonKey(name: 'Description')
  final String description;

  RecordError({
    this.code,
    this.description,
  });
  factory RecordError.fromJson(Map<String, dynamic> json) =>
      _$RecordErrorFromJson(json);
}

/// The output for the product created as the result of a request. For example,
/// the output for a CloudFormation-backed product that creates an S3 bucket
/// would include the S3 bucket URL.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecordOutput {
  /// The description of the output.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The output key.
  @_s.JsonKey(name: 'OutputKey')
  final String outputKey;

  /// The output value.
  @_s.JsonKey(name: 'OutputValue')
  final String outputValue;

  RecordOutput({
    this.description,
    this.outputKey,
    this.outputValue,
  });
  factory RecordOutput.fromJson(Map<String, dynamic> json) =>
      _$RecordOutputFromJson(json);
}

enum RecordStatus {
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('IN_PROGRESS_IN_ERROR')
  inProgressInError,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

/// Information about a tag, which is a key-value pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecordTag {
  /// The key for this tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for this tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  RecordTag({
    this.key,
    this.value,
  });
  factory RecordTag.fromJson(Map<String, dynamic> json) =>
      _$RecordTagFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectPortfolioShareOutput {
  RejectPortfolioShareOutput();
  factory RejectPortfolioShareOutput.fromJson(Map<String, dynamic> json) =>
      _$RejectPortfolioShareOutputFromJson(json);
}

enum Replacement {
  @_s.JsonValue('TRUE')
  $true,
  @_s.JsonValue('FALSE')
  $false,
  @_s.JsonValue('CONDITIONAL')
  conditional,
}

enum RequiresRecreation {
  @_s.JsonValue('NEVER')
  never,
  @_s.JsonValue('CONDITIONALLY')
  conditionally,
  @_s.JsonValue('ALWAYS')
  always,
}

enum ResourceAttribute {
  @_s.JsonValue('PROPERTIES')
  properties,
  @_s.JsonValue('METADATA')
  metadata,
  @_s.JsonValue('CREATIONPOLICY')
  creationpolicy,
  @_s.JsonValue('UPDATEPOLICY')
  updatepolicy,
  @_s.JsonValue('DELETIONPOLICY')
  deletionpolicy,
  @_s.JsonValue('TAGS')
  tags,
}

/// Information about a resource change that will occur when a plan is executed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceChange {
  /// The change action.
  @_s.JsonKey(name: 'Action')
  final ChangeAction action;

  /// Information about the resource changes.
  @_s.JsonKey(name: 'Details')
  final List<ResourceChangeDetail> details;

  /// The ID of the resource, as defined in the CloudFormation template.
  @_s.JsonKey(name: 'LogicalResourceId')
  final String logicalResourceId;

  /// The ID of the resource, if it was already created.
  @_s.JsonKey(name: 'PhysicalResourceId')
  final String physicalResourceId;

  /// If the change type is <code>Modify</code>, indicates whether the existing
  /// resource is deleted and replaced with a new one.
  @_s.JsonKey(name: 'Replacement')
  final Replacement replacement;

  /// The type of resource.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The change scope.
  @_s.JsonKey(name: 'Scope')
  final List<ResourceAttribute> scope;

  ResourceChange({
    this.action,
    this.details,
    this.logicalResourceId,
    this.physicalResourceId,
    this.replacement,
    this.resourceType,
    this.scope,
  });
  factory ResourceChange.fromJson(Map<String, dynamic> json) =>
      _$ResourceChangeFromJson(json);
}

/// Information about a change to a resource attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceChangeDetail {
  /// The ID of the entity that caused the change.
  @_s.JsonKey(name: 'CausingEntity')
  final String causingEntity;

  /// For static evaluations, the value of the resource attribute will change and
  /// the new value is known. For dynamic evaluations, the value might change, and
  /// any new value will be determined when the plan is updated.
  @_s.JsonKey(name: 'Evaluation')
  final EvaluationType evaluation;

  /// Information about the resource attribute to be modified.
  @_s.JsonKey(name: 'Target')
  final ResourceTargetDefinition target;

  ResourceChangeDetail({
    this.causingEntity,
    this.evaluation,
    this.target,
  });
  factory ResourceChangeDetail.fromJson(Map<String, dynamic> json) =>
      _$ResourceChangeDetailFromJson(json);
}

/// Information about a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceDetail {
  /// The ARN of the resource.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The creation time of the resource.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description of the resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier of the resource.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  ResourceDetail({
    this.arn,
    this.createdTime,
    this.description,
    this.id,
    this.name,
  });
  factory ResourceDetail.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailFromJson(json);
}

/// Information about a change to a resource attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceTargetDefinition {
  /// The attribute to be changed.
  @_s.JsonKey(name: 'Attribute')
  final ResourceAttribute attribute;

  /// If the attribute is <code>Properties</code>, the value is the name of the
  /// property. Otherwise, the value is null.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// If the attribute is <code>Properties</code>, indicates whether a change to
  /// this property causes the resource to be re-created.
  @_s.JsonKey(name: 'RequiresRecreation')
  final RequiresRecreation requiresRecreation;

  ResourceTargetDefinition({
    this.attribute,
    this.name,
    this.requiresRecreation,
  });
  factory ResourceTargetDefinition.fromJson(Map<String, dynamic> json) =>
      _$ResourceTargetDefinitionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScanProvisionedProductsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the provisioned products.
  @_s.JsonKey(name: 'ProvisionedProducts')
  final List<ProvisionedProductDetail> provisionedProducts;

  ScanProvisionedProductsOutput({
    this.nextPageToken,
    this.provisionedProducts,
  });
  factory ScanProvisionedProductsOutput.fromJson(Map<String, dynamic> json) =>
      _$ScanProvisionedProductsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchProductsAsAdminOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the product views.
  @_s.JsonKey(name: 'ProductViewDetails')
  final List<ProductViewDetail> productViewDetails;

  SearchProductsAsAdminOutput({
    this.nextPageToken,
    this.productViewDetails,
  });
  factory SearchProductsAsAdminOutput.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsAsAdminOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchProductsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// The product view aggregations.
  @_s.JsonKey(name: 'ProductViewAggregations')
  final Map<String, List<ProductViewAggregationValue>> productViewAggregations;

  /// Information about the product views.
  @_s.JsonKey(name: 'ProductViewSummaries')
  final List<ProductViewSummary> productViewSummaries;

  SearchProductsOutput({
    this.nextPageToken,
    this.productViewAggregations,
    this.productViewSummaries,
  });
  factory SearchProductsOutput.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchProvisionedProductsOutput {
  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Information about the provisioned products.
  @_s.JsonKey(name: 'ProvisionedProducts')
  final List<ProvisionedProductAttribute> provisionedProducts;

  /// The number of provisioned products found.
  @_s.JsonKey(name: 'TotalResultsCount')
  final int totalResultsCount;

  SearchProvisionedProductsOutput({
    this.nextPageToken,
    this.provisionedProducts,
    this.totalResultsCount,
  });
  factory SearchProvisionedProductsOutput.fromJson(Map<String, dynamic> json) =>
      _$SearchProvisionedProductsOutputFromJson(json);
}

/// A self-service action association consisting of the Action ID, the Product
/// ID, and the Provisioning Artifact ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ServiceActionAssociation {
  /// The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// The identifier of the provisioning artifact. For example,
  /// <code>pa-4abcdjnxjj6ne</code>.
  @_s.JsonKey(name: 'ProvisioningArtifactId')
  final String provisioningArtifactId;

  /// The self-service action identifier. For example,
  /// <code>act-fs7abcd89wxyz</code>.
  @_s.JsonKey(name: 'ServiceActionId')
  final String serviceActionId;

  ServiceActionAssociation({
    @_s.required this.productId,
    @_s.required this.provisioningArtifactId,
    @_s.required this.serviceActionId,
  });
  Map<String, dynamic> toJson() => _$ServiceActionAssociationToJson(this);
}

enum ServiceActionAssociationErrorCode {
  @_s.JsonValue('DUPLICATE_RESOURCE')
  duplicateResource,
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
  @_s.JsonValue('LIMIT_EXCEEDED')
  limitExceeded,
  @_s.JsonValue('RESOURCE_NOT_FOUND')
  resourceNotFound,
  @_s.JsonValue('THROTTLING')
  throttling,
}

enum ServiceActionDefinitionKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('Version')
  version,
  @_s.JsonValue('AssumeRole')
  assumeRole,
  @_s.JsonValue('Parameters')
  parameters,
}

extension on ServiceActionDefinitionKey {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ServiceActionDefinitionType {
  @_s.JsonValue('SSM_AUTOMATION')
  ssmAutomation,
}

extension on ServiceActionDefinitionType {
  String toValue() {
    switch (this) {
      case ServiceActionDefinitionType.ssmAutomation:
        return 'SSM_AUTOMATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object containing detailed information about the self-service action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceActionDetail {
  /// A map that defines the self-service action.
  @_s.JsonKey(name: 'Definition')
  final Map<ServiceActionDefinitionKey, String> definition;

  /// Summary information about the self-service action.
  @_s.JsonKey(name: 'ServiceActionSummary')
  final ServiceActionSummary serviceActionSummary;

  ServiceActionDetail({
    this.definition,
    this.serviceActionSummary,
  });
  factory ServiceActionDetail.fromJson(Map<String, dynamic> json) =>
      _$ServiceActionDetailFromJson(json);
}

/// Detailed information about the self-service action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceActionSummary {
  /// The self-service action definition type. For example,
  /// <code>SSM_AUTOMATION</code>.
  @_s.JsonKey(name: 'DefinitionType')
  final ServiceActionDefinitionType definitionType;

  /// The self-service action description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The self-service action identifier.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The self-service action name.
  @_s.JsonKey(name: 'Name')
  final String name;

  ServiceActionSummary({
    this.definitionType,
    this.description,
    this.id,
    this.name,
  });
  factory ServiceActionSummary.fromJson(Map<String, dynamic> json) =>
      _$ServiceActionSummaryFromJson(json);
}

/// Information about the portfolio share operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShareDetails {
  /// List of errors.
  @_s.JsonKey(name: 'ShareErrors')
  final List<ShareError> shareErrors;

  /// List of accounts for whom the operation succeeded.
  @_s.JsonKey(name: 'SuccessfulShares')
  final List<String> successfulShares;

  ShareDetails({
    this.shareErrors,
    this.successfulShares,
  });
  factory ShareDetails.fromJson(Map<String, dynamic> json) =>
      _$ShareDetailsFromJson(json);
}

/// Errors that occurred during the portfolio share operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShareError {
  /// List of accounts impacted by the error.
  @_s.JsonKey(name: 'Accounts')
  final List<String> accounts;

  /// Error type that happened when processing the operation.
  @_s.JsonKey(name: 'Error')
  final String error;

  /// Information about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  ShareError({
    this.accounts,
    this.error,
    this.message,
  });
  factory ShareError.fromJson(Map<String, dynamic> json) =>
      _$ShareErrorFromJson(json);
}

enum ShareStatus {
  @_s.JsonValue('NOT_STARTED')
  notStarted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('COMPLETED_WITH_ERRORS')
  completedWithErrors,
  @_s.JsonValue('ERROR')
  error,
}

enum SortOrder {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An AWS CloudFormation stack, in a specific account and region, that's part
/// of a stack set operation. A stack instance is a reference to an attempted or
/// actual stack in a given account within a given region. A stack instance can
/// exist without a stack—for example, if the stack couldn't be created for some
/// reason. A stack instance is associated with only one stack set. Each stack
/// instance contains the ID of its associated stack set, as well as the ID of
/// the actual stack and the stack status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StackInstance {
  /// The name of the AWS account that the stack instance is associated with.
  @_s.JsonKey(name: 'Account')
  final String account;

  /// The name of the AWS region that the stack instance is associated with.
  @_s.JsonKey(name: 'Region')
  final String region;

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
  @_s.JsonKey(name: 'StackInstanceStatus')
  final StackInstanceStatus stackInstanceStatus;

  StackInstance({
    this.account,
    this.region,
    this.stackInstanceStatus,
  });
  factory StackInstance.fromJson(Map<String, dynamic> json) =>
      _$StackInstanceFromJson(json);
}

enum StackInstanceStatus {
  @_s.JsonValue('CURRENT')
  current,
  @_s.JsonValue('OUTDATED')
  outdated,
  @_s.JsonValue('INOPERABLE')
  inoperable,
}

enum StackSetOperationType {
  @_s.JsonValue('CREATE')
  create,
  @_s.JsonValue('UPDATE')
  update,
  @_s.JsonValue('DELETE')
  delete,
}

enum Status {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('FAILED')
  failed,
}

/// Information about a tag. A tag is a key-value pair. Tags are propagated to
/// the resources created when provisioning a product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for this key.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Information about a TagOption.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagOptionDetail {
  /// The TagOption active state.
  @_s.JsonKey(name: 'Active')
  final bool active;

  /// The TagOption identifier.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The TagOption key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The AWS account Id of the owner account that created the TagOption.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The TagOption value.
  @_s.JsonKey(name: 'Value')
  final String value;

  TagOptionDetail({
    this.active,
    this.id,
    this.key,
    this.owner,
    this.value,
  });
  factory TagOptionDetail.fromJson(Map<String, dynamic> json) =>
      _$TagOptionDetailFromJson(json);
}

/// Summary information about a TagOption.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagOptionSummary {
  /// The TagOption key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The TagOption value.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  TagOptionSummary({
    this.key,
    this.values,
  });
  factory TagOptionSummary.fromJson(Map<String, dynamic> json) =>
      _$TagOptionSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminateProvisionedProductOutput {
  /// Information about the result of this request.
  @_s.JsonKey(name: 'RecordDetail')
  final RecordDetail recordDetail;

  TerminateProvisionedProductOutput({
    this.recordDetail,
  });
  factory TerminateProvisionedProductOutput.fromJson(
          Map<String, dynamic> json) =>
      _$TerminateProvisionedProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConstraintOutput {
  /// Information about the constraint.
  @_s.JsonKey(name: 'ConstraintDetail')
  final ConstraintDetail constraintDetail;

  /// The constraint parameters.
  @_s.JsonKey(name: 'ConstraintParameters')
  final String constraintParameters;

  /// The status of the current request.
  @_s.JsonKey(name: 'Status')
  final Status status;

  UpdateConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });
  factory UpdateConstraintOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateConstraintOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePortfolioOutput {
  /// Information about the portfolio.
  @_s.JsonKey(name: 'PortfolioDetail')
  final PortfolioDetail portfolioDetail;

  /// Information about the tags associated with the portfolio.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  UpdatePortfolioOutput({
    this.portfolioDetail,
    this.tags,
  });
  factory UpdatePortfolioOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdatePortfolioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePortfolioShareOutput {
  /// The token that tracks the status of the <code>UpdatePortfolioShare</code>
  /// operation for external account to account or organizational type sharing.
  @_s.JsonKey(name: 'PortfolioShareToken')
  final String portfolioShareToken;

  /// The status of <code>UpdatePortfolioShare</code> operation. You can also
  /// obtain the operation status using <code>DescribePortfolioShareStatus</code>
  /// API.
  @_s.JsonKey(name: 'Status')
  final ShareStatus status;

  UpdatePortfolioShareOutput({
    this.portfolioShareToken,
    this.status,
  });
  factory UpdatePortfolioShareOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdatePortfolioShareOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProductOutput {
  /// Information about the product view.
  @_s.JsonKey(name: 'ProductViewDetail')
  final ProductViewDetail productViewDetail;

  /// Information about the tags associated with the product.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  UpdateProductOutput({
    this.productViewDetail,
    this.tags,
  });
  factory UpdateProductOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProvisionedProductOutput {
  /// Information about the result of the request.
  @_s.JsonKey(name: 'RecordDetail')
  final RecordDetail recordDetail;

  UpdateProvisionedProductOutput({
    this.recordDetail,
  });
  factory UpdateProvisionedProductOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateProvisionedProductOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProvisionedProductPropertiesOutput {
  /// The provisioned product identifier.
  @_s.JsonKey(name: 'ProvisionedProductId')
  final String provisionedProductId;

  /// A map that contains the properties updated.
  @_s.JsonKey(name: 'ProvisionedProductProperties')
  final Map<PropertyKey, String> provisionedProductProperties;

  /// The identifier of the record.
  @_s.JsonKey(name: 'RecordId')
  final String recordId;

  /// The status of the request.
  @_s.JsonKey(name: 'Status')
  final RecordStatus status;

  UpdateProvisionedProductPropertiesOutput({
    this.provisionedProductId,
    this.provisionedProductProperties,
    this.recordId,
    this.status,
  });
  factory UpdateProvisionedProductPropertiesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProvisionedProductPropertiesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProvisioningArtifactOutput {
  /// The URL of the CloudFormation template in Amazon S3.
  @_s.JsonKey(name: 'Info')
  final Map<String, String> info;

  /// Information about the provisioning artifact.
  @_s.JsonKey(name: 'ProvisioningArtifactDetail')
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// The status of the current request.
  @_s.JsonKey(name: 'Status')
  final Status status;

  UpdateProvisioningArtifactOutput({
    this.info,
    this.provisioningArtifactDetail,
    this.status,
  });
  factory UpdateProvisioningArtifactOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProvisioningArtifactOutputFromJson(json);
}

/// The parameter key-value pair used to update a provisioned product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UpdateProvisioningParameter {
  /// The parameter key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// If set to true, <code>Value</code> is ignored and the previous parameter
  /// value is kept.
  @_s.JsonKey(name: 'UsePreviousValue')
  final bool usePreviousValue;

  /// The parameter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  UpdateProvisioningParameter({
    this.key,
    this.usePreviousValue,
    this.value,
  });
  factory UpdateProvisioningParameter.fromJson(Map<String, dynamic> json) =>
      _$UpdateProvisioningParameterFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProvisioningParameterToJson(this);
}

/// The user-defined preferences that will be applied when updating a
/// provisioned product. Not all preferences are applicable to all provisioned
/// product types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateProvisioningPreferences {
  /// One or more AWS accounts that will have access to the provisioned product.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// The AWS accounts specified should be within the list of accounts in the
  /// <code>STACKSET</code> constraint. To get the list of accounts in the
  /// <code>STACKSET</code> constraint, use the
  /// <code>DescribeProvisioningParameters</code> operation.
  ///
  /// If no values are specified, the default value is all accounts from the
  /// <code>STACKSET</code> constraint.
  @_s.JsonKey(name: 'StackSetAccounts')
  final List<String> stackSetAccounts;

  /// The number of accounts, per region, for which this operation can fail before
  /// AWS Service Catalog stops the operation in that region. If the operation is
  /// stopped in a region, AWS Service Catalog doesn't attempt the operation in
  /// any subsequent regions.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  ///
  /// The default value is <code>0</code> if no value is specified.
  @_s.JsonKey(name: 'StackSetFailureToleranceCount')
  final int stackSetFailureToleranceCount;

  /// The percentage of accounts, per region, for which this stack operation can
  /// fail before AWS Service Catalog stops the operation in that region. If the
  /// operation is stopped in a region, AWS Service Catalog doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either
  /// <code>StackSetFailureToleranceCount</code> or
  /// <code>StackSetFailureTolerancePercentage</code>, but not both.
  @_s.JsonKey(name: 'StackSetFailureTolerancePercentage')
  final int stackSetFailureTolerancePercentage;

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
  @_s.JsonKey(name: 'StackSetMaxConcurrencyCount')
  final int stackSetMaxConcurrencyCount;

  /// The maximum percentage of accounts in which to perform this operation at one
  /// time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number. This is true
  /// except in cases where rounding down would result is zero. In this case, AWS
  /// Service Catalog sets the number as <code>1</code> instead.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of accounts
  /// acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// Conditional: You must specify either <code>StackSetMaxConcurrentCount</code>
  /// or <code>StackSetMaxConcurrentPercentage</code>, but not both.
  @_s.JsonKey(name: 'StackSetMaxConcurrencyPercentage')
  final int stackSetMaxConcurrencyPercentage;

  /// Determines what action AWS Service Catalog performs to a stack set or a
  /// stack instance represented by the provisioned product. The default value is
  /// <code>UPDATE</code> if nothing is specified.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  /// <dl> <dt>CREATE</dt> <dd>
  /// Creates a new stack instance in the stack set represented by the provisioned
  /// product. In this case, only new stack instances are created based on
  /// accounts and regions; if new ProductId or ProvisioningArtifactID are passed,
  /// they will be ignored.
  /// </dd> <dt>UPDATE</dt> <dd>
  /// Updates the stack set represented by the provisioned product and also its
  /// stack instances.
  /// </dd> <dt>DELETE</dt> <dd>
  /// Deletes a stack instance in the stack set represented by the provisioned
  /// product.
  /// </dd> </dl>
  @_s.JsonKey(name: 'StackSetOperationType')
  final StackSetOperationType stackSetOperationType;

  /// One or more AWS Regions where the provisioned product will be available.
  ///
  /// Applicable only to a <code>CFN_STACKSET</code> provisioned product type.
  ///
  /// The specified regions should be within the list of regions from the
  /// <code>STACKSET</code> constraint. To get the list of regions in the
  /// <code>STACKSET</code> constraint, use the
  /// <code>DescribeProvisioningParameters</code> operation.
  ///
  /// If no values are specified, the default value is all regions from the
  /// <code>STACKSET</code> constraint.
  @_s.JsonKey(name: 'StackSetRegions')
  final List<String> stackSetRegions;

  UpdateProvisioningPreferences({
    this.stackSetAccounts,
    this.stackSetFailureToleranceCount,
    this.stackSetFailureTolerancePercentage,
    this.stackSetMaxConcurrencyCount,
    this.stackSetMaxConcurrencyPercentage,
    this.stackSetOperationType,
    this.stackSetRegions,
  });
  Map<String, dynamic> toJson() => _$UpdateProvisioningPreferencesToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateServiceActionOutput {
  /// Detailed information about the self-service action.
  @_s.JsonKey(name: 'ServiceActionDetail')
  final ServiceActionDetail serviceActionDetail;

  UpdateServiceActionOutput({
    this.serviceActionDetail,
  });
  factory UpdateServiceActionOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateServiceActionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTagOptionOutput {
  /// Information about the TagOption.
  @_s.JsonKey(name: 'TagOptionDetail')
  final TagOptionDetail tagOptionDetail;

  UpdateTagOptionOutput({
    this.tagOptionDetail,
  });
  factory UpdateTagOptionOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateTagOptionOutputFromJson(json);
}

/// Additional information provided by the administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageInstruction {
  /// The usage instruction type for the value.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The usage instruction value for this type.
  @_s.JsonKey(name: 'Value')
  final String value;

  UsageInstruction({
    this.type,
    this.value,
  });
  factory UsageInstruction.fromJson(Map<String, dynamic> json) =>
      _$UsageInstructionFromJson(json);
}

class DuplicateResourceException extends _s.GenericAwsException {
  DuplicateResourceException({String type, String message})
      : super(type: type, code: 'DuplicateResourceException', message: message);
}

class InvalidParametersException extends _s.GenericAwsException {
  InvalidParametersException({String type, String message})
      : super(type: type, code: 'InvalidParametersException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String type, String message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OperationNotSupportedException extends _s.GenericAwsException {
  OperationNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotSupportedException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TagOptionNotMigratedException extends _s.GenericAwsException {
  TagOptionNotMigratedException({String type, String message})
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
