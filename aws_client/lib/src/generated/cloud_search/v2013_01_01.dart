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

import 'v2013_01_01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// You use the Amazon CloudSearch configuration service to create, configure,
/// and manage search domains. Configuration service requests are submitted
/// using the AWS Query protocol. AWS Query requests are HTTP or HTTPS requests
/// submitted via HTTP GET or POST with a query parameter named Action.
class CloudSearch {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  CloudSearch({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudsearch',
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

  /// Indexes the search suggestions. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html#configuring-suggesters">Configuring
  /// Suggesters</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<BuildSuggestersResponse> buildSuggesters({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'BuildSuggesters',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BuildSuggestersRequest'],
      shapes: shapes,
      resultWrapper: 'BuildSuggestersResult',
    );
    return BuildSuggestersResponse.fromXml($result);
  }

  /// Creates a new search domain. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/creating-domains.html"
  /// target="_blank">Creating a Search Domain</a> in the <i>Amazon CloudSearch
  /// Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// A name for the domain you are creating. Allowed characters are a-z
  /// (lower-case letters), 0-9, and hyphen (-). Domain names must start with a
  /// letter or number and be at least 3 and no more than 28 characters long.
  Future<CreateDomainResponse> createDomain({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'CreateDomain',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDomainRequest'],
      shapes: shapes,
      resultWrapper: 'CreateDomainResult',
    );
    return CreateDomainResponse.fromXml($result);
  }

  /// Configures an analysis scheme that can be applied to a <code>text</code>
  /// or <code>text-array</code> field to define language-specific text
  /// processing options. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html"
  /// target="_blank">Configuring Analysis Schemes</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<DefineAnalysisSchemeResponse> defineAnalysisScheme({
    required AnalysisScheme analysisScheme,
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AnalysisScheme'] = analysisScheme;
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DefineAnalysisScheme',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DefineAnalysisSchemeRequest'],
      shapes: shapes,
      resultWrapper: 'DefineAnalysisSchemeResult',
    );
    return DefineAnalysisSchemeResponse.fromXml($result);
  }

  /// Configures an <code><a>Expression</a></code> for the search domain. Used
  /// to create new expressions and modify existing ones. If the expression
  /// exists, the new configuration replaces the old one. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html"
  /// target="_blank">Configuring Expressions</a> in the <i>Amazon CloudSearch
  /// Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<DefineExpressionResponse> defineExpression({
    required String domainName,
    required Expression expression,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['Expression'] = expression;
    final $result = await _protocol.send(
      $request,
      action: 'DefineExpression',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DefineExpressionRequest'],
      shapes: shapes,
      resultWrapper: 'DefineExpressionResult',
    );
    return DefineExpressionResponse.fromXml($result);
  }

  /// Configures an <code><a>IndexField</a></code> for the search domain. Used
  /// to create new fields and modify existing ones. You must specify the name
  /// of the domain you are configuring and an index field configuration. The
  /// index field configuration specifies a unique name, the index field type,
  /// and the options you want to configure for the field. The options you can
  /// specify depend on the <code><a>IndexFieldType</a></code>. If the field
  /// exists, the new configuration replaces the old one. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html"
  /// target="_blank">Configuring Index Fields</a> in the <i>Amazon CloudSearch
  /// Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexField] :
  /// The index field and field options you want to configure.
  Future<DefineIndexFieldResponse> defineIndexField({
    required String domainName,
    required IndexField indexField,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['IndexField'] = indexField;
    final $result = await _protocol.send(
      $request,
      action: 'DefineIndexField',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DefineIndexFieldRequest'],
      shapes: shapes,
      resultWrapper: 'DefineIndexFieldResult',
    );
    return DefineIndexFieldResponse.fromXml($result);
  }

  /// Configures a suggester for a domain. A suggester enables you to display
  /// possible matches before users finish typing their queries. When you
  /// configure a suggester, you must specify the name of the text field you
  /// want to search for possible matches and a unique name for the suggester.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html"
  /// target="_blank">Getting Search Suggestions</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<DefineSuggesterResponse> defineSuggester({
    required String domainName,
    required Suggester suggester,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['Suggester'] = suggester;
    final $result = await _protocol.send(
      $request,
      action: 'DefineSuggester',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DefineSuggesterRequest'],
      shapes: shapes,
      resultWrapper: 'DefineSuggesterResult',
    );
    return DefineSuggesterResponse.fromXml($result);
  }

  /// Deletes an analysis scheme. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html"
  /// target="_blank">Configuring Analysis Schemes</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisSchemeName] :
  /// The name of the analysis scheme you want to delete.
  Future<DeleteAnalysisSchemeResponse> deleteAnalysisScheme({
    required String analysisSchemeName,
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AnalysisSchemeName'] = analysisSchemeName;
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteAnalysisScheme',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAnalysisSchemeRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteAnalysisSchemeResult',
    );
    return DeleteAnalysisSchemeResponse.fromXml($result);
  }

  /// Permanently deletes a search domain and all of its data. Once a domain has
  /// been deleted, it cannot be recovered. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/deleting-domains.html"
  /// target="_blank">Deleting a Search Domain</a> in the <i>Amazon CloudSearch
  /// Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to permanently delete.
  Future<DeleteDomainResponse> deleteDomain({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDomain',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDomainRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteDomainResult',
    );
    return DeleteDomainResponse.fromXml($result);
  }

  /// Removes an <code><a>Expression</a></code> from the search domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html"
  /// target="_blank">Configuring Expressions</a> in the <i>Amazon CloudSearch
  /// Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [expressionName] :
  /// The name of the <code><a>Expression</a></code> to delete.
  Future<DeleteExpressionResponse> deleteExpression({
    required String domainName,
    required String expressionName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['ExpressionName'] = expressionName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteExpression',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteExpressionRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteExpressionResult',
    );
    return DeleteExpressionResponse.fromXml($result);
  }

  /// Removes an <code><a>IndexField</a></code> from the search domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html"
  /// target="_blank">Configuring Index Fields</a> in the <i>Amazon CloudSearch
  /// Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexFieldName] :
  /// The name of the index field your want to remove from the domain's indexing
  /// options.
  Future<DeleteIndexFieldResponse> deleteIndexField({
    required String domainName,
    required String indexFieldName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['IndexFieldName'] = indexFieldName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteIndexField',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteIndexFieldRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteIndexFieldResult',
    );
    return DeleteIndexFieldResponse.fromXml($result);
  }

  /// Deletes a suggester. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html"
  /// target="_blank">Getting Search Suggestions</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [suggesterName] :
  /// Specifies the name of the suggester you want to delete.
  Future<DeleteSuggesterResponse> deleteSuggester({
    required String domainName,
    required String suggesterName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['SuggesterName'] = suggesterName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteSuggester',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSuggesterRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteSuggesterResult',
    );
    return DeleteSuggesterResponse.fromXml($result);
  }

  /// Gets the analysis schemes configured for a domain. An analysis scheme
  /// defines language-specific text processing options for a <code>text</code>
  /// field. Can be limited to specific analysis schemes by name. By default,
  /// shows all analysis schemes and includes any pending changes to the
  /// configuration. Set the <code>Deployed</code> option to <code>true</code>
  /// to show the active configuration and exclude pending changes. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html"
  /// target="_blank">Configuring Analysis Schemes</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to describe.
  ///
  /// Parameter [analysisSchemeNames] :
  /// The analysis schemes you want to describe.
  ///
  /// Parameter [deployed] :
  /// Whether to display the deployed configuration (<code>true</code>) or
  /// include any pending changes (<code>false</code>). Defaults to
  /// <code>false</code>.
  Future<DescribeAnalysisSchemesResponse> describeAnalysisSchemes({
    required String domainName,
    List<String>? analysisSchemeNames,
    bool? deployed,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    analysisSchemeNames?.also((arg) => $request['AnalysisSchemeNames'] = arg);
    deployed?.also((arg) => $request['Deployed'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAnalysisSchemes',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAnalysisSchemesRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeAnalysisSchemesResult',
    );
    return DescribeAnalysisSchemesResponse.fromXml($result);
  }

  /// Gets the availability options configured for a domain. By default, shows
  /// the configuration with any pending changes. Set the <code>Deployed</code>
  /// option to <code>true</code> to show the active configuration and exclude
  /// pending changes. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html"
  /// target="_blank">Configuring Availability Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to describe.
  ///
  /// Parameter [deployed] :
  /// Whether to display the deployed configuration (<code>true</code>) or
  /// include any pending changes (<code>false</code>). Defaults to
  /// <code>false</code>.
  Future<DescribeAvailabilityOptionsResponse> describeAvailabilityOptions({
    required String domainName,
    bool? deployed,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    deployed?.also((arg) => $request['Deployed'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAvailabilityOptions',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAvailabilityOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeAvailabilityOptionsResult',
    );
    return DescribeAvailabilityOptionsResponse.fromXml($result);
  }

  /// Returns the domain's endpoint options, specifically whether all requests
  /// to the domain must arrive over HTTPS. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-domain-endpoint-options.html"
  /// target="_blank">Configuring Domain Endpoint Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [domainName] :
  /// A string that represents the name of a domain.
  ///
  /// Parameter [deployed] :
  /// Whether to retrieve the latest configuration (which might be in a
  /// Processing state) or the current, active configuration. Defaults to
  /// <code>false</code>.
  Future<DescribeDomainEndpointOptionsResponse> describeDomainEndpointOptions({
    required String domainName,
    bool? deployed,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    deployed?.also((arg) => $request['Deployed'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDomainEndpointOptions',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDomainEndpointOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeDomainEndpointOptionsResult',
    );
    return DescribeDomainEndpointOptionsResponse.fromXml($result);
  }

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default. To get the
  /// number of searchable documents in a domain, use the console or submit a
  /// <code>matchall</code> request to your domain's search endpoint:
  /// <code>q=matchall&amp;amp;q.parser=structured&amp;amp;size=0</code>. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html"
  /// target="_blank">Getting Information about a Search Domain</a> in the
  /// <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainNames] :
  /// The names of the domains you want to include in the response.
  Future<DescribeDomainsResponse> describeDomains({
    List<String>? domainNames,
  }) async {
    final $request = <String, dynamic>{};
    domainNames?.also((arg) => $request['DomainNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDomains',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDomainsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeDomainsResult',
    );
    return DescribeDomainsResponse.fromXml($result);
  }

  /// Gets the expressions configured for the search domain. Can be limited to
  /// specific expressions by name. By default, shows all expressions and
  /// includes any pending changes to the configuration. Set the
  /// <code>Deployed</code> option to <code>true</code> to show the active
  /// configuration and exclude pending changes. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html"
  /// target="_blank">Configuring Expressions</a> in the <i>Amazon CloudSearch
  /// Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to describe.
  ///
  /// Parameter [deployed] :
  /// Whether to display the deployed configuration (<code>true</code>) or
  /// include any pending changes (<code>false</code>). Defaults to
  /// <code>false</code>.
  ///
  /// Parameter [expressionNames] :
  /// Limits the <code><a>DescribeExpressions</a></code> response to the
  /// specified expressions. If not specified, all expressions are shown.
  Future<DescribeExpressionsResponse> describeExpressions({
    required String domainName,
    bool? deployed,
    List<String>? expressionNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    deployed?.also((arg) => $request['Deployed'] = arg);
    expressionNames?.also((arg) => $request['ExpressionNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeExpressions',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeExpressionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeExpressionsResult',
    );
    return DescribeExpressionsResponse.fromXml($result);
  }

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. By default, shows all fields
  /// and includes any pending changes to the configuration. Set the
  /// <code>Deployed</code> option to <code>true</code> to show the active
  /// configuration and exclude pending changes. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html"
  /// target="_blank">Getting Domain Information</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to describe.
  ///
  /// Parameter [deployed] :
  /// Whether to display the deployed configuration (<code>true</code>) or
  /// include any pending changes (<code>false</code>). Defaults to
  /// <code>false</code>.
  ///
  /// Parameter [fieldNames] :
  /// A list of the index fields you want to describe. If not specified,
  /// information is returned for all configured index fields.
  Future<DescribeIndexFieldsResponse> describeIndexFields({
    required String domainName,
    bool? deployed,
    List<String>? fieldNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    deployed?.also((arg) => $request['Deployed'] = arg);
    fieldNames?.also((arg) => $request['FieldNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeIndexFields',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeIndexFieldsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeIndexFieldsResult',
    );
    return DescribeIndexFieldsResponse.fromXml($result);
  }

  /// Gets the scaling parameters configured for a domain. A domain's scaling
  /// parameters specify the desired search instance type and replication count.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html"
  /// target="_blank">Configuring Scaling Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeScalingParametersResponse> describeScalingParameters({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeScalingParameters',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeScalingParametersRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeScalingParametersResult',
    );
    return DescribeScalingParametersResponse.fromXml($result);
  }

  /// Gets information about the access policies that control access to the
  /// domain's document and search endpoints. By default, shows the
  /// configuration with any pending changes. Set the <code>Deployed</code>
  /// option to <code>true</code> to show the active configuration and exclude
  /// pending changes. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html"
  /// target="_blank">Configuring Access for a Search Domain</a> in the
  /// <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to describe.
  ///
  /// Parameter [deployed] :
  /// Whether to display the deployed configuration (<code>true</code>) or
  /// include any pending changes (<code>false</code>). Defaults to
  /// <code>false</code>.
  Future<DescribeServiceAccessPoliciesResponse> describeServiceAccessPolicies({
    required String domainName,
    bool? deployed,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    deployed?.also((arg) => $request['Deployed'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeServiceAccessPolicies',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeServiceAccessPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeServiceAccessPoliciesResult',
    );
    return DescribeServiceAccessPoliciesResponse.fromXml($result);
  }

  /// Gets the suggesters configured for a domain. A suggester enables you to
  /// display possible matches before users finish typing their queries. Can be
  /// limited to specific suggesters by name. By default, shows all suggesters
  /// and includes any pending changes to the configuration. Set the
  /// <code>Deployed</code> option to <code>true</code> to show the active
  /// configuration and exclude pending changes. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html"
  /// target="_blank">Getting Search Suggestions</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to describe.
  ///
  /// Parameter [deployed] :
  /// Whether to display the deployed configuration (<code>true</code>) or
  /// include any pending changes (<code>false</code>). Defaults to
  /// <code>false</code>.
  ///
  /// Parameter [suggesterNames] :
  /// The suggesters you want to describe.
  Future<DescribeSuggestersResponse> describeSuggesters({
    required String domainName,
    bool? deployed,
    List<String>? suggesterNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    deployed?.also((arg) => $request['Deployed'] = arg);
    suggesterNames?.also((arg) => $request['SuggesterNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSuggesters',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSuggestersRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeSuggestersResult',
    );
    return DescribeSuggestersResponse.fromXml($result);
  }

  /// Tells the search domain to start indexing its documents using the latest
  /// indexing options. This operation must be invoked to activate options whose
  /// <a>OptionStatus</a> is <code>RequiresIndexDocuments</code>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<IndexDocumentsResponse> indexDocuments({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'IndexDocuments',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['IndexDocumentsRequest'],
      shapes: shapes,
      resultWrapper: 'IndexDocumentsResult',
    );
    return IndexDocumentsResponse.fromXml($result);
  }

  /// Lists all search domains owned by an account.
  ///
  /// May throw [BaseException].
  Future<ListDomainNamesResponse> listDomainNames() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListDomainNames',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'ListDomainNamesResult',
    );
    return ListDomainNamesResponse.fromXml($result);
  }

  /// Configures the availability options for a domain. Enabling the Multi-AZ
  /// option expands an Amazon CloudSearch domain to an additional Availability
  /// Zone in the same Region to increase fault tolerance in the event of a
  /// service disruption. Changes to the Multi-AZ option can take about half an
  /// hour to become active. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html"
  /// target="_blank">Configuring Availability Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  ///
  /// Parameter [multiAZ] :
  /// You expand an existing search domain to a second Availability Zone by
  /// setting the Multi-AZ option to true. Similarly, you can turn off the
  /// Multi-AZ option to downgrade the domain to a single Availability Zone by
  /// setting the Multi-AZ option to <code>false</code>.
  Future<UpdateAvailabilityOptionsResponse> updateAvailabilityOptions({
    required String domainName,
    required bool multiAZ,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['MultiAZ'] = multiAZ;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateAvailabilityOptions',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateAvailabilityOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateAvailabilityOptionsResult',
    );
    return UpdateAvailabilityOptionsResponse.fromXml($result);
  }

  /// Updates the domain's endpoint options, specifically whether all requests
  /// to the domain must arrive over HTTPS. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-domain-endpoint-options.html"
  /// target="_blank">Configuring Domain Endpoint Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainEndpointOptions] :
  /// Whether to require that all requests to the domain arrive over HTTPS. We
  /// recommend Policy-Min-TLS-1-2-2019-07 for TLSSecurityPolicy. For
  /// compatibility with older clients, the default is
  /// Policy-Min-TLS-1-0-2019-07.
  ///
  /// Parameter [domainName] :
  /// A string that represents the name of a domain.
  Future<UpdateDomainEndpointOptionsResponse> updateDomainEndpointOptions({
    required DomainEndpointOptions domainEndpointOptions,
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainEndpointOptions'] = domainEndpointOptions;
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateDomainEndpointOptions',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateDomainEndpointOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateDomainEndpointOptionsResult',
    );
    return UpdateDomainEndpointOptionsResponse.fromXml($result);
  }

  /// Configures scaling parameters for a domain. A domain's scaling parameters
  /// specify the desired search instance type and replication count. Amazon
  /// CloudSearch will still automatically scale your domain based on the volume
  /// of data and traffic, but not below the desired instance type and
  /// replication count. If the Multi-AZ option is enabled, these values control
  /// the resources used per Availability Zone. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html"
  /// target="_blank">Configuring Scaling Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidTypeException].
  /// May throw [ValidationException].
  Future<UpdateScalingParametersResponse> updateScalingParameters({
    required String domainName,
    required ScalingParameters scalingParameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['ScalingParameters'] = scalingParameters;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateScalingParameters',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateScalingParametersRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateScalingParametersResult',
    );
    return UpdateScalingParametersResponse.fromXml($result);
  }

  /// Configures the access rules that control access to the domain's document
  /// and search endpoints. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html"
  /// target="_blank"> Configuring Access for an Amazon CloudSearch Domain</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidTypeException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessPolicies] :
  /// The access rules you want to configure. These rules replace any existing
  /// rules.
  Future<UpdateServiceAccessPoliciesResponse> updateServiceAccessPolicies({
    required String accessPolicies,
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccessPolicies'] = accessPolicies;
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateServiceAccessPolicies',
      version: '2013-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateServiceAccessPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateServiceAccessPoliciesResult',
    );
    return UpdateServiceAccessPoliciesResponse.fromXml($result);
  }
}

/// The configured access rules for the domain's document and search endpoints,
/// and the current status of those rules.
class AccessPoliciesStatus {
  final String options;
  final OptionStatus status;

  AccessPoliciesStatus({
    required this.options,
    required this.status,
  });
  factory AccessPoliciesStatus.fromXml(_s.XmlElement elem) {
    return AccessPoliciesStatus(
      options: _s.extractXmlStringValue(elem, 'Options')!,
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

enum AlgorithmicStemming {
  none,
  minimal,
  light,
  full,
}

extension AlgorithmicStemmingValueExtension on AlgorithmicStemming {
  String toValue() {
    switch (this) {
      case AlgorithmicStemming.none:
        return 'none';
      case AlgorithmicStemming.minimal:
        return 'minimal';
      case AlgorithmicStemming.light:
        return 'light';
      case AlgorithmicStemming.full:
        return 'full';
    }
  }
}

extension AlgorithmicStemmingFromString on String {
  AlgorithmicStemming toAlgorithmicStemming() {
    switch (this) {
      case 'none':
        return AlgorithmicStemming.none;
      case 'minimal':
        return AlgorithmicStemming.minimal;
      case 'light':
        return AlgorithmicStemming.light;
      case 'full':
        return AlgorithmicStemming.full;
    }
    throw Exception('$this is not known in enum AlgorithmicStemming');
  }
}

/// Synonyms, stopwords, and stemming options for an analysis scheme. Includes
/// tokenization dictionary for Japanese.
class AnalysisOptions {
  /// The level of algorithmic stemming to perform: <code>none</code>,
  /// <code>minimal</code>, <code>light</code>, or <code>full</code>. The
  /// available levels vary depending on the language. For more information, see
  /// <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/text-processing.html#text-processing-settings"
  /// target="_blank">Language Specific Text Processing Settings</a> in the
  /// <i>Amazon CloudSearch Developer Guide</i>
  final AlgorithmicStemming? algorithmicStemming;

  /// A JSON array that contains a collection of terms, tokens, readings and part
  /// of speech for Japanese Tokenizaiton. The Japanese tokenization dictionary
  /// enables you to override the default tokenization for selected terms. This is
  /// only valid for Japanese language fields.
  final String? japaneseTokenizationDictionary;

  /// A JSON object that contains a collection of string:value pairs that each map
  /// a term to its stem. For example, <code>{"term1": "stem1", "term2": "stem2",
  /// "term3": "stem3"}</code>. The stemming dictionary is applied in addition to
  /// any algorithmic stemming. This enables you to override the results of the
  /// algorithmic stemming to correct specific cases of overstemming or
  /// understemming. The maximum size of a stemming dictionary is 500 KB.
  final String? stemmingDictionary;

  /// A JSON array of terms to ignore during indexing and searching. For example,
  /// <code>["a", "an", "the", "of"]</code>. The stopwords dictionary must
  /// explicitly list each word you want to ignore. Wildcards and regular
  /// expressions are not supported.
  final String? stopwords;

  /// A JSON object that defines synonym groups and aliases. A synonym group is an
  /// array of arrays, where each sub-array is a group of terms where each term in
  /// the group is considered a synonym of every other term in the group. The
  /// aliases value is an object that contains a collection of string:value pairs
  /// where the string specifies a term and the array of values specifies each of
  /// the aliases for that term. An alias is considered a synonym of the specified
  /// term, but the term is not considered a synonym of the alias. For more
  /// information about specifying synonyms, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html#synonyms">Synonyms</a>
  /// in the <i>Amazon CloudSearch Developer Guide</i>.
  final String? synonyms;

  AnalysisOptions({
    this.algorithmicStemming,
    this.japaneseTokenizationDictionary,
    this.stemmingDictionary,
    this.stopwords,
    this.synonyms,
  });
  factory AnalysisOptions.fromXml(_s.XmlElement elem) {
    return AnalysisOptions(
      algorithmicStemming: _s
          .extractXmlStringValue(elem, 'AlgorithmicStemming')
          ?.toAlgorithmicStemming(),
      japaneseTokenizationDictionary:
          _s.extractXmlStringValue(elem, 'JapaneseTokenizationDictionary'),
      stemmingDictionary: _s.extractXmlStringValue(elem, 'StemmingDictionary'),
      stopwords: _s.extractXmlStringValue(elem, 'Stopwords'),
      synonyms: _s.extractXmlStringValue(elem, 'Synonyms'),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmicStemming = this.algorithmicStemming;
    final japaneseTokenizationDictionary = this.japaneseTokenizationDictionary;
    final stemmingDictionary = this.stemmingDictionary;
    final stopwords = this.stopwords;
    final synonyms = this.synonyms;
    return {
      if (algorithmicStemming != null)
        'AlgorithmicStemming': algorithmicStemming.toValue(),
      if (japaneseTokenizationDictionary != null)
        'JapaneseTokenizationDictionary': japaneseTokenizationDictionary,
      if (stemmingDictionary != null) 'StemmingDictionary': stemmingDictionary,
      if (stopwords != null) 'Stopwords': stopwords,
      if (synonyms != null) 'Synonyms': synonyms,
    };
  }
}

/// Configuration information for an analysis scheme. Each analysis scheme has a
/// unique name and specifies the language of the text to be processed. The
/// following options can be configured for an analysis scheme:
/// <code>Synonyms</code>, <code>Stopwords</code>,
/// <code>StemmingDictionary</code>, <code>JapaneseTokenizationDictionary</code>
/// and <code>AlgorithmicStemming</code>.
class AnalysisScheme {
  final AnalysisSchemeLanguage analysisSchemeLanguage;
  final String analysisSchemeName;
  final AnalysisOptions? analysisOptions;

  AnalysisScheme({
    required this.analysisSchemeLanguage,
    required this.analysisSchemeName,
    this.analysisOptions,
  });
  factory AnalysisScheme.fromXml(_s.XmlElement elem) {
    return AnalysisScheme(
      analysisSchemeLanguage: _s
          .extractXmlStringValue(elem, 'AnalysisSchemeLanguage')!
          .toAnalysisSchemeLanguage(),
      analysisSchemeName: _s.extractXmlStringValue(elem, 'AnalysisSchemeName')!,
      analysisOptions: _s
          .extractXmlChild(elem, 'AnalysisOptions')
          ?.let(AnalysisOptions.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisSchemeLanguage = this.analysisSchemeLanguage;
    final analysisSchemeName = this.analysisSchemeName;
    final analysisOptions = this.analysisOptions;
    return {
      'AnalysisSchemeLanguage': analysisSchemeLanguage.toValue(),
      'AnalysisSchemeName': analysisSchemeName,
      if (analysisOptions != null) 'AnalysisOptions': analysisOptions,
    };
  }
}

/// An <a href="http://tools.ietf.org/html/rfc4646" target="_blank">IETF RFC
/// 4646</a> language code or <code>mul</code> for multiple languages.
enum AnalysisSchemeLanguage {
  ar,
  bg,
  ca,
  cs,
  da,
  de,
  el,
  en,
  es,
  eu,
  fa,
  fi,
  fr,
  ga,
  gl,
  he,
  hi,
  hu,
  hy,
  id,
  it,
  ja,
  ko,
  lv,
  mul,
  nl,
  no,
  pt,
  ro,
  ru,
  sv,
  th,
  tr,
  zhHans,
  zhHant,
}

extension AnalysisSchemeLanguageValueExtension on AnalysisSchemeLanguage {
  String toValue() {
    switch (this) {
      case AnalysisSchemeLanguage.ar:
        return 'ar';
      case AnalysisSchemeLanguage.bg:
        return 'bg';
      case AnalysisSchemeLanguage.ca:
        return 'ca';
      case AnalysisSchemeLanguage.cs:
        return 'cs';
      case AnalysisSchemeLanguage.da:
        return 'da';
      case AnalysisSchemeLanguage.de:
        return 'de';
      case AnalysisSchemeLanguage.el:
        return 'el';
      case AnalysisSchemeLanguage.en:
        return 'en';
      case AnalysisSchemeLanguage.es:
        return 'es';
      case AnalysisSchemeLanguage.eu:
        return 'eu';
      case AnalysisSchemeLanguage.fa:
        return 'fa';
      case AnalysisSchemeLanguage.fi:
        return 'fi';
      case AnalysisSchemeLanguage.fr:
        return 'fr';
      case AnalysisSchemeLanguage.ga:
        return 'ga';
      case AnalysisSchemeLanguage.gl:
        return 'gl';
      case AnalysisSchemeLanguage.he:
        return 'he';
      case AnalysisSchemeLanguage.hi:
        return 'hi';
      case AnalysisSchemeLanguage.hu:
        return 'hu';
      case AnalysisSchemeLanguage.hy:
        return 'hy';
      case AnalysisSchemeLanguage.id:
        return 'id';
      case AnalysisSchemeLanguage.it:
        return 'it';
      case AnalysisSchemeLanguage.ja:
        return 'ja';
      case AnalysisSchemeLanguage.ko:
        return 'ko';
      case AnalysisSchemeLanguage.lv:
        return 'lv';
      case AnalysisSchemeLanguage.mul:
        return 'mul';
      case AnalysisSchemeLanguage.nl:
        return 'nl';
      case AnalysisSchemeLanguage.no:
        return 'no';
      case AnalysisSchemeLanguage.pt:
        return 'pt';
      case AnalysisSchemeLanguage.ro:
        return 'ro';
      case AnalysisSchemeLanguage.ru:
        return 'ru';
      case AnalysisSchemeLanguage.sv:
        return 'sv';
      case AnalysisSchemeLanguage.th:
        return 'th';
      case AnalysisSchemeLanguage.tr:
        return 'tr';
      case AnalysisSchemeLanguage.zhHans:
        return 'zh-Hans';
      case AnalysisSchemeLanguage.zhHant:
        return 'zh-Hant';
    }
  }
}

extension AnalysisSchemeLanguageFromString on String {
  AnalysisSchemeLanguage toAnalysisSchemeLanguage() {
    switch (this) {
      case 'ar':
        return AnalysisSchemeLanguage.ar;
      case 'bg':
        return AnalysisSchemeLanguage.bg;
      case 'ca':
        return AnalysisSchemeLanguage.ca;
      case 'cs':
        return AnalysisSchemeLanguage.cs;
      case 'da':
        return AnalysisSchemeLanguage.da;
      case 'de':
        return AnalysisSchemeLanguage.de;
      case 'el':
        return AnalysisSchemeLanguage.el;
      case 'en':
        return AnalysisSchemeLanguage.en;
      case 'es':
        return AnalysisSchemeLanguage.es;
      case 'eu':
        return AnalysisSchemeLanguage.eu;
      case 'fa':
        return AnalysisSchemeLanguage.fa;
      case 'fi':
        return AnalysisSchemeLanguage.fi;
      case 'fr':
        return AnalysisSchemeLanguage.fr;
      case 'ga':
        return AnalysisSchemeLanguage.ga;
      case 'gl':
        return AnalysisSchemeLanguage.gl;
      case 'he':
        return AnalysisSchemeLanguage.he;
      case 'hi':
        return AnalysisSchemeLanguage.hi;
      case 'hu':
        return AnalysisSchemeLanguage.hu;
      case 'hy':
        return AnalysisSchemeLanguage.hy;
      case 'id':
        return AnalysisSchemeLanguage.id;
      case 'it':
        return AnalysisSchemeLanguage.it;
      case 'ja':
        return AnalysisSchemeLanguage.ja;
      case 'ko':
        return AnalysisSchemeLanguage.ko;
      case 'lv':
        return AnalysisSchemeLanguage.lv;
      case 'mul':
        return AnalysisSchemeLanguage.mul;
      case 'nl':
        return AnalysisSchemeLanguage.nl;
      case 'no':
        return AnalysisSchemeLanguage.no;
      case 'pt':
        return AnalysisSchemeLanguage.pt;
      case 'ro':
        return AnalysisSchemeLanguage.ro;
      case 'ru':
        return AnalysisSchemeLanguage.ru;
      case 'sv':
        return AnalysisSchemeLanguage.sv;
      case 'th':
        return AnalysisSchemeLanguage.th;
      case 'tr':
        return AnalysisSchemeLanguage.tr;
      case 'zh-Hans':
        return AnalysisSchemeLanguage.zhHans;
      case 'zh-Hant':
        return AnalysisSchemeLanguage.zhHant;
    }
    throw Exception('$this is not known in enum AnalysisSchemeLanguage');
  }
}

/// The status and configuration of an <code>AnalysisScheme</code>.
class AnalysisSchemeStatus {
  final AnalysisScheme options;
  final OptionStatus status;

  AnalysisSchemeStatus({
    required this.options,
    required this.status,
  });
  factory AnalysisSchemeStatus.fromXml(_s.XmlElement elem) {
    return AnalysisSchemeStatus(
      options: AnalysisScheme.fromXml(_s.extractXmlChild(elem, 'Options')!),
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The status and configuration of the domain's availability options.
class AvailabilityOptionsStatus {
  /// The availability options configured for the domain.
  final bool options;
  final OptionStatus status;

  AvailabilityOptionsStatus({
    required this.options,
    required this.status,
  });
  factory AvailabilityOptionsStatus.fromXml(_s.XmlElement elem) {
    return AvailabilityOptionsStatus(
      options: _s.extractXmlBoolValue(elem, 'Options')!,
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The result of a <code>BuildSuggester</code> request. Contains a list of the
/// fields used for suggestions.
class BuildSuggestersResponse {
  final List<String>? fieldNames;

  BuildSuggestersResponse({
    this.fieldNames,
  });
  factory BuildSuggestersResponse.fromXml(_s.XmlElement elem) {
    return BuildSuggestersResponse(
      fieldNames: _s
          .extractXmlChild(elem, 'FieldNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldNames = this.fieldNames;
    return {
      if (fieldNames != null) 'FieldNames': fieldNames,
    };
  }
}

/// The result of a <code>CreateDomainRequest</code>. Contains the status of a
/// newly created domain.
class CreateDomainResponse {
  final DomainStatus? domainStatus;

  CreateDomainResponse({
    this.domainStatus,
  });
  factory CreateDomainResponse.fromXml(_s.XmlElement elem) {
    return CreateDomainResponse(
      domainStatus:
          _s.extractXmlChild(elem, 'DomainStatus')?.let(DomainStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatus = this.domainStatus;
    return {
      if (domainStatus != null) 'DomainStatus': domainStatus,
    };
  }
}

/// Options for a field that contains an array of dates. Present if
/// <code>IndexFieldType</code> specifies the field is of type
/// <code>date-array</code>. All options are enabled by default.
class DateArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// A list of source fields to map to the field.
  final String? sourceFields;

  DateArrayOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sourceFields,
  });
  factory DateArrayOptions.fromXml(_s.XmlElement elem) {
    return DateArrayOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sourceFields: _s.extractXmlStringValue(elem, 'SourceFields'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sourceFields = this.sourceFields;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sourceFields != null) 'SourceFields': sourceFields,
    };
  }
}

/// Options for a date field. Dates and times are specified in UTC (Coordinated
/// Universal Time) according to IETF RFC3339: yyyy-mm-ddT00:00:00Z. Present if
/// <code>IndexFieldType</code> specifies the field is of type
/// <code>date</code>. All options are enabled by default.
class DateOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// Whether the field can be used to sort the search results.
  final bool? sortEnabled;
  final String? sourceField;

  DateOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sortEnabled,
    this.sourceField,
  });
  factory DateOptions.fromXml(_s.XmlElement elem) {
    return DateOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sortEnabled: _s.extractXmlBoolValue(elem, 'SortEnabled'),
      sourceField: _s.extractXmlStringValue(elem, 'SourceField'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sortEnabled = this.sortEnabled;
    final sourceField = this.sourceField;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sortEnabled != null) 'SortEnabled': sortEnabled,
      if (sourceField != null) 'SourceField': sourceField,
    };
  }
}

/// The result of a <code><a>DefineAnalysisScheme</a></code> request. Contains
/// the status of the newly-configured analysis scheme.
class DefineAnalysisSchemeResponse {
  final AnalysisSchemeStatus analysisScheme;

  DefineAnalysisSchemeResponse({
    required this.analysisScheme,
  });
  factory DefineAnalysisSchemeResponse.fromXml(_s.XmlElement elem) {
    return DefineAnalysisSchemeResponse(
      analysisScheme: AnalysisSchemeStatus.fromXml(
          _s.extractXmlChild(elem, 'AnalysisScheme')!),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisScheme = this.analysisScheme;
    return {
      'AnalysisScheme': analysisScheme,
    };
  }
}

/// The result of a <code>DefineExpression</code> request. Contains the status
/// of the newly-configured expression.
class DefineExpressionResponse {
  final ExpressionStatus expression;

  DefineExpressionResponse({
    required this.expression,
  });
  factory DefineExpressionResponse.fromXml(_s.XmlElement elem) {
    return DefineExpressionResponse(
      expression:
          ExpressionStatus.fromXml(_s.extractXmlChild(elem, 'Expression')!),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    return {
      'Expression': expression,
    };
  }
}

/// The result of a <code><a>DefineIndexField</a></code> request. Contains the
/// status of the newly-configured index field.
class DefineIndexFieldResponse {
  final IndexFieldStatus indexField;

  DefineIndexFieldResponse({
    required this.indexField,
  });
  factory DefineIndexFieldResponse.fromXml(_s.XmlElement elem) {
    return DefineIndexFieldResponse(
      indexField:
          IndexFieldStatus.fromXml(_s.extractXmlChild(elem, 'IndexField')!),
    );
  }

  Map<String, dynamic> toJson() {
    final indexField = this.indexField;
    return {
      'IndexField': indexField,
    };
  }
}

/// The result of a <code>DefineSuggester</code> request. Contains the status of
/// the newly-configured suggester.
class DefineSuggesterResponse {
  final SuggesterStatus suggester;

  DefineSuggesterResponse({
    required this.suggester,
  });
  factory DefineSuggesterResponse.fromXml(_s.XmlElement elem) {
    return DefineSuggesterResponse(
      suggester:
          SuggesterStatus.fromXml(_s.extractXmlChild(elem, 'Suggester')!),
    );
  }

  Map<String, dynamic> toJson() {
    final suggester = this.suggester;
    return {
      'Suggester': suggester,
    };
  }
}

/// The result of a <code>DeleteAnalysisScheme</code> request. Contains the
/// status of the deleted analysis scheme.
class DeleteAnalysisSchemeResponse {
  /// The status of the analysis scheme being deleted.
  final AnalysisSchemeStatus analysisScheme;

  DeleteAnalysisSchemeResponse({
    required this.analysisScheme,
  });
  factory DeleteAnalysisSchemeResponse.fromXml(_s.XmlElement elem) {
    return DeleteAnalysisSchemeResponse(
      analysisScheme: AnalysisSchemeStatus.fromXml(
          _s.extractXmlChild(elem, 'AnalysisScheme')!),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisScheme = this.analysisScheme;
    return {
      'AnalysisScheme': analysisScheme,
    };
  }
}

/// The result of a <code>DeleteDomain</code> request. Contains the status of a
/// newly deleted domain, or no status if the domain has already been completely
/// deleted.
class DeleteDomainResponse {
  final DomainStatus? domainStatus;

  DeleteDomainResponse({
    this.domainStatus,
  });
  factory DeleteDomainResponse.fromXml(_s.XmlElement elem) {
    return DeleteDomainResponse(
      domainStatus:
          _s.extractXmlChild(elem, 'DomainStatus')?.let(DomainStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatus = this.domainStatus;
    return {
      if (domainStatus != null) 'DomainStatus': domainStatus,
    };
  }
}

/// The result of a <code><a>DeleteExpression</a></code> request. Specifies the
/// expression being deleted.
class DeleteExpressionResponse {
  /// The status of the expression being deleted.
  final ExpressionStatus expression;

  DeleteExpressionResponse({
    required this.expression,
  });
  factory DeleteExpressionResponse.fromXml(_s.XmlElement elem) {
    return DeleteExpressionResponse(
      expression:
          ExpressionStatus.fromXml(_s.extractXmlChild(elem, 'Expression')!),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    return {
      'Expression': expression,
    };
  }
}

/// The result of a <code><a>DeleteIndexField</a></code> request.
class DeleteIndexFieldResponse {
  /// The status of the index field being deleted.
  final IndexFieldStatus indexField;

  DeleteIndexFieldResponse({
    required this.indexField,
  });
  factory DeleteIndexFieldResponse.fromXml(_s.XmlElement elem) {
    return DeleteIndexFieldResponse(
      indexField:
          IndexFieldStatus.fromXml(_s.extractXmlChild(elem, 'IndexField')!),
    );
  }

  Map<String, dynamic> toJson() {
    final indexField = this.indexField;
    return {
      'IndexField': indexField,
    };
  }
}

/// The result of a <code>DeleteSuggester</code> request. Contains the status of
/// the deleted suggester.
class DeleteSuggesterResponse {
  /// The status of the suggester being deleted.
  final SuggesterStatus suggester;

  DeleteSuggesterResponse({
    required this.suggester,
  });
  factory DeleteSuggesterResponse.fromXml(_s.XmlElement elem) {
    return DeleteSuggesterResponse(
      suggester:
          SuggesterStatus.fromXml(_s.extractXmlChild(elem, 'Suggester')!),
    );
  }

  Map<String, dynamic> toJson() {
    final suggester = this.suggester;
    return {
      'Suggester': suggester,
    };
  }
}

/// The result of a <code>DescribeAnalysisSchemes</code> request. Contains the
/// analysis schemes configured for the domain specified in the request.
class DescribeAnalysisSchemesResponse {
  /// The analysis scheme descriptions.
  final List<AnalysisSchemeStatus> analysisSchemes;

  DescribeAnalysisSchemesResponse({
    required this.analysisSchemes,
  });
  factory DescribeAnalysisSchemesResponse.fromXml(_s.XmlElement elem) {
    return DescribeAnalysisSchemesResponse(
      analysisSchemes: _s
          .extractXmlChild(elem, 'AnalysisSchemes')!
          .findElements('member')
          .map(AnalysisSchemeStatus.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisSchemes = this.analysisSchemes;
    return {
      'AnalysisSchemes': analysisSchemes,
    };
  }
}

/// The result of a <code>DescribeAvailabilityOptions</code> request. Indicates
/// whether or not the Multi-AZ option is enabled for the domain specified in
/// the request.
class DescribeAvailabilityOptionsResponse {
  /// The availability options configured for the domain. Indicates whether
  /// Multi-AZ is enabled for the domain.
  final AvailabilityOptionsStatus? availabilityOptions;

  DescribeAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  factory DescribeAvailabilityOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeAvailabilityOptionsResponse(
      availabilityOptions: _s
          .extractXmlChild(elem, 'AvailabilityOptions')
          ?.let(AvailabilityOptionsStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityOptions = this.availabilityOptions;
    return {
      if (availabilityOptions != null)
        'AvailabilityOptions': availabilityOptions,
    };
  }
}

/// The result of a <code>DescribeDomainEndpointOptions</code> request. Contains
/// the status and configuration of a search domain's endpoint options.
class DescribeDomainEndpointOptionsResponse {
  /// The status and configuration of a search domain's endpoint options.
  final DomainEndpointOptionsStatus? domainEndpointOptions;

  DescribeDomainEndpointOptionsResponse({
    this.domainEndpointOptions,
  });
  factory DescribeDomainEndpointOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeDomainEndpointOptionsResponse(
      domainEndpointOptions: _s
          .extractXmlChild(elem, 'DomainEndpointOptions')
          ?.let(DomainEndpointOptionsStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final domainEndpointOptions = this.domainEndpointOptions;
    return {
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
    };
  }
}

/// The result of a <code>DescribeDomains</code> request. Contains the status of
/// the domains specified in the request or all domains owned by the account.
class DescribeDomainsResponse {
  final List<DomainStatus> domainStatusList;

  DescribeDomainsResponse({
    required this.domainStatusList,
  });
  factory DescribeDomainsResponse.fromXml(_s.XmlElement elem) {
    return DescribeDomainsResponse(
      domainStatusList: _s
          .extractXmlChild(elem, 'DomainStatusList')!
          .findElements('member')
          .map(DomainStatus.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatusList = this.domainStatusList;
    return {
      'DomainStatusList': domainStatusList,
    };
  }
}

/// The result of a <code>DescribeExpressions</code> request. Contains the
/// expressions configured for the domain specified in the request.
class DescribeExpressionsResponse {
  /// The expressions configured for the domain.
  final List<ExpressionStatus> expressions;

  DescribeExpressionsResponse({
    required this.expressions,
  });
  factory DescribeExpressionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeExpressionsResponse(
      expressions: _s
          .extractXmlChild(elem, 'Expressions')!
          .findElements('member')
          .map(ExpressionStatus.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expressions = this.expressions;
    return {
      'Expressions': expressions,
    };
  }
}

/// The result of a <code>DescribeIndexFields</code> request. Contains the index
/// fields configured for the domain specified in the request.
class DescribeIndexFieldsResponse {
  /// The index fields configured for the domain.
  final List<IndexFieldStatus> indexFields;

  DescribeIndexFieldsResponse({
    required this.indexFields,
  });
  factory DescribeIndexFieldsResponse.fromXml(_s.XmlElement elem) {
    return DescribeIndexFieldsResponse(
      indexFields: _s
          .extractXmlChild(elem, 'IndexFields')!
          .findElements('member')
          .map(IndexFieldStatus.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final indexFields = this.indexFields;
    return {
      'IndexFields': indexFields,
    };
  }
}

/// The result of a <code>DescribeScalingParameters</code> request. Contains the
/// scaling parameters configured for the domain specified in the request.
class DescribeScalingParametersResponse {
  final ScalingParametersStatus scalingParameters;

  DescribeScalingParametersResponse({
    required this.scalingParameters,
  });
  factory DescribeScalingParametersResponse.fromXml(_s.XmlElement elem) {
    return DescribeScalingParametersResponse(
      scalingParameters: ScalingParametersStatus.fromXml(
          _s.extractXmlChild(elem, 'ScalingParameters')!),
    );
  }

  Map<String, dynamic> toJson() {
    final scalingParameters = this.scalingParameters;
    return {
      'ScalingParameters': scalingParameters,
    };
  }
}

/// The result of a <code>DescribeServiceAccessPolicies</code> request.
class DescribeServiceAccessPoliciesResponse {
  /// The access rules configured for the domain specified in the request.
  final AccessPoliciesStatus accessPolicies;

  DescribeServiceAccessPoliciesResponse({
    required this.accessPolicies,
  });
  factory DescribeServiceAccessPoliciesResponse.fromXml(_s.XmlElement elem) {
    return DescribeServiceAccessPoliciesResponse(
      accessPolicies: AccessPoliciesStatus.fromXml(
          _s.extractXmlChild(elem, 'AccessPolicies')!),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicies = this.accessPolicies;
    return {
      'AccessPolicies': accessPolicies,
    };
  }
}

/// The result of a <code>DescribeSuggesters</code> request.
class DescribeSuggestersResponse {
  /// The suggesters configured for the domain specified in the request.
  final List<SuggesterStatus> suggesters;

  DescribeSuggestersResponse({
    required this.suggesters,
  });
  factory DescribeSuggestersResponse.fromXml(_s.XmlElement elem) {
    return DescribeSuggestersResponse(
      suggesters: _s
          .extractXmlChild(elem, 'Suggesters')!
          .findElements('member')
          .map(SuggesterStatus.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final suggesters = this.suggesters;
    return {
      'Suggesters': suggesters,
    };
  }
}

/// Options for a search suggester.
class DocumentSuggesterOptions {
  /// The name of the index field you want to use for suggestions.
  final String sourceField;

  /// The level of fuzziness allowed when suggesting matches for a string:
  /// <code>none</code>, <code>low</code>, or <code>high</code>. With none, the
  /// specified string is treated as an exact prefix. With low, suggestions must
  /// differ from the specified string by no more than one character. With high,
  /// suggestions can differ by up to two characters. The default is none.
  final SuggesterFuzzyMatching? fuzzyMatching;

  /// An expression that computes a score for each suggestion to control how they
  /// are sorted. The scores are rounded to the nearest integer, with a floor of 0
  /// and a ceiling of 2^31-1. A document's relevance score is not computed for
  /// suggestions, so sort expressions cannot reference the <code>_score</code>
  /// value. To sort suggestions using a numeric field or existing expression,
  /// simply specify the name of the field or expression. If no expression is
  /// configured for the suggester, the suggestions are sorted with the closest
  /// matches listed first.
  final String? sortExpression;

  DocumentSuggesterOptions({
    required this.sourceField,
    this.fuzzyMatching,
    this.sortExpression,
  });
  factory DocumentSuggesterOptions.fromXml(_s.XmlElement elem) {
    return DocumentSuggesterOptions(
      sourceField: _s.extractXmlStringValue(elem, 'SourceField')!,
      fuzzyMatching: _s
          .extractXmlStringValue(elem, 'FuzzyMatching')
          ?.toSuggesterFuzzyMatching(),
      sortExpression: _s.extractXmlStringValue(elem, 'SortExpression'),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceField = this.sourceField;
    final fuzzyMatching = this.fuzzyMatching;
    final sortExpression = this.sortExpression;
    return {
      'SourceField': sourceField,
      if (fuzzyMatching != null) 'FuzzyMatching': fuzzyMatching.toValue(),
      if (sortExpression != null) 'SortExpression': sortExpression,
    };
  }
}

/// The domain's endpoint options.
class DomainEndpointOptions {
  /// Whether the domain is HTTPS only enabled.
  final bool? enforceHTTPS;

  /// The minimum required TLS version
  final TLSSecurityPolicy? tLSSecurityPolicy;

  DomainEndpointOptions({
    this.enforceHTTPS,
    this.tLSSecurityPolicy,
  });
  factory DomainEndpointOptions.fromXml(_s.XmlElement elem) {
    return DomainEndpointOptions(
      enforceHTTPS: _s.extractXmlBoolValue(elem, 'EnforceHTTPS'),
      tLSSecurityPolicy: _s
          .extractXmlStringValue(elem, 'TLSSecurityPolicy')
          ?.toTLSSecurityPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final enforceHTTPS = this.enforceHTTPS;
    final tLSSecurityPolicy = this.tLSSecurityPolicy;
    return {
      if (enforceHTTPS != null) 'EnforceHTTPS': enforceHTTPS,
      if (tLSSecurityPolicy != null)
        'TLSSecurityPolicy': tLSSecurityPolicy.toValue(),
    };
  }
}

/// The configuration and status of the domain's endpoint options.
class DomainEndpointOptionsStatus {
  /// The domain endpoint options configured for the domain.
  final DomainEndpointOptions options;

  /// The status of the configured domain endpoint options.
  final OptionStatus status;

  DomainEndpointOptionsStatus({
    required this.options,
    required this.status,
  });
  factory DomainEndpointOptionsStatus.fromXml(_s.XmlElement elem) {
    return DomainEndpointOptionsStatus(
      options:
          DomainEndpointOptions.fromXml(_s.extractXmlChild(elem, 'Options')!),
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The current status of the search domain.
class DomainStatus {
  final String domainId;
  final String domainName;

  /// True if <a>IndexDocuments</a> needs to be called to activate the current
  /// domain configuration.
  final bool requiresIndexDocuments;
  final String? arn;

  /// True if the search domain is created. It can take several minutes to
  /// initialize a domain when <a>CreateDomain</a> is called. Newly created search
  /// domains are returned from <a>DescribeDomains</a> with a false value for
  /// Created until domain creation is complete.
  final bool? created;

  /// True if the search domain has been deleted. The system must clean up
  /// resources dedicated to the search domain when <a>DeleteDomain</a> is called.
  /// Newly deleted search domains are returned from <a>DescribeDomains</a> with a
  /// true value for IsDeleted for several minutes until resource cleanup is
  /// complete.
  final bool? deleted;

  /// The service endpoint for updating documents in a search domain.
  final ServiceEndpoint? docService;
  final Limits? limits;

  /// True if processing is being done to activate the current domain
  /// configuration.
  final bool? processing;

  /// The number of search instances that are available to process search
  /// requests.
  final int? searchInstanceCount;

  /// The instance type that is being used to process search requests.
  final String? searchInstanceType;

  /// The number of partitions across which the search index is spread.
  final int? searchPartitionCount;

  /// The service endpoint for requesting search results from a search domain.
  final ServiceEndpoint? searchService;

  DomainStatus({
    required this.domainId,
    required this.domainName,
    required this.requiresIndexDocuments,
    this.arn,
    this.created,
    this.deleted,
    this.docService,
    this.limits,
    this.processing,
    this.searchInstanceCount,
    this.searchInstanceType,
    this.searchPartitionCount,
    this.searchService,
  });
  factory DomainStatus.fromXml(_s.XmlElement elem) {
    return DomainStatus(
      domainId: _s.extractXmlStringValue(elem, 'DomainId')!,
      domainName: _s.extractXmlStringValue(elem, 'DomainName')!,
      requiresIndexDocuments:
          _s.extractXmlBoolValue(elem, 'RequiresIndexDocuments')!,
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      created: _s.extractXmlBoolValue(elem, 'Created'),
      deleted: _s.extractXmlBoolValue(elem, 'Deleted'),
      docService:
          _s.extractXmlChild(elem, 'DocService')?.let(ServiceEndpoint.fromXml),
      limits: _s.extractXmlChild(elem, 'Limits')?.let(Limits.fromXml),
      processing: _s.extractXmlBoolValue(elem, 'Processing'),
      searchInstanceCount: _s.extractXmlIntValue(elem, 'SearchInstanceCount'),
      searchInstanceType: _s.extractXmlStringValue(elem, 'SearchInstanceType'),
      searchPartitionCount: _s.extractXmlIntValue(elem, 'SearchPartitionCount'),
      searchService: _s
          .extractXmlChild(elem, 'SearchService')
          ?.let(ServiceEndpoint.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final domainName = this.domainName;
    final requiresIndexDocuments = this.requiresIndexDocuments;
    final arn = this.arn;
    final created = this.created;
    final deleted = this.deleted;
    final docService = this.docService;
    final limits = this.limits;
    final processing = this.processing;
    final searchInstanceCount = this.searchInstanceCount;
    final searchInstanceType = this.searchInstanceType;
    final searchPartitionCount = this.searchPartitionCount;
    final searchService = this.searchService;
    return {
      'DomainId': domainId,
      'DomainName': domainName,
      'RequiresIndexDocuments': requiresIndexDocuments,
      if (arn != null) 'ARN': arn,
      if (created != null) 'Created': created,
      if (deleted != null) 'Deleted': deleted,
      if (docService != null) 'DocService': docService,
      if (limits != null) 'Limits': limits,
      if (processing != null) 'Processing': processing,
      if (searchInstanceCount != null)
        'SearchInstanceCount': searchInstanceCount,
      if (searchInstanceType != null) 'SearchInstanceType': searchInstanceType,
      if (searchPartitionCount != null)
        'SearchPartitionCount': searchPartitionCount,
      if (searchService != null) 'SearchService': searchService,
    };
  }
}

/// Options for a field that contains an array of double-precision 64-bit
/// floating point values. Present if <code>IndexFieldType</code> specifies the
/// field is of type <code>double-array</code>. All options are enabled by
/// default.
class DoubleArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final double? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// A list of source fields to map to the field.
  final String? sourceFields;

  DoubleArrayOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sourceFields,
  });
  factory DoubleArrayOptions.fromXml(_s.XmlElement elem) {
    return DoubleArrayOptions(
      defaultValue: _s.extractXmlDoubleValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sourceFields: _s.extractXmlStringValue(elem, 'SourceFields'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sourceFields = this.sourceFields;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sourceFields != null) 'SourceFields': sourceFields,
    };
  }
}

/// Options for a double-precision 64-bit floating point field. Present if
/// <code>IndexFieldType</code> specifies the field is of type
/// <code>double</code>. All options are enabled by default.
class DoubleOptions {
  /// A value to use for the field if the field isn't specified for a document.
  /// This can be important if you are using the field in an expression and that
  /// field is not present in every document.
  final double? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// Whether the field can be used to sort the search results.
  final bool? sortEnabled;

  /// The name of the source field to map to the field.
  final String? sourceField;

  DoubleOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sortEnabled,
    this.sourceField,
  });
  factory DoubleOptions.fromXml(_s.XmlElement elem) {
    return DoubleOptions(
      defaultValue: _s.extractXmlDoubleValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sortEnabled: _s.extractXmlBoolValue(elem, 'SortEnabled'),
      sourceField: _s.extractXmlStringValue(elem, 'SourceField'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sortEnabled = this.sortEnabled;
    final sourceField = this.sourceField;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sortEnabled != null) 'SortEnabled': sortEnabled,
      if (sourceField != null) 'SourceField': sourceField,
    };
  }
}

/// A named expression that can be evaluated at search time. Can be used to sort
/// the search results, define other expressions, or return computed information
/// in the search results.
class Expression {
  final String expressionName;
  final String expressionValue;

  Expression({
    required this.expressionName,
    required this.expressionValue,
  });
  factory Expression.fromXml(_s.XmlElement elem) {
    return Expression(
      expressionName: _s.extractXmlStringValue(elem, 'ExpressionName')!,
      expressionValue: _s.extractXmlStringValue(elem, 'ExpressionValue')!,
    );
  }

  Map<String, dynamic> toJson() {
    final expressionName = this.expressionName;
    final expressionValue = this.expressionValue;
    return {
      'ExpressionName': expressionName,
      'ExpressionValue': expressionValue,
    };
  }
}

/// The value of an <code>Expression</code> and its current status.
class ExpressionStatus {
  /// The expression that is evaluated for sorting while processing a search
  /// request.
  final Expression options;
  final OptionStatus status;

  ExpressionStatus({
    required this.options,
    required this.status,
  });
  factory ExpressionStatus.fromXml(_s.XmlElement elem) {
    return ExpressionStatus(
      options: Expression.fromXml(_s.extractXmlChild(elem, 'Options')!),
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The result of an <code>IndexDocuments</code> request. Contains the status of
/// the indexing operation, including the fields being indexed.
class IndexDocumentsResponse {
  /// The names of the fields that are currently being indexed.
  final List<String>? fieldNames;

  IndexDocumentsResponse({
    this.fieldNames,
  });
  factory IndexDocumentsResponse.fromXml(_s.XmlElement elem) {
    return IndexDocumentsResponse(
      fieldNames: _s
          .extractXmlChild(elem, 'FieldNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldNames = this.fieldNames;
    return {
      if (fieldNames != null) 'FieldNames': fieldNames,
    };
  }
}

/// Configuration information for a field in the index, including its name,
/// type, and options. The supported options depend on the
/// <code><a>IndexFieldType</a></code>.
class IndexField {
  /// A string that represents the name of an index field. CloudSearch supports
  /// regular index fields as well as dynamic fields. A dynamic field's name
  /// defines a pattern that begins or ends with a wildcard. Any document fields
  /// that don't map to a regular index field but do match a dynamic field's
  /// pattern are configured with the dynamic field's indexing options.
  ///
  /// Regular field names begin with a letter and can contain the following
  /// characters: a-z (lowercase), 0-9, and _ (underscore). Dynamic field names
  /// must begin or end with a wildcard (*). The wildcard can also be the only
  /// character in a dynamic field name. Multiple wildcards, and wildcards
  /// embedded within a string are not supported.
  ///
  /// The name <code>score</code> is reserved and cannot be used as a field name.
  /// To reference a document's ID, you can use the name <code>_id</code>.
  final String indexFieldName;
  final IndexFieldType indexFieldType;
  final DateArrayOptions? dateArrayOptions;
  final DateOptions? dateOptions;
  final DoubleArrayOptions? doubleArrayOptions;
  final DoubleOptions? doubleOptions;
  final IntArrayOptions? intArrayOptions;
  final IntOptions? intOptions;
  final LatLonOptions? latLonOptions;
  final LiteralArrayOptions? literalArrayOptions;
  final LiteralOptions? literalOptions;
  final TextArrayOptions? textArrayOptions;
  final TextOptions? textOptions;

  IndexField({
    required this.indexFieldName,
    required this.indexFieldType,
    this.dateArrayOptions,
    this.dateOptions,
    this.doubleArrayOptions,
    this.doubleOptions,
    this.intArrayOptions,
    this.intOptions,
    this.latLonOptions,
    this.literalArrayOptions,
    this.literalOptions,
    this.textArrayOptions,
    this.textOptions,
  });
  factory IndexField.fromXml(_s.XmlElement elem) {
    return IndexField(
      indexFieldName: _s.extractXmlStringValue(elem, 'IndexFieldName')!,
      indexFieldType:
          _s.extractXmlStringValue(elem, 'IndexFieldType')!.toIndexFieldType(),
      dateArrayOptions: _s
          .extractXmlChild(elem, 'DateArrayOptions')
          ?.let(DateArrayOptions.fromXml),
      dateOptions:
          _s.extractXmlChild(elem, 'DateOptions')?.let(DateOptions.fromXml),
      doubleArrayOptions: _s
          .extractXmlChild(elem, 'DoubleArrayOptions')
          ?.let(DoubleArrayOptions.fromXml),
      doubleOptions:
          _s.extractXmlChild(elem, 'DoubleOptions')?.let(DoubleOptions.fromXml),
      intArrayOptions: _s
          .extractXmlChild(elem, 'IntArrayOptions')
          ?.let(IntArrayOptions.fromXml),
      intOptions:
          _s.extractXmlChild(elem, 'IntOptions')?.let(IntOptions.fromXml),
      latLonOptions:
          _s.extractXmlChild(elem, 'LatLonOptions')?.let(LatLonOptions.fromXml),
      literalArrayOptions: _s
          .extractXmlChild(elem, 'LiteralArrayOptions')
          ?.let(LiteralArrayOptions.fromXml),
      literalOptions: _s
          .extractXmlChild(elem, 'LiteralOptions')
          ?.let(LiteralOptions.fromXml),
      textArrayOptions: _s
          .extractXmlChild(elem, 'TextArrayOptions')
          ?.let(TextArrayOptions.fromXml),
      textOptions:
          _s.extractXmlChild(elem, 'TextOptions')?.let(TextOptions.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final indexFieldName = this.indexFieldName;
    final indexFieldType = this.indexFieldType;
    final dateArrayOptions = this.dateArrayOptions;
    final dateOptions = this.dateOptions;
    final doubleArrayOptions = this.doubleArrayOptions;
    final doubleOptions = this.doubleOptions;
    final intArrayOptions = this.intArrayOptions;
    final intOptions = this.intOptions;
    final latLonOptions = this.latLonOptions;
    final literalArrayOptions = this.literalArrayOptions;
    final literalOptions = this.literalOptions;
    final textArrayOptions = this.textArrayOptions;
    final textOptions = this.textOptions;
    return {
      'IndexFieldName': indexFieldName,
      'IndexFieldType': indexFieldType.toValue(),
      if (dateArrayOptions != null) 'DateArrayOptions': dateArrayOptions,
      if (dateOptions != null) 'DateOptions': dateOptions,
      if (doubleArrayOptions != null) 'DoubleArrayOptions': doubleArrayOptions,
      if (doubleOptions != null) 'DoubleOptions': doubleOptions,
      if (intArrayOptions != null) 'IntArrayOptions': intArrayOptions,
      if (intOptions != null) 'IntOptions': intOptions,
      if (latLonOptions != null) 'LatLonOptions': latLonOptions,
      if (literalArrayOptions != null)
        'LiteralArrayOptions': literalArrayOptions,
      if (literalOptions != null) 'LiteralOptions': literalOptions,
      if (textArrayOptions != null) 'TextArrayOptions': textArrayOptions,
      if (textOptions != null) 'TextOptions': textOptions,
    };
  }
}

/// The value of an <code>IndexField</code> and its current status.
class IndexFieldStatus {
  final IndexField options;
  final OptionStatus status;

  IndexFieldStatus({
    required this.options,
    required this.status,
  });
  factory IndexFieldStatus.fromXml(_s.XmlElement elem) {
    return IndexFieldStatus(
      options: IndexField.fromXml(_s.extractXmlChild(elem, 'Options')!),
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The type of field. The valid options for a field depend on the field type.
/// For more information about the supported field types, see <a
/// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html"
/// target="_blank">Configuring Index Fields</a> in the <i>Amazon CloudSearch
/// Developer Guide</i>.
enum IndexFieldType {
  int,
  double,
  literal,
  text,
  date,
  latlon,
  intArray,
  doubleArray,
  literalArray,
  textArray,
  dateArray,
}

extension IndexFieldTypeValueExtension on IndexFieldType {
  String toValue() {
    switch (this) {
      case IndexFieldType.int:
        return 'int';
      case IndexFieldType.double:
        return 'double';
      case IndexFieldType.literal:
        return 'literal';
      case IndexFieldType.text:
        return 'text';
      case IndexFieldType.date:
        return 'date';
      case IndexFieldType.latlon:
        return 'latlon';
      case IndexFieldType.intArray:
        return 'int-array';
      case IndexFieldType.doubleArray:
        return 'double-array';
      case IndexFieldType.literalArray:
        return 'literal-array';
      case IndexFieldType.textArray:
        return 'text-array';
      case IndexFieldType.dateArray:
        return 'date-array';
    }
  }
}

extension IndexFieldTypeFromString on String {
  IndexFieldType toIndexFieldType() {
    switch (this) {
      case 'int':
        return IndexFieldType.int;
      case 'double':
        return IndexFieldType.double;
      case 'literal':
        return IndexFieldType.literal;
      case 'text':
        return IndexFieldType.text;
      case 'date':
        return IndexFieldType.date;
      case 'latlon':
        return IndexFieldType.latlon;
      case 'int-array':
        return IndexFieldType.intArray;
      case 'double-array':
        return IndexFieldType.doubleArray;
      case 'literal-array':
        return IndexFieldType.literalArray;
      case 'text-array':
        return IndexFieldType.textArray;
      case 'date-array':
        return IndexFieldType.dateArray;
    }
    throw Exception('$this is not known in enum IndexFieldType');
  }
}

/// Options for a field that contains an array of 64-bit signed integers.
/// Present if <code>IndexFieldType</code> specifies the field is of type
/// <code>int-array</code>. All options are enabled by default.
class IntArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final int? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// A list of source fields to map to the field.
  final String? sourceFields;

  IntArrayOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sourceFields,
  });
  factory IntArrayOptions.fromXml(_s.XmlElement elem) {
    return IntArrayOptions(
      defaultValue: _s.extractXmlIntValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sourceFields: _s.extractXmlStringValue(elem, 'SourceFields'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sourceFields = this.sourceFields;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sourceFields != null) 'SourceFields': sourceFields,
    };
  }
}

/// Options for a 64-bit signed integer field. Present if
/// <code>IndexFieldType</code> specifies the field is of type <code>int</code>.
/// All options are enabled by default.
class IntOptions {
  /// A value to use for the field if the field isn't specified for a document.
  /// This can be important if you are using the field in an expression and that
  /// field is not present in every document.
  final int? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// Whether the field can be used to sort the search results.
  final bool? sortEnabled;

  /// The name of the source field to map to the field.
  final String? sourceField;

  IntOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sortEnabled,
    this.sourceField,
  });
  factory IntOptions.fromXml(_s.XmlElement elem) {
    return IntOptions(
      defaultValue: _s.extractXmlIntValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sortEnabled: _s.extractXmlBoolValue(elem, 'SortEnabled'),
      sourceField: _s.extractXmlStringValue(elem, 'SourceField'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sortEnabled = this.sortEnabled;
    final sourceField = this.sourceField;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sortEnabled != null) 'SortEnabled': sortEnabled,
      if (sourceField != null) 'SourceField': sourceField,
    };
  }
}

/// Options for a latlon field. A latlon field contains a location stored as a
/// latitude and longitude value pair. Present if <code>IndexFieldType</code>
/// specifies the field is of type <code>latlon</code>. All options are enabled
/// by default.
class LatLonOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// Whether the field can be used to sort the search results.
  final bool? sortEnabled;
  final String? sourceField;

  LatLonOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sortEnabled,
    this.sourceField,
  });
  factory LatLonOptions.fromXml(_s.XmlElement elem) {
    return LatLonOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sortEnabled: _s.extractXmlBoolValue(elem, 'SortEnabled'),
      sourceField: _s.extractXmlStringValue(elem, 'SourceField'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sortEnabled = this.sortEnabled;
    final sourceField = this.sourceField;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sortEnabled != null) 'SortEnabled': sortEnabled,
      if (sourceField != null) 'SourceField': sourceField,
    };
  }
}

class Limits {
  final int maximumPartitionCount;
  final int maximumReplicationCount;

  Limits({
    required this.maximumPartitionCount,
    required this.maximumReplicationCount,
  });
  factory Limits.fromXml(_s.XmlElement elem) {
    return Limits(
      maximumPartitionCount:
          _s.extractXmlIntValue(elem, 'MaximumPartitionCount')!,
      maximumReplicationCount:
          _s.extractXmlIntValue(elem, 'MaximumReplicationCount')!,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumPartitionCount = this.maximumPartitionCount;
    final maximumReplicationCount = this.maximumReplicationCount;
    return {
      'MaximumPartitionCount': maximumPartitionCount,
      'MaximumReplicationCount': maximumReplicationCount,
    };
  }
}

/// The result of a <code>ListDomainNames</code> request. Contains a list of the
/// domains owned by an account.
class ListDomainNamesResponse {
  /// The names of the search domains owned by an account.
  final Map<String, String>? domainNames;

  ListDomainNamesResponse({
    this.domainNames,
  });
  factory ListDomainNamesResponse.fromXml(_s.XmlElement elem) {
    return ListDomainNamesResponse(
      domainNames: Map.fromEntries(
        elem.getElement('DomainNames')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final domainNames = this.domainNames;
    return {
      if (domainNames != null) 'DomainNames': domainNames,
    };
  }
}

/// Options for a field that contains an array of literal strings. Present if
/// <code>IndexFieldType</code> specifies the field is of type
/// <code>literal-array</code>. All options are enabled by default.
class LiteralArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// A list of source fields to map to the field.
  final String? sourceFields;

  LiteralArrayOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sourceFields,
  });
  factory LiteralArrayOptions.fromXml(_s.XmlElement elem) {
    return LiteralArrayOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sourceFields: _s.extractXmlStringValue(elem, 'SourceFields'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sourceFields = this.sourceFields;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sourceFields != null) 'SourceFields': sourceFields,
    };
  }
}

/// Options for literal field. Present if <code>IndexFieldType</code> specifies
/// the field is of type <code>literal</code>. All options are enabled by
/// default.
class LiteralOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String? defaultValue;

  /// Whether facet information can be returned for the field.
  final bool? facetEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the contents of the field are searchable.
  final bool? searchEnabled;

  /// Whether the field can be used to sort the search results.
  final bool? sortEnabled;
  final String? sourceField;

  LiteralOptions({
    this.defaultValue,
    this.facetEnabled,
    this.returnEnabled,
    this.searchEnabled,
    this.sortEnabled,
    this.sourceField,
  });
  factory LiteralOptions.fromXml(_s.XmlElement elem) {
    return LiteralOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
      sortEnabled: _s.extractXmlBoolValue(elem, 'SortEnabled'),
      sourceField: _s.extractXmlStringValue(elem, 'SourceField'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final returnEnabled = this.returnEnabled;
    final searchEnabled = this.searchEnabled;
    final sortEnabled = this.sortEnabled;
    final sourceField = this.sourceField;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
      if (sortEnabled != null) 'SortEnabled': sortEnabled,
      if (sourceField != null) 'SourceField': sourceField,
    };
  }
}

/// The state of processing a change to an option. One of:
///
/// <ul>
/// <li>RequiresIndexDocuments: The option's latest value will not be deployed
/// until <a>IndexDocuments</a> has been called and indexing is complete.</li>
/// <li>Processing: The option's latest value is in the process of being
/// activated.</li>
/// <li>Active: The option's latest value is fully deployed. </li>
/// <li>FailedToValidate: The option value is not compatible with the domain's
/// data and cannot be used to index the data. You must either modify the option
/// value or update or remove the incompatible documents.</li>
/// </ul>
enum OptionState {
  requiresIndexDocuments,
  processing,
  active,
  failedToValidate,
}

extension OptionStateValueExtension on OptionState {
  String toValue() {
    switch (this) {
      case OptionState.requiresIndexDocuments:
        return 'RequiresIndexDocuments';
      case OptionState.processing:
        return 'Processing';
      case OptionState.active:
        return 'Active';
      case OptionState.failedToValidate:
        return 'FailedToValidate';
    }
  }
}

extension OptionStateFromString on String {
  OptionState toOptionState() {
    switch (this) {
      case 'RequiresIndexDocuments':
        return OptionState.requiresIndexDocuments;
      case 'Processing':
        return OptionState.processing;
      case 'Active':
        return OptionState.active;
      case 'FailedToValidate':
        return OptionState.failedToValidate;
    }
    throw Exception('$this is not known in enum OptionState');
  }
}

/// The status of domain configuration option.
class OptionStatus {
  /// A timestamp for when this option was created.
  final DateTime creationDate;

  /// The state of processing a change to an option. Possible values:
  ///
  /// <ul>
  /// <li><code>RequiresIndexDocuments</code>: the option's latest value will not
  /// be deployed until <a>IndexDocuments</a> has been called and indexing is
  /// complete.</li>
  /// <li><code>Processing</code>: the option's latest value is in the process of
  /// being activated. </li>
  /// <li><code>Active</code>: the option's latest value is completely
  /// deployed.</li>
  /// <li><code>FailedToValidate</code>: the option value is not compatible with
  /// the domain's data and cannot be used to index the data. You must either
  /// modify the option value or update or remove the incompatible documents.</li>
  /// </ul>
  final OptionState state;

  /// A timestamp for when this option was last updated.
  final DateTime updateDate;

  /// Indicates that the option will be deleted once processing is complete.
  final bool? pendingDeletion;

  /// A unique integer that indicates when this option was last updated.
  final int? updateVersion;

  OptionStatus({
    required this.creationDate,
    required this.state,
    required this.updateDate,
    this.pendingDeletion,
    this.updateVersion,
  });
  factory OptionStatus.fromXml(_s.XmlElement elem) {
    return OptionStatus(
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate')!,
      state: _s.extractXmlStringValue(elem, 'State')!.toOptionState(),
      updateDate: _s.extractXmlDateTimeValue(elem, 'UpdateDate')!,
      pendingDeletion: _s.extractXmlBoolValue(elem, 'PendingDeletion'),
      updateVersion: _s.extractXmlIntValue(elem, 'UpdateVersion'),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final state = this.state;
    final updateDate = this.updateDate;
    final pendingDeletion = this.pendingDeletion;
    final updateVersion = this.updateVersion;
    return {
      'CreationDate': iso8601ToJson(creationDate),
      'State': state.toValue(),
      'UpdateDate': iso8601ToJson(updateDate),
      if (pendingDeletion != null) 'PendingDeletion': pendingDeletion,
      if (updateVersion != null) 'UpdateVersion': updateVersion,
    };
  }
}

/// The instance type (such as <code>search.m1.small</code>) on which an index
/// partition is hosted.
enum PartitionInstanceType {
  searchM1Small,
  searchM1Large,
  searchM2Xlarge,
  searchM2_2xlarge,
  searchM3Medium,
  searchM3Large,
  searchM3Xlarge,
  searchM3_2xlarge,
  searchSmall,
  searchMedium,
  searchLarge,
  searchXlarge,
  search_2xlarge,
  searchPreviousgenerationSmall,
  searchPreviousgenerationLarge,
  searchPreviousgenerationXlarge,
  searchPreviousgeneration_2xlarge,
}

extension PartitionInstanceTypeValueExtension on PartitionInstanceType {
  String toValue() {
    switch (this) {
      case PartitionInstanceType.searchM1Small:
        return 'search.m1.small';
      case PartitionInstanceType.searchM1Large:
        return 'search.m1.large';
      case PartitionInstanceType.searchM2Xlarge:
        return 'search.m2.xlarge';
      case PartitionInstanceType.searchM2_2xlarge:
        return 'search.m2.2xlarge';
      case PartitionInstanceType.searchM3Medium:
        return 'search.m3.medium';
      case PartitionInstanceType.searchM3Large:
        return 'search.m3.large';
      case PartitionInstanceType.searchM3Xlarge:
        return 'search.m3.xlarge';
      case PartitionInstanceType.searchM3_2xlarge:
        return 'search.m3.2xlarge';
      case PartitionInstanceType.searchSmall:
        return 'search.small';
      case PartitionInstanceType.searchMedium:
        return 'search.medium';
      case PartitionInstanceType.searchLarge:
        return 'search.large';
      case PartitionInstanceType.searchXlarge:
        return 'search.xlarge';
      case PartitionInstanceType.search_2xlarge:
        return 'search.2xlarge';
      case PartitionInstanceType.searchPreviousgenerationSmall:
        return 'search.previousgeneration.small';
      case PartitionInstanceType.searchPreviousgenerationLarge:
        return 'search.previousgeneration.large';
      case PartitionInstanceType.searchPreviousgenerationXlarge:
        return 'search.previousgeneration.xlarge';
      case PartitionInstanceType.searchPreviousgeneration_2xlarge:
        return 'search.previousgeneration.2xlarge';
    }
  }
}

extension PartitionInstanceTypeFromString on String {
  PartitionInstanceType toPartitionInstanceType() {
    switch (this) {
      case 'search.m1.small':
        return PartitionInstanceType.searchM1Small;
      case 'search.m1.large':
        return PartitionInstanceType.searchM1Large;
      case 'search.m2.xlarge':
        return PartitionInstanceType.searchM2Xlarge;
      case 'search.m2.2xlarge':
        return PartitionInstanceType.searchM2_2xlarge;
      case 'search.m3.medium':
        return PartitionInstanceType.searchM3Medium;
      case 'search.m3.large':
        return PartitionInstanceType.searchM3Large;
      case 'search.m3.xlarge':
        return PartitionInstanceType.searchM3Xlarge;
      case 'search.m3.2xlarge':
        return PartitionInstanceType.searchM3_2xlarge;
      case 'search.small':
        return PartitionInstanceType.searchSmall;
      case 'search.medium':
        return PartitionInstanceType.searchMedium;
      case 'search.large':
        return PartitionInstanceType.searchLarge;
      case 'search.xlarge':
        return PartitionInstanceType.searchXlarge;
      case 'search.2xlarge':
        return PartitionInstanceType.search_2xlarge;
      case 'search.previousgeneration.small':
        return PartitionInstanceType.searchPreviousgenerationSmall;
      case 'search.previousgeneration.large':
        return PartitionInstanceType.searchPreviousgenerationLarge;
      case 'search.previousgeneration.xlarge':
        return PartitionInstanceType.searchPreviousgenerationXlarge;
      case 'search.previousgeneration.2xlarge':
        return PartitionInstanceType.searchPreviousgeneration_2xlarge;
    }
    throw Exception('$this is not known in enum PartitionInstanceType');
  }
}

/// The desired instance type and desired number of replicas of each index
/// partition.
class ScalingParameters {
  /// The instance type that you want to preconfigure for your domain. For
  /// example, <code>search.m1.small</code>.
  final PartitionInstanceType? desiredInstanceType;

  /// The number of partitions you want to preconfigure for your domain. Only
  /// valid when you select <code>m2.2xlarge</code> as the desired instance type.
  final int? desiredPartitionCount;

  /// The number of replicas you want to preconfigure for each index partition.
  final int? desiredReplicationCount;

  ScalingParameters({
    this.desiredInstanceType,
    this.desiredPartitionCount,
    this.desiredReplicationCount,
  });
  factory ScalingParameters.fromXml(_s.XmlElement elem) {
    return ScalingParameters(
      desiredInstanceType: _s
          .extractXmlStringValue(elem, 'DesiredInstanceType')
          ?.toPartitionInstanceType(),
      desiredPartitionCount:
          _s.extractXmlIntValue(elem, 'DesiredPartitionCount'),
      desiredReplicationCount:
          _s.extractXmlIntValue(elem, 'DesiredReplicationCount'),
    );
  }

  Map<String, dynamic> toJson() {
    final desiredInstanceType = this.desiredInstanceType;
    final desiredPartitionCount = this.desiredPartitionCount;
    final desiredReplicationCount = this.desiredReplicationCount;
    return {
      if (desiredInstanceType != null)
        'DesiredInstanceType': desiredInstanceType.toValue(),
      if (desiredPartitionCount != null)
        'DesiredPartitionCount': desiredPartitionCount,
      if (desiredReplicationCount != null)
        'DesiredReplicationCount': desiredReplicationCount,
    };
  }
}

/// The status and configuration of a search domain's scaling parameters.
class ScalingParametersStatus {
  final ScalingParameters options;
  final OptionStatus status;

  ScalingParametersStatus({
    required this.options,
    required this.status,
  });
  factory ScalingParametersStatus.fromXml(_s.XmlElement elem) {
    return ScalingParametersStatus(
      options: ScalingParameters.fromXml(_s.extractXmlChild(elem, 'Options')!),
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The endpoint to which service requests can be submitted.
class ServiceEndpoint {
  final String? endpoint;

  ServiceEndpoint({
    this.endpoint,
  });
  factory ServiceEndpoint.fromXml(_s.XmlElement elem) {
    return ServiceEndpoint(
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

/// Configuration information for a search suggester. Each suggester has a
/// unique name and specifies the text field you want to use for suggestions.
/// The following options can be configured for a suggester:
/// <code>FuzzyMatching</code>, <code>SortExpression</code>.
class Suggester {
  final DocumentSuggesterOptions documentSuggesterOptions;
  final String suggesterName;

  Suggester({
    required this.documentSuggesterOptions,
    required this.suggesterName,
  });
  factory Suggester.fromXml(_s.XmlElement elem) {
    return Suggester(
      documentSuggesterOptions: DocumentSuggesterOptions.fromXml(
          _s.extractXmlChild(elem, 'DocumentSuggesterOptions')!),
      suggesterName: _s.extractXmlStringValue(elem, 'SuggesterName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final documentSuggesterOptions = this.documentSuggesterOptions;
    final suggesterName = this.suggesterName;
    return {
      'DocumentSuggesterOptions': documentSuggesterOptions,
      'SuggesterName': suggesterName,
    };
  }
}

enum SuggesterFuzzyMatching {
  none,
  low,
  high,
}

extension SuggesterFuzzyMatchingValueExtension on SuggesterFuzzyMatching {
  String toValue() {
    switch (this) {
      case SuggesterFuzzyMatching.none:
        return 'none';
      case SuggesterFuzzyMatching.low:
        return 'low';
      case SuggesterFuzzyMatching.high:
        return 'high';
    }
  }
}

extension SuggesterFuzzyMatchingFromString on String {
  SuggesterFuzzyMatching toSuggesterFuzzyMatching() {
    switch (this) {
      case 'none':
        return SuggesterFuzzyMatching.none;
      case 'low':
        return SuggesterFuzzyMatching.low;
      case 'high':
        return SuggesterFuzzyMatching.high;
    }
    throw Exception('$this is not known in enum SuggesterFuzzyMatching');
  }
}

/// The value of a <code>Suggester</code> and its current status.
class SuggesterStatus {
  final Suggester options;
  final OptionStatus status;

  SuggesterStatus({
    required this.options,
    required this.status,
  });
  factory SuggesterStatus.fromXml(_s.XmlElement elem) {
    return SuggesterStatus(
      options: Suggester.fromXml(_s.extractXmlChild(elem, 'Options')!),
      status: OptionStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The minimum required TLS version.
enum TLSSecurityPolicy {
  policyMinTls_1_0_2019_07,
  policyMinTls_1_2_2019_07,
}

extension TLSSecurityPolicyValueExtension on TLSSecurityPolicy {
  String toValue() {
    switch (this) {
      case TLSSecurityPolicy.policyMinTls_1_0_2019_07:
        return 'Policy-Min-TLS-1-0-2019-07';
      case TLSSecurityPolicy.policyMinTls_1_2_2019_07:
        return 'Policy-Min-TLS-1-2-2019-07';
    }
  }
}

extension TLSSecurityPolicyFromString on String {
  TLSSecurityPolicy toTLSSecurityPolicy() {
    switch (this) {
      case 'Policy-Min-TLS-1-0-2019-07':
        return TLSSecurityPolicy.policyMinTls_1_0_2019_07;
      case 'Policy-Min-TLS-1-2-2019-07':
        return TLSSecurityPolicy.policyMinTls_1_2_2019_07;
    }
    throw Exception('$this is not known in enum TLSSecurityPolicy');
  }
}

/// Options for a field that contains an array of text strings. Present if
/// <code>IndexFieldType</code> specifies the field is of type
/// <code>text-array</code>. A <code>text-array</code> field is always
/// searchable. All options are enabled by default.
class TextArrayOptions {
  /// The name of an analysis scheme for a <code>text-array</code> field.
  final String? analysisScheme;

  /// A value to use for the field if the field isn't specified for a document.
  final String? defaultValue;

  /// Whether highlights can be returned for the field.
  final bool? highlightEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// A list of source fields to map to the field.
  final String? sourceFields;

  TextArrayOptions({
    this.analysisScheme,
    this.defaultValue,
    this.highlightEnabled,
    this.returnEnabled,
    this.sourceFields,
  });
  factory TextArrayOptions.fromXml(_s.XmlElement elem) {
    return TextArrayOptions(
      analysisScheme: _s.extractXmlStringValue(elem, 'AnalysisScheme'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      highlightEnabled: _s.extractXmlBoolValue(elem, 'HighlightEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      sourceFields: _s.extractXmlStringValue(elem, 'SourceFields'),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisScheme = this.analysisScheme;
    final defaultValue = this.defaultValue;
    final highlightEnabled = this.highlightEnabled;
    final returnEnabled = this.returnEnabled;
    final sourceFields = this.sourceFields;
    return {
      if (analysisScheme != null) 'AnalysisScheme': analysisScheme,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (highlightEnabled != null) 'HighlightEnabled': highlightEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (sourceFields != null) 'SourceFields': sourceFields,
    };
  }
}

/// Options for text field. Present if <code>IndexFieldType</code> specifies the
/// field is of type <code>text</code>. A <code>text</code> field is always
/// searchable. All options are enabled by default.
class TextOptions {
  /// The name of an analysis scheme for a <code>text</code> field.
  final String? analysisScheme;

  /// A value to use for the field if the field isn't specified for a document.
  final String? defaultValue;

  /// Whether highlights can be returned for the field.
  final bool? highlightEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool? returnEnabled;

  /// Whether the field can be used to sort the search results.
  final bool? sortEnabled;
  final String? sourceField;

  TextOptions({
    this.analysisScheme,
    this.defaultValue,
    this.highlightEnabled,
    this.returnEnabled,
    this.sortEnabled,
    this.sourceField,
  });
  factory TextOptions.fromXml(_s.XmlElement elem) {
    return TextOptions(
      analysisScheme: _s.extractXmlStringValue(elem, 'AnalysisScheme'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      highlightEnabled: _s.extractXmlBoolValue(elem, 'HighlightEnabled'),
      returnEnabled: _s.extractXmlBoolValue(elem, 'ReturnEnabled'),
      sortEnabled: _s.extractXmlBoolValue(elem, 'SortEnabled'),
      sourceField: _s.extractXmlStringValue(elem, 'SourceField'),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisScheme = this.analysisScheme;
    final defaultValue = this.defaultValue;
    final highlightEnabled = this.highlightEnabled;
    final returnEnabled = this.returnEnabled;
    final sortEnabled = this.sortEnabled;
    final sourceField = this.sourceField;
    return {
      if (analysisScheme != null) 'AnalysisScheme': analysisScheme,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (highlightEnabled != null) 'HighlightEnabled': highlightEnabled,
      if (returnEnabled != null) 'ReturnEnabled': returnEnabled,
      if (sortEnabled != null) 'SortEnabled': sortEnabled,
      if (sourceField != null) 'SourceField': sourceField,
    };
  }
}

/// The result of a <code>UpdateAvailabilityOptions</code> request. Contains the
/// status of the domain's availability options.
class UpdateAvailabilityOptionsResponse {
  /// The newly-configured availability options. Indicates whether Multi-AZ is
  /// enabled for the domain.
  final AvailabilityOptionsStatus? availabilityOptions;

  UpdateAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  factory UpdateAvailabilityOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateAvailabilityOptionsResponse(
      availabilityOptions: _s
          .extractXmlChild(elem, 'AvailabilityOptions')
          ?.let(AvailabilityOptionsStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityOptions = this.availabilityOptions;
    return {
      if (availabilityOptions != null)
        'AvailabilityOptions': availabilityOptions,
    };
  }
}

/// The result of a <code>UpdateDomainEndpointOptions</code> request. Contains
/// the configuration and status of the domain's endpoint options.
class UpdateDomainEndpointOptionsResponse {
  /// The newly-configured domain endpoint options.
  final DomainEndpointOptionsStatus? domainEndpointOptions;

  UpdateDomainEndpointOptionsResponse({
    this.domainEndpointOptions,
  });
  factory UpdateDomainEndpointOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateDomainEndpointOptionsResponse(
      domainEndpointOptions: _s
          .extractXmlChild(elem, 'DomainEndpointOptions')
          ?.let(DomainEndpointOptionsStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final domainEndpointOptions = this.domainEndpointOptions;
    return {
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
    };
  }
}

/// The result of a <code>UpdateScalingParameters</code> request. Contains the
/// status of the newly-configured scaling parameters.
class UpdateScalingParametersResponse {
  final ScalingParametersStatus scalingParameters;

  UpdateScalingParametersResponse({
    required this.scalingParameters,
  });
  factory UpdateScalingParametersResponse.fromXml(_s.XmlElement elem) {
    return UpdateScalingParametersResponse(
      scalingParameters: ScalingParametersStatus.fromXml(
          _s.extractXmlChild(elem, 'ScalingParameters')!),
    );
  }

  Map<String, dynamic> toJson() {
    final scalingParameters = this.scalingParameters;
    return {
      'ScalingParameters': scalingParameters,
    };
  }
}

/// The result of an <code>UpdateServiceAccessPolicies</code> request. Contains
/// the new access policies.
class UpdateServiceAccessPoliciesResponse {
  /// The access rules configured for the domain.
  final AccessPoliciesStatus accessPolicies;

  UpdateServiceAccessPoliciesResponse({
    required this.accessPolicies,
  });
  factory UpdateServiceAccessPoliciesResponse.fromXml(_s.XmlElement elem) {
    return UpdateServiceAccessPoliciesResponse(
      accessPolicies: AccessPoliciesStatus.fromXml(
          _s.extractXmlChild(elem, 'AccessPolicies')!),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicies = this.accessPolicies;
    return {
      'AccessPolicies': accessPolicies,
    };
  }
}

class BaseException extends _s.GenericAwsException {
  BaseException({String? type, String? message})
      : super(type: type, code: 'BaseException', message: message);
}

class DisabledOperationException extends _s.GenericAwsException {
  DisabledOperationException({String? type, String? message})
      : super(type: type, code: 'DisabledOperationException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidTypeException extends _s.GenericAwsException {
  InvalidTypeException({String? type, String? message})
      : super(type: type, code: 'InvalidTypeException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BaseException': (type, message) =>
      BaseException(type: type, message: message),
  'DisabledOperationException': (type, message) =>
      DisabledOperationException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidTypeException': (type, message) =>
      InvalidTypeException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
