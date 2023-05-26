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

import 'v2011_02_01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// You use the configuration service to create, configure, and manage search
/// domains. Configuration service requests are submitted using the AWS Query
/// protocol. AWS Query requests are HTTP or HTTPS requests submitted via HTTP
/// GET or POST with a query parameter named Action.
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

  /// Creates a new search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  Future<CreateDomainResponse> createDomain({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'CreateDomain',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDomainRequest'],
      shapes: shapes,
      resultWrapper: 'CreateDomainResult',
    );
    return CreateDomainResponse.fromXml($result);
  }

  /// Configures an <code>IndexField</code> for the search domain. Used to
  /// create new fields and modify existing ones. If the field exists, the new
  /// configuration replaces the old one. You can configure a maximum of 200
  /// index fields.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
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
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DefineIndexFieldRequest'],
      shapes: shapes,
      resultWrapper: 'DefineIndexFieldResult',
    );
    return DefineIndexFieldResponse.fromXml($result);
  }

  /// Configures a <code>RankExpression</code> for the search domain. Used to
  /// create new rank expressions and modify existing ones. If the expression
  /// exists, the new configuration replaces the old one. You can configure a
  /// maximum of 50 rank expressions.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  Future<DefineRankExpressionResponse> defineRankExpression({
    required String domainName,
    required NamedRankExpression rankExpression,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['RankExpression'] = rankExpression;
    final $result = await _protocol.send(
      $request,
      action: 'DefineRankExpression',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DefineRankExpressionRequest'],
      shapes: shapes,
      resultWrapper: 'DefineRankExpressionResult',
    );
    return DefineRankExpressionResponse.fromXml($result);
  }

  /// Permanently deletes a search domain and all of its data.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  Future<DeleteDomainResponse> deleteDomain({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDomain',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDomainRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteDomainResult',
    );
    return DeleteDomainResponse.fromXml($result);
  }

  /// Removes an <code>IndexField</code> from the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
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
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteIndexFieldRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteIndexFieldResult',
    );
    return DeleteIndexFieldResponse.fromXml($result);
  }

  /// Removes a <code>RankExpression</code> from the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rankName] :
  /// The name of the <code>RankExpression</code> to delete.
  Future<DeleteRankExpressionResponse> deleteRankExpression({
    required String domainName,
    required String rankName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['RankName'] = rankName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteRankExpression',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteRankExpressionRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteRankExpressionResult',
    );
    return DeleteRankExpressionResponse.fromXml($result);
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
  Future<DescribeAvailabilityOptionsResponse> describeAvailabilityOptions({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAvailabilityOptions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAvailabilityOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeAvailabilityOptionsResult',
    );
    return DescribeAvailabilityOptionsResponse.fromXml($result);
  }

  /// Gets the default search field configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeDefaultSearchFieldResponse> describeDefaultSearchField({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDefaultSearchField',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDefaultSearchFieldRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeDefaultSearchFieldResult',
    );
    return DescribeDefaultSearchFieldResponse.fromXml($result);
  }

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainNames] :
  /// Limits the DescribeDomains response to the specified search domains.
  Future<DescribeDomainsResponse> describeDomains({
    List<String>? domainNames,
  }) async {
    final $request = <String, dynamic>{};
    domainNames?.also((arg) => $request['DomainNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDomains',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDomainsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeDomainsResult',
    );
    return DescribeDomainsResponse.fromXml($result);
  }

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. Shows all fields by default.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [fieldNames] :
  /// Limits the <code>DescribeIndexFields</code> response to the specified
  /// fields.
  Future<DescribeIndexFieldsResponse> describeIndexFields({
    required String domainName,
    List<String>? fieldNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    fieldNames?.also((arg) => $request['FieldNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeIndexFields',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeIndexFieldsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeIndexFieldsResult',
    );
    return DescribeIndexFieldsResponse.fromXml($result);
  }

  /// Gets the rank expressions configured for the search domain. Can be limited
  /// to specific rank expressions by name. Shows all rank expressions by
  /// default.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rankNames] :
  /// Limits the <code>DescribeRankExpressions</code> response to the specified
  /// fields.
  Future<DescribeRankExpressionsResponse> describeRankExpressions({
    required String domainName,
    List<String>? rankNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    rankNames?.also((arg) => $request['RankNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeRankExpressions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeRankExpressionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeRankExpressionsResult',
    );
    return DescribeRankExpressionsResponse.fromXml($result);
  }

  /// Gets information about the resource-based policies that control access to
  /// the domain's document and search services.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeServiceAccessPoliciesResponse> describeServiceAccessPolicies({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeServiceAccessPolicies',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeServiceAccessPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeServiceAccessPoliciesResult',
    );
    return DescribeServiceAccessPoliciesResponse.fromXml($result);
  }

  /// Gets the stemming dictionary configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeStemmingOptionsResponse> describeStemmingOptions({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStemmingOptions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStemmingOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeStemmingOptionsResult',
    );
    return DescribeStemmingOptionsResponse.fromXml($result);
  }

  /// Gets the stopwords configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeStopwordOptionsResponse> describeStopwordOptions({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStopwordOptions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeStopwordOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeStopwordOptionsResult',
    );
    return DescribeStopwordOptionsResponse.fromXml($result);
  }

  /// Gets the synonym dictionary configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeSynonymOptionsResponse> describeSynonymOptions({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSynonymOptions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSynonymOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeSynonymOptionsResult',
    );
    return DescribeSynonymOptionsResponse.fromXml($result);
  }

  /// Tells the search domain to start indexing its documents using the latest
  /// text processing options and <code>IndexFields</code>. This operation must
  /// be invoked to make options whose <a>OptionStatus</a> has
  /// <code>OptionState</code> of <code>RequiresIndexDocuments</code> visible in
  /// search results.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<IndexDocumentsResponse> indexDocuments({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'IndexDocuments',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['IndexDocumentsRequest'],
      shapes: shapes,
      resultWrapper: 'IndexDocumentsResult',
    );
    return IndexDocumentsResponse.fromXml($result);
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
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateAvailabilityOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateAvailabilityOptionsResult',
    );
    return UpdateAvailabilityOptionsResponse.fromXml($result);
  }

  /// Configures the default search field for the search domain. The default
  /// search field is the text field that is searched when a search request does
  /// not specify which fields to search. By default, it is configured to
  /// include the contents of all of the domain's text fields.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [defaultSearchField] :
  /// The text field to search if the search request does not specify which
  /// field to search. The default search field is used when search terms are
  /// specified with the <code>q</code> parameter, or if a match expression
  /// specified with the <code>bq</code> parameter does not constrain the search
  /// to a particular field. The default is an empty string, which automatically
  /// searches all text fields.
  Future<UpdateDefaultSearchFieldResponse> updateDefaultSearchField({
    required String defaultSearchField,
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DefaultSearchField'] = defaultSearchField;
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateDefaultSearchField',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateDefaultSearchFieldRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateDefaultSearchFieldResult',
    );
    return UpdateDefaultSearchFieldResponse.fromXml($result);
  }

  /// Configures the policies that control access to the domain's document and
  /// search services. The maximum size of an access policy document is 100 KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidTypeException].
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
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateServiceAccessPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateServiceAccessPoliciesResult',
    );
    return UpdateServiceAccessPoliciesResponse.fromXml($result);
  }

  /// Configures a stemming dictionary for the search domain. The stemming
  /// dictionary is used during indexing and when processing search requests.
  /// The maximum size of the stemming dictionary is 500 KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<UpdateStemmingOptionsResponse> updateStemmingOptions({
    required String domainName,
    required String stems,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['Stems'] = stems;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateStemmingOptions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateStemmingOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateStemmingOptionsResult',
    );
    return UpdateStemmingOptionsResponse.fromXml($result);
  }

  /// Configures stopwords for the search domain. Stopwords are used during
  /// indexing and when processing search requests. The maximum size of the
  /// stopwords dictionary is 10 KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<UpdateStopwordOptionsResponse> updateStopwordOptions({
    required String domainName,
    required String stopwords,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['Stopwords'] = stopwords;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateStopwordOptions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateStopwordOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateStopwordOptionsResult',
    );
    return UpdateStopwordOptionsResponse.fromXml($result);
  }

  /// Configures a synonym dictionary for the search domain. The synonym
  /// dictionary is used during indexing to configure mappings for terms that
  /// occur in text fields. The maximum size of the synonym dictionary is 100
  /// KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<UpdateSynonymOptionsResponse> updateSynonymOptions({
    required String domainName,
    required String synonyms,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['Synonyms'] = synonyms;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateSynonymOptions',
      version: '2011-02-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateSynonymOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateSynonymOptionsResult',
    );
    return UpdateSynonymOptionsResponse.fromXml($result);
  }
}

/// A <code>PolicyDocument</code> that specifies access policies for the search
/// domain's services, and the current status of those policies.
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

/// An error occurred while processing the request.
class BaseException implements _s.AwsException {
  final String? code;
  final String? message;

  BaseException({
    this.code,
    this.message,
  });
  factory BaseException.fromXml(_s.XmlElement elem) {
    return BaseException(
      code: _s.extractXmlStringValue(elem, 'Code'),
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
    };
  }
}

/// A response message that contains the status of a newly created domain.
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

/// The value of the <code>DefaultSearchField</code> configured for this search
/// domain and its current status.
class DefaultSearchFieldStatus {
  /// The name of the <code>IndexField</code> to use as the default search field.
  /// The default is an empty string, which automatically searches all text
  /// fields.
  final String options;
  final OptionStatus status;

  DefaultSearchFieldStatus({
    required this.options,
    required this.status,
  });
  factory DefaultSearchFieldStatus.fromXml(_s.XmlElement elem) {
    return DefaultSearchFieldStatus(
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

/// A response message that contains the status of an updated index field.
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

/// A response message that contains the status of an updated
/// <code>RankExpression</code>.
class DefineRankExpressionResponse {
  final RankExpressionStatus rankExpression;

  DefineRankExpressionResponse({
    required this.rankExpression,
  });
  factory DefineRankExpressionResponse.fromXml(_s.XmlElement elem) {
    return DefineRankExpressionResponse(
      rankExpression: RankExpressionStatus.fromXml(
          _s.extractXmlChild(elem, 'RankExpression')!),
    );
  }

  Map<String, dynamic> toJson() {
    final rankExpression = this.rankExpression;
    return {
      'RankExpression': rankExpression,
    };
  }
}

/// A response message that contains the status of a newly deleted domain, or no
/// status if the domain has already been completely deleted.
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

/// A response message that contains the status of a deleted index field.
class DeleteIndexFieldResponse {
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

/// A response message that contains the status of a deleted
/// <code>RankExpression</code>.
class DeleteRankExpressionResponse {
  final RankExpressionStatus rankExpression;

  DeleteRankExpressionResponse({
    required this.rankExpression,
  });
  factory DeleteRankExpressionResponse.fromXml(_s.XmlElement elem) {
    return DeleteRankExpressionResponse(
      rankExpression: RankExpressionStatus.fromXml(
          _s.extractXmlChild(elem, 'RankExpression')!),
    );
  }

  Map<String, dynamic> toJson() {
    final rankExpression = this.rankExpression;
    return {
      'RankExpression': rankExpression,
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

/// A response message that contains the default search field for a search
/// domain.
class DescribeDefaultSearchFieldResponse {
  /// The name of the <code>IndexField</code> to use for search requests issued
  /// with the <code>q</code> parameter. The default is the empty string, which
  /// automatically searches all text fields.
  final DefaultSearchFieldStatus defaultSearchField;

  DescribeDefaultSearchFieldResponse({
    required this.defaultSearchField,
  });
  factory DescribeDefaultSearchFieldResponse.fromXml(_s.XmlElement elem) {
    return DescribeDefaultSearchFieldResponse(
      defaultSearchField: DefaultSearchFieldStatus.fromXml(
          _s.extractXmlChild(elem, 'DefaultSearchField')!),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultSearchField = this.defaultSearchField;
    return {
      'DefaultSearchField': defaultSearchField,
    };
  }
}

/// A response message that contains the status of one or more domains.
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

/// A response message that contains the index fields for a search domain.
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

/// A response message that contains the rank expressions for a search domain.
class DescribeRankExpressionsResponse {
  /// The rank expressions configured for the domain.
  final List<RankExpressionStatus> rankExpressions;

  DescribeRankExpressionsResponse({
    required this.rankExpressions,
  });
  factory DescribeRankExpressionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeRankExpressionsResponse(
      rankExpressions: _s
          .extractXmlChild(elem, 'RankExpressions')!
          .findElements('member')
          .map(RankExpressionStatus.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rankExpressions = this.rankExpressions;
    return {
      'RankExpressions': rankExpressions,
    };
  }
}

/// A response message that contains the access policies for a domain.
class DescribeServiceAccessPoliciesResponse {
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

/// A response message that contains the stemming options for a search domain.
class DescribeStemmingOptionsResponse {
  final StemmingOptionsStatus stems;

  DescribeStemmingOptionsResponse({
    required this.stems,
  });
  factory DescribeStemmingOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeStemmingOptionsResponse(
      stems: StemmingOptionsStatus.fromXml(_s.extractXmlChild(elem, 'Stems')!),
    );
  }

  Map<String, dynamic> toJson() {
    final stems = this.stems;
    return {
      'Stems': stems,
    };
  }
}

/// A response message that contains the stopword options for a search domain.
class DescribeStopwordOptionsResponse {
  final StopwordOptionsStatus stopwords;

  DescribeStopwordOptionsResponse({
    required this.stopwords,
  });
  factory DescribeStopwordOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeStopwordOptionsResponse(
      stopwords:
          StopwordOptionsStatus.fromXml(_s.extractXmlChild(elem, 'Stopwords')!),
    );
  }

  Map<String, dynamic> toJson() {
    final stopwords = this.stopwords;
    return {
      'Stopwords': stopwords,
    };
  }
}

/// A response message that contains the synonym options for a search domain.
class DescribeSynonymOptionsResponse {
  final SynonymOptionsStatus synonyms;

  DescribeSynonymOptionsResponse({
    required this.synonyms,
  });
  factory DescribeSynonymOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeSynonymOptionsResponse(
      synonyms:
          SynonymOptionsStatus.fromXml(_s.extractXmlChild(elem, 'Synonyms')!),
    );
  }

  Map<String, dynamic> toJson() {
    final synonyms = this.synonyms;
    return {
      'Synonyms': synonyms,
    };
  }
}

/// The request was rejected because it attempted an operation which is not
/// enabled.
class DisabledOperationException implements _s.AwsException {
  DisabledOperationException();
  factory DisabledOperationException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DisabledOperationException();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The current status of the search domain.
class DomainStatus {
  final String domainId;
  final String domainName;

  /// True if <a>IndexDocuments</a> needs to be called to activate the current
  /// domain configuration.
  final bool requiresIndexDocuments;

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

  /// The number of documents that have been submitted to the domain and indexed.
  final int? numSearchableDocs;

  /// True if processing is being done to activate the current domain
  /// configuration.
  final bool? processing;

  /// The number of search instances that are available to process search
  /// requests.
  final int? searchInstanceCount;

  /// The instance type (such as search.m1.small) that is being used to process
  /// search requests.
  final String? searchInstanceType;

  /// The number of partitions across which the search index is spread.
  final int? searchPartitionCount;

  /// The service endpoint for requesting search results from a search domain.
  final ServiceEndpoint? searchService;

  DomainStatus({
    required this.domainId,
    required this.domainName,
    required this.requiresIndexDocuments,
    this.created,
    this.deleted,
    this.docService,
    this.numSearchableDocs,
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
      created: _s.extractXmlBoolValue(elem, 'Created'),
      deleted: _s.extractXmlBoolValue(elem, 'Deleted'),
      docService:
          _s.extractXmlChild(elem, 'DocService')?.let(ServiceEndpoint.fromXml),
      numSearchableDocs: _s.extractXmlIntValue(elem, 'NumSearchableDocs'),
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
    final created = this.created;
    final deleted = this.deleted;
    final docService = this.docService;
    final numSearchableDocs = this.numSearchableDocs;
    final processing = this.processing;
    final searchInstanceCount = this.searchInstanceCount;
    final searchInstanceType = this.searchInstanceType;
    final searchPartitionCount = this.searchPartitionCount;
    final searchService = this.searchService;
    return {
      'DomainId': domainId,
      'DomainName': domainName,
      'RequiresIndexDocuments': requiresIndexDocuments,
      if (created != null) 'Created': created,
      if (deleted != null) 'Deleted': deleted,
      if (docService != null) 'DocService': docService,
      if (numSearchableDocs != null) 'NumSearchableDocs': numSearchableDocs,
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

/// The result of an <code>IndexDocuments</code> action.
class IndexDocumentsResponse {
  /// The names of the fields that are currently being processed due to an
  /// <code>IndexDocuments</code> action.
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

/// Defines a field in the index, including its name, type, and the source of
/// its data. The <code>IndexFieldType</code> indicates which of the options
/// will be present. It is invalid to specify options for a type other than the
/// <code>IndexFieldType</code>.
class IndexField {
  /// The name of a field in the search index. Field names must begin with a
  /// letter and can contain the following characters: a-z (lowercase), 0-9, and _
  /// (underscore). Uppercase letters and hyphens are not allowed. The names
  /// "body", "docid", and "text_relevance" are reserved and cannot be specified
  /// as field or rank expression names.
  final String indexFieldName;

  /// The type of field. Based on this type, exactly one of the
  /// <a>UIntOptions</a>, <a>LiteralOptions</a> or <a>TextOptions</a> must be
  /// present.
  final IndexFieldType indexFieldType;

  /// Options for literal field. Present if <code>IndexFieldType</code> specifies
  /// the field is of type literal.
  final LiteralOptions? literalOptions;

  /// An optional list of source attributes that provide data for this index
  /// field. If not specified, the data is pulled from a source attribute with the
  /// same name as this <code>IndexField</code>. When one or more source
  /// attributes are specified, an optional data transformation can be applied to
  /// the source data when populating the index field. You can configure a maximum
  /// of 20 sources for an <code>IndexField</code>.
  final List<SourceAttribute>? sourceAttributes;

  /// Options for text field. Present if <code>IndexFieldType</code> specifies the
  /// field is of type text.
  final TextOptions? textOptions;

  /// Options for an unsigned integer field. Present if
  /// <code>IndexFieldType</code> specifies the field is of type unsigned integer.
  final UIntOptions? uIntOptions;

  IndexField({
    required this.indexFieldName,
    required this.indexFieldType,
    this.literalOptions,
    this.sourceAttributes,
    this.textOptions,
    this.uIntOptions,
  });
  factory IndexField.fromXml(_s.XmlElement elem) {
    return IndexField(
      indexFieldName: _s.extractXmlStringValue(elem, 'IndexFieldName')!,
      indexFieldType:
          _s.extractXmlStringValue(elem, 'IndexFieldType')!.toIndexFieldType(),
      literalOptions: _s
          .extractXmlChild(elem, 'LiteralOptions')
          ?.let(LiteralOptions.fromXml),
      sourceAttributes: _s.extractXmlChild(elem, 'SourceAttributes')?.let(
          (elem) => elem
              .findElements('member')
              .map(SourceAttribute.fromXml)
              .toList()),
      textOptions:
          _s.extractXmlChild(elem, 'TextOptions')?.let(TextOptions.fromXml),
      uIntOptions:
          _s.extractXmlChild(elem, 'UIntOptions')?.let(UIntOptions.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final indexFieldName = this.indexFieldName;
    final indexFieldType = this.indexFieldType;
    final literalOptions = this.literalOptions;
    final sourceAttributes = this.sourceAttributes;
    final textOptions = this.textOptions;
    final uIntOptions = this.uIntOptions;
    return {
      'IndexFieldName': indexFieldName,
      'IndexFieldType': indexFieldType.toValue(),
      if (literalOptions != null) 'LiteralOptions': literalOptions,
      if (sourceAttributes != null) 'SourceAttributes': sourceAttributes,
      if (textOptions != null) 'TextOptions': textOptions,
      if (uIntOptions != null) 'UIntOptions': uIntOptions,
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

/// The type of <code>IndexField</code>.
enum IndexFieldType {
  uint,
  literal,
  text,
}

extension IndexFieldTypeValueExtension on IndexFieldType {
  String toValue() {
    switch (this) {
      case IndexFieldType.uint:
        return 'uint';
      case IndexFieldType.literal:
        return 'literal';
      case IndexFieldType.text:
        return 'text';
    }
  }
}

extension IndexFieldTypeFromString on String {
  IndexFieldType toIndexFieldType() {
    switch (this) {
      case 'uint':
        return IndexFieldType.uint;
      case 'literal':
        return IndexFieldType.literal;
      case 'text':
        return IndexFieldType.text;
    }
    throw Exception('$this is not known in enum IndexFieldType');
  }
}

/// An internal error occurred while processing the request. If this problem
/// persists, report an issue from the <a
/// href="http://status.aws.amazon.com/">Service Health Dashboard</a>.
class InternalException implements _s.AwsException {
  InternalException();
  factory InternalException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return InternalException();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The request was rejected because it specified an invalid type definition.
class InvalidTypeException implements _s.AwsException {
  InvalidTypeException();
  factory InvalidTypeException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return InvalidTypeException();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The request was rejected because a resource limit has already been met.
class LimitExceededException implements _s.AwsException {
  LimitExceededException();
  factory LimitExceededException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return LimitExceededException();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Options that define a literal field in the search index.
class LiteralOptions {
  /// The default value for a literal field. Optional.
  final String? defaultValue;

  /// Specifies whether facets are enabled for this field. Default: False.
  final bool? facetEnabled;

  /// Specifies whether values of this field can be returned in search results and
  /// used for ranking. Default: False.
  final bool? resultEnabled;

  /// Specifies whether search is enabled for this field. Default: False.
  final bool? searchEnabled;

  LiteralOptions({
    this.defaultValue,
    this.facetEnabled,
    this.resultEnabled,
    this.searchEnabled,
  });
  factory LiteralOptions.fromXml(_s.XmlElement elem) {
    return LiteralOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      resultEnabled: _s.extractXmlBoolValue(elem, 'ResultEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final resultEnabled = this.resultEnabled;
    final searchEnabled = this.searchEnabled;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (resultEnabled != null) 'ResultEnabled': resultEnabled,
      if (searchEnabled != null) 'SearchEnabled': searchEnabled,
    };
  }
}

/// A named expression that can be evaluated at search time and used for ranking
/// or thresholding in a search query.
class NamedRankExpression {
  /// The expression to evaluate for ranking or thresholding while processing a
  /// search request. The <code>RankExpression</code> syntax is based on
  /// JavaScript expressions and supports:
  ///
  /// <ul>
  /// <li>Integer, floating point, hex and octal literals</li>
  /// <li>Shortcut evaluation of logical operators such that an expression <code>a
  /// || b</code> evaluates to the value <code>a</code>, if <code>a</code> is
  /// true, without evaluating <code>b</code> at all</li>
  /// <li>JavaScript order of precedence for operators</li>
  /// <li>Arithmetic operators: <code>+ - * / %</code> </li>
  /// <li>Boolean operators (including the ternary operator)</li>
  /// <li>Bitwise operators</li>
  /// <li>Comparison operators</li>
  /// <li>Common mathematic functions: <code>abs ceil erf exp floor lgamma ln log2
  /// log10 max min sqrt pow</code> </li>
  /// <li>Trigonometric library functions: <code>acosh acos asinh asin atanh atan
  /// cosh cos sinh sin tanh tan</code> </li>
  /// <li>Random generation of a number between 0 and 1: <code>rand</code> </li>
  /// <li>Current time in epoch: <code>time</code> </li>
  /// <li>The <code>min max</code> functions that operate on a variable argument
  /// list</li>
  /// </ul>
  /// Intermediate results are calculated as double precision floating point
  /// values. The final return value of a <code>RankExpression</code> is
  /// automatically converted from floating point to a 32-bit unsigned integer by
  /// rounding to the nearest integer, with a natural floor of 0 and a ceiling of
  /// max(uint32_t), 4294967295. Mathematical errors such as dividing by 0 will
  /// fail during evaluation and return a value of 0.
  ///
  /// The source data for a <code>RankExpression</code> can be the name of an
  /// <code>IndexField</code> of type uint, another <code>RankExpression</code> or
  /// the reserved name <i>text_relevance</i>. The text_relevance source is
  /// defined to return an integer from 0 to 1000 (inclusive) to indicate how
  /// relevant a document is to the search request, taking into account repetition
  /// of search terms in the document and proximity of search terms to each other
  /// in each matching <code>IndexField</code> in the document.
  ///
  /// For more information about using rank expressions to customize ranking, see
  /// the Amazon CloudSearch Developer Guide.
  final String rankExpression;

  /// The name of a rank expression. Rank expression names must begin with a
  /// letter and can contain the following characters: a-z (lowercase), 0-9, and _
  /// (underscore). Uppercase letters and hyphens are not allowed. The names
  /// "body", "docid", and "text_relevance" are reserved and cannot be specified
  /// as field or rank expression names.
  final String rankName;

  NamedRankExpression({
    required this.rankExpression,
    required this.rankName,
  });
  factory NamedRankExpression.fromXml(_s.XmlElement elem) {
    return NamedRankExpression(
      rankExpression: _s.extractXmlStringValue(elem, 'RankExpression')!,
      rankName: _s.extractXmlStringValue(elem, 'RankName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final rankExpression = this.rankExpression;
    final rankName = this.rankName;
    return {
      'RankExpression': rankExpression,
      'RankName': rankName,
    };
  }
}

/// The state of processing a change to an option.
enum OptionState {
  requiresIndexDocuments,
  processing,
  active,
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
    }
    throw Exception('$this is not known in enum OptionState');
  }
}

/// The status of an option, including when it was last updated and whether it
/// is actively in use for searches.
class OptionStatus {
  /// A timestamp for when this option was created.
  final DateTime creationDate;

  /// The state of processing a change to an option. Possible values:
  ///
  /// <ul>
  /// <li> <code>RequiresIndexDocuments</code>: the option's latest value will not
  /// be visible in searches until <a>IndexDocuments</a> has been called and
  /// indexing is complete.</li>
  /// <li> <code>Processing</code>: the option's latest value is not yet visible
  /// in all searches but is in the process of being activated. </li>
  /// <li> <code>Active</code>: the option's latest value is completely visible.
  /// Any warnings or messages generated during processing are provided in
  /// <code>Diagnostics</code>.</li>
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

/// The value of a <code>RankExpression</code> and its current status.
class RankExpressionStatus {
  /// The expression that is evaluated for ranking or thresholding while
  /// processing a search request.
  final NamedRankExpression options;
  final OptionStatus status;

  RankExpressionStatus({
    required this.options,
    required this.status,
  });
  factory RankExpressionStatus.fromXml(_s.XmlElement elem) {
    return RankExpressionStatus(
      options:
          NamedRankExpression.fromXml(_s.extractXmlChild(elem, 'Options')!),
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

/// The request was rejected because it attempted to reference a resource that
/// does not exist.
class ResourceNotFoundException implements _s.AwsException {
  ResourceNotFoundException();
  factory ResourceNotFoundException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ResourceNotFoundException();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The endpoint to which service requests can be submitted, including the
/// actual URL prefix for sending requests and the Amazon Resource Name (ARN) so
/// the endpoint can be referenced in other API calls such as
/// <a>UpdateServiceAccessPolicies</a>.
class ServiceEndpoint {
  final String? arn;
  final String? endpoint;

  ServiceEndpoint({
    this.arn,
    this.endpoint,
  });
  factory ServiceEndpoint.fromXml(_s.XmlElement elem) {
    return ServiceEndpoint(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final endpoint = this.endpoint;
    return {
      if (arn != null) 'Arn': arn,
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

/// Identifies the source data for an index field. An optional data
/// transformation can be applied to the source data when populating the index
/// field. By default, the value of the source attribute is copied to the index
/// field.
class SourceAttribute {
  /// Identifies the transformation to apply when copying data from a source
  /// attribute.
  final SourceDataFunction sourceDataFunction;

  /// Copies data from a source document attribute to an <code>IndexField</code>.
  final SourceData? sourceDataCopy;

  /// Maps source document attribute values to new values when populating the
  /// <code>IndexField</code>.
  final SourceDataMap? sourceDataMap;

  /// Trims common title words from a source document attribute when populating an
  /// <code>IndexField</code>. This can be used to create an
  /// <code>IndexField</code> you can use for sorting.
  final SourceDataTrimTitle? sourceDataTrimTitle;

  SourceAttribute({
    required this.sourceDataFunction,
    this.sourceDataCopy,
    this.sourceDataMap,
    this.sourceDataTrimTitle,
  });
  factory SourceAttribute.fromXml(_s.XmlElement elem) {
    return SourceAttribute(
      sourceDataFunction: _s
          .extractXmlStringValue(elem, 'SourceDataFunction')!
          .toSourceDataFunction(),
      sourceDataCopy:
          _s.extractXmlChild(elem, 'SourceDataCopy')?.let(SourceData.fromXml),
      sourceDataMap:
          _s.extractXmlChild(elem, 'SourceDataMap')?.let(SourceDataMap.fromXml),
      sourceDataTrimTitle: _s
          .extractXmlChild(elem, 'SourceDataTrimTitle')
          ?.let(SourceDataTrimTitle.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceDataFunction = this.sourceDataFunction;
    final sourceDataCopy = this.sourceDataCopy;
    final sourceDataMap = this.sourceDataMap;
    final sourceDataTrimTitle = this.sourceDataTrimTitle;
    return {
      'SourceDataFunction': sourceDataFunction.toValue(),
      if (sourceDataCopy != null) 'SourceDataCopy': sourceDataCopy,
      if (sourceDataMap != null) 'SourceDataMap': sourceDataMap,
      if (sourceDataTrimTitle != null)
        'SourceDataTrimTitle': sourceDataTrimTitle,
    };
  }
}

/// The source attribute name and an optional default value to use if a document
/// doesn't have an attribute of that name.
class SourceData {
  /// The name of the document source field to add to this
  /// <code>IndexField</code>.
  final String sourceName;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  final String? defaultValue;

  SourceData({
    required this.sourceName,
    this.defaultValue,
  });
  factory SourceData.fromXml(_s.XmlElement elem) {
    return SourceData(
      sourceName: _s.extractXmlStringValue(elem, 'SourceName')!,
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    final defaultValue = this.defaultValue;
    return {
      'SourceName': sourceName,
      if (defaultValue != null) 'DefaultValue': defaultValue,
    };
  }
}

enum SourceDataFunction {
  copy,
  trimTitle,
  map,
}

extension SourceDataFunctionValueExtension on SourceDataFunction {
  String toValue() {
    switch (this) {
      case SourceDataFunction.copy:
        return 'Copy';
      case SourceDataFunction.trimTitle:
        return 'TrimTitle';
      case SourceDataFunction.map:
        return 'Map';
    }
  }
}

extension SourceDataFunctionFromString on String {
  SourceDataFunction toSourceDataFunction() {
    switch (this) {
      case 'Copy':
        return SourceDataFunction.copy;
      case 'TrimTitle':
        return SourceDataFunction.trimTitle;
      case 'Map':
        return SourceDataFunction.map;
    }
    throw Exception('$this is not known in enum SourceDataFunction');
  }
}

/// Specifies how to map source attribute values to custom values when
/// populating an <code>IndexField</code>.
class SourceDataMap {
  /// The name of the document source field to add to this
  /// <code>IndexField</code>.
  final String sourceName;

  /// A map that translates source field values to custom values.
  final Map<String, String>? cases;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  final String? defaultValue;

  SourceDataMap({
    required this.sourceName,
    this.cases,
    this.defaultValue,
  });
  factory SourceDataMap.fromXml(_s.XmlElement elem) {
    return SourceDataMap(
      sourceName: _s.extractXmlStringValue(elem, 'SourceName')!,
      cases: Map.fromEntries(
        elem.getElement('Cases')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    final cases = this.cases;
    final defaultValue = this.defaultValue;
    return {
      'SourceName': sourceName,
      if (cases != null) 'Cases': cases,
      if (defaultValue != null) 'DefaultValue': defaultValue,
    };
  }
}

/// Specifies how to trim common words from the beginning of a field to enable
/// title sorting by that field.
class SourceDataTrimTitle {
  /// The name of the document source field to add to this
  /// <code>IndexField</code>.
  final String sourceName;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  final String? defaultValue;
  final String? language;

  /// The separator that follows the text to trim.
  final String? separator;

  SourceDataTrimTitle({
    required this.sourceName,
    this.defaultValue,
    this.language,
    this.separator,
  });
  factory SourceDataTrimTitle.fromXml(_s.XmlElement elem) {
    return SourceDataTrimTitle(
      sourceName: _s.extractXmlStringValue(elem, 'SourceName')!,
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      language: _s.extractXmlStringValue(elem, 'Language'),
      separator: _s.extractXmlStringValue(elem, 'Separator'),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    final defaultValue = this.defaultValue;
    final language = this.language;
    final separator = this.separator;
    return {
      'SourceName': sourceName,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (language != null) 'Language': language,
      if (separator != null) 'Separator': separator,
    };
  }
}

/// The stemming options configured for this search domain and the current
/// status of those options.
class StemmingOptionsStatus {
  final String options;
  final OptionStatus status;

  StemmingOptionsStatus({
    required this.options,
    required this.status,
  });
  factory StemmingOptionsStatus.fromXml(_s.XmlElement elem) {
    return StemmingOptionsStatus(
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

/// The stopword options configured for this search domain and the current
/// status of those options.
class StopwordOptionsStatus {
  final String options;
  final OptionStatus status;

  StopwordOptionsStatus({
    required this.options,
    required this.status,
  });
  factory StopwordOptionsStatus.fromXml(_s.XmlElement elem) {
    return StopwordOptionsStatus(
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

/// The synonym options configured for this search domain and the current status
/// of those options.
class SynonymOptionsStatus {
  final String options;
  final OptionStatus status;

  SynonymOptionsStatus({
    required this.options,
    required this.status,
  });
  factory SynonymOptionsStatus.fromXml(_s.XmlElement elem) {
    return SynonymOptionsStatus(
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

/// Options that define a text field in the search index.
class TextOptions {
  /// The default value for a text field. Optional.
  final String? defaultValue;

  /// Specifies whether facets are enabled for this field. Default: False.
  final bool? facetEnabled;

  /// Specifies whether values of this field can be returned in search results and
  /// used for ranking. Default: False.
  final bool? resultEnabled;

  /// The text processor to apply to this field. Optional. Possible values:
  ///
  /// <ul>
  /// <li> <code>cs_text_no_stemming</code>: turns off stemming for the
  /// field.</li>
  /// </ul>
  /// Default: none
  final String? textProcessor;

  TextOptions({
    this.defaultValue,
    this.facetEnabled,
    this.resultEnabled,
    this.textProcessor,
  });
  factory TextOptions.fromXml(_s.XmlElement elem) {
    return TextOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      resultEnabled: _s.extractXmlBoolValue(elem, 'ResultEnabled'),
      textProcessor: _s.extractXmlStringValue(elem, 'TextProcessor'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final facetEnabled = this.facetEnabled;
    final resultEnabled = this.resultEnabled;
    final textProcessor = this.textProcessor;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (facetEnabled != null) 'FacetEnabled': facetEnabled,
      if (resultEnabled != null) 'ResultEnabled': resultEnabled,
      if (textProcessor != null) 'TextProcessor': textProcessor,
    };
  }
}

/// Options that define a <code>uint</code> field in the search index.
class UIntOptions {
  /// The default value for an unsigned integer field. Optional.
  final int? defaultValue;

  UIntOptions({
    this.defaultValue,
  });
  factory UIntOptions.fromXml(_s.XmlElement elem) {
    return UIntOptions(
      defaultValue: _s.extractXmlIntValue(elem, 'DefaultValue'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
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

/// A response message that contains the status of an updated default search
/// field.
class UpdateDefaultSearchFieldResponse {
  final DefaultSearchFieldStatus defaultSearchField;

  UpdateDefaultSearchFieldResponse({
    required this.defaultSearchField,
  });
  factory UpdateDefaultSearchFieldResponse.fromXml(_s.XmlElement elem) {
    return UpdateDefaultSearchFieldResponse(
      defaultSearchField: DefaultSearchFieldStatus.fromXml(
          _s.extractXmlChild(elem, 'DefaultSearchField')!),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultSearchField = this.defaultSearchField;
    return {
      'DefaultSearchField': defaultSearchField,
    };
  }
}

/// A response message that contains the status of updated access policies.
class UpdateServiceAccessPoliciesResponse {
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

/// A response message that contains the status of updated stemming options.
class UpdateStemmingOptionsResponse {
  final StemmingOptionsStatus stems;

  UpdateStemmingOptionsResponse({
    required this.stems,
  });
  factory UpdateStemmingOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateStemmingOptionsResponse(
      stems: StemmingOptionsStatus.fromXml(_s.extractXmlChild(elem, 'Stems')!),
    );
  }

  Map<String, dynamic> toJson() {
    final stems = this.stems;
    return {
      'Stems': stems,
    };
  }
}

/// A response message that contains the status of updated stopword options.
class UpdateStopwordOptionsResponse {
  final StopwordOptionsStatus stopwords;

  UpdateStopwordOptionsResponse({
    required this.stopwords,
  });
  factory UpdateStopwordOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateStopwordOptionsResponse(
      stopwords:
          StopwordOptionsStatus.fromXml(_s.extractXmlChild(elem, 'Stopwords')!),
    );
  }

  Map<String, dynamic> toJson() {
    final stopwords = this.stopwords;
    return {
      'Stopwords': stopwords,
    };
  }
}

/// A response message that contains the status of updated synonym options.
class UpdateSynonymOptionsResponse {
  final SynonymOptionsStatus synonyms;

  UpdateSynonymOptionsResponse({
    required this.synonyms,
  });
  factory UpdateSynonymOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateSynonymOptionsResponse(
      synonyms:
          SynonymOptionsStatus.fromXml(_s.extractXmlChild(elem, 'Synonyms')!),
    );
  }

  Map<String, dynamic> toJson() {
    final synonyms = this.synonyms;
    return {
      'Synonyms': synonyms,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BaseException': (type, message) => BaseException(message: message),
  'DisabledOperationException': (type, message) => DisabledOperationException(),
  'InternalException': (type, message) => InternalException(),
  'InvalidTypeException': (type, message) => InvalidTypeException(),
  'LimitExceededException': (type, message) => LimitExceededException(),
  'ResourceNotFoundException': (type, message) => ResourceNotFoundException(),
};
