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

part '2013-04-15.g.dart';

/// The AWS Support API reference is intended for programmers who need detailed
/// information about the AWS Support operations and data types. This service
/// enables you to manage your AWS Support cases programmatically. It uses HTTP
/// methods that return results in JSON format.
/// <note>
/// <ul>
/// <li>
/// You must have a Business or Enterprise support plan to use the AWS Support
/// API.
/// </li>
/// <li>
/// If you call the AWS Support API from an account that does not have a
/// Business or Enterprise support plan, the
/// <code>SubscriptionRequiredException</code> error message appears. For
/// information about changing your support plan, see <a
/// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
/// </li>
/// </ul> </note>
/// The AWS Support service also exposes a set of <a
/// href="http://aws.amazon.com/premiumsupport/trustedadvisor/">AWS Trusted
/// Advisor</a> features. You can retrieve a list of checks and their
/// descriptions, get check results, specify checks to refresh, and get the
/// refresh status of checks.
class Support {
  final _s.JsonProtocol _protocol;
  Support({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'support',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds one or more attachments to an attachment set.
  ///
  /// An attachment set is a temporary container for attachments that you add to
  /// a case or case communication. The set is available for 1 hour after it's
  /// created. The <code>expiryTime</code> returned in the response is when the
  /// set expires.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
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
    @_s.required List<Attachment> attachments,
    String attachmentSetId,
  }) async {
    ArgumentError.checkNotNull(attachments, 'attachments');
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

  /// Adds additional customer communication to an AWS Support case. Use the
  /// <code>caseId</code> parameter to identify the case to which to add
  /// communication. You can list a set of email addresses to copy on the
  /// communication by using the <code>ccEmailAddresses</code> parameter. The
  /// <code>communicationBody</code> value contains the text of the
  /// communication.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
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
  /// The AWS Support case ID requested or returned in the call. The case ID is
  /// an alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  ///
  /// Parameter [ccEmailAddresses] :
  /// The email addresses in the CC line of an email to be added to the support
  /// case.
  Future<AddCommunicationToCaseResponse> addCommunicationToCase({
    @_s.required String communicationBody,
    String attachmentSetId,
    String caseId,
    List<String> ccEmailAddresses,
  }) async {
    ArgumentError.checkNotNull(communicationBody, 'communicationBody');
    _s.validateStringLength(
      'communicationBody',
      communicationBody,
      1,
      8000,
      isRequired: true,
    );
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

  /// Creates a case in the AWS Support Center. This operation is similar to how
  /// you create a case in the AWS Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  ///
  /// The AWS Support API doesn't support requesting service limit increases.
  /// You can submit a service limit increase in the following ways:
  ///
  /// <ul>
  /// <li>
  /// Submit a request from the AWS Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  /// </li>
  /// <li>
  /// Use the Service Quotas <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_RequestServiceQuotaIncrease.html">RequestServiceQuotaIncrease</a>
  /// operation.
  /// </li>
  /// </ul>
  /// A successful <code>CreateCase</code> request returns an AWS Support case
  /// number. You can use the <a>DescribeCases</a> operation and specify the
  /// case number to get existing AWS Support cases. After you create a case,
  /// use the <a>AddCommunicationToCase</a> operation to add additional
  /// communication or attachments to an existing case.
  ///
  /// The <code>caseId</code> is separate from the <code>displayId</code> that
  /// appears in the <a href="https://console.aws.amazon.com/support">AWS
  /// Support Center</a>. Use the <a>DescribeCases</a> operation to get the
  /// <code>displayId</code>.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
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
  /// the <b>Description</b> field on the AWS Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  ///
  /// Parameter [subject] :
  /// The title of the AWS Support case. The title appears in the <b>Subject</b>
  /// field on the AWS Support Center <a
  /// href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page.
  ///
  /// Parameter [attachmentSetId] :
  /// The ID of a set of one or more attachments for the case. Create the set by
  /// using the <a>AddAttachmentsToSet</a> operation.
  ///
  /// Parameter [categoryCode] :
  /// The category of problem for the AWS Support case. You also use the
  /// <a>DescribeServices</a> operation to get the category code for a service.
  /// Each AWS service defines its own set of category codes.
  ///
  /// Parameter [ccEmailAddresses] :
  /// A list of email addresses that AWS Support copies on case correspondence.
  /// AWS Support identifies the account that creates the case when you specify
  /// your AWS credentials in an HTTP POST method or use the <a
  /// href="http://aws.amazon.com/tools/">AWS SDKs</a>.
  ///
  /// Parameter [issueType] :
  /// The type of issue for the case. You can specify
  /// <code>customer-service</code> or <code>technical</code>. If you don't
  /// specify a value, the default is <code>technical</code>.
  ///
  /// Parameter [language] :
  /// The language in which AWS Support handles the case. You must specify the
  /// ISO 639-1 code for the <code>language</code> parameter if you want support
  /// in that language. Currently, English ("en") and Japanese ("ja") are
  /// supported.
  ///
  /// Parameter [serviceCode] :
  /// The code for the AWS service. You can use the <a>DescribeServices</a>
  /// operation to get the possible <code>serviceCode</code> values.
  ///
  /// Parameter [severityCode] :
  /// A value that indicates the urgency of the case. This value determines the
  /// response time according to your service level agreement with AWS Support.
  /// You can use the <a>DescribeSeverityLevels</a> operation to get the
  /// possible values for <code>severityCode</code>.
  ///
  /// For more information, see <a>SeverityLevel</a> and <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/getting-started.html#choosing-severity">Choosing
  /// a Severity</a> in the <i>AWS Support User Guide</i>.
  /// <note>
  /// The availability of severity levels depends on the support plan for the
  /// AWS account.
  /// </note>
  Future<CreateCaseResponse> createCase({
    @_s.required String communicationBody,
    @_s.required String subject,
    String attachmentSetId,
    String categoryCode,
    List<String> ccEmailAddresses,
    String issueType,
    String language,
    String serviceCode,
    String severityCode,
  }) async {
    ArgumentError.checkNotNull(communicationBody, 'communicationBody');
    _s.validateStringLength(
      'communicationBody',
      communicationBody,
      1,
      8000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(subject, 'subject');
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
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
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
    @_s.required String attachmentId,
  }) async {
    ArgumentError.checkNotNull(attachmentId, 'attachmentId');
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
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
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
  /// The ID displayed for a case in the AWS Support Center user interface.
  ///
  /// Parameter [includeCommunications] :
  /// Specifies whether to include communications in the
  /// <code>DescribeCases</code> response. By default, communications are
  /// incuded.
  ///
  /// Parameter [includeResolvedCases] :
  /// Specifies whether to include resolved support cases in the
  /// <code>DescribeCases</code> response. By default, resolved cases aren't
  /// included.
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language in which AWS provides support. AWS
  /// Support currently supports English ("en") and Japanese ("ja"). Language
  /// parameters must be passed explicitly for operations that take them.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return before paginating.
  ///
  /// Parameter [nextToken] :
  /// A resumption point for pagination.
  Future<DescribeCasesResponse> describeCases({
    String afterTime,
    String beforeTime,
    List<String> caseIdList,
    String displayId,
    bool includeCommunications,
    bool includeResolvedCases,
    String language,
    int maxResults,
    String nextToken,
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
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [CaseIdNotFound].
  ///
  /// Parameter [caseId] :
  /// The AWS Support case ID requested or returned in the call. The case ID is
  /// an alphanumeric string formatted as shown in this example:
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
    @_s.required String caseId,
    String afterTime,
    String beforeTime,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(caseId, 'caseId');
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

  /// Returns the current list of AWS services and a list of service categories
  /// for each service. You then use service names and categories in your
  /// <a>CreateCase</a> requests. Each AWS service has its own set of
  /// categories.
  ///
  /// The service codes and category codes correspond to the values that appear
  /// in the <b>Service</b> and <b>Category</b> lists on the AWS Support Center
  /// <a href="https://console.aws.amazon.com/support/home#/case/create">Create
  /// Case</a> page. The values in those fields don't necessarily match the
  /// service codes and categories returned by the <code>DescribeServices</code>
  /// operation. Always use the service codes and categories that the
  /// <code>DescribeServices</code> operation returns, so that you have the most
  /// recent set of service and category codes.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language in which AWS provides support. AWS
  /// Support currently supports English ("en") and Japanese ("ja"). Language
  /// parameters must be passed explicitly for operations that take them.
  ///
  /// Parameter [serviceCodeList] :
  /// A JSON-formatted list of service codes available for AWS services.
  Future<DescribeServicesResponse> describeServices({
    String language,
    List<String> serviceCodeList,
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

  /// Returns the list of severity levels that you can assign to an AWS Support
  /// case. The severity level for a case is also a field in the
  /// <a>CaseDetails</a> data type that you include for a <a>CreateCase</a>
  /// request.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language in which AWS provides support. AWS
  /// Support currently supports English ("en") and Japanese ("ja"). Language
  /// parameters must be passed explicitly for operations that take them.
  Future<DescribeSeverityLevelsResponse> describeSeverityLevels({
    String language,
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

  /// Returns the refresh status of the AWS Trusted Advisor checks that have the
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
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [checkIds] :
  /// The IDs of the Trusted Advisor checks to get the status of.
  /// <note>
  /// If you specify the check ID of a check that is automatically refreshed,
  /// you might see an <code>InvalidParameterValue</code> error.
  /// </note>
  Future<DescribeTrustedAdvisorCheckRefreshStatusesResponse>
      describeTrustedAdvisorCheckRefreshStatuses({
    @_s.required List<String> checkIds,
  }) async {
    ArgumentError.checkNotNull(checkIds, 'checkIds');
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

  /// Returns the results of the AWS Trusted Advisor check that has the
  /// specified check ID. You can get the check IDs by calling the
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
  /// <b>status</b> - The alert status of the check: "ok" (green), "warning"
  /// (yellow), "error" (red), or "not_available".
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
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [checkId] :
  /// The unique identifier for the Trusted Advisor check.
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language in which AWS provides support. AWS
  /// Support currently supports English ("en") and Japanese ("ja"). Language
  /// parameters must be passed explicitly for operations that take them.
  Future<DescribeTrustedAdvisorCheckResultResponse>
      describeTrustedAdvisorCheckResult({
    @_s.required String checkId,
    String language,
  }) async {
    ArgumentError.checkNotNull(checkId, 'checkId');
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

  /// Returns the results for the AWS Trusted Advisor check summaries for the
  /// check IDs that you specified. You can get the check IDs by calling the
  /// <a>DescribeTrustedAdvisorChecks</a> operation.
  ///
  /// The response contains an array of <a>TrustedAdvisorCheckSummary</a>
  /// objects.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [checkIds] :
  /// The IDs of the Trusted Advisor checks.
  Future<DescribeTrustedAdvisorCheckSummariesResponse>
      describeTrustedAdvisorCheckSummaries({
    @_s.required List<String> checkIds,
  }) async {
    ArgumentError.checkNotNull(checkIds, 'checkIds');
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

  /// Returns information about all available AWS Trusted Advisor checks,
  /// including the name, ID, category, description, and metadata. You must
  /// specify a language code. The AWS Support API currently supports English
  /// ("en") and Japanese ("ja"). The response contains a
  /// <a>TrustedAdvisorCheckDescription</a> object for each check. You must set
  /// the AWS Region to us-east-1.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language in which AWS provides support. AWS
  /// Support currently supports English ("en") and Japanese ("ja"). Language
  /// parameters must be passed explicitly for operations that take them.
  Future<DescribeTrustedAdvisorChecksResponse> describeTrustedAdvisorChecks({
    @_s.required String language,
  }) async {
    ArgumentError.checkNotNull(language, 'language');
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

  /// Refreshes the AWS Trusted Advisor check that you specify using the check
  /// ID. You can get the check IDs by calling the
  /// <a>DescribeTrustedAdvisorChecks</a> operation.
  /// <note>
  /// Some checks are refreshed automatically. If you call the
  /// <code>RefreshTrustedAdvisorCheck</code> operation to refresh them, you
  /// might see the <code>InvalidParameterValue</code> error.
  /// </note>
  /// The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [checkId] :
  /// The unique identifier for the Trusted Advisor check to refresh.
  /// <b>Note:</b> Specifying the check ID of a check that is automatically
  /// refreshed causes an <code>InvalidParameterValue</code> error.
  Future<RefreshTrustedAdvisorCheckResponse> refreshTrustedAdvisorCheck({
    @_s.required String checkId,
  }) async {
    ArgumentError.checkNotNull(checkId, 'checkId');
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
  /// You must have a Business or Enterprise support plan to use the AWS Support
  /// API.
  /// </li>
  /// <li>
  /// If you call the AWS Support API from an account that does not have a
  /// Business or Enterprise support plan, the
  /// <code>SubscriptionRequiredException</code> error message appears. For
  /// information about changing your support plan, see <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [CaseIdNotFound].
  ///
  /// Parameter [caseId] :
  /// The AWS Support case ID requested or returned in the call. The case ID is
  /// an alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  Future<ResolveCaseResponse> resolveCase({
    String caseId,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddAttachmentsToSetResponse {
  /// The ID of the attachment set. If an <code>attachmentSetId</code> was not
  /// specified, a new attachment set is created, and the ID of the set is
  /// returned in the response. If an <code>attachmentSetId</code> was specified,
  /// the attachments are added to the specified set, if it exists.
  @_s.JsonKey(name: 'attachmentSetId')
  final String attachmentSetId;

  /// The time and date when the attachment set expires.
  @_s.JsonKey(name: 'expiryTime')
  final String expiryTime;

  AddAttachmentsToSetResponse({
    this.attachmentSetId,
    this.expiryTime,
  });
  factory AddAttachmentsToSetResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAttachmentsToSetResponseFromJson(json);
}

/// The result of the <a>AddCommunicationToCase</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddCommunicationToCaseResponse {
  /// True if <a>AddCommunicationToCase</a> succeeds. Otherwise, returns an error.
  @_s.JsonKey(name: 'result')
  final bool result;

  AddCommunicationToCaseResponse({
    this.result,
  });
  factory AddCommunicationToCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCommunicationToCaseResponseFromJson(json);
}

/// An attachment to a case communication. The attachment consists of the file
/// name and the content of the file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Attachment {
  /// The content of the attachment file.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'data')
  final Uint8List data;

  /// The name of the attachment file.
  @_s.JsonKey(name: 'fileName')
  final String fileName;

  Attachment({
    this.data,
    this.fileName,
  });
  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

/// The file name and ID of an attachment to a case communication. You can use
/// the ID to retrieve the attachment with the <a>DescribeAttachment</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachmentDetails {
  /// The ID of the attachment.
  @_s.JsonKey(name: 'attachmentId')
  final String attachmentId;

  /// The file name of the attachment.
  @_s.JsonKey(name: 'fileName')
  final String fileName;

  AttachmentDetails({
    this.attachmentId,
    this.fileName,
  });
  factory AttachmentDetails.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDetailsFromJson(json);
}

/// A JSON-formatted object that contains the metadata for a support case. It is
/// contained in the response from a <a>DescribeCases</a> request.
/// <b>CaseDetails</b> contains the following fields:
///
/// <ul>
/// <li>
/// <b>caseId.</b> The AWS Support case ID requested or returned in the call.
/// The case ID is an alphanumeric string formatted as shown in this example:
/// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>.
/// </li>
/// <li>
/// <b>categoryCode.</b> The category of problem for the AWS Support case.
/// Corresponds to the CategoryCode values returned by a call to
/// <a>DescribeServices</a>.
/// </li>
/// <li>
/// <b>displayId.</b> The identifier for the case on pages in the AWS Support
/// Center.
/// </li>
/// <li>
/// <b>language.</b> The ISO 639-1 code for the language in which AWS provides
/// support. AWS Support currently supports English ("en") and Japanese ("ja").
/// Language parameters must be passed explicitly for operations that take them.
/// </li>
/// <li>
/// <b>nextToken.</b> A resumption point for pagination.
/// </li>
/// <li>
/// <b>recentCommunications.</b> One or more <a>Communication</a> objects.
/// Fields of these objects are <code>attachments</code>, <code>body</code>,
/// <code>caseId</code>, <code>submittedBy</code>, and <code>timeCreated</code>.
/// </li>
/// <li>
/// <b>serviceCode.</b> The identifier for the AWS service that corresponds to
/// the service code defined in the call to <a>DescribeServices</a>.
/// </li>
/// <li>
/// <b>severityCode.</b> The severity code assigned to the case. Contains one of
/// the values returned by the call to <a>DescribeSeverityLevels</a>. The
/// possible values are: <code>low</code>, <code>normal</code>,
/// <code>high</code>, <code>urgent</code>, and <code>critical</code>.
/// </li>
/// <li>
/// <b>status.</b> The status of the case in the AWS Support Center. Valid
/// values:
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
/// <b>subject.</b> The subject line of the case.
/// </li>
/// <li>
/// <b>submittedBy.</b> The email address of the account that submitted the
/// case.
/// </li>
/// <li>
/// <b>timeCreated.</b> The time the case was created, in ISO-8601 format.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CaseDetails {
  /// The AWS Support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  @_s.JsonKey(name: 'caseId')
  final String caseId;

  /// The category of problem for the AWS Support case.
  @_s.JsonKey(name: 'categoryCode')
  final String categoryCode;

  /// The email addresses that receive copies of communication about the case.
  @_s.JsonKey(name: 'ccEmailAddresses')
  final List<String> ccEmailAddresses;

  /// The ID displayed for the case in the AWS Support Center. This is a numeric
  /// string.
  @_s.JsonKey(name: 'displayId')
  final String displayId;

  /// The ISO 639-1 code for the language in which AWS provides support. AWS
  /// Support currently supports English ("en") and Japanese ("ja"). Language
  /// parameters must be passed explicitly for operations that take them.
  @_s.JsonKey(name: 'language')
  final String language;

  /// The five most recent communications between you and AWS Support Center,
  /// including the IDs of any attachments to the communications. Also includes a
  /// <code>nextToken</code> that you can use to retrieve earlier communications.
  @_s.JsonKey(name: 'recentCommunications')
  final RecentCaseCommunications recentCommunications;

  /// The code for the AWS service. You can get a list of codes and the
  /// corresponding service names by calling <a>DescribeServices</a>.
  @_s.JsonKey(name: 'serviceCode')
  final String serviceCode;

  /// The code for the severity level returned by the call to
  /// <a>DescribeSeverityLevels</a>.
  @_s.JsonKey(name: 'severityCode')
  final String severityCode;

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
  @_s.JsonKey(name: 'status')
  final String status;

  /// The subject line for the case in the AWS Support Center.
  @_s.JsonKey(name: 'subject')
  final String subject;

  /// The email address of the account that submitted the case.
  @_s.JsonKey(name: 'submittedBy')
  final String submittedBy;

  /// The time that the case was created in the AWS Support Center.
  @_s.JsonKey(name: 'timeCreated')
  final String timeCreated;

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
  factory CaseDetails.fromJson(Map<String, dynamic> json) =>
      _$CaseDetailsFromJson(json);
}

/// A JSON-formatted name/value pair that represents the category name and
/// category code of the problem, selected from the <a>DescribeServices</a>
/// response for each AWS service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Category {
  /// The category code for the support case.
  @_s.JsonKey(name: 'code')
  final String code;

  /// The category name for the support case.
  @_s.JsonKey(name: 'name')
  final String name;

  Category({
    this.code,
    this.name,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

/// A communication associated with an AWS Support case. The communication
/// consists of the case ID, the message body, attachment information, the
/// submitter of the communication, and the date and time of the communication.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Communication {
  /// Information about the attachments to the case communication.
  @_s.JsonKey(name: 'attachmentSet')
  final List<AttachmentDetails> attachmentSet;

  /// The text of the communication between the customer and AWS Support.
  @_s.JsonKey(name: 'body')
  final String body;

  /// The AWS Support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string formatted as shown in this example:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  @_s.JsonKey(name: 'caseId')
  final String caseId;

  /// The identity of the account that submitted, or responded to, the support
  /// case. Customer entries include the role or IAM user as well as the email
  /// address. For example, "AdminRole (Role) &lt;someone@example.com&gt;. Entries
  /// from the AWS Support team display "Amazon Web Services," and do not show an
  /// email address.
  @_s.JsonKey(name: 'submittedBy')
  final String submittedBy;

  /// The time the communication was created.
  @_s.JsonKey(name: 'timeCreated')
  final String timeCreated;

  Communication({
    this.attachmentSet,
    this.body,
    this.caseId,
    this.submittedBy,
    this.timeCreated,
  });
  factory Communication.fromJson(Map<String, dynamic> json) =>
      _$CommunicationFromJson(json);
}

/// The AWS Support case ID returned by a successful completion of the
/// <a>CreateCase</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCaseResponse {
  /// The AWS Support case ID requested or returned in the call. The case ID is an
  /// alphanumeric string in the following format:
  /// case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>
  @_s.JsonKey(name: 'caseId')
  final String caseId;

  CreateCaseResponse({
    this.caseId,
  });
  factory CreateCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCaseResponseFromJson(json);
}

/// The content and file name of the attachment returned by the
/// <a>DescribeAttachment</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAttachmentResponse {
  /// This object includes the attachment content and file name.
  ///
  /// In the previous response syntax, the value for the <code>data</code>
  /// parameter appears as <code>blob</code>, which is represented as a
  /// base64-encoded string. The value for <code>fileName</code> is the name of
  /// the attachment, such as <code>troubleshoot-screenshot.png</code>.
  @_s.JsonKey(name: 'attachment')
  final Attachment attachment;

  DescribeAttachmentResponse({
    this.attachment,
  });
  factory DescribeAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAttachmentResponseFromJson(json);
}

/// Returns an array of <a
/// href="https://docs.aws.amazon.com/awssupport/latest/APIReference/API_CaseDetails.html">CaseDetails</a>
/// objects and a <code>nextToken</code> that defines a point for pagination in
/// the result set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCasesResponse {
  /// The details for the cases that match the request.
  @_s.JsonKey(name: 'cases')
  final List<CaseDetails> cases;

  /// A resumption point for pagination.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeCasesResponse({
    this.cases,
    this.nextToken,
  });
  factory DescribeCasesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCasesResponseFromJson(json);
}

/// The communications returned by the <a>DescribeCommunications</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCommunicationsResponse {
  /// The communications for the case.
  @_s.JsonKey(name: 'communications')
  final List<Communication> communications;

  /// A resumption point for pagination.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeCommunicationsResponse({
    this.communications,
    this.nextToken,
  });
  factory DescribeCommunicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCommunicationsResponseFromJson(json);
}

/// The list of AWS services returned by the <a>DescribeServices</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeServicesResponse {
  /// A JSON-formatted list of AWS services.
  @_s.JsonKey(name: 'services')
  final List<Service> services;

  DescribeServicesResponse({
    this.services,
  });
  factory DescribeServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeServicesResponseFromJson(json);
}

/// The list of severity levels returned by the <a>DescribeSeverityLevels</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSeverityLevelsResponse {
  /// The available severity levels for the support case. Available severity
  /// levels are defined by your service level agreement with AWS.
  @_s.JsonKey(name: 'severityLevels')
  final List<SeverityLevel> severityLevels;

  DescribeSeverityLevelsResponse({
    this.severityLevels,
  });
  factory DescribeSeverityLevelsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSeverityLevelsResponseFromJson(json);
}

/// The statuses of the Trusted Advisor checks returned by the
/// <a>DescribeTrustedAdvisorCheckRefreshStatuses</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrustedAdvisorCheckRefreshStatusesResponse {
  /// The refresh status of the specified Trusted Advisor checks.
  @_s.JsonKey(name: 'statuses')
  final List<TrustedAdvisorCheckRefreshStatus> statuses;

  DescribeTrustedAdvisorCheckRefreshStatusesResponse({
    @_s.required this.statuses,
  });
  factory DescribeTrustedAdvisorCheckRefreshStatusesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTrustedAdvisorCheckRefreshStatusesResponseFromJson(json);
}

/// The result of the Trusted Advisor check returned by the
/// <a>DescribeTrustedAdvisorCheckResult</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrustedAdvisorCheckResultResponse {
  /// The detailed results of the Trusted Advisor check.
  @_s.JsonKey(name: 'result')
  final TrustedAdvisorCheckResult result;

  DescribeTrustedAdvisorCheckResultResponse({
    this.result,
  });
  factory DescribeTrustedAdvisorCheckResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTrustedAdvisorCheckResultResponseFromJson(json);
}

/// The summaries of the Trusted Advisor checks returned by the
/// <a>DescribeTrustedAdvisorCheckSummaries</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrustedAdvisorCheckSummariesResponse {
  /// The summary information for the requested Trusted Advisor checks.
  @_s.JsonKey(name: 'summaries')
  final List<TrustedAdvisorCheckSummary> summaries;

  DescribeTrustedAdvisorCheckSummariesResponse({
    @_s.required this.summaries,
  });
  factory DescribeTrustedAdvisorCheckSummariesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTrustedAdvisorCheckSummariesResponseFromJson(json);
}

/// Information about the Trusted Advisor checks returned by the
/// <a>DescribeTrustedAdvisorChecks</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrustedAdvisorChecksResponse {
  /// Information about all available Trusted Advisor checks.
  @_s.JsonKey(name: 'checks')
  final List<TrustedAdvisorCheckDescription> checks;

  DescribeTrustedAdvisorChecksResponse({
    @_s.required this.checks,
  });
  factory DescribeTrustedAdvisorChecksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTrustedAdvisorChecksResponseFromJson(json);
}

/// The five most recent communications associated with the case.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecentCaseCommunications {
  /// The five most recent communications associated with the case.
  @_s.JsonKey(name: 'communications')
  final List<Communication> communications;

  /// A resumption point for pagination.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  RecentCaseCommunications({
    this.communications,
    this.nextToken,
  });
  factory RecentCaseCommunications.fromJson(Map<String, dynamic> json) =>
      _$RecentCaseCommunicationsFromJson(json);
}

/// The current refresh status of a Trusted Advisor check.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RefreshTrustedAdvisorCheckResponse {
  /// The current refresh status for a check, including the amount of time until
  /// the check is eligible for refresh.
  @_s.JsonKey(name: 'status')
  final TrustedAdvisorCheckRefreshStatus status;

  RefreshTrustedAdvisorCheckResponse({
    @_s.required this.status,
  });
  factory RefreshTrustedAdvisorCheckResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RefreshTrustedAdvisorCheckResponseFromJson(json);
}

/// The status of the case returned by the <a>ResolveCase</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolveCaseResponse {
  /// The status of the case after the <a>ResolveCase</a> request was processed.
  @_s.JsonKey(name: 'finalCaseStatus')
  final String finalCaseStatus;

  /// The status of the case when the <a>ResolveCase</a> request was sent.
  @_s.JsonKey(name: 'initialCaseStatus')
  final String initialCaseStatus;

  ResolveCaseResponse({
    this.finalCaseStatus,
    this.initialCaseStatus,
  });
  factory ResolveCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$ResolveCaseResponseFromJson(json);
}

/// Information about an AWS service returned by the <a>DescribeServices</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Service {
  /// A list of categories that describe the type of support issue a case
  /// describes. Categories consist of a category name and a category code.
  /// Category names and codes are passed to AWS Support when you call
  /// <a>CreateCase</a>.
  @_s.JsonKey(name: 'categories')
  final List<Category> categories;

  /// The code for an AWS service returned by the <a>DescribeServices</a>
  /// response. The <code>name</code> element contains the corresponding friendly
  /// name.
  @_s.JsonKey(name: 'code')
  final String code;

  /// The friendly name for an AWS service. The <code>code</code> element contains
  /// the corresponding code.
  @_s.JsonKey(name: 'name')
  final String name;

  Service({
    this.categories,
    this.code,
    this.name,
  });
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

/// A code and name pair that represents the severity level of a support case.
/// The available values depend on the support plan for the account. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/awssupport/latest/user/case-management.html#choosing-severity">Choosing
/// a severity</a> in the <i>AWS Support User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SeverityLevel {
  /// The code for case severity level.
  ///
  /// Valid values: <code>low</code> | <code>normal</code> | <code>high</code> |
  /// <code>urgent</code> | <code>critical</code>
  @_s.JsonKey(name: 'code')
  final String code;

  /// The name of the severity level that corresponds to the severity level code.
  /// <note>
  /// The values returned by the API differ from the values that are displayed in
  /// the AWS Support Center. For example, for the code "low", the API name is
  /// "Low", but the name in the Support Center is "General guidance". These are
  /// the Support Center code/name mappings:
  ///
  /// <ul>
  /// <li>
  /// <code>low</code>: General guidance
  /// </li>
  /// <li>
  /// <code>normal</code>: System impaired
  /// </li>
  /// <li>
  /// <code>high</code>: Production system impaired
  /// </li>
  /// <li>
  /// <code>urgent</code>: Production system down
  /// </li>
  /// <li>
  /// <code>critical</code>: Business-critical system down
  /// </li>
  /// </ul> </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/case-management.html#choosing-severity">Choosing
  /// a severity</a> in the <i>AWS Support User Guide</i>.
  @_s.JsonKey(name: 'name')
  final String name;

  SeverityLevel({
    this.code,
    this.name,
  });
  factory SeverityLevel.fromJson(Map<String, dynamic> json) =>
      _$SeverityLevelFromJson(json);
}

/// The container for summary information that relates to the category of the
/// Trusted Advisor check.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorCategorySpecificSummary {
  /// The summary information about cost savings for a Trusted Advisor check that
  /// is in the Cost Optimizing category.
  @_s.JsonKey(name: 'costOptimizing')
  final TrustedAdvisorCostOptimizingSummary costOptimizing;

  TrustedAdvisorCategorySpecificSummary({
    this.costOptimizing,
  });
  factory TrustedAdvisorCategorySpecificSummary.fromJson(
          Map<String, dynamic> json) =>
      _$TrustedAdvisorCategorySpecificSummaryFromJson(json);
}

/// The description and metadata for a Trusted Advisor check.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorCheckDescription {
  /// The category of the Trusted Advisor check.
  @_s.JsonKey(name: 'category')
  final String category;

  /// The description of the Trusted Advisor check, which includes the alert
  /// criteria and recommended operations (contains HTML markup).
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the Trusted Advisor check.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The column headings for the data returned by the Trusted Advisor check. The
  /// order of the headings corresponds to the order of the data in the
  /// <b>Metadata</b> element of the <a>TrustedAdvisorResourceDetail</a> for the
  /// check. <b>Metadata</b> contains all the data that is shown in the Excel
  /// download, even in those cases where the UI shows just summary data.
  @_s.JsonKey(name: 'metadata')
  final List<String> metadata;

  /// The display name for the Trusted Advisor check.
  @_s.JsonKey(name: 'name')
  final String name;

  TrustedAdvisorCheckDescription({
    @_s.required this.category,
    @_s.required this.description,
    @_s.required this.id,
    @_s.required this.metadata,
    @_s.required this.name,
  });
  factory TrustedAdvisorCheckDescription.fromJson(Map<String, dynamic> json) =>
      _$TrustedAdvisorCheckDescriptionFromJson(json);
}

/// The refresh status of a Trusted Advisor check.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorCheckRefreshStatus {
  /// The unique identifier for the Trusted Advisor check.
  @_s.JsonKey(name: 'checkId')
  final String checkId;

  /// The amount of time, in milliseconds, until the Trusted Advisor check is
  /// eligible for refresh.
  @_s.JsonKey(name: 'millisUntilNextRefreshable')
  final int millisUntilNextRefreshable;

  /// The status of the Trusted Advisor check for which a refresh has been
  /// requested:
  ///
  /// <ul>
  /// <li>
  /// <code>none:</code> The check is not refreshed or the non-success status
  /// exceeds the timeout
  /// </li>
  /// <li>
  /// <code>enqueued:</code> The check refresh requests has entered the refresh
  /// queue
  /// </li>
  /// <li>
  /// <code>processing:</code> The check refresh request is picked up by the rule
  /// processing engine
  /// </li>
  /// <li>
  /// <code>success:</code> The check is successfully refreshed
  /// </li>
  /// <li>
  /// <code>abandoned:</code> The check refresh has failed
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

  TrustedAdvisorCheckRefreshStatus({
    @_s.required this.checkId,
    @_s.required this.millisUntilNextRefreshable,
    @_s.required this.status,
  });
  factory TrustedAdvisorCheckRefreshStatus.fromJson(
          Map<String, dynamic> json) =>
      _$TrustedAdvisorCheckRefreshStatusFromJson(json);
}

/// The results of a Trusted Advisor check returned by
/// <a>DescribeTrustedAdvisorCheckResult</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorCheckResult {
  /// Summary information that relates to the category of the check. Cost
  /// Optimizing is the only category that is currently supported.
  @_s.JsonKey(name: 'categorySpecificSummary')
  final TrustedAdvisorCategorySpecificSummary categorySpecificSummary;

  /// The unique identifier for the Trusted Advisor check.
  @_s.JsonKey(name: 'checkId')
  final String checkId;

  /// The details about each resource listed in the check result.
  @_s.JsonKey(name: 'flaggedResources')
  final List<TrustedAdvisorResourceDetail> flaggedResources;
  @_s.JsonKey(name: 'resourcesSummary')
  final TrustedAdvisorResourcesSummary resourcesSummary;

  /// The alert status of the check: "ok" (green), "warning" (yellow), "error"
  /// (red), or "not_available".
  @_s.JsonKey(name: 'status')
  final String status;

  /// The time of the last refresh of the check.
  @_s.JsonKey(name: 'timestamp')
  final String timestamp;

  TrustedAdvisorCheckResult({
    @_s.required this.categorySpecificSummary,
    @_s.required this.checkId,
    @_s.required this.flaggedResources,
    @_s.required this.resourcesSummary,
    @_s.required this.status,
    @_s.required this.timestamp,
  });
  factory TrustedAdvisorCheckResult.fromJson(Map<String, dynamic> json) =>
      _$TrustedAdvisorCheckResultFromJson(json);
}

/// A summary of a Trusted Advisor check result, including the alert status,
/// last refresh, and number of resources examined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorCheckSummary {
  /// Summary information that relates to the category of the check. Cost
  /// Optimizing is the only category that is currently supported.
  @_s.JsonKey(name: 'categorySpecificSummary')
  final TrustedAdvisorCategorySpecificSummary categorySpecificSummary;

  /// The unique identifier for the Trusted Advisor check.
  @_s.JsonKey(name: 'checkId')
  final String checkId;
  @_s.JsonKey(name: 'resourcesSummary')
  final TrustedAdvisorResourcesSummary resourcesSummary;

  /// The alert status of the check: "ok" (green), "warning" (yellow), "error"
  /// (red), or "not_available".
  @_s.JsonKey(name: 'status')
  final String status;

  /// The time of the last refresh of the check.
  @_s.JsonKey(name: 'timestamp')
  final String timestamp;

  /// Specifies whether the Trusted Advisor check has flagged resources.
  @_s.JsonKey(name: 'hasFlaggedResources')
  final bool hasFlaggedResources;

  TrustedAdvisorCheckSummary({
    @_s.required this.categorySpecificSummary,
    @_s.required this.checkId,
    @_s.required this.resourcesSummary,
    @_s.required this.status,
    @_s.required this.timestamp,
    this.hasFlaggedResources,
  });
  factory TrustedAdvisorCheckSummary.fromJson(Map<String, dynamic> json) =>
      _$TrustedAdvisorCheckSummaryFromJson(json);
}

/// The estimated cost savings that might be realized if the recommended
/// operations are taken.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorCostOptimizingSummary {
  /// The estimated monthly savings that might be realized if the recommended
  /// operations are taken.
  @_s.JsonKey(name: 'estimatedMonthlySavings')
  final double estimatedMonthlySavings;

  /// The estimated percentage of savings that might be realized if the
  /// recommended operations are taken.
  @_s.JsonKey(name: 'estimatedPercentMonthlySavings')
  final double estimatedPercentMonthlySavings;

  TrustedAdvisorCostOptimizingSummary({
    @_s.required this.estimatedMonthlySavings,
    @_s.required this.estimatedPercentMonthlySavings,
  });
  factory TrustedAdvisorCostOptimizingSummary.fromJson(
          Map<String, dynamic> json) =>
      _$TrustedAdvisorCostOptimizingSummaryFromJson(json);
}

/// Contains information about a resource identified by a Trusted Advisor check.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorResourceDetail {
  /// Additional information about the identified resource. The exact metadata and
  /// its order can be obtained by inspecting the
  /// <a>TrustedAdvisorCheckDescription</a> object returned by the call to
  /// <a>DescribeTrustedAdvisorChecks</a>. <b>Metadata</b> contains all the data
  /// that is shown in the Excel download, even in those cases where the UI shows
  /// just summary data.
  @_s.JsonKey(name: 'metadata')
  final List<String> metadata;

  /// The unique identifier for the identified resource.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The status code for the resource identified in the Trusted Advisor check.
  @_s.JsonKey(name: 'status')
  final String status;

  /// Specifies whether the AWS resource was ignored by Trusted Advisor because it
  /// was marked as suppressed by the user.
  @_s.JsonKey(name: 'isSuppressed')
  final bool isSuppressed;

  /// The AWS region in which the identified resource is located.
  @_s.JsonKey(name: 'region')
  final String region;

  TrustedAdvisorResourceDetail({
    @_s.required this.metadata,
    @_s.required this.resourceId,
    @_s.required this.status,
    this.isSuppressed,
    this.region,
  });
  factory TrustedAdvisorResourceDetail.fromJson(Map<String, dynamic> json) =>
      _$TrustedAdvisorResourceDetailFromJson(json);
}

/// Details about AWS resources that were analyzed in a call to Trusted Advisor
/// <a>DescribeTrustedAdvisorCheckSummaries</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrustedAdvisorResourcesSummary {
  /// The number of AWS resources that were flagged (listed) by the Trusted
  /// Advisor check.
  @_s.JsonKey(name: 'resourcesFlagged')
  final int resourcesFlagged;

  /// The number of AWS resources ignored by Trusted Advisor because information
  /// was unavailable.
  @_s.JsonKey(name: 'resourcesIgnored')
  final int resourcesIgnored;

  /// The number of AWS resources that were analyzed by the Trusted Advisor check.
  @_s.JsonKey(name: 'resourcesProcessed')
  final int resourcesProcessed;

  /// The number of AWS resources ignored by Trusted Advisor because they were
  /// marked as suppressed by the user.
  @_s.JsonKey(name: 'resourcesSuppressed')
  final int resourcesSuppressed;

  TrustedAdvisorResourcesSummary({
    @_s.required this.resourcesFlagged,
    @_s.required this.resourcesIgnored,
    @_s.required this.resourcesProcessed,
    @_s.required this.resourcesSuppressed,
  });
  factory TrustedAdvisorResourcesSummary.fromJson(Map<String, dynamic> json) =>
      _$TrustedAdvisorResourcesSummaryFromJson(json);
}

class AttachmentIdNotFound extends _s.GenericAwsException {
  AttachmentIdNotFound({String type, String message})
      : super(type: type, code: 'AttachmentIdNotFound', message: message);
}

class AttachmentLimitExceeded extends _s.GenericAwsException {
  AttachmentLimitExceeded({String type, String message})
      : super(type: type, code: 'AttachmentLimitExceeded', message: message);
}

class AttachmentSetExpired extends _s.GenericAwsException {
  AttachmentSetExpired({String type, String message})
      : super(type: type, code: 'AttachmentSetExpired', message: message);
}

class AttachmentSetIdNotFound extends _s.GenericAwsException {
  AttachmentSetIdNotFound({String type, String message})
      : super(type: type, code: 'AttachmentSetIdNotFound', message: message);
}

class AttachmentSetSizeLimitExceeded extends _s.GenericAwsException {
  AttachmentSetSizeLimitExceeded({String type, String message})
      : super(
            type: type,
            code: 'AttachmentSetSizeLimitExceeded',
            message: message);
}

class CaseCreationLimitExceeded extends _s.GenericAwsException {
  CaseCreationLimitExceeded({String type, String message})
      : super(type: type, code: 'CaseCreationLimitExceeded', message: message);
}

class CaseIdNotFound extends _s.GenericAwsException {
  CaseIdNotFound({String type, String message})
      : super(type: type, code: 'CaseIdNotFound', message: message);
}

class DescribeAttachmentLimitExceeded extends _s.GenericAwsException {
  DescribeAttachmentLimitExceeded({String type, String message})
      : super(
            type: type,
            code: 'DescribeAttachmentLimitExceeded',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
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
};
