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

class ResourceGroupsTaggingApi {
  final _s.JsonProtocol _protocol;
  ResourceGroupsTaggingApi({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'tagging',
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

  /// Describes the status of the <code>StartReportCreation</code> operation.
  ///
  /// You can call this operation only from the organization's management
  /// account and from the us-east-1 Region.
  ///
  /// May throw [ConstraintViolationException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  Future<DescribeReportCreationOutput> describeReportCreation() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.DescribeReportCreation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeReportCreationOutput.fromJson(jsonResponse.body);
  }

  /// Returns a table that shows counts of resources that are noncompliant with
  /// their tag policies.
  ///
  /// For more information on tag policies, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">Tag
  /// Policies</a> in the <i>Organizations User Guide.</i>
  ///
  /// You can call this operation only from the organization's management
  /// account and from the us-east-1 Region.
  ///
  /// This operation supports pagination, where the response can be sent in
  /// multiple pages. You should check the <code>PaginationToken</code> response
  /// parameter to determine if there are additional results available to
  /// return. Repeat the query, passing the <code>PaginationToken</code>
  /// response parameter value as an input to the next request until you recieve
  /// a <code>null</code> value. A null value for <code>PaginationToken</code>
  /// indicates that there are no more results waiting to be returned.
  ///
  /// May throw [ConstraintViolationException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [groupBy] :
  /// Specifies a list of attributes to group the counts of noncompliant
  /// resources by. If supplied, the counts are sorted by those attributes.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to be returned in each page. A
  /// query can return fewer than this maximum, even if there are more results
  /// still to return. You should always check the <code>PaginationToken</code>
  /// response value to see if there are more results. You can specify a minimum
  /// of 1 and a maximum value of 100.
  ///
  /// Parameter [paginationToken] :
  /// Specifies a <code>PaginationToken</code> response value from a previous
  /// request to indicate that you want the next page of results. Leave this
  /// parameter empty in your initial request.
  ///
  /// Parameter [regionFilters] :
  /// Specifies a list of Amazon Web Services Regions to limit the output to. If
  /// you use this parameter, the count of returned noncompliant resources
  /// includes only resources in the specified Regions.
  ///
  /// Parameter [resourceTypeFilters] :
  /// Specifies that you want the response to include information for only
  /// resources of the specified types. The format of each resource type is
  /// <code>service[:resourceType]</code>. For example, specifying a resource
  /// type of <code>ec2</code> returns all Amazon EC2 resources (which includes
  /// EC2 instances). Specifying a resource type of <code>ec2:instance</code>
  /// returns only EC2 instances.
  ///
  /// The string for each service name and resource type is the same as that
  /// embedded in a resource's Amazon Resource Name (ARN). Consult the <i> <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/">Amazon Web Services
  /// General Reference</a> </i> for the following:
  ///
  /// <ul>
  /// <li>
  /// For a list of service name strings, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">Amazon
  /// Web Services Service Namespaces</a>.
  /// </li>
  /// <li>
  /// For resource type strings, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arns-syntax">Example
  /// ARNs</a>.
  /// </li>
  /// <li>
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  /// </li>
  /// </ul>
  /// You can specify multiple resource types by using a comma separated array.
  /// The array can include up to 100 items. Note that the length constraint
  /// requirement applies to each resource type filter.
  ///
  /// Parameter [tagKeyFilters] :
  /// Specifies that you want the response to include information for only
  /// resources that have tags with the specified tag keys. If you use this
  /// parameter, the count of returned noncompliant resources includes only
  /// resources that have the specified tag keys.
  ///
  /// Parameter [targetIdFilters] :
  /// Specifies target identifiers (usually, specific account IDs) to limit the
  /// output by. If you use this parameter, the count of returned noncompliant
  /// resources includes only resources with the specified target IDs.
  Future<GetComplianceSummaryOutput> getComplianceSummary({
    List<GroupByAttribute>? groupBy,
    int? maxResults,
    String? paginationToken,
    List<String>? regionFilters,
    List<String>? resourceTypeFilters,
    List<String>? tagKeyFilters,
    List<String>? targetIdFilters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.GetComplianceSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (groupBy != null)
          'GroupBy': groupBy.map((e) => e.toValue()).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (paginationToken != null) 'PaginationToken': paginationToken,
        if (regionFilters != null) 'RegionFilters': regionFilters,
        if (resourceTypeFilters != null)
          'ResourceTypeFilters': resourceTypeFilters,
        if (tagKeyFilters != null) 'TagKeyFilters': tagKeyFilters,
        if (targetIdFilters != null) 'TargetIdFilters': targetIdFilters,
      },
    );

    return GetComplianceSummaryOutput.fromJson(jsonResponse.body);
  }

  /// Returns all the tagged or previously tagged resources that are located in
  /// the specified Amazon Web Services Region for the account.
  ///
  /// Depending on what information you want returned, you can also specify the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <i>Filters</i> that specify what tags and resource types you want
  /// returned. The response includes all tags that are associated with the
  /// requested resources.
  /// </li>
  /// <li>
  /// Information about compliance with the account's effective tag policy. For
  /// more information on tag policies, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">Tag
  /// Policies</a> in the <i>Organizations User Guide.</i>
  /// </li>
  /// </ul>
  /// This operation supports pagination, where the response can be sent in
  /// multiple pages. You should check the <code>PaginationToken</code> response
  /// parameter to determine if there are additional results available to
  /// return. Repeat the query, passing the <code>PaginationToken</code>
  /// response parameter value as an input to the next request until you recieve
  /// a <code>null</code> value. A null value for <code>PaginationToken</code>
  /// indicates that there are no more results waiting to be returned.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  /// May throw [InternalServiceException].
  /// May throw [PaginationTokenExpiredException].
  ///
  /// Parameter [excludeCompliantResources] :
  /// Specifies whether to exclude resources that are compliant with the tag
  /// policy. Set this to <code>true</code> if you are interested in retrieving
  /// information on noncompliant resources only.
  ///
  /// You can use this parameter only if the
  /// <code>IncludeComplianceDetails</code> parameter is also set to
  /// <code>true</code>.
  ///
  /// Parameter [includeComplianceDetails] :
  /// Specifies whether to include details regarding the compliance with the
  /// effective tag policy. Set this to <code>true</code> to determine whether
  /// resources are compliant with the tag policy and to get details.
  ///
  /// Parameter [paginationToken] :
  /// Specifies a <code>PaginationToken</code> response value from a previous
  /// request to indicate that you want the next page of results. Leave this
  /// parameter empty in your initial request.
  ///
  /// Parameter [resourceARNList] :
  /// Specifies a list of ARNs of resources for which you want to retrieve tag
  /// data. You can't specify both this parameter and any of the pagination
  /// parameters (<code>ResourcesPerPage</code>, <code>TagsPerPage</code>,
  /// <code>PaginationToken</code>) in the same request. If you specify both,
  /// you get an <code>Invalid Parameter</code> exception.
  ///
  /// If a resource specified by this parameter doesn't exist, it doesn't
  /// generate an error; it simply isn't included in the response.
  ///
  /// An ARN (Amazon Resource Name) uniquely identifies a resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in
  /// the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [resourceTypeFilters] :
  /// Specifies the resource types that you want included in the response. The
  /// format of each resource type is <code>service[:resourceType]</code>. For
  /// example, specifying a resource type of <code>ec2</code> returns all Amazon
  /// EC2 resources (which includes EC2 instances). Specifying a resource type
  /// of <code>ec2:instance</code> returns only EC2 instances.
  ///
  /// The string for each service name and resource type is the same as that
  /// embedded in a resource's Amazon Resource Name (ARN). For the list of
  /// services whose resources you can use in this parameter, see <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html">Services
  /// that support the Resource Groups Tagging API</a>.
  ///
  /// You can specify multiple resource types by using an array. The array can
  /// include up to 100 items. Note that the length constraint requirement
  /// applies to each resource type filter. For example, the following string
  /// would limit the response to only Amazon EC2 instances, Amazon S3 buckets,
  /// or any Audit Manager resource:
  ///
  /// <code>ec2:instance,s3:bucket,auditmanager</code>
  ///
  /// Parameter [resourcesPerPage] :
  /// Specifies the maximum number of results to be returned in each page. A
  /// query can return fewer than this maximum, even if there are more results
  /// still to return. You should always check the <code>PaginationToken</code>
  /// response value to see if there are more results. You can specify a minimum
  /// of 1 and a maximum value of 100.
  ///
  /// Parameter [tagFilters] :
  /// Specifies a list of TagFilters (keys and values) to restrict the output to
  /// only those resources that have tags with the specified keys and, if
  /// included, the specified values. Each <code>TagFilter</code> must contain a
  /// key with values optional. A request can include up to 50 keys, and each
  /// key can include up to 20 values.
  ///
  /// Note the following when deciding how to use TagFilters:
  ///
  /// <ul>
  /// <li>
  /// If you <i>don't</i> specify a <code>TagFilter</code>, the response
  /// includes all resources that are currently tagged or ever had a tag.
  /// Resources that currently don't have tags are shown with an empty tag set,
  /// like this: <code>"Tags": []</code>.
  /// </li>
  /// <li>
  /// If you specify more than one filter in a single request, the response
  /// returns only those resources that satisfy all filters.
  /// </li>
  /// <li>
  /// If you specify a filter that contains more than one value for a key, the
  /// response returns resources that match <i>any</i> of the specified values
  /// for that key.
  /// </li>
  /// <li>
  /// If you don't specify a value for a key, the response returns all resources
  /// that are tagged with that key, with any or no value.
  ///
  /// For example, for the following filters: <code>filter1=
  /// {keyA,{value1}}</code>,
  /// <code>filter2={keyB,{value2,value3,value4}}</code>, <code>filter3=
  /// {keyC}</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>GetResources({filter1})</code> returns resources tagged with
  /// <code>key1=value1</code>
  /// </li>
  /// <li>
  /// <code>GetResources({filter2})</code> returns resources tagged with
  /// <code>key2=value2</code> or <code>key2=value3</code> or
  /// <code>key2=value4</code>
  /// </li>
  /// <li>
  /// <code>GetResources({filter3})</code> returns resources tagged with any tag
  /// with the key <code>key3</code>, and with any or no value
  /// </li>
  /// <li>
  /// <code>GetResources({filter1,filter2,filter3})</code> returns resources
  /// tagged with <code>(key1=value1) and (key2=value2 or key2=value3 or
  /// key2=value4) and (key3, any or no value)</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [tagsPerPage] :
  /// Amazon Web Services recommends using <code>ResourcesPerPage</code> instead
  /// of this parameter.
  ///
  /// A limit that restricts the number of tags (key and value pairs) returned
  /// by <code>GetResources</code> in paginated output. A resource with no tags
  /// is counted as having one tag (one key and value pair).
  ///
  /// <code>GetResources</code> does not split a resource and its associated
  /// tags across pages. If the specified <code>TagsPerPage</code> would cause
  /// such a break, a <code>PaginationToken</code> is returned in place of the
  /// affected resource and its tags. Use that token in another request to get
  /// the remaining data. For example, if you specify a <code>TagsPerPage</code>
  /// of <code>100</code> and the account has 22 resources with 10 tags each
  /// (meaning that each resource has 10 key and value pairs), the output will
  /// consist of three pages. The first page displays the first 10 resources,
  /// each with its 10 tags. The second page displays the next 10 resources,
  /// each with its 10 tags. The third page displays the remaining 2 resources,
  /// each with its 10 tags.
  ///
  /// You can set <code>TagsPerPage</code> to a minimum of 100 items up to a
  /// maximum of 500 items.
  Future<GetResourcesOutput> getResources({
    bool? excludeCompliantResources,
    bool? includeComplianceDetails,
    String? paginationToken,
    List<String>? resourceARNList,
    List<String>? resourceTypeFilters,
    int? resourcesPerPage,
    List<TagFilter>? tagFilters,
    int? tagsPerPage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.GetResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (excludeCompliantResources != null)
          'ExcludeCompliantResources': excludeCompliantResources,
        if (includeComplianceDetails != null)
          'IncludeComplianceDetails': includeComplianceDetails,
        if (paginationToken != null) 'PaginationToken': paginationToken,
        if (resourceARNList != null) 'ResourceARNList': resourceARNList,
        if (resourceTypeFilters != null)
          'ResourceTypeFilters': resourceTypeFilters,
        if (resourcesPerPage != null) 'ResourcesPerPage': resourcesPerPage,
        if (tagFilters != null) 'TagFilters': tagFilters,
        if (tagsPerPage != null) 'TagsPerPage': tagsPerPage,
      },
    );

    return GetResourcesOutput.fromJson(jsonResponse.body);
  }

  /// Returns all tag keys currently in use in the specified Amazon Web Services
  /// Region for the calling account.
  ///
  /// This operation supports pagination, where the response can be sent in
  /// multiple pages. You should check the <code>PaginationToken</code> response
  /// parameter to determine if there are additional results available to
  /// return. Repeat the query, passing the <code>PaginationToken</code>
  /// response parameter value as an input to the next request until you recieve
  /// a <code>null</code> value. A null value for <code>PaginationToken</code>
  /// indicates that there are no more results waiting to be returned.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  /// May throw [InternalServiceException].
  /// May throw [PaginationTokenExpiredException].
  ///
  /// Parameter [paginationToken] :
  /// Specifies a <code>PaginationToken</code> response value from a previous
  /// request to indicate that you want the next page of results. Leave this
  /// parameter empty in your initial request.
  Future<GetTagKeysOutput> getTagKeys({
    String? paginationToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.GetTagKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (paginationToken != null) 'PaginationToken': paginationToken,
      },
    );

    return GetTagKeysOutput.fromJson(jsonResponse.body);
  }

  /// Returns all tag values for the specified key that are used in the
  /// specified Amazon Web Services Region for the calling account.
  ///
  /// This operation supports pagination, where the response can be sent in
  /// multiple pages. You should check the <code>PaginationToken</code> response
  /// parameter to determine if there are additional results available to
  /// return. Repeat the query, passing the <code>PaginationToken</code>
  /// response parameter value as an input to the next request until you recieve
  /// a <code>null</code> value. A null value for <code>PaginationToken</code>
  /// indicates that there are no more results waiting to be returned.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  /// May throw [InternalServiceException].
  /// May throw [PaginationTokenExpiredException].
  ///
  /// Parameter [key] :
  /// Specifies the tag key for which you want to list all existing values that
  /// are currently used in the specified Amazon Web Services Region for the
  /// calling account.
  ///
  /// Parameter [paginationToken] :
  /// Specifies a <code>PaginationToken</code> response value from a previous
  /// request to indicate that you want the next page of results. Leave this
  /// parameter empty in your initial request.
  Future<GetTagValuesOutput> getTagValues({
    required String key,
    String? paginationToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.GetTagValues'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Key': key,
        if (paginationToken != null) 'PaginationToken': paginationToken,
      },
    );

    return GetTagValuesOutput.fromJson(jsonResponse.body);
  }

  /// Generates a report that lists all tagged resources in the accounts across
  /// your organization and tells whether each resource is compliant with the
  /// effective tag policy. Compliance data is refreshed daily. The report is
  /// generated asynchronously.
  ///
  /// The generated report is saved to the following location:
  ///
  /// <code>s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv</code>
  ///
  /// You can call this operation only from the organization's management
  /// account and from the us-east-1 Region.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [s3Bucket] :
  /// The name of the Amazon S3 bucket where the report will be stored; for
  /// example:
  ///
  /// <code>awsexamplebucket</code>
  ///
  /// For more information on S3 bucket requirements, including an example
  /// bucket policy, see the example S3 bucket policy on this page.
  Future<void> startReportCreation({
    required String s3Bucket,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.StartReportCreation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'S3Bucket': s3Bucket,
      },
    );
  }

  /// Applies one or more tags to the specified resources. Note the following:
  ///
  /// <ul>
  /// <li>
  /// Not all resources can have tags. For a list of services with resources
  /// that support tagging using this operation, see <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html">Services
  /// that support the Resource Groups Tagging API</a>. If the resource doesn't
  /// yet support this operation, the resource's service might support tagging
  /// using its own API operations. For more information, refer to the
  /// documentation for that service.
  /// </li>
  /// <li>
  /// Each resource can have up to 50 tags. For other limits, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions">Tag
  /// Naming and Usage Conventions</a> in the <i>Amazon Web Services General
  /// Reference.</i>
  /// </li>
  /// <li>
  /// You can only tag resources that are located in the specified Amazon Web
  /// Services Region for the Amazon Web Services account.
  /// </li>
  /// <li>
  /// To add tags to a resource, you need the necessary permissions for the
  /// service that the resource belongs to as well as permissions for adding
  /// tags. For more information, see the documentation for each service.
  /// </li>
  /// </ul> <important>
  /// Do not store personally identifiable information (PII) or other
  /// confidential or sensitive information in tags. We use tags to provide you
  /// with billing and administration services. Tags are not intended to be used
  /// for private or sensitive data.
  /// </important>
  /// <b>Minimum permissions</b>
  ///
  /// In addition to the <code>tag:TagResources</code> permission required by
  /// this operation, you must also have the tagging permission defined by the
  /// service that created the resource. For example, to tag an Amazon EC2
  /// instance using the <code>TagResources</code> operation, you must have both
  /// of the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>tag:TagResource</code>
  /// </li>
  /// <li>
  /// <code>ec2:CreateTags</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceARNList] :
  /// Specifies the list of ARNs of the resources that you want to apply tags
  /// to.
  ///
  /// An ARN (Amazon Resource Name) uniquely identifies a resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in
  /// the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [tags] :
  /// Specifies a list of tags that you want to add to the specified resources.
  /// A tag consists of a key and a value that you define.
  Future<TagResourcesOutput> tagResources({
    required List<String> resourceARNList,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.TagResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARNList': resourceARNList,
        'Tags': tags,
      },
    );

    return TagResourcesOutput.fromJson(jsonResponse.body);
  }

  /// Removes the specified tags from the specified resources. When you specify
  /// a tag key, the action removes both that key and its associated value. The
  /// operation succeeds even if you attempt to remove tags from a resource that
  /// were already removed. Note the following:
  ///
  /// <ul>
  /// <li>
  /// To remove tags from a resource, you need the necessary permissions for the
  /// service that the resource belongs to as well as permissions for removing
  /// tags. For more information, see the documentation for the service whose
  /// resource you want to untag.
  /// </li>
  /// <li>
  /// You can only tag resources that are located in the specified Amazon Web
  /// Services Region for the calling Amazon Web Services account.
  /// </li>
  /// </ul>
  /// <b>Minimum permissions</b>
  ///
  /// In addition to the <code>tag:UntagResources</code> permission required by
  /// this operation, you must also have the remove tags permission defined by
  /// the service that created the resource. For example, to remove the tags
  /// from an Amazon EC2 instance using the <code>UntagResources</code>
  /// operation, you must have both of the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>tag:UntagResource</code>
  /// </li>
  /// <li>
  /// <code>ec2:DeleteTags</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceARNList] :
  /// Specifies a list of ARNs of the resources that you want to remove tags
  /// from.
  ///
  /// An ARN (Amazon Resource Name) uniquely identifies a resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in
  /// the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [tagKeys] :
  /// Specifies a list of tag keys that you want to remove from the specified
  /// resources.
  Future<UntagResourcesOutput> untagResources({
    required List<String> resourceARNList,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ResourceGroupsTaggingAPI_20170126.UntagResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARNList': resourceARNList,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourcesOutput.fromJson(jsonResponse.body);
  }
}

/// Information that shows whether a resource is compliant with the effective
/// tag policy, including details on any noncompliant tag keys.
class ComplianceDetails {
  /// Whether a resource is compliant with the effective tag policy.
  final bool? complianceStatus;

  /// These are keys defined in the effective policy that are on the resource with
  /// either incorrect case treatment or noncompliant values.
  final List<String>? keysWithNoncompliantValues;

  /// These tag keys on the resource are noncompliant with the effective tag
  /// policy.
  final List<String>? noncompliantKeys;

  ComplianceDetails({
    this.complianceStatus,
    this.keysWithNoncompliantValues,
    this.noncompliantKeys,
  });

  factory ComplianceDetails.fromJson(Map<String, dynamic> json) {
    return ComplianceDetails(
      complianceStatus: json['ComplianceStatus'] as bool?,
      keysWithNoncompliantValues: (json['KeysWithNoncompliantValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      noncompliantKeys: (json['NoncompliantKeys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceStatus = this.complianceStatus;
    final keysWithNoncompliantValues = this.keysWithNoncompliantValues;
    final noncompliantKeys = this.noncompliantKeys;
    return {
      if (complianceStatus != null) 'ComplianceStatus': complianceStatus,
      if (keysWithNoncompliantValues != null)
        'KeysWithNoncompliantValues': keysWithNoncompliantValues,
      if (noncompliantKeys != null) 'NoncompliantKeys': noncompliantKeys,
    };
  }
}

class DescribeReportCreationOutput {
  /// Details of the common errors that all operations return.
  final String? errorMessage;

  /// The path to the Amazon S3 bucket where the report was stored on creation.
  final String? s3Location;

  /// Reports the status of the operation.
  ///
  /// The operation status can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>RUNNING</code> - Report creation is in progress.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code> - Report creation is complete. You can open the
  /// report from the Amazon S3 bucket that you specified when you ran
  /// <code>StartReportCreation</code>.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Report creation timed out or the Amazon S3 bucket is
  /// not accessible.
  /// </li>
  /// <li>
  /// <code>NO REPORT</code> - No report was generated in the last 90 days.
  /// </li>
  /// </ul>
  final String? status;

  DescribeReportCreationOutput({
    this.errorMessage,
    this.s3Location,
    this.status,
  });

  factory DescribeReportCreationOutput.fromJson(Map<String, dynamic> json) {
    return DescribeReportCreationOutput(
      errorMessage: json['ErrorMessage'] as String?,
      s3Location: json['S3Location'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final s3Location = this.s3Location;
    final status = this.status;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (s3Location != null) 'S3Location': s3Location,
      if (status != null) 'Status': status,
    };
  }
}

enum ErrorCode {
  internalServiceException,
  invalidParameterException,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.internalServiceException:
        return 'InternalServiceException';
      case ErrorCode.invalidParameterException:
        return 'InvalidParameterException';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'InternalServiceException':
        return ErrorCode.internalServiceException;
      case 'InvalidParameterException':
        return ErrorCode.invalidParameterException;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Information about the errors that are returned for each failed resource.
/// This information can include <code>InternalServiceException</code> and
/// <code>InvalidParameterException</code> errors. It can also include any valid
/// error code returned by the Amazon Web Services service that hosts the
/// resource that the ARN key represents.
///
/// The following are common error codes that you might receive from other
/// Amazon Web Services services:
///
/// <ul>
/// <li>
/// <b>InternalServiceException</b> – This can mean that the Resource Groups
/// Tagging API didn't receive a response from another Amazon Web Services
/// service. It can also mean that the resource type in the request is not
/// supported by the Resource Groups Tagging API. In these cases, it's safe to
/// retry the request and then call <a
/// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html">GetResources</a>
/// to verify the changes.
/// </li>
/// <li>
/// <b>AccessDeniedException</b> – This can mean that you need permission to
/// call the tagging operations in the Amazon Web Services service that contains
/// the resource. For example, to use the Resource Groups Tagging API to tag a
/// Amazon CloudWatch alarm resource, you need permission to call both <a
/// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_TagResources.html">
/// <code>TagResources</code> </a> <i>and</i> <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html">
/// <code>TagResource</code> </a> in the CloudWatch API.
/// </li>
/// </ul>
/// For more information on errors that are generated from other Amazon Web
/// Services services, see the documentation for that service.
class FailureInfo {
  /// The code of the common error. Valid values include
  /// <code>InternalServiceException</code>,
  /// <code>InvalidParameterException</code>, and any valid error code returned by
  /// the Amazon Web Services service that hosts the resource that you want to
  /// tag.
  final ErrorCode? errorCode;

  /// The message of the common error.
  final String? errorMessage;

  /// The HTTP status code of the common error.
  final int? statusCode;

  FailureInfo({
    this.errorCode,
    this.errorMessage,
    this.statusCode,
  });

  factory FailureInfo.fromJson(Map<String, dynamic> json) {
    return FailureInfo(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final statusCode = this.statusCode;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (statusCode != null) 'StatusCode': statusCode,
    };
  }
}

class GetComplianceSummaryOutput {
  /// A string that indicates that there is more data available than this response
  /// contains. To receive the next part of the response, specify this response
  /// value as the <code>PaginationToken</code> value in the request for the next
  /// page.
  final String? paginationToken;

  /// A table that shows counts of noncompliant resources.
  final List<Summary>? summaryList;

  GetComplianceSummaryOutput({
    this.paginationToken,
    this.summaryList,
  });

  factory GetComplianceSummaryOutput.fromJson(Map<String, dynamic> json) {
    return GetComplianceSummaryOutput(
      paginationToken: json['PaginationToken'] as String?,
      summaryList: (json['SummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => Summary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final paginationToken = this.paginationToken;
    final summaryList = this.summaryList;
    return {
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (summaryList != null) 'SummaryList': summaryList,
    };
  }
}

class GetResourcesOutput {
  /// A string that indicates that there is more data available than this response
  /// contains. To receive the next part of the response, specify this response
  /// value as the <code>PaginationToken</code> value in the request for the next
  /// page.
  final String? paginationToken;

  /// A list of resource ARNs and the tags (keys and values) associated with each.
  final List<ResourceTagMapping>? resourceTagMappingList;

  GetResourcesOutput({
    this.paginationToken,
    this.resourceTagMappingList,
  });

  factory GetResourcesOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcesOutput(
      paginationToken: json['PaginationToken'] as String?,
      resourceTagMappingList: (json['ResourceTagMappingList'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTagMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final paginationToken = this.paginationToken;
    final resourceTagMappingList = this.resourceTagMappingList;
    return {
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (resourceTagMappingList != null)
        'ResourceTagMappingList': resourceTagMappingList,
    };
  }
}

class GetTagKeysOutput {
  /// A string that indicates that there is more data available than this response
  /// contains. To receive the next part of the response, specify this response
  /// value as the <code>PaginationToken</code> value in the request for the next
  /// page.
  final String? paginationToken;

  /// A list of all tag keys in the Amazon Web Services account.
  final List<String>? tagKeys;

  GetTagKeysOutput({
    this.paginationToken,
    this.tagKeys,
  });

  factory GetTagKeysOutput.fromJson(Map<String, dynamic> json) {
    return GetTagKeysOutput(
      paginationToken: json['PaginationToken'] as String?,
      tagKeys: (json['TagKeys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final paginationToken = this.paginationToken;
    final tagKeys = this.tagKeys;
    return {
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (tagKeys != null) 'TagKeys': tagKeys,
    };
  }
}

class GetTagValuesOutput {
  /// A string that indicates that there is more data available than this response
  /// contains. To receive the next part of the response, specify this response
  /// value as the <code>PaginationToken</code> value in the request for the next
  /// page.
  final String? paginationToken;

  /// A list of all tag values for the specified key currently used in the
  /// specified Amazon Web Services Region for the calling account.
  final List<String>? tagValues;

  GetTagValuesOutput({
    this.paginationToken,
    this.tagValues,
  });

  factory GetTagValuesOutput.fromJson(Map<String, dynamic> json) {
    return GetTagValuesOutput(
      paginationToken: json['PaginationToken'] as String?,
      tagValues: (json['TagValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final paginationToken = this.paginationToken;
    final tagValues = this.tagValues;
    return {
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (tagValues != null) 'TagValues': tagValues,
    };
  }
}

enum GroupByAttribute {
  targetId,
  region,
  resourceType,
}

extension GroupByAttributeValueExtension on GroupByAttribute {
  String toValue() {
    switch (this) {
      case GroupByAttribute.targetId:
        return 'TARGET_ID';
      case GroupByAttribute.region:
        return 'REGION';
      case GroupByAttribute.resourceType:
        return 'RESOURCE_TYPE';
    }
  }
}

extension GroupByAttributeFromString on String {
  GroupByAttribute toGroupByAttribute() {
    switch (this) {
      case 'TARGET_ID':
        return GroupByAttribute.targetId;
      case 'REGION':
        return GroupByAttribute.region;
      case 'RESOURCE_TYPE':
        return GroupByAttribute.resourceType;
    }
    throw Exception('$this is not known in enum GroupByAttribute');
  }
}

/// A list of resource ARNs and the tags (keys and values) that are associated
/// with each.
class ResourceTagMapping {
  /// Information that shows whether a resource is compliant with the effective
  /// tag policy, including details on any noncompliant tag keys.
  final ComplianceDetails? complianceDetails;

  /// The ARN of the resource.
  final String? resourceARN;

  /// The tags that have been applied to one or more Amazon Web Services
  /// resources.
  final List<Tag>? tags;

  ResourceTagMapping({
    this.complianceDetails,
    this.resourceARN,
    this.tags,
  });

  factory ResourceTagMapping.fromJson(Map<String, dynamic> json) {
    return ResourceTagMapping(
      complianceDetails: json['ComplianceDetails'] != null
          ? ComplianceDetails.fromJson(
              json['ComplianceDetails'] as Map<String, dynamic>)
          : null,
      resourceARN: json['ResourceARN'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceDetails = this.complianceDetails;
    final resourceARN = this.resourceARN;
    final tags = this.tags;
    return {
      if (complianceDetails != null) 'ComplianceDetails': complianceDetails,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (tags != null) 'Tags': tags,
    };
  }
}

class StartReportCreationOutput {
  StartReportCreationOutput();

  factory StartReportCreationOutput.fromJson(Map<String, dynamic> _) {
    return StartReportCreationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A count of noncompliant resources.
class Summary {
  /// The timestamp that shows when this summary was generated in this Region.
  final String? lastUpdated;

  /// The count of noncompliant resources.
  final int? nonCompliantResources;

  /// The Amazon Web Services Region that the summary applies to.
  final String? region;

  /// The Amazon Web Services resource type.
  final String? resourceType;

  /// The account identifier or the root identifier of the organization. If you
  /// don't know the root ID, you can call the Organizations <a
  /// href="https://docs.aws.amazon.com/organizations/latest/APIReference/API_ListRoots.html">ListRoots</a>
  /// API.
  final String? targetId;

  /// Whether the target is an account, an OU, or the organization root.
  final TargetIdType? targetIdType;

  Summary({
    this.lastUpdated,
    this.nonCompliantResources,
    this.region,
    this.resourceType,
    this.targetId,
    this.targetIdType,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      lastUpdated: json['LastUpdated'] as String?,
      nonCompliantResources: json['NonCompliantResources'] as int?,
      region: json['Region'] as String?,
      resourceType: json['ResourceType'] as String?,
      targetId: json['TargetId'] as String?,
      targetIdType: (json['TargetIdType'] as String?)?.toTargetIdType(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdated = this.lastUpdated;
    final nonCompliantResources = this.nonCompliantResources;
    final region = this.region;
    final resourceType = this.resourceType;
    final targetId = this.targetId;
    final targetIdType = this.targetIdType;
    return {
      if (lastUpdated != null) 'LastUpdated': lastUpdated,
      if (nonCompliantResources != null)
        'NonCompliantResources': nonCompliantResources,
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType,
      if (targetId != null) 'TargetId': targetId,
      if (targetIdType != null) 'TargetIdType': targetIdType.toValue(),
    };
  }
}

/// The metadata that you apply to Amazon Web Services resources to help you
/// categorize and organize them. Each tag consists of a key and a value, both
/// of which you define. For more information, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// Amazon Web Services Resources</a> in the <i>Amazon Web Services General
/// Reference</i>.
class Tag {
  /// One part of a key-value pair that makes up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String key;

  /// One part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key). The value can be empty or null.
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

/// A list of tags (keys and values) that are used to specify the associated
/// resources.
class TagFilter {
  /// One part of a key-value pair that makes up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String? key;

  /// One part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key). The value can be empty or null.
  final List<String>? values;

  TagFilter({
    this.key,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      if (key != null) 'Key': key,
      if (values != null) 'Values': values,
    };
  }
}

class TagResourcesOutput {
  /// A map containing a key-value pair for each failed item that couldn't be
  /// tagged. The key is the ARN of the failed resource. The value is a
  /// <code>FailureInfo</code> object that contains an error code, a status code,
  /// and an error message. If there are no errors, the
  /// <code>FailedResourcesMap</code> is empty.
  final Map<String, FailureInfo>? failedResourcesMap;

  TagResourcesOutput({
    this.failedResourcesMap,
  });

  factory TagResourcesOutput.fromJson(Map<String, dynamic> json) {
    return TagResourcesOutput(
      failedResourcesMap: (json['FailedResourcesMap'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, FailureInfo.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final failedResourcesMap = this.failedResourcesMap;
    return {
      if (failedResourcesMap != null) 'FailedResourcesMap': failedResourcesMap,
    };
  }
}

enum TargetIdType {
  account,
  ou,
  root,
}

extension TargetIdTypeValueExtension on TargetIdType {
  String toValue() {
    switch (this) {
      case TargetIdType.account:
        return 'ACCOUNT';
      case TargetIdType.ou:
        return 'OU';
      case TargetIdType.root:
        return 'ROOT';
    }
  }
}

extension TargetIdTypeFromString on String {
  TargetIdType toTargetIdType() {
    switch (this) {
      case 'ACCOUNT':
        return TargetIdType.account;
      case 'OU':
        return TargetIdType.ou;
      case 'ROOT':
        return TargetIdType.root;
    }
    throw Exception('$this is not known in enum TargetIdType');
  }
}

class UntagResourcesOutput {
  /// A map containing a key-value pair for each failed item that couldn't be
  /// untagged. The key is the ARN of the failed resource. The value is a
  /// <code>FailureInfo</code> object that contains an error code, a status code,
  /// and an error message. If there are no errors, the
  /// <code>FailedResourcesMap</code> is empty.
  final Map<String, FailureInfo>? failedResourcesMap;

  UntagResourcesOutput({
    this.failedResourcesMap,
  });

  factory UntagResourcesOutput.fromJson(Map<String, dynamic> json) {
    return UntagResourcesOutput(
      failedResourcesMap: (json['FailedResourcesMap'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, FailureInfo.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final failedResourcesMap = this.failedResourcesMap;
    return {
      if (failedResourcesMap != null) 'FailedResourcesMap': failedResourcesMap,
    };
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConstraintViolationException extends _s.GenericAwsException {
  ConstraintViolationException({String? type, String? message})
      : super(
            type: type, code: 'ConstraintViolationException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class PaginationTokenExpiredException extends _s.GenericAwsException {
  PaginationTokenExpiredException({String? type, String? message})
      : super(
            type: type,
            code: 'PaginationTokenExpiredException',
            message: message);
}

class ThrottledException extends _s.GenericAwsException {
  ThrottledException({String? type, String? message})
      : super(type: type, code: 'ThrottledException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConstraintViolationException': (type, message) =>
      ConstraintViolationException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'PaginationTokenExpiredException': (type, message) =>
      PaginationTokenExpiredException(type: type, message: message),
  'ThrottledException': (type, message) =>
      ThrottledException(type: type, message: message),
};
