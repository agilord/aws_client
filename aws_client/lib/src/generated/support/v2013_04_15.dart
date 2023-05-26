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

/// The <i>Amazon Web Services Support API Reference</i> is intended for
/// programmers who need detailed information about the Amazon Web Services
/// Support operations and data types. You can use the API to manage your
/// support cases programmatically. The Amazon Web Services Support API uses
/// HTTP methods that return results in JSON format.
/// <note>
/// <ul>
/// <li>
/// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to
/// use the Amazon Web Services Support API.
/// </li>
/// <li>
/// If you call the Amazon Web Services Support API from an account that doesn't
/// have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
/// <code>SubscriptionRequiredException</code> error message appears. For
/// information about changing your support plan, see <a
/// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
/// Support</a>.
/// </li>
/// </ul> </note>
/// You can also use the Amazon Web Services Support API to access features for
/// <a href="http://aws.amazon.com/premiumsupport/trustedadvisor/">Trusted
/// Advisor</a>. You can return a list of checks and their descriptions, get
/// check results, specify checks to refresh, and get the refresh status of
/// checks.
class Support {
  final _s.JsonProtocol _protocol;
  Support({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'support',
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

  /// Adds one or more attachments to an attachment set.
  ///
  /// An attachment set is a temporary container for attachments that you add to
  /// a case or case communication. The set is available for 1 hour after it's
  /// created. The <code>expiryTime</code> returned in the response is when the
  /// set expires.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [AttachmentSetIdNotFound].
  /// May throw [AttachmentSetExpired].
  /// May throw [AttachmentSetSizeLimitExceeded].
  /// May throw [AttachmentLimitExceeded].
  ///
  /// Parameter [attachments] :
  /// One or more attachments to add to the set. You can add up to three
  /// attachments per set. The size limit is 5 MB per attachment.
  ///
  /// In the <code>Attachment</code> object, use the <code>data</code> parameter
  /// to specify the contents of the attachment file. In the previous request
  /// syntax, the value for <code>data</code> appear as <code>blob</code>, which
  /// is represented as a base64-encoded string. The value for
  /// <code>fileName</code> is the name of the attachment, such as
  /// <code>troubleshoot-screenshot.png</code>.
  ///
  /// Parameter [attachmentSetId] :
  /// The ID of the attachment set. If an <code>attachmentSetId</code> is not
  /// specified, a new attachment set is created, and the ID of the set is
  /// returned in the response. If an <code>attachmentSetId</code> is specified,
  /// the attachments are added to the specified set, if it exists.
  Future<AddAttachmentsToSetResponse> addAttachmentsToSet({
    required List<Attachment> attachments,
    String? attachmentSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.AddAttachmentsToSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'attachments': attachments,
        if (attachmentSetId != null) 'attachmentSetId': attachmentSetId,
      },
    );

    return AddAttachmentsToSetResponse.fromJson(jsonResponse.body);
  }

  /// Adds additional customer communication to an Amazon Web Services Support
  /// case. Use the <code>caseId</code> parameter to identify the case to which
  /// to add communication. You can list a set of email addresses to copy on the
  /// communication by using the <code>ccEmailAddresses</code> parameter. The
  /// <code>communicationBody</code> value contains the text of the
  /// communication.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [CaseIdNotFound].
  /// May throw [AttachmentSetIdNotFound].
  /// May throw [AttachmentSetExpired].
  ///
  /// Parameter [communicationBody] :
  /// The body of an email communication to add to the support case.
  ///
  /// Parameter [attachmentSetId] :
  /// The ID of a set of one or more attachments for the communication to add to
  /// the case. Create the set by calling <a>AddAttachmentsToSet</a>
  ///
  /// Parameter [caseId] :
  /// The support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  ///
  /// Parameter [ccEmailAddresses] :
  /// The email addresses in the CC line of an email to be added to the support
  /// case.
  Future<AddCommunicationToCaseResponse> addCommunicationToCase({
    required String communicationBody,
    String? attachmentSetId,
    String? caseId,
    List<String>? ccEmailAddresses,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.AddCommunicationToCase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'communicationBody': communicationBody,
        if (attachmentSetId != null) 'attachmentSetId': attachmentSetId,
        if (caseId != null) 'caseId': caseId,
        if (ccEmailAddresses != null) 'ccEmailAddresses': ccEmailAddresses,
      },
    );

    return AddCommunicationToCaseResponse.fromJson(jsonResponse.body);
  }

  /// Creates a case in the Amazon Web Services Support Center. This operation
  /// is similar to how you create a case in the Amazon Web Services Support
  /// Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  ///
  /// The Amazon Web Services Support API doesn't support requesting service
  /// limit increases. You can submit a service limit increase in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// Submit a request from the Amazon Web Services Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  /// </li>
  /// <li>
  /// Use the Service Quotas <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_RequestServiceQuotaIncrease.html">RequestServiceQuotaIncrease</a>
  /// operation.
  /// </li>
  /// </ul>
  /// A successful <code>CreateCase</code> request returns an Amazon Web
  /// Services Support case number. You can use the <a>DescribeCases</a>
  /// operation and specify the case number to get existing Amazon Web Services
  /// Support cases. After you create a case, use the
  /// <a>AddCommunicationToCase</a> operation to add additional communication or
  /// attachments to an existing case.
  ///
  /// The <code>caseId</code> is separate from the <code>displayId</code> that
  /// appears in the <a href="https://console.aws.amazon.com/support">Amazon Web
  /// Services Support Center</a>. Use the <a>DescribeCases</a> operation to get
  /// the <code>displayId</code>.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [CaseCreationLimitExceeded].
  /// May throw [AttachmentSetIdNotFound].
  /// May throw [AttachmentSetExpired].
  ///
  /// Parameter [communicationBody] :
  /// The communication body text that describes the issue. This text appears in
  /// the <b>Description</b> field on the Amazon Web Services Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  ///
  /// Parameter [subject] :
  /// The title of the support case. The title appears in the <b>Subject</b>
  /// field on the Amazon Web Services Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  ///
  /// Parameter [attachmentSetId] :
  /// The ID of a set of one or more attachments for the case. Create the set by
  /// using the <a>AddAttachmentsToSet</a> operation.
  ///
  /// Parameter [categoryCode] :
  /// The category of problem for the support case. You also use the
  /// <a>DescribeServices</a> operation to get the category code for a service.
  /// Each Amazon Web Services service defines its own set of category codes.
  ///
  /// Parameter [ccEmailAddresses] :
  /// A list of email addresses that Amazon Web Services Support copies on case
  /// correspondence. Amazon Web Services Support identifies the account that
  /// creates the case when you specify your Amazon Web Services credentials in
  /// an HTTP POST method or use the <a
  /// href="http://aws.amazon.com/tools/">Amazon Web Services SDKs</a>.
  ///
  /// Parameter [issueType] :
  /// The type of issue for the case. You can specify
  /// <code>customer-service</code> or <code>technical</code>. If you don't
  /// specify a value, the default is <code>technical</code>.
  ///
  /// Parameter [language] :
  /// The language in which Amazon Web Services Support handles the case. Amazon
  /// Web Services Support currently supports Chinese (“zh”), English ("en"),
  /// Japanese ("ja") and Korean (“ko”). You must specify the ISO 639-1 code for
  /// the <code>language</code> parameter if you want support in that language.
  ///
  /// Parameter [serviceCode] :
  /// The code for the Amazon Web Services service. You can use the
  /// <a>DescribeServices</a> operation to get the possible
  /// <code>serviceCode</code> values.
  ///
  /// Parameter [severityCode] :
  /// A value that indicates the urgency of the case. This value determines the
  /// response time according to your service level agreement with Amazon Web
  /// Services Support. You can use the <a>DescribeSeverityLevels</a> operation
  /// to get the possible values for <code>severityCode</code>.
  ///
  /// For more information, see <a>SeverityLevel</a> and <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/getting-started.html#choosing-severity">Choosing
  /// a Severity</a> in the <i>Amazon Web Services Support User Guide</i>.
  /// <note>
  /// The availability of severity levels depends on the support plan for the
  /// Amazon Web Services account.
  /// </note>
  Future<CreateCaseResponse> createCase({
    required String communicationBody,
    required String subject,
    String? attachmentSetId,
    String? categoryCode,
    List<String>? ccEmailAddresses,
    String? issueType,
    String? language,
    String? serviceCode,
    String? severityCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.CreateCase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'communicationBody': communicationBody,
        'subject': subject,
        if (attachmentSetId != null) 'attachmentSetId': attachmentSetId,
        if (categoryCode != null) 'categoryCode': categoryCode,
        if (ccEmailAddresses != null) 'ccEmailAddresses': ccEmailAddresses,
        if (issueType != null) 'issueType': issueType,
        if (language != null) 'language': language,
        if (serviceCode != null) 'serviceCode': serviceCode,
        if (severityCode != null) 'severityCode': severityCode,
      },
    );

    return CreateCaseResponse.fromJson(jsonResponse.body);
  }

  /// Returns the attachment that has the specified ID. Attachments can include
  /// screenshots, error logs, or other files that describe your issue.
  /// Attachment IDs are generated by the case management system when you add an
  /// attachment to a case or case communication. Attachment IDs are returned in
  /// the <a>AttachmentDetails</a> objects that are returned by the
  /// <a>DescribeCommunications</a> operation.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [DescribeAttachmentLimitExceeded].
  /// May throw [AttachmentIdNotFound].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment to return. Attachment IDs are returned by the
  /// <a>DescribeCommunications</a> operation.
  Future<DescribeAttachmentResponse> describeAttachment({
    required String attachmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeAttachment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'attachmentId': attachmentId,
      },
    );

    return DescribeAttachmentResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of cases that you specify by passing one or more case IDs.
  /// You can use the <code>afterTime</code> and <code>beforeTime</code>
  /// parameters to filter the cases by date. You can set values for the
  /// <code>includeResolvedCases</code> and <code>includeCommunications</code>
  /// parameters to specify how much information to return.
  ///
  /// The response returns the following in JSON format:
  ///
  /// <ul>
  /// <li>
  /// One or more <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/APIReference/API_CaseDetails.html">CaseDetails</a>
  /// data types.
  /// </li>
  /// <li>
  /// One or more <code>nextToken</code> values, which specify where to paginate
  /// the returned records represented by the <code>CaseDetails</code> objects.
  /// </li>
  /// </ul>
  /// Case data is available for 12 months after creation. If a case was created
  /// more than 12 months ago, a request might return an error.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [CaseIdNotFound].
  ///
  /// Parameter [afterTime] :
  /// The start date for a filtered date search on support case communications.
  /// Case communications are available for 12 months after creation.
  ///
  /// Parameter [beforeTime] :
  /// The end date for a filtered date search on support case communications.
  /// Case communications are available for 12 months after creation.
  ///
  /// Parameter [caseIdList] :
  /// A list of ID numbers of the support cases you want returned. The maximum
  /// number of cases is 100.
  ///
  /// Parameter [displayId] :
  /// The ID displayed for a case in the Amazon Web Services Support Center user
  /// interface.
  ///
  /// Parameter [includeCommunications] :
  /// Specifies whether to include communications in the
  /// <code>DescribeCases</code> response. By default, communications are
  /// included.
  ///
  /// Parameter [includeResolvedCases] :
  /// Specifies whether to include resolved support cases in the
  /// <code>DescribeCases</code> response. By default, resolved cases aren't
  /// included.
  ///
  /// Parameter [language] :
  /// The language in which Amazon Web Services Support handles the case. Amazon
  /// Web Services Support currently supports Chinese (“zh”), English ("en"),
  /// Japanese ("ja") and Korean (“ko”). You must specify the ISO 639-1 code for
  /// the <code>language</code> parameter if you want support in that language.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return before paginating.
  ///
  /// Parameter [nextToken] :
  /// A resumption point for pagination.
  Future<DescribeCasesResponse> describeCases({
    String? afterTime,
    String? beforeTime,
    List<String>? caseIdList,
    String? displayId,
    bool? includeCommunications,
    bool? includeResolvedCases,
    String? language,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeCases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (afterTime != null) 'afterTime': afterTime,
        if (beforeTime != null) 'beforeTime': beforeTime,
        if (caseIdList != null) 'caseIdList': caseIdList,
        if (displayId != null) 'displayId': displayId,
        if (includeCommunications != null)
          'includeCommunications': includeCommunications,
        if (includeResolvedCases != null)
          'includeResolvedCases': includeResolvedCases,
        if (language != null) 'language': language,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeCasesResponse.fromJson(jsonResponse.body);
  }

  /// Returns communications and attachments for one or more support cases. Use
  /// the <code>afterTime</code> and <code>beforeTime</code> parameters to
  /// filter by date. You can use the <code>caseId</code> parameter to restrict
  /// the results to a specific case.
  ///
  /// Case data is available for 12 months after creation. If a case was created
  /// more than 12 months ago, a request for data might cause an error.
  ///
  /// You can use the <code>maxResults</code> and <code>nextToken</code>
  /// parameters to control the pagination of the results. Set
  /// <code>maxResults</code> to the number of cases that you want to display on
  /// each page, and use <code>nextToken</code> to specify the resumption of
  /// pagination.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [CaseIdNotFound].
  ///
  /// Parameter [caseId] :
  /// The support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  ///
  /// Parameter [afterTime] :
  /// The start date for a filtered date search on support case communications.
  /// Case communications are available for 12 months after creation.
  ///
  /// Parameter [beforeTime] :
  /// The end date for a filtered date search on support case communications.
  /// Case communications are available for 12 months after creation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return before paginating.
  ///
  /// Parameter [nextToken] :
  /// A resumption point for pagination.
  Future<DescribeCommunicationsResponse> describeCommunications({
    required String caseId,
    String? afterTime,
    String? beforeTime,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeCommunications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'caseId': caseId,
        if (afterTime != null) 'afterTime': afterTime,
        if (beforeTime != null) 'beforeTime': beforeTime,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeCommunicationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of CreateCaseOption types along with the corresponding
  /// supported hours and language availability. You can specify the
  /// <code>language</code> <code>categoryCode</code>, <code>issueType</code>
  /// and <code>serviceCode</code> used to retrieve the CreateCaseOptions.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [categoryCode] :
  /// The category of problem for the support case. You also use the
  /// <a>DescribeServices</a> operation to get the category code for a service.
  /// Each Amazon Web Services service defines its own set of category codes.
  ///
  /// Parameter [issueType] :
  /// The type of issue for the case. You can specify
  /// <code>customer-service</code> or <code>technical</code>. If you don't
  /// specify a value, the default is <code>technical</code>.
  ///
  /// Parameter [language] :
  /// The language in which Amazon Web Services Support handles the case. Amazon
  /// Web Services Support currently supports Chinese (“zh”), English ("en"),
  /// Japanese ("ja") and Korean (“ko”). You must specify the ISO 639-1 code for
  /// the <code>language</code> parameter if you want support in that language.
  ///
  /// Parameter [serviceCode] :
  /// The code for the Amazon Web Services service. You can use the
  /// <a>DescribeServices</a> operation to get the possible
  /// <code>serviceCode</code> values.
  Future<DescribeCreateCaseOptionsResponse> describeCreateCaseOptions({
    required String categoryCode,
    required String issueType,
    required String language,
    required String serviceCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeCreateCaseOptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'categoryCode': categoryCode,
        'issueType': issueType,
        'language': language,
        'serviceCode': serviceCode,
      },
    );

    return DescribeCreateCaseOptionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the current list of Amazon Web Services services and a list of
  /// service categories for each service. You then use service names and
  /// categories in your <a>CreateCase</a> requests. Each Amazon Web Services
  /// service has its own set of categories.
  ///
  /// The service codes and category codes correspond to the values that appear
  /// in the <b>Service</b> and <b>Category</b> lists on the Amazon Web Services
  /// Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page. The values in those fields don't necessarily match the
  /// service codes and categories returned by the <code>DescribeServices</code>
  /// operation. Always use the service codes and categories that the
  /// <code>DescribeServices</code> operation returns, so that you have the most
  /// recent set of service and category codes.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [language] :
  /// The language in which Amazon Web Services Support handles the case. Amazon
  /// Web Services Support currently supports Chinese (“zh”), English ("en"),
  /// Japanese ("ja") and Korean (“ko”). You must specify the ISO 639-1 code for
  /// the <code>language</code> parameter if you want support in that language.
  ///
  /// Parameter [serviceCodeList] :
  /// A JSON-formatted list of service codes available for Amazon Web Services
  /// services.
  Future<DescribeServicesResponse> describeServices({
    String? language,
    List<String>? serviceCodeList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (language != null) 'language': language,
        if (serviceCodeList != null) 'serviceCodeList': serviceCodeList,
      },
    );

    return DescribeServicesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the list of severity levels that you can assign to a support case.
  /// The severity level for a case is also a field in the <a>CaseDetails</a>
  /// data type that you include for a <a>CreateCase</a> request.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [language] :
  /// The language in which Amazon Web Services Support handles the case. Amazon
  /// Web Services Support currently supports Chinese (“zh”), English ("en"),
  /// Japanese ("ja") and Korean (“ko”). You must specify the ISO 639-1 code for
  /// the <code>language</code> parameter if you want support in that language.
  Future<DescribeSeverityLevelsResponse> describeSeverityLevels({
    String? language,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeSeverityLevels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (language != null) 'language': language,
      },
    );

    return DescribeSeverityLevelsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of supported languages for a specified
  /// <code>categoryCode</code>, <code>issueType</code> and
  /// <code>serviceCode</code>. The returned supported languages will include a
  /// ISO 639-1 code for the <code>language</code>, and the language display
  /// name.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [categoryCode] :
  /// The category of problem for the support case. You also use the
  /// <a>DescribeServices</a> operation to get the category code for a service.
  /// Each Amazon Web Services service defines its own set of category codes.
  ///
  /// Parameter [issueType] :
  /// The type of issue for the case. You can specify
  /// <code>customer-service</code> or <code>technical</code>.
  ///
  /// Parameter [serviceCode] :
  /// The code for the Amazon Web Services service. You can use the
  /// <a>DescribeServices</a> operation to get the possible
  /// <code>serviceCode</code> values.
  Future<DescribeSupportedLanguagesResponse> describeSupportedLanguages({
    required String categoryCode,
    required String issueType,
    required String serviceCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeSupportedLanguages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'categoryCode': categoryCode,
        'issueType': issueType,
        'serviceCode': serviceCode,
      },
    );

    return DescribeSupportedLanguagesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the refresh status of the Trusted Advisor checks that have the
  /// specified check IDs. You can get the check IDs by calling the
  /// <a>DescribeTrustedAdvisorChecks</a> operation.
  ///
  /// Some checks are refreshed automatically, and you can't return their
  /// refresh statuses by using the
  /// <code>DescribeTrustedAdvisorCheckRefreshStatuses</code> operation. If you
  /// call this operation for these checks, you might see an
  /// <code>InvalidParameterValue</code> error.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  /// To call the Trusted Advisor operations in the Amazon Web Services Support
  /// API, you must use the US East (N. Virginia) endpoint. Currently, the US
  /// West (Oregon) and Europe (Ireland) endpoints don't support the Trusted
  /// Advisor operations. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint">About
  /// the Amazon Web Services Support API</a> in the <i>Amazon Web Services
  /// Support User Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [checkIds] :
  /// The IDs of the Trusted Advisor checks to get the status.
  /// <note>
  /// If you specify the check ID of a check that is automatically refreshed,
  /// you might see an <code>InvalidParameterValue</code> error.
  /// </note>
  Future<DescribeTrustedAdvisorCheckRefreshStatusesResponse>
      describeTrustedAdvisorCheckRefreshStatuses({
    required List<String> checkIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSupport_20130415.DescribeTrustedAdvisorCheckRefreshStatuses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'checkIds': checkIds,
      },
    );

    return DescribeTrustedAdvisorCheckRefreshStatusesResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the results of the Trusted Advisor check that has the specified
  /// check ID. You can get the check IDs by calling the
  /// <a>DescribeTrustedAdvisorChecks</a> operation.
  ///
  /// The response contains a <a>TrustedAdvisorCheckResult</a> object, which
  /// contains these three objects:
  ///
  /// <ul>
  /// <li>
  /// <a>TrustedAdvisorCategorySpecificSummary</a>
  /// </li>
  /// <li>
  /// <a>TrustedAdvisorResourceDetail</a>
  /// </li>
  /// <li>
  /// <a>TrustedAdvisorResourcesSummary</a>
  /// </li>
  /// </ul>
  /// In addition, the response contains these fields:
  ///
  /// <ul>
  /// <li>
  /// <b>status</b> - The alert status of the check can be <code>ok</code>
  /// (green), <code>warning</code> (yellow), <code>error</code> (red), or
  /// <code>not_available</code>.
  /// </li>
  /// <li>
  /// <b>timestamp</b> - The time of the last refresh of the check.
  /// </li>
  /// <li>
  /// <b>checkId</b> - The unique identifier for the check.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  /// To call the Trusted Advisor operations in the Amazon Web Services Support
  /// API, you must use the US East (N. Virginia) endpoint. Currently, the US
  /// West (Oregon) and Europe (Ireland) endpoints don't support the Trusted
  /// Advisor operations. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint">About
  /// the Amazon Web Services Support API</a> in the <i>Amazon Web Services
  /// Support User Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [checkId] :
  /// The unique identifier for the Trusted Advisor check.
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language that you want your check results to
  /// appear in.
  ///
  /// The Amazon Web Services Support API currently supports the following
  /// languages for Trusted Advisor:
  ///
  /// <ul>
  /// <li>
  /// Chinese, Simplified - <code>zh</code>
  /// </li>
  /// <li>
  /// Chinese, Traditional - <code>zh_TW</code>
  /// </li>
  /// <li>
  /// English - <code>en</code>
  /// </li>
  /// <li>
  /// French - <code>fr</code>
  /// </li>
  /// <li>
  /// German - <code>de</code>
  /// </li>
  /// <li>
  /// Indonesian - <code>id</code>
  /// </li>
  /// <li>
  /// Italian - <code>it</code>
  /// </li>
  /// <li>
  /// Japanese - <code>ja</code>
  /// </li>
  /// <li>
  /// Korean - <code>ko</code>
  /// </li>
  /// <li>
  /// Portuguese, Brazilian - <code>pt_BR</code>
  /// </li>
  /// <li>
  /// Spanish - <code>es</code>
  /// </li>
  /// </ul>
  Future<DescribeTrustedAdvisorCheckResultResponse>
      describeTrustedAdvisorCheckResult({
    required String checkId,
    String? language,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeTrustedAdvisorCheckResult'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'checkId': checkId,
        if (language != null) 'language': language,
      },
    );

    return DescribeTrustedAdvisorCheckResultResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the results for the Trusted Advisor check summaries for the check
  /// IDs that you specified. You can get the check IDs by calling the
  /// <a>DescribeTrustedAdvisorChecks</a> operation.
  ///
  /// The response contains an array of <a>TrustedAdvisorCheckSummary</a>
  /// objects.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  /// To call the Trusted Advisor operations in the Amazon Web Services Support
  /// API, you must use the US East (N. Virginia) endpoint. Currently, the US
  /// West (Oregon) and Europe (Ireland) endpoints don't support the Trusted
  /// Advisor operations. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint">About
  /// the Amazon Web Services Support API</a> in the <i>Amazon Web Services
  /// Support User Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [checkIds] :
  /// The IDs of the Trusted Advisor checks.
  Future<DescribeTrustedAdvisorCheckSummariesResponse>
      describeTrustedAdvisorCheckSummaries({
    required List<String> checkIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeTrustedAdvisorCheckSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'checkIds': checkIds,
      },
    );

    return DescribeTrustedAdvisorCheckSummariesResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns information about all available Trusted Advisor checks, including
  /// the name, ID, category, description, and metadata. You must specify a
  /// language code.
  ///
  /// The response contains a <a>TrustedAdvisorCheckDescription</a> object for
  /// each check. You must set the Amazon Web Services Region to us-east-1.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// <li>
  /// The names and descriptions for Trusted Advisor checks are subject to
  /// change. We recommend that you specify the check ID in your code to
  /// uniquely identify a check.
  /// </li>
  /// </ul> </note>
  /// To call the Trusted Advisor operations in the Amazon Web Services Support
  /// API, you must use the US East (N. Virginia) endpoint. Currently, the US
  /// West (Oregon) and Europe (Ireland) endpoints don't support the Trusted
  /// Advisor operations. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint">About
  /// the Amazon Web Services Support API</a> in the <i>Amazon Web Services
  /// Support User Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language that you want your checks to appear
  /// in.
  ///
  /// The Amazon Web Services Support API currently supports the following
  /// languages for Trusted Advisor:
  ///
  /// <ul>
  /// <li>
  /// Chinese, Simplified - <code>zh</code>
  /// </li>
  /// <li>
  /// Chinese, Traditional - <code>zh_TW</code>
  /// </li>
  /// <li>
  /// English - <code>en</code>
  /// </li>
  /// <li>
  /// French - <code>fr</code>
  /// </li>
  /// <li>
  /// German - <code>de</code>
  /// </li>
  /// <li>
  /// Indonesian - <code>id</code>
  /// </li>
  /// <li>
  /// Italian - <code>it</code>
  /// </li>
  /// <li>
  /// Japanese - <code>ja</code>
  /// </li>
  /// <li>
  /// Korean - <code>ko</code>
  /// </li>
  /// <li>
  /// Portuguese, Brazilian - <code>pt_BR</code>
  /// </li>
  /// <li>
  /// Spanish - <code>es</code>
  /// </li>
  /// </ul>
  Future<DescribeTrustedAdvisorChecksResponse> describeTrustedAdvisorChecks({
    required String language,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.DescribeTrustedAdvisorChecks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'language': language,
      },
    );

    return DescribeTrustedAdvisorChecksResponse.fromJson(jsonResponse.body);
  }

  /// Refreshes the Trusted Advisor check that you specify using the check ID.
  /// You can get the check IDs by calling the
  /// <a>DescribeTrustedAdvisorChecks</a> operation.
  ///
  /// Some checks are refreshed automatically. If you call the
  /// <code>RefreshTrustedAdvisorCheck</code> operation to refresh them, you
  /// might see the <code>InvalidParameterValue</code> error.
  ///
  /// The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  /// To call the Trusted Advisor operations in the Amazon Web Services Support
  /// API, you must use the US East (N. Virginia) endpoint. Currently, the US
  /// West (Oregon) and Europe (Ireland) endpoints don't support the Trusted
  /// Advisor operations. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint">About
  /// the Amazon Web Services Support API</a> in the <i>Amazon Web Services
  /// Support User Guide</i>.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [checkId] :
  /// The unique identifier for the Trusted Advisor check to refresh.
  /// <note>
  /// Specifying the check ID of a check that is automatically refreshed causes
  /// an <code>InvalidParameterValue</code> error.
  /// </note>
  Future<RefreshTrustedAdvisorCheckResponse> refreshTrustedAdvisorCheck({
    required String checkId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.RefreshTrustedAdvisorCheck'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'checkId': checkId,
      },
    );

    return RefreshTrustedAdvisorCheckResponse.fromJson(jsonResponse.body);
  }

  /// Resolves a support case. This operation takes a <code>caseId</code> and
  /// returns the initial and final state of the case.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business, Enterprise On-Ramp, or Enterprise Support plan
  /// to use the Amazon Web Services Support API.
  /// </li>
  /// <li>
  /// If you call the Amazon Web Services Support API from an account that
  /// doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
  /// the <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">Amazon Web Services
  /// Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [CaseIdNotFound].
  ///
  /// Parameter [caseId] :
  /// The support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  Future<ResolveCaseResponse> resolveCase({
    String? caseId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSupport_20130415.ResolveCase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (caseId != null) 'caseId': caseId,
      },
    );

    return ResolveCaseResponse.fromJson(jsonResponse.body);
  }
}

/// The ID and expiry time of the attachment set returned by the
/// <a>AddAttachmentsToSet</a> operation.
class AddAttachmentsToSetResponse {
  /// The ID of the attachment set. If an <code>attachmentSetId</code> was not
  /// specified, a new attachment set is created, and the ID of the set is
  /// returned in the response. If an <code>attachmentSetId</code> was specified,
  /// the attachments are added to the specified set, if it exists.
  final String? attachmentSetId;

  /// The time and date when the attachment set expires.
  final String? expiryTime;

  AddAttachmentsToSetResponse({
    this.attachmentSetId,
    this.expiryTime,
  });

  factory AddAttachmentsToSetResponse.fromJson(Map<String, dynamic> json) {
    return AddAttachmentsToSetResponse(
      attachmentSetId: json['attachmentSetId'] as String?,
      expiryTime: json['expiryTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentSetId = this.attachmentSetId;
    final expiryTime = this.expiryTime;
    return {
      if (attachmentSetId != null) 'attachmentSetId': attachmentSetId,
      if (expiryTime != null) 'expiryTime': expiryTime,
    };
  }
}

/// The result of the <a>AddCommunicationToCase</a> operation.
class AddCommunicationToCaseResponse {
  /// True if <a>AddCommunicationToCase</a> succeeds. Otherwise, returns an error.
  final bool? result;

  AddCommunicationToCaseResponse({
    this.result,
  });

  factory AddCommunicationToCaseResponse.fromJson(Map<String, dynamic> json) {
    return AddCommunicationToCaseResponse(
      result: json['result'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      if (result != null) 'result': result,
    };
  }
}

/// An attachment to a case communication. The attachment consists of the file
/// name and the content of the file.
class Attachment {
  /// The content of the attachment file.
  final Uint8List? data;

  /// The name of the attachment file.
  final String? fileName;

  Attachment({
    this.data,
    this.fileName,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      data: _s.decodeNullableUint8List(json['data'] as String?),
      fileName: json['fileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final fileName = this.fileName;
    return {
      if (data != null) 'data': base64Encode(data),
      if (fileName != null) 'fileName': fileName,
    };
  }
}

/// The file name and ID of an attachment to a case communication. You can use
/// the ID to retrieve the attachment with the <a>DescribeAttachment</a>
/// operation.
class AttachmentDetails {
  /// The ID of the attachment.
  final String? attachmentId;

  /// The file name of the attachment.
  final String? fileName;

  AttachmentDetails({
    this.attachmentId,
    this.fileName,
  });

  factory AttachmentDetails.fromJson(Map<String, dynamic> json) {
    return AttachmentDetails(
      attachmentId: json['attachmentId'] as String?,
      fileName: json['fileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final fileName = this.fileName;
    return {
      if (attachmentId != null) 'attachmentId': attachmentId,
      if (fileName != null) 'fileName': fileName,
    };
  }
}

/// A JSON-formatted object that contains the metadata for a support case. It is
/// contained in the response from a <a>DescribeCases</a> request.
/// <b>CaseDetails</b> contains the following fields:
///
/// <ul>
/// <li>
/// <b>caseId</b> - The support case ID requested or returned in the call. The
/// case ID is an alphanumeric string formatted as shown in this example:
/// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>.
/// </li>
/// <li>
/// <b>categoryCode</b> - The category of problem for the support case.
/// Corresponds to the <code>CategoryCode</code> values returned by a call to
/// <a>DescribeServices</a>.
/// </li>
/// <li>
/// <b>displayId</b> - The identifier for the case on pages in the Amazon Web
/// Services Support Center.
/// </li>
/// <li>
/// <b>language</b> - The language in which Amazon Web Services Support handles
/// the case. Amazon Web Services Support currently supports Chinese (“zh”),
/// English ("en"), Japanese ("ja") and Korean (“ko”). You must specify the ISO
/// 639-1 code for the <code>language</code> parameter if you want support in
/// that language.
/// </li>
/// <li>
/// <b>nextToken</b> - A resumption point for pagination.
/// </li>
/// <li>
/// <b>recentCommunications</b> - One or more <a>Communication</a> objects.
/// Fields of these objects are <code>attachments</code>, <code>body</code>,
/// <code>caseId</code>, <code>submittedBy</code>, and <code>timeCreated</code>.
/// </li>
/// <li>
/// <b>serviceCode</b> - The identifier for the Amazon Web Services service that
/// corresponds to the service code defined in the call to
/// <a>DescribeServices</a>.
/// </li>
/// <li>
/// <b>severityCode</b> - The severity code assigned to the case. Contains one
/// of the values returned by the call to <a>DescribeSeverityLevels</a>. The
/// possible values are: <code>low</code>, <code>normal</code>,
/// <code>high</code>, <code>urgent</code>, and <code>critical</code>.
/// </li>
/// <li>
/// <b>status</b> - The status of the case in the Amazon Web Services Support
/// Center. Valid values:
///
/// <ul>
/// <li>
/// <code>opened</code>
/// </li>
/// <li>
/// <code>pending-customer-action</code>
/// </li>
/// <li>
/// <code>reopened</code>
/// </li>
/// <li>
/// <code>resolved</code>
/// </li>
/// <li>
/// <code>unassigned</code>
/// </li>
/// <li>
/// <code>work-in-progress</code>
/// </li>
/// </ul> </li>
/// <li>
/// <b>subject</b> - The subject line of the case.
/// </li>
/// <li>
/// <b>submittedBy</b> - The email address of the account that submitted the
/// case.
/// </li>
/// <li>
/// <b>timeCreated</b> - The time the case was created, in ISO-8601 format.
/// </li>
/// </ul>
class CaseDetails {
  /// The support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  final String? caseId;

  /// The category of problem for the support case.
  final String? categoryCode;

  /// The email addresses that receive copies of communication about the case.
  final List<String>? ccEmailAddresses;

  /// The ID displayed for the case in the Amazon Web Services Support Center.
  /// This is a numeric string.
  final String? displayId;

  /// The language in which Amazon Web Services Support handles the case. Amazon
  /// Web Services Support currently supports Chinese (“zh”), English ("en"),
  /// Japanese ("ja") and Korean (“ko”). You must specify the ISO 639-1 code for
  /// the <code>language</code> parameter if you want support in that language.
  final String? language;

  /// The five most recent communications between you and Amazon Web Services
  /// Support Center, including the IDs of any attachments to the communications.
  /// Also includes a <code>nextToken</code> that you can use to retrieve earlier
  /// communications.
  final RecentCaseCommunications? recentCommunications;

  /// The code for the Amazon Web Services service. You can get a list of codes
  /// and the corresponding service names by calling <a>DescribeServices</a>.
  final String? serviceCode;

  /// The code for the severity level returned by the call to
  /// <a>DescribeSeverityLevels</a>.
  final String? severityCode;

  /// The status of the case.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>opened</code>
  /// </li>
  /// <li>
  /// <code>pending-customer-action</code>
  /// </li>
  /// <li>
  /// <code>reopened</code>
  /// </li>
  /// <li>
  /// <code>resolved</code>
  /// </li>
  /// <li>
  /// <code>unassigned</code>
  /// </li>
  /// <li>
  /// <code>work-in-progress</code>
  /// </li>
  /// </ul>
  final String? status;

  /// The subject line for the case in the Amazon Web Services Support Center.
  final String? subject;

  /// The email address of the account that submitted the case.
  final String? submittedBy;

  /// The time that the case was created in the Amazon Web Services Support
  /// Center.
  final String? timeCreated;

  CaseDetails({
    this.caseId,
    this.categoryCode,
    this.ccEmailAddresses,
    this.displayId,
    this.language,
    this.recentCommunications,
    this.serviceCode,
    this.severityCode,
    this.status,
    this.subject,
    this.submittedBy,
    this.timeCreated,
  });

  factory CaseDetails.fromJson(Map<String, dynamic> json) {
    return CaseDetails(
      caseId: json['caseId'] as String?,
      categoryCode: json['categoryCode'] as String?,
      ccEmailAddresses: (json['ccEmailAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      displayId: json['displayId'] as String?,
      language: json['language'] as String?,
      recentCommunications: json['recentCommunications'] != null
          ? RecentCaseCommunications.fromJson(
              json['recentCommunications'] as Map<String, dynamic>)
          : null,
      serviceCode: json['serviceCode'] as String?,
      severityCode: json['severityCode'] as String?,
      status: json['status'] as String?,
      subject: json['subject'] as String?,
      submittedBy: json['submittedBy'] as String?,
      timeCreated: json['timeCreated'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    final categoryCode = this.categoryCode;
    final ccEmailAddresses = this.ccEmailAddresses;
    final displayId = this.displayId;
    final language = this.language;
    final recentCommunications = this.recentCommunications;
    final serviceCode = this.serviceCode;
    final severityCode = this.severityCode;
    final status = this.status;
    final subject = this.subject;
    final submittedBy = this.submittedBy;
    final timeCreated = this.timeCreated;
    return {
      if (caseId != null) 'caseId': caseId,
      if (categoryCode != null) 'categoryCode': categoryCode,
      if (ccEmailAddresses != null) 'ccEmailAddresses': ccEmailAddresses,
      if (displayId != null) 'displayId': displayId,
      if (language != null) 'language': language,
      if (recentCommunications != null)
        'recentCommunications': recentCommunications,
      if (serviceCode != null) 'serviceCode': serviceCode,
      if (severityCode != null) 'severityCode': severityCode,
      if (status != null) 'status': status,
      if (subject != null) 'subject': subject,
      if (submittedBy != null) 'submittedBy': submittedBy,
      if (timeCreated != null) 'timeCreated': timeCreated,
    };
  }
}

/// A JSON-formatted name/value pair that represents the category name and
/// category code of the problem, selected from the <a>DescribeServices</a>
/// response for each Amazon Web Services service.
class Category {
  /// The category code for the support case.
  final String? code;

  /// The category name for the support case.
  final String? name;

  Category({
    this.code,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    };
  }
}

/// A communication associated with a support case. The communication consists
/// of the case ID, the message body, attachment information, the submitter of
/// the communication, and the date and time of the communication.
class Communication {
  /// Information about the attachments to the case communication.
  final List<AttachmentDetails>? attachmentSet;

  /// The text of the communication between the customer and Amazon Web Services
  /// Support.
  final String? body;

  /// The support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  final String? caseId;

  /// The identity of the account that submitted, or responded to, the support
  /// case. Customer entries include the IAM role as well as the email address
  /// (for example, "AdminRole (Role) &lt;janedoe@example.com&gt;). Entries from
  /// the Amazon Web Services Support team display "Amazon Web Services," and
  /// don't show an email address.
  final String? submittedBy;

  /// The time the communication was created.
  final String? timeCreated;

  Communication({
    this.attachmentSet,
    this.body,
    this.caseId,
    this.submittedBy,
    this.timeCreated,
  });

  factory Communication.fromJson(Map<String, dynamic> json) {
    return Communication(
      attachmentSet: (json['attachmentSet'] as List?)
          ?.whereNotNull()
          .map((e) => AttachmentDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      body: json['body'] as String?,
      caseId: json['caseId'] as String?,
      submittedBy: json['submittedBy'] as String?,
      timeCreated: json['timeCreated'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentSet = this.attachmentSet;
    final body = this.body;
    final caseId = this.caseId;
    final submittedBy = this.submittedBy;
    final timeCreated = this.timeCreated;
    return {
      if (attachmentSet != null) 'attachmentSet': attachmentSet,
      if (body != null) 'body': body,
      if (caseId != null) 'caseId': caseId,
      if (submittedBy != null) 'submittedBy': submittedBy,
      if (timeCreated != null) 'timeCreated': timeCreated,
    };
  }
}

/// A JSON-formatted object that contains the CommunicationTypeOptions for
/// creating a case for a certain communication channel. It is contained in the
/// response from a <a>DescribeCreateCaseOptions</a> request.
/// <b>CommunicationTypeOptions</b> contains the following fields:
///
/// <ul>
/// <li>
/// <b>datesWithoutSupport</b> - A JSON-formatted list containing date and time
/// ranges for periods without support in UTC time. Date and time format is RFC
/// 3339 : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.
/// </li>
/// <li>
/// <b>supportedHours</b> - A JSON-formatted list containing time ranges when
/// support are available. Time format is RFC 3339 : 'HH:mm:ss.SSS'.
/// </li>
/// <li>
/// <b>type</b> - A string value indicating the communication type that the
/// aforementioned rules apply to. At the moment the type value can assume one
/// of 3 values at the moment <code>chat</code>, <code>web</code> and
/// <code>call</code>.
/// </li>
/// </ul>
class CommunicationTypeOptions {
  /// A JSON-formatted list containing date and time ranges for periods without
  /// support
  final List<DateInterval>? datesWithoutSupport;

  /// A JSON-formatted list containing time ranges when support is available.
  final List<SupportedHour>? supportedHours;

  /// A string value indicating the communication type. At the moment the type
  /// value can assume one of 3 values at the moment chat, web and call.
  final String? type;

  CommunicationTypeOptions({
    this.datesWithoutSupport,
    this.supportedHours,
    this.type,
  });

  factory CommunicationTypeOptions.fromJson(Map<String, dynamic> json) {
    return CommunicationTypeOptions(
      datesWithoutSupport: (json['datesWithoutSupport'] as List?)
          ?.whereNotNull()
          .map((e) => DateInterval.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedHours: (json['supportedHours'] as List?)
          ?.whereNotNull()
          .map((e) => SupportedHour.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datesWithoutSupport = this.datesWithoutSupport;
    final supportedHours = this.supportedHours;
    final type = this.type;
    return {
      if (datesWithoutSupport != null)
        'datesWithoutSupport': datesWithoutSupport,
      if (supportedHours != null) 'supportedHours': supportedHours,
      if (type != null) 'type': type,
    };
  }
}

/// The support case ID returned by a successful completion of the
/// <a>CreateCase</a> operation.
class CreateCaseResponse {
  /// The support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string in the following format:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  final String? caseId;

  CreateCaseResponse({
    this.caseId,
  });

  factory CreateCaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateCaseResponse(
      caseId: json['caseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    return {
      if (caseId != null) 'caseId': caseId,
    };
  }
}

/// Date and time (UTC) format in RFC 3339 : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.
class DateInterval {
  /// End Date Time (UTC). RFC 3339 format : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.
  final String? endDateTime;

  /// A JSON object containing start and date time (UTC). Date and time format is
  /// RFC 3339 : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.
  final String? startDateTime;

  DateInterval({
    this.endDateTime,
    this.startDateTime,
  });

  factory DateInterval.fromJson(Map<String, dynamic> json) {
    return DateInterval(
      endDateTime: json['endDateTime'] as String?,
      startDateTime: json['startDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endDateTime = this.endDateTime;
    final startDateTime = this.startDateTime;
    return {
      if (endDateTime != null) 'endDateTime': endDateTime,
      if (startDateTime != null) 'startDateTime': startDateTime,
    };
  }
}

/// The content and file name of the attachment returned by the
/// <a>DescribeAttachment</a> operation.
class DescribeAttachmentResponse {
  /// This object includes the attachment content and file name.
  ///
  /// In the previous response syntax, the value for the <code>data</code>
  /// parameter appears as <code>blob</code>, which is represented as a
  /// base64-encoded string. The value for <code>fileName</code> is the name of
  /// the attachment, such as <code>troubleshoot-screenshot.png</code>.
  final Attachment? attachment;

  DescribeAttachmentResponse({
    this.attachment,
  });

  factory DescribeAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAttachmentResponse(
      attachment: json['attachment'] != null
          ? Attachment.fromJson(json['attachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    return {
      if (attachment != null) 'attachment': attachment,
    };
  }
}

/// Returns an array of <a
/// href="https://docs.aws.amazon.com/awssupport/latest/APIReference/API_CaseDetails.html">CaseDetails</a>
/// objects and a <code>nextToken</code> that defines a point for pagination in
/// the result set.
class DescribeCasesResponse {
  /// The details for the cases that match the request.
  final List<CaseDetails>? cases;

  /// A resumption point for pagination.
  final String? nextToken;

  DescribeCasesResponse({
    this.cases,
    this.nextToken,
  });

  factory DescribeCasesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCasesResponse(
      cases: (json['cases'] as List?)
          ?.whereNotNull()
          .map((e) => CaseDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cases = this.cases;
    final nextToken = this.nextToken;
    return {
      if (cases != null) 'cases': cases,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The communications returned by the <a>DescribeCommunications</a> operation.
class DescribeCommunicationsResponse {
  /// The communications for the case.
  final List<Communication>? communications;

  /// A resumption point for pagination.
  final String? nextToken;

  DescribeCommunicationsResponse({
    this.communications,
    this.nextToken,
  });

  factory DescribeCommunicationsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCommunicationsResponse(
      communications: (json['communications'] as List?)
          ?.whereNotNull()
          .map((e) => Communication.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final communications = this.communications;
    final nextToken = this.nextToken;
    return {
      if (communications != null) 'communications': communications,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeCreateCaseOptionsResponse {
  /// A JSON-formatted array that contains the available communication type
  /// options, along with the available support timeframes for the given inputs.
  final List<CommunicationTypeOptions>? communicationTypes;

  /// Language availability can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// available
  /// </li>
  /// <li>
  /// best_effort
  /// </li>
  /// <li>
  /// unavailable
  /// </li>
  /// </ul>
  final String? languageAvailability;

  DescribeCreateCaseOptionsResponse({
    this.communicationTypes,
    this.languageAvailability,
  });

  factory DescribeCreateCaseOptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCreateCaseOptionsResponse(
      communicationTypes: (json['communicationTypes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CommunicationTypeOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      languageAvailability: json['languageAvailability'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final communicationTypes = this.communicationTypes;
    final languageAvailability = this.languageAvailability;
    return {
      if (communicationTypes != null) 'communicationTypes': communicationTypes,
      if (languageAvailability != null)
        'languageAvailability': languageAvailability,
    };
  }
}

/// The list of Amazon Web Services services returned by the
/// <a>DescribeServices</a> operation.
class DescribeServicesResponse {
  /// A JSON-formatted list of Amazon Web Services services.
  final List<Service>? services;

  DescribeServicesResponse({
    this.services,
  });

  factory DescribeServicesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServicesResponse(
      services: (json['services'] as List?)
          ?.whereNotNull()
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final services = this.services;
    return {
      if (services != null) 'services': services,
    };
  }
}

/// The list of severity levels returned by the <a>DescribeSeverityLevels</a>
/// operation.
class DescribeSeverityLevelsResponse {
  /// The available severity levels for the support case. Available severity
  /// levels are defined by your service level agreement with Amazon Web Services.
  final List<SeverityLevel>? severityLevels;

  DescribeSeverityLevelsResponse({
    this.severityLevels,
  });

  factory DescribeSeverityLevelsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSeverityLevelsResponse(
      severityLevels: (json['severityLevels'] as List?)
          ?.whereNotNull()
          .map((e) => SeverityLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final severityLevels = this.severityLevels;
    return {
      if (severityLevels != null) 'severityLevels': severityLevels,
    };
  }
}

class DescribeSupportedLanguagesResponse {
  /// A JSON-formatted array that contains the available ISO 639-1 language codes.
  final List<SupportedLanguage>? supportedLanguages;

  DescribeSupportedLanguagesResponse({
    this.supportedLanguages,
  });

  factory DescribeSupportedLanguagesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSupportedLanguagesResponse(
      supportedLanguages: (json['supportedLanguages'] as List?)
          ?.whereNotNull()
          .map((e) => SupportedLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final supportedLanguages = this.supportedLanguages;
    return {
      if (supportedLanguages != null) 'supportedLanguages': supportedLanguages,
    };
  }
}

/// The statuses of the Trusted Advisor checks returned by the
/// <a>DescribeTrustedAdvisorCheckRefreshStatuses</a> operation.
class DescribeTrustedAdvisorCheckRefreshStatusesResponse {
  /// The refresh status of the specified Trusted Advisor checks.
  final List<TrustedAdvisorCheckRefreshStatus> statuses;

  DescribeTrustedAdvisorCheckRefreshStatusesResponse({
    required this.statuses,
  });

  factory DescribeTrustedAdvisorCheckRefreshStatusesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTrustedAdvisorCheckRefreshStatusesResponse(
      statuses: (json['statuses'] as List)
          .whereNotNull()
          .map((e) => TrustedAdvisorCheckRefreshStatus.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statuses = this.statuses;
    return {
      'statuses': statuses,
    };
  }
}

/// The result of the Trusted Advisor check returned by the
/// <a>DescribeTrustedAdvisorCheckResult</a> operation.
class DescribeTrustedAdvisorCheckResultResponse {
  /// The detailed results of the Trusted Advisor check.
  final TrustedAdvisorCheckResult? result;

  DescribeTrustedAdvisorCheckResultResponse({
    this.result,
  });

  factory DescribeTrustedAdvisorCheckResultResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTrustedAdvisorCheckResultResponse(
      result: json['result'] != null
          ? TrustedAdvisorCheckResult.fromJson(
              json['result'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      if (result != null) 'result': result,
    };
  }
}

/// The summaries of the Trusted Advisor checks returned by the
/// <a>DescribeTrustedAdvisorCheckSummaries</a> operation.
class DescribeTrustedAdvisorCheckSummariesResponse {
  /// The summary information for the requested Trusted Advisor checks.
  final List<TrustedAdvisorCheckSummary> summaries;

  DescribeTrustedAdvisorCheckSummariesResponse({
    required this.summaries,
  });

  factory DescribeTrustedAdvisorCheckSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTrustedAdvisorCheckSummariesResponse(
      summaries: (json['summaries'] as List)
          .whereNotNull()
          .map((e) =>
              TrustedAdvisorCheckSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final summaries = this.summaries;
    return {
      'summaries': summaries,
    };
  }
}

/// Information about the Trusted Advisor checks returned by the
/// <a>DescribeTrustedAdvisorChecks</a> operation.
class DescribeTrustedAdvisorChecksResponse {
  /// Information about all available Trusted Advisor checks.
  final List<TrustedAdvisorCheckDescription> checks;

  DescribeTrustedAdvisorChecksResponse({
    required this.checks,
  });

  factory DescribeTrustedAdvisorChecksResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTrustedAdvisorChecksResponse(
      checks: (json['checks'] as List)
          .whereNotNull()
          .map((e) => TrustedAdvisorCheckDescription.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final checks = this.checks;
    return {
      'checks': checks,
    };
  }
}

/// The five most recent communications associated with the case.
class RecentCaseCommunications {
  /// The five most recent communications associated with the case.
  final List<Communication>? communications;

  /// A resumption point for pagination.
  final String? nextToken;

  RecentCaseCommunications({
    this.communications,
    this.nextToken,
  });

  factory RecentCaseCommunications.fromJson(Map<String, dynamic> json) {
    return RecentCaseCommunications(
      communications: (json['communications'] as List?)
          ?.whereNotNull()
          .map((e) => Communication.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final communications = this.communications;
    final nextToken = this.nextToken;
    return {
      if (communications != null) 'communications': communications,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The current refresh status of a Trusted Advisor check.
class RefreshTrustedAdvisorCheckResponse {
  /// The current refresh status for a check, including the amount of time until
  /// the check is eligible for refresh.
  final TrustedAdvisorCheckRefreshStatus status;

  RefreshTrustedAdvisorCheckResponse({
    required this.status,
  });

  factory RefreshTrustedAdvisorCheckResponse.fromJson(
      Map<String, dynamic> json) {
    return RefreshTrustedAdvisorCheckResponse(
      status: TrustedAdvisorCheckRefreshStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// The status of the case returned by the <a>ResolveCase</a> operation.
class ResolveCaseResponse {
  /// The status of the case after the <a>ResolveCase</a> request was processed.
  final String? finalCaseStatus;

  /// The status of the case when the <a>ResolveCase</a> request was sent.
  final String? initialCaseStatus;

  ResolveCaseResponse({
    this.finalCaseStatus,
    this.initialCaseStatus,
  });

  factory ResolveCaseResponse.fromJson(Map<String, dynamic> json) {
    return ResolveCaseResponse(
      finalCaseStatus: json['finalCaseStatus'] as String?,
      initialCaseStatus: json['initialCaseStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final finalCaseStatus = this.finalCaseStatus;
    final initialCaseStatus = this.initialCaseStatus;
    return {
      if (finalCaseStatus != null) 'finalCaseStatus': finalCaseStatus,
      if (initialCaseStatus != null) 'initialCaseStatus': initialCaseStatus,
    };
  }
}

/// Information about an Amazon Web Services service returned by the
/// <a>DescribeServices</a> operation.
class Service {
  /// A list of categories that describe the type of support issue a case
  /// describes. Categories consist of a category name and a category code.
  /// Category names and codes are passed to Amazon Web Services Support when you
  /// call <a>CreateCase</a>.
  final List<Category>? categories;

  /// The code for an Amazon Web Services service returned by the
  /// <a>DescribeServices</a> response. The <code>name</code> element contains the
  /// corresponding friendly name.
  final String? code;

  /// The friendly name for an Amazon Web Services service. The <code>code</code>
  /// element contains the corresponding code.
  final String? name;

  Service({
    this.categories,
    this.code,
    this.name,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      categories: (json['categories'] as List?)
          ?.whereNotNull()
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final code = this.code;
    final name = this.name;
    return {
      if (categories != null) 'categories': categories,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    };
  }
}

/// A code and name pair that represents the severity level of a support case.
/// The available values depend on the support plan for the account. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/awssupport/latest/user/case-management.html#choosing-severity">Choosing
/// a severity</a> in the <i>Amazon Web Services Support User Guide</i>.
class SeverityLevel {
  /// The code for case severity level.
  ///
  /// Valid values: <code>low</code> | <code>normal</code> | <code>high</code> |
  /// <code>urgent</code> | <code>critical</code>
  final String? code;

  /// The name of the severity level that corresponds to the severity level code.
  /// <note>
  /// The values returned by the API are different from the values that appear in
  /// the Amazon Web Services Support Center. For example, the API uses the code
  /// <code>low</code>, but the name appears as General guidance in Support
  /// Center.
  ///
  /// The following are the API code names and how they appear in the console:
  ///
  /// <ul>
  /// <li>
  /// <code>low</code> - General guidance
  /// </li>
  /// <li>
  /// <code>normal</code> - System impaired
  /// </li>
  /// <li>
  /// <code>high</code> - Production system impaired
  /// </li>
  /// <li>
  /// <code>urgent</code> - Production system down
  /// </li>
  /// <li>
  /// <code>critical</code> - Business-critical system down
  /// </li>
  /// </ul> </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/case-management.html#choosing-severity">Choosing
  /// a severity</a> in the <i>Amazon Web Services Support User Guide</i>.
  final String? name;

  SeverityLevel({
    this.code,
    this.name,
  });

  factory SeverityLevel.fromJson(Map<String, dynamic> json) {
    return SeverityLevel(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    };
  }
}

/// Time range object with <code>startTime</code> and <code>endTime</code> range
/// in RFC 3339 format. <code>'HH:mm:ss.SSS'</code>.
class SupportedHour {
  /// End Time. RFC 3339 format <code>'HH:mm:ss.SSS'</code>.
  final String? endTime;

  /// Start Time. RFC 3339 format <code>'HH:mm:ss.SSS'</code>.
  final String? startTime;

  SupportedHour({
    this.endTime,
    this.startTime,
  });

  factory SupportedHour.fromJson(Map<String, dynamic> json) {
    return SupportedHour(
      endTime: json['endTime'] as String?,
      startTime: json['startTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'endTime': endTime,
      if (startTime != null) 'startTime': startTime,
    };
  }
}

/// A JSON-formatted object that contains the available ISO 639-1 language
/// <code>code</code>, <code>language</code> name and langauge
/// <code>display</code> value. The language code is what should be used in the
/// <a>CreateCase</a> call.
class SupportedLanguage {
  /// 2 digit ISO 639-1 code. e.g. <code>en</code>
  final String? code;

  /// Language display value e.g. <code>ENGLISH</code>
  final String? display;

  /// Full language description e.g. <code>ENGLISH</code>
  final String? language;

  SupportedLanguage({
    this.code,
    this.display,
    this.language,
  });

  factory SupportedLanguage.fromJson(Map<String, dynamic> json) {
    return SupportedLanguage(
      code: json['code'] as String?,
      display: json['display'] as String?,
      language: json['language'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final display = this.display;
    final language = this.language;
    return {
      if (code != null) 'code': code,
      if (display != null) 'display': display,
      if (language != null) 'language': language,
    };
  }
}

/// The container for summary information that relates to the category of the
/// Trusted Advisor check.
class TrustedAdvisorCategorySpecificSummary {
  /// The summary information about cost savings for a Trusted Advisor check that
  /// is in the Cost Optimizing category.
  final TrustedAdvisorCostOptimizingSummary? costOptimizing;

  TrustedAdvisorCategorySpecificSummary({
    this.costOptimizing,
  });

  factory TrustedAdvisorCategorySpecificSummary.fromJson(
      Map<String, dynamic> json) {
    return TrustedAdvisorCategorySpecificSummary(
      costOptimizing: json['costOptimizing'] != null
          ? TrustedAdvisorCostOptimizingSummary.fromJson(
              json['costOptimizing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final costOptimizing = this.costOptimizing;
    return {
      if (costOptimizing != null) 'costOptimizing': costOptimizing,
    };
  }
}

/// The description and metadata for a Trusted Advisor check.
class TrustedAdvisorCheckDescription {
  /// The category of the Trusted Advisor check.
  final String category;

  /// The description of the Trusted Advisor check, which includes the alert
  /// criteria and recommended operations (contains HTML markup).
  final String description;

  /// The unique identifier for the Trusted Advisor check.
  final String id;

  /// The column headings for the data returned by the Trusted Advisor check. The
  /// order of the headings corresponds to the order of the data in the
  /// <b>Metadata</b> element of the <a>TrustedAdvisorResourceDetail</a> for the
  /// check. <b>Metadata</b> contains all the data that is shown in the Excel
  /// download, even in those cases where the UI shows just summary data.
  final List<String> metadata;

  /// The display name for the Trusted Advisor check.
  final String name;

  TrustedAdvisorCheckDescription({
    required this.category,
    required this.description,
    required this.id,
    required this.metadata,
    required this.name,
  });

  factory TrustedAdvisorCheckDescription.fromJson(Map<String, dynamic> json) {
    return TrustedAdvisorCheckDescription(
      category: json['category'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      metadata: (json['metadata'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final description = this.description;
    final id = this.id;
    final metadata = this.metadata;
    final name = this.name;
    return {
      'category': category,
      'description': description,
      'id': id,
      'metadata': metadata,
      'name': name,
    };
  }
}

/// The refresh status of a Trusted Advisor check.
class TrustedAdvisorCheckRefreshStatus {
  /// The unique identifier for the Trusted Advisor check.
  final String checkId;

  /// The amount of time, in milliseconds, until the Trusted Advisor check is
  /// eligible for refresh.
  final int millisUntilNextRefreshable;

  /// The status of the Trusted Advisor check for which a refresh has been
  /// requested:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code> - The check is not refreshed or the non-success status
  /// exceeds the timeout
  /// </li>
  /// <li>
  /// <code>enqueued</code> - The check refresh requests has entered the refresh
  /// queue
  /// </li>
  /// <li>
  /// <code>processing</code> - The check refresh request is picked up by the rule
  /// processing engine
  /// </li>
  /// <li>
  /// <code>success</code> - The check is successfully refreshed
  /// </li>
  /// <li>
  /// <code>abandoned</code> - The check refresh has failed
  /// </li>
  /// </ul>
  final String status;

  TrustedAdvisorCheckRefreshStatus({
    required this.checkId,
    required this.millisUntilNextRefreshable,
    required this.status,
  });

  factory TrustedAdvisorCheckRefreshStatus.fromJson(Map<String, dynamic> json) {
    return TrustedAdvisorCheckRefreshStatus(
      checkId: json['checkId'] as String,
      millisUntilNextRefreshable: json['millisUntilNextRefreshable'] as int,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final checkId = this.checkId;
    final millisUntilNextRefreshable = this.millisUntilNextRefreshable;
    final status = this.status;
    return {
      'checkId': checkId,
      'millisUntilNextRefreshable': millisUntilNextRefreshable,
      'status': status,
    };
  }
}

/// The results of a Trusted Advisor check returned by
/// <a>DescribeTrustedAdvisorCheckResult</a>.
class TrustedAdvisorCheckResult {
  /// Summary information that relates to the category of the check. Cost
  /// Optimizing is the only category that is currently supported.
  final TrustedAdvisorCategorySpecificSummary categorySpecificSummary;

  /// The unique identifier for the Trusted Advisor check.
  final String checkId;

  /// The details about each resource listed in the check result.
  final List<TrustedAdvisorResourceDetail> flaggedResources;
  final TrustedAdvisorResourcesSummary resourcesSummary;

  /// The alert status of the check: "ok" (green), "warning" (yellow), "error"
  /// (red), or "not_available".
  final String status;

  /// The time of the last refresh of the check.
  final String timestamp;

  TrustedAdvisorCheckResult({
    required this.categorySpecificSummary,
    required this.checkId,
    required this.flaggedResources,
    required this.resourcesSummary,
    required this.status,
    required this.timestamp,
  });

  factory TrustedAdvisorCheckResult.fromJson(Map<String, dynamic> json) {
    return TrustedAdvisorCheckResult(
      categorySpecificSummary: TrustedAdvisorCategorySpecificSummary.fromJson(
          json['categorySpecificSummary'] as Map<String, dynamic>),
      checkId: json['checkId'] as String,
      flaggedResources: (json['flaggedResources'] as List)
          .whereNotNull()
          .map((e) =>
              TrustedAdvisorResourceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourcesSummary: TrustedAdvisorResourcesSummary.fromJson(
          json['resourcesSummary'] as Map<String, dynamic>),
      status: json['status'] as String,
      timestamp: json['timestamp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final categorySpecificSummary = this.categorySpecificSummary;
    final checkId = this.checkId;
    final flaggedResources = this.flaggedResources;
    final resourcesSummary = this.resourcesSummary;
    final status = this.status;
    final timestamp = this.timestamp;
    return {
      'categorySpecificSummary': categorySpecificSummary,
      'checkId': checkId,
      'flaggedResources': flaggedResources,
      'resourcesSummary': resourcesSummary,
      'status': status,
      'timestamp': timestamp,
    };
  }
}

/// A summary of a Trusted Advisor check result, including the alert status,
/// last refresh, and number of resources examined.
class TrustedAdvisorCheckSummary {
  /// Summary information that relates to the category of the check. Cost
  /// Optimizing is the only category that is currently supported.
  final TrustedAdvisorCategorySpecificSummary categorySpecificSummary;

  /// The unique identifier for the Trusted Advisor check.
  final String checkId;
  final TrustedAdvisorResourcesSummary resourcesSummary;

  /// The alert status of the check: "ok" (green), "warning" (yellow), "error"
  /// (red), or "not_available".
  final String status;

  /// The time of the last refresh of the check.
  final String timestamp;

  /// Specifies whether the Trusted Advisor check has flagged resources.
  final bool? hasFlaggedResources;

  TrustedAdvisorCheckSummary({
    required this.categorySpecificSummary,
    required this.checkId,
    required this.resourcesSummary,
    required this.status,
    required this.timestamp,
    this.hasFlaggedResources,
  });

  factory TrustedAdvisorCheckSummary.fromJson(Map<String, dynamic> json) {
    return TrustedAdvisorCheckSummary(
      categorySpecificSummary: TrustedAdvisorCategorySpecificSummary.fromJson(
          json['categorySpecificSummary'] as Map<String, dynamic>),
      checkId: json['checkId'] as String,
      resourcesSummary: TrustedAdvisorResourcesSummary.fromJson(
          json['resourcesSummary'] as Map<String, dynamic>),
      status: json['status'] as String,
      timestamp: json['timestamp'] as String,
      hasFlaggedResources: json['hasFlaggedResources'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final categorySpecificSummary = this.categorySpecificSummary;
    final checkId = this.checkId;
    final resourcesSummary = this.resourcesSummary;
    final status = this.status;
    final timestamp = this.timestamp;
    final hasFlaggedResources = this.hasFlaggedResources;
    return {
      'categorySpecificSummary': categorySpecificSummary,
      'checkId': checkId,
      'resourcesSummary': resourcesSummary,
      'status': status,
      'timestamp': timestamp,
      if (hasFlaggedResources != null)
        'hasFlaggedResources': hasFlaggedResources,
    };
  }
}

/// The estimated cost savings that might be realized if the recommended
/// operations are taken.
class TrustedAdvisorCostOptimizingSummary {
  /// The estimated monthly savings that might be realized if the recommended
  /// operations are taken.
  final double estimatedMonthlySavings;

  /// The estimated percentage of savings that might be realized if the
  /// recommended operations are taken.
  final double estimatedPercentMonthlySavings;

  TrustedAdvisorCostOptimizingSummary({
    required this.estimatedMonthlySavings,
    required this.estimatedPercentMonthlySavings,
  });

  factory TrustedAdvisorCostOptimizingSummary.fromJson(
      Map<String, dynamic> json) {
    return TrustedAdvisorCostOptimizingSummary(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double,
      estimatedPercentMonthlySavings:
          json['estimatedPercentMonthlySavings'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final estimatedPercentMonthlySavings = this.estimatedPercentMonthlySavings;
    return {
      'estimatedMonthlySavings': estimatedMonthlySavings,
      'estimatedPercentMonthlySavings': estimatedPercentMonthlySavings,
    };
  }
}

/// Contains information about a resource identified by a Trusted Advisor check.
class TrustedAdvisorResourceDetail {
  /// Additional information about the identified resource. The exact metadata and
  /// its order can be obtained by inspecting the
  /// <a>TrustedAdvisorCheckDescription</a> object returned by the call to
  /// <a>DescribeTrustedAdvisorChecks</a>. <b>Metadata</b> contains all the data
  /// that is shown in the Excel download, even in those cases where the UI shows
  /// just summary data.
  final List<String> metadata;

  /// The unique identifier for the identified resource.
  final String resourceId;

  /// The status code for the resource identified in the Trusted Advisor check.
  final String status;

  /// Specifies whether the Amazon Web Services resource was ignored by Trusted
  /// Advisor because it was marked as suppressed by the user.
  final bool? isSuppressed;

  /// The Amazon Web Services Region in which the identified resource is located.
  final String? region;

  TrustedAdvisorResourceDetail({
    required this.metadata,
    required this.resourceId,
    required this.status,
    this.isSuppressed,
    this.region,
  });

  factory TrustedAdvisorResourceDetail.fromJson(Map<String, dynamic> json) {
    return TrustedAdvisorResourceDetail(
      metadata: (json['metadata'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceId: json['resourceId'] as String,
      status: json['status'] as String,
      isSuppressed: json['isSuppressed'] as bool?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final resourceId = this.resourceId;
    final status = this.status;
    final isSuppressed = this.isSuppressed;
    final region = this.region;
    return {
      'metadata': metadata,
      'resourceId': resourceId,
      'status': status,
      if (isSuppressed != null) 'isSuppressed': isSuppressed,
      if (region != null) 'region': region,
    };
  }
}

/// Details about Amazon Web Services resources that were analyzed in a call to
/// Trusted Advisor <a>DescribeTrustedAdvisorCheckSummaries</a>.
class TrustedAdvisorResourcesSummary {
  /// The number of Amazon Web Services resources that were flagged (listed) by
  /// the Trusted Advisor check.
  final int resourcesFlagged;

  /// The number of Amazon Web Services resources ignored by Trusted Advisor
  /// because information was unavailable.
  final int resourcesIgnored;

  /// The number of Amazon Web Services resources that were analyzed by the
  /// Trusted Advisor check.
  final int resourcesProcessed;

  /// The number of Amazon Web Services resources ignored by Trusted Advisor
  /// because they were marked as suppressed by the user.
  final int resourcesSuppressed;

  TrustedAdvisorResourcesSummary({
    required this.resourcesFlagged,
    required this.resourcesIgnored,
    required this.resourcesProcessed,
    required this.resourcesSuppressed,
  });

  factory TrustedAdvisorResourcesSummary.fromJson(Map<String, dynamic> json) {
    return TrustedAdvisorResourcesSummary(
      resourcesFlagged: json['resourcesFlagged'] as int,
      resourcesIgnored: json['resourcesIgnored'] as int,
      resourcesProcessed: json['resourcesProcessed'] as int,
      resourcesSuppressed: json['resourcesSuppressed'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcesFlagged = this.resourcesFlagged;
    final resourcesIgnored = this.resourcesIgnored;
    final resourcesProcessed = this.resourcesProcessed;
    final resourcesSuppressed = this.resourcesSuppressed;
    return {
      'resourcesFlagged': resourcesFlagged,
      'resourcesIgnored': resourcesIgnored,
      'resourcesProcessed': resourcesProcessed,
      'resourcesSuppressed': resourcesSuppressed,
    };
  }
}

class AttachmentIdNotFound extends _s.GenericAwsException {
  AttachmentIdNotFound({String? type, String? message})
      : super(type: type, code: 'AttachmentIdNotFound', message: message);
}

class AttachmentLimitExceeded extends _s.GenericAwsException {
  AttachmentLimitExceeded({String? type, String? message})
      : super(type: type, code: 'AttachmentLimitExceeded', message: message);
}

class AttachmentSetExpired extends _s.GenericAwsException {
  AttachmentSetExpired({String? type, String? message})
      : super(type: type, code: 'AttachmentSetExpired', message: message);
}

class AttachmentSetIdNotFound extends _s.GenericAwsException {
  AttachmentSetIdNotFound({String? type, String? message})
      : super(type: type, code: 'AttachmentSetIdNotFound', message: message);
}

class AttachmentSetSizeLimitExceeded extends _s.GenericAwsException {
  AttachmentSetSizeLimitExceeded({String? type, String? message})
      : super(
            type: type,
            code: 'AttachmentSetSizeLimitExceeded',
            message: message);
}

class CaseCreationLimitExceeded extends _s.GenericAwsException {
  CaseCreationLimitExceeded({String? type, String? message})
      : super(type: type, code: 'CaseCreationLimitExceeded', message: message);
}

class CaseIdNotFound extends _s.GenericAwsException {
  CaseIdNotFound({String? type, String? message})
      : super(type: type, code: 'CaseIdNotFound', message: message);
}

class DescribeAttachmentLimitExceeded extends _s.GenericAwsException {
  DescribeAttachmentLimitExceeded({String? type, String? message})
      : super(
            type: type,
            code: 'DescribeAttachmentLimitExceeded',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AttachmentIdNotFound': (type, message) =>
      AttachmentIdNotFound(type: type, message: message),
  'AttachmentLimitExceeded': (type, message) =>
      AttachmentLimitExceeded(type: type, message: message),
  'AttachmentSetExpired': (type, message) =>
      AttachmentSetExpired(type: type, message: message),
  'AttachmentSetIdNotFound': (type, message) =>
      AttachmentSetIdNotFound(type: type, message: message),
  'AttachmentSetSizeLimitExceeded': (type, message) =>
      AttachmentSetSizeLimitExceeded(type: type, message: message),
  'CaseCreationLimitExceeded': (type, message) =>
      CaseCreationLimitExceeded(type: type, message: message),
  'CaseIdNotFound': (type, message) =>
      CaseIdNotFound(type: type, message: message),
  'DescribeAttachmentLimitExceeded': (type, message) =>
      DescribeAttachmentLimitExceeded(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
