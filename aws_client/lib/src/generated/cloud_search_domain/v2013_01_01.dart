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

/// You use the AmazonCloudSearch2013 API to upload documents to a search domain
/// and search those documents.
///
/// The endpoints for submitting <code>UploadDocuments</code>,
/// <code>Search</code>, and <code>Suggest</code> requests are domain-specific.
/// To get the endpoints for your domain, use the Amazon CloudSearch
/// configuration service <code>DescribeDomains</code> action. The domain
/// endpoints are also displayed on the domain dashboard in the Amazon
/// CloudSearch console. You submit suggest requests to the search endpoint.
///
/// For more information, see the <a
/// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide">Amazon
/// CloudSearch Developer Guide</a>.
class CloudSearchDomain {
  final _s.RestJsonProtocol _protocol;
  CloudSearchDomain({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudsearchdomain',
            signingName: 'cloudsearch',
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

  /// Retrieves a list of documents that match the specified search criteria.
  /// How you specify the search criteria depends on which query parser you use.
  /// Amazon CloudSearch supports four query parsers:
  ///
  /// <ul>
  /// <li><code>simple</code>: search all <code>text</code> and
  /// <code>text-array</code> fields for the specified string. Search for
  /// phrases, individual terms, and prefixes. </li>
  /// <li><code>structured</code>: search specific fields, construct compound
  /// queries using Boolean operators, and use advanced features such as term
  /// boosting and proximity searching.</li>
  /// <li><code>lucene</code>: specify search criteria using the Apache Lucene
  /// query parser syntax.</li>
  /// <li><code>dismax</code>: specify search criteria using the simplified
  /// subset of the Apache Lucene query parser syntax defined by the DisMax
  /// query parser.</li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching.html">Searching
  /// Your Data</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// The endpoint for submitting <code>Search</code> requests is
  /// domain-specific. You submit search requests to a domain's search endpoint.
  /// To get the search endpoint for your domain, use the Amazon CloudSearch
  /// configuration service <code>DescribeDomains</code> action. A domain's
  /// endpoints are also displayed on the domain dashboard in the Amazon
  /// CloudSearch console.
  ///
  /// May throw [SearchException].
  ///
  /// Parameter [query] :
  /// Specifies the search criteria for the request. How you specify the search
  /// criteria depends on the query parser used for the request and the parser
  /// options specified in the <code>queryOptions</code> parameter. By default,
  /// the <code>simple</code> query parser is used to process requests. To use
  /// the <code>structured</code>, <code>lucene</code>, or <code>dismax</code>
  /// query parser, you must also specify the <code>queryParser</code>
  /// parameter.
  ///
  /// For more information about specifying search criteria, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching.html">Searching
  /// Your Data</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// Parameter [cursor] :
  /// Retrieves a cursor value you can use to page through large result sets.
  /// Use the <code>size</code> parameter to control the number of hits to
  /// include in each response. You can specify either the <code>cursor</code>
  /// or <code>start</code> parameter in a request; they are mutually exclusive.
  /// To get the first cursor, set the cursor value to <code>initial</code>. In
  /// subsequent requests, specify the cursor value returned in the hits section
  /// of the response.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/paginating-results.html">Paginating
  /// Results</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// Parameter [expr] :
  /// Defines one or more numeric expressions that can be used to sort results
  /// or specify search or filter criteria. You can also specify expressions as
  /// return fields.
  ///
  /// You specify the expressions in JSON using the form
  /// <code>{"EXPRESSIONNAME":"EXPRESSION"}</code>. You can define and use
  /// multiple expressions in a search request. For example:
  ///
  /// <code> {"expression1":"_score*rating", "expression2":"(1/rank)*year"}
  /// </code>
  ///
  /// For information about the variables, operators, and functions you can use
  /// in expressions, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html#writing-expressions">Writing
  /// Expressions</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// Parameter [facet] :
  /// Specifies one or more fields for which to get facet information, and
  /// options that control how the facet information is returned. Each specified
  /// field must be facet-enabled in the domain configuration. The fields and
  /// options are specified in JSON using the form
  /// <code>{"FIELD":{"OPTION":VALUE,"OPTION:"STRING"},"FIELD":{"OPTION":VALUE,"OPTION":"STRING"}}</code>.
  ///
  /// You can specify the following faceting options:
  ///
  /// <ul>
  /// <li>
  /// <code>buckets</code> specifies an array of the facet values or ranges to
  /// count. Ranges are specified using the same syntax that you use to search
  /// for a range of values. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching-ranges.html">
  /// Searching for a Range of Values</a> in the <i>Amazon CloudSearch Developer
  /// Guide</i>. Buckets are returned in the order they are specified in the
  /// request. The <code>sort</code> and <code>size</code> options are not valid
  /// if you specify <code>buckets</code>.
  /// </li>
  /// <li>
  /// <code>size</code> specifies the maximum number of facets to include in the
  /// results. By default, Amazon CloudSearch returns counts for the top 10. The
  /// <code>size</code> parameter is only valid when you specify the
  /// <code>sort</code> option; it cannot be used in conjunction with
  /// <code>buckets</code>.
  /// </li>
  /// <li>
  /// <code>sort</code> specifies how you want to sort the facets in the
  /// results: <code>bucket</code> or <code>count</code>. Specify
  /// <code>bucket</code> to sort alphabetically or numerically by facet value
  /// (in ascending order). Specify <code>count</code> to sort by the facet
  /// counts computed for each facet value (in descending order). To retrieve
  /// facet counts for particular values or ranges of values, use the
  /// <code>buckets</code> option instead of <code>sort</code>.
  /// </li>
  /// </ul>
  /// If no facet options are specified, facet counts are computed for all field
  /// values, the facets are sorted by facet count, and the top 10 facets are
  /// returned in the results.
  ///
  /// To count particular buckets of values, use the <code>buckets</code>
  /// option. For example, the following request uses the <code>buckets</code>
  /// option to calculate and return facet counts by decade.
  ///
  /// <code>
  /// {"year":{"buckets":["[1970,1979]","[1980,1989]","[1990,1999]","[2000,2009]","[2010,}"]}}
  /// </code>
  ///
  /// To sort facets by facet count, use the <code>count</code> option. For
  /// example, the following request sets the <code>sort</code> option to
  /// <code>count</code> to sort the facet values by facet count, with the facet
  /// values that have the most matching documents listed first. Setting the
  /// <code>size</code> option to 3 returns only the top three facet values.
  ///
  /// <code> {"year":{"sort":"count","size":3}} </code>
  ///
  /// To sort the facets by value, use the <code>bucket</code> option. For
  /// example, the following request sets the <code>sort</code> option to
  /// <code>bucket</code> to sort the facet values numerically by year, with
  /// earliest year listed first.
  ///
  /// <code> {"year":{"sort":"bucket"}} </code>
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/faceting.html">Getting
  /// and Using Facet Information</a> in the <i>Amazon CloudSearch Developer
  /// Guide</i>.
  ///
  /// Parameter [filterQuery] :
  /// Specifies a structured query that filters the results of a search without
  /// affecting how the results are scored and sorted. You use
  /// <code>filterQuery</code> in conjunction with the <code>query</code>
  /// parameter to filter the documents that match the constraints specified in
  /// the <code>query</code> parameter. Specifying a filter controls only which
  /// matching documents are included in the results, it has no effect on how
  /// they are scored and sorted. The <code>filterQuery</code> parameter
  /// supports the full structured query syntax.
  ///
  /// For more information about using filters, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/filtering-results.html">Filtering
  /// Matching Documents</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// Parameter [highlight] :
  /// Retrieves highlights for matches in the specified <code>text</code> or
  /// <code>text-array</code> fields. Each specified field must be highlight
  /// enabled in the domain configuration. The fields and options are specified
  /// in JSON using the form
  /// <code>{"FIELD":{"OPTION":VALUE,"OPTION:"STRING"},"FIELD":{"OPTION":VALUE,"OPTION":"STRING"}}</code>.
  ///
  /// You can specify the following highlight options:
  ///
  /// <ul>
  /// <li> <code>format</code>: specifies the format of the data in the text
  /// field: <code>text</code> or <code>html</code>. When data is returned as
  /// HTML, all non-alphanumeric characters are encoded. The default is
  /// <code>html</code>. </li>
  /// <li> <code>max_phrases</code>: specifies the maximum number of occurrences
  /// of the search term(s) you want to highlight. By default, the first
  /// occurrence is highlighted. </li>
  /// <li> <code>pre_tag</code>: specifies the string to prepend to an
  /// occurrence of a search term. The default for HTML highlights is
  /// <code>&amp;lt;em&amp;gt;</code>. The default for text highlights is
  /// <code>*</code>. </li>
  /// <li> <code>post_tag</code>: specifies the string to append to an
  /// occurrence of a search term. The default for HTML highlights is
  /// <code>&amp;lt;/em&amp;gt;</code>. The default for text highlights is
  /// <code>*</code>. </li>
  /// </ul>
  /// If no highlight options are specified for a field, the returned field text
  /// is treated as HTML and the first match is highlighted with emphasis tags:
  /// <code>&amp;lt;em&gt;search-term&amp;lt;/em&amp;gt;</code>.
  ///
  /// For example, the following request retrieves highlights for the
  /// <code>actors</code> and <code>title</code> fields.
  ///
  /// <code>{ "actors": {}, "title": {"format": "text","max_phrases":
  /// 2,"pre_tag": "<b>","post_tag": "</b>"} }</code>
  ///
  /// Parameter [partial] :
  /// Enables partial results to be returned if one or more index partitions are
  /// unavailable. When your search index is partitioned across multiple search
  /// instances, by default Amazon CloudSearch only returns results if every
  /// partition can be queried. This means that the failure of a single search
  /// instance can result in 5xx (internal server) errors. When you enable
  /// partial results, Amazon CloudSearch returns whatever results are available
  /// and includes the percentage of documents searched in the search results
  /// (percent-searched). This enables you to more gracefully degrade your
  /// users' search experience. For example, rather than displaying no results,
  /// you could display the partial results and a message indicating that the
  /// results might be incomplete due to a temporary system outage.
  ///
  /// Parameter [queryOptions] :
  /// Configures options for the query parser specified in the
  /// <code>queryParser</code> parameter. You specify the options in JSON using
  /// the following form
  /// <code>{"OPTION1":"VALUE1","OPTION2":VALUE2"..."OPTIONN":"VALUEN"}.</code>
  ///
  /// The options you can configure vary according to which parser you use:
  ///
  /// <ul>
  /// <li><code>defaultOperator</code>: The default operator used to combine
  /// individual terms in the search string. For example: <code>defaultOperator:
  /// 'or'</code>. For the <code>dismax</code> parser, you specify a percentage
  /// that represents the percentage of terms in the search string (rounded
  /// down) that must match, rather than a default operator. A value of
  /// <code>0%</code> is the equivalent to OR, and a value of <code>100%</code>
  /// is equivalent to AND. The percentage must be specified as a value in the
  /// range 0-100 followed by the percent (%) symbol. For example,
  /// <code>defaultOperator: 50%</code>. Valid values: <code>and</code>,
  /// <code>or</code>, a percentage in the range 0%-100% (<code>dismax</code>).
  /// Default: <code>and</code> (<code>simple</code>, <code>structured</code>,
  /// <code>lucene</code>) or <code>100</code> (<code>dismax</code>). Valid for:
  /// <code>simple</code>, <code>structured</code>, <code>lucene</code>, and
  /// <code>dismax</code>.</li>
  /// <li><code>fields</code>: An array of the fields to search when no fields
  /// are specified in a search. If no fields are specified in a search and this
  /// option is not specified, all text and text-array fields are searched. You
  /// can specify a weight for each field to control the relative importance of
  /// each field when Amazon CloudSearch calculates relevance scores. To specify
  /// a field weight, append a caret (<code>^</code>) symbol and the weight to
  /// the field name. For example, to boost the importance of the
  /// <code>title</code> field over the <code>description</code> field you could
  /// specify: <code>"fields":["title^5","description"]</code>. Valid values:
  /// The name of any configured field and an optional numeric value greater
  /// than zero. Default: All <code>text</code> and <code>text-array</code>
  /// fields. Valid for: <code>simple</code>, <code>structured</code>,
  /// <code>lucene</code>, and <code>dismax</code>.</li>
  /// <li><code>operators</code>: An array of the operators or special
  /// characters you want to disable for the simple query parser. If you disable
  /// the <code>and</code>, <code>or</code>, or <code>not</code> operators, the
  /// corresponding operators (<code>+</code>, <code>|</code>, <code>-</code>)
  /// have no special meaning and are dropped from the search string. Similarly,
  /// disabling <code>prefix</code> disables the wildcard operator
  /// (<code>*</code>) and disabling <code>phrase</code> disables the ability to
  /// search for phrases by enclosing phrases in double quotes. Disabling
  /// precedence disables the ability to control order of precedence using
  /// parentheses. Disabling <code>near</code> disables the ability to use the ~
  /// operator to perform a sloppy phrase search. Disabling the
  /// <code>fuzzy</code> operator disables the ability to use the ~ operator to
  /// perform a fuzzy search. <code>escape</code> disables the ability to use a
  /// backslash (<code>\</code>) to escape special characters within the search
  /// string. Disabling whitespace is an advanced option that prevents the
  /// parser from tokenizing on whitespace, which can be useful for Vietnamese.
  /// (It prevents Vietnamese words from being split incorrectly.) For example,
  /// you could disable all operators other than the phrase operator to support
  /// just simple term and phrase queries: <code>"operators":["and","not","or",
  /// "prefix"]</code>. Valid values: <code>and</code>, <code>escape</code>,
  /// <code>fuzzy</code>, <code>near</code>, <code>not</code>, <code>or</code>,
  /// <code>phrase</code>, <code>precedence</code>, <code>prefix</code>,
  /// <code>whitespace</code>. Default: All operators and special characters are
  /// enabled. Valid for: <code>simple</code>.</li>
  /// <li><code>phraseFields</code>: An array of the <code>text</code> or
  /// <code>text-array</code> fields you want to use for phrase searches. When
  /// the terms in the search string appear in close proximity within a field,
  /// the field scores higher. You can specify a weight for each field to boost
  /// that score. The <code>phraseSlop</code> option controls how much the
  /// matches can deviate from the search string and still be boosted. To
  /// specify a field weight, append a caret (<code>^</code>) symbol and the
  /// weight to the field name. For example, to boost phrase matches in the
  /// <code>title</code> field over the <code>abstract</code> field, you could
  /// specify: <code>"phraseFields":["title^3", "plot"]</code> Valid values: The
  /// name of any <code>text</code> or <code>text-array</code> field and an
  /// optional numeric value greater than zero. Default: No fields. If you don't
  /// specify any fields with <code>phraseFields</code>, proximity scoring is
  /// disabled even if <code>phraseSlop</code> is specified. Valid for:
  /// <code>dismax</code>.</li>
  /// <li><code>phraseSlop</code>: An integer value that specifies how much
  /// matches can deviate from the search phrase and still be boosted according
  /// to the weights specified in the <code>phraseFields</code> option; for
  /// example, <code>phraseSlop: 2</code>. You must also specify
  /// <code>phraseFields</code> to enable proximity scoring. Valid values:
  /// positive integers. Default: 0. Valid for: <code>dismax</code>.</li>
  /// <li><code>explicitPhraseSlop</code>: An integer value that specifies how
  /// much a match can deviate from the search phrase when the phrase is
  /// enclosed in double quotes in the search string. (Phrases that exceed this
  /// proximity distance are not considered a match.) For example, to specify a
  /// slop of three for dismax phrase queries, you would specify
  /// <code>"explicitPhraseSlop":3</code>. Valid values: positive integers.
  /// Default: 0. Valid for: <code>dismax</code>.</li>
  /// <li><code>tieBreaker</code>: When a term in the search string is found in
  /// a document's field, a score is calculated for that field based on how
  /// common the word is in that field compared to other documents. If the term
  /// occurs in multiple fields within a document, by default only the highest
  /// scoring field contributes to the document's overall score. You can specify
  /// a <code>tieBreaker</code> value to enable the matches in lower-scoring
  /// fields to contribute to the document's score. That way, if two documents
  /// have the same max field score for a particular term, the score for the
  /// document that has matches in more fields will be higher. The formula for
  /// calculating the score with a tieBreaker is <code>(max field score) +
  /// (tieBreaker) * (sum of the scores for the rest of the matching
  /// fields)</code>. Set <code>tieBreaker</code> to 0 to disregard all but the
  /// highest scoring field (pure max): <code>"tieBreaker":0</code>. Set to 1 to
  /// sum the scores from all fields (pure sum): <code>"tieBreaker":1</code>.
  /// Valid values: 0.0 to 1.0. Default: 0.0. Valid for: <code>dismax</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [queryParser] :
  /// Specifies which query parser to use to process the request. If
  /// <code>queryParser</code> is not specified, Amazon CloudSearch uses the
  /// <code>simple</code> query parser.
  ///
  /// Amazon CloudSearch supports four query parsers:
  ///
  /// <ul>
  /// <li> <code>simple</code>: perform simple searches of <code>text</code> and
  /// <code>text-array</code> fields. By default, the <code>simple</code> query
  /// parser searches all <code>text</code> and <code>text-array</code> fields.
  /// You can specify which fields to search by with the
  /// <code>queryOptions</code> parameter. If you prefix a search term with a
  /// plus sign (+) documents must contain the term to be considered a match.
  /// (This is the default, unless you configure the default operator with the
  /// <code>queryOptions</code> parameter.) You can use the <code>-</code>
  /// (NOT), <code>|</code> (OR), and <code>*</code> (wildcard) operators to
  /// exclude particular terms, find results that match any of the specified
  /// terms, or search for a prefix. To search for a phrase rather than
  /// individual terms, enclose the phrase in double quotes. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching-text.html">Searching
  /// for Text</a> in the <i>Amazon CloudSearch Developer Guide</i>. </li>
  /// <li> <code>structured</code>: perform advanced searches by combining
  /// multiple expressions to define the search criteria. You can also search
  /// within particular fields, search for values and ranges of values, and use
  /// advanced options such as term boosting, <code>matchall</code>, and
  /// <code>near</code>. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching-compound-queries.html">Constructing
  /// Compound Queries</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  /// </li>
  /// <li> <code>lucene</code>: search using the Apache Lucene query parser
  /// syntax. For more information, see <a
  /// href="http://lucene.apache.org/core/4_6_0/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#package_description">Apache
  /// Lucene Query Parser Syntax</a>. </li>
  /// <li> <code>dismax</code>: search using the simplified subset of the Apache
  /// Lucene query parser syntax defined by the DisMax query parser. For more
  /// information, see <a
  /// href="http://wiki.apache.org/solr/DisMaxQParserPlugin#Query_Syntax">DisMax
  /// Query Parser Syntax</a>. </li>
  /// </ul>
  ///
  /// Parameter [returnValue] :
  /// Specifies the field and expression values to include in the response.
  /// Multiple fields or expressions are specified as a comma-separated list. By
  /// default, a search response includes all return enabled fields
  /// (<code>_all_fields</code>). To return only the document IDs for the
  /// matching documents, specify <code>_no_fields</code>. To retrieve the
  /// relevance score calculated for each document, specify <code>_score</code>.
  ///
  /// Parameter [size] :
  /// Specifies the maximum number of search hits to include in the response.
  ///
  /// Parameter [sort] :
  /// Specifies the fields or custom expressions to use to sort the search
  /// results. Multiple fields or expressions are specified as a comma-separated
  /// list. You must specify the sort direction (<code>asc</code> or
  /// <code>desc</code>) for each field; for example, <code>year desc,title
  /// asc</code>. To use a field to sort results, the field must be sort-enabled
  /// in the domain configuration. Array type fields cannot be used for sorting.
  /// If no <code>sort</code> parameter is specified, results are sorted by
  /// their default relevance scores in descending order: <code>_score
  /// desc</code>. You can also sort by document ID (<code>_id asc</code>) and
  /// version (<code>_version desc</code>).
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/sorting-results.html">Sorting
  /// Results</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// Parameter [start] :
  /// Specifies the offset of the first search hit you want to return. Note that
  /// the result set is zero-based; the first result is at index 0. You can
  /// specify either the <code>start</code> or <code>cursor</code> parameter in
  /// a request, they are mutually exclusive.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/paginating-results.html">Paginating
  /// Results</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// Parameter [stats] :
  /// Specifies one or more fields for which to get statistics information. Each
  /// specified field must be facet-enabled in the domain configuration. The
  /// fields are specified in JSON using the form:
  /// <code>{"FIELD-A":{},"FIELD-B":{}}</code>
  /// There are currently no options supported for statistics.
  Future<SearchResponse> search({
    required String query,
    String? cursor,
    String? expr,
    String? facet,
    String? filterQuery,
    String? highlight,
    bool? partial,
    String? queryOptions,
    QueryParser? queryParser,
    String? returnValue,
    int? size,
    String? sort,
    int? start,
    String? stats,
  }) async {
    final $query = <String, List<String>>{
      'q': [query],
      if (cursor != null) 'cursor': [cursor],
      if (expr != null) 'expr': [expr],
      if (facet != null) 'facet': [facet],
      if (filterQuery != null) 'fq': [filterQuery],
      if (highlight != null) 'highlight': [highlight],
      if (partial != null) 'partial': [partial.toString()],
      if (queryOptions != null) 'q.options': [queryOptions],
      if (queryParser != null) 'q.parser': [queryParser.toValue()],
      if (returnValue != null) 'return': [returnValue],
      if (size != null) 'size': [size.toString()],
      if (sort != null) 'sort': [sort],
      if (start != null) 'start': [start.toString()],
      if (stats != null) 'stats': [stats],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2013-01-01/search?format=sdk&pretty=true',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchResponse.fromJson(response);
  }

  /// Retrieves autocomplete suggestions for a partial query string. You can use
  /// suggestions enable you to display likely matches before users finish
  /// typing. In Amazon CloudSearch, suggestions are based on the contents of a
  /// particular text field. When you request suggestions, Amazon CloudSearch
  /// finds all of the documents whose values in the suggester field start with
  /// the specified query string. The beginning of the field must match the
  /// query string to be considered a match.
  ///
  /// For more information about configuring suggesters and retrieving
  /// suggestions, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html">Getting
  /// Suggestions</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// The endpoint for submitting <code>Suggest</code> requests is
  /// domain-specific. You submit suggest requests to a domain's search
  /// endpoint. To get the search endpoint for your domain, use the Amazon
  /// CloudSearch configuration service <code>DescribeDomains</code> action. A
  /// domain's endpoints are also displayed on the domain dashboard in the
  /// Amazon CloudSearch console.
  ///
  /// May throw [SearchException].
  ///
  /// Parameter [query] :
  /// Specifies the string for which you want to get suggestions.
  ///
  /// Parameter [suggester] :
  /// Specifies the name of the suggester to use to find suggested matches.
  ///
  /// Parameter [size] :
  /// Specifies the maximum number of suggestions to return.
  Future<SuggestResponse> suggest({
    required String query,
    required String suggester,
    int? size,
  }) async {
    final $query = <String, List<String>>{
      'q': [query],
      'suggester': [suggester],
      if (size != null) 'size': [size.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2013-01-01/suggest?format=sdk&pretty=true',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SuggestResponse.fromJson(response);
  }

  /// Posts a batch of documents to a search domain for indexing. A document
  /// batch is a collection of add and delete operations that represent the
  /// documents you want to add, update, or delete from your domain. Batches can
  /// be described in either JSON or XML. Each item that you want Amazon
  /// CloudSearch to return as a search result (such as a product) is
  /// represented as a document. Every document has a unique ID and one or more
  /// fields that contain the data that you want to search and return in
  /// results. Individual documents cannot contain more than 1 MB of data. The
  /// entire batch cannot exceed 5 MB. To get the best possible upload
  /// performance, group add and delete operations in batches that are close the
  /// 5 MB limit. Submitting a large volume of single-document batches can
  /// overload a domain's document service.
  ///
  /// The endpoint for submitting <code>UploadDocuments</code> requests is
  /// domain-specific. To get the document endpoint for your domain, use the
  /// Amazon CloudSearch configuration service <code>DescribeDomains</code>
  /// action. A domain's endpoints are also displayed on the domain dashboard in
  /// the Amazon CloudSearch console.
  ///
  /// For more information about formatting your data for Amazon CloudSearch,
  /// see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/preparing-data.html">Preparing
  /// Your Data</a> in the <i>Amazon CloudSearch Developer Guide</i>. For more
  /// information about uploading data for indexing, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/uploading-data.html">Uploading
  /// Data</a> in the <i>Amazon CloudSearch Developer Guide</i>.
  ///
  /// May throw [DocumentServiceException].
  ///
  /// Parameter [contentType] :
  /// The format of the batch you are uploading. Amazon CloudSearch supports two
  /// document batch formats:
  ///
  /// <ul>
  /// <li>application/json</li>
  /// <li>application/xml</li>
  /// </ul>
  ///
  /// Parameter [documents] :
  /// A batch of documents formatted in JSON or HTML.
  Future<UploadDocumentsResponse> uploadDocuments({
    required ContentType contentType,
    required Uint8List documents,
  }) async {
    final headers = <String, String>{
      'Content-Type': contentType.toValue(),
    };
    final response = await _protocol.send(
      payload: documents,
      method: 'POST',
      requestUri: '/2013-01-01/documents/batch?format=sdk',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UploadDocumentsResponse.fromJson(response);
  }
}

/// A container for facet information.
class Bucket {
  /// The number of hits that contain the facet value in the specified facet
  /// field.
  final int? count;

  /// The facet value being counted.
  final String? value;

  Bucket({
    this.count,
    this.value,
  });

  factory Bucket.fromJson(Map<String, dynamic> json) {
    return Bucket(
      count: json['count'] as int?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final value = this.value;
    return {
      if (count != null) 'count': count,
      if (value != null) 'value': value,
    };
  }
}

/// A container for the calculated facet values and counts.
class BucketInfo {
  /// A list of the calculated facet values and counts.
  final List<Bucket>? buckets;

  BucketInfo({
    this.buckets,
  });

  factory BucketInfo.fromJson(Map<String, dynamic> json) {
    return BucketInfo(
      buckets: (json['buckets'] as List?)
          ?.whereNotNull()
          .map((e) => Bucket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final buckets = this.buckets;
    return {
      if (buckets != null) 'buckets': buckets,
    };
  }
}

enum ContentType {
  applicationJson,
  applicationXml,
}

extension ContentTypeValueExtension on ContentType {
  String toValue() {
    switch (this) {
      case ContentType.applicationJson:
        return 'application/json';
      case ContentType.applicationXml:
        return 'application/xml';
    }
  }
}

extension ContentTypeFromString on String {
  ContentType toContentType() {
    switch (this) {
      case 'application/json':
        return ContentType.applicationJson;
      case 'application/xml':
        return ContentType.applicationXml;
    }
    throw Exception('$this is not known in enum ContentType');
  }
}

/// Information about any problems encountered while processing an upload
/// request.
class DocumentServiceException implements _s.AwsException {
  /// The description of the errors returned by the document service.
  final String? message;

  /// The return status of a document upload request, <code>error</code> or
  /// <code>success</code>.
  final String? status;

  DocumentServiceException({
    this.message,
    this.status,
  });

  factory DocumentServiceException.fromJson(Map<String, dynamic> json) {
    return DocumentServiceException(
      message: json['message'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final status = this.status;
    return {
      if (message != null) 'message': message,
      if (status != null) 'status': status,
    };
  }
}

/// A warning returned by the document service when an issue is discovered while
/// processing an upload request.
class DocumentServiceWarning {
  /// The description for a warning returned by the document service.
  final String? message;

  DocumentServiceWarning({
    this.message,
  });

  factory DocumentServiceWarning.fromJson(Map<String, dynamic> json) {
    return DocumentServiceWarning(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// The statistics for a field calculated in the request.
class FieldStats {
  /// The number of documents that contain a value in the specified field in the
  /// result set.
  final int? count;

  /// The maximum value found in the specified field in the result set.
  ///
  /// If the field is numeric (<code>int</code>, <code>int-array</code>,
  /// <code>double</code>, or <code>double-array</code>), <code>max</code> is the
  /// string representation of a double-precision 64-bit floating point value. If
  /// the field is <code>date</code> or <code>date-array</code>, <code>max</code>
  /// is the string representation of a date with the format specified in <a
  /// href="http://tools.ietf.org/html/rfc3339">IETF RFC3339</a>:
  /// yyyy-mm-ddTHH:mm:ss.SSSZ.
  final String? max;

  /// The average of the values found in the specified field in the result set.
  ///
  /// If the field is numeric (<code>int</code>, <code>int-array</code>,
  /// <code>double</code>, or <code>double-array</code>), <code>mean</code> is the
  /// string representation of a double-precision 64-bit floating point value. If
  /// the field is <code>date</code> or <code>date-array</code>, <code>mean</code>
  /// is the string representation of a date with the format specified in <a
  /// href="http://tools.ietf.org/html/rfc3339">IETF RFC3339</a>:
  /// yyyy-mm-ddTHH:mm:ss.SSSZ.
  final String? mean;

  /// The minimum value found in the specified field in the result set.
  ///
  /// If the field is numeric (<code>int</code>, <code>int-array</code>,
  /// <code>double</code>, or <code>double-array</code>), <code>min</code> is the
  /// string representation of a double-precision 64-bit floating point value. If
  /// the field is <code>date</code> or <code>date-array</code>, <code>min</code>
  /// is the string representation of a date with the format specified in <a
  /// href="http://tools.ietf.org/html/rfc3339">IETF RFC3339</a>:
  /// yyyy-mm-ddTHH:mm:ss.SSSZ.
  final String? min;

  /// The number of documents that do not contain a value in the specified field
  /// in the result set.
  final int? missing;

  /// The standard deviation of the values in the specified field in the result
  /// set.
  final double? stddev;

  /// The sum of the field values across the documents in the result set.
  /// <code>null</code> for date fields.
  final double? sum;

  /// The sum of all field values in the result set squared.
  final double? sumOfSquares;

  FieldStats({
    this.count,
    this.max,
    this.mean,
    this.min,
    this.missing,
    this.stddev,
    this.sum,
    this.sumOfSquares,
  });

  factory FieldStats.fromJson(Map<String, dynamic> json) {
    return FieldStats(
      count: json['count'] as int?,
      max: json['max'] as String?,
      mean: json['mean'] as String?,
      min: json['min'] as String?,
      missing: json['missing'] as int?,
      stddev: json['stddev'] as double?,
      sum: json['sum'] as double?,
      sumOfSquares: json['sumOfSquares'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final max = this.max;
    final mean = this.mean;
    final min = this.min;
    final missing = this.missing;
    final stddev = this.stddev;
    final sum = this.sum;
    final sumOfSquares = this.sumOfSquares;
    return {
      if (count != null) 'count': count,
      if (max != null) 'max': max,
      if (mean != null) 'mean': mean,
      if (min != null) 'min': min,
      if (missing != null) 'missing': missing,
      if (stddev != null) 'stddev': stddev,
      if (sum != null) 'sum': sum,
      if (sumOfSquares != null) 'sumOfSquares': sumOfSquares,
    };
  }
}

/// Information about a document that matches the search request.
class Hit {
  /// The expressions returned from a document that matches the search request.
  final Map<String, String>? exprs;

  /// The fields returned from a document that matches the search request.
  final Map<String, List<String>>? fields;

  /// The highlights returned from a document that matches the search request.
  final Map<String, String>? highlights;

  /// The document ID of a document that matches the search request.
  final String? id;

  Hit({
    this.exprs,
    this.fields,
    this.highlights,
    this.id,
  });

  factory Hit.fromJson(Map<String, dynamic> json) {
    return Hit(
      exprs: (json['exprs'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      fields: (json['fields'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k, (e as List).whereNotNull().map((e) => e as String).toList())),
      highlights: (json['highlights'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exprs = this.exprs;
    final fields = this.fields;
    final highlights = this.highlights;
    final id = this.id;
    return {
      if (exprs != null) 'exprs': exprs,
      if (fields != null) 'fields': fields,
      if (highlights != null) 'highlights': highlights,
      if (id != null) 'id': id,
    };
  }
}

/// The collection of documents that match the search request.
class Hits {
  /// A cursor that can be used to retrieve the next set of matching documents
  /// when you want to page through a large result set.
  final String? cursor;

  /// The total number of documents that match the search request.
  final int? found;

  /// A document that matches the search request.
  final List<Hit>? hit;

  /// The index of the first matching document.
  final int? start;

  Hits({
    this.cursor,
    this.found,
    this.hit,
    this.start,
  });

  factory Hits.fromJson(Map<String, dynamic> json) {
    return Hits(
      cursor: json['cursor'] as String?,
      found: json['found'] as int?,
      hit: (json['hit'] as List?)
          ?.whereNotNull()
          .map((e) => Hit.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: json['start'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cursor = this.cursor;
    final found = this.found;
    final hit = this.hit;
    final start = this.start;
    return {
      if (cursor != null) 'cursor': cursor,
      if (found != null) 'found': found,
      if (hit != null) 'hit': hit,
      if (start != null) 'start': start,
    };
  }
}

enum QueryParser {
  simple,
  structured,
  lucene,
  dismax,
}

extension QueryParserValueExtension on QueryParser {
  String toValue() {
    switch (this) {
      case QueryParser.simple:
        return 'simple';
      case QueryParser.structured:
        return 'structured';
      case QueryParser.lucene:
        return 'lucene';
      case QueryParser.dismax:
        return 'dismax';
    }
  }
}

extension QueryParserFromString on String {
  QueryParser toQueryParser() {
    switch (this) {
      case 'simple':
        return QueryParser.simple;
      case 'structured':
        return QueryParser.structured;
      case 'lucene':
        return QueryParser.lucene;
      case 'dismax':
        return QueryParser.dismax;
    }
    throw Exception('$this is not known in enum QueryParser');
  }
}

/// Information about any problems encountered while processing a search
/// request.
class SearchException implements _s.AwsException {
  /// A description of the error returned by the search service.
  final String? message;

  SearchException({
    this.message,
  });

  factory SearchException.fromJson(Map<String, dynamic> json) {
    return SearchException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// The result of a <code>Search</code> request. Contains the documents that
/// match the specified search criteria and any requested fields, highlights,
/// and facet information.
class SearchResponse {
  /// The requested facet information.
  final Map<String, BucketInfo>? facets;

  /// The documents that match the search criteria.
  final Hits? hits;

  /// The requested field statistics information.
  final Map<String, FieldStats>? stats;

  /// The status information returned for the search request.
  final SearchStatus? status;

  SearchResponse({
    this.facets,
    this.hits,
    this.stats,
    this.status,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      facets: (json['facets'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, BucketInfo.fromJson(e as Map<String, dynamic>))),
      hits: json['hits'] != null
          ? Hits.fromJson(json['hits'] as Map<String, dynamic>)
          : null,
      stats: (json['stats'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, FieldStats.fromJson(e as Map<String, dynamic>))),
      status: json['status'] != null
          ? SearchStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final facets = this.facets;
    final hits = this.hits;
    final stats = this.stats;
    final status = this.status;
    return {
      if (facets != null) 'facets': facets,
      if (hits != null) 'hits': hits,
      if (stats != null) 'stats': stats,
      if (status != null) 'status': status,
    };
  }
}

/// Contains the resource id (<code>rid</code>) and the time it took to process
/// the request (<code>timems</code>).
class SearchStatus {
  /// The encrypted resource ID for the request.
  final String? rid;

  /// How long it took to process the request, in milliseconds.
  final int? timems;

  SearchStatus({
    this.rid,
    this.timems,
  });

  factory SearchStatus.fromJson(Map<String, dynamic> json) {
    return SearchStatus(
      rid: json['rid'] as String?,
      timems: json['timems'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final rid = this.rid;
    final timems = this.timems;
    return {
      if (rid != null) 'rid': rid,
      if (timems != null) 'timems': timems,
    };
  }
}

/// Container for the suggestion information returned in a
/// <code>SuggestResponse</code>.
class SuggestModel {
  /// The number of documents that were found to match the query string.
  final int? found;

  /// The query string specified in the suggest request.
  final String? query;

  /// The documents that match the query string.
  final List<SuggestionMatch>? suggestions;

  SuggestModel({
    this.found,
    this.query,
    this.suggestions,
  });

  factory SuggestModel.fromJson(Map<String, dynamic> json) {
    return SuggestModel(
      found: json['found'] as int?,
      query: json['query'] as String?,
      suggestions: (json['suggestions'] as List?)
          ?.whereNotNull()
          .map((e) => SuggestionMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final found = this.found;
    final query = this.query;
    final suggestions = this.suggestions;
    return {
      if (found != null) 'found': found,
      if (query != null) 'query': query,
      if (suggestions != null) 'suggestions': suggestions,
    };
  }
}

/// Contains the response to a <code>Suggest</code> request.
class SuggestResponse {
  /// The status of a <code>SuggestRequest</code>. Contains the resource ID
  /// (<code>rid</code>) and how long it took to process the request
  /// (<code>timems</code>).
  final SuggestStatus? status;

  /// Container for the matching search suggestion information.
  final SuggestModel? suggest;

  SuggestResponse({
    this.status,
    this.suggest,
  });

  factory SuggestResponse.fromJson(Map<String, dynamic> json) {
    return SuggestResponse(
      status: json['status'] != null
          ? SuggestStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      suggest: json['suggest'] != null
          ? SuggestModel.fromJson(json['suggest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final suggest = this.suggest;
    return {
      if (status != null) 'status': status,
      if (suggest != null) 'suggest': suggest,
    };
  }
}

/// Contains the resource id (<code>rid</code>) and the time it took to process
/// the request (<code>timems</code>).
class SuggestStatus {
  /// The encrypted resource ID for the request.
  final String? rid;

  /// How long it took to process the request, in milliseconds.
  final int? timems;

  SuggestStatus({
    this.rid,
    this.timems,
  });

  factory SuggestStatus.fromJson(Map<String, dynamic> json) {
    return SuggestStatus(
      rid: json['rid'] as String?,
      timems: json['timems'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final rid = this.rid;
    final timems = this.timems;
    return {
      if (rid != null) 'rid': rid,
      if (timems != null) 'timems': timems,
    };
  }
}

/// An autocomplete suggestion that matches the query string specified in a
/// <code>SuggestRequest</code>.
class SuggestionMatch {
  /// The document ID of the suggested document.
  final String? id;

  /// The relevance score of a suggested match.
  final int? score;

  /// The string that matches the query string specified in the
  /// <code>SuggestRequest</code>.
  final String? suggestion;

  SuggestionMatch({
    this.id,
    this.score,
    this.suggestion,
  });

  factory SuggestionMatch.fromJson(Map<String, dynamic> json) {
    return SuggestionMatch(
      id: json['id'] as String?,
      score: json['score'] as int?,
      suggestion: json['suggestion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final score = this.score;
    final suggestion = this.suggestion;
    return {
      if (id != null) 'id': id,
      if (score != null) 'score': score,
      if (suggestion != null) 'suggestion': suggestion,
    };
  }
}

/// Contains the response to an <code>UploadDocuments</code> request.
class UploadDocumentsResponse {
  /// The number of documents that were added to the search domain.
  final int? adds;

  /// The number of documents that were deleted from the search domain.
  final int? deletes;

  /// The status of an <code>UploadDocumentsRequest</code>.
  final String? status;

  /// Any warnings returned by the document service about the documents being
  /// uploaded.
  final List<DocumentServiceWarning>? warnings;

  UploadDocumentsResponse({
    this.adds,
    this.deletes,
    this.status,
    this.warnings,
  });

  factory UploadDocumentsResponse.fromJson(Map<String, dynamic> json) {
    return UploadDocumentsResponse(
      adds: json['adds'] as int?,
      deletes: json['deletes'] as int?,
      status: json['status'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DocumentServiceWarning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final adds = this.adds;
    final deletes = this.deletes;
    final status = this.status;
    final warnings = this.warnings;
    return {
      if (adds != null) 'adds': adds,
      if (deletes != null) 'deletes': deletes,
      if (status != null) 'status': status,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DocumentServiceException': (type, message) =>
      DocumentServiceException(message: message),
  'SearchException': (type, message) => SearchException(message: message),
};
