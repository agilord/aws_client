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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'license-manager-2018-08-01.g.dart';

/// AWS License Manager makes it easier to manage licenses from software vendors
/// across multiple AWS accounts and on-premises servers.
class LicenseManager {
  final _s.JsonProtocol _protocol;
  LicenseManager({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'license-manager',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a license configuration.
  ///
  /// A license configuration is an abstraction of a customer license agreement
  /// that can be consumed and enforced by License Manager. Components include
  /// specifications for the license type (licensing by instance, socket, CPU,
  /// or vCPU), allowed tenancy (shared tenancy, Dedicated Instance, Dedicated
  /// Host, or all of these), host affinity (how long a VM must be associated
  /// with a host), and the number of licenses purchased and used.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseCountingType] :
  /// Dimension used to track the license inventory.
  ///
  /// Parameter [name] :
  /// Name of the license configuration.
  ///
  /// Parameter [description] :
  /// Description of the license configuration.
  ///
  /// Parameter [licenseCount] :
  /// Number of licenses managed by the license configuration.
  ///
  /// Parameter [licenseCountHardLimit] :
  /// Indicates whether hard or soft license enforcement is used. Exceeding a
  /// hard limit blocks the launch of new instances.
  ///
  /// Parameter [licenseRules] :
  /// License rules. The syntax is #name=value (for example,
  /// #allowedTenancy=EC2-DedicatedHost). Available rules vary by dimension.
  ///
  /// <ul>
  /// <li>
  /// <code>Cores</code> dimension: <code>allowedTenancy</code> |
  /// <code>maximumCores</code> | <code>minimumCores</code>
  /// </li>
  /// <li>
  /// <code>Instances</code> dimension: <code>allowedTenancy</code> |
  /// <code>maximumCores</code> | <code>minimumCores</code> |
  /// <code>maximumSockets</code> | <code>minimumSockets</code> |
  /// <code>maximumVcpus</code> | <code>minimumVcpus</code>
  /// </li>
  /// <li>
  /// <code>Sockets</code> dimension: <code>allowedTenancy</code> |
  /// <code>maximumSockets</code> | <code>minimumSockets</code>
  /// </li>
  /// <li>
  /// <code>vCPUs</code> dimension: <code>allowedTenancy</code> |
  /// <code>honorVcpuOptimization</code> | <code>maximumVcpus</code> |
  /// <code>minimumVcpus</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [productInformationList] :
  /// Product information.
  ///
  /// Parameter [tags] :
  /// Tags to add to the license configuration.
  Future<CreateLicenseConfigurationResponse> createLicenseConfiguration({
    @_s.required LicenseCountingType licenseCountingType,
    @_s.required String name,
    String description,
    int licenseCount,
    bool licenseCountHardLimit,
    List<String> licenseRules,
    List<ProductInformation> productInformationList,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(licenseCountingType, 'licenseCountingType');
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseCountingType': licenseCountingType?.toValue() ?? '',
        'Name': name,
        if (description != null) 'Description': description,
        if (licenseCount != null) 'LicenseCount': licenseCount,
        if (licenseCountHardLimit != null)
          'LicenseCountHardLimit': licenseCountHardLimit,
        if (licenseRules != null) 'LicenseRules': licenseRules,
        if (productInformationList != null)
          'ProductInformationList': productInformationList,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified license configuration.
  ///
  /// You cannot delete a license configuration that is in use.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// ID of the license configuration.
  Future<void> deleteLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
      },
    );

    return DeleteLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  Future<GetLicenseConfigurationResponse> getLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
      },
    );

    return GetLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Gets the License Manager settings for the current Region.
  ///
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  Future<GetServiceSettingsResponse> getServiceSettings() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetServiceSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetServiceSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the resource associations for the specified license configuration.
  ///
  /// Resource associations need not consume licenses from a license
  /// configuration. For example, an AMI or a stopped instance might not consume
  /// a license (depending on the license rules).
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [FilterLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of a license configuration.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListAssociationsForLicenseConfigurationResponse>
      listAssociationsForLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSLicenseManager.ListAssociationsForLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAssociationsForLicenseConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the license configuration operations that failed.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name of the license configuration.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListFailuresForLicenseConfigurationOperationsResponse>
      listFailuresForLicenseConfigurationOperations({
    @_s.required String licenseConfigurationArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSLicenseManager.ListFailuresForLicenseConfigurationOperations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFailuresForLicenseConfigurationOperationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the license configurations for your account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [FilterLimitExceededException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters and logical operators
  /// are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>licenseCountingType</code> - The dimension on which licenses are
  /// counted (vCPU). Logical operators are <code>EQUALS</code> |
  /// <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>enforceLicenseCount</code> - A Boolean value that indicates whether
  /// hard license enforcement is used. Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>usagelimitExceeded</code> - A Boolean value that indicates whether
  /// the available licenses have been exceeded. Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [licenseConfigurationArns] :
  /// Amazon Resource Names (ARN) of the license configurations.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicenseConfigurationsResponse> listLicenseConfigurations({
    List<Filter> filters,
    List<String> licenseConfigurationArns,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListLicenseConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (licenseConfigurationArns != null)
          'LicenseConfigurationArns': licenseConfigurationArns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLicenseConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Describes the license configurations for the specified resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of a resource that has an associated license
  /// configuration.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicenseSpecificationsForResourceResponse>
      listLicenseSpecificationsForResource({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListLicenseSpecificationsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLicenseSpecificationsForResourceResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists resources managed using Systems Manager inventory.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [FilterLimitExceededException].
  /// May throw [FailedDependencyException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters and logical operators
  /// are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>account_id</code> - The ID of the AWS account that owns the
  /// resource. Logical operators are <code>EQUALS</code> |
  /// <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>application_name</code> - The name of the application. Logical
  /// operators are <code>EQUALS</code> | <code>BEGINS_WITH</code>.
  /// </li>
  /// <li>
  /// <code>license_included</code> - The type of license included. Logical
  /// operators are <code>EQUALS</code> | <code>NOT_EQUALS</code>. Possible
  /// values are <code>sql-server-enterprise</code> |
  /// <code>sql-server-standard</code> | <code>sql-server-web</code> |
  /// <code>windows-server-datacenter</code>.
  /// </li>
  /// <li>
  /// <code>platform</code> - The platform of the resource. Logical operators
  /// are <code>EQUALS</code> | <code>BEGINS_WITH</code>.
  /// </li>
  /// <li>
  /// <code>resource_id</code> - The ID of the resource. Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListResourceInventoryResponse> listResourceInventory({
    List<InventoryFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListResourceInventory'
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

    return ListResourceInventoryResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists all license usage records for a license configuration, displaying
  /// license consumption details by resource at a selected point in time. Use
  /// this action to audit the current license consumption for any license
  /// inventory and configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [FilterLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters and logical operators
  /// are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>resourceArn</code> - The ARN of the license configuration resource.
  /// Logical operators are <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>resourceType</code> - The resource type (EC2_INSTANCE | EC2_HOST |
  /// EC2_AMI | SYSTEMS_MANAGER_MANAGED_INSTANCE). Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>resourceAccount</code> - The ID of the account that owns the
  /// resource. Logical operators are <code>EQUALS</code> |
  /// <code>NOT_EQUALS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListUsageForLicenseConfigurationResponse>
      listUsageForLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListUsageForLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUsageForLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Adds the specified tags to the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified tags from the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [tagKeys] :
  /// Keys identifying the tags to remove.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the attributes of an existing license configuration.
  ///
  /// A license configuration is an abstraction of a customer license agreement
  /// that can be consumed and enforced by License Manager. Components include
  /// specifications for the license type (licensing by instance, socket, CPU,
  /// or vCPU), allowed tenancy (shared tenancy, Dedicated Instance, Dedicated
  /// Host, or all of these), host affinity (how long a VM must be associated
  /// with a host), and the number of licenses purchased and used.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [description] :
  /// New description of the license configuration.
  ///
  /// Parameter [licenseConfigurationStatus] :
  /// New status of the license configuration.
  ///
  /// Parameter [licenseCount] :
  /// New number of licenses managed by the license configuration.
  ///
  /// Parameter [licenseCountHardLimit] :
  /// New hard limit of the number of available licenses.
  ///
  /// Parameter [licenseRules] :
  /// New license rules.
  ///
  /// Parameter [name] :
  /// New name of the license configuration.
  ///
  /// Parameter [productInformationList] :
  /// New product information.
  Future<void> updateLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
    String description,
    LicenseConfigurationStatus licenseConfigurationStatus,
    int licenseCount,
    bool licenseCountHardLimit,
    List<String> licenseRules,
    String name,
    List<ProductInformation> productInformationList,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (description != null) 'Description': description,
        if (licenseConfigurationStatus != null)
          'LicenseConfigurationStatus': licenseConfigurationStatus.toValue(),
        if (licenseCount != null) 'LicenseCount': licenseCount,
        if (licenseCountHardLimit != null)
          'LicenseCountHardLimit': licenseCountHardLimit,
        if (licenseRules != null) 'LicenseRules': licenseRules,
        if (name != null) 'Name': name,
        if (productInformationList != null)
          'ProductInformationList': productInformationList,
      },
    );

    return UpdateLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Adds or removes the specified license configurations for the specified AWS
  /// resource.
  ///
  /// You can update the license specifications of AMIs, instances, and hosts.
  /// You cannot update the license specifications for launch templates and AWS
  /// CloudFormation templates, as they send license configurations to the
  /// operation that creates the resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidResourceStateException].
  /// May throw [LicenseUsageException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the AWS resource.
  ///
  /// Parameter [addLicenseSpecifications] :
  /// ARNs of the license configurations to add.
  ///
  /// Parameter [removeLicenseSpecifications] :
  /// ARNs of the license configurations to remove.
  Future<void> updateLicenseSpecificationsForResource({
    @_s.required String resourceArn,
    List<LicenseSpecification> addLicenseSpecifications,
    List<LicenseSpecification> removeLicenseSpecifications,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateLicenseSpecificationsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (addLicenseSpecifications != null)
          'AddLicenseSpecifications': addLicenseSpecifications,
        if (removeLicenseSpecifications != null)
          'RemoveLicenseSpecifications': removeLicenseSpecifications,
      },
    );

    return UpdateLicenseSpecificationsForResourceResponse.fromJson(
        jsonResponse.body);
  }

  /// Updates License Manager settings for the current Region.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [enableCrossAccountsDiscovery] :
  /// Activates cross-account discovery.
  ///
  /// Parameter [organizationConfiguration] :
  /// Enables integration with AWS Organizations for cross-account discovery.
  ///
  /// Parameter [s3BucketArn] :
  /// Amazon Resource Name (ARN) of the Amazon S3 bucket where the License
  /// Manager information is stored.
  ///
  /// Parameter [snsTopicArn] :
  /// Amazon Resource Name (ARN) of the Amazon SNS topic used for License
  /// Manager alerts.
  Future<void> updateServiceSettings({
    bool enableCrossAccountsDiscovery,
    OrganizationConfiguration organizationConfiguration,
    String s3BucketArn,
    String snsTopicArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateServiceSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (enableCrossAccountsDiscovery != null)
          'EnableCrossAccountsDiscovery': enableCrossAccountsDiscovery,
        if (organizationConfiguration != null)
          'OrganizationConfiguration': organizationConfiguration,
        if (s3BucketArn != null) 'S3BucketArn': s3BucketArn,
        if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      },
    );

    return UpdateServiceSettingsResponse.fromJson(jsonResponse.body);
  }
}

/// Describes automated discovery.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutomatedDiscoveryInformation {
  /// Time that automated discovery last ran.
  @_s.JsonKey(
      name: 'LastRunTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastRunTime;

  AutomatedDiscoveryInformation({
    this.lastRunTime,
  });
  factory AutomatedDiscoveryInformation.fromJson(Map<String, dynamic> json) =>
      _$AutomatedDiscoveryInformationFromJson(json);
}

/// Details about license consumption.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConsumedLicenseSummary {
  /// Number of licenses consumed by the resource.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Resource type of the resource consuming a license.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  ConsumedLicenseSummary({
    this.consumedLicenses,
    this.resourceType,
  });
  factory ConsumedLicenseSummary.fromJson(Map<String, dynamic> json) =>
      _$ConsumedLicenseSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLicenseConfigurationResponse {
  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  CreateLicenseConfigurationResponse({
    this.licenseConfigurationArn,
  });
  factory CreateLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLicenseConfigurationResponse {
  DeleteLicenseConfigurationResponse();
  factory DeleteLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteLicenseConfigurationResponseFromJson(json);
}

/// A filter name and value pair that is used to return more specific results
/// from a describe operation. Filters can be used to match a set of resources
/// by specific criteria, such as tags, attributes, or IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// Name of the filter. Filter names are case-sensitive.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Filter values. Filter values are case-sensitive.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLicenseConfigurationResponse {
  /// Automated discovery information.
  @_s.JsonKey(name: 'AutomatedDiscoveryInformation')
  final AutomatedDiscoveryInformation automatedDiscoveryInformation;

  /// Summaries of the licenses consumed by resources.
  @_s.JsonKey(name: 'ConsumedLicenseSummaryList')
  final List<ConsumedLicenseSummary> consumedLicenseSummaryList;

  /// Number of licenses assigned to resources.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Description of the license configuration.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  /// Unique ID for the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationId')
  final String licenseConfigurationId;

  /// Number of available licenses.
  @_s.JsonKey(name: 'LicenseCount')
  final int licenseCount;

  /// Sets the number of available licenses as a hard limit.
  @_s.JsonKey(name: 'LicenseCountHardLimit')
  final bool licenseCountHardLimit;

  /// Dimension on which the licenses are counted.
  @_s.JsonKey(name: 'LicenseCountingType')
  final LicenseCountingType licenseCountingType;

  /// License rules.
  @_s.JsonKey(name: 'LicenseRules')
  final List<String> licenseRules;

  /// Summaries of the managed resources.
  @_s.JsonKey(name: 'ManagedResourceSummaryList')
  final List<ManagedResourceSummary> managedResourceSummaryList;

  /// Name of the license configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Account ID of the owner of the license configuration.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// Product information.
  @_s.JsonKey(name: 'ProductInformationList')
  final List<ProductInformation> productInformationList;

  /// License configuration status.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Tags for the license configuration.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  GetLicenseConfigurationResponse({
    this.automatedDiscoveryInformation,
    this.consumedLicenseSummaryList,
    this.consumedLicenses,
    this.description,
    this.licenseConfigurationArn,
    this.licenseConfigurationId,
    this.licenseCount,
    this.licenseCountHardLimit,
    this.licenseCountingType,
    this.licenseRules,
    this.managedResourceSummaryList,
    this.name,
    this.ownerAccountId,
    this.productInformationList,
    this.status,
    this.tags,
  });
  factory GetLicenseConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceSettingsResponse {
  /// Indicates whether cross-account discovery has been enabled.
  @_s.JsonKey(name: 'EnableCrossAccountsDiscovery')
  final bool enableCrossAccountsDiscovery;

  /// Amazon Resource Name (ARN) of the AWS resource share. The License Manager
  /// master account will provide member accounts with access to this share.
  @_s.JsonKey(name: 'LicenseManagerResourceShareArn')
  final String licenseManagerResourceShareArn;

  /// Indicates whether AWS Organizations has been integrated with License Manager
  /// for cross-account discovery.
  @_s.JsonKey(name: 'OrganizationConfiguration')
  final OrganizationConfiguration organizationConfiguration;

  /// Regional S3 bucket path for storing reports, license trail event data,
  /// discovery data, and so on.
  @_s.JsonKey(name: 'S3BucketArn')
  final String s3BucketArn;

  /// SNS topic configured to receive notifications from License Manager.
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;

  GetServiceSettingsResponse({
    this.enableCrossAccountsDiscovery,
    this.licenseManagerResourceShareArn,
    this.organizationConfiguration,
    this.s3BucketArn,
    this.snsTopicArn,
  });
  factory GetServiceSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceSettingsResponseFromJson(json);
}

/// An inventory filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InventoryFilter {
  /// Condition of the filter.
  @_s.JsonKey(name: 'Condition')
  final InventoryFilterCondition condition;

  /// Name of the filter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Value of the filter.
  @_s.JsonKey(name: 'Value')
  final String value;

  InventoryFilter({
    @_s.required this.condition,
    @_s.required this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => _$InventoryFilterToJson(this);
}

enum InventoryFilterCondition {
  @_s.JsonValue('EQUALS')
  equals,
  @_s.JsonValue('NOT_EQUALS')
  notEquals,
  @_s.JsonValue('BEGINS_WITH')
  beginsWith,
  @_s.JsonValue('CONTAINS')
  contains,
}

/// A license configuration is an abstraction of a customer license agreement
/// that can be consumed and enforced by License Manager. Components include
/// specifications for the license type (licensing by instance, socket, CPU, or
/// vCPU), allowed tenancy (shared tenancy, Dedicated Instance, Dedicated Host,
/// or all of these), host affinity (how long a VM must be associated with a
/// host), and the number of licenses purchased and used.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseConfiguration {
  /// Automated discovery information.
  @_s.JsonKey(name: 'AutomatedDiscoveryInformation')
  final AutomatedDiscoveryInformation automatedDiscoveryInformation;

  /// Summaries for licenses consumed by various resources.
  @_s.JsonKey(name: 'ConsumedLicenseSummaryList')
  final List<ConsumedLicenseSummary> consumedLicenseSummaryList;

  /// Number of licenses consumed.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Description of the license configuration.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  /// Unique ID of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationId')
  final String licenseConfigurationId;

  /// Number of licenses managed by the license configuration.
  @_s.JsonKey(name: 'LicenseCount')
  final int licenseCount;

  /// Number of available licenses as a hard limit.
  @_s.JsonKey(name: 'LicenseCountHardLimit')
  final bool licenseCountHardLimit;

  /// Dimension to use to track the license inventory.
  @_s.JsonKey(name: 'LicenseCountingType')
  final LicenseCountingType licenseCountingType;

  /// License rules.
  @_s.JsonKey(name: 'LicenseRules')
  final List<String> licenseRules;

  /// Summaries for managed resources.
  @_s.JsonKey(name: 'ManagedResourceSummaryList')
  final List<ManagedResourceSummary> managedResourceSummaryList;

  /// Name of the license configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Account ID of the license configuration's owner.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// Product information.
  @_s.JsonKey(name: 'ProductInformationList')
  final List<ProductInformation> productInformationList;

  /// Status of the license configuration.
  @_s.JsonKey(name: 'Status')
  final String status;

  LicenseConfiguration({
    this.automatedDiscoveryInformation,
    this.consumedLicenseSummaryList,
    this.consumedLicenses,
    this.description,
    this.licenseConfigurationArn,
    this.licenseConfigurationId,
    this.licenseCount,
    this.licenseCountHardLimit,
    this.licenseCountingType,
    this.licenseRules,
    this.managedResourceSummaryList,
    this.name,
    this.ownerAccountId,
    this.productInformationList,
    this.status,
  });
  factory LicenseConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LicenseConfigurationFromJson(json);
}

/// Describes an association with a license configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseConfigurationAssociation {
  /// Time when the license configuration was associated with the resource.
  @_s.JsonKey(
      name: 'AssociationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime associationTime;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the AWS account that owns the resource consuming licenses.
  @_s.JsonKey(name: 'ResourceOwnerId')
  final String resourceOwnerId;

  /// Type of server resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  LicenseConfigurationAssociation({
    this.associationTime,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceType,
  });
  factory LicenseConfigurationAssociation.fromJson(Map<String, dynamic> json) =>
      _$LicenseConfigurationAssociationFromJson(json);
}

enum LicenseConfigurationStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on LicenseConfigurationStatus {
  String toValue() {
    switch (this) {
      case LicenseConfigurationStatus.available:
        return 'AVAILABLE';
      case LicenseConfigurationStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about the usage of a resource associated with a license
/// configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseConfigurationUsage {
  /// Time when the license configuration was initially associated with the
  /// resource.
  @_s.JsonKey(
      name: 'AssociationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime associationTime;

  /// Number of licenses consumed by the resource.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the account that owns the resource.
  @_s.JsonKey(name: 'ResourceOwnerId')
  final String resourceOwnerId;

  /// Status of the resource.
  @_s.JsonKey(name: 'ResourceStatus')
  final String resourceStatus;

  /// Type of resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  LicenseConfigurationUsage({
    this.associationTime,
    this.consumedLicenses,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceStatus,
    this.resourceType,
  });
  factory LicenseConfigurationUsage.fromJson(Map<String, dynamic> json) =>
      _$LicenseConfigurationUsageFromJson(json);
}

enum LicenseCountingType {
  @_s.JsonValue('vCPU')
  vcpu,
  @_s.JsonValue('Instance')
  instance,
  @_s.JsonValue('Core')
  core,
  @_s.JsonValue('Socket')
  socket,
}

extension on LicenseCountingType {
  String toValue() {
    switch (this) {
      case LicenseCountingType.vcpu:
        return 'vCPU';
      case LicenseCountingType.instance:
        return 'Instance';
      case LicenseCountingType.core:
        return 'Core';
      case LicenseCountingType.socket:
        return 'Socket';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the failure of a license operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseOperationFailure {
  /// Error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// Failure time.
  @_s.JsonKey(
      name: 'FailureTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime failureTime;

  /// Reserved.
  @_s.JsonKey(name: 'MetadataList')
  final List<Metadata> metadataList;

  /// Name of the operation.
  @_s.JsonKey(name: 'OperationName')
  final String operationName;

  /// The requester is "License Manager Automated Discovery".
  @_s.JsonKey(name: 'OperationRequestedBy')
  final String operationRequestedBy;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the AWS account that owns the resource.
  @_s.JsonKey(name: 'ResourceOwnerId')
  final String resourceOwnerId;

  /// Resource type.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  LicenseOperationFailure({
    this.errorMessage,
    this.failureTime,
    this.metadataList,
    this.operationName,
    this.operationRequestedBy,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceType,
  });
  factory LicenseOperationFailure.fromJson(Map<String, dynamic> json) =>
      _$LicenseOperationFailureFromJson(json);
}

/// Details for associating a license configuration with a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LicenseSpecification {
  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  LicenseSpecification({
    @_s.required this.licenseConfigurationArn,
  });
  factory LicenseSpecification.fromJson(Map<String, dynamic> json) =>
      _$LicenseSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseSpecificationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociationsForLicenseConfigurationResponse {
  /// Information about the associations for the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationAssociations')
  final List<LicenseConfigurationAssociation> licenseConfigurationAssociations;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAssociationsForLicenseConfigurationResponse({
    this.licenseConfigurationAssociations,
    this.nextToken,
  });
  factory ListAssociationsForLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAssociationsForLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFailuresForLicenseConfigurationOperationsResponse {
  /// License configuration operations that failed.
  @_s.JsonKey(name: 'LicenseOperationFailureList')
  final List<LicenseOperationFailure> licenseOperationFailureList;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFailuresForLicenseConfigurationOperationsResponse({
    this.licenseOperationFailureList,
    this.nextToken,
  });
  factory ListFailuresForLicenseConfigurationOperationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListFailuresForLicenseConfigurationOperationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLicenseConfigurationsResponse {
  /// Information about the license configurations.
  @_s.JsonKey(name: 'LicenseConfigurations')
  final List<LicenseConfiguration> licenseConfigurations;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLicenseConfigurationsResponse({
    this.licenseConfigurations,
    this.nextToken,
  });
  factory ListLicenseConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListLicenseConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLicenseSpecificationsForResourceResponse {
  /// License configurations associated with a resource.
  @_s.JsonKey(name: 'LicenseSpecifications')
  final List<LicenseSpecification> licenseSpecifications;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLicenseSpecificationsForResourceResponse({
    this.licenseSpecifications,
    this.nextToken,
  });
  factory ListLicenseSpecificationsForResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListLicenseSpecificationsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceInventoryResponse {
  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the resources.
  @_s.JsonKey(name: 'ResourceInventoryList')
  final List<ResourceInventory> resourceInventoryList;

  ListResourceInventoryResponse({
    this.nextToken,
    this.resourceInventoryList,
  });
  factory ListResourceInventoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourceInventoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsageForLicenseConfigurationResponse {
  /// Information about the license configurations.
  @_s.JsonKey(name: 'LicenseConfigurationUsageList')
  final List<LicenseConfigurationUsage> licenseConfigurationUsageList;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListUsageForLicenseConfigurationResponse({
    this.licenseConfigurationUsageList,
    this.nextToken,
  });
  factory ListUsageForLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListUsageForLicenseConfigurationResponseFromJson(json);
}

/// Summary information about a managed resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ManagedResourceSummary {
  /// Number of resources associated with licenses.
  @_s.JsonKey(name: 'AssociationCount')
  final int associationCount;

  /// Type of resource associated with a license.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  ManagedResourceSummary({
    this.associationCount,
    this.resourceType,
  });
  factory ManagedResourceSummary.fromJson(Map<String, dynamic> json) =>
      _$ManagedResourceSummaryFromJson(json);
}

/// Reserved.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Metadata {
  /// Reserved.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Reserved.
  @_s.JsonKey(name: 'Value')
  final String value;

  Metadata({
    this.name,
    this.value,
  });
  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

/// Configuration information for AWS Organizations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrganizationConfiguration {
  /// Enables AWS Organization integration.
  @_s.JsonKey(name: 'EnableIntegration')
  final bool enableIntegration;

  OrganizationConfiguration({
    @_s.required this.enableIntegration,
  });
  factory OrganizationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$OrganizationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationConfigurationToJson(this);
}

/// Describes product information for a license configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProductInformation {
  /// Product information filters. The following filters and logical operators are
  /// supported:
  ///
  /// <ul>
  /// <li>
  /// <code>Application Name</code> - The name of the application. Logical
  /// operator is <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Application Publisher</code> - The publisher of the application.
  /// Logical operator is <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Application Version</code> - The version of the application. Logical
  /// operator is <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Platform Name</code> - The name of the platform. Logical operator is
  /// <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Platform Type</code> - The platform type. Logical operator is
  /// <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>License Included</code> - The type of license included. Logical
  /// operators are <code>EQUALS</code> and <code>NOT_EQUALS</code>. Possible
  /// values are <code>sql-server-enterprise</code> |
  /// <code>sql-server-standard</code> | <code>sql-server-web</code> |
  /// <code>windows-server-datacenter</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ProductInformationFilterList')
  final List<ProductInformationFilter> productInformationFilterList;

  /// Resource type. The value is <code>SSM_MANAGED</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ProductInformation({
    @_s.required this.productInformationFilterList,
    @_s.required this.resourceType,
  });
  factory ProductInformation.fromJson(Map<String, dynamic> json) =>
      _$ProductInformationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInformationToJson(this);
}

/// Describes product information filters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProductInformationFilter {
  /// Logical operator.
  @_s.JsonKey(name: 'ProductInformationFilterComparator')
  final String productInformationFilterComparator;

  /// Filter name.
  @_s.JsonKey(name: 'ProductInformationFilterName')
  final String productInformationFilterName;

  /// Filter value.
  @_s.JsonKey(name: 'ProductInformationFilterValue')
  final List<String> productInformationFilterValue;

  ProductInformationFilter({
    @_s.required this.productInformationFilterComparator,
    @_s.required this.productInformationFilterName,
    @_s.required this.productInformationFilterValue,
  });
  factory ProductInformationFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductInformationFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInformationFilterToJson(this);
}

/// Details about a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceInventory {
  /// Platform of the resource.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// Platform version of the resource in the inventory.
  @_s.JsonKey(name: 'PlatformVersion')
  final String platformVersion;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the resource.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// ID of the account that owns the resource.
  @_s.JsonKey(name: 'ResourceOwningAccountId')
  final String resourceOwningAccountId;

  /// Type of resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  ResourceInventory({
    this.platform,
    this.platformVersion,
    this.resourceArn,
    this.resourceId,
    this.resourceOwningAccountId,
    this.resourceType,
  });
  factory ResourceInventory.fromJson(Map<String, dynamic> json) =>
      _$ResourceInventoryFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('EC2_INSTANCE')
  ec2Instance,
  @_s.JsonValue('EC2_HOST')
  ec2Host,
  @_s.JsonValue('EC2_AMI')
  ec2Ami,
  @_s.JsonValue('RDS')
  rds,
  @_s.JsonValue('SYSTEMS_MANAGER_MANAGED_INSTANCE')
  systemsManagerManagedInstance,
}

/// Details about a tag for a license configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Tag value.
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
class UpdateLicenseConfigurationResponse {
  UpdateLicenseConfigurationResponse();
  factory UpdateLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLicenseSpecificationsForResourceResponse {
  UpdateLicenseSpecificationsForResourceResponse();
  factory UpdateLicenseSpecificationsForResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateLicenseSpecificationsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateServiceSettingsResponse {
  UpdateServiceSettingsResponse();
  factory UpdateServiceSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateServiceSettingsResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AuthorizationException extends _s.GenericAwsException {
  AuthorizationException({String type, String message})
      : super(type: type, code: 'AuthorizationException', message: message);
}

class FailedDependencyException extends _s.GenericAwsException {
  FailedDependencyException({String type, String message})
      : super(type: type, code: 'FailedDependencyException', message: message);
}

class FilterLimitExceededException extends _s.GenericAwsException {
  FilterLimitExceededException({String type, String message})
      : super(
            type: type, code: 'FilterLimitExceededException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class LicenseUsageException extends _s.GenericAwsException {
  LicenseUsageException({String type, String message})
      : super(type: type, code: 'LicenseUsageException', message: message);
}

class RateLimitExceededException extends _s.GenericAwsException {
  RateLimitExceededException({String type, String message})
      : super(type: type, code: 'RateLimitExceededException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ServerInternalException extends _s.GenericAwsException {
  ServerInternalException({String type, String message})
      : super(type: type, code: 'ServerInternalException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AuthorizationException': (type, message) =>
      AuthorizationException(type: type, message: message),
  'FailedDependencyException': (type, message) =>
      FailedDependencyException(type: type, message: message),
  'FilterLimitExceededException': (type, message) =>
      FilterLimitExceededException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidResourceStateException': (type, message) =>
      InvalidResourceStateException(type: type, message: message),
  'LicenseUsageException': (type, message) =>
      LicenseUsageException(type: type, message: message),
  'RateLimitExceededException': (type, message) =>
      RateLimitExceededException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ServerInternalException': (type, message) =>
      ServerInternalException(type: type, message: message),
};
