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

/// <a href="http://aws.amazon.com/ses">Amazon SES</a> is an Amazon Web Services
/// service that you can use to send email messages to your customers.
class SesV2 {
  final _s.RestJsonProtocol _protocol;
  SesV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'email',
            signingName: 'ses',
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

  /// Retrieves batches of metric data collected based on your sending activity.
  ///
  /// You can execute this operation no more than 16 times per second, and with
  /// at most 160 queries from the batches per second (cumulative).
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [queries] :
  /// A list of queries for metrics to be retrieved.
  Future<BatchGetMetricDataResponse> batchGetMetricData({
    required List<BatchGetMetricDataQuery> queries,
  }) async {
    final $payload = <String, dynamic>{
      'Queries': queries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/metrics/batch',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetMetricDataResponse.fromJson(response);
  }

  /// Cancels an export job.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [jobId] :
  /// The export job ID.
  Future<void> cancelExportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/v2/email/export-jobs/${Uri.encodeComponent(jobId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create a configuration set. <i>Configuration sets</i> are groups of rules
  /// that you can apply to the emails that you send. You apply a configuration
  /// set to an email by specifying the name of the configuration set when you
  /// call the Amazon SES API v2. When you apply a configuration set to an
  /// email, all of the rules in that configuration set are applied to the
  /// email.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set. The name can contain up to 64
  /// alphanumeric characters, including letters, numbers, hyphens (-) and
  /// underscores (_) only.
  ///
  /// Parameter [deliveryOptions] :
  /// An object that defines the dedicated IP pool that is used to send emails
  /// that you send using the configuration set.
  ///
  /// Parameter [reputationOptions] :
  /// An object that defines whether or not Amazon SES collects reputation
  /// metrics for the emails that you send that use the configuration set.
  ///
  /// Parameter [sendingOptions] :
  /// An object that defines whether or not Amazon SES can send email that you
  /// send using the configuration set.
  ///
  /// Parameter [tags] :
  /// An array of objects that define the tags (keys and values) to associate
  /// with the configuration set.
  ///
  /// Parameter [trackingOptions] :
  /// An object that defines the open and click tracking options for emails that
  /// you send using the configuration set.
  ///
  /// Parameter [vdmOptions] :
  /// An object that defines the VDM options for emails that you send using the
  /// configuration set.
  Future<void> createConfigurationSet({
    required String configurationSetName,
    DeliveryOptions? deliveryOptions,
    ReputationOptions? reputationOptions,
    SendingOptions? sendingOptions,
    SuppressionOptions? suppressionOptions,
    List<Tag>? tags,
    TrackingOptions? trackingOptions,
    VdmOptions? vdmOptions,
  }) async {
    final $payload = <String, dynamic>{
      'ConfigurationSetName': configurationSetName,
      if (deliveryOptions != null) 'DeliveryOptions': deliveryOptions,
      if (reputationOptions != null) 'ReputationOptions': reputationOptions,
      if (sendingOptions != null) 'SendingOptions': sendingOptions,
      if (suppressionOptions != null) 'SuppressionOptions': suppressionOptions,
      if (tags != null) 'Tags': tags,
      if (trackingOptions != null) 'TrackingOptions': trackingOptions,
      if (vdmOptions != null) 'VdmOptions': vdmOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/configuration-sets',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create an event destination. <i>Events</i> include message sends,
  /// deliveries, opens, clicks, bounces, and complaints. <i>Event
  /// destinations</i> are places that you can send information about these
  /// events to. For example, you can send event data to Amazon SNS to receive
  /// notifications when you receive bounces or complaints, or you can use
  /// Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term
  /// storage.
  ///
  /// A single configuration set can include more than one event destination.
  ///
  /// May throw [NotFoundException].
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set .
  ///
  /// Parameter [eventDestination] :
  /// An object that defines the event destination.
  ///
  /// Parameter [eventDestinationName] :
  /// A name that identifies the event destination within the configuration set.
  Future<void> createConfigurationSetEventDestination({
    required String configurationSetName,
    required EventDestinationDefinition eventDestination,
    required String eventDestinationName,
  }) async {
    final $payload = <String, dynamic>{
      'EventDestination': eventDestination,
      'EventDestinationName': eventDestinationName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a contact, which is an end-user who is receiving the email, and
  /// adds them to a contact list.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list to which the contact should be added.
  ///
  /// Parameter [emailAddress] :
  /// The contact's email address.
  ///
  /// Parameter [attributesData] :
  /// The attribute data attached to a contact.
  ///
  /// Parameter [topicPreferences] :
  /// The contact's preferences for being opted-in to or opted-out of topics.
  ///
  /// Parameter [unsubscribeAll] :
  /// A boolean value status noting if the contact is unsubscribed from all
  /// contact list topics.
  Future<void> createContact({
    required String contactListName,
    required String emailAddress,
    String? attributesData,
    List<TopicPreference>? topicPreferences,
    bool? unsubscribeAll,
  }) async {
    final $payload = <String, dynamic>{
      'EmailAddress': emailAddress,
      if (attributesData != null) 'AttributesData': attributesData,
      if (topicPreferences != null) 'TopicPreferences': topicPreferences,
      if (unsubscribeAll != null) 'UnsubscribeAll': unsubscribeAll,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}/contacts',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a contact list.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list.
  ///
  /// Parameter [description] :
  /// A description of what the contact list is about.
  ///
  /// Parameter [tags] :
  /// The tags associated with a contact list.
  ///
  /// Parameter [topics] :
  /// An interest group, theme, or label within a list. A contact list can have
  /// multiple topics.
  Future<void> createContactList({
    required String contactListName,
    String? description,
    List<Tag>? tags,
    List<Topic>? topics,
  }) async {
    final $payload = <String, dynamic>{
      'ContactListName': contactListName,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
      if (topics != null) 'Topics': topics,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/contact-lists',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// custom verification email templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [BadRequestException].
  /// May throw [AlreadyExistsException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [failureRedirectionURL] :
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  ///
  /// Parameter [fromEmailAddress] :
  /// The email address that the custom verification email is sent from.
  ///
  /// Parameter [successRedirectionURL] :
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  ///
  /// Parameter [templateContent] :
  /// The content of the custom verification email. The total size of the email
  /// must be less than 10 MB. The message body may contain HTML, with some
  /// limitations. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom-faq">Custom
  /// verification email frequently asked questions</a> in the <i>Amazon SES
  /// Developer Guide</i>.
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template.
  ///
  /// Parameter [templateSubject] :
  /// The subject line of the custom verification email.
  Future<void> createCustomVerificationEmailTemplate({
    required String failureRedirectionURL,
    required String fromEmailAddress,
    required String successRedirectionURL,
    required String templateContent,
    required String templateName,
    required String templateSubject,
  }) async {
    final $payload = <String, dynamic>{
      'FailureRedirectionURL': failureRedirectionURL,
      'FromEmailAddress': fromEmailAddress,
      'SuccessRedirectionURL': successRedirectionURL,
      'TemplateContent': templateContent,
      'TemplateName': templateName,
      'TemplateSubject': templateSubject,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/custom-verification-email-templates',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create a new pool of dedicated IP addresses. A pool can include one or
  /// more dedicated IP addresses that are associated with your Amazon Web
  /// Services account. You can associate a pool with a configuration set. When
  /// you send an email that uses that configuration set, the message is sent
  /// from one of the addresses in the associated pool.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [poolName] :
  /// The name of the dedicated IP pool.
  ///
  /// Parameter [scalingMode] :
  /// The type of scaling mode.
  ///
  /// Parameter [tags] :
  /// An object that defines the tags (keys and values) that you want to
  /// associate with the pool.
  Future<void> createDedicatedIpPool({
    required String poolName,
    ScalingMode? scalingMode,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'PoolName': poolName,
      if (scalingMode != null) 'ScalingMode': scalingMode.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/dedicated-ip-pools',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create a new predictive inbox placement test. Predictive inbox placement
  /// tests can help you predict how your messages will be handled by various
  /// email providers around the world. When you perform a predictive inbox
  /// placement test, you provide a sample message that contains the content
  /// that you plan to send to your customers. Amazon SES then sends that
  /// message to special email addresses spread across several major email
  /// providers. After about 24 hours, the test is complete, and you can use the
  /// <code>GetDeliverabilityTestReport</code> operation to view the results of
  /// the test.
  ///
  /// May throw [AccountSuspendedException].
  /// May throw [SendingPausedException].
  /// May throw [MessageRejected].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [content] :
  /// The HTML body of the message that you sent when you performed the
  /// predictive inbox placement test.
  ///
  /// Parameter [fromEmailAddress] :
  /// The email address that the predictive inbox placement test email was sent
  /// from.
  ///
  /// Parameter [reportName] :
  /// A unique name that helps you to identify the predictive inbox placement
  /// test when you retrieve the results.
  ///
  /// Parameter [tags] :
  /// An array of objects that define the tags (keys and values) that you want
  /// to associate with the predictive inbox placement test.
  Future<CreateDeliverabilityTestReportResponse>
      createDeliverabilityTestReport({
    required EmailContent content,
    required String fromEmailAddress,
    String? reportName,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Content': content,
      'FromEmailAddress': fromEmailAddress,
      if (reportName != null) 'ReportName': reportName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/deliverability-dashboard/test',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeliverabilityTestReportResponse.fromJson(response);
  }

  /// Starts the process of verifying an email identity. An <i>identity</i> is
  /// an email address or domain that you use when you send email. Before you
  /// can use an identity to send email, you first have to verify it. By
  /// verifying an identity, you demonstrate that you're the owner of the
  /// identity, and that you've given Amazon SES API v2 permission to send email
  /// from the identity.
  ///
  /// When you verify an email address, Amazon SES sends an email to the
  /// address. Your email address is verified as soon as you follow the link in
  /// the verification email.
  ///
  /// When you verify a domain without specifying the
  /// <code>DkimSigningAttributes</code> object, this operation provides a set
  /// of DKIM tokens. You can convert these tokens into CNAME records, which you
  /// then add to the DNS configuration for your domain. Your domain is verified
  /// when Amazon SES detects these records in the DNS configuration for your
  /// domain. This verification method is known as <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a>.
  ///
  /// Alternatively, you can perform the verification process by providing your
  /// own public-private key pair. This verification method is known as Bring
  /// Your Own DKIM (BYODKIM). To use BYODKIM, your call to the
  /// <code>CreateEmailIdentity</code> operation has to include the
  /// <code>DkimSigningAttributes</code> object. When you specify this object,
  /// you provide a selector (a component of the DNS record name that identifies
  /// the public key to use for DKIM authentication) and a private key.
  ///
  /// When you verify a domain, this operation provides a set of DKIM tokens,
  /// which you can convert into CNAME tokens. You add these CNAME tokens to the
  /// DNS configuration for your domain. Your domain is verified when Amazon SES
  /// detects these records in the DNS configuration for your domain. For some
  /// DNS providers, it can take 72 hours or more to complete the domain
  /// verification process.
  ///
  /// Additionally, you can associate an existing configuration set with the
  /// email identity that you're verifying.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [emailIdentity] :
  /// The email address or domain to verify.
  ///
  /// Parameter [configurationSetName] :
  /// The configuration set to use by default when sending from this identity.
  /// Note that any configuration set defined in the email sending request takes
  /// precedence.
  ///
  /// Parameter [dkimSigningAttributes] :
  /// If your request includes this object, Amazon SES configures the identity
  /// to use Bring Your Own DKIM (BYODKIM) for DKIM authentication purposes, or,
  /// configures the key length to be used for <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a>.
  ///
  /// You can only specify this object if the email identity is a domain, as
  /// opposed to an address.
  ///
  /// Parameter [tags] :
  /// An array of objects that define the tags (keys and values) to associate
  /// with the email identity.
  Future<CreateEmailIdentityResponse> createEmailIdentity({
    required String emailIdentity,
    String? configurationSetName,
    DkimSigningAttributes? dkimSigningAttributes,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'EmailIdentity': emailIdentity,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (dkimSigningAttributes != null)
        'DkimSigningAttributes': dkimSigningAttributes,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/identities',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEmailIdentityResponse.fromJson(response);
  }

  /// Creates the specified sending authorization policy for the given identity
  /// (an email address or a domain).
  /// <note>
  /// This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [AlreadyExistsException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  ///
  /// Parameter [policy] :
  /// The text of the policy in JSON format. The policy cannot exceed 4 KB.
  ///
  /// For information about the syntax of sending authorization policies, see
  /// the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-policies.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// The policy name cannot exceed 64 characters and can only include
  /// alphanumeric characters, dashes, and underscores.
  Future<void> createEmailIdentityPolicy({
    required String emailIdentity,
    required String policy,
    required String policyName,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an email template. Email templates enable you to send personalized
  /// email to one or more destinations in a single API operation. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [templateContent] :
  /// The content of the email template, composed of a subject line, an HTML
  /// part, and a text-only part.
  ///
  /// Parameter [templateName] :
  /// The name of the template.
  Future<void> createEmailTemplate({
    required EmailTemplateContent templateContent,
    required String templateName,
  }) async {
    final $payload = <String, dynamic>{
      'TemplateContent': templateContent,
      'TemplateName': templateName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/templates',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an export job for a data source and destination.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [exportDataSource] :
  /// The data source for the export job.
  ///
  /// Parameter [exportDestination] :
  /// The destination for the export job.
  Future<CreateExportJobResponse> createExportJob({
    required ExportDataSource exportDataSource,
    required ExportDestination exportDestination,
  }) async {
    final $payload = <String, dynamic>{
      'ExportDataSource': exportDataSource,
      'ExportDestination': exportDestination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/export-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateExportJobResponse.fromJson(response);
  }

  /// Creates an import job for a data destination.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [importDataSource] :
  /// The data source for the import job.
  ///
  /// Parameter [importDestination] :
  /// The destination for the import job.
  Future<CreateImportJobResponse> createImportJob({
    required ImportDataSource importDataSource,
    required ImportDestination importDestination,
  }) async {
    final $payload = <String, dynamic>{
      'ImportDataSource': importDataSource,
      'ImportDestination': importDestination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/import-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateImportJobResponse.fromJson(response);
  }

  /// Delete an existing configuration set.
  ///
  /// <i>Configuration sets</i> are groups of rules that you can apply to the
  /// emails you send. You apply a configuration set to an email by including a
  /// reference to the configuration set in the headers of the email. When you
  /// apply a configuration set to an email, all of the rules in that
  /// configuration set are applied to the email.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  Future<void> deleteConfigurationSet({
    required String configurationSetName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete an event destination.
  ///
  /// <i>Events</i> include message sends, deliveries, opens, clicks, bounces,
  /// and complaints. <i>Event destinations</i> are places that you can send
  /// information about these events to. For example, you can send event data to
  /// Amazon SNS to receive notifications when you receive bounces or
  /// complaints, or you can use Amazon Kinesis Data Firehose to stream data to
  /// Amazon S3 for long-term storage.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that contains the event destination to
  /// delete.
  ///
  /// Parameter [eventDestinationName] :
  /// The name of the event destination to delete.
  Future<void> deleteConfigurationSetEventDestination({
    required String configurationSetName,
    required String eventDestinationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations/${Uri.encodeComponent(eventDestinationName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a contact from a contact list.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list from which the contact should be removed.
  ///
  /// Parameter [emailAddress] :
  /// The contact's email address.
  Future<void> deleteContact({
    required String contactListName,
    required String emailAddress,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}/contacts/${Uri.encodeComponent(emailAddress)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a contact list and all of the contacts on that list.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list.
  Future<void> deleteContactList({
    required String contactListName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// custom verification email templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template that you want to
  /// delete.
  Future<void> deleteCustomVerificationEmailTemplate({
    required String templateName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/custom-verification-email-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a dedicated IP pool.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [poolName] :
  /// The name of the dedicated IP pool that you want to delete.
  Future<void> deleteDedicatedIpPool({
    required String poolName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/dedicated-ip-pools/${Uri.encodeComponent(poolName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an email identity. An identity can be either an email address or a
  /// domain name.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [emailIdentity] :
  /// The identity (that is, the email address or domain) to delete.
  Future<void> deleteEmailIdentity({
    required String emailIdentity,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified sending authorization policy for the given identity
  /// (an email address or a domain). This API returns successfully even if a
  /// policy with the specified name does not exist.
  /// <note>
  /// This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// The policy name cannot exceed 64 characters and can only include
  /// alphanumeric characters, dashes, and underscores.
  Future<void> deleteEmailIdentityPolicy({
    required String emailIdentity,
    required String policyName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an email template.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [templateName] :
  /// The name of the template to be deleted.
  Future<void> deleteEmailTemplate({
    required String templateName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/email/templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes an email address from the suppression list for your account.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [emailAddress] :
  /// The suppressed email destination to remove from the account suppression
  /// list.
  Future<void> deleteSuppressedDestination({
    required String emailAddress,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/suppression/addresses/${Uri.encodeComponent(emailAddress)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Obtain information about the email-sending status and capabilities of your
  /// Amazon SES account in the current Amazon Web Services Region.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  Future<GetAccountResponse> getAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/account',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountResponse.fromJson(response);
  }

  /// Retrieve a list of the blacklists that your dedicated IP addresses appear
  /// on.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [blacklistItemNames] :
  /// A list of IP addresses that you want to retrieve blacklist information
  /// about. You can only specify the dedicated IP addresses that you use to
  /// send email using Amazon SES or Amazon Pinpoint.
  Future<GetBlacklistReportsResponse> getBlacklistReports({
    required List<String> blacklistItemNames,
  }) async {
    final $query = <String, List<String>>{
      'BlacklistItemNames': blacklistItemNames,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/deliverability-dashboard/blacklist-report',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBlacklistReportsResponse.fromJson(response);
  }

  /// Get information about an existing configuration set, including the
  /// dedicated IP pool that it's associated with, whether or not it's enabled
  /// for sending email, and more.
  ///
  /// <i>Configuration sets</i> are groups of rules that you can apply to the
  /// emails you send. You apply a configuration set to an email by including a
  /// reference to the configuration set in the headers of the email. When you
  /// apply a configuration set to an email, all of the rules in that
  /// configuration set are applied to the email.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  Future<GetConfigurationSetResponse> getConfigurationSet({
    required String configurationSetName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationSetResponse.fromJson(response);
  }

  /// Retrieve a list of event destinations that are associated with a
  /// configuration set.
  ///
  /// <i>Events</i> include message sends, deliveries, opens, clicks, bounces,
  /// and complaints. <i>Event destinations</i> are places that you can send
  /// information about these events to. For example, you can send event data to
  /// Amazon SNS to receive notifications when you receive bounces or
  /// complaints, or you can use Amazon Kinesis Data Firehose to stream data to
  /// Amazon S3 for long-term storage.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that contains the event destination.
  Future<GetConfigurationSetEventDestinationsResponse>
      getConfigurationSetEventDestinations({
    required String configurationSetName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationSetEventDestinationsResponse.fromJson(response);
  }

  /// Returns a contact from a contact list.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list to which the contact belongs.
  ///
  /// Parameter [emailAddress] :
  /// The contact's email address.
  Future<GetContactResponse> getContact({
    required String contactListName,
    required String emailAddress,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}/contacts/${Uri.encodeComponent(emailAddress)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetContactResponse.fromJson(response);
  }

  /// Returns contact list metadata. It does not return any information about
  /// the contacts present in the list.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list.
  Future<GetContactListResponse> getContactList({
    required String contactListName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetContactListResponse.fromJson(response);
  }

  /// Returns the custom email verification template for the template name you
  /// specify.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// custom verification email templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template that you want to
  /// retrieve.
  Future<GetCustomVerificationEmailTemplateResponse>
      getCustomVerificationEmailTemplate({
    required String templateName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/custom-verification-email-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCustomVerificationEmailTemplateResponse.fromJson(response);
  }

  /// Get information about a dedicated IP address, including the name of the
  /// dedicated IP pool that it's associated with, as well information about the
  /// automatic warm-up process for the address.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [ip] :
  /// The IP address that you want to obtain more information about. The value
  /// you specify has to be a dedicated IP address that's assocaited with your
  /// Amazon Web Services account.
  Future<GetDedicatedIpResponse> getDedicatedIp({
    required String ip,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/dedicated-ips/${Uri.encodeComponent(ip)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDedicatedIpResponse.fromJson(response);
  }

  /// Retrieve information about the dedicated pool.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [poolName] :
  /// The name of the dedicated IP pool to retrieve.
  Future<GetDedicatedIpPoolResponse> getDedicatedIpPool({
    required String poolName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/dedicated-ip-pools/${Uri.encodeComponent(poolName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDedicatedIpPoolResponse.fromJson(response);
  }

  /// List the dedicated IP addresses that are associated with your Amazon Web
  /// Services account.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>GetDedicatedIps</code> to
  /// indicate the position of the dedicated IP pool in the list of IP pools.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>GetDedicatedIpsRequest</code>. If the number of results is larger
  /// than the number you specified in this parameter, then the response
  /// includes a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [poolName] :
  /// The name of the IP pool that the dedicated IP address is associated with.
  Future<GetDedicatedIpsResponse> getDedicatedIps({
    String? nextToken,
    int? pageSize,
    String? poolName,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
      if (poolName != null) 'PoolName': [poolName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/dedicated-ips',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDedicatedIpsResponse.fromJson(response);
  }

  /// Retrieve information about the status of the Deliverability dashboard for
  /// your account. When the Deliverability dashboard is enabled, you gain
  /// access to reputation, deliverability, and other metrics for the domains
  /// that you use to send email. You also gain the ability to perform
  /// predictive inbox placement tests.
  ///
  /// When you use the Deliverability dashboard, you pay a monthly subscription
  /// charge, in addition to any other fees that you accrue by using Amazon SES
  /// and other Amazon Web Services services. For more information about the
  /// features and cost of a Deliverability dashboard subscription, see <a
  /// href="http://aws.amazon.com/ses/pricing/">Amazon SES Pricing</a>.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  Future<GetDeliverabilityDashboardOptionsResponse>
      getDeliverabilityDashboardOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/deliverability-dashboard',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeliverabilityDashboardOptionsResponse.fromJson(response);
  }

  /// Retrieve the results of a predictive inbox placement test.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [reportId] :
  /// A unique string that identifies the predictive inbox placement test.
  Future<GetDeliverabilityTestReportResponse> getDeliverabilityTestReport({
    required String reportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/deliverability-dashboard/test-reports/${Uri.encodeComponent(reportId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeliverabilityTestReportResponse.fromJson(response);
  }

  /// Retrieve all the deliverability data for a specific campaign. This data is
  /// available for a campaign only if the campaign sent email by using a domain
  /// that the Deliverability dashboard is enabled for.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign. The Deliverability dashboard
  /// automatically generates and assigns this identifier to a campaign.
  Future<GetDomainDeliverabilityCampaignResponse>
      getDomainDeliverabilityCampaign({
    required String campaignId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/deliverability-dashboard/campaigns/${Uri.encodeComponent(campaignId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainDeliverabilityCampaignResponse.fromJson(response);
  }

  /// Retrieve inbox placement and engagement rates for the domains that you use
  /// to send email.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [domain] :
  /// The domain that you want to obtain deliverability metrics for.
  ///
  /// Parameter [endDate] :
  /// The last day (in Unix time) that you want to obtain domain deliverability
  /// metrics for. The <code>EndDate</code> that you specify has to be less than
  /// or equal to 30 days after the <code>StartDate</code>.
  ///
  /// Parameter [startDate] :
  /// The first day (in Unix time) that you want to obtain domain deliverability
  /// metrics for.
  Future<GetDomainStatisticsReportResponse> getDomainStatisticsReport({
    required String domain,
    required DateTime endDate,
    required DateTime startDate,
  }) async {
    final $query = <String, List<String>>{
      'EndDate': [_s.iso8601ToJson(endDate).toString()],
      'StartDate': [_s.iso8601ToJson(startDate).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/deliverability-dashboard/statistics-report/${Uri.encodeComponent(domain)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainStatisticsReportResponse.fromJson(response);
  }

  /// Provides information about a specific identity, including the identity's
  /// verification status, sending authorization policies, its DKIM
  /// authentication status, and its custom Mail-From settings.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  Future<GetEmailIdentityResponse> getEmailIdentity({
    required String emailIdentity,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEmailIdentityResponse.fromJson(response);
  }

  /// Returns the requested sending authorization policies for the given
  /// identity (an email address or a domain). The policies are returned as a
  /// map of policy names to policy contents. You can retrieve a maximum of 20
  /// policies at a time.
  /// <note>
  /// This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  Future<GetEmailIdentityPoliciesResponse> getEmailIdentityPolicies({
    required String emailIdentity,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/policies',
      exceptionFnMap: _exceptionFns,
    );
    return GetEmailIdentityPoliciesResponse.fromJson(response);
  }

  /// Displays the template object (which includes the subject line, HTML part
  /// and text part) for the template you specify.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [templateName] :
  /// The name of the template.
  Future<GetEmailTemplateResponse> getEmailTemplate({
    required String templateName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEmailTemplateResponse.fromJson(response);
  }

  /// Provides information about an export job.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [jobId] :
  /// The export job ID.
  Future<GetExportJobResponse> getExportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/export-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExportJobResponse.fromJson(response);
  }

  /// Provides information about an import job.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [jobId] :
  /// The ID of the import job.
  Future<GetImportJobResponse> getImportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/import-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetImportJobResponse.fromJson(response);
  }

  /// Provides information about a specific message, including the from address,
  /// the subject, the recipient address, email tags, as well as events
  /// associated with the message.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [messageId] :
  /// A <code>MessageId</code> is a unique identifier for a message, and is
  /// returned when sending emails through Amazon SES.
  Future<GetMessageInsightsResponse> getMessageInsights({
    required String messageId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/insights/${Uri.encodeComponent(messageId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetMessageInsightsResponse.fromJson(response);
  }

  /// Retrieves information about a specific email address that's on the
  /// suppression list for your account.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [emailAddress] :
  /// The email address that's on the account suppression list.
  Future<GetSuppressedDestinationResponse> getSuppressedDestination({
    required String emailAddress,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/suppression/addresses/${Uri.encodeComponent(emailAddress)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSuppressedDestinationResponse.fromJson(response);
  }

  /// List all of the configuration sets associated with your account in the
  /// current region.
  ///
  /// <i>Configuration sets</i> are groups of rules that you can apply to the
  /// emails you send. You apply a configuration set to an email by including a
  /// reference to the configuration set in the headers of the email. When you
  /// apply a configuration set to an email, all of the rules in that
  /// configuration set are applied to the email.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to
  /// <code>ListConfigurationSets</code> to indicate the position in the list of
  /// configuration sets.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListConfigurationSets</code>. If the number of results is larger
  /// than the number you specified in this parameter, then the response
  /// includes a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  Future<ListConfigurationSetsResponse> listConfigurationSets({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/configuration-sets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationSetsResponse.fromJson(response);
  }

  /// Lists all of the contact lists available.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [nextToken] :
  /// A string token indicating that there might be additional contact lists
  /// available to be listed. Use the token provided in the Response to use in
  /// the subsequent call to ListContactLists with the same parameters to
  /// retrieve the next page of contact lists.
  ///
  /// Parameter [pageSize] :
  /// Maximum number of contact lists to return at once. Use this parameter to
  /// paginate results. If additional contact lists exist beyond the specified
  /// limit, the <code>NextToken</code> element is sent in the response. Use the
  /// <code>NextToken</code> value in subsequent requests to retrieve additional
  /// lists.
  Future<ListContactListsResponse> listContactLists({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/contact-lists',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListContactListsResponse.fromJson(response);
  }

  /// Lists the contacts present in a specific contact list.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list.
  ///
  /// Parameter [filter] :
  /// A filter that can be applied to a list of contacts.
  ///
  /// Parameter [nextToken] :
  /// A string token indicating that there might be additional contacts
  /// available to be listed. Use the token provided in the Response to use in
  /// the subsequent call to ListContacts with the same parameters to retrieve
  /// the next page of contacts.
  ///
  /// Parameter [pageSize] :
  /// The number of contacts that may be returned at once, which is dependent on
  /// if there are more or less contacts than the value of the PageSize. Use
  /// this parameter to paginate results. If additional contacts exist beyond
  /// the specified limit, the <code>NextToken</code> element is sent in the
  /// response. Use the <code>NextToken</code> value in subsequent requests to
  /// retrieve additional contacts.
  Future<ListContactsResponse> listContacts({
    required String contactListName,
    ListContactsFilter? filter,
    String? nextToken,
    int? pageSize,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null) 'Filter': filter,
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}/contacts/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListContactsResponse.fromJson(response);
  }

  /// Lists the existing custom verification email templates for your account in
  /// the current Amazon Web Services Region.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// custom verification email templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to
  /// <code>ListCustomVerificationEmailTemplates</code> to indicate the position
  /// in the list of custom verification email templates.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListCustomVerificationEmailTemplates</code>. If the number of
  /// results is larger than the number you specified in this parameter, then
  /// the response includes a <code>NextToken</code> element, which you can use
  /// to obtain additional results.
  ///
  /// The value you specify has to be at least 1, and can be no more than 50.
  Future<ListCustomVerificationEmailTemplatesResponse>
      listCustomVerificationEmailTemplates({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/custom-verification-email-templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomVerificationEmailTemplatesResponse.fromJson(response);
  }

  /// List all of the dedicated IP pools that exist in your Amazon Web Services
  /// account in the current Region.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListDedicatedIpPools</code>
  /// to indicate the position in the list of dedicated IP pools.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListDedicatedIpPools</code>. If the number of results is larger than
  /// the number you specified in this parameter, then the response includes a
  /// <code>NextToken</code> element, which you can use to obtain additional
  /// results.
  Future<ListDedicatedIpPoolsResponse> listDedicatedIpPools({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/dedicated-ip-pools',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDedicatedIpPoolsResponse.fromJson(response);
  }

  /// Show a list of the predictive inbox placement tests that you've performed,
  /// regardless of their statuses. For predictive inbox placement tests that
  /// are complete, you can use the <code>GetDeliverabilityTestReport</code>
  /// operation to view the results.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to
  /// <code>ListDeliverabilityTestReports</code> to indicate the position in the
  /// list of predictive inbox placement tests.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListDeliverabilityTestReports</code>. If the number of results is
  /// larger than the number you specified in this parameter, then the response
  /// includes a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// The value you specify has to be at least 0, and can be no more than 1000.
  Future<ListDeliverabilityTestReportsResponse> listDeliverabilityTestReports({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/deliverability-dashboard/test-reports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeliverabilityTestReportsResponse.fromJson(response);
  }

  /// Retrieve deliverability data for all the campaigns that used a specific
  /// domain to send email during a specified time range. This data is available
  /// for a domain only if you enabled the Deliverability dashboard for the
  /// domain.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [endDate] :
  /// The last day that you want to obtain deliverability data for. This value
  /// has to be less than or equal to 30 days after the value of the
  /// <code>StartDate</code> parameter.
  ///
  /// Parameter [startDate] :
  /// The first day that you want to obtain deliverability data for.
  ///
  /// Parameter [subscribedDomain] :
  /// The domain to obtain deliverability data for.
  ///
  /// Parameter [nextToken] :
  /// A token that’s returned from a previous call to the
  /// <code>ListDomainDeliverabilityCampaigns</code> operation. This token
  /// indicates the position of a campaign in the list of campaigns.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to include in response to a single call to
  /// the <code>ListDomainDeliverabilityCampaigns</code> operation. If the
  /// number of results is larger than the number that you specify in this
  /// parameter, the response includes a <code>NextToken</code> element, which
  /// you can use to obtain additional results.
  Future<ListDomainDeliverabilityCampaignsResponse>
      listDomainDeliverabilityCampaigns({
    required DateTime endDate,
    required DateTime startDate,
    required String subscribedDomain,
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      'EndDate': [_s.iso8601ToJson(endDate).toString()],
      'StartDate': [_s.iso8601ToJson(startDate).toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/deliverability-dashboard/domains/${Uri.encodeComponent(subscribedDomain)}/campaigns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainDeliverabilityCampaignsResponse.fromJson(response);
  }

  /// Returns a list of all of the email identities that are associated with
  /// your Amazon Web Services account. An identity can be either an email
  /// address or a domain. This operation returns identities that are verified
  /// as well as those that aren't. This operation returns identities that are
  /// associated with Amazon SES and Amazon Pinpoint.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListEmailIdentities</code>
  /// to indicate the position in the list of identities.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListEmailIdentities</code>. If the number of results is larger than
  /// the number you specified in this parameter, then the response includes a
  /// <code>NextToken</code> element, which you can use to obtain additional
  /// results.
  ///
  /// The value you specify has to be at least 0, and can be no more than 1000.
  Future<ListEmailIdentitiesResponse> listEmailIdentities({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/identities',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEmailIdentitiesResponse.fromJson(response);
  }

  /// Lists the email templates present in your Amazon SES account in the
  /// current Amazon Web Services Region.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListEmailTemplates</code>
  /// to indicate the position in the list of email templates.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListEmailTemplates</code>. If the number of results is larger than
  /// the number you specified in this parameter, then the response includes a
  /// <code>NextToken</code> element, which you can use to obtain additional
  /// results.
  ///
  /// The value you specify has to be at least 1, and can be no more than 100.
  Future<ListEmailTemplatesResponse> listEmailTemplates({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEmailTemplatesResponse.fromJson(response);
  }

  /// Lists all of the export jobs.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [exportSourceType] :
  /// A value used to list export jobs that have a certain
  /// <code>ExportSourceType</code>.
  ///
  /// Parameter [jobStatus] :
  /// A value used to list export jobs that have a certain
  /// <code>JobStatus</code>.
  ///
  /// Parameter [nextToken] :
  /// The pagination token returned from a previous call to
  /// <code>ListExportJobs</code> to indicate the position in the list of export
  /// jobs.
  ///
  /// Parameter [pageSize] :
  /// Maximum number of export jobs to return at once. Use this parameter to
  /// paginate results. If additional export jobs exist beyond the specified
  /// limit, the <code>NextToken</code> element is sent in the response. Use the
  /// <code>NextToken</code> value in subsequent calls to
  /// <code>ListExportJobs</code> to retrieve additional export jobs.
  Future<ListExportJobsResponse> listExportJobs({
    ExportSourceType? exportSourceType,
    JobStatus? jobStatus,
    String? nextToken,
    int? pageSize,
  }) async {
    final $payload = <String, dynamic>{
      if (exportSourceType != null)
        'ExportSourceType': exportSourceType.toValue(),
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/list-export-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListExportJobsResponse.fromJson(response);
  }

  /// Lists all of the import jobs.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [importDestinationType] :
  /// The destination of the import job, which can be used to list import jobs
  /// that have a certain <code>ImportDestinationType</code>.
  ///
  /// Parameter [nextToken] :
  /// A string token indicating that there might be additional import jobs
  /// available to be listed. Copy this token to a subsequent call to
  /// <code>ListImportJobs</code> with the same parameters to retrieve the next
  /// page of import jobs.
  ///
  /// Parameter [pageSize] :
  /// Maximum number of import jobs to return at once. Use this parameter to
  /// paginate results. If additional import jobs exist beyond the specified
  /// limit, the <code>NextToken</code> element is sent in the response. Use the
  /// <code>NextToken</code> value in subsequent requests to retrieve additional
  /// addresses.
  Future<ListImportJobsResponse> listImportJobs({
    ImportDestinationType? importDestinationType,
    String? nextToken,
    int? pageSize,
  }) async {
    final $payload = <String, dynamic>{
      if (importDestinationType != null)
        'ImportDestinationType': importDestinationType.toValue(),
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/import-jobs/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListImportJobsResponse.fromJson(response);
  }

  /// Lists the recommendations present in your Amazon SES account in the
  /// current Amazon Web Services Region.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [filter] :
  /// Filters applied when retrieving recommendations. Can eiter be an
  /// individual filter, or combinations of <code>STATUS</code> and
  /// <code>IMPACT</code> or <code>STATUS</code> and <code>TYPE</code>
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListRecommendations</code>
  /// to indicate the position in the list of recommendations.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListRecommendations</code>. If the number of results is larger than
  /// the number you specified in this parameter, then the response includes a
  /// <code>NextToken</code> element, which you can use to obtain additional
  /// results.
  ///
  /// The value you specify has to be at least 1, and can be no more than 100.
  Future<ListRecommendationsResponse> listRecommendations({
    Map<ListRecommendationsFilterKey, String>? filter,
    String? nextToken,
    int? pageSize,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null)
        'Filter': filter.map((k, e) => MapEntry(k.toValue(), e)),
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/vdm/recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationsResponse.fromJson(response);
  }

  /// Retrieves a list of email addresses that are on the suppression list for
  /// your account.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [endDate] :
  /// Used to filter the list of suppressed email destinations so that it only
  /// includes addresses that were added to the list before a specific date.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to
  /// <code>ListSuppressedDestinations</code> to indicate the position in the
  /// list of suppressed email addresses.
  ///
  /// Parameter [pageSize] :
  /// The number of results to show in a single call to
  /// <code>ListSuppressedDestinations</code>. If the number of results is
  /// larger than the number you specified in this parameter, then the response
  /// includes a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [reasons] :
  /// The factors that caused the email address to be added to .
  ///
  /// Parameter [startDate] :
  /// Used to filter the list of suppressed email destinations so that it only
  /// includes addresses that were added to the list after a specific date.
  Future<ListSuppressedDestinationsResponse> listSuppressedDestinations({
    DateTime? endDate,
    String? nextToken,
    int? pageSize,
    List<SuppressionListReason>? reasons,
    DateTime? startDate,
  }) async {
    final $query = <String, List<String>>{
      if (endDate != null) 'EndDate': [_s.iso8601ToJson(endDate).toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
      if (reasons != null) 'Reason': reasons.map((e) => e.toValue()).toList(),
      if (startDate != null)
        'StartDate': [_s.iso8601ToJson(startDate).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/suppression/addresses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSuppressedDestinationsResponse.fromJson(response);
  }

  /// Retrieve a list of the tags (keys and values) that are associated with a
  /// specified resource. A <i>tag</i> is a label that you optionally define and
  /// associate with a resource. Each tag consists of a required <i>tag
  /// key</i> and an optional associated <i>tag value</i>. A tag key is a
  /// general label that acts as a category for more specific tag values. A tag
  /// value acts as a descriptor within a tag key.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to retrieve
  /// tag information for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'ResourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Enable or disable the automatic warm-up feature for dedicated IP
  /// addresses.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [autoWarmupEnabled] :
  /// Enables or disables the automatic warm-up feature for dedicated IP
  /// addresses that are associated with your Amazon SES account in the current
  /// Amazon Web Services Region. Set to <code>true</code> to enable the
  /// automatic warm-up feature, or set to <code>false</code> to disable it.
  Future<void> putAccountDedicatedIpWarmupAttributes({
    bool? autoWarmupEnabled,
  }) async {
    final $payload = <String, dynamic>{
      if (autoWarmupEnabled != null) 'AutoWarmupEnabled': autoWarmupEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/account/dedicated-ips/warmup',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update your Amazon SES account details.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [mailType] :
  /// The type of email your account will send.
  ///
  /// Parameter [useCaseDescription] :
  /// A description of the types of email that you plan to send.
  ///
  /// Parameter [websiteURL] :
  /// The URL of your website. This information helps us better understand the
  /// type of content that you plan to send.
  ///
  /// Parameter [additionalContactEmailAddresses] :
  /// Additional email addresses that you would like to be notified regarding
  /// Amazon SES matters.
  ///
  /// Parameter [contactLanguage] :
  /// The language you would prefer to be contacted with.
  ///
  /// Parameter [productionAccessEnabled] :
  /// Indicates whether or not your account should have production access in the
  /// current Amazon Web Services Region.
  ///
  /// If the value is <code>false</code>, then your account is in the
  /// <i>sandbox</i>. When your account is in the sandbox, you can only send
  /// email to verified identities.
  ///
  /// If the value is <code>true</code>, then your account has production
  /// access. When your account has production access, you can send email to any
  /// address. The sending quota and maximum sending rate for your account vary
  /// based on your specific use case.
  Future<void> putAccountDetails({
    required MailType mailType,
    required String useCaseDescription,
    required String websiteURL,
    List<String>? additionalContactEmailAddresses,
    ContactLanguage? contactLanguage,
    bool? productionAccessEnabled,
  }) async {
    final $payload = <String, dynamic>{
      'MailType': mailType.toValue(),
      'UseCaseDescription': useCaseDescription,
      'WebsiteURL': websiteURL,
      if (additionalContactEmailAddresses != null)
        'AdditionalContactEmailAddresses': additionalContactEmailAddresses,
      if (contactLanguage != null) 'ContactLanguage': contactLanguage.toValue(),
      if (productionAccessEnabled != null)
        'ProductionAccessEnabled': productionAccessEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/account/details',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enable or disable the ability of your account to send email.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [sendingEnabled] :
  /// Enables or disables your account's ability to send email. Set to
  /// <code>true</code> to enable email sending, or set to <code>false</code> to
  /// disable email sending.
  /// <note>
  /// If Amazon Web Services paused your account's ability to send email, you
  /// can't use this operation to resume your account's ability to send email.
  /// </note>
  Future<void> putAccountSendingAttributes({
    bool? sendingEnabled,
  }) async {
    final $payload = <String, dynamic>{
      if (sendingEnabled != null) 'SendingEnabled': sendingEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/account/sending',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Change the settings for the account-level suppression list.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [suppressedReasons] :
  /// A list that contains the reasons that email addresses will be
  /// automatically added to the suppression list for your account. This list
  /// can contain any or all of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLAINT</code> – Amazon SES adds an email address to the
  /// suppression list for your account when a message sent to that address
  /// results in a complaint.
  /// </li>
  /// <li>
  /// <code>BOUNCE</code> – Amazon SES adds an email address to the suppression
  /// list for your account when a message sent to that address results in a
  /// hard bounce.
  /// </li>
  /// </ul>
  Future<void> putAccountSuppressionAttributes({
    List<SuppressionListReason>? suppressedReasons,
  }) async {
    final $payload = <String, dynamic>{
      if (suppressedReasons != null)
        'SuppressedReasons': suppressedReasons.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/account/suppression',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update your Amazon SES account VDM attributes.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vdmAttributes] :
  /// The VDM attributes that you wish to apply to your Amazon SES account.
  Future<void> putAccountVdmAttributes({
    required VdmAttributes vdmAttributes,
  }) async {
    final $payload = <String, dynamic>{
      'VdmAttributes': vdmAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/account/vdm',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associate a configuration set with a dedicated IP pool. You can use
  /// dedicated IP pools to create groups of dedicated IP addresses for sending
  /// specific types of email.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to associate with a dedicated IP pool.
  ///
  /// Parameter [sendingPoolName] :
  /// The name of the dedicated IP pool to associate with the configuration set.
  ///
  /// Parameter [tlsPolicy] :
  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS). If the value is <code>Require</code>,
  /// messages are only delivered if a TLS connection can be established. If the
  /// value is <code>Optional</code>, messages can be delivered in plain text if
  /// a TLS connection can't be established.
  Future<void> putConfigurationSetDeliveryOptions({
    required String configurationSetName,
    String? sendingPoolName,
    TlsPolicy? tlsPolicy,
  }) async {
    final $payload = <String, dynamic>{
      if (sendingPoolName != null) 'SendingPoolName': sendingPoolName,
      if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/delivery-options',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enable or disable collection of reputation metrics for emails that you
  /// send using a particular configuration set in a specific Amazon Web
  /// Services Region.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  ///
  /// Parameter [reputationMetricsEnabled] :
  /// If <code>true</code>, tracking of reputation metrics is enabled for the
  /// configuration set. If <code>false</code>, tracking of reputation metrics
  /// is disabled for the configuration set.
  Future<void> putConfigurationSetReputationOptions({
    required String configurationSetName,
    bool? reputationMetricsEnabled,
  }) async {
    final $payload = <String, dynamic>{
      if (reputationMetricsEnabled != null)
        'ReputationMetricsEnabled': reputationMetricsEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/reputation-options',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enable or disable email sending for messages that use a particular
  /// configuration set in a specific Amazon Web Services Region.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to enable or disable email sending for.
  ///
  /// Parameter [sendingEnabled] :
  /// If <code>true</code>, email sending is enabled for the configuration set.
  /// If <code>false</code>, email sending is disabled for the configuration
  /// set.
  Future<void> putConfigurationSetSendingOptions({
    required String configurationSetName,
    bool? sendingEnabled,
  }) async {
    final $payload = <String, dynamic>{
      if (sendingEnabled != null) 'SendingEnabled': sendingEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/sending',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Specify the account suppression list preferences for a configuration set.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to change the suppression list
  /// preferences for.
  ///
  /// Parameter [suppressedReasons] :
  /// A list that contains the reasons that email addresses are automatically
  /// added to the suppression list for your account. This list can contain any
  /// or all of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLAINT</code> – Amazon SES adds an email address to the
  /// suppression list for your account when a message sent to that address
  /// results in a complaint.
  /// </li>
  /// <li>
  /// <code>BOUNCE</code> – Amazon SES adds an email address to the suppression
  /// list for your account when a message sent to that address results in a
  /// hard bounce.
  /// </li>
  /// </ul>
  Future<void> putConfigurationSetSuppressionOptions({
    required String configurationSetName,
    List<SuppressionListReason>? suppressedReasons,
  }) async {
    final $payload = <String, dynamic>{
      if (suppressedReasons != null)
        'SuppressedReasons': suppressedReasons.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/suppression-options',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Specify a custom domain to use for open and click tracking elements in
  /// email that you send.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  ///
  /// Parameter [customRedirectDomain] :
  /// The domain to use to track open and click events.
  Future<void> putConfigurationSetTrackingOptions({
    required String configurationSetName,
    String? customRedirectDomain,
  }) async {
    final $payload = <String, dynamic>{
      if (customRedirectDomain != null)
        'CustomRedirectDomain': customRedirectDomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/tracking-options',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Specify VDM preferences for email that you send using the configuration
  /// set.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  ///
  /// Parameter [vdmOptions] :
  /// The VDM options to apply to the configuration set.
  Future<void> putConfigurationSetVdmOptions({
    required String configurationSetName,
    VdmOptions? vdmOptions,
  }) async {
    final $payload = <String, dynamic>{
      if (vdmOptions != null) 'VdmOptions': vdmOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/vdm-options',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Move a dedicated IP address to an existing dedicated IP pool.
  /// <note>
  /// The dedicated IP address that you specify must already exist, and must be
  /// associated with your Amazon Web Services account.
  ///
  /// The dedicated IP pool you specify must already exist. You can create a new
  /// pool by using the <code>CreateDedicatedIpPool</code> operation.
  /// </note>
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [destinationPoolName] :
  /// The name of the IP pool that you want to add the dedicated IP address to.
  /// You have to specify an IP pool that already exists.
  ///
  /// Parameter [ip] :
  /// The IP address that you want to move to the dedicated IP pool. The value
  /// you specify has to be a dedicated IP address that's associated with your
  /// Amazon Web Services account.
  Future<void> putDedicatedIpInPool({
    required String destinationPoolName,
    required String ip,
  }) async {
    final $payload = <String, dynamic>{
      'DestinationPoolName': destinationPoolName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/dedicated-ips/${Uri.encodeComponent(ip)}/pool',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to convert a dedicated IP pool to a different scaling mode.
  /// <note>
  /// <code>MANAGED</code> pools cannot be converted to <code>STANDARD</code>
  /// scaling mode.
  /// </note>
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [poolName] :
  /// The name of the dedicated IP pool.
  ///
  /// Parameter [scalingMode] :
  /// The scaling mode to apply to the dedicated IP pool.
  /// <note>
  /// Changing the scaling mode from <code>MANAGED</code> to
  /// <code>STANDARD</code> is not supported.
  /// </note>
  Future<void> putDedicatedIpPoolScalingAttributes({
    required String poolName,
    required ScalingMode scalingMode,
  }) async {
    final $payload = <String, dynamic>{
      'ScalingMode': scalingMode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/dedicated-ip-pools/${Uri.encodeComponent(poolName)}/scaling',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <p/>
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [ip] :
  /// The dedicated IP address that you want to update the warm-up attributes
  /// for.
  ///
  /// Parameter [warmupPercentage] :
  /// The warm-up percentage that you want to associate with the dedicated IP
  /// address.
  Future<void> putDedicatedIpWarmupAttributes({
    required String ip,
    required int warmupPercentage,
  }) async {
    final $payload = <String, dynamic>{
      'WarmupPercentage': warmupPercentage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/dedicated-ips/${Uri.encodeComponent(ip)}/warmup',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enable or disable the Deliverability dashboard. When you enable the
  /// Deliverability dashboard, you gain access to reputation, deliverability,
  /// and other metrics for the domains that you use to send email. You also
  /// gain the ability to perform predictive inbox placement tests.
  ///
  /// When you use the Deliverability dashboard, you pay a monthly subscription
  /// charge, in addition to any other fees that you accrue by using Amazon SES
  /// and other Amazon Web Services services. For more information about the
  /// features and cost of a Deliverability dashboard subscription, see <a
  /// href="http://aws.amazon.com/ses/pricing/">Amazon SES Pricing</a>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [dashboardEnabled] :
  /// Specifies whether to enable the Deliverability dashboard. To enable the
  /// dashboard, set this value to <code>true</code>.
  ///
  /// Parameter [subscribedDomains] :
  /// An array of objects, one for each verified domain that you use to send
  /// email and enabled the Deliverability dashboard for.
  Future<void> putDeliverabilityDashboardOption({
    required bool dashboardEnabled,
    List<DomainDeliverabilityTrackingOption>? subscribedDomains,
  }) async {
    final $payload = <String, dynamic>{
      'DashboardEnabled': dashboardEnabled,
      if (subscribedDomains != null) 'SubscribedDomains': subscribedDomains,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/deliverability-dashboard',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to associate a configuration set with an email identity.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email address or domain to associate with a configuration set.
  ///
  /// Parameter [configurationSetName] :
  /// The configuration set to associate with an email identity.
  Future<void> putEmailIdentityConfigurationSetAttributes({
    required String emailIdentity,
    String? configurationSetName,
  }) async {
    final $payload = <String, dynamic>{
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/configuration-set',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to enable or disable DKIM authentication for an email identity.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  ///
  /// Parameter [signingEnabled] :
  /// Sets the DKIM signing configuration for the identity.
  ///
  /// When you set this value <code>true</code>, then the messages that are sent
  /// from the identity are signed using DKIM. If you set this value to
  /// <code>false</code>, your messages are sent without DKIM signing.
  Future<void> putEmailIdentityDkimAttributes({
    required String emailIdentity,
    bool? signingEnabled,
  }) async {
    final $payload = <String, dynamic>{
      if (signingEnabled != null) 'SigningEnabled': signingEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/dkim',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to configure or change the DKIM authentication settings for an email
  /// domain identity. You can use this operation to do any of the following:
  ///
  /// <ul>
  /// <li>
  /// Update the signing attributes for an identity that uses Bring Your Own
  /// DKIM (BYODKIM).
  /// </li>
  /// <li>
  /// Update the key length that should be used for Easy DKIM.
  /// </li>
  /// <li>
  /// Change from using no DKIM authentication to using Easy DKIM.
  /// </li>
  /// <li>
  /// Change from using no DKIM authentication to using BYODKIM.
  /// </li>
  /// <li>
  /// Change from using Easy DKIM to using BYODKIM.
  /// </li>
  /// <li>
  /// Change from using BYODKIM to using Easy DKIM.
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  ///
  /// Parameter [signingAttributesOrigin] :
  /// The method to use to configure DKIM for the identity. There are the
  /// following possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_SES</code> – Configure DKIM for the identity by using <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a>.
  /// </li>
  /// <li>
  /// <code>EXTERNAL</code> – Configure DKIM for the identity by using Bring
  /// Your Own DKIM (BYODKIM).
  /// </li>
  /// </ul>
  ///
  /// Parameter [signingAttributes] :
  /// An object that contains information about the private key and selector
  /// that you want to use to configure DKIM for the identity for Bring Your Own
  /// DKIM (BYODKIM) for the identity, or, configures the key length to be used
  /// for <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a>.
  Future<PutEmailIdentityDkimSigningAttributesResponse>
      putEmailIdentityDkimSigningAttributes({
    required String emailIdentity,
    required DkimSigningAttributesOrigin signingAttributesOrigin,
    DkimSigningAttributes? signingAttributes,
  }) async {
    final $payload = <String, dynamic>{
      'SigningAttributesOrigin': signingAttributesOrigin.toValue(),
      if (signingAttributes != null) 'SigningAttributes': signingAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/email/identities/${Uri.encodeComponent(emailIdentity)}/dkim/signing',
      exceptionFnMap: _exceptionFns,
    );
    return PutEmailIdentityDkimSigningAttributesResponse.fromJson(response);
  }

  /// Used to enable or disable feedback forwarding for an identity. This
  /// setting determines what happens when an identity is used to send an email
  /// that results in a bounce or complaint event.
  ///
  /// If the value is <code>true</code>, you receive email notifications when
  /// bounce or complaint events occur. These notifications are sent to the
  /// address that you specified in the <code>Return-Path</code> header of the
  /// original email.
  ///
  /// You're required to have a method of tracking bounces and complaints. If
  /// you haven't set up another mechanism for receiving bounce or complaint
  /// notifications (for example, by setting up an event destination), you
  /// receive an email notification when these events occur (even if this
  /// setting is disabled).
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  ///
  /// Parameter [emailForwardingEnabled] :
  /// Sets the feedback forwarding configuration for the identity.
  ///
  /// If the value is <code>true</code>, you receive email notifications when
  /// bounce or complaint events occur. These notifications are sent to the
  /// address that you specified in the <code>Return-Path</code> header of the
  /// original email.
  ///
  /// You're required to have a method of tracking bounces and complaints. If
  /// you haven't set up another mechanism for receiving bounce or complaint
  /// notifications (for example, by setting up an event destination), you
  /// receive an email notification when these events occur (even if this
  /// setting is disabled).
  Future<void> putEmailIdentityFeedbackAttributes({
    required String emailIdentity,
    bool? emailForwardingEnabled,
  }) async {
    final $payload = <String, dynamic>{
      if (emailForwardingEnabled != null)
        'EmailForwardingEnabled': emailForwardingEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/feedback',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to enable or disable the custom Mail-From domain configuration for an
  /// email identity.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The verified email identity.
  ///
  /// Parameter [behaviorOnMxFailure] :
  /// The action to take if the required MX record isn't found when you send an
  /// email. When you set this value to <code>UseDefaultValue</code>, the mail
  /// is sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set
  /// this value to <code>RejectMessage</code>, the Amazon SES API v2 returns a
  /// <code>MailFromDomainNotVerified</code> error, and doesn't attempt to
  /// deliver the email.
  ///
  /// These behaviors are taken when the custom MAIL FROM domain configuration
  /// is in the <code>Pending</code>, <code>Failed</code>, and
  /// <code>TemporaryFailure</code> states.
  ///
  /// Parameter [mailFromDomain] :
  /// The custom MAIL FROM domain that you want the verified identity to use.
  /// The MAIL FROM domain must meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// It has to be a subdomain of the verified identity.
  /// </li>
  /// <li>
  /// It can't be used to receive email.
  /// </li>
  /// <li>
  /// It can't be used in a "From" address if the MAIL FROM domain is a
  /// destination for feedback forwarding emails.
  /// </li>
  /// </ul>
  Future<void> putEmailIdentityMailFromAttributes({
    required String emailIdentity,
    BehaviorOnMxFailure? behaviorOnMxFailure,
    String? mailFromDomain,
  }) async {
    final $payload = <String, dynamic>{
      if (behaviorOnMxFailure != null)
        'BehaviorOnMxFailure': behaviorOnMxFailure.toValue(),
      if (mailFromDomain != null) 'MailFromDomain': mailFromDomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/mail-from',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds an email address to the suppression list for your account.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [emailAddress] :
  /// The email address that should be added to the suppression list for your
  /// account.
  ///
  /// Parameter [reason] :
  /// The factors that should cause the email address to be added to the
  /// suppression list for your account.
  Future<void> putSuppressedDestination({
    required String emailAddress,
    required SuppressionListReason reason,
  }) async {
    final $payload = <String, dynamic>{
      'EmailAddress': emailAddress,
      'Reason': reason.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/suppression/addresses',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Composes an email message to multiple destinations.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [AccountSuspendedException].
  /// May throw [SendingPausedException].
  /// May throw [MessageRejected].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [bulkEmailEntries] :
  /// The list of bulk email entry objects.
  ///
  /// Parameter [defaultContent] :
  /// An object that contains the body of the message. You can specify a
  /// template message.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use when sending the email.
  ///
  /// Parameter [defaultEmailTags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using the <code>SendEmail</code> operation. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  ///
  /// Parameter [feedbackForwardingEmailAddress] :
  /// The address that you want bounce and complaint notifications to be sent
  /// to.
  ///
  /// Parameter [feedbackForwardingEmailAddressIdentityArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>FeedbackForwardingEmailAddress</code> parameter.
  ///
  /// For example, if the owner of example.com (which has ARN
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy
  /// to it that authorizes you to use feedback@example.com, then you would
  /// specify the <code>FeedbackForwardingEmailAddressIdentityArn</code> to be
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com, and the
  /// <code>FeedbackForwardingEmailAddress</code> to be feedback@example.com.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [fromEmailAddress] :
  /// The email address to use as the "From" address for the email. The address
  /// that you specify has to be verified.
  ///
  /// Parameter [fromEmailAddressIdentityArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>FromEmailAddress</code> parameter.
  ///
  /// For example, if the owner of example.com (which has ARN
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy
  /// to it that authorizes you to use sender@example.com, then you would
  /// specify the <code>FromEmailAddressIdentityArn</code> to be
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com, and the
  /// <code>FromEmailAddress</code> to be sender@example.com.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [replyToAddresses] :
  /// The "Reply-to" email addresses for the message. When the recipient replies
  /// to the message, each Reply-to address receives the reply.
  Future<SendBulkEmailResponse> sendBulkEmail({
    required List<BulkEmailEntry> bulkEmailEntries,
    required BulkEmailContent defaultContent,
    String? configurationSetName,
    List<MessageTag>? defaultEmailTags,
    String? feedbackForwardingEmailAddress,
    String? feedbackForwardingEmailAddressIdentityArn,
    String? fromEmailAddress,
    String? fromEmailAddressIdentityArn,
    List<String>? replyToAddresses,
  }) async {
    final $payload = <String, dynamic>{
      'BulkEmailEntries': bulkEmailEntries,
      'DefaultContent': defaultContent,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (defaultEmailTags != null) 'DefaultEmailTags': defaultEmailTags,
      if (feedbackForwardingEmailAddress != null)
        'FeedbackForwardingEmailAddress': feedbackForwardingEmailAddress,
      if (feedbackForwardingEmailAddressIdentityArn != null)
        'FeedbackForwardingEmailAddressIdentityArn':
            feedbackForwardingEmailAddressIdentityArn,
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (fromEmailAddressIdentityArn != null)
        'FromEmailAddressIdentityArn': fromEmailAddressIdentityArn,
      if (replyToAddresses != null) 'ReplyToAddresses': replyToAddresses,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/outbound-bulk-emails',
      exceptionFnMap: _exceptionFns,
    );
    return SendBulkEmailResponse.fromJson(response);
  }

  /// Adds an email address to the list of identities for your Amazon SES
  /// account in the current Amazon Web Services Region and attempts to verify
  /// it. As a result of executing this operation, a customized verification
  /// email is sent to the specified address.
  ///
  /// To use this operation, you must first create a custom verification email
  /// template. For more information about creating and using custom
  /// verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// custom verification email templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [MessageRejected].
  /// May throw [SendingPausedException].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailAddress] :
  /// The email address to verify.
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template to use when sending the
  /// verification email.
  ///
  /// Parameter [configurationSetName] :
  /// Name of a configuration set to use when sending the verification email.
  Future<SendCustomVerificationEmailResponse> sendCustomVerificationEmail({
    required String emailAddress,
    required String templateName,
    String? configurationSetName,
  }) async {
    final $payload = <String, dynamic>{
      'EmailAddress': emailAddress,
      'TemplateName': templateName,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/outbound-custom-verification-emails',
      exceptionFnMap: _exceptionFns,
    );
    return SendCustomVerificationEmailResponse.fromJson(response);
  }

  /// Sends an email message. You can use the Amazon SES API v2 to send the
  /// following types of messages:
  ///
  /// <ul>
  /// <li>
  /// <b>Simple</b> – A standard email message. When you create this type of
  /// message, you specify the sender, the recipient, and the message body, and
  /// Amazon SES assembles the message for you.
  /// </li>
  /// <li>
  /// <b>Raw</b> – A raw, MIME-formatted email message. When you send this type
  /// of email, you have to specify all of the message headers, as well as the
  /// message body. You can use this message type to send messages that contain
  /// attachments. The message that you specify has to be a valid MIME message.
  /// </li>
  /// <li>
  /// <b>Templated</b> – A message that contains personalization tags. When you
  /// send this type of email, Amazon SES API v2 automatically replaces the tags
  /// with values that you specify.
  /// </li>
  /// </ul>
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [AccountSuspendedException].
  /// May throw [SendingPausedException].
  /// May throw [MessageRejected].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [content] :
  /// An object that contains the body of the message. You can send either a
  /// Simple message, Raw message, or a Templated message.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use when sending the email.
  ///
  /// Parameter [destination] :
  /// An object that contains the recipients of the email message.
  ///
  /// Parameter [emailTags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using the <code>SendEmail</code> operation. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  ///
  /// Parameter [feedbackForwardingEmailAddress] :
  /// The address that you want bounce and complaint notifications to be sent
  /// to.
  ///
  /// Parameter [feedbackForwardingEmailAddressIdentityArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>FeedbackForwardingEmailAddress</code> parameter.
  ///
  /// For example, if the owner of example.com (which has ARN
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy
  /// to it that authorizes you to use feedback@example.com, then you would
  /// specify the <code>FeedbackForwardingEmailAddressIdentityArn</code> to be
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com, and the
  /// <code>FeedbackForwardingEmailAddress</code> to be feedback@example.com.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [fromEmailAddress] :
  /// The email address to use as the "From" address for the email. The address
  /// that you specify has to be verified.
  ///
  /// Parameter [fromEmailAddressIdentityArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>FromEmailAddress</code> parameter.
  ///
  /// For example, if the owner of example.com (which has ARN
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy
  /// to it that authorizes you to use sender@example.com, then you would
  /// specify the <code>FromEmailAddressIdentityArn</code> to be
  /// arn:aws:ses:us-east-1:123456789012:identity/example.com, and the
  /// <code>FromEmailAddress</code> to be sender@example.com.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// For Raw emails, the <code>FromEmailAddressIdentityArn</code> value
  /// overrides the X-SES-SOURCE-ARN and X-SES-FROM-ARN headers specified in raw
  /// email message content.
  ///
  /// Parameter [listManagementOptions] :
  /// An object used to specify a list or topic to which an email belongs, which
  /// will be used when a contact chooses to unsubscribe.
  ///
  /// Parameter [replyToAddresses] :
  /// The "Reply-to" email addresses for the message. When the recipient replies
  /// to the message, each Reply-to address receives the reply.
  Future<SendEmailResponse> sendEmail({
    required EmailContent content,
    String? configurationSetName,
    Destination? destination,
    List<MessageTag>? emailTags,
    String? feedbackForwardingEmailAddress,
    String? feedbackForwardingEmailAddressIdentityArn,
    String? fromEmailAddress,
    String? fromEmailAddressIdentityArn,
    ListManagementOptions? listManagementOptions,
    List<String>? replyToAddresses,
  }) async {
    final $payload = <String, dynamic>{
      'Content': content,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (destination != null) 'Destination': destination,
      if (emailTags != null) 'EmailTags': emailTags,
      if (feedbackForwardingEmailAddress != null)
        'FeedbackForwardingEmailAddress': feedbackForwardingEmailAddress,
      if (feedbackForwardingEmailAddressIdentityArn != null)
        'FeedbackForwardingEmailAddressIdentityArn':
            feedbackForwardingEmailAddressIdentityArn,
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (fromEmailAddressIdentityArn != null)
        'FromEmailAddressIdentityArn': fromEmailAddressIdentityArn,
      if (listManagementOptions != null)
        'ListManagementOptions': listManagementOptions,
      if (replyToAddresses != null) 'ReplyToAddresses': replyToAddresses,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/outbound-emails',
      exceptionFnMap: _exceptionFns,
    );
    return SendEmailResponse.fromJson(response);
  }

  /// Add one or more tags (keys and values) to a specified resource. A
  /// <i>tag</i> is a label that you optionally define and associate with a
  /// resource. Tags can help you categorize and manage resources in different
  /// ways, such as by purpose, owner, environment, or other criteria. A
  /// resource can have as many as 50 tags.
  ///
  /// Each tag consists of a required <i>tag key</i> and an associated <i>tag
  /// value</i>, both of which you define. A tag key is a general label that
  /// acts as a category for more specific tag values. A tag value acts as a
  /// descriptor within a tag key.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to add one or
  /// more tags to.
  ///
  /// Parameter [tags] :
  /// A list of the tags that you want to add to the resource. A tag consists of
  /// a required tag key (<code>Key</code>) and an associated tag value
  /// (<code>Value</code>). The maximum length of a tag key is 128 characters.
  /// The maximum length of a tag value is 256 characters.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/email/tags',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a preview of the MIME content of an email when provided with a
  /// template and a set of replacement data.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [templateData] :
  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  ///
  /// Parameter [templateName] :
  /// The name of the template.
  Future<TestRenderEmailTemplateResponse> testRenderEmailTemplate({
    required String templateData,
    required String templateName,
  }) async {
    final $payload = <String, dynamic>{
      'TemplateData': templateData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/email/templates/${Uri.encodeComponent(templateName)}/render',
      exceptionFnMap: _exceptionFns,
    );
    return TestRenderEmailTemplateResponse.fromJson(response);
  }

  /// Remove one or more tags (keys and values) from a specified resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove one
  /// or more tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tags (tag keys) that you want to remove from the resource. When you
  /// specify a tag key, the action removes both that key and its associated tag
  /// value.
  ///
  /// To remove more than one tag from the resource, append the
  /// <code>TagKeys</code> parameter and argument for each additional tag to
  /// remove, separated by an ampersand. For example:
  /// <code>/v2/email/tags?ResourceArn=ResourceArn&amp;TagKeys=Key1&amp;TagKeys=Key2</code>
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'ResourceArn': [resourceArn],
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/email/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the configuration of an event destination for a configuration set.
  ///
  /// <i>Events</i> include message sends, deliveries, opens, clicks, bounces,
  /// and complaints. <i>Event destinations</i> are places that you can send
  /// information about these events to. For example, you can send event data to
  /// Amazon SNS to receive notifications when you receive bounces or
  /// complaints, or you can use Amazon Kinesis Data Firehose to stream data to
  /// Amazon S3 for long-term storage.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that contains the event destination to
  /// modify.
  ///
  /// Parameter [eventDestination] :
  /// An object that defines the event destination.
  ///
  /// Parameter [eventDestinationName] :
  /// The name of the event destination.
  Future<void> updateConfigurationSetEventDestination({
    required String configurationSetName,
    required EventDestinationDefinition eventDestination,
    required String eventDestinationName,
  }) async {
    final $payload = <String, dynamic>{
      'EventDestination': eventDestination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations/${Uri.encodeComponent(eventDestinationName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a contact's preferences for a list.
  /// <note>
  /// You must specify all existing topic preferences in the
  /// <code>TopicPreferences</code> object, not just the ones that need
  /// updating; otherwise, all your existing preferences will be removed.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list.
  ///
  /// Parameter [emailAddress] :
  /// The contact's email address.
  ///
  /// Parameter [attributesData] :
  /// The attribute data attached to a contact.
  ///
  /// Parameter [topicPreferences] :
  /// The contact's preference for being opted-in to or opted-out of a topic.
  ///
  /// Parameter [unsubscribeAll] :
  /// A boolean value status noting if the contact is unsubscribed from all
  /// contact list topics.
  Future<void> updateContact({
    required String contactListName,
    required String emailAddress,
    String? attributesData,
    List<TopicPreference>? topicPreferences,
    bool? unsubscribeAll,
  }) async {
    final $payload = <String, dynamic>{
      if (attributesData != null) 'AttributesData': attributesData,
      if (topicPreferences != null) 'TopicPreferences': topicPreferences,
      if (unsubscribeAll != null) 'UnsubscribeAll': unsubscribeAll,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}/contacts/${Uri.encodeComponent(emailAddress)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates contact list metadata. This operation does a complete replacement.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [contactListName] :
  /// The name of the contact list.
  ///
  /// Parameter [description] :
  /// A description of what the contact list is about.
  ///
  /// Parameter [topics] :
  /// An interest group, theme, or label within a list. A contact list can have
  /// multiple topics.
  Future<void> updateContactList({
    required String contactListName,
    String? description,
    List<Topic>? topics,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (topics != null) 'Topics': topics,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// custom verification email templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [failureRedirectionURL] :
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  ///
  /// Parameter [fromEmailAddress] :
  /// The email address that the custom verification email is sent from.
  ///
  /// Parameter [successRedirectionURL] :
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  ///
  /// Parameter [templateContent] :
  /// The content of the custom verification email. The total size of the email
  /// must be less than 10 MB. The message body may contain HTML, with some
  /// limitations. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom-faq">Custom
  /// verification email frequently asked questions</a> in the <i>Amazon SES
  /// Developer Guide</i>.
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template that you want to
  /// update.
  ///
  /// Parameter [templateSubject] :
  /// The subject line of the custom verification email.
  Future<void> updateCustomVerificationEmailTemplate({
    required String failureRedirectionURL,
    required String fromEmailAddress,
    required String successRedirectionURL,
    required String templateContent,
    required String templateName,
    required String templateSubject,
  }) async {
    final $payload = <String, dynamic>{
      'FailureRedirectionURL': failureRedirectionURL,
      'FromEmailAddress': fromEmailAddress,
      'SuccessRedirectionURL': successRedirectionURL,
      'TemplateContent': templateContent,
      'TemplateSubject': templateSubject,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/custom-verification-email-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified sending authorization policy for the given identity
  /// (an email address or a domain). This API returns successfully even if a
  /// policy with the specified name does not exist.
  /// <note>
  /// This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [emailIdentity] :
  /// The email identity.
  ///
  /// Parameter [policy] :
  /// The text of the policy in JSON format. The policy cannot exceed 4 KB.
  ///
  /// For information about the syntax of sending authorization policies, see
  /// the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-policies.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// The policy name cannot exceed 64 characters and can only include
  /// alphanumeric characters, dashes, and underscores.
  Future<void> updateEmailIdentityPolicy({
    required String emailIdentity,
    required String policy,
    required String policyName,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/identities/${Uri.encodeComponent(emailIdentity)}/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an email template. Email templates enable you to send personalized
  /// email to one or more destinations in a single API operation. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [templateContent] :
  /// The content of the email template, composed of a subject line, an HTML
  /// part, and a text-only part.
  ///
  /// Parameter [templateName] :
  /// The name of the template.
  Future<void> updateEmailTemplate({
    required EmailTemplateContent templateContent,
    required String templateName,
  }) async {
    final $payload = <String, dynamic>{
      'TemplateContent': templateContent,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// An object that contains information about your account details.
class AccountDetails {
  /// Additional email addresses where updates are sent about your account review
  /// process.
  final List<String>? additionalContactEmailAddresses;

  /// The language you would prefer for the case. The contact language can be one
  /// of <code>ENGLISH</code> or <code>JAPANESE</code>.
  final ContactLanguage? contactLanguage;

  /// The type of email your account is sending. The mail type can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>MARKETING</code> – Most of your sending traffic is to keep your
  /// customers informed of your latest offering.
  /// </li>
  /// <li>
  /// <code>TRANSACTIONAL</code> – Most of your sending traffic is to communicate
  /// during a transaction with a customer.
  /// </li>
  /// </ul>
  final MailType? mailType;

  /// Information about the review of the latest details you submitted.
  final ReviewDetails? reviewDetails;

  /// A description of the types of email that you plan to send.
  final String? useCaseDescription;

  /// The URL of your website. This information helps us better understand the
  /// type of content that you plan to send.
  final String? websiteURL;

  AccountDetails({
    this.additionalContactEmailAddresses,
    this.contactLanguage,
    this.mailType,
    this.reviewDetails,
    this.useCaseDescription,
    this.websiteURL,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return AccountDetails(
      additionalContactEmailAddresses:
          (json['AdditionalContactEmailAddresses'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      contactLanguage:
          (json['ContactLanguage'] as String?)?.toContactLanguage(),
      mailType: (json['MailType'] as String?)?.toMailType(),
      reviewDetails: json['ReviewDetails'] != null
          ? ReviewDetails.fromJson(
              json['ReviewDetails'] as Map<String, dynamic>)
          : null,
      useCaseDescription: json['UseCaseDescription'] as String?,
      websiteURL: json['WebsiteURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalContactEmailAddresses =
        this.additionalContactEmailAddresses;
    final contactLanguage = this.contactLanguage;
    final mailType = this.mailType;
    final reviewDetails = this.reviewDetails;
    final useCaseDescription = this.useCaseDescription;
    final websiteURL = this.websiteURL;
    return {
      if (additionalContactEmailAddresses != null)
        'AdditionalContactEmailAddresses': additionalContactEmailAddresses,
      if (contactLanguage != null) 'ContactLanguage': contactLanguage.toValue(),
      if (mailType != null) 'MailType': mailType.toValue(),
      if (reviewDetails != null) 'ReviewDetails': reviewDetails,
      if (useCaseDescription != null) 'UseCaseDescription': useCaseDescription,
      if (websiteURL != null) 'WebsiteURL': websiteURL,
    };
  }
}

/// Represents a single metric data query to include in a batch.
class BatchGetMetricDataQuery {
  /// Represents the end date for the query interval.
  final DateTime endDate;

  /// The query identifier.
  final String id;

  /// The queried metric. This can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SEND</code> – Emails sent eligible for tracking in the VDM dashboard.
  /// This excludes emails sent to the mailbox simulator and emails addressed to
  /// more than one recipient.
  /// </li>
  /// <li>
  /// <code>COMPLAINT</code> – Complaints received for your account. This excludes
  /// complaints from the mailbox simulator, those originating from your
  /// account-level suppression list (if enabled), and those for emails addressed
  /// to more than one recipient
  /// </li>
  /// <li>
  /// <code>PERMANENT_BOUNCE</code> – Permanent bounces - i.e. feedback received
  /// for emails sent to non-existent mailboxes. Excludes bounces from the mailbox
  /// simulator, those originating from your account-level suppression list (if
  /// enabled), and those for emails addressed to more than one recipient.
  /// </li>
  /// <li>
  /// <code>TRANSIENT_BOUNCE</code> – Transient bounces - i.e. feedback received
  /// for delivery failures excluding issues with non-existent mailboxes. Excludes
  /// bounces from the mailbox simulator, and those for emails addressed to more
  /// than one recipient.
  /// </li>
  /// <li>
  /// <code>OPEN</code> – Unique open events for emails including open trackers.
  /// Excludes opens for emails addressed to more than one recipient.
  /// </li>
  /// <li>
  /// <code>CLICK</code> – Unique click events for emails including wrapped links.
  /// Excludes clicks for emails addressed to more than one recipient.
  /// </li>
  /// <li>
  /// <code>DELIVERY</code> – Successful deliveries for email sending attempts.
  /// Excludes deliveries to the mailbox simulator and for emails addressed to
  /// more than one recipient.
  /// </li>
  /// <li>
  /// <code>DELIVERY_OPEN</code> – Successful deliveries for email sending
  /// attempts. Excludes deliveries to the mailbox simulator, for emails addressed
  /// to more than one recipient, and emails without open trackers.
  /// </li>
  /// <li>
  /// <code>DELIVERY_CLICK</code> – Successful deliveries for email sending
  /// attempts. Excludes deliveries to the mailbox simulator, for emails addressed
  /// to more than one recipient, and emails without click trackers.
  /// </li>
  /// <li>
  /// <code>DELIVERY_COMPLAINT</code> – Successful deliveries for email sending
  /// attempts. Excludes deliveries to the mailbox simulator, for emails addressed
  /// to more than one recipient, and emails addressed to recipients hosted by
  /// ISPs with which Amazon SES does not have a feedback loop agreement.
  /// </li>
  /// </ul>
  final Metric metric;

  /// The query namespace - e.g. <code>VDM</code>
  final MetricNamespace namespace;

  /// Represents the start date for the query interval.
  final DateTime startDate;

  /// An object that contains mapping between <code>MetricDimensionName</code> and
  /// <code>MetricDimensionValue</code> to filter metrics by.
  final Map<MetricDimensionName, String>? dimensions;

  BatchGetMetricDataQuery({
    required this.endDate,
    required this.id,
    required this.metric,
    required this.namespace,
    required this.startDate,
    this.dimensions,
  });

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final id = this.id;
    final metric = this.metric;
    final namespace = this.namespace;
    final startDate = this.startDate;
    final dimensions = this.dimensions;
    return {
      'EndDate': unixTimestampToJson(endDate),
      'Id': id,
      'Metric': metric.toValue(),
      'Namespace': namespace.toValue(),
      'StartDate': unixTimestampToJson(startDate),
      if (dimensions != null)
        'Dimensions': dimensions.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Represents the result of processing your metric data batch request
class BatchGetMetricDataResponse {
  /// A list of <code>MetricDataError</code> encountered while processing your
  /// metric data batch request.
  final List<MetricDataError>? errors;

  /// A list of successfully retrieved <code>MetricDataResult</code>.
  final List<MetricDataResult>? results;

  BatchGetMetricDataResponse({
    this.errors,
    this.results,
  });

  factory BatchGetMetricDataResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetMetricDataResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDataError.fromJson(e as Map<String, dynamic>))
          .toList(),
      results: (json['Results'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDataResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final results = this.results;
    return {
      if (errors != null) 'Errors': errors,
      if (results != null) 'Results': results,
    };
  }
}

/// The action to take if the required MX record can't be found when you send an
/// email. When you set this value to <code>UseDefaultValue</code>, the mail is
/// sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set this
/// value to <code>RejectMessage</code>, the Amazon SES API v2 returns a
/// <code>MailFromDomainNotVerified</code> error, and doesn't attempt to deliver
/// the email.
///
/// These behaviors are taken when the custom MAIL FROM domain configuration is
/// in the <code>Pending</code>, <code>Failed</code>, and
/// <code>TemporaryFailure</code> states.
enum BehaviorOnMxFailure {
  useDefaultValue,
  rejectMessage,
}

extension BehaviorOnMxFailureValueExtension on BehaviorOnMxFailure {
  String toValue() {
    switch (this) {
      case BehaviorOnMxFailure.useDefaultValue:
        return 'USE_DEFAULT_VALUE';
      case BehaviorOnMxFailure.rejectMessage:
        return 'REJECT_MESSAGE';
    }
  }
}

extension BehaviorOnMxFailureFromString on String {
  BehaviorOnMxFailure toBehaviorOnMxFailure() {
    switch (this) {
      case 'USE_DEFAULT_VALUE':
        return BehaviorOnMxFailure.useDefaultValue;
      case 'REJECT_MESSAGE':
        return BehaviorOnMxFailure.rejectMessage;
    }
    throw Exception('$this is not known in enum BehaviorOnMxFailure');
  }
}

/// An object that contains information about a blacklisting event that impacts
/// one of the dedicated IP addresses that is associated with your account.
class BlacklistEntry {
  /// Additional information about the blacklisting event, as provided by the
  /// blacklist maintainer.
  final String? description;

  /// The time when the blacklisting event occurred.
  final DateTime? listingTime;

  /// The name of the blacklist that the IP address appears on.
  final String? rblName;

  BlacklistEntry({
    this.description,
    this.listingTime,
    this.rblName,
  });

  factory BlacklistEntry.fromJson(Map<String, dynamic> json) {
    return BlacklistEntry(
      description: json['Description'] as String?,
      listingTime: timeStampFromJson(json['ListingTime']),
      rblName: json['RblName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final listingTime = this.listingTime;
    final rblName = this.rblName;
    return {
      if (description != null) 'Description': description,
      if (listingTime != null) 'ListingTime': unixTimestampToJson(listingTime),
      if (rblName != null) 'RblName': rblName,
    };
  }
}

/// Represents the body of the email message.
class Body {
  /// An object that represents the version of the message that is displayed in
  /// email clients that support HTML. HTML messages can include formatted text,
  /// hyperlinks, images, and more.
  final Content? html;

  /// An object that represents the version of the message that is displayed in
  /// email clients that don't support HTML, or clients where the recipient has
  /// disabled HTML rendering.
  final Content? text;

  Body({
    this.html,
    this.text,
  });

  Map<String, dynamic> toJson() {
    final html = this.html;
    final text = this.text;
    return {
      if (html != null) 'Html': html,
      if (text != null) 'Text': text,
    };
  }
}

/// Information about a <code>Bounce</code> event.
class Bounce {
  /// The subtype of the bounce, as determined by SES.
  final String? bounceSubType;

  /// The type of the bounce, as determined by SES. Can be one of
  /// <code>UNDETERMINED</code>, <code>TRANSIENT</code>, or <code>PERMANENT</code>
  final BounceType? bounceType;

  /// The status code issued by the reporting Message Transfer Authority (MTA).
  /// This field only appears if a delivery status notification (DSN) was attached
  /// to the bounce and the <code>Diagnostic-Code</code> was provided in the DSN.
  final String? diagnosticCode;

  Bounce({
    this.bounceSubType,
    this.bounceType,
    this.diagnosticCode,
  });

  factory Bounce.fromJson(Map<String, dynamic> json) {
    return Bounce(
      bounceSubType: json['BounceSubType'] as String?,
      bounceType: (json['BounceType'] as String?)?.toBounceType(),
      diagnosticCode: json['DiagnosticCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bounceSubType = this.bounceSubType;
    final bounceType = this.bounceType;
    final diagnosticCode = this.diagnosticCode;
    return {
      if (bounceSubType != null) 'BounceSubType': bounceSubType,
      if (bounceType != null) 'BounceType': bounceType.toValue(),
      if (diagnosticCode != null) 'DiagnosticCode': diagnosticCode,
    };
  }
}

enum BounceType {
  undetermined,
  transient,
  permanent,
}

extension BounceTypeValueExtension on BounceType {
  String toValue() {
    switch (this) {
      case BounceType.undetermined:
        return 'UNDETERMINED';
      case BounceType.transient:
        return 'TRANSIENT';
      case BounceType.permanent:
        return 'PERMANENT';
    }
  }
}

extension BounceTypeFromString on String {
  BounceType toBounceType() {
    switch (this) {
      case 'UNDETERMINED':
        return BounceType.undetermined;
      case 'TRANSIENT':
        return BounceType.transient;
      case 'PERMANENT':
        return BounceType.permanent;
    }
    throw Exception('$this is not known in enum BounceType');
  }
}

/// An object that contains the body of the message. You can specify a template
/// message.
class BulkEmailContent {
  /// The template to use for the bulk email message.
  final Template? template;

  BulkEmailContent({
    this.template,
  });

  Map<String, dynamic> toJson() {
    final template = this.template;
    return {
      if (template != null) 'Template': template,
    };
  }
}

class BulkEmailEntry {
  /// Represents the destination of the message, consisting of To:, CC:, and BCC:
  /// fields.
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in <a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason, the
  /// local part of a destination email address (the part of the email address
  /// that precedes the @ sign) may only contain <a
  /// href="https://en.wikipedia.org/wiki/Email_address#Local-part">7-bit ASCII
  /// characters</a>. If the domain part of an address (the part after the @ sign)
  /// contains non-ASCII characters, they must be encoded using Punycode, as
  /// described in <a href="https://tools.ietf.org/html/rfc3492.html">RFC3492</a>.
  /// </note>
  final Destination destination;

  /// The <code>ReplacementEmailContent</code> associated with a
  /// <code>BulkEmailEntry</code>.
  final ReplacementEmailContent? replacementEmailContent;

  /// The list of message headers associated with the <code>BulkEmailEntry</code>
  /// data type.
  ///
  /// <ul>
  /// <li>
  /// Headers Not Present in <code>BulkEmailEntry</code>: If a header is specified
  /// in <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference-V2/API_Template.html">
  /// <code>Template</code> </a> but not in <code>BulkEmailEntry</code>, the
  /// header from <code>Template</code> will be added to the outgoing email.
  /// </li>
  /// <li>
  /// Headers Present in <code>BulkEmailEntry</code>: If a header is specified in
  /// <code>BulkEmailEntry</code>, it takes precedence over any header of the same
  /// name specified in <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference-V2/API_Template.html">
  /// <code>Template</code> </a>:
  ///
  /// <ul>
  /// <li>
  /// If the header is also defined within <code>Template</code>, the value from
  /// <code>BulkEmailEntry</code> will replace the header's value in the email.
  /// </li>
  /// <li>
  /// If the header is not defined within <code>Template</code>, it will simply be
  /// added to the email as specified in <code>BulkEmailEntry</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final List<MessageHeader>? replacementHeaders;

  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using the <code>SendBulkTemplatedEmail</code> operation. Tags
  /// correspond to characteristics of the email that you define, so that you can
  /// publish email sending events.
  final List<MessageTag>? replacementTags;

  BulkEmailEntry({
    required this.destination,
    this.replacementEmailContent,
    this.replacementHeaders,
    this.replacementTags,
  });

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final replacementEmailContent = this.replacementEmailContent;
    final replacementHeaders = this.replacementHeaders;
    final replacementTags = this.replacementTags;
    return {
      'Destination': destination,
      if (replacementEmailContent != null)
        'ReplacementEmailContent': replacementEmailContent,
      if (replacementHeaders != null) 'ReplacementHeaders': replacementHeaders,
      if (replacementTags != null) 'ReplacementTags': replacementTags,
    };
  }
}

/// The result of the <code>SendBulkEmail</code> operation of each specified
/// <code>BulkEmailEntry</code>.
class BulkEmailEntryResult {
  /// A description of an error that prevented a message being sent using the
  /// <code>SendBulkTemplatedEmail</code> operation.
  final String? error;

  /// The unique message identifier returned from the
  /// <code>SendBulkTemplatedEmail</code> operation.
  final String? messageId;

  /// The status of a message sent using the <code>SendBulkTemplatedEmail</code>
  /// operation.
  ///
  /// Possible values for this parameter include:
  ///
  /// <ul>
  /// <li>
  /// SUCCESS: Amazon SES accepted the message, and will attempt to deliver it to
  /// the recipients.
  /// </li>
  /// <li>
  /// MESSAGE_REJECTED: The message was rejected because it contained a virus.
  /// </li>
  /// <li>
  /// MAIL_FROM_DOMAIN_NOT_VERIFIED: The sender's email address or domain was not
  /// verified.
  /// </li>
  /// <li>
  /// CONFIGURATION_SET_DOES_NOT_EXIST: The configuration set you specified does
  /// not exist.
  /// </li>
  /// <li>
  /// TEMPLATE_DOES_NOT_EXIST: The template you specified does not exist.
  /// </li>
  /// <li>
  /// ACCOUNT_SUSPENDED: Your account has been shut down because of issues related
  /// to your email sending practices.
  /// </li>
  /// <li>
  /// ACCOUNT_THROTTLED: The number of emails you can send has been reduced
  /// because your account has exceeded its allocated sending limit.
  /// </li>
  /// <li>
  /// ACCOUNT_DAILY_QUOTA_EXCEEDED: You have reached or exceeded the maximum
  /// number of emails you can send from your account in a 24-hour period.
  /// </li>
  /// <li>
  /// INVALID_SENDING_POOL_NAME: The configuration set you specified refers to an
  /// IP pool that does not exist.
  /// </li>
  /// <li>
  /// ACCOUNT_SENDING_PAUSED: Email sending for the Amazon SES account was
  /// disabled using the <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_UpdateAccountSendingEnabled.html">UpdateAccountSendingEnabled</a>
  /// operation.
  /// </li>
  /// <li>
  /// CONFIGURATION_SET_SENDING_PAUSED: Email sending for this configuration set
  /// was disabled using the <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_UpdateConfigurationSetSendingEnabled.html">UpdateConfigurationSetSendingEnabled</a>
  /// operation.
  /// </li>
  /// <li>
  /// INVALID_PARAMETER_VALUE: One or more of the parameters you specified when
  /// calling this operation was invalid. See the error message for additional
  /// information.
  /// </li>
  /// <li>
  /// TRANSIENT_FAILURE: Amazon SES was unable to process your request because of
  /// a temporary issue.
  /// </li>
  /// <li>
  /// FAILED: Amazon SES was unable to process your request. See the error message
  /// for additional information.
  /// </li>
  /// </ul>
  final BulkEmailStatus? status;

  BulkEmailEntryResult({
    this.error,
    this.messageId,
    this.status,
  });

  factory BulkEmailEntryResult.fromJson(Map<String, dynamic> json) {
    return BulkEmailEntryResult(
      error: json['Error'] as String?,
      messageId: json['MessageId'] as String?,
      status: (json['Status'] as String?)?.toBulkEmailStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final messageId = this.messageId;
    final status = this.status;
    return {
      if (error != null) 'Error': error,
      if (messageId != null) 'MessageId': messageId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum BulkEmailStatus {
  success,
  messageRejected,
  mailFromDomainNotVerified,
  configurationSetNotFound,
  templateNotFound,
  accountSuspended,
  accountThrottled,
  accountDailyQuotaExceeded,
  invalidSendingPoolName,
  accountSendingPaused,
  configurationSetSendingPaused,
  invalidParameter,
  transientFailure,
  failed,
}

extension BulkEmailStatusValueExtension on BulkEmailStatus {
  String toValue() {
    switch (this) {
      case BulkEmailStatus.success:
        return 'SUCCESS';
      case BulkEmailStatus.messageRejected:
        return 'MESSAGE_REJECTED';
      case BulkEmailStatus.mailFromDomainNotVerified:
        return 'MAIL_FROM_DOMAIN_NOT_VERIFIED';
      case BulkEmailStatus.configurationSetNotFound:
        return 'CONFIGURATION_SET_NOT_FOUND';
      case BulkEmailStatus.templateNotFound:
        return 'TEMPLATE_NOT_FOUND';
      case BulkEmailStatus.accountSuspended:
        return 'ACCOUNT_SUSPENDED';
      case BulkEmailStatus.accountThrottled:
        return 'ACCOUNT_THROTTLED';
      case BulkEmailStatus.accountDailyQuotaExceeded:
        return 'ACCOUNT_DAILY_QUOTA_EXCEEDED';
      case BulkEmailStatus.invalidSendingPoolName:
        return 'INVALID_SENDING_POOL_NAME';
      case BulkEmailStatus.accountSendingPaused:
        return 'ACCOUNT_SENDING_PAUSED';
      case BulkEmailStatus.configurationSetSendingPaused:
        return 'CONFIGURATION_SET_SENDING_PAUSED';
      case BulkEmailStatus.invalidParameter:
        return 'INVALID_PARAMETER';
      case BulkEmailStatus.transientFailure:
        return 'TRANSIENT_FAILURE';
      case BulkEmailStatus.failed:
        return 'FAILED';
    }
  }
}

extension BulkEmailStatusFromString on String {
  BulkEmailStatus toBulkEmailStatus() {
    switch (this) {
      case 'SUCCESS':
        return BulkEmailStatus.success;
      case 'MESSAGE_REJECTED':
        return BulkEmailStatus.messageRejected;
      case 'MAIL_FROM_DOMAIN_NOT_VERIFIED':
        return BulkEmailStatus.mailFromDomainNotVerified;
      case 'CONFIGURATION_SET_NOT_FOUND':
        return BulkEmailStatus.configurationSetNotFound;
      case 'TEMPLATE_NOT_FOUND':
        return BulkEmailStatus.templateNotFound;
      case 'ACCOUNT_SUSPENDED':
        return BulkEmailStatus.accountSuspended;
      case 'ACCOUNT_THROTTLED':
        return BulkEmailStatus.accountThrottled;
      case 'ACCOUNT_DAILY_QUOTA_EXCEEDED':
        return BulkEmailStatus.accountDailyQuotaExceeded;
      case 'INVALID_SENDING_POOL_NAME':
        return BulkEmailStatus.invalidSendingPoolName;
      case 'ACCOUNT_SENDING_PAUSED':
        return BulkEmailStatus.accountSendingPaused;
      case 'CONFIGURATION_SET_SENDING_PAUSED':
        return BulkEmailStatus.configurationSetSendingPaused;
      case 'INVALID_PARAMETER':
        return BulkEmailStatus.invalidParameter;
      case 'TRANSIENT_FAILURE':
        return BulkEmailStatus.transientFailure;
      case 'FAILED':
        return BulkEmailStatus.failed;
    }
    throw Exception('$this is not known in enum BulkEmailStatus');
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CancelExportJobResponse {
  CancelExportJobResponse();

  factory CancelExportJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelExportJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that defines an Amazon CloudWatch destination for email events.
/// You can use Amazon CloudWatch to monitor and gain insights on your email
/// sending metrics.
class CloudWatchDestination {
  /// An array of objects that define the dimensions to use when you send email
  /// events to Amazon CloudWatch.
  final List<CloudWatchDimensionConfiguration> dimensionConfigurations;

  CloudWatchDestination({
    required this.dimensionConfigurations,
  });

  factory CloudWatchDestination.fromJson(Map<String, dynamic> json) {
    return CloudWatchDestination(
      dimensionConfigurations: (json['DimensionConfigurations'] as List)
          .whereNotNull()
          .map((e) => CloudWatchDimensionConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionConfigurations = this.dimensionConfigurations;
    return {
      'DimensionConfigurations': dimensionConfigurations,
    };
  }
}

/// An object that defines the dimension configuration to use when you send
/// email events to Amazon CloudWatch.
class CloudWatchDimensionConfiguration {
  /// The default value of the dimension that is published to Amazon CloudWatch if
  /// you don't provide the value of the dimension when you send an email. This
  /// value has to meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// Can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_),
  /// or dashes (-), at signs (@), and periods (.).
  /// </li>
  /// <li>
  /// It can contain no more than 256 characters.
  /// </li>
  /// </ul>
  final String defaultDimensionValue;

  /// The name of an Amazon CloudWatch dimension associated with an email sending
  /// metric. The name has to meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores
  /// (_), or dashes (-).
  /// </li>
  /// <li>
  /// It can contain no more than 256 characters.
  /// </li>
  /// </ul>
  final String dimensionName;

  /// The location where the Amazon SES API v2 finds the value of a dimension to
  /// publish to Amazon CloudWatch. To use the message tags that you specify using
  /// an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to the
  /// <code>SendEmail</code> or <code>SendRawEmail</code> API, choose
  /// <code>messageTag</code>. To use your own email headers, choose
  /// <code>emailHeader</code>. To use link tags, choose <code>linkTags</code>.
  final DimensionValueSource dimensionValueSource;

  CloudWatchDimensionConfiguration({
    required this.defaultDimensionValue,
    required this.dimensionName,
    required this.dimensionValueSource,
  });

  factory CloudWatchDimensionConfiguration.fromJson(Map<String, dynamic> json) {
    return CloudWatchDimensionConfiguration(
      defaultDimensionValue: json['DefaultDimensionValue'] as String,
      dimensionName: json['DimensionName'] as String,
      dimensionValueSource:
          (json['DimensionValueSource'] as String).toDimensionValueSource(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultDimensionValue = this.defaultDimensionValue;
    final dimensionName = this.dimensionName;
    final dimensionValueSource = this.dimensionValueSource;
    return {
      'DefaultDimensionValue': defaultDimensionValue,
      'DimensionName': dimensionName,
      'DimensionValueSource': dimensionValueSource.toValue(),
    };
  }
}

/// Information about a <code>Complaint</code> event.
class Complaint {
  /// The value of the <code>Feedback-Type</code> field from the feedback report
  /// received from the ISP.
  final String? complaintFeedbackType;

  /// Can either be <code>null</code> or <code>OnAccountSuppressionList</code>. If
  /// the value is <code>OnAccountSuppressionList</code>, SES accepted the
  /// message, but didn't attempt to send it because it was on the account-level
  /// suppression list.
  final String? complaintSubType;

  Complaint({
    this.complaintFeedbackType,
    this.complaintSubType,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      complaintFeedbackType: json['ComplaintFeedbackType'] as String?,
      complaintSubType: json['ComplaintSubType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complaintFeedbackType = this.complaintFeedbackType;
    final complaintSubType = this.complaintSubType;
    return {
      if (complaintFeedbackType != null)
        'ComplaintFeedbackType': complaintFeedbackType,
      if (complaintSubType != null) 'ComplaintSubType': complaintSubType,
    };
  }
}

/// A contact is the end-user who is receiving the email.
class Contact {
  /// The contact's email address.
  final String? emailAddress;

  /// A timestamp noting the last time the contact's information was updated.
  final DateTime? lastUpdatedTimestamp;

  /// The default topic preferences applied to the contact.
  final List<TopicPreference>? topicDefaultPreferences;

  /// The contact's preference for being opted-in to or opted-out of a topic.
  final List<TopicPreference>? topicPreferences;

  /// A boolean value status noting if the contact is unsubscribed from all
  /// contact list topics.
  final bool? unsubscribeAll;

  Contact({
    this.emailAddress,
    this.lastUpdatedTimestamp,
    this.topicDefaultPreferences,
    this.topicPreferences,
    this.unsubscribeAll,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      emailAddress: json['EmailAddress'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      topicDefaultPreferences: (json['TopicDefaultPreferences'] as List?)
          ?.whereNotNull()
          .map((e) => TopicPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
      topicPreferences: (json['TopicPreferences'] as List?)
          ?.whereNotNull()
          .map((e) => TopicPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsubscribeAll: json['UnsubscribeAll'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final topicDefaultPreferences = this.topicDefaultPreferences;
    final topicPreferences = this.topicPreferences;
    final unsubscribeAll = this.unsubscribeAll;
    return {
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (topicDefaultPreferences != null)
        'TopicDefaultPreferences': topicDefaultPreferences,
      if (topicPreferences != null) 'TopicPreferences': topicPreferences,
      if (unsubscribeAll != null) 'UnsubscribeAll': unsubscribeAll,
    };
  }
}

enum ContactLanguage {
  en,
  ja,
}

extension ContactLanguageValueExtension on ContactLanguage {
  String toValue() {
    switch (this) {
      case ContactLanguage.en:
        return 'EN';
      case ContactLanguage.ja:
        return 'JA';
    }
  }
}

extension ContactLanguageFromString on String {
  ContactLanguage toContactLanguage() {
    switch (this) {
      case 'EN':
        return ContactLanguage.en;
      case 'JA':
        return ContactLanguage.ja;
    }
    throw Exception('$this is not known in enum ContactLanguage');
  }
}

/// A list that contains contacts that have subscribed to a particular topic or
/// topics.
class ContactList {
  /// The name of the contact list.
  final String? contactListName;

  /// A timestamp noting the last time the contact list was updated.
  final DateTime? lastUpdatedTimestamp;

  ContactList({
    this.contactListName,
    this.lastUpdatedTimestamp,
  });

  factory ContactList.fromJson(Map<String, dynamic> json) {
    return ContactList(
      contactListName: json['ContactListName'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final contactListName = this.contactListName;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    return {
      if (contactListName != null) 'ContactListName': contactListName,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
    };
  }
}

/// An object that contains details about the action of a contact list.
class ContactListDestination {
  /// &gt;The type of action to perform on the addresses. The following are the
  /// possible values:
  ///
  /// <ul>
  /// <li>
  /// PUT: add the addresses to the contact list. If the record already exists, it
  /// will override it with the new value.
  /// </li>
  /// <li>
  /// DELETE: remove the addresses from the contact list.
  /// </li>
  /// </ul>
  final ContactListImportAction contactListImportAction;

  /// The name of the contact list.
  final String contactListName;

  ContactListDestination({
    required this.contactListImportAction,
    required this.contactListName,
  });

  factory ContactListDestination.fromJson(Map<String, dynamic> json) {
    return ContactListDestination(
      contactListImportAction: (json['ContactListImportAction'] as String)
          .toContactListImportAction(),
      contactListName: json['ContactListName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final contactListImportAction = this.contactListImportAction;
    final contactListName = this.contactListName;
    return {
      'ContactListImportAction': contactListImportAction.toValue(),
      'ContactListName': contactListName,
    };
  }
}

enum ContactListImportAction {
  delete,
  put,
}

extension ContactListImportActionValueExtension on ContactListImportAction {
  String toValue() {
    switch (this) {
      case ContactListImportAction.delete:
        return 'DELETE';
      case ContactListImportAction.put:
        return 'PUT';
    }
  }
}

extension ContactListImportActionFromString on String {
  ContactListImportAction toContactListImportAction() {
    switch (this) {
      case 'DELETE':
        return ContactListImportAction.delete;
      case 'PUT':
        return ContactListImportAction.put;
    }
    throw Exception('$this is not known in enum ContactListImportAction');
  }
}

/// An object that represents the content of the email, and optionally a
/// character set specification.
class Content {
  /// The content of the message itself.
  final String data;

  /// The character set for the content. Because of the constraints of the SMTP
  /// protocol, Amazon SES uses 7-bit ASCII by default. If the text includes
  /// characters outside of the ASCII range, you have to specify a character set.
  /// For example, you could specify <code>UTF-8</code>, <code>ISO-8859-1</code>,
  /// or <code>Shift_JIS</code>.
  final String? charset;

  Content({
    required this.data,
    this.charset,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final charset = this.charset;
    return {
      'Data': data,
      if (charset != null) 'Charset': charset,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();

  factory CreateConfigurationSetEventDestinationResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();

  factory CreateConfigurationSetResponse.fromJson(Map<String, dynamic> _) {
    return CreateConfigurationSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateContactListResponse {
  CreateContactListResponse();

  factory CreateContactListResponse.fromJson(Map<String, dynamic> _) {
    return CreateContactListResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateContactResponse {
  CreateContactResponse();

  factory CreateContactResponse.fromJson(Map<String, dynamic> _) {
    return CreateContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class CreateCustomVerificationEmailTemplateResponse {
  CreateCustomVerificationEmailTemplateResponse();

  factory CreateCustomVerificationEmailTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateCustomVerificationEmailTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateDedicatedIpPoolResponse {
  CreateDedicatedIpPoolResponse();

  factory CreateDedicatedIpPoolResponse.fromJson(Map<String, dynamic> _) {
    return CreateDedicatedIpPoolResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about the predictive inbox placement test that you created.
class CreateDeliverabilityTestReportResponse {
  /// The status of the predictive inbox placement test. If the status is
  /// <code>IN_PROGRESS</code>, then the predictive inbox placement test is
  /// currently running. Predictive inbox placement tests are usually complete
  /// within 24 hours of creating the test. If the status is
  /// <code>COMPLETE</code>, then the test is finished, and you can use the
  /// <code>GetDeliverabilityTestReport</code> to view the results of the test.
  final DeliverabilityTestStatus deliverabilityTestStatus;

  /// A unique string that identifies the predictive inbox placement test.
  final String reportId;

  CreateDeliverabilityTestReportResponse({
    required this.deliverabilityTestStatus,
    required this.reportId,
  });

  factory CreateDeliverabilityTestReportResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDeliverabilityTestReportResponse(
      deliverabilityTestStatus: (json['DeliverabilityTestStatus'] as String)
          .toDeliverabilityTestStatus(),
      reportId: json['ReportId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deliverabilityTestStatus = this.deliverabilityTestStatus;
    final reportId = this.reportId;
    return {
      'DeliverabilityTestStatus': deliverabilityTestStatus.toValue(),
      'ReportId': reportId,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateEmailIdentityPolicyResponse {
  CreateEmailIdentityPolicyResponse();

  factory CreateEmailIdentityPolicyResponse.fromJson(Map<String, dynamic> _) {
    return CreateEmailIdentityPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the email identity is a domain, this object contains information about
/// the DKIM verification status for the domain.
///
/// If the email identity is an email address, this object is empty.
class CreateEmailIdentityResponse {
  /// An object that contains information about the DKIM attributes for the
  /// identity.
  final DkimAttributes? dkimAttributes;

  /// The email identity type. Note: the <code>MANAGED_DOMAIN</code> identity type
  /// is not supported.
  final IdentityType? identityType;

  /// Specifies whether or not the identity is verified. You can only send email
  /// from verified email addresses or domains. For more information about
  /// verifying identities, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html">Amazon
  /// Pinpoint User Guide</a>.
  final bool? verifiedForSendingStatus;

  CreateEmailIdentityResponse({
    this.dkimAttributes,
    this.identityType,
    this.verifiedForSendingStatus,
  });

  factory CreateEmailIdentityResponse.fromJson(Map<String, dynamic> json) {
    return CreateEmailIdentityResponse(
      dkimAttributes: json['DkimAttributes'] != null
          ? DkimAttributes.fromJson(
              json['DkimAttributes'] as Map<String, dynamic>)
          : null,
      identityType: (json['IdentityType'] as String?)?.toIdentityType(),
      verifiedForSendingStatus: json['VerifiedForSendingStatus'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final dkimAttributes = this.dkimAttributes;
    final identityType = this.identityType;
    final verifiedForSendingStatus = this.verifiedForSendingStatus;
    return {
      if (dkimAttributes != null) 'DkimAttributes': dkimAttributes,
      if (identityType != null) 'IdentityType': identityType.toValue(),
      if (verifiedForSendingStatus != null)
        'VerifiedForSendingStatus': verifiedForSendingStatus,
    };
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class CreateEmailTemplateResponse {
  CreateEmailTemplateResponse();

  factory CreateEmailTemplateResponse.fromJson(Map<String, dynamic> _) {
    return CreateEmailTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateExportJobResponse {
  /// A string that represents the export job ID.
  final String? jobId;

  CreateExportJobResponse({
    this.jobId,
  });

  factory CreateExportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateExportJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateImportJobResponse {
  /// A string that represents the import job ID.
  final String? jobId;

  CreateImportJobResponse({
    this.jobId,
  });

  factory CreateImportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateImportJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

/// Contains information about a custom verification email template.
class CustomVerificationEmailTemplateMetadata {
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  final String? failureRedirectionURL;

  /// The email address that the custom verification email is sent from.
  final String? fromEmailAddress;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  final String? successRedirectionURL;

  /// The name of the custom verification email template.
  final String? templateName;

  /// The subject line of the custom verification email.
  final String? templateSubject;

  CustomVerificationEmailTemplateMetadata({
    this.failureRedirectionURL,
    this.fromEmailAddress,
    this.successRedirectionURL,
    this.templateName,
    this.templateSubject,
  });

  factory CustomVerificationEmailTemplateMetadata.fromJson(
      Map<String, dynamic> json) {
    return CustomVerificationEmailTemplateMetadata(
      failureRedirectionURL: json['FailureRedirectionURL'] as String?,
      fromEmailAddress: json['FromEmailAddress'] as String?,
      successRedirectionURL: json['SuccessRedirectionURL'] as String?,
      templateName: json['TemplateName'] as String?,
      templateSubject: json['TemplateSubject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureRedirectionURL = this.failureRedirectionURL;
    final fromEmailAddress = this.fromEmailAddress;
    final successRedirectionURL = this.successRedirectionURL;
    final templateName = this.templateName;
    final templateSubject = this.templateSubject;
    return {
      if (failureRedirectionURL != null)
        'FailureRedirectionURL': failureRedirectionURL,
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (successRedirectionURL != null)
        'SuccessRedirectionURL': successRedirectionURL,
      if (templateName != null) 'TemplateName': templateName,
      if (templateSubject != null) 'TemplateSubject': templateSubject,
    };
  }
}

/// An object that contains information about the volume of email sent on each
/// day of the analysis period.
class DailyVolume {
  /// An object that contains inbox placement metrics for a specified day in the
  /// analysis period, broken out by the recipient's email provider.
  final List<DomainIspPlacement>? domainIspPlacements;

  /// The date that the DailyVolume metrics apply to, in Unix time.
  final DateTime? startDate;

  /// An object that contains inbox placement metrics for a specific day in the
  /// analysis period.
  final VolumeStatistics? volumeStatistics;

  DailyVolume({
    this.domainIspPlacements,
    this.startDate,
    this.volumeStatistics,
  });

  factory DailyVolume.fromJson(Map<String, dynamic> json) {
    return DailyVolume(
      domainIspPlacements: (json['DomainIspPlacements'] as List?)
          ?.whereNotNull()
          .map((e) => DomainIspPlacement.fromJson(e as Map<String, dynamic>))
          .toList(),
      startDate: timeStampFromJson(json['StartDate']),
      volumeStatistics: json['VolumeStatistics'] != null
          ? VolumeStatistics.fromJson(
              json['VolumeStatistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainIspPlacements = this.domainIspPlacements;
    final startDate = this.startDate;
    final volumeStatistics = this.volumeStatistics;
    return {
      if (domainIspPlacements != null)
        'DomainIspPlacements': domainIspPlacements,
      if (startDate != null) 'StartDate': unixTimestampToJson(startDate),
      if (volumeStatistics != null) 'VolumeStatistics': volumeStatistics,
    };
  }
}

/// An object containing additional settings for your VDM configuration as
/// applicable to the Dashboard.
class DashboardAttributes {
  /// Specifies the status of your VDM engagement metrics collection. Can be one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – Amazon SES enables engagement metrics for your
  /// account.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – Amazon SES disables engagement metrics for your
  /// account.
  /// </li>
  /// </ul>
  final FeatureStatus? engagementMetrics;

  DashboardAttributes({
    this.engagementMetrics,
  });

  factory DashboardAttributes.fromJson(Map<String, dynamic> json) {
    return DashboardAttributes(
      engagementMetrics:
          (json['EngagementMetrics'] as String?)?.toFeatureStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final engagementMetrics = this.engagementMetrics;
    return {
      if (engagementMetrics != null)
        'EngagementMetrics': engagementMetrics.toValue(),
    };
  }
}

/// An object containing additional settings for your VDM configuration as
/// applicable to the Dashboard.
class DashboardOptions {
  /// Specifies the status of your VDM engagement metrics collection. Can be one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – Amazon SES enables engagement metrics for the
  /// configuration set.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – Amazon SES disables engagement metrics for the
  /// configuration set.
  /// </li>
  /// </ul>
  final FeatureStatus? engagementMetrics;

  DashboardOptions({
    this.engagementMetrics,
  });

  factory DashboardOptions.fromJson(Map<String, dynamic> json) {
    return DashboardOptions(
      engagementMetrics:
          (json['EngagementMetrics'] as String?)?.toFeatureStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final engagementMetrics = this.engagementMetrics;
    return {
      if (engagementMetrics != null)
        'EngagementMetrics': engagementMetrics.toValue(),
    };
  }
}

/// The data format of a file, can be one of the following:
///
/// <ul>
/// <li>
/// <code>CSV</code> – A comma-separated values file.
/// </li>
/// <li>
/// <code>JSON</code> – A JSON file.
/// </li>
/// </ul>
enum DataFormat {
  csv,
  json,
}

extension DataFormatValueExtension on DataFormat {
  String toValue() {
    switch (this) {
      case DataFormat.csv:
        return 'CSV';
      case DataFormat.json:
        return 'JSON';
    }
  }
}

extension DataFormatFromString on String {
  DataFormat toDataFormat() {
    switch (this) {
      case 'CSV':
        return DataFormat.csv;
      case 'JSON':
        return DataFormat.json;
    }
    throw Exception('$this is not known in enum DataFormat');
  }
}

/// Contains information about a dedicated IP address that is associated with
/// your Amazon SES account.
///
/// To learn more about requesting dedicated IP addresses, see <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/dedicated-ip-case.html">Requesting
/// and Relinquishing Dedicated IP Addresses</a> in the <i>Amazon SES Developer
/// Guide</i>.
class DedicatedIp {
  /// An IPv4 address.
  final String ip;

  /// Indicates how complete the dedicated IP warm-up process is. When this value
  /// equals 1, the address has completed the warm-up process and is ready for
  /// use.
  final int warmupPercentage;

  /// The warm-up status of a dedicated IP address. The status can have one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code> – The IP address isn't ready to use because the
  /// dedicated IP warm-up process is ongoing.
  /// </li>
  /// <li>
  /// <code>DONE</code> – The dedicated IP warm-up process is complete, and the IP
  /// address is ready to use.
  /// </li>
  /// </ul>
  final WarmupStatus warmupStatus;

  /// The name of the dedicated IP pool that the IP address is associated with.
  final String? poolName;

  DedicatedIp({
    required this.ip,
    required this.warmupPercentage,
    required this.warmupStatus,
    this.poolName,
  });

  factory DedicatedIp.fromJson(Map<String, dynamic> json) {
    return DedicatedIp(
      ip: json['Ip'] as String,
      warmupPercentage: json['WarmupPercentage'] as int,
      warmupStatus: (json['WarmupStatus'] as String).toWarmupStatus(),
      poolName: json['PoolName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ip = this.ip;
    final warmupPercentage = this.warmupPercentage;
    final warmupStatus = this.warmupStatus;
    final poolName = this.poolName;
    return {
      'Ip': ip,
      'WarmupPercentage': warmupPercentage,
      'WarmupStatus': warmupStatus.toValue(),
      if (poolName != null) 'PoolName': poolName,
    };
  }
}

/// Contains information about a dedicated IP pool.
class DedicatedIpPool {
  /// The name of the dedicated IP pool.
  final String poolName;

  /// The type of the dedicated IP pool.
  ///
  /// <ul>
  /// <li>
  /// <code>STANDARD</code> – A dedicated IP pool where you can control which IPs
  /// are part of the pool.
  /// </li>
  /// <li>
  /// <code>MANAGED</code> – A dedicated IP pool where the reputation and number
  /// of IPs are automatically managed by Amazon SES.
  /// </li>
  /// </ul>
  final ScalingMode scalingMode;

  DedicatedIpPool({
    required this.poolName,
    required this.scalingMode,
  });

  factory DedicatedIpPool.fromJson(Map<String, dynamic> json) {
    return DedicatedIpPool(
      poolName: json['PoolName'] as String,
      scalingMode: (json['ScalingMode'] as String).toScalingMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final poolName = this.poolName;
    final scalingMode = this.scalingMode;
    return {
      'PoolName': poolName,
      'ScalingMode': scalingMode.toValue(),
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();

  factory DeleteConfigurationSetEventDestinationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();

  factory DeleteConfigurationSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConfigurationSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteContactListResponse {
  DeleteContactListResponse();

  factory DeleteContactListResponse.fromJson(Map<String, dynamic> _) {
    return DeleteContactListResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteContactResponse {
  DeleteContactResponse();

  factory DeleteContactResponse.fromJson(Map<String, dynamic> _) {
    return DeleteContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class DeleteCustomVerificationEmailTemplateResponse {
  DeleteCustomVerificationEmailTemplateResponse();

  factory DeleteCustomVerificationEmailTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteCustomVerificationEmailTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteDedicatedIpPoolResponse {
  DeleteDedicatedIpPoolResponse();

  factory DeleteDedicatedIpPoolResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDedicatedIpPoolResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteEmailIdentityPolicyResponse {
  DeleteEmailIdentityPolicyResponse();

  factory DeleteEmailIdentityPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEmailIdentityPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteEmailIdentityResponse {
  DeleteEmailIdentityResponse();

  factory DeleteEmailIdentityResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEmailIdentityResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class DeleteEmailTemplateResponse {
  DeleteEmailTemplateResponse();

  factory DeleteEmailTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEmailTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteSuppressedDestinationResponse {
  DeleteSuppressedDestinationResponse();

  factory DeleteSuppressedDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSuppressedDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The current status of your Deliverability dashboard subscription. If this
/// value is <code>PENDING_EXPIRATION</code>, your subscription is scheduled to
/// expire at the end of the current calendar month.
enum DeliverabilityDashboardAccountStatus {
  active,
  pendingExpiration,
  disabled,
}

extension DeliverabilityDashboardAccountStatusValueExtension
    on DeliverabilityDashboardAccountStatus {
  String toValue() {
    switch (this) {
      case DeliverabilityDashboardAccountStatus.active:
        return 'ACTIVE';
      case DeliverabilityDashboardAccountStatus.pendingExpiration:
        return 'PENDING_EXPIRATION';
      case DeliverabilityDashboardAccountStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension DeliverabilityDashboardAccountStatusFromString on String {
  DeliverabilityDashboardAccountStatus
      toDeliverabilityDashboardAccountStatus() {
    switch (this) {
      case 'ACTIVE':
        return DeliverabilityDashboardAccountStatus.active;
      case 'PENDING_EXPIRATION':
        return DeliverabilityDashboardAccountStatus.pendingExpiration;
      case 'DISABLED':
        return DeliverabilityDashboardAccountStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum DeliverabilityDashboardAccountStatus');
  }
}

/// An object that contains metadata related to a predictive inbox placement
/// test.
class DeliverabilityTestReport {
  /// The date and time when the predictive inbox placement test was created.
  final DateTime? createDate;

  /// The status of the predictive inbox placement test. If the status is
  /// <code>IN_PROGRESS</code>, then the predictive inbox placement test is
  /// currently running. Predictive inbox placement tests are usually complete
  /// within 24 hours of creating the test. If the status is
  /// <code>COMPLETE</code>, then the test is finished, and you can use the
  /// <code>GetDeliverabilityTestReport</code> to view the results of the test.
  final DeliverabilityTestStatus? deliverabilityTestStatus;

  /// The sender address that you specified for the predictive inbox placement
  /// test.
  final String? fromEmailAddress;

  /// A unique string that identifies the predictive inbox placement test.
  final String? reportId;

  /// A name that helps you identify a predictive inbox placement test report.
  final String? reportName;

  /// The subject line for an email that you submitted in a predictive inbox
  /// placement test.
  final String? subject;

  DeliverabilityTestReport({
    this.createDate,
    this.deliverabilityTestStatus,
    this.fromEmailAddress,
    this.reportId,
    this.reportName,
    this.subject,
  });

  factory DeliverabilityTestReport.fromJson(Map<String, dynamic> json) {
    return DeliverabilityTestReport(
      createDate: timeStampFromJson(json['CreateDate']),
      deliverabilityTestStatus: (json['DeliverabilityTestStatus'] as String?)
          ?.toDeliverabilityTestStatus(),
      fromEmailAddress: json['FromEmailAddress'] as String?,
      reportId: json['ReportId'] as String?,
      reportName: json['ReportName'] as String?,
      subject: json['Subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final deliverabilityTestStatus = this.deliverabilityTestStatus;
    final fromEmailAddress = this.fromEmailAddress;
    final reportId = this.reportId;
    final reportName = this.reportName;
    final subject = this.subject;
    return {
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (deliverabilityTestStatus != null)
        'DeliverabilityTestStatus': deliverabilityTestStatus.toValue(),
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (reportId != null) 'ReportId': reportId,
      if (reportName != null) 'ReportName': reportName,
      if (subject != null) 'Subject': subject,
    };
  }
}

/// The status of a predictive inbox placement test. If the status is
/// <code>IN_PROGRESS</code>, then the predictive inbox placement test is
/// currently running. Predictive inbox placement tests are usually complete
/// within 24 hours of creating the test. If the status is
/// <code>COMPLETE</code>, then the test is finished, and you can use the
/// <code>GetDeliverabilityTestReport</code> operation to view the results of
/// the test.
enum DeliverabilityTestStatus {
  inProgress,
  completed,
}

extension DeliverabilityTestStatusValueExtension on DeliverabilityTestStatus {
  String toValue() {
    switch (this) {
      case DeliverabilityTestStatus.inProgress:
        return 'IN_PROGRESS';
      case DeliverabilityTestStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension DeliverabilityTestStatusFromString on String {
  DeliverabilityTestStatus toDeliverabilityTestStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return DeliverabilityTestStatus.inProgress;
      case 'COMPLETED':
        return DeliverabilityTestStatus.completed;
    }
    throw Exception('$this is not known in enum DeliverabilityTestStatus');
  }
}

/// The type of delivery events:
///
/// <ul>
/// <li>
/// <code>SEND</code> - The send request was successful and SES will attempt to
/// deliver the message to the recipient’s mail server. (If account-level or
/// global suppression is being used, SES will still count it as a send, but
/// delivery is suppressed.)
/// </li>
/// <li>
/// <code>DELIVERY</code> - SES successfully delivered the email to the
/// recipient's mail server. Excludes deliveries to the mailbox simulator and
/// emails addressed to more than one recipient.
/// </li>
/// <li>
/// <code>TRANSIENT_BOUNCE</code> - Feedback received for delivery failures
/// excluding issues with non-existent mailboxes. Excludes bounces from the
/// mailbox simulator, and those from emails addressed to more than one
/// recipient.
/// </li>
/// <li>
/// <code>PERMANENT_BOUNCE</code> - Feedback received for emails sent to
/// non-existent mailboxes. Excludes bounces from the mailbox simulator, those
/// originating from your account-level suppression list (if enabled), and those
/// from emails addressed to more than one recipient.
/// </li>
/// <li>
/// <code>UNDETERMINED_BOUNCE</code> - SES was unable to determine the bounce
/// reason.
/// </li>
/// <li>
/// <code>COMPLAINT</code> - Complaint received for the email. This excludes
/// complaints from the mailbox simulator, those originating from your
/// account-level suppression list (if enabled), and those from emails addressed
/// to more than one recipient.
/// </li>
/// </ul>
enum DeliveryEventType {
  send,
  delivery,
  transientBounce,
  permanentBounce,
  undeterminedBounce,
  complaint,
}

extension DeliveryEventTypeValueExtension on DeliveryEventType {
  String toValue() {
    switch (this) {
      case DeliveryEventType.send:
        return 'SEND';
      case DeliveryEventType.delivery:
        return 'DELIVERY';
      case DeliveryEventType.transientBounce:
        return 'TRANSIENT_BOUNCE';
      case DeliveryEventType.permanentBounce:
        return 'PERMANENT_BOUNCE';
      case DeliveryEventType.undeterminedBounce:
        return 'UNDETERMINED_BOUNCE';
      case DeliveryEventType.complaint:
        return 'COMPLAINT';
    }
  }
}

extension DeliveryEventTypeFromString on String {
  DeliveryEventType toDeliveryEventType() {
    switch (this) {
      case 'SEND':
        return DeliveryEventType.send;
      case 'DELIVERY':
        return DeliveryEventType.delivery;
      case 'TRANSIENT_BOUNCE':
        return DeliveryEventType.transientBounce;
      case 'PERMANENT_BOUNCE':
        return DeliveryEventType.permanentBounce;
      case 'UNDETERMINED_BOUNCE':
        return DeliveryEventType.undeterminedBounce;
      case 'COMPLAINT':
        return DeliveryEventType.complaint;
    }
    throw Exception('$this is not known in enum DeliveryEventType');
  }
}

/// Used to associate a configuration set with a dedicated IP pool.
class DeliveryOptions {
  /// The name of the dedicated IP pool to associate with the configuration set.
  final String? sendingPoolName;

  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS). If the value is <code>Require</code>,
  /// messages are only delivered if a TLS connection can be established. If the
  /// value is <code>Optional</code>, messages can be delivered in plain text if a
  /// TLS connection can't be established.
  final TlsPolicy? tlsPolicy;

  DeliveryOptions({
    this.sendingPoolName,
    this.tlsPolicy,
  });

  factory DeliveryOptions.fromJson(Map<String, dynamic> json) {
    return DeliveryOptions(
      sendingPoolName: json['SendingPoolName'] as String?,
      tlsPolicy: (json['TlsPolicy'] as String?)?.toTlsPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final sendingPoolName = this.sendingPoolName;
    final tlsPolicy = this.tlsPolicy;
    return {
      if (sendingPoolName != null) 'SendingPoolName': sendingPoolName,
      if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.toValue(),
    };
  }
}

/// An object that describes the recipients for an email.
/// <note>
/// Amazon SES does not support the SMTPUTF8 extension, as described in <a
/// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason, the
/// <i>local part</i> of a destination email address (the part of the email
/// address that precedes the @ sign) may only contain <a
/// href="https://en.wikipedia.org/wiki/Email_address#Local-part">7-bit ASCII
/// characters</a>. If the <i>domain part</i> of an address (the part after the
/// @ sign) contains non-ASCII characters, they must be encoded using Punycode,
/// as described in <a
/// href="https://tools.ietf.org/html/rfc3492.html">RFC3492</a>.
/// </note>
class Destination {
  /// An array that contains the email addresses of the "BCC" (blind carbon copy)
  /// recipients for the email.
  final List<String>? bccAddresses;

  /// An array that contains the email addresses of the "CC" (carbon copy)
  /// recipients for the email.
  final List<String>? ccAddresses;

  /// An array that contains the email addresses of the "To" recipients for the
  /// email.
  final List<String>? toAddresses;

  Destination({
    this.bccAddresses,
    this.ccAddresses,
    this.toAddresses,
  });

  Map<String, dynamic> toJson() {
    final bccAddresses = this.bccAddresses;
    final ccAddresses = this.ccAddresses;
    final toAddresses = this.toAddresses;
    return {
      if (bccAddresses != null) 'BccAddresses': bccAddresses,
      if (ccAddresses != null) 'CcAddresses': ccAddresses,
      if (toAddresses != null) 'ToAddresses': toAddresses,
    };
  }
}

/// The location where the Amazon SES API v2 finds the value of a dimension to
/// publish to Amazon CloudWatch. To use the message tags that you specify using
/// an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to the
/// <code>SendEmail</code> or <code>SendRawEmail</code> API, choose
/// <code>messageTag</code>. To use your own email headers, choose
/// <code>emailHeader</code>. To use link tags, choose <code>linkTags</code>.
enum DimensionValueSource {
  messageTag,
  emailHeader,
  linkTag,
}

extension DimensionValueSourceValueExtension on DimensionValueSource {
  String toValue() {
    switch (this) {
      case DimensionValueSource.messageTag:
        return 'MESSAGE_TAG';
      case DimensionValueSource.emailHeader:
        return 'EMAIL_HEADER';
      case DimensionValueSource.linkTag:
        return 'LINK_TAG';
    }
  }
}

extension DimensionValueSourceFromString on String {
  DimensionValueSource toDimensionValueSource() {
    switch (this) {
      case 'MESSAGE_TAG':
        return DimensionValueSource.messageTag;
      case 'EMAIL_HEADER':
        return DimensionValueSource.emailHeader;
      case 'LINK_TAG':
        return DimensionValueSource.linkTag;
    }
    throw Exception('$this is not known in enum DimensionValueSource');
  }
}

/// An object that contains information about the DKIM authentication status for
/// an email identity.
///
/// Amazon SES determines the authentication status by searching for specific
/// records in the DNS configuration for the domain. If you used <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
/// DKIM</a> to set up DKIM authentication, Amazon SES tries to find three
/// unique CNAME records in the DNS configuration for your domain. If you
/// provided a public key to perform DKIM authentication, Amazon SES tries to
/// find a TXT record that uses the selector that you specified. The value of
/// the TXT record must be a public key that's paired with the private key that
/// you specified in the process of creating the identity
class DkimAttributes {
  /// [Easy DKIM] The key length of the DKIM key pair in use.
  final DkimSigningKeyLength? currentSigningKeyLength;

  /// [Easy DKIM] The last time a key pair was generated for this identity.
  final DateTime? lastKeyGenerationTimestamp;

  /// [Easy DKIM] The key length of the future DKIM key pair to be generated. This
  /// can be changed at most once per day.
  final DkimSigningKeyLength? nextSigningKeyLength;

  /// A string that indicates how DKIM was configured for the identity. These are
  /// the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_SES</code> – Indicates that DKIM was configured for the identity
  /// by using <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a>.
  /// </li>
  /// <li>
  /// <code>EXTERNAL</code> – Indicates that DKIM was configured for the identity
  /// by using Bring Your Own DKIM (BYODKIM).
  /// </li>
  /// </ul>
  final DkimSigningAttributesOrigin? signingAttributesOrigin;

  /// If the value is <code>true</code>, then the messages that you send from the
  /// identity are signed using DKIM. If the value is <code>false</code>, then the
  /// messages that you send from the identity aren't DKIM-signed.
  final bool? signingEnabled;

  /// Describes whether or not Amazon SES has successfully located the DKIM
  /// records in the DNS records for the domain. The status can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – The verification process was initiated, but Amazon
  /// SES hasn't yet detected the DKIM records in the DNS configuration for the
  /// domain.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – The verification process completed successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – The verification process failed. This typically occurs
  /// when Amazon SES fails to find the DKIM records in the DNS configuration of
  /// the domain.
  /// </li>
  /// <li>
  /// <code>TEMPORARY_FAILURE</code> – A temporary issue is preventing Amazon SES
  /// from determining the DKIM authentication status of the domain.
  /// </li>
  /// <li>
  /// <code>NOT_STARTED</code> – The DKIM verification process hasn't been
  /// initiated for the domain.
  /// </li>
  /// </ul>
  final DkimStatus? status;

  /// If you used <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a> to configure DKIM authentication for the domain, then this object
  /// contains a set of unique strings that you use to create a set of CNAME
  /// records that you add to the DNS configuration for your domain. When Amazon
  /// SES detects these records in the DNS configuration for your domain, the DKIM
  /// authentication process is complete.
  ///
  /// If you configured DKIM authentication for the domain by providing your own
  /// public-private key pair, then this object contains the selector for the
  /// public key.
  ///
  /// Regardless of the DKIM authentication method you use, Amazon SES searches
  /// for the appropriate records in the DNS configuration of the domain for up to
  /// 72 hours.
  final List<String>? tokens;

  DkimAttributes({
    this.currentSigningKeyLength,
    this.lastKeyGenerationTimestamp,
    this.nextSigningKeyLength,
    this.signingAttributesOrigin,
    this.signingEnabled,
    this.status,
    this.tokens,
  });

  factory DkimAttributes.fromJson(Map<String, dynamic> json) {
    return DkimAttributes(
      currentSigningKeyLength: (json['CurrentSigningKeyLength'] as String?)
          ?.toDkimSigningKeyLength(),
      lastKeyGenerationTimestamp:
          timeStampFromJson(json['LastKeyGenerationTimestamp']),
      nextSigningKeyLength:
          (json['NextSigningKeyLength'] as String?)?.toDkimSigningKeyLength(),
      signingAttributesOrigin: (json['SigningAttributesOrigin'] as String?)
          ?.toDkimSigningAttributesOrigin(),
      signingEnabled: json['SigningEnabled'] as bool?,
      status: (json['Status'] as String?)?.toDkimStatus(),
      tokens: (json['Tokens'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final currentSigningKeyLength = this.currentSigningKeyLength;
    final lastKeyGenerationTimestamp = this.lastKeyGenerationTimestamp;
    final nextSigningKeyLength = this.nextSigningKeyLength;
    final signingAttributesOrigin = this.signingAttributesOrigin;
    final signingEnabled = this.signingEnabled;
    final status = this.status;
    final tokens = this.tokens;
    return {
      if (currentSigningKeyLength != null)
        'CurrentSigningKeyLength': currentSigningKeyLength.toValue(),
      if (lastKeyGenerationTimestamp != null)
        'LastKeyGenerationTimestamp':
            unixTimestampToJson(lastKeyGenerationTimestamp),
      if (nextSigningKeyLength != null)
        'NextSigningKeyLength': nextSigningKeyLength.toValue(),
      if (signingAttributesOrigin != null)
        'SigningAttributesOrigin': signingAttributesOrigin.toValue(),
      if (signingEnabled != null) 'SigningEnabled': signingEnabled,
      if (status != null) 'Status': status.toValue(),
      if (tokens != null) 'Tokens': tokens,
    };
  }
}

/// An object that contains configuration for Bring Your Own DKIM (BYODKIM), or,
/// for Easy DKIM
class DkimSigningAttributes {
  /// [Bring Your Own DKIM] A private key that's used to generate a DKIM
  /// signature.
  ///
  /// The private key must use 1024 or 2048-bit RSA encryption, and must be
  /// encoded using base64 encoding.
  final String? domainSigningPrivateKey;

  /// [Bring Your Own DKIM] A string that's used to identify a public key in the
  /// DNS configuration for a domain.
  final String? domainSigningSelector;

  /// [Easy DKIM] The key length of the future DKIM key pair to be generated. This
  /// can be changed at most once per day.
  final DkimSigningKeyLength? nextSigningKeyLength;

  DkimSigningAttributes({
    this.domainSigningPrivateKey,
    this.domainSigningSelector,
    this.nextSigningKeyLength,
  });

  Map<String, dynamic> toJson() {
    final domainSigningPrivateKey = this.domainSigningPrivateKey;
    final domainSigningSelector = this.domainSigningSelector;
    final nextSigningKeyLength = this.nextSigningKeyLength;
    return {
      if (domainSigningPrivateKey != null)
        'DomainSigningPrivateKey': domainSigningPrivateKey,
      if (domainSigningSelector != null)
        'DomainSigningSelector': domainSigningSelector,
      if (nextSigningKeyLength != null)
        'NextSigningKeyLength': nextSigningKeyLength.toValue(),
    };
  }
}

enum DkimSigningAttributesOrigin {
  awsSes,
  external,
}

extension DkimSigningAttributesOriginValueExtension
    on DkimSigningAttributesOrigin {
  String toValue() {
    switch (this) {
      case DkimSigningAttributesOrigin.awsSes:
        return 'AWS_SES';
      case DkimSigningAttributesOrigin.external:
        return 'EXTERNAL';
    }
  }
}

extension DkimSigningAttributesOriginFromString on String {
  DkimSigningAttributesOrigin toDkimSigningAttributesOrigin() {
    switch (this) {
      case 'AWS_SES':
        return DkimSigningAttributesOrigin.awsSes;
      case 'EXTERNAL':
        return DkimSigningAttributesOrigin.external;
    }
    throw Exception('$this is not known in enum DkimSigningAttributesOrigin');
  }
}

enum DkimSigningKeyLength {
  rsa_1024Bit,
  rsa_2048Bit,
}

extension DkimSigningKeyLengthValueExtension on DkimSigningKeyLength {
  String toValue() {
    switch (this) {
      case DkimSigningKeyLength.rsa_1024Bit:
        return 'RSA_1024_BIT';
      case DkimSigningKeyLength.rsa_2048Bit:
        return 'RSA_2048_BIT';
    }
  }
}

extension DkimSigningKeyLengthFromString on String {
  DkimSigningKeyLength toDkimSigningKeyLength() {
    switch (this) {
      case 'RSA_1024_BIT':
        return DkimSigningKeyLength.rsa_1024Bit;
      case 'RSA_2048_BIT':
        return DkimSigningKeyLength.rsa_2048Bit;
    }
    throw Exception('$this is not known in enum DkimSigningKeyLength');
  }
}

/// The DKIM authentication status of the identity. The status can be one of the
/// following:
///
/// <ul>
/// <li>
/// <code>PENDING</code> – The verification process was initiated, but Amazon
/// SES hasn't yet detected the DKIM records in the DNS configuration for the
/// domain.
/// </li>
/// <li>
/// <code>SUCCESS</code> – The verification process completed successfully.
/// </li>
/// <li>
/// <code>FAILED</code> – The verification process failed. This typically occurs
/// when Amazon SES fails to find the DKIM records in the DNS configuration of
/// the domain.
/// </li>
/// <li>
/// <code>TEMPORARY_FAILURE</code> – A temporary issue is preventing Amazon SES
/// from determining the DKIM authentication status of the domain.
/// </li>
/// <li>
/// <code>NOT_STARTED</code> – The DKIM verification process hasn't been
/// initiated for the domain.
/// </li>
/// </ul>
enum DkimStatus {
  pending,
  success,
  failed,
  temporaryFailure,
  notStarted,
}

extension DkimStatusValueExtension on DkimStatus {
  String toValue() {
    switch (this) {
      case DkimStatus.pending:
        return 'PENDING';
      case DkimStatus.success:
        return 'SUCCESS';
      case DkimStatus.failed:
        return 'FAILED';
      case DkimStatus.temporaryFailure:
        return 'TEMPORARY_FAILURE';
      case DkimStatus.notStarted:
        return 'NOT_STARTED';
    }
  }
}

extension DkimStatusFromString on String {
  DkimStatus toDkimStatus() {
    switch (this) {
      case 'PENDING':
        return DkimStatus.pending;
      case 'SUCCESS':
        return DkimStatus.success;
      case 'FAILED':
        return DkimStatus.failed;
      case 'TEMPORARY_FAILURE':
        return DkimStatus.temporaryFailure;
      case 'NOT_STARTED':
        return DkimStatus.notStarted;
    }
    throw Exception('$this is not known in enum DkimStatus');
  }
}

/// An object that contains the deliverability data for a specific campaign.
/// This data is available for a campaign only if the campaign sent email by
/// using a domain that the Deliverability dashboard is enabled for
/// (<code>PutDeliverabilityDashboardOption</code> operation).
class DomainDeliverabilityCampaign {
  /// The unique identifier for the campaign. The Deliverability dashboard
  /// automatically generates and assigns this identifier to a campaign.
  final String? campaignId;

  /// The percentage of email messages that were deleted by recipients, without
  /// being opened first. Due to technical limitations, this value only includes
  /// recipients who opened the message by using an email client that supports
  /// images.
  final double? deleteRate;

  /// The major email providers who handled the email message.
  final List<String>? esps;

  /// The first time when the email message was delivered to any recipient's
  /// inbox. This value can help you determine how long it took for a campaign to
  /// deliver an email message.
  final DateTime? firstSeenDateTime;

  /// The verified email address that the email message was sent from.
  final String? fromAddress;

  /// The URL of an image that contains a snapshot of the email message that was
  /// sent.
  final String? imageUrl;

  /// The number of email messages that were delivered to recipients’ inboxes.
  final int? inboxCount;

  /// The last time when the email message was delivered to any recipient's inbox.
  /// This value can help you determine how long it took for a campaign to deliver
  /// an email message.
  final DateTime? lastSeenDateTime;

  /// The projected number of recipients that the email message was sent to.
  final int? projectedVolume;

  /// The percentage of email messages that were opened and then deleted by
  /// recipients. Due to technical limitations, this value only includes
  /// recipients who opened the message by using an email client that supports
  /// images.
  final double? readDeleteRate;

  /// The percentage of email messages that were opened by recipients. Due to
  /// technical limitations, this value only includes recipients who opened the
  /// message by using an email client that supports images.
  final double? readRate;

  /// The IP addresses that were used to send the email message.
  final List<String>? sendingIps;

  /// The number of email messages that were delivered to recipients' spam or junk
  /// mail folders.
  final int? spamCount;

  /// The subject line, or title, of the email message.
  final String? subject;

  DomainDeliverabilityCampaign({
    this.campaignId,
    this.deleteRate,
    this.esps,
    this.firstSeenDateTime,
    this.fromAddress,
    this.imageUrl,
    this.inboxCount,
    this.lastSeenDateTime,
    this.projectedVolume,
    this.readDeleteRate,
    this.readRate,
    this.sendingIps,
    this.spamCount,
    this.subject,
  });

  factory DomainDeliverabilityCampaign.fromJson(Map<String, dynamic> json) {
    return DomainDeliverabilityCampaign(
      campaignId: json['CampaignId'] as String?,
      deleteRate: json['DeleteRate'] as double?,
      esps: (json['Esps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      firstSeenDateTime: timeStampFromJson(json['FirstSeenDateTime']),
      fromAddress: json['FromAddress'] as String?,
      imageUrl: json['ImageUrl'] as String?,
      inboxCount: json['InboxCount'] as int?,
      lastSeenDateTime: timeStampFromJson(json['LastSeenDateTime']),
      projectedVolume: json['ProjectedVolume'] as int?,
      readDeleteRate: json['ReadDeleteRate'] as double?,
      readRate: json['ReadRate'] as double?,
      sendingIps: (json['SendingIps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      spamCount: json['SpamCount'] as int?,
      subject: json['Subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignId = this.campaignId;
    final deleteRate = this.deleteRate;
    final esps = this.esps;
    final firstSeenDateTime = this.firstSeenDateTime;
    final fromAddress = this.fromAddress;
    final imageUrl = this.imageUrl;
    final inboxCount = this.inboxCount;
    final lastSeenDateTime = this.lastSeenDateTime;
    final projectedVolume = this.projectedVolume;
    final readDeleteRate = this.readDeleteRate;
    final readRate = this.readRate;
    final sendingIps = this.sendingIps;
    final spamCount = this.spamCount;
    final subject = this.subject;
    return {
      if (campaignId != null) 'CampaignId': campaignId,
      if (deleteRate != null) 'DeleteRate': deleteRate,
      if (esps != null) 'Esps': esps,
      if (firstSeenDateTime != null)
        'FirstSeenDateTime': unixTimestampToJson(firstSeenDateTime),
      if (fromAddress != null) 'FromAddress': fromAddress,
      if (imageUrl != null) 'ImageUrl': imageUrl,
      if (inboxCount != null) 'InboxCount': inboxCount,
      if (lastSeenDateTime != null)
        'LastSeenDateTime': unixTimestampToJson(lastSeenDateTime),
      if (projectedVolume != null) 'ProjectedVolume': projectedVolume,
      if (readDeleteRate != null) 'ReadDeleteRate': readDeleteRate,
      if (readRate != null) 'ReadRate': readRate,
      if (sendingIps != null) 'SendingIps': sendingIps,
      if (spamCount != null) 'SpamCount': spamCount,
      if (subject != null) 'Subject': subject,
    };
  }
}

/// An object that contains information about the Deliverability dashboard
/// subscription for a verified domain that you use to send email and currently
/// has an active Deliverability dashboard subscription. If a Deliverability
/// dashboard subscription is active for a domain, you gain access to
/// reputation, inbox placement, and other metrics for the domain.
class DomainDeliverabilityTrackingOption {
  /// A verified domain that’s associated with your Amazon Web Services account
  /// and currently has an active Deliverability dashboard subscription.
  final String? domain;

  /// An object that contains information about the inbox placement data settings
  /// for the domain.
  final InboxPlacementTrackingOption? inboxPlacementTrackingOption;

  /// The date when you enabled the Deliverability dashboard for the domain.
  final DateTime? subscriptionStartDate;

  DomainDeliverabilityTrackingOption({
    this.domain,
    this.inboxPlacementTrackingOption,
    this.subscriptionStartDate,
  });

  factory DomainDeliverabilityTrackingOption.fromJson(
      Map<String, dynamic> json) {
    return DomainDeliverabilityTrackingOption(
      domain: json['Domain'] as String?,
      inboxPlacementTrackingOption: json['InboxPlacementTrackingOption'] != null
          ? InboxPlacementTrackingOption.fromJson(
              json['InboxPlacementTrackingOption'] as Map<String, dynamic>)
          : null,
      subscriptionStartDate: timeStampFromJson(json['SubscriptionStartDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final inboxPlacementTrackingOption = this.inboxPlacementTrackingOption;
    final subscriptionStartDate = this.subscriptionStartDate;
    return {
      if (domain != null) 'Domain': domain,
      if (inboxPlacementTrackingOption != null)
        'InboxPlacementTrackingOption': inboxPlacementTrackingOption,
      if (subscriptionStartDate != null)
        'SubscriptionStartDate': unixTimestampToJson(subscriptionStartDate),
    };
  }
}

/// An object that contains inbox placement data for email sent from one of your
/// email domains to a specific email provider.
class DomainIspPlacement {
  /// The percentage of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' inboxes.
  final double? inboxPercentage;

  /// The total number of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' inboxes.
  final int? inboxRawCount;

  /// The name of the email provider that the inbox placement data applies to.
  final String? ispName;

  /// The percentage of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' spam or junk mail
  /// folders.
  final double? spamPercentage;

  /// The total number of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' spam or junk mail
  /// folders.
  final int? spamRawCount;

  DomainIspPlacement({
    this.inboxPercentage,
    this.inboxRawCount,
    this.ispName,
    this.spamPercentage,
    this.spamRawCount,
  });

  factory DomainIspPlacement.fromJson(Map<String, dynamic> json) {
    return DomainIspPlacement(
      inboxPercentage: json['InboxPercentage'] as double?,
      inboxRawCount: json['InboxRawCount'] as int?,
      ispName: json['IspName'] as String?,
      spamPercentage: json['SpamPercentage'] as double?,
      spamRawCount: json['SpamRawCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inboxPercentage = this.inboxPercentage;
    final inboxRawCount = this.inboxRawCount;
    final ispName = this.ispName;
    final spamPercentage = this.spamPercentage;
    final spamRawCount = this.spamRawCount;
    return {
      if (inboxPercentage != null) 'InboxPercentage': inboxPercentage,
      if (inboxRawCount != null) 'InboxRawCount': inboxRawCount,
      if (ispName != null) 'IspName': ispName,
      if (spamPercentage != null) 'SpamPercentage': spamPercentage,
      if (spamRawCount != null) 'SpamRawCount': spamRawCount,
    };
  }
}

/// An object that defines the entire content of the email, including the
/// message headers and the body content. You can create a simple email message,
/// in which you specify the subject and the text and HTML versions of the
/// message body. You can also create raw messages, in which you specify a
/// complete MIME-formatted message. Raw messages can include attachments and
/// custom headers.
class EmailContent {
  /// The raw email message. The message has to meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// The message has to contain a header and a body, separated by one blank line.
  /// </li>
  /// <li>
  /// All of the required header fields must be present in the message.
  /// </li>
  /// <li>
  /// Each part of a multipart MIME message must be formatted properly.
  /// </li>
  /// <li>
  /// If you include attachments, they must be in a file format that the Amazon
  /// SES API v2 supports.
  /// </li>
  /// <li>
  /// The raw data of the message needs to base64-encoded if you are accessing
  /// Amazon SES directly through the HTTPS interface. If you are accessing Amazon
  /// SES using an Amazon Web Services SDK, the SDK takes care of the base
  /// 64-encoding for you.
  /// </li>
  /// <li>
  /// If any of the MIME parts in your message contain content that is outside of
  /// the 7-bit ASCII character range, you should encode that content to ensure
  /// that recipients' email clients render the message properly.
  /// </li>
  /// <li>
  /// The length of any single line of text in the message can't exceed 1,000
  /// characters. This restriction is defined in <a
  /// href="https://tools.ietf.org/html/rfc5321">RFC 5321</a>.
  /// </li>
  /// </ul>
  final RawMessage? raw;

  /// The simple email message. The message consists of a subject and a message
  /// body.
  final Message? simple;

  /// The template to use for the email message.
  final Template? template;

  EmailContent({
    this.raw,
    this.simple,
    this.template,
  });

  Map<String, dynamic> toJson() {
    final raw = this.raw;
    final simple = this.simple;
    final template = this.template;
    return {
      if (raw != null) 'Raw': raw,
      if (simple != null) 'Simple': simple,
      if (template != null) 'Template': template,
    };
  }
}

/// An email's insights contain metadata and delivery information about a
/// specific email.
class EmailInsights {
  /// The recipient of the email.
  final String? destination;

  /// A list of events associated with the sent email.
  final List<InsightsEvent>? events;

  /// The recipient's ISP (e.g., <code>Gmail</code>, <code>Yahoo</code>, etc.).
  final String? isp;

  EmailInsights({
    this.destination,
    this.events,
    this.isp,
  });

  factory EmailInsights.fromJson(Map<String, dynamic> json) {
    return EmailInsights(
      destination: json['Destination'] as String?,
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => InsightsEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      isp: json['Isp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final events = this.events;
    final isp = this.isp;
    return {
      if (destination != null) 'Destination': destination,
      if (events != null) 'Events': events,
      if (isp != null) 'Isp': isp,
    };
  }
}

/// The content of the email, composed of a subject line, an HTML part, and a
/// text-only part.
class EmailTemplateContent {
  /// The HTML body of the email.
  final String? html;

  /// The subject line of the email.
  final String? subject;

  /// The email body that will be visible to recipients whose email clients do not
  /// display HTML.
  final String? text;

  EmailTemplateContent({
    this.html,
    this.subject,
    this.text,
  });

  factory EmailTemplateContent.fromJson(Map<String, dynamic> json) {
    return EmailTemplateContent(
      html: json['Html'] as String?,
      subject: json['Subject'] as String?,
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final html = this.html;
    final subject = this.subject;
    final text = this.text;
    return {
      if (html != null) 'Html': html,
      if (subject != null) 'Subject': subject,
      if (text != null) 'Text': text,
    };
  }
}

/// Contains information about an email template.
class EmailTemplateMetadata {
  /// The time and date the template was created.
  final DateTime? createdTimestamp;

  /// The name of the template.
  final String? templateName;

  EmailTemplateMetadata({
    this.createdTimestamp,
    this.templateName,
  });

  factory EmailTemplateMetadata.fromJson(Map<String, dynamic> json) {
    return EmailTemplateMetadata(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      templateName: json['TemplateName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final templateName = this.templateName;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (templateName != null) 'TemplateName': templateName,
    };
  }
}

/// The type of delivery events:
///
/// <ul>
/// <li>
/// <code>OPEN</code> - Open event for emails including open trackers. Excludes
/// opens for emails addressed to more than one recipient.
/// </li>
/// <li>
/// <code>CLICK</code> - Click event for emails including wrapped links.
/// Excludes clicks for emails addressed to more than one recipient.
/// </li>
/// </ul>
enum EngagementEventType {
  open,
  click,
}

extension EngagementEventTypeValueExtension on EngagementEventType {
  String toValue() {
    switch (this) {
      case EngagementEventType.open:
        return 'OPEN';
      case EngagementEventType.click:
        return 'CLICK';
    }
  }
}

extension EngagementEventTypeFromString on String {
  EngagementEventType toEngagementEventType() {
    switch (this) {
      case 'OPEN':
        return EngagementEventType.open;
      case 'CLICK':
        return EngagementEventType.click;
    }
    throw Exception('$this is not known in enum EngagementEventType');
  }
}

/// In the Amazon SES API v2, <i>events</i> include message sends, deliveries,
/// opens, clicks, bounces, complaints and delivery delays. <i>Event
/// destinations</i> are places that you can send information about these events
/// to. For example, you can send event data to Amazon SNS to receive
/// notifications when you receive bounces or complaints, or you can use Amazon
/// Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.
class EventDestination {
  /// The types of events that Amazon SES sends to the specified event
  /// destinations.
  ///
  /// <ul>
  /// <li>
  /// <code>SEND</code> - The send request was successful and SES will attempt to
  /// deliver the message to the recipient’s mail server. (If account-level or
  /// global suppression is being used, SES will still count it as a send, but
  /// delivery is suppressed.)
  /// </li>
  /// <li>
  /// <code>REJECT</code> - SES accepted the email, but determined that it
  /// contained a virus and didn’t attempt to deliver it to the recipient’s mail
  /// server.
  /// </li>
  /// <li>
  /// <code>BOUNCE</code> - (<i>Hard bounce</i>) The recipient's mail server
  /// permanently rejected the email. (<i>Soft bounces</i> are only included when
  /// SES fails to deliver the email after retrying for a period of time.)
  /// </li>
  /// <li>
  /// <code>COMPLAINT</code> - The email was successfully delivered to the
  /// recipient’s mail server, but the recipient marked it as spam.
  /// </li>
  /// <li>
  /// <code>DELIVERY</code> - SES successfully delivered the email to the
  /// recipient's mail server.
  /// </li>
  /// <li>
  /// <code>OPEN</code> - The recipient received the message and opened it in
  /// their email client.
  /// </li>
  /// <li>
  /// <code>CLICK</code> - The recipient clicked one or more links in the email.
  /// </li>
  /// <li>
  /// <code>RENDERING_FAILURE</code> - The email wasn't sent because of a template
  /// rendering issue. This event type can occur when template data is missing, or
  /// when there is a mismatch between template parameters and data. (This event
  /// type only occurs when you send email using the <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_SendTemplatedEmail.html">
  /// <code>SendTemplatedEmail</code> </a> or <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_SendBulkTemplatedEmail.html">
  /// <code>SendBulkTemplatedEmail</code> </a> API operations.)
  /// </li>
  /// <li>
  /// <code>DELIVERY_DELAY</code> - The email couldn't be delivered to the
  /// recipient’s mail server because a temporary issue occurred. Delivery delays
  /// can occur, for example, when the recipient's inbox is full, or when the
  /// receiving email server experiences a transient issue.
  /// </li>
  /// <li>
  /// <code>SUBSCRIPTION</code> - The email was successfully delivered, but the
  /// recipient updated their subscription preferences by clicking on an
  /// <i>unsubscribe</i> link as part of your <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-email-subscription-management.html">subscription
  /// management</a>.
  /// </li>
  /// </ul>
  final List<EventType> matchingEventTypes;

  /// A name that identifies the event destination.
  final String name;

  /// An object that defines an Amazon CloudWatch destination for email events.
  /// You can use Amazon CloudWatch to monitor and gain insights on your email
  /// sending metrics.
  final CloudWatchDestination? cloudWatchDestination;

  /// If <code>true</code>, the event destination is enabled. When the event
  /// destination is enabled, the specified event types are sent to the
  /// destinations in this <code>EventDestinationDefinition</code>.
  ///
  /// If <code>false</code>, the event destination is disabled. When the event
  /// destination is disabled, events aren't sent to the specified destinations.
  final bool? enabled;

  /// An object that defines an Amazon Kinesis Data Firehose destination for email
  /// events. You can use Amazon Kinesis Data Firehose to stream data to other
  /// services, such as Amazon S3 and Amazon Redshift.
  final KinesisFirehoseDestination? kinesisFirehoseDestination;

  /// An object that defines an Amazon Pinpoint project destination for email
  /// events. You can send email event data to a Amazon Pinpoint project to view
  /// metrics using the Transactional Messaging dashboards that are built in to
  /// Amazon Pinpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional
  /// Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.
  final PinpointDestination? pinpointDestination;

  /// An object that defines an Amazon SNS destination for email events. You can
  /// use Amazon SNS to send notification when certain email events occur.
  final SnsDestination? snsDestination;

  EventDestination({
    required this.matchingEventTypes,
    required this.name,
    this.cloudWatchDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.pinpointDestination,
    this.snsDestination,
  });

  factory EventDestination.fromJson(Map<String, dynamic> json) {
    return EventDestination(
      matchingEventTypes: (json['MatchingEventTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toEventType())
          .toList(),
      name: json['Name'] as String,
      cloudWatchDestination: json['CloudWatchDestination'] != null
          ? CloudWatchDestination.fromJson(
              json['CloudWatchDestination'] as Map<String, dynamic>)
          : null,
      enabled: json['Enabled'] as bool?,
      kinesisFirehoseDestination: json['KinesisFirehoseDestination'] != null
          ? KinesisFirehoseDestination.fromJson(
              json['KinesisFirehoseDestination'] as Map<String, dynamic>)
          : null,
      pinpointDestination: json['PinpointDestination'] != null
          ? PinpointDestination.fromJson(
              json['PinpointDestination'] as Map<String, dynamic>)
          : null,
      snsDestination: json['SnsDestination'] != null
          ? SnsDestination.fromJson(
              json['SnsDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final matchingEventTypes = this.matchingEventTypes;
    final name = this.name;
    final cloudWatchDestination = this.cloudWatchDestination;
    final enabled = this.enabled;
    final kinesisFirehoseDestination = this.kinesisFirehoseDestination;
    final pinpointDestination = this.pinpointDestination;
    final snsDestination = this.snsDestination;
    return {
      'MatchingEventTypes': matchingEventTypes.map((e) => e.toValue()).toList(),
      'Name': name,
      if (cloudWatchDestination != null)
        'CloudWatchDestination': cloudWatchDestination,
      if (enabled != null) 'Enabled': enabled,
      if (kinesisFirehoseDestination != null)
        'KinesisFirehoseDestination': kinesisFirehoseDestination,
      if (pinpointDestination != null)
        'PinpointDestination': pinpointDestination,
      if (snsDestination != null) 'SnsDestination': snsDestination,
    };
  }
}

/// An object that defines the event destination. Specifically, it defines which
/// services receive events from emails sent using the configuration set that
/// the event destination is associated with. Also defines the types of events
/// that are sent to the event destination.
class EventDestinationDefinition {
  /// An object that defines an Amazon CloudWatch destination for email events.
  /// You can use Amazon CloudWatch to monitor and gain insights on your email
  /// sending metrics.
  final CloudWatchDestination? cloudWatchDestination;

  /// If <code>true</code>, the event destination is enabled. When the event
  /// destination is enabled, the specified event types are sent to the
  /// destinations in this <code>EventDestinationDefinition</code>.
  ///
  /// If <code>false</code>, the event destination is disabled. When the event
  /// destination is disabled, events aren't sent to the specified destinations.
  final bool? enabled;

  /// An object that defines an Amazon Kinesis Data Firehose destination for email
  /// events. You can use Amazon Kinesis Data Firehose to stream data to other
  /// services, such as Amazon S3 and Amazon Redshift.
  final KinesisFirehoseDestination? kinesisFirehoseDestination;

  /// An array that specifies which events the Amazon SES API v2 should send to
  /// the destinations in this <code>EventDestinationDefinition</code>.
  final List<EventType>? matchingEventTypes;

  /// An object that defines an Amazon Pinpoint project destination for email
  /// events. You can send email event data to a Amazon Pinpoint project to view
  /// metrics using the Transactional Messaging dashboards that are built in to
  /// Amazon Pinpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional
  /// Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.
  final PinpointDestination? pinpointDestination;

  /// An object that defines an Amazon SNS destination for email events. You can
  /// use Amazon SNS to send notification when certain email events occur.
  final SnsDestination? snsDestination;

  EventDestinationDefinition({
    this.cloudWatchDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.pinpointDestination,
    this.snsDestination,
  });

  Map<String, dynamic> toJson() {
    final cloudWatchDestination = this.cloudWatchDestination;
    final enabled = this.enabled;
    final kinesisFirehoseDestination = this.kinesisFirehoseDestination;
    final matchingEventTypes = this.matchingEventTypes;
    final pinpointDestination = this.pinpointDestination;
    final snsDestination = this.snsDestination;
    return {
      if (cloudWatchDestination != null)
        'CloudWatchDestination': cloudWatchDestination,
      if (enabled != null) 'Enabled': enabled,
      if (kinesisFirehoseDestination != null)
        'KinesisFirehoseDestination': kinesisFirehoseDestination,
      if (matchingEventTypes != null)
        'MatchingEventTypes':
            matchingEventTypes.map((e) => e.toValue()).toList(),
      if (pinpointDestination != null)
        'PinpointDestination': pinpointDestination,
      if (snsDestination != null) 'SnsDestination': snsDestination,
    };
  }
}

/// Contains a <code>Bounce</code> object if the event type is
/// <code>BOUNCE</code>. Contains a <code>Complaint</code> object if the event
/// type is <code>COMPLAINT</code>.
class EventDetails {
  /// Information about a <code>Bounce</code> event.
  final Bounce? bounce;

  /// Information about a <code>Complaint</code> event.
  final Complaint? complaint;

  EventDetails({
    this.bounce,
    this.complaint,
  });

  factory EventDetails.fromJson(Map<String, dynamic> json) {
    return EventDetails(
      bounce: json['Bounce'] != null
          ? Bounce.fromJson(json['Bounce'] as Map<String, dynamic>)
          : null,
      complaint: json['Complaint'] != null
          ? Complaint.fromJson(json['Complaint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bounce = this.bounce;
    final complaint = this.complaint;
    return {
      if (bounce != null) 'Bounce': bounce,
      if (complaint != null) 'Complaint': complaint,
    };
  }
}

/// An email sending event type. For example, email sends, opens, and bounces
/// are all email events.
enum EventType {
  send,
  reject,
  bounce,
  complaint,
  delivery,
  open,
  click,
  renderingFailure,
  deliveryDelay,
  subscription,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.send:
        return 'SEND';
      case EventType.reject:
        return 'REJECT';
      case EventType.bounce:
        return 'BOUNCE';
      case EventType.complaint:
        return 'COMPLAINT';
      case EventType.delivery:
        return 'DELIVERY';
      case EventType.open:
        return 'OPEN';
      case EventType.click:
        return 'CLICK';
      case EventType.renderingFailure:
        return 'RENDERING_FAILURE';
      case EventType.deliveryDelay:
        return 'DELIVERY_DELAY';
      case EventType.subscription:
        return 'SUBSCRIPTION';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'SEND':
        return EventType.send;
      case 'REJECT':
        return EventType.reject;
      case 'BOUNCE':
        return EventType.bounce;
      case 'COMPLAINT':
        return EventType.complaint;
      case 'DELIVERY':
        return EventType.delivery;
      case 'OPEN':
        return EventType.open;
      case 'CLICK':
        return EventType.click;
      case 'RENDERING_FAILURE':
        return EventType.renderingFailure;
      case 'DELIVERY_DELAY':
        return EventType.deliveryDelay;
      case 'SUBSCRIPTION':
        return EventType.subscription;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

/// An object that contains details about the data source of the export job. It
/// can only contain one of <code>MetricsDataSource</code> or
/// <code>MessageInsightsDataSource</code> object.
class ExportDataSource {
  final MessageInsightsDataSource? messageInsightsDataSource;
  final MetricsDataSource? metricsDataSource;

  ExportDataSource({
    this.messageInsightsDataSource,
    this.metricsDataSource,
  });

  factory ExportDataSource.fromJson(Map<String, dynamic> json) {
    return ExportDataSource(
      messageInsightsDataSource: json['MessageInsightsDataSource'] != null
          ? MessageInsightsDataSource.fromJson(
              json['MessageInsightsDataSource'] as Map<String, dynamic>)
          : null,
      metricsDataSource: json['MetricsDataSource'] != null
          ? MetricsDataSource.fromJson(
              json['MetricsDataSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final messageInsightsDataSource = this.messageInsightsDataSource;
    final metricsDataSource = this.metricsDataSource;
    return {
      if (messageInsightsDataSource != null)
        'MessageInsightsDataSource': messageInsightsDataSource,
      if (metricsDataSource != null) 'MetricsDataSource': metricsDataSource,
    };
  }
}

/// An object that contains details about the destination of the export job.
class ExportDestination {
  /// The data format of the final export job file, can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CSV</code> - A comma-separated values file.
  /// </li>
  /// <li>
  /// <code>JSON</code> - A Json file.
  /// </li>
  /// </ul>
  final DataFormat dataFormat;

  /// An Amazon S3 pre-signed URL that points to the generated export file.
  final String? s3Url;

  ExportDestination({
    required this.dataFormat,
    this.s3Url,
  });

  factory ExportDestination.fromJson(Map<String, dynamic> json) {
    return ExportDestination(
      dataFormat: (json['DataFormat'] as String).toDataFormat(),
      s3Url: json['S3Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataFormat = this.dataFormat;
    final s3Url = this.s3Url;
    return {
      'DataFormat': dataFormat.toValue(),
      if (s3Url != null) 'S3Url': s3Url,
    };
  }
}

/// A summary of the export job.
class ExportJobSummary {
  /// The timestamp of when the export job was completed.
  final DateTime? completedTimestamp;

  /// The timestamp of when the export job was created.
  final DateTime? createdTimestamp;

  /// The source type of the export job.
  final ExportSourceType? exportSourceType;

  /// The export job ID.
  final String? jobId;

  /// The status of the export job.
  final JobStatus? jobStatus;

  ExportJobSummary({
    this.completedTimestamp,
    this.createdTimestamp,
    this.exportSourceType,
    this.jobId,
    this.jobStatus,
  });

  factory ExportJobSummary.fromJson(Map<String, dynamic> json) {
    return ExportJobSummary(
      completedTimestamp: timeStampFromJson(json['CompletedTimestamp']),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      exportSourceType:
          (json['ExportSourceType'] as String?)?.toExportSourceType(),
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final completedTimestamp = this.completedTimestamp;
    final createdTimestamp = this.createdTimestamp;
    final exportSourceType = this.exportSourceType;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (completedTimestamp != null)
        'CompletedTimestamp': unixTimestampToJson(completedTimestamp),
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (exportSourceType != null)
        'ExportSourceType': exportSourceType.toValue(),
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

/// An object that contains a mapping between a <code>Metric</code> and
/// <code>MetricAggregation</code>.
class ExportMetric {
  final MetricAggregation? aggregation;
  final Metric? name;

  ExportMetric({
    this.aggregation,
    this.name,
  });

  factory ExportMetric.fromJson(Map<String, dynamic> json) {
    return ExportMetric(
      aggregation: (json['Aggregation'] as String?)?.toMetricAggregation(),
      name: (json['Name'] as String?)?.toMetric(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final name = this.name;
    return {
      if (aggregation != null) 'Aggregation': aggregation.toValue(),
      if (name != null) 'Name': name.toValue(),
    };
  }
}

/// The type of data source of an export, can be one of the following:
///
/// <ul>
/// <li>
/// <code>METRICS_DATA</code> - The metrics export.
/// </li>
/// <li>
/// <code>MESSAGE_INSIGHTS</code> - The Message Insights export.
/// </li>
/// </ul>
enum ExportSourceType {
  metricsData,
  messageInsights,
}

extension ExportSourceTypeValueExtension on ExportSourceType {
  String toValue() {
    switch (this) {
      case ExportSourceType.metricsData:
        return 'METRICS_DATA';
      case ExportSourceType.messageInsights:
        return 'MESSAGE_INSIGHTS';
    }
  }
}

extension ExportSourceTypeFromString on String {
  ExportSourceType toExportSourceType() {
    switch (this) {
      case 'METRICS_DATA':
        return ExportSourceType.metricsData;
      case 'MESSAGE_INSIGHTS':
        return ExportSourceType.messageInsights;
    }
    throw Exception('$this is not known in enum ExportSourceType');
  }
}

/// Statistics about the execution of an export job.
class ExportStatistics {
  /// The number of records that were exported to the final export file.
  ///
  /// This value might not be available for all export source types
  final int? exportedRecordsCount;

  /// The number of records that were processed to generate the final export file.
  final int? processedRecordsCount;

  ExportStatistics({
    this.exportedRecordsCount,
    this.processedRecordsCount,
  });

  factory ExportStatistics.fromJson(Map<String, dynamic> json) {
    return ExportStatistics(
      exportedRecordsCount: json['ExportedRecordsCount'] as int?,
      processedRecordsCount: json['ProcessedRecordsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportedRecordsCount = this.exportedRecordsCount;
    final processedRecordsCount = this.processedRecordsCount;
    return {
      if (exportedRecordsCount != null)
        'ExportedRecordsCount': exportedRecordsCount,
      if (processedRecordsCount != null)
        'ProcessedRecordsCount': processedRecordsCount,
    };
  }
}

/// An object that contains the failure details about a job.
class FailureInfo {
  /// A message about why the job failed.
  final String? errorMessage;

  /// An Amazon S3 pre-signed URL that contains all the failed records and related
  /// information.
  final String? failedRecordsS3Url;

  FailureInfo({
    this.errorMessage,
    this.failedRecordsS3Url,
  });

  factory FailureInfo.fromJson(Map<String, dynamic> json) {
    return FailureInfo(
      errorMessage: json['ErrorMessage'] as String?,
      failedRecordsS3Url: json['FailedRecordsS3Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final failedRecordsS3Url = this.failedRecordsS3Url;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (failedRecordsS3Url != null) 'FailedRecordsS3Url': failedRecordsS3Url,
    };
  }
}

enum FeatureStatus {
  enabled,
  disabled,
}

extension FeatureStatusValueExtension on FeatureStatus {
  String toValue() {
    switch (this) {
      case FeatureStatus.enabled:
        return 'ENABLED';
      case FeatureStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension FeatureStatusFromString on String {
  FeatureStatus toFeatureStatus() {
    switch (this) {
      case 'ENABLED':
        return FeatureStatus.enabled;
      case 'DISABLED':
        return FeatureStatus.disabled;
    }
    throw Exception('$this is not known in enum FeatureStatus');
  }
}

/// A list of details about the email-sending capabilities of your Amazon SES
/// account in the current Amazon Web Services Region.
class GetAccountResponse {
  /// Indicates whether or not the automatic warm-up feature is enabled for
  /// dedicated IP addresses that are associated with your account.
  final bool? dedicatedIpAutoWarmupEnabled;

  /// An object that defines your account details.
  final AccountDetails? details;

  /// The reputation status of your Amazon SES account. The status can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code> – There are no reputation-related issues that currently
  /// impact your account.
  /// </li>
  /// <li>
  /// <code>PROBATION</code> – We've identified potential issues with your Amazon
  /// SES account. We're placing your account under review while you work on
  /// correcting these issues.
  /// </li>
  /// <li>
  /// <code>SHUTDOWN</code> – Your account's ability to send email is currently
  /// paused because of an issue with the email sent from your account. When you
  /// correct the issue, you can contact us and request that your account's
  /// ability to send email is resumed.
  /// </li>
  /// </ul>
  final String? enforcementStatus;

  /// Indicates whether or not your account has production access in the current
  /// Amazon Web Services Region.
  ///
  /// If the value is <code>false</code>, then your account is in the
  /// <i>sandbox</i>. When your account is in the sandbox, you can only send email
  /// to verified identities.
  ///
  /// If the value is <code>true</code>, then your account has production access.
  /// When your account has production access, you can send email to any address.
  /// The sending quota and maximum sending rate for your account vary based on
  /// your specific use case.
  final bool? productionAccessEnabled;

  /// An object that contains information about the per-day and per-second sending
  /// limits for your Amazon SES account in the current Amazon Web Services
  /// Region.
  final SendQuota? sendQuota;

  /// Indicates whether or not email sending is enabled for your Amazon SES
  /// account in the current Amazon Web Services Region.
  final bool? sendingEnabled;

  /// An object that contains information about the email address suppression
  /// preferences for your account in the current Amazon Web Services Region.
  final SuppressionAttributes? suppressionAttributes;

  /// The VDM attributes that apply to your Amazon SES account.
  final VdmAttributes? vdmAttributes;

  GetAccountResponse({
    this.dedicatedIpAutoWarmupEnabled,
    this.details,
    this.enforcementStatus,
    this.productionAccessEnabled,
    this.sendQuota,
    this.sendingEnabled,
    this.suppressionAttributes,
    this.vdmAttributes,
  });

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountResponse(
      dedicatedIpAutoWarmupEnabled:
          json['DedicatedIpAutoWarmupEnabled'] as bool?,
      details: json['Details'] != null
          ? AccountDetails.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      enforcementStatus: json['EnforcementStatus'] as String?,
      productionAccessEnabled: json['ProductionAccessEnabled'] as bool?,
      sendQuota: json['SendQuota'] != null
          ? SendQuota.fromJson(json['SendQuota'] as Map<String, dynamic>)
          : null,
      sendingEnabled: json['SendingEnabled'] as bool?,
      suppressionAttributes: json['SuppressionAttributes'] != null
          ? SuppressionAttributes.fromJson(
              json['SuppressionAttributes'] as Map<String, dynamic>)
          : null,
      vdmAttributes: json['VdmAttributes'] != null
          ? VdmAttributes.fromJson(
              json['VdmAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedIpAutoWarmupEnabled = this.dedicatedIpAutoWarmupEnabled;
    final details = this.details;
    final enforcementStatus = this.enforcementStatus;
    final productionAccessEnabled = this.productionAccessEnabled;
    final sendQuota = this.sendQuota;
    final sendingEnabled = this.sendingEnabled;
    final suppressionAttributes = this.suppressionAttributes;
    final vdmAttributes = this.vdmAttributes;
    return {
      if (dedicatedIpAutoWarmupEnabled != null)
        'DedicatedIpAutoWarmupEnabled': dedicatedIpAutoWarmupEnabled,
      if (details != null) 'Details': details,
      if (enforcementStatus != null) 'EnforcementStatus': enforcementStatus,
      if (productionAccessEnabled != null)
        'ProductionAccessEnabled': productionAccessEnabled,
      if (sendQuota != null) 'SendQuota': sendQuota,
      if (sendingEnabled != null) 'SendingEnabled': sendingEnabled,
      if (suppressionAttributes != null)
        'SuppressionAttributes': suppressionAttributes,
      if (vdmAttributes != null) 'VdmAttributes': vdmAttributes,
    };
  }
}

/// An object that contains information about blacklist events.
class GetBlacklistReportsResponse {
  /// An object that contains information about a blacklist that one of your
  /// dedicated IP addresses appears on.
  final Map<String, List<BlacklistEntry>> blacklistReport;

  GetBlacklistReportsResponse({
    required this.blacklistReport,
  });

  factory GetBlacklistReportsResponse.fromJson(Map<String, dynamic> json) {
    return GetBlacklistReportsResponse(
      blacklistReport: (json['BlacklistReport'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map(
                      (e) => BlacklistEntry.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final blacklistReport = this.blacklistReport;
    return {
      'BlacklistReport': blacklistReport,
    };
  }
}

/// Information about an event destination for a configuration set.
class GetConfigurationSetEventDestinationsResponse {
  /// An array that includes all of the events destinations that have been
  /// configured for the configuration set.
  final List<EventDestination>? eventDestinations;

  GetConfigurationSetEventDestinationsResponse({
    this.eventDestinations,
  });

  factory GetConfigurationSetEventDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConfigurationSetEventDestinationsResponse(
      eventDestinations: (json['EventDestinations'] as List?)
          ?.whereNotNull()
          .map((e) => EventDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventDestinations = this.eventDestinations;
    return {
      if (eventDestinations != null) 'EventDestinations': eventDestinations,
    };
  }
}

/// Information about a configuration set.
class GetConfigurationSetResponse {
  /// The name of the configuration set.
  final String? configurationSetName;

  /// An object that defines the dedicated IP pool that is used to send emails
  /// that you send using the configuration set.
  final DeliveryOptions? deliveryOptions;

  /// An object that defines whether or not Amazon SES collects reputation metrics
  /// for the emails that you send that use the configuration set.
  final ReputationOptions? reputationOptions;

  /// An object that defines whether or not Amazon SES can send email that you
  /// send using the configuration set.
  final SendingOptions? sendingOptions;

  /// An object that contains information about the suppression list preferences
  /// for your account.
  final SuppressionOptions? suppressionOptions;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the configuration set.
  final List<Tag>? tags;

  /// An object that defines the open and click tracking options for emails that
  /// you send using the configuration set.
  final TrackingOptions? trackingOptions;

  /// An object that contains information about the VDM preferences for your
  /// configuration set.
  final VdmOptions? vdmOptions;

  GetConfigurationSetResponse({
    this.configurationSetName,
    this.deliveryOptions,
    this.reputationOptions,
    this.sendingOptions,
    this.suppressionOptions,
    this.tags,
    this.trackingOptions,
    this.vdmOptions,
  });

  factory GetConfigurationSetResponse.fromJson(Map<String, dynamic> json) {
    return GetConfigurationSetResponse(
      configurationSetName: json['ConfigurationSetName'] as String?,
      deliveryOptions: json['DeliveryOptions'] != null
          ? DeliveryOptions.fromJson(
              json['DeliveryOptions'] as Map<String, dynamic>)
          : null,
      reputationOptions: json['ReputationOptions'] != null
          ? ReputationOptions.fromJson(
              json['ReputationOptions'] as Map<String, dynamic>)
          : null,
      sendingOptions: json['SendingOptions'] != null
          ? SendingOptions.fromJson(
              json['SendingOptions'] as Map<String, dynamic>)
          : null,
      suppressionOptions: json['SuppressionOptions'] != null
          ? SuppressionOptions.fromJson(
              json['SuppressionOptions'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingOptions: json['TrackingOptions'] != null
          ? TrackingOptions.fromJson(
              json['TrackingOptions'] as Map<String, dynamic>)
          : null,
      vdmOptions: json['VdmOptions'] != null
          ? VdmOptions.fromJson(json['VdmOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetName = this.configurationSetName;
    final deliveryOptions = this.deliveryOptions;
    final reputationOptions = this.reputationOptions;
    final sendingOptions = this.sendingOptions;
    final suppressionOptions = this.suppressionOptions;
    final tags = this.tags;
    final trackingOptions = this.trackingOptions;
    final vdmOptions = this.vdmOptions;
    return {
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (deliveryOptions != null) 'DeliveryOptions': deliveryOptions,
      if (reputationOptions != null) 'ReputationOptions': reputationOptions,
      if (sendingOptions != null) 'SendingOptions': sendingOptions,
      if (suppressionOptions != null) 'SuppressionOptions': suppressionOptions,
      if (tags != null) 'Tags': tags,
      if (trackingOptions != null) 'TrackingOptions': trackingOptions,
      if (vdmOptions != null) 'VdmOptions': vdmOptions,
    };
  }
}

class GetContactListResponse {
  /// The name of the contact list.
  final String? contactListName;

  /// A timestamp noting when the contact list was created.
  final DateTime? createdTimestamp;

  /// A description of what the contact list is about.
  final String? description;

  /// A timestamp noting the last time the contact list was updated.
  final DateTime? lastUpdatedTimestamp;

  /// The tags associated with a contact list.
  final List<Tag>? tags;

  /// An interest group, theme, or label within a list. A contact list can have
  /// multiple topics.
  final List<Topic>? topics;

  GetContactListResponse({
    this.contactListName,
    this.createdTimestamp,
    this.description,
    this.lastUpdatedTimestamp,
    this.tags,
    this.topics,
  });

  factory GetContactListResponse.fromJson(Map<String, dynamic> json) {
    return GetContactListResponse(
      contactListName: json['ContactListName'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      description: json['Description'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      topics: (json['Topics'] as List?)
          ?.whereNotNull()
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contactListName = this.contactListName;
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final tags = this.tags;
    final topics = this.topics;
    return {
      if (contactListName != null) 'ContactListName': contactListName,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (description != null) 'Description': description,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (tags != null) 'Tags': tags,
      if (topics != null) 'Topics': topics,
    };
  }
}

class GetContactResponse {
  /// The attribute data attached to a contact.
  final String? attributesData;

  /// The name of the contact list to which the contact belongs.
  final String? contactListName;

  /// A timestamp noting when the contact was created.
  final DateTime? createdTimestamp;

  /// The contact's email address.
  final String? emailAddress;

  /// A timestamp noting the last time the contact's information was updated.
  final DateTime? lastUpdatedTimestamp;

  /// The default topic preferences applied to the contact.
  final List<TopicPreference>? topicDefaultPreferences;

  /// The contact's preference for being opted-in to or opted-out of a topic.&gt;
  final List<TopicPreference>? topicPreferences;

  /// A boolean value status noting if the contact is unsubscribed from all
  /// contact list topics.
  final bool? unsubscribeAll;

  GetContactResponse({
    this.attributesData,
    this.contactListName,
    this.createdTimestamp,
    this.emailAddress,
    this.lastUpdatedTimestamp,
    this.topicDefaultPreferences,
    this.topicPreferences,
    this.unsubscribeAll,
  });

  factory GetContactResponse.fromJson(Map<String, dynamic> json) {
    return GetContactResponse(
      attributesData: json['AttributesData'] as String?,
      contactListName: json['ContactListName'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      emailAddress: json['EmailAddress'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      topicDefaultPreferences: (json['TopicDefaultPreferences'] as List?)
          ?.whereNotNull()
          .map((e) => TopicPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
      topicPreferences: (json['TopicPreferences'] as List?)
          ?.whereNotNull()
          .map((e) => TopicPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsubscribeAll: json['UnsubscribeAll'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributesData = this.attributesData;
    final contactListName = this.contactListName;
    final createdTimestamp = this.createdTimestamp;
    final emailAddress = this.emailAddress;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final topicDefaultPreferences = this.topicDefaultPreferences;
    final topicPreferences = this.topicPreferences;
    final unsubscribeAll = this.unsubscribeAll;
    return {
      if (attributesData != null) 'AttributesData': attributesData,
      if (contactListName != null) 'ContactListName': contactListName,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (topicDefaultPreferences != null)
        'TopicDefaultPreferences': topicDefaultPreferences,
      if (topicPreferences != null) 'TopicPreferences': topicPreferences,
      if (unsubscribeAll != null) 'UnsubscribeAll': unsubscribeAll,
    };
  }
}

/// The following elements are returned by the service.
class GetCustomVerificationEmailTemplateResponse {
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  final String? failureRedirectionURL;

  /// The email address that the custom verification email is sent from.
  final String? fromEmailAddress;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  final String? successRedirectionURL;

  /// The content of the custom verification email.
  final String? templateContent;

  /// The name of the custom verification email template.
  final String? templateName;

  /// The subject line of the custom verification email.
  final String? templateSubject;

  GetCustomVerificationEmailTemplateResponse({
    this.failureRedirectionURL,
    this.fromEmailAddress,
    this.successRedirectionURL,
    this.templateContent,
    this.templateName,
    this.templateSubject,
  });

  factory GetCustomVerificationEmailTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCustomVerificationEmailTemplateResponse(
      failureRedirectionURL: json['FailureRedirectionURL'] as String?,
      fromEmailAddress: json['FromEmailAddress'] as String?,
      successRedirectionURL: json['SuccessRedirectionURL'] as String?,
      templateContent: json['TemplateContent'] as String?,
      templateName: json['TemplateName'] as String?,
      templateSubject: json['TemplateSubject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureRedirectionURL = this.failureRedirectionURL;
    final fromEmailAddress = this.fromEmailAddress;
    final successRedirectionURL = this.successRedirectionURL;
    final templateContent = this.templateContent;
    final templateName = this.templateName;
    final templateSubject = this.templateSubject;
    return {
      if (failureRedirectionURL != null)
        'FailureRedirectionURL': failureRedirectionURL,
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (successRedirectionURL != null)
        'SuccessRedirectionURL': successRedirectionURL,
      if (templateContent != null) 'TemplateContent': templateContent,
      if (templateName != null) 'TemplateName': templateName,
      if (templateSubject != null) 'TemplateSubject': templateSubject,
    };
  }
}

/// The following element is returned by the service.
class GetDedicatedIpPoolResponse {
  /// An object that contains information about a dedicated IP pool.
  final DedicatedIpPool? dedicatedIpPool;

  GetDedicatedIpPoolResponse({
    this.dedicatedIpPool,
  });

  factory GetDedicatedIpPoolResponse.fromJson(Map<String, dynamic> json) {
    return GetDedicatedIpPoolResponse(
      dedicatedIpPool: json['DedicatedIpPool'] != null
          ? DedicatedIpPool.fromJson(
              json['DedicatedIpPool'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedIpPool = this.dedicatedIpPool;
    return {
      if (dedicatedIpPool != null) 'DedicatedIpPool': dedicatedIpPool,
    };
  }
}

/// Information about a dedicated IP address.
class GetDedicatedIpResponse {
  /// An object that contains information about a dedicated IP address.
  final DedicatedIp? dedicatedIp;

  GetDedicatedIpResponse({
    this.dedicatedIp,
  });

  factory GetDedicatedIpResponse.fromJson(Map<String, dynamic> json) {
    return GetDedicatedIpResponse(
      dedicatedIp: json['DedicatedIp'] != null
          ? DedicatedIp.fromJson(json['DedicatedIp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedIp = this.dedicatedIp;
    return {
      if (dedicatedIp != null) 'DedicatedIp': dedicatedIp,
    };
  }
}

/// Information about the dedicated IP addresses that are associated with your
/// Amazon Web Services account.
class GetDedicatedIpsResponse {
  /// A list of dedicated IP addresses that are associated with your Amazon Web
  /// Services account.
  final List<DedicatedIp>? dedicatedIps;

  /// A token that indicates that there are additional dedicated IP addresses to
  /// list. To view additional addresses, issue another request to
  /// <code>GetDedicatedIps</code>, passing this token in the
  /// <code>NextToken</code> parameter.
  final String? nextToken;

  GetDedicatedIpsResponse({
    this.dedicatedIps,
    this.nextToken,
  });

  factory GetDedicatedIpsResponse.fromJson(Map<String, dynamic> json) {
    return GetDedicatedIpsResponse(
      dedicatedIps: (json['DedicatedIps'] as List?)
          ?.whereNotNull()
          .map((e) => DedicatedIp.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedIps = this.dedicatedIps;
    final nextToken = this.nextToken;
    return {
      if (dedicatedIps != null) 'DedicatedIps': dedicatedIps,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An object that shows the status of the Deliverability dashboard.
class GetDeliverabilityDashboardOptionsResponse {
  /// Specifies whether the Deliverability dashboard is enabled. If this value is
  /// <code>true</code>, the dashboard is enabled.
  final bool dashboardEnabled;

  /// The current status of your Deliverability dashboard subscription. If this
  /// value is <code>PENDING_EXPIRATION</code>, your subscription is scheduled to
  /// expire at the end of the current calendar month.
  final DeliverabilityDashboardAccountStatus? accountStatus;

  /// An array of objects, one for each verified domain that you use to send email
  /// and currently has an active Deliverability dashboard subscription that isn’t
  /// scheduled to expire at the end of the current calendar month.
  final List<DomainDeliverabilityTrackingOption>? activeSubscribedDomains;

  /// An array of objects, one for each verified domain that you use to send email
  /// and currently has an active Deliverability dashboard subscription that's
  /// scheduled to expire at the end of the current calendar month.
  final List<DomainDeliverabilityTrackingOption>?
      pendingExpirationSubscribedDomains;

  /// The date when your current subscription to the Deliverability dashboard is
  /// scheduled to expire, if your subscription is scheduled to expire at the end
  /// of the current calendar month. This value is null if you have an active
  /// subscription that isn’t due to expire at the end of the month.
  final DateTime? subscriptionExpiryDate;

  GetDeliverabilityDashboardOptionsResponse({
    required this.dashboardEnabled,
    this.accountStatus,
    this.activeSubscribedDomains,
    this.pendingExpirationSubscribedDomains,
    this.subscriptionExpiryDate,
  });

  factory GetDeliverabilityDashboardOptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDeliverabilityDashboardOptionsResponse(
      dashboardEnabled: json['DashboardEnabled'] as bool,
      accountStatus: (json['AccountStatus'] as String?)
          ?.toDeliverabilityDashboardAccountStatus(),
      activeSubscribedDomains: (json['ActiveSubscribedDomains'] as List?)
          ?.whereNotNull()
          .map((e) => DomainDeliverabilityTrackingOption.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      pendingExpirationSubscribedDomains:
          (json['PendingExpirationSubscribedDomains'] as List?)
              ?.whereNotNull()
              .map((e) => DomainDeliverabilityTrackingOption.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      subscriptionExpiryDate: timeStampFromJson(json['SubscriptionExpiryDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardEnabled = this.dashboardEnabled;
    final accountStatus = this.accountStatus;
    final activeSubscribedDomains = this.activeSubscribedDomains;
    final pendingExpirationSubscribedDomains =
        this.pendingExpirationSubscribedDomains;
    final subscriptionExpiryDate = this.subscriptionExpiryDate;
    return {
      'DashboardEnabled': dashboardEnabled,
      if (accountStatus != null) 'AccountStatus': accountStatus.toValue(),
      if (activeSubscribedDomains != null)
        'ActiveSubscribedDomains': activeSubscribedDomains,
      if (pendingExpirationSubscribedDomains != null)
        'PendingExpirationSubscribedDomains':
            pendingExpirationSubscribedDomains,
      if (subscriptionExpiryDate != null)
        'SubscriptionExpiryDate': unixTimestampToJson(subscriptionExpiryDate),
    };
  }
}

/// The results of the predictive inbox placement test.
class GetDeliverabilityTestReportResponse {
  /// An object that contains the results of the predictive inbox placement test.
  final DeliverabilityTestReport deliverabilityTestReport;

  /// An object that describes how the test email was handled by several email
  /// providers, including Gmail, Hotmail, Yahoo, AOL, and others.
  final List<IspPlacement> ispPlacements;

  /// An object that specifies how many test messages that were sent during the
  /// predictive inbox placement test were delivered to recipients' inboxes, how
  /// many were sent to recipients' spam folders, and how many weren't delivered.
  final PlacementStatistics overallPlacement;

  /// An object that contains the message that you sent when you performed this
  /// predictive inbox placement test.
  final String? message;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the predictive inbox placement test.
  final List<Tag>? tags;

  GetDeliverabilityTestReportResponse({
    required this.deliverabilityTestReport,
    required this.ispPlacements,
    required this.overallPlacement,
    this.message,
    this.tags,
  });

  factory GetDeliverabilityTestReportResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDeliverabilityTestReportResponse(
      deliverabilityTestReport: DeliverabilityTestReport.fromJson(
          json['DeliverabilityTestReport'] as Map<String, dynamic>),
      ispPlacements: (json['IspPlacements'] as List)
          .whereNotNull()
          .map((e) => IspPlacement.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallPlacement: PlacementStatistics.fromJson(
          json['OverallPlacement'] as Map<String, dynamic>),
      message: json['Message'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deliverabilityTestReport = this.deliverabilityTestReport;
    final ispPlacements = this.ispPlacements;
    final overallPlacement = this.overallPlacement;
    final message = this.message;
    final tags = this.tags;
    return {
      'DeliverabilityTestReport': deliverabilityTestReport,
      'IspPlacements': ispPlacements,
      'OverallPlacement': overallPlacement,
      if (message != null) 'Message': message,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// An object that contains all the deliverability data for a specific campaign.
/// This data is available for a campaign only if the campaign sent email by
/// using a domain that the Deliverability dashboard is enabled for.
class GetDomainDeliverabilityCampaignResponse {
  /// An object that contains the deliverability data for the campaign.
  final DomainDeliverabilityCampaign domainDeliverabilityCampaign;

  GetDomainDeliverabilityCampaignResponse({
    required this.domainDeliverabilityCampaign,
  });

  factory GetDomainDeliverabilityCampaignResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDomainDeliverabilityCampaignResponse(
      domainDeliverabilityCampaign: DomainDeliverabilityCampaign.fromJson(
          json['DomainDeliverabilityCampaign'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final domainDeliverabilityCampaign = this.domainDeliverabilityCampaign;
    return {
      'DomainDeliverabilityCampaign': domainDeliverabilityCampaign,
    };
  }
}

/// An object that includes statistics that are related to the domain that you
/// specified.
class GetDomainStatisticsReportResponse {
  /// An object that contains deliverability metrics for the domain that you
  /// specified. This object contains data for each day, starting on the
  /// <code>StartDate</code> and ending on the <code>EndDate</code>.
  final List<DailyVolume> dailyVolumes;

  /// An object that contains deliverability metrics for the domain that you
  /// specified. The data in this object is a summary of all of the data that was
  /// collected from the <code>StartDate</code> to the <code>EndDate</code>.
  final OverallVolume overallVolume;

  GetDomainStatisticsReportResponse({
    required this.dailyVolumes,
    required this.overallVolume,
  });

  factory GetDomainStatisticsReportResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDomainStatisticsReportResponse(
      dailyVolumes: (json['DailyVolumes'] as List)
          .whereNotNull()
          .map((e) => DailyVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallVolume:
          OverallVolume.fromJson(json['OverallVolume'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dailyVolumes = this.dailyVolumes;
    final overallVolume = this.overallVolume;
    return {
      'DailyVolumes': dailyVolumes,
      'OverallVolume': overallVolume,
    };
  }
}

/// Identity policies associated with email identity.
class GetEmailIdentityPoliciesResponse {
  /// A map of policy names to policies.
  final Map<String, String>? policies;

  GetEmailIdentityPoliciesResponse({
    this.policies,
  });

  factory GetEmailIdentityPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return GetEmailIdentityPoliciesResponse(
      policies: (json['Policies'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    return {
      if (policies != null) 'Policies': policies,
    };
  }
}

/// Details about an email identity.
class GetEmailIdentityResponse {
  /// The configuration set used by default when sending from this identity.
  final String? configurationSetName;

  /// An object that contains information about the DKIM attributes for the
  /// identity.
  final DkimAttributes? dkimAttributes;

  /// The feedback forwarding configuration for the identity.
  ///
  /// If the value is <code>true</code>, you receive email notifications when
  /// bounce or complaint events occur. These notifications are sent to the
  /// address that you specified in the <code>Return-Path</code> header of the
  /// original email.
  ///
  /// You're required to have a method of tracking bounces and complaints. If you
  /// haven't set up another mechanism for receiving bounce or complaint
  /// notifications (for example, by setting up an event destination), you receive
  /// an email notification when these events occur (even if this setting is
  /// disabled).
  final bool? feedbackForwardingStatus;

  /// The email identity type. Note: the <code>MANAGED_DOMAIN</code> identity type
  /// is not supported.
  final IdentityType? identityType;

  /// An object that contains information about the Mail-From attributes for the
  /// email identity.
  final MailFromAttributes? mailFromAttributes;

  /// A map of policy names to policies.
  final Map<String, String>? policies;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the email identity.
  final List<Tag>? tags;

  /// An object that contains additional information about the verification status
  /// for the identity.
  final VerificationInfo? verificationInfo;

  /// The verification status of the identity. The status can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – The verification process was initiated, but Amazon
  /// SES hasn't yet been able to verify the identity.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – The verification process completed successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – The verification process failed.
  /// </li>
  /// <li>
  /// <code>TEMPORARY_FAILURE</code> – A temporary issue is preventing Amazon SES
  /// from determining the verification status of the identity.
  /// </li>
  /// <li>
  /// <code>NOT_STARTED</code> – The verification process hasn't been initiated
  /// for the identity.
  /// </li>
  /// </ul>
  final VerificationStatus? verificationStatus;

  /// Specifies whether or not the identity is verified. You can only send email
  /// from verified email addresses or domains. For more information about
  /// verifying identities, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html">Amazon
  /// Pinpoint User Guide</a>.
  final bool? verifiedForSendingStatus;

  GetEmailIdentityResponse({
    this.configurationSetName,
    this.dkimAttributes,
    this.feedbackForwardingStatus,
    this.identityType,
    this.mailFromAttributes,
    this.policies,
    this.tags,
    this.verificationInfo,
    this.verificationStatus,
    this.verifiedForSendingStatus,
  });

  factory GetEmailIdentityResponse.fromJson(Map<String, dynamic> json) {
    return GetEmailIdentityResponse(
      configurationSetName: json['ConfigurationSetName'] as String?,
      dkimAttributes: json['DkimAttributes'] != null
          ? DkimAttributes.fromJson(
              json['DkimAttributes'] as Map<String, dynamic>)
          : null,
      feedbackForwardingStatus: json['FeedbackForwardingStatus'] as bool?,
      identityType: (json['IdentityType'] as String?)?.toIdentityType(),
      mailFromAttributes: json['MailFromAttributes'] != null
          ? MailFromAttributes.fromJson(
              json['MailFromAttributes'] as Map<String, dynamic>)
          : null,
      policies: (json['Policies'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      verificationInfo: json['VerificationInfo'] != null
          ? VerificationInfo.fromJson(
              json['VerificationInfo'] as Map<String, dynamic>)
          : null,
      verificationStatus:
          (json['VerificationStatus'] as String?)?.toVerificationStatus(),
      verifiedForSendingStatus: json['VerifiedForSendingStatus'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetName = this.configurationSetName;
    final dkimAttributes = this.dkimAttributes;
    final feedbackForwardingStatus = this.feedbackForwardingStatus;
    final identityType = this.identityType;
    final mailFromAttributes = this.mailFromAttributes;
    final policies = this.policies;
    final tags = this.tags;
    final verificationInfo = this.verificationInfo;
    final verificationStatus = this.verificationStatus;
    final verifiedForSendingStatus = this.verifiedForSendingStatus;
    return {
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (dkimAttributes != null) 'DkimAttributes': dkimAttributes,
      if (feedbackForwardingStatus != null)
        'FeedbackForwardingStatus': feedbackForwardingStatus,
      if (identityType != null) 'IdentityType': identityType.toValue(),
      if (mailFromAttributes != null) 'MailFromAttributes': mailFromAttributes,
      if (policies != null) 'Policies': policies,
      if (tags != null) 'Tags': tags,
      if (verificationInfo != null) 'VerificationInfo': verificationInfo,
      if (verificationStatus != null)
        'VerificationStatus': verificationStatus.toValue(),
      if (verifiedForSendingStatus != null)
        'VerifiedForSendingStatus': verifiedForSendingStatus,
    };
  }
}

/// The following element is returned by the service.
class GetEmailTemplateResponse {
  /// The content of the email template, composed of a subject line, an HTML part,
  /// and a text-only part.
  final EmailTemplateContent templateContent;

  /// The name of the template.
  final String templateName;

  GetEmailTemplateResponse({
    required this.templateContent,
    required this.templateName,
  });

  factory GetEmailTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetEmailTemplateResponse(
      templateContent: EmailTemplateContent.fromJson(
          json['TemplateContent'] as Map<String, dynamic>),
      templateName: json['TemplateName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final templateContent = this.templateContent;
    final templateName = this.templateName;
    return {
      'TemplateContent': templateContent,
      'TemplateName': templateName,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class GetExportJobResponse {
  /// The timestamp of when the export job was completed.
  final DateTime? completedTimestamp;

  /// The timestamp of when the export job was created.
  final DateTime? createdTimestamp;

  /// The data source of the export job.
  final ExportDataSource? exportDataSource;

  /// The destination of the export job.
  final ExportDestination? exportDestination;

  /// The type of source of the export job.
  final ExportSourceType? exportSourceType;

  /// The failure details about an export job.
  final FailureInfo? failureInfo;

  /// The export job ID.
  final String? jobId;

  /// The status of the export job.
  final JobStatus? jobStatus;

  /// The statistics about the export job.
  final ExportStatistics? statistics;

  GetExportJobResponse({
    this.completedTimestamp,
    this.createdTimestamp,
    this.exportDataSource,
    this.exportDestination,
    this.exportSourceType,
    this.failureInfo,
    this.jobId,
    this.jobStatus,
    this.statistics,
  });

  factory GetExportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetExportJobResponse(
      completedTimestamp: timeStampFromJson(json['CompletedTimestamp']),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      exportDataSource: json['ExportDataSource'] != null
          ? ExportDataSource.fromJson(
              json['ExportDataSource'] as Map<String, dynamic>)
          : null,
      exportDestination: json['ExportDestination'] != null
          ? ExportDestination.fromJson(
              json['ExportDestination'] as Map<String, dynamic>)
          : null,
      exportSourceType:
          (json['ExportSourceType'] as String?)?.toExportSourceType(),
      failureInfo: json['FailureInfo'] != null
          ? FailureInfo.fromJson(json['FailureInfo'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      statistics: json['Statistics'] != null
          ? ExportStatistics.fromJson(
              json['Statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final completedTimestamp = this.completedTimestamp;
    final createdTimestamp = this.createdTimestamp;
    final exportDataSource = this.exportDataSource;
    final exportDestination = this.exportDestination;
    final exportSourceType = this.exportSourceType;
    final failureInfo = this.failureInfo;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final statistics = this.statistics;
    return {
      if (completedTimestamp != null)
        'CompletedTimestamp': unixTimestampToJson(completedTimestamp),
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (exportDataSource != null) 'ExportDataSource': exportDataSource,
      if (exportDestination != null) 'ExportDestination': exportDestination,
      if (exportSourceType != null)
        'ExportSourceType': exportSourceType.toValue(),
      if (failureInfo != null) 'FailureInfo': failureInfo,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (statistics != null) 'Statistics': statistics,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class GetImportJobResponse {
  /// The time stamp of when the import job was completed.
  final DateTime? completedTimestamp;

  /// The time stamp of when the import job was created.
  final DateTime? createdTimestamp;

  /// The number of records that failed processing because of invalid input or
  /// other reasons.
  final int? failedRecordsCount;

  /// The failure details about an import job.
  final FailureInfo? failureInfo;

  /// The data source of the import job.
  final ImportDataSource? importDataSource;

  /// The destination of the import job.
  final ImportDestination? importDestination;

  /// A string that represents the import job ID.
  final String? jobId;

  /// The status of the import job.
  final JobStatus? jobStatus;

  /// The current number of records processed.
  final int? processedRecordsCount;

  GetImportJobResponse({
    this.completedTimestamp,
    this.createdTimestamp,
    this.failedRecordsCount,
    this.failureInfo,
    this.importDataSource,
    this.importDestination,
    this.jobId,
    this.jobStatus,
    this.processedRecordsCount,
  });

  factory GetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetImportJobResponse(
      completedTimestamp: timeStampFromJson(json['CompletedTimestamp']),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      failedRecordsCount: json['FailedRecordsCount'] as int?,
      failureInfo: json['FailureInfo'] != null
          ? FailureInfo.fromJson(json['FailureInfo'] as Map<String, dynamic>)
          : null,
      importDataSource: json['ImportDataSource'] != null
          ? ImportDataSource.fromJson(
              json['ImportDataSource'] as Map<String, dynamic>)
          : null,
      importDestination: json['ImportDestination'] != null
          ? ImportDestination.fromJson(
              json['ImportDestination'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      processedRecordsCount: json['ProcessedRecordsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedTimestamp = this.completedTimestamp;
    final createdTimestamp = this.createdTimestamp;
    final failedRecordsCount = this.failedRecordsCount;
    final failureInfo = this.failureInfo;
    final importDataSource = this.importDataSource;
    final importDestination = this.importDestination;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final processedRecordsCount = this.processedRecordsCount;
    return {
      if (completedTimestamp != null)
        'CompletedTimestamp': unixTimestampToJson(completedTimestamp),
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (failedRecordsCount != null) 'FailedRecordsCount': failedRecordsCount,
      if (failureInfo != null) 'FailureInfo': failureInfo,
      if (importDataSource != null) 'ImportDataSource': importDataSource,
      if (importDestination != null) 'ImportDestination': importDestination,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (processedRecordsCount != null)
        'ProcessedRecordsCount': processedRecordsCount,
    };
  }
}

/// Information about a message.
class GetMessageInsightsResponse {
  /// A list of tags, in the form of name/value pairs, that were applied to the
  /// email you sent, along with Amazon SES <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-using-event-publishing.html">Auto-Tags</a>.
  final List<MessageTag>? emailTags;

  /// The from address used to send the message.
  final String? fromEmailAddress;

  /// A set of insights associated with the message.
  final List<EmailInsights>? insights;

  /// A unique identifier for the message.
  final String? messageId;

  /// The subject line of the message.
  final String? subject;

  GetMessageInsightsResponse({
    this.emailTags,
    this.fromEmailAddress,
    this.insights,
    this.messageId,
    this.subject,
  });

  factory GetMessageInsightsResponse.fromJson(Map<String, dynamic> json) {
    return GetMessageInsightsResponse(
      emailTags: (json['EmailTags'] as List?)
          ?.whereNotNull()
          .map((e) => MessageTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      fromEmailAddress: json['FromEmailAddress'] as String?,
      insights: (json['Insights'] as List?)
          ?.whereNotNull()
          .map((e) => EmailInsights.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageId: json['MessageId'] as String?,
      subject: json['Subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailTags = this.emailTags;
    final fromEmailAddress = this.fromEmailAddress;
    final insights = this.insights;
    final messageId = this.messageId;
    final subject = this.subject;
    return {
      if (emailTags != null) 'EmailTags': emailTags,
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (insights != null) 'Insights': insights,
      if (messageId != null) 'MessageId': messageId,
      if (subject != null) 'Subject': subject,
    };
  }
}

/// Information about the suppressed email address.
class GetSuppressedDestinationResponse {
  /// An object containing information about the suppressed email address.
  final SuppressedDestination suppressedDestination;

  GetSuppressedDestinationResponse({
    required this.suppressedDestination,
  });

  factory GetSuppressedDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetSuppressedDestinationResponse(
      suppressedDestination: SuppressedDestination.fromJson(
          json['SuppressedDestination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final suppressedDestination = this.suppressedDestination;
    return {
      'SuppressedDestination': suppressedDestination,
    };
  }
}

/// An object containing additional settings for your VDM configuration as
/// applicable to the Guardian.
class GuardianAttributes {
  /// Specifies the status of your VDM optimized shared delivery. Can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – Amazon SES enables optimized shared delivery for your
  /// account.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – Amazon SES disables optimized shared delivery for
  /// your account.
  /// </li>
  /// </ul>
  final FeatureStatus? optimizedSharedDelivery;

  GuardianAttributes({
    this.optimizedSharedDelivery,
  });

  factory GuardianAttributes.fromJson(Map<String, dynamic> json) {
    return GuardianAttributes(
      optimizedSharedDelivery:
          (json['OptimizedSharedDelivery'] as String?)?.toFeatureStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final optimizedSharedDelivery = this.optimizedSharedDelivery;
    return {
      if (optimizedSharedDelivery != null)
        'OptimizedSharedDelivery': optimizedSharedDelivery.toValue(),
    };
  }
}

/// An object containing additional settings for your VDM configuration as
/// applicable to the Guardian.
class GuardianOptions {
  /// Specifies the status of your VDM optimized shared delivery. Can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – Amazon SES enables optimized shared delivery for the
  /// configuration set.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – Amazon SES disables optimized shared delivery for
  /// the configuration set.
  /// </li>
  /// </ul>
  final FeatureStatus? optimizedSharedDelivery;

  GuardianOptions({
    this.optimizedSharedDelivery,
  });

  factory GuardianOptions.fromJson(Map<String, dynamic> json) {
    return GuardianOptions(
      optimizedSharedDelivery:
          (json['OptimizedSharedDelivery'] as String?)?.toFeatureStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final optimizedSharedDelivery = this.optimizedSharedDelivery;
    return {
      if (optimizedSharedDelivery != null)
        'OptimizedSharedDelivery': optimizedSharedDelivery.toValue(),
    };
  }
}

/// Information about an email identity.
class IdentityInfo {
  /// The address or domain of the identity.
  final String? identityName;

  /// The email identity type. Note: the <code>MANAGED_DOMAIN</code> type is not
  /// supported for email identity types.
  final IdentityType? identityType;

  /// Indicates whether or not you can send email from the identity.
  ///
  /// An <i>identity</i> is an email address or domain that you send email from.
  /// Before you can send email from an identity, you have to demostrate that you
  /// own the identity, and that you authorize Amazon SES to send email from that
  /// identity.
  final bool? sendingEnabled;

  /// The verification status of the identity. The status can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – The verification process was initiated, but Amazon
  /// SES hasn't yet been able to verify the identity.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – The verification process completed successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – The verification process failed.
  /// </li>
  /// <li>
  /// <code>TEMPORARY_FAILURE</code> – A temporary issue is preventing Amazon SES
  /// from determining the verification status of the identity.
  /// </li>
  /// <li>
  /// <code>NOT_STARTED</code> – The verification process hasn't been initiated
  /// for the identity.
  /// </li>
  /// </ul>
  final VerificationStatus? verificationStatus;

  IdentityInfo({
    this.identityName,
    this.identityType,
    this.sendingEnabled,
    this.verificationStatus,
  });

  factory IdentityInfo.fromJson(Map<String, dynamic> json) {
    return IdentityInfo(
      identityName: json['IdentityName'] as String?,
      identityType: (json['IdentityType'] as String?)?.toIdentityType(),
      sendingEnabled: json['SendingEnabled'] as bool?,
      verificationStatus:
          (json['VerificationStatus'] as String?)?.toVerificationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final identityName = this.identityName;
    final identityType = this.identityType;
    final sendingEnabled = this.sendingEnabled;
    final verificationStatus = this.verificationStatus;
    return {
      if (identityName != null) 'IdentityName': identityName,
      if (identityType != null) 'IdentityType': identityType.toValue(),
      if (sendingEnabled != null) 'SendingEnabled': sendingEnabled,
      if (verificationStatus != null)
        'VerificationStatus': verificationStatus.toValue(),
    };
  }
}

enum IdentityType {
  emailAddress,
  domain,
  managedDomain,
}

extension IdentityTypeValueExtension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.emailAddress:
        return 'EMAIL_ADDRESS';
      case IdentityType.domain:
        return 'DOMAIN';
      case IdentityType.managedDomain:
        return 'MANAGED_DOMAIN';
    }
  }
}

extension IdentityTypeFromString on String {
  IdentityType toIdentityType() {
    switch (this) {
      case 'EMAIL_ADDRESS':
        return IdentityType.emailAddress;
      case 'DOMAIN':
        return IdentityType.domain;
      case 'MANAGED_DOMAIN':
        return IdentityType.managedDomain;
    }
    throw Exception('$this is not known in enum IdentityType');
  }
}

/// An object that contains details about the data source of the import job.
class ImportDataSource {
  /// The data format of the import job's data source.
  final DataFormat dataFormat;

  /// An Amazon S3 URL in the format
  /// s3://<i>&lt;bucket_name&gt;</i>/<i>&lt;object&gt;</i>.
  final String s3Url;

  ImportDataSource({
    required this.dataFormat,
    required this.s3Url,
  });

  factory ImportDataSource.fromJson(Map<String, dynamic> json) {
    return ImportDataSource(
      dataFormat: (json['DataFormat'] as String).toDataFormat(),
      s3Url: json['S3Url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataFormat = this.dataFormat;
    final s3Url = this.s3Url;
    return {
      'DataFormat': dataFormat.toValue(),
      'S3Url': s3Url,
    };
  }
}

/// An object that contains details about the resource destination the import
/// job is going to target.
class ImportDestination {
  /// An object that contains the action of the import job towards a contact list.
  final ContactListDestination? contactListDestination;

  /// An object that contains the action of the import job towards suppression
  /// list.
  final SuppressionListDestination? suppressionListDestination;

  ImportDestination({
    this.contactListDestination,
    this.suppressionListDestination,
  });

  factory ImportDestination.fromJson(Map<String, dynamic> json) {
    return ImportDestination(
      contactListDestination: json['ContactListDestination'] != null
          ? ContactListDestination.fromJson(
              json['ContactListDestination'] as Map<String, dynamic>)
          : null,
      suppressionListDestination: json['SuppressionListDestination'] != null
          ? SuppressionListDestination.fromJson(
              json['SuppressionListDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contactListDestination = this.contactListDestination;
    final suppressionListDestination = this.suppressionListDestination;
    return {
      if (contactListDestination != null)
        'ContactListDestination': contactListDestination,
      if (suppressionListDestination != null)
        'SuppressionListDestination': suppressionListDestination,
    };
  }
}

/// The destination of the import job, which can be used to list import jobs
/// that have a certain <code>ImportDestinationType</code>.
enum ImportDestinationType {
  suppressionList,
  contactList,
}

extension ImportDestinationTypeValueExtension on ImportDestinationType {
  String toValue() {
    switch (this) {
      case ImportDestinationType.suppressionList:
        return 'SUPPRESSION_LIST';
      case ImportDestinationType.contactList:
        return 'CONTACT_LIST';
    }
  }
}

extension ImportDestinationTypeFromString on String {
  ImportDestinationType toImportDestinationType() {
    switch (this) {
      case 'SUPPRESSION_LIST':
        return ImportDestinationType.suppressionList;
      case 'CONTACT_LIST':
        return ImportDestinationType.contactList;
    }
    throw Exception('$this is not known in enum ImportDestinationType');
  }
}

/// A summary of the import job.
class ImportJobSummary {
  /// The date and time when the import job was created.
  final DateTime? createdTimestamp;

  /// The number of records that failed processing because of invalid input or
  /// other reasons.
  final int? failedRecordsCount;
  final ImportDestination? importDestination;
  final String? jobId;
  final JobStatus? jobStatus;

  /// The current number of records processed.
  final int? processedRecordsCount;

  ImportJobSummary({
    this.createdTimestamp,
    this.failedRecordsCount,
    this.importDestination,
    this.jobId,
    this.jobStatus,
    this.processedRecordsCount,
  });

  factory ImportJobSummary.fromJson(Map<String, dynamic> json) {
    return ImportJobSummary(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      failedRecordsCount: json['FailedRecordsCount'] as int?,
      importDestination: json['ImportDestination'] != null
          ? ImportDestination.fromJson(
              json['ImportDestination'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      processedRecordsCount: json['ProcessedRecordsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final failedRecordsCount = this.failedRecordsCount;
    final importDestination = this.importDestination;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final processedRecordsCount = this.processedRecordsCount;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (failedRecordsCount != null) 'FailedRecordsCount': failedRecordsCount,
      if (importDestination != null) 'ImportDestination': importDestination,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (processedRecordsCount != null)
        'ProcessedRecordsCount': processedRecordsCount,
    };
  }
}

/// An object that contains information about the inbox placement data settings
/// for a verified domain that’s associated with your Amazon Web Services
/// account. This data is available only if you enabled the Deliverability
/// dashboard for the domain.
class InboxPlacementTrackingOption {
  /// Specifies whether inbox placement data is being tracked for the domain.
  final bool? global;

  /// An array of strings, one for each major email provider that the inbox
  /// placement data applies to.
  final List<String>? trackedIsps;

  InboxPlacementTrackingOption({
    this.global,
    this.trackedIsps,
  });

  factory InboxPlacementTrackingOption.fromJson(Map<String, dynamic> json) {
    return InboxPlacementTrackingOption(
      global: json['Global'] as bool?,
      trackedIsps: (json['TrackedIsps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final global = this.global;
    final trackedIsps = this.trackedIsps;
    return {
      if (global != null) 'Global': global,
      if (trackedIsps != null) 'TrackedIsps': trackedIsps,
    };
  }
}

/// An object containing details about a specific event.
class InsightsEvent {
  /// Details about bounce or complaint events.
  final EventDetails? details;

  /// The timestamp of the event.
  final DateTime? timestamp;

  /// The type of event:
  ///
  /// <ul>
  /// <li>
  /// <code>SEND</code> - The send request was successful and SES will attempt to
  /// deliver the message to the recipient’s mail server. (If account-level or
  /// global suppression is being used, SES will still count it as a send, but
  /// delivery is suppressed.)
  /// </li>
  /// <li>
  /// <code>DELIVERY</code> - SES successfully delivered the email to the
  /// recipient's mail server. Excludes deliveries to the mailbox simulator, and
  /// those from emails addressed to more than one recipient.
  /// </li>
  /// <li>
  /// <code>BOUNCE</code> - Feedback received for delivery failures. Additional
  /// details about the bounce are provided in the <code>Details</code> object.
  /// Excludes bounces from the mailbox simulator, and those from emails addressed
  /// to more than one recipient.
  /// </li>
  /// <li>
  /// <code>COMPLAINT</code> - Complaint received for the email. Additional
  /// details about the complaint are provided in the <code>Details</code> object.
  /// This excludes complaints from the mailbox simulator, those originating from
  /// your account-level suppression list (if enabled), and those from emails
  /// addressed to more than one recipient.
  /// </li>
  /// <li>
  /// <code>OPEN</code> - Open event for emails including open trackers. Excludes
  /// opens for emails addressed to more than one recipient.
  /// </li>
  /// <li>
  /// <code>CLICK</code> - Click event for emails including wrapped links.
  /// Excludes clicks for emails addressed to more than one recipient.
  /// </li>
  /// </ul>
  final EventType? type;

  InsightsEvent({
    this.details,
    this.timestamp,
    this.type,
  });

  factory InsightsEvent.fromJson(Map<String, dynamic> json) {
    return InsightsEvent(
      details: json['Details'] != null
          ? EventDetails.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      timestamp: timeStampFromJson(json['Timestamp']),
      type: (json['Type'] as String?)?.toEventType(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final timestamp = this.timestamp;
    final type = this.type;
    return {
      if (details != null) 'Details': details,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// An object that describes how email sent during the predictive inbox
/// placement test was handled by a certain email provider.
class IspPlacement {
  /// The name of the email provider that the inbox placement data applies to.
  final String? ispName;

  /// An object that contains inbox placement metrics for a specific email
  /// provider.
  final PlacementStatistics? placementStatistics;

  IspPlacement({
    this.ispName,
    this.placementStatistics,
  });

  factory IspPlacement.fromJson(Map<String, dynamic> json) {
    return IspPlacement(
      ispName: json['IspName'] as String?,
      placementStatistics: json['PlacementStatistics'] != null
          ? PlacementStatistics.fromJson(
              json['PlacementStatistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ispName = this.ispName;
    final placementStatistics = this.placementStatistics;
    return {
      if (ispName != null) 'IspName': ispName,
      if (placementStatistics != null)
        'PlacementStatistics': placementStatistics,
    };
  }
}

/// The status of a job.
///
/// <ul>
/// <li>
/// <code>CREATED</code> – Job has just been created.
/// </li>
/// <li>
/// <code>PROCESSING</code> – Job is processing.
/// </li>
/// <li>
/// <code>ERROR</code> – An error occurred during processing.
/// </li>
/// <li>
/// <code>COMPLETED</code> – Job has completed processing successfully.
/// </li>
/// </ul>
enum JobStatus {
  created,
  processing,
  completed,
  failed,
  cancelled,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.created:
        return 'CREATED';
      case JobStatus.processing:
        return 'PROCESSING';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'CREATED':
        return JobStatus.created;
      case 'PROCESSING':
        return JobStatus.processing;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
      case 'CANCELLED':
        return JobStatus.cancelled;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// An object that defines an Amazon Kinesis Data Firehose destination for email
/// events. You can use Amazon Kinesis Data Firehose to stream data to other
/// services, such as Amazon S3 and Amazon Redshift.
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose stream
  /// that the Amazon SES API v2 sends email events to.
  final String deliveryStreamArn;

  /// The Amazon Resource Name (ARN) of the IAM role that the Amazon SES API v2
  /// uses to send email events to the Amazon Kinesis Data Firehose stream.
  final String iamRoleArn;

  KinesisFirehoseDestination({
    required this.deliveryStreamArn,
    required this.iamRoleArn,
  });

  factory KinesisFirehoseDestination.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseDestination(
      deliveryStreamArn: json['DeliveryStreamArn'] as String,
      iamRoleArn: json['IamRoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamArn = this.deliveryStreamArn;
    final iamRoleArn = this.iamRoleArn;
    return {
      'DeliveryStreamArn': deliveryStreamArn,
      'IamRoleArn': iamRoleArn,
    };
  }
}

/// A list of configuration sets in your Amazon SES account in the current
/// Amazon Web Services Region.
class ListConfigurationSetsResponse {
  /// An array that contains all of the configuration sets in your Amazon SES
  /// account in the current Amazon Web Services Region.
  final List<String>? configurationSets;

  /// A token that indicates that there are additional configuration sets to list.
  /// To view additional configuration sets, issue another request to
  /// <code>ListConfigurationSets</code>, and pass this token in the
  /// <code>NextToken</code> parameter.
  final String? nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });

  factory ListConfigurationSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationSetsResponse(
      configurationSets: (json['ConfigurationSets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSets = this.configurationSets;
    final nextToken = this.nextToken;
    return {
      if (configurationSets != null) 'ConfigurationSets': configurationSets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListContactListsResponse {
  /// The available contact lists.
  final List<ContactList>? contactLists;

  /// A string token indicating that there might be additional contact lists
  /// available to be listed. Copy this token to a subsequent call to
  /// <code>ListContactLists</code> with the same parameters to retrieve the next
  /// page of contact lists.
  final String? nextToken;

  ListContactListsResponse({
    this.contactLists,
    this.nextToken,
  });

  factory ListContactListsResponse.fromJson(Map<String, dynamic> json) {
    return ListContactListsResponse(
      contactLists: (json['ContactLists'] as List?)
          ?.whereNotNull()
          .map((e) => ContactList.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactLists = this.contactLists;
    final nextToken = this.nextToken;
    return {
      if (contactLists != null) 'ContactLists': contactLists,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A filter that can be applied to a list of contacts.
class ListContactsFilter {
  /// The status by which you are filtering: <code>OPT_IN</code> or
  /// <code>OPT_OUT</code>.
  final SubscriptionStatus? filteredStatus;

  /// Used for filtering by a specific topic preference.
  final TopicFilter? topicFilter;

  ListContactsFilter({
    this.filteredStatus,
    this.topicFilter,
  });

  Map<String, dynamic> toJson() {
    final filteredStatus = this.filteredStatus;
    final topicFilter = this.topicFilter;
    return {
      if (filteredStatus != null) 'FilteredStatus': filteredStatus.toValue(),
      if (topicFilter != null) 'TopicFilter': topicFilter,
    };
  }
}

class ListContactsResponse {
  /// The contacts present in a specific contact list.
  final List<Contact>? contacts;

  /// A string token indicating that there might be additional contacts available
  /// to be listed. Copy this token to a subsequent call to
  /// <code>ListContacts</code> with the same parameters to retrieve the next page
  /// of contacts.
  final String? nextToken;

  ListContactsResponse({
    this.contacts,
    this.nextToken,
  });

  factory ListContactsResponse.fromJson(Map<String, dynamic> json) {
    return ListContactsResponse(
      contacts: (json['Contacts'] as List?)
          ?.whereNotNull()
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contacts = this.contacts;
    final nextToken = this.nextToken;
    return {
      if (contacts != null) 'Contacts': contacts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The following elements are returned by the service.
class ListCustomVerificationEmailTemplatesResponse {
  /// A list of the custom verification email templates that exist in your
  /// account.
  final List<CustomVerificationEmailTemplateMetadata>?
      customVerificationEmailTemplates;

  /// A token indicating that there are additional custom verification email
  /// templates available to be listed. Pass this token to a subsequent call to
  /// <code>ListCustomVerificationEmailTemplates</code> to retrieve the next 50
  /// custom verification email templates.
  final String? nextToken;

  ListCustomVerificationEmailTemplatesResponse({
    this.customVerificationEmailTemplates,
    this.nextToken,
  });

  factory ListCustomVerificationEmailTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCustomVerificationEmailTemplatesResponse(
      customVerificationEmailTemplates:
          (json['CustomVerificationEmailTemplates'] as List?)
              ?.whereNotNull()
              .map((e) => CustomVerificationEmailTemplateMetadata.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customVerificationEmailTemplates =
        this.customVerificationEmailTemplates;
    final nextToken = this.nextToken;
    return {
      if (customVerificationEmailTemplates != null)
        'CustomVerificationEmailTemplates': customVerificationEmailTemplates,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A list of dedicated IP pools.
class ListDedicatedIpPoolsResponse {
  /// A list of all of the dedicated IP pools that are associated with your Amazon
  /// Web Services account in the current Region.
  final List<String>? dedicatedIpPools;

  /// A token that indicates that there are additional IP pools to list. To view
  /// additional IP pools, issue another request to
  /// <code>ListDedicatedIpPools</code>, passing this token in the
  /// <code>NextToken</code> parameter.
  final String? nextToken;

  ListDedicatedIpPoolsResponse({
    this.dedicatedIpPools,
    this.nextToken,
  });

  factory ListDedicatedIpPoolsResponse.fromJson(Map<String, dynamic> json) {
    return ListDedicatedIpPoolsResponse(
      dedicatedIpPools: (json['DedicatedIpPools'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedIpPools = this.dedicatedIpPools;
    final nextToken = this.nextToken;
    return {
      if (dedicatedIpPools != null) 'DedicatedIpPools': dedicatedIpPools,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A list of the predictive inbox placement test reports that are available for
/// your account, regardless of whether or not those tests are complete.
class ListDeliverabilityTestReportsResponse {
  /// An object that contains a lists of predictive inbox placement tests that
  /// you've performed.
  final List<DeliverabilityTestReport> deliverabilityTestReports;

  /// A token that indicates that there are additional predictive inbox placement
  /// tests to list. To view additional predictive inbox placement tests, issue
  /// another request to <code>ListDeliverabilityTestReports</code>, and pass this
  /// token in the <code>NextToken</code> parameter.
  final String? nextToken;

  ListDeliverabilityTestReportsResponse({
    required this.deliverabilityTestReports,
    this.nextToken,
  });

  factory ListDeliverabilityTestReportsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDeliverabilityTestReportsResponse(
      deliverabilityTestReports: (json['DeliverabilityTestReports'] as List)
          .whereNotNull()
          .map((e) =>
              DeliverabilityTestReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliverabilityTestReports = this.deliverabilityTestReports;
    final nextToken = this.nextToken;
    return {
      'DeliverabilityTestReports': deliverabilityTestReports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An array of objects that provide deliverability data for all the campaigns
/// that used a specific domain to send email during a specified time range.
/// This data is available for a domain only if you enabled the Deliverability
/// dashboard for the domain.
class ListDomainDeliverabilityCampaignsResponse {
  /// An array of responses, one for each campaign that used the domain to send
  /// email during the specified time range.
  final List<DomainDeliverabilityCampaign> domainDeliverabilityCampaigns;

  /// A token that’s returned from a previous call to the
  /// <code>ListDomainDeliverabilityCampaigns</code> operation. This token
  /// indicates the position of the campaign in the list of campaigns.
  final String? nextToken;

  ListDomainDeliverabilityCampaignsResponse({
    required this.domainDeliverabilityCampaigns,
    this.nextToken,
  });

  factory ListDomainDeliverabilityCampaignsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDomainDeliverabilityCampaignsResponse(
      domainDeliverabilityCampaigns: (json['DomainDeliverabilityCampaigns']
              as List)
          .whereNotNull()
          .map((e) =>
              DomainDeliverabilityCampaign.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainDeliverabilityCampaigns = this.domainDeliverabilityCampaigns;
    final nextToken = this.nextToken;
    return {
      'DomainDeliverabilityCampaigns': domainDeliverabilityCampaigns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A list of all of the identities that you've attempted to verify, regardless
/// of whether or not those identities were successfully verified.
class ListEmailIdentitiesResponse {
  /// An array that includes all of the email identities associated with your
  /// Amazon Web Services account.
  final List<IdentityInfo>? emailIdentities;

  /// A token that indicates that there are additional configuration sets to list.
  /// To view additional configuration sets, issue another request to
  /// <code>ListEmailIdentities</code>, and pass this token in the
  /// <code>NextToken</code> parameter.
  final String? nextToken;

  ListEmailIdentitiesResponse({
    this.emailIdentities,
    this.nextToken,
  });

  factory ListEmailIdentitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListEmailIdentitiesResponse(
      emailIdentities: (json['EmailIdentities'] as List?)
          ?.whereNotNull()
          .map((e) => IdentityInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailIdentities = this.emailIdentities;
    final nextToken = this.nextToken;
    return {
      if (emailIdentities != null) 'EmailIdentities': emailIdentities,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The following elements are returned by the service.
class ListEmailTemplatesResponse {
  /// A token indicating that there are additional email templates available to be
  /// listed. Pass this token to a subsequent <code>ListEmailTemplates</code> call
  /// to retrieve the next 10 email templates.
  final String? nextToken;

  /// An array the contains the name and creation time stamp for each template in
  /// your Amazon SES account.
  final List<EmailTemplateMetadata>? templatesMetadata;

  ListEmailTemplatesResponse({
    this.nextToken,
    this.templatesMetadata,
  });

  factory ListEmailTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListEmailTemplatesResponse(
      nextToken: json['NextToken'] as String?,
      templatesMetadata: (json['TemplatesMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => EmailTemplateMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final templatesMetadata = this.templatesMetadata;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (templatesMetadata != null) 'TemplatesMetadata': templatesMetadata,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class ListExportJobsResponse {
  /// A list of the export job summaries.
  final List<ExportJobSummary>? exportJobs;

  /// A string token indicating that there might be additional export jobs
  /// available to be listed. Use this token to a subsequent call to
  /// <code>ListExportJobs</code> with the same parameters to retrieve the next
  /// page of export jobs.
  final String? nextToken;

  ListExportJobsResponse({
    this.exportJobs,
    this.nextToken,
  });

  factory ListExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportJobsResponse(
      exportJobs: (json['ExportJobs'] as List?)
          ?.whereNotNull()
          .map((e) => ExportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobs = this.exportJobs;
    final nextToken = this.nextToken;
    return {
      if (exportJobs != null) 'ExportJobs': exportJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class ListImportJobsResponse {
  /// A list of the import job summaries.
  final List<ImportJobSummary>? importJobs;

  /// A string token indicating that there might be additional import jobs
  /// available to be listed. Copy this token to a subsequent call to
  /// <code>ListImportJobs</code> with the same parameters to retrieve the next
  /// page of import jobs.
  final String? nextToken;

  ListImportJobsResponse({
    this.importJobs,
    this.nextToken,
  });

  factory ListImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportJobsResponse(
      importJobs: (json['ImportJobs'] as List?)
          ?.whereNotNull()
          .map((e) => ImportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importJobs = this.importJobs;
    final nextToken = this.nextToken;
    return {
      if (importJobs != null) 'ImportJobs': importJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An object used to specify a list or topic to which an email belongs, which
/// will be used when a contact chooses to unsubscribe.
class ListManagementOptions {
  /// The name of the contact list.
  final String contactListName;

  /// The name of the topic.
  final String? topicName;

  ListManagementOptions({
    required this.contactListName,
    this.topicName,
  });

  Map<String, dynamic> toJson() {
    final contactListName = this.contactListName;
    final topicName = this.topicName;
    return {
      'ContactListName': contactListName,
      if (topicName != null) 'TopicName': topicName,
    };
  }
}

/// The <code>ListRecommendations</code> filter type. This can be one of the
/// following:
///
/// <ul>
/// <li>
/// <code>TYPE</code> – The recommendation type, with values like
/// <code>DKIM</code>, <code>SPF</code>, <code>DMARC</code> or
/// <code>BIMI</code>.
/// </li>
/// <li>
/// <code>IMPACT</code> – The recommendation impact, with values like
/// <code>HIGH</code> or <code>LOW</code>.
/// </li>
/// <li>
/// <code>STATUS</code> – The recommendation status, with values like
/// <code>OPEN</code> or <code>FIXED</code>.
/// </li>
/// <li>
/// <code>RESOURCE_ARN</code> – The resource affected by the recommendation,
/// with values like
/// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
/// </li>
/// </ul>
enum ListRecommendationsFilterKey {
  type,
  impact,
  status,
  resourceArn,
}

extension ListRecommendationsFilterKeyValueExtension
    on ListRecommendationsFilterKey {
  String toValue() {
    switch (this) {
      case ListRecommendationsFilterKey.type:
        return 'TYPE';
      case ListRecommendationsFilterKey.impact:
        return 'IMPACT';
      case ListRecommendationsFilterKey.status:
        return 'STATUS';
      case ListRecommendationsFilterKey.resourceArn:
        return 'RESOURCE_ARN';
    }
  }
}

extension ListRecommendationsFilterKeyFromString on String {
  ListRecommendationsFilterKey toListRecommendationsFilterKey() {
    switch (this) {
      case 'TYPE':
        return ListRecommendationsFilterKey.type;
      case 'IMPACT':
        return ListRecommendationsFilterKey.impact;
      case 'STATUS':
        return ListRecommendationsFilterKey.status;
      case 'RESOURCE_ARN':
        return ListRecommendationsFilterKey.resourceArn;
    }
    throw Exception('$this is not known in enum ListRecommendationsFilterKey');
  }
}

/// Contains the response to your request to retrieve the list of
/// recommendations for your account.
class ListRecommendationsResponse {
  /// A string token indicating that there might be additional recommendations
  /// available to be listed. Use the token provided in the
  /// <code>ListRecommendationsResponse</code> to use in the subsequent call to
  /// <code>ListRecommendations</code> with the same parameters to retrieve the
  /// next page of recommendations.
  final String? nextToken;

  /// The recommendations applicable to your account.
  final List<Recommendation>? recommendations;

  ListRecommendationsResponse({
    this.nextToken,
    this.recommendations,
  });

  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      nextToken: json['NextToken'] as String?,
      recommendations: (json['Recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommendations = this.recommendations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommendations != null) 'Recommendations': recommendations,
    };
  }
}

/// A list of suppressed email addresses.
class ListSuppressedDestinationsResponse {
  /// A token that indicates that there are additional email addresses on the
  /// suppression list for your account. To view additional suppressed addresses,
  /// issue another request to <code>ListSuppressedDestinations</code>, and pass
  /// this token in the <code>NextToken</code> parameter.
  final String? nextToken;

  /// A list of summaries, each containing a summary for a suppressed email
  /// destination.
  final List<SuppressedDestinationSummary>? suppressedDestinationSummaries;

  ListSuppressedDestinationsResponse({
    this.nextToken,
    this.suppressedDestinationSummaries,
  });

  factory ListSuppressedDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSuppressedDestinationsResponse(
      nextToken: json['NextToken'] as String?,
      suppressedDestinationSummaries: (json['SuppressedDestinationSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              SuppressedDestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final suppressedDestinationSummaries = this.suppressedDestinationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (suppressedDestinationSummaries != null)
        'SuppressedDestinationSummaries': suppressedDestinationSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// An array that lists all the tags that are associated with the resource. Each
  /// tag consists of a required tag key (<code>Key</code>) and an associated tag
  /// value (<code>Value</code>)
  final List<Tag> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }
}

/// A list of attributes that are associated with a MAIL FROM domain.
class MailFromAttributes {
  /// The action to take if the required MX record can't be found when you send an
  /// email. When you set this value to <code>USE_DEFAULT_VALUE</code>, the mail
  /// is sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set
  /// this value to <code>REJECT_MESSAGE</code>, the Amazon SES API v2 returns a
  /// <code>MailFromDomainNotVerified</code> error, and doesn't attempt to deliver
  /// the email.
  ///
  /// These behaviors are taken when the custom MAIL FROM domain configuration is
  /// in the <code>Pending</code>, <code>Failed</code>, and
  /// <code>TemporaryFailure</code> states.
  final BehaviorOnMxFailure behaviorOnMxFailure;

  /// The name of a domain that an email identity uses as a custom MAIL FROM
  /// domain.
  final String mailFromDomain;

  /// The status of the MAIL FROM domain. This status can have the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – Amazon SES hasn't started searching for the MX record
  /// yet.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – Amazon SES detected the required MX record for the
  /// MAIL FROM domain.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – Amazon SES can't find the required MX record, or the
  /// record no longer exists.
  /// </li>
  /// <li>
  /// <code>TEMPORARY_FAILURE</code> – A temporary issue occurred, which prevented
  /// Amazon SES from determining the status of the MAIL FROM domain.
  /// </li>
  /// </ul>
  final MailFromDomainStatus mailFromDomainStatus;

  MailFromAttributes({
    required this.behaviorOnMxFailure,
    required this.mailFromDomain,
    required this.mailFromDomainStatus,
  });

  factory MailFromAttributes.fromJson(Map<String, dynamic> json) {
    return MailFromAttributes(
      behaviorOnMxFailure:
          (json['BehaviorOnMxFailure'] as String).toBehaviorOnMxFailure(),
      mailFromDomain: json['MailFromDomain'] as String,
      mailFromDomainStatus:
          (json['MailFromDomainStatus'] as String).toMailFromDomainStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final behaviorOnMxFailure = this.behaviorOnMxFailure;
    final mailFromDomain = this.mailFromDomain;
    final mailFromDomainStatus = this.mailFromDomainStatus;
    return {
      'BehaviorOnMxFailure': behaviorOnMxFailure.toValue(),
      'MailFromDomain': mailFromDomain,
      'MailFromDomainStatus': mailFromDomainStatus.toValue(),
    };
  }
}

/// The status of the MAIL FROM domain. This status can have the following
/// values:
///
/// <ul>
/// <li>
/// <code>PENDING</code> – Amazon SES hasn't started searching for the MX record
/// yet.
/// </li>
/// <li>
/// <code>SUCCESS</code> – Amazon SES detected the required MX record for the
/// MAIL FROM domain.
/// </li>
/// <li>
/// <code>FAILED</code> – Amazon SES can't find the required MX record, or the
/// record no longer exists.
/// </li>
/// <li>
/// <code>TEMPORARY_FAILURE</code> – A temporary issue occurred, which prevented
/// Amazon SES from determining the status of the MAIL FROM domain.
/// </li>
/// </ul>
enum MailFromDomainStatus {
  pending,
  success,
  failed,
  temporaryFailure,
}

extension MailFromDomainStatusValueExtension on MailFromDomainStatus {
  String toValue() {
    switch (this) {
      case MailFromDomainStatus.pending:
        return 'PENDING';
      case MailFromDomainStatus.success:
        return 'SUCCESS';
      case MailFromDomainStatus.failed:
        return 'FAILED';
      case MailFromDomainStatus.temporaryFailure:
        return 'TEMPORARY_FAILURE';
    }
  }
}

extension MailFromDomainStatusFromString on String {
  MailFromDomainStatus toMailFromDomainStatus() {
    switch (this) {
      case 'PENDING':
        return MailFromDomainStatus.pending;
      case 'SUCCESS':
        return MailFromDomainStatus.success;
      case 'FAILED':
        return MailFromDomainStatus.failed;
      case 'TEMPORARY_FAILURE':
        return MailFromDomainStatus.temporaryFailure;
    }
    throw Exception('$this is not known in enum MailFromDomainStatus');
  }
}

enum MailType {
  marketing,
  transactional,
}

extension MailTypeValueExtension on MailType {
  String toValue() {
    switch (this) {
      case MailType.marketing:
        return 'MARKETING';
      case MailType.transactional:
        return 'TRANSACTIONAL';
    }
  }
}

extension MailTypeFromString on String {
  MailType toMailType() {
    switch (this) {
      case 'MARKETING':
        return MailType.marketing;
      case 'TRANSACTIONAL':
        return MailType.transactional;
    }
    throw Exception('$this is not known in enum MailType');
  }
}

/// Represents the email message that you're sending. The <code>Message</code>
/// object consists of a subject line and a message body.
class Message {
  /// The body of the message. You can specify an HTML version of the message, a
  /// text-only version of the message, or both.
  final Body body;

  /// The subject line of the email. The subject line can only contain 7-bit ASCII
  /// characters. However, you can specify non-ASCII characters in the subject
  /// line by using encoded-word syntax, as described in <a
  /// href="https://tools.ietf.org/html/rfc2047">RFC 2047</a>.
  final Content subject;

  /// The list of message headers that will be added to the email message.
  final List<MessageHeader>? headers;

  Message({
    required this.body,
    required this.subject,
    this.headers,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final subject = this.subject;
    final headers = this.headers;
    return {
      'Body': body,
      'Subject': subject,
      if (headers != null) 'Headers': headers,
    };
  }
}

/// Contains the name and value of a message header that you add to an email.
class MessageHeader {
  /// The name of the message header. The message header name has to meet the
  /// following criteria:
  ///
  /// <ul>
  /// <li>
  /// Can contain any printable ASCII character (33 - 126) except for colon (:).
  /// </li>
  /// <li>
  /// Can contain no more than 126 characters.
  /// </li>
  /// </ul>
  final String name;

  /// The value of the message header. The message header value has to meet the
  /// following criteria:
  ///
  /// <ul>
  /// <li>
  /// Can contain any printable ASCII character.
  /// </li>
  /// <li>
  /// Can contain no more than 870 characters.
  /// </li>
  /// </ul>
  final String value;

  MessageHeader({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// An object that contains filters applied when performing the Message Insights
/// export.
class MessageInsightsDataSource {
  /// Represents the end date for the export interval as a timestamp. The end date
  /// is inclusive.
  final DateTime endDate;

  /// Represents the start date for the export interval as a timestamp. The start
  /// date is inclusive.
  final DateTime startDate;

  /// Filters for results to be excluded from the export file.
  final MessageInsightsFilters? exclude;

  /// Filters for results to be included in the export file.
  final MessageInsightsFilters? include;

  /// The maximum number of results.
  final int? maxResults;

  MessageInsightsDataSource({
    required this.endDate,
    required this.startDate,
    this.exclude,
    this.include,
    this.maxResults,
  });

  factory MessageInsightsDataSource.fromJson(Map<String, dynamic> json) {
    return MessageInsightsDataSource(
      endDate: nonNullableTimeStampFromJson(json['EndDate'] as Object),
      startDate: nonNullableTimeStampFromJson(json['StartDate'] as Object),
      exclude: json['Exclude'] != null
          ? MessageInsightsFilters.fromJson(
              json['Exclude'] as Map<String, dynamic>)
          : null,
      include: json['Include'] != null
          ? MessageInsightsFilters.fromJson(
              json['Include'] as Map<String, dynamic>)
          : null,
      maxResults: json['MaxResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final startDate = this.startDate;
    final exclude = this.exclude;
    final include = this.include;
    final maxResults = this.maxResults;
    return {
      'EndDate': unixTimestampToJson(endDate),
      'StartDate': unixTimestampToJson(startDate),
      if (exclude != null) 'Exclude': exclude,
      if (include != null) 'Include': include,
      if (maxResults != null) 'MaxResults': maxResults,
    };
  }
}

/// An object containing Message Insights filters.
///
/// If you specify multiple filters, the filters are joined by AND.
///
/// If you specify multiple values for a filter, the values are joined by OR.
/// Filter values are case-sensitive.
///
/// <code>FromEmailAddress</code>, <code>Destination</code>, and
/// <code>Subject</code> filters support partial match. A partial match is
/// performed by using the <code>*</code> wildcard character placed at the
/// beginning (suffix match), the end (prefix match) or both ends of the string
/// (contains match). In order to match the literal characters <code>*</code> or
/// <code>\</code>, they must be escaped using the <code>\</code> character. If
/// no wildcard character is present, an exact match is performed.
class MessageInsightsFilters {
  /// The recipient's email address.
  final List<String>? destination;

  /// The from address used to send the message.
  final List<String>? fromEmailAddress;

  /// The recipient's ISP (e.g., <code>Gmail</code>, <code>Yahoo</code>, etc.).
  final List<String>? isp;

  /// The last delivery-related event for the email, where the ordering is as
  /// follows: <code>SEND</code> &lt; <code>BOUNCE</code> &lt;
  /// <code>DELIVERY</code> &lt; <code>COMPLAINT</code>.
  final List<DeliveryEventType>? lastDeliveryEvent;

  /// The last engagement-related event for the email, where the ordering is as
  /// follows: <code>OPEN</code> &lt; <code>CLICK</code>.
  ///
  /// Engagement events are only available if <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/vdm-settings.html">Engagement
  /// tracking</a> is enabled.
  final List<EngagementEventType>? lastEngagementEvent;

  /// The subject line of the message.
  final List<String>? subject;

  MessageInsightsFilters({
    this.destination,
    this.fromEmailAddress,
    this.isp,
    this.lastDeliveryEvent,
    this.lastEngagementEvent,
    this.subject,
  });

  factory MessageInsightsFilters.fromJson(Map<String, dynamic> json) {
    return MessageInsightsFilters(
      destination: (json['Destination'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      fromEmailAddress: (json['FromEmailAddress'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      isp: (json['Isp'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastDeliveryEvent: (json['LastDeliveryEvent'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toDeliveryEventType())
          .toList(),
      lastEngagementEvent: (json['LastEngagementEvent'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEngagementEventType())
          .toList(),
      subject: (json['Subject'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final fromEmailAddress = this.fromEmailAddress;
    final isp = this.isp;
    final lastDeliveryEvent = this.lastDeliveryEvent;
    final lastEngagementEvent = this.lastEngagementEvent;
    final subject = this.subject;
    return {
      if (destination != null) 'Destination': destination,
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (isp != null) 'Isp': isp,
      if (lastDeliveryEvent != null)
        'LastDeliveryEvent': lastDeliveryEvent.map((e) => e.toValue()).toList(),
      if (lastEngagementEvent != null)
        'LastEngagementEvent':
            lastEngagementEvent.map((e) => e.toValue()).toList(),
      if (subject != null) 'Subject': subject,
    };
  }
}

/// Contains the name and value of a tag that you apply to an email. You can use
/// message tags when you publish email sending events.
class MessageTag {
  /// The name of the message tag. The message tag name has to meet the following
  /// criteria:
  ///
  /// <ul>
  /// <li>
  /// It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores
  /// (_), or dashes (-).
  /// </li>
  /// <li>
  /// It can contain no more than 256 characters.
  /// </li>
  /// </ul>
  final String name;

  /// The value of the message tag. The message tag value has to meet the
  /// following criteria:
  ///
  /// <ul>
  /// <li>
  /// It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores
  /// (_), or dashes (-).
  /// </li>
  /// <li>
  /// It can contain no more than 256 characters.
  /// </li>
  /// </ul>
  final String value;

  MessageTag({
    required this.name,
    required this.value,
  });

  factory MessageTag.fromJson(Map<String, dynamic> json) {
    return MessageTag(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// The metric to export, can be one of the following:
///
/// <ul>
/// <li>
/// <code>SEND</code> - Emails sent eligible for tracking in the VDM dashboard.
/// This excludes emails sent to the mailbox simulator and emails addressed to
/// more than one recipient.
/// </li>
/// <li>
/// <code>COMPLAINT</code> - Complaints received for your account. This excludes
/// complaints from the mailbox simulator, those originating from your
/// account-level suppression list (if enabled), and those for emails addressed
/// to more than one recipient
/// </li>
/// <li>
/// <code>PERMANENT_BOUNCE</code> - Permanent bounces - i.e., feedback received
/// for emails sent to non-existent mailboxes. Excludes bounces from the mailbox
/// simulator, those originating from your account-level suppression list (if
/// enabled), and those for emails addressed to more than one recipient.
/// </li>
/// <li>
/// <code>TRANSIENT_BOUNCE</code> - Transient bounces - i.e., feedback received
/// for delivery failures excluding issues with non-existent mailboxes. Excludes
/// bounces from the mailbox simulator, and those for emails addressed to more
/// than one recipient.
/// </li>
/// <li>
/// <code>OPEN</code> - Unique open events for emails including open trackers.
/// Excludes opens for emails addressed to more than one recipient.
/// </li>
/// <li>
/// <code>CLICK</code> - Unique click events for emails including wrapped links.
/// Excludes clicks for emails addressed to more than one recipient.
/// </li>
/// <li>
/// <code>DELIVERY</code> - Successful deliveries for email sending attempts.
/// Excludes deliveries to the mailbox simulator and for emails addressed to
/// more than one recipient.
/// </li>
/// <li>
/// <code>DELIVERY_OPEN</code> - Successful deliveries for email sending
/// attempts. Excludes deliveries to the mailbox simulator, for emails addressed
/// to more than one recipient, and emails without open trackers.
/// </li>
/// <li>
/// <code>DELIVERY_CLICK</code> - Successful deliveries for email sending
/// attempts. Excludes deliveries to the mailbox simulator, for emails addressed
/// to more than one recipient, and emails without click trackers.
/// </li>
/// <li>
/// <code>DELIVERY_COMPLAINT</code> - Successful deliveries for email sending
/// attempts. Excludes deliveries to the mailbox simulator, for emails addressed
/// to more than one recipient, and emails addressed to recipients hosted by
/// ISPs with which Amazon SES does not have a feedback loop agreement.
/// </li>
/// </ul>
enum Metric {
  send,
  complaint,
  permanentBounce,
  transientBounce,
  open,
  click,
  delivery,
  deliveryOpen,
  deliveryClick,
  deliveryComplaint,
}

extension MetricValueExtension on Metric {
  String toValue() {
    switch (this) {
      case Metric.send:
        return 'SEND';
      case Metric.complaint:
        return 'COMPLAINT';
      case Metric.permanentBounce:
        return 'PERMANENT_BOUNCE';
      case Metric.transientBounce:
        return 'TRANSIENT_BOUNCE';
      case Metric.open:
        return 'OPEN';
      case Metric.click:
        return 'CLICK';
      case Metric.delivery:
        return 'DELIVERY';
      case Metric.deliveryOpen:
        return 'DELIVERY_OPEN';
      case Metric.deliveryClick:
        return 'DELIVERY_CLICK';
      case Metric.deliveryComplaint:
        return 'DELIVERY_COMPLAINT';
    }
  }
}

extension MetricFromString on String {
  Metric toMetric() {
    switch (this) {
      case 'SEND':
        return Metric.send;
      case 'COMPLAINT':
        return Metric.complaint;
      case 'PERMANENT_BOUNCE':
        return Metric.permanentBounce;
      case 'TRANSIENT_BOUNCE':
        return Metric.transientBounce;
      case 'OPEN':
        return Metric.open;
      case 'CLICK':
        return Metric.click;
      case 'DELIVERY':
        return Metric.delivery;
      case 'DELIVERY_OPEN':
        return Metric.deliveryOpen;
      case 'DELIVERY_CLICK':
        return Metric.deliveryClick;
      case 'DELIVERY_COMPLAINT':
        return Metric.deliveryComplaint;
    }
    throw Exception('$this is not known in enum Metric');
  }
}

/// The aggregation to apply to a metric, can be one of the following:
///
/// <ul>
/// <li>
/// <code>VOLUME</code> - The volume of events for this metric.
/// </li>
/// <li>
/// <code>RATE</code> - The rate for this metric relative to the
/// <code>SEND</code> metric volume.
/// </li>
/// </ul>
enum MetricAggregation {
  rate,
  volume,
}

extension MetricAggregationValueExtension on MetricAggregation {
  String toValue() {
    switch (this) {
      case MetricAggregation.rate:
        return 'RATE';
      case MetricAggregation.volume:
        return 'VOLUME';
    }
  }
}

extension MetricAggregationFromString on String {
  MetricAggregation toMetricAggregation() {
    switch (this) {
      case 'RATE':
        return MetricAggregation.rate;
      case 'VOLUME':
        return MetricAggregation.volume;
    }
    throw Exception('$this is not known in enum MetricAggregation');
  }
}

/// An error corresponding to the unsuccessful processing of a single metric
/// data query.
class MetricDataError {
  /// The query error code. Can be one of:
  ///
  /// <ul>
  /// <li>
  /// <code>INTERNAL_FAILURE</code> – Amazon SES has failed to process one of the
  /// queries.
  /// </li>
  /// <li>
  /// <code>ACCESS_DENIED</code> – You have insufficient access to retrieve
  /// metrics based on the given query.
  /// </li>
  /// </ul>
  final QueryErrorCode? code;

  /// The query identifier.
  final String? id;

  /// The error message associated with the current query error.
  final String? message;

  MetricDataError({
    this.code,
    this.id,
    this.message,
  });

  factory MetricDataError.fromJson(Map<String, dynamic> json) {
    return MetricDataError(
      code: (json['Code'] as String?)?.toQueryErrorCode(),
      id: json['Id'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final id = this.id;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (id != null) 'Id': id,
      if (message != null) 'Message': message,
    };
  }
}

/// The result of a single metric data query.
class MetricDataResult {
  /// The query identifier.
  final String? id;

  /// A list of timestamps for the metric data results.
  final List<DateTime>? timestamps;

  /// A list of values (cumulative / sum) for the metric data results.
  final List<int>? values;

  MetricDataResult({
    this.id,
    this.timestamps,
    this.values,
  });

  factory MetricDataResult.fromJson(Map<String, dynamic> json) {
    return MetricDataResult(
      id: json['Id'] as String?,
      timestamps: (json['Timestamps'] as List?)
          ?.whereNotNull()
          .map(nonNullableTimeStampFromJson)
          .toList(),
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final timestamps = this.timestamps;
    final values = this.values;
    return {
      if (id != null) 'Id': id,
      if (timestamps != null)
        'Timestamps': timestamps.map(unixTimestampToJson).toList(),
      if (values != null) 'Values': values,
    };
  }
}

/// The <code>BatchGetMetricDataQuery</code> dimension name. This can be one of
/// the following:
///
/// <ul>
/// <li>
/// <code>EMAIL_IDENTITY</code> – The email identity used when sending messages.
/// </li>
/// <li>
/// <code>CONFIGURATION_SET</code> – The configuration set used when sending
/// messages (if one was used).
/// </li>
/// <li>
/// <code>ISP</code> – The recipient ISP (e.g. <code>Gmail</code>,
/// <code>Yahoo</code>, etc.).
/// </li>
/// </ul>
enum MetricDimensionName {
  emailIdentity,
  configurationSet,
  isp,
}

extension MetricDimensionNameValueExtension on MetricDimensionName {
  String toValue() {
    switch (this) {
      case MetricDimensionName.emailIdentity:
        return 'EMAIL_IDENTITY';
      case MetricDimensionName.configurationSet:
        return 'CONFIGURATION_SET';
      case MetricDimensionName.isp:
        return 'ISP';
    }
  }
}

extension MetricDimensionNameFromString on String {
  MetricDimensionName toMetricDimensionName() {
    switch (this) {
      case 'EMAIL_IDENTITY':
        return MetricDimensionName.emailIdentity;
      case 'CONFIGURATION_SET':
        return MetricDimensionName.configurationSet;
      case 'ISP':
        return MetricDimensionName.isp;
    }
    throw Exception('$this is not known in enum MetricDimensionName');
  }
}

enum MetricNamespace {
  vdm,
}

extension MetricNamespaceValueExtension on MetricNamespace {
  String toValue() {
    switch (this) {
      case MetricNamespace.vdm:
        return 'VDM';
    }
  }
}

extension MetricNamespaceFromString on String {
  MetricNamespace toMetricNamespace() {
    switch (this) {
      case 'VDM':
        return MetricNamespace.vdm;
    }
    throw Exception('$this is not known in enum MetricNamespace');
  }
}

/// An object that contains details about the data source for the metrics
/// export.
class MetricsDataSource {
  /// An object that contains a mapping between a <code>MetricDimensionName</code>
  /// and <code>MetricDimensionValue</code> to filter metrics by. Must contain a
  /// least 1 dimension but no more than 3 unique ones.
  final Map<MetricDimensionName, List<String>> dimensions;

  /// Represents the end date for the export interval as a timestamp.
  final DateTime endDate;

  /// A list of <code>ExportMetric</code> objects to export.
  final List<ExportMetric> metrics;

  /// The metrics namespace - e.g., <code>VDM</code>.
  final MetricNamespace namespace;

  /// Represents the start date for the export interval as a timestamp.
  final DateTime startDate;

  MetricsDataSource({
    required this.dimensions,
    required this.endDate,
    required this.metrics,
    required this.namespace,
    required this.startDate,
  });

  factory MetricsDataSource.fromJson(Map<String, dynamic> json) {
    return MetricsDataSource(
      dimensions: (json['Dimensions'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k.toMetricDimensionName(),
              (e as List).whereNotNull().map((e) => e as String).toList())),
      endDate: nonNullableTimeStampFromJson(json['EndDate'] as Object),
      metrics: (json['Metrics'] as List)
          .whereNotNull()
          .map((e) => ExportMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace: (json['Namespace'] as String).toMetricNamespace(),
      startDate: nonNullableTimeStampFromJson(json['StartDate'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final endDate = this.endDate;
    final metrics = this.metrics;
    final namespace = this.namespace;
    final startDate = this.startDate;
    return {
      'Dimensions': dimensions.map((k, e) => MapEntry(k.toValue(), e)),
      'EndDate': unixTimestampToJson(endDate),
      'Metrics': metrics,
      'Namespace': namespace.toValue(),
      'StartDate': unixTimestampToJson(startDate),
    };
  }
}

/// An object that contains information about email that was sent from the
/// selected domain.
class OverallVolume {
  /// An object that contains inbox and junk mail placement metrics for individual
  /// email providers.
  final List<DomainIspPlacement>? domainIspPlacements;

  /// The percentage of emails that were sent from the domain that were read by
  /// their recipients.
  final double? readRatePercent;

  /// An object that contains information about the numbers of messages that
  /// arrived in recipients' inboxes and junk mail folders.
  final VolumeStatistics? volumeStatistics;

  OverallVolume({
    this.domainIspPlacements,
    this.readRatePercent,
    this.volumeStatistics,
  });

  factory OverallVolume.fromJson(Map<String, dynamic> json) {
    return OverallVolume(
      domainIspPlacements: (json['DomainIspPlacements'] as List?)
          ?.whereNotNull()
          .map((e) => DomainIspPlacement.fromJson(e as Map<String, dynamic>))
          .toList(),
      readRatePercent: json['ReadRatePercent'] as double?,
      volumeStatistics: json['VolumeStatistics'] != null
          ? VolumeStatistics.fromJson(
              json['VolumeStatistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainIspPlacements = this.domainIspPlacements;
    final readRatePercent = this.readRatePercent;
    final volumeStatistics = this.volumeStatistics;
    return {
      if (domainIspPlacements != null)
        'DomainIspPlacements': domainIspPlacements,
      if (readRatePercent != null) 'ReadRatePercent': readRatePercent,
      if (volumeStatistics != null) 'VolumeStatistics': volumeStatistics,
    };
  }
}

/// An object that defines an Amazon Pinpoint project destination for email
/// events. You can send email event data to a Amazon Pinpoint project to view
/// metrics using the Transactional Messaging dashboards that are built in to
/// Amazon Pinpoint. For more information, see <a
/// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional
/// Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.
class PinpointDestination {
  /// The Amazon Resource Name (ARN) of the Amazon Pinpoint project to send email
  /// events to.
  final String? applicationArn;

  PinpointDestination({
    this.applicationArn,
  });

  factory PinpointDestination.fromJson(Map<String, dynamic> json) {
    return PinpointDestination(
      applicationArn: json['ApplicationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
    };
  }
}

/// An object that contains inbox placement data for an email provider.
class PlacementStatistics {
  /// The percentage of emails that were authenticated by using DomainKeys
  /// Identified Mail (DKIM) during the predictive inbox placement test.
  final double? dkimPercentage;

  /// The percentage of emails that arrived in recipients' inboxes during the
  /// predictive inbox placement test.
  final double? inboxPercentage;

  /// The percentage of emails that didn't arrive in recipients' inboxes at all
  /// during the predictive inbox placement test.
  final double? missingPercentage;

  /// The percentage of emails that arrived in recipients' spam or junk mail
  /// folders during the predictive inbox placement test.
  final double? spamPercentage;

  /// The percentage of emails that were authenticated by using Sender Policy
  /// Framework (SPF) during the predictive inbox placement test.
  final double? spfPercentage;

  PlacementStatistics({
    this.dkimPercentage,
    this.inboxPercentage,
    this.missingPercentage,
    this.spamPercentage,
    this.spfPercentage,
  });

  factory PlacementStatistics.fromJson(Map<String, dynamic> json) {
    return PlacementStatistics(
      dkimPercentage: json['DkimPercentage'] as double?,
      inboxPercentage: json['InboxPercentage'] as double?,
      missingPercentage: json['MissingPercentage'] as double?,
      spamPercentage: json['SpamPercentage'] as double?,
      spfPercentage: json['SpfPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dkimPercentage = this.dkimPercentage;
    final inboxPercentage = this.inboxPercentage;
    final missingPercentage = this.missingPercentage;
    final spamPercentage = this.spamPercentage;
    final spfPercentage = this.spfPercentage;
    return {
      if (dkimPercentage != null) 'DkimPercentage': dkimPercentage,
      if (inboxPercentage != null) 'InboxPercentage': inboxPercentage,
      if (missingPercentage != null) 'MissingPercentage': missingPercentage,
      if (spamPercentage != null) 'SpamPercentage': spamPercentage,
      if (spfPercentage != null) 'SpfPercentage': spfPercentage,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutAccountDedicatedIpWarmupAttributesResponse {
  PutAccountDedicatedIpWarmupAttributesResponse();

  factory PutAccountDedicatedIpWarmupAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutAccountDedicatedIpWarmupAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutAccountDetailsResponse {
  PutAccountDetailsResponse();

  factory PutAccountDetailsResponse.fromJson(Map<String, dynamic> _) {
    return PutAccountDetailsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutAccountSendingAttributesResponse {
  PutAccountSendingAttributesResponse();

  factory PutAccountSendingAttributesResponse.fromJson(Map<String, dynamic> _) {
    return PutAccountSendingAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutAccountSuppressionAttributesResponse {
  PutAccountSuppressionAttributesResponse();

  factory PutAccountSuppressionAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutAccountSuppressionAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutAccountVdmAttributesResponse {
  PutAccountVdmAttributesResponse();

  factory PutAccountVdmAttributesResponse.fromJson(Map<String, dynamic> _) {
    return PutAccountVdmAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetDeliveryOptionsResponse {
  PutConfigurationSetDeliveryOptionsResponse();

  factory PutConfigurationSetDeliveryOptionsResponse.fromJson(
      Map<String, dynamic> _) {
    return PutConfigurationSetDeliveryOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetReputationOptionsResponse {
  PutConfigurationSetReputationOptionsResponse();

  factory PutConfigurationSetReputationOptionsResponse.fromJson(
      Map<String, dynamic> _) {
    return PutConfigurationSetReputationOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetSendingOptionsResponse {
  PutConfigurationSetSendingOptionsResponse();

  factory PutConfigurationSetSendingOptionsResponse.fromJson(
      Map<String, dynamic> _) {
    return PutConfigurationSetSendingOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetSuppressionOptionsResponse {
  PutConfigurationSetSuppressionOptionsResponse();

  factory PutConfigurationSetSuppressionOptionsResponse.fromJson(
      Map<String, dynamic> _) {
    return PutConfigurationSetSuppressionOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetTrackingOptionsResponse {
  PutConfigurationSetTrackingOptionsResponse();

  factory PutConfigurationSetTrackingOptionsResponse.fromJson(
      Map<String, dynamic> _) {
    return PutConfigurationSetTrackingOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetVdmOptionsResponse {
  PutConfigurationSetVdmOptionsResponse();

  factory PutConfigurationSetVdmOptionsResponse.fromJson(
      Map<String, dynamic> _) {
    return PutConfigurationSetVdmOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutDedicatedIpInPoolResponse {
  PutDedicatedIpInPoolResponse();

  factory PutDedicatedIpInPoolResponse.fromJson(Map<String, dynamic> _) {
    return PutDedicatedIpInPoolResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutDedicatedIpPoolScalingAttributesResponse {
  PutDedicatedIpPoolScalingAttributesResponse();

  factory PutDedicatedIpPoolScalingAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutDedicatedIpPoolScalingAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutDedicatedIpWarmupAttributesResponse {
  PutDedicatedIpWarmupAttributesResponse();

  factory PutDedicatedIpWarmupAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutDedicatedIpWarmupAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A response that indicates whether the Deliverability dashboard is enabled.
class PutDeliverabilityDashboardOptionResponse {
  PutDeliverabilityDashboardOptionResponse();

  factory PutDeliverabilityDashboardOptionResponse.fromJson(
      Map<String, dynamic> _) {
    return PutDeliverabilityDashboardOptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class PutEmailIdentityConfigurationSetAttributesResponse {
  PutEmailIdentityConfigurationSetAttributesResponse();

  factory PutEmailIdentityConfigurationSetAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutEmailIdentityConfigurationSetAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutEmailIdentityDkimAttributesResponse {
  PutEmailIdentityDkimAttributesResponse();

  factory PutEmailIdentityDkimAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutEmailIdentityDkimAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response.
///
/// The following data is returned in JSON format by the service.
class PutEmailIdentityDkimSigningAttributesResponse {
  /// The DKIM authentication status of the identity. Amazon SES determines the
  /// authentication status by searching for specific records in the DNS
  /// configuration for your domain. If you used <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a> to set up DKIM authentication, Amazon SES tries to find three
  /// unique CNAME records in the DNS configuration for your domain.
  ///
  /// If you provided a public key to perform DKIM authentication, Amazon SES
  /// tries to find a TXT record that uses the selector that you specified. The
  /// value of the TXT record must be a public key that's paired with the private
  /// key that you specified in the process of creating the identity.
  ///
  /// The status can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – The verification process was initiated, but Amazon
  /// SES hasn't yet detected the DKIM records in the DNS configuration for the
  /// domain.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – The verification process completed successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – The verification process failed. This typically occurs
  /// when Amazon SES fails to find the DKIM records in the DNS configuration of
  /// the domain.
  /// </li>
  /// <li>
  /// <code>TEMPORARY_FAILURE</code> – A temporary issue is preventing Amazon SES
  /// from determining the DKIM authentication status of the domain.
  /// </li>
  /// <li>
  /// <code>NOT_STARTED</code> – The DKIM verification process hasn't been
  /// initiated for the domain.
  /// </li>
  /// </ul>
  final DkimStatus? dkimStatus;

  /// If you used <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a> to configure DKIM authentication for the domain, then this object
  /// contains a set of unique strings that you use to create a set of CNAME
  /// records that you add to the DNS configuration for your domain. When Amazon
  /// SES detects these records in the DNS configuration for your domain, the DKIM
  /// authentication process is complete.
  ///
  /// If you configured DKIM authentication for the domain by providing your own
  /// public-private key pair, then this object contains the selector that's
  /// associated with your public key.
  ///
  /// Regardless of the DKIM authentication method you use, Amazon SES searches
  /// for the appropriate records in the DNS configuration of the domain for up to
  /// 72 hours.
  final List<String>? dkimTokens;

  PutEmailIdentityDkimSigningAttributesResponse({
    this.dkimStatus,
    this.dkimTokens,
  });

  factory PutEmailIdentityDkimSigningAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return PutEmailIdentityDkimSigningAttributesResponse(
      dkimStatus: (json['DkimStatus'] as String?)?.toDkimStatus(),
      dkimTokens: (json['DkimTokens'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dkimStatus = this.dkimStatus;
    final dkimTokens = this.dkimTokens;
    return {
      if (dkimStatus != null) 'DkimStatus': dkimStatus.toValue(),
      if (dkimTokens != null) 'DkimTokens': dkimTokens,
    };
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutEmailIdentityFeedbackAttributesResponse {
  PutEmailIdentityFeedbackAttributesResponse();

  factory PutEmailIdentityFeedbackAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutEmailIdentityFeedbackAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutEmailIdentityMailFromAttributesResponse {
  PutEmailIdentityMailFromAttributesResponse();

  factory PutEmailIdentityMailFromAttributesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutEmailIdentityMailFromAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutSuppressedDestinationResponse {
  PutSuppressedDestinationResponse();

  factory PutSuppressedDestinationResponse.fromJson(Map<String, dynamic> _) {
    return PutSuppressedDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum QueryErrorCode {
  internalFailure,
  accessDenied,
}

extension QueryErrorCodeValueExtension on QueryErrorCode {
  String toValue() {
    switch (this) {
      case QueryErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
      case QueryErrorCode.accessDenied:
        return 'ACCESS_DENIED';
    }
  }
}

extension QueryErrorCodeFromString on String {
  QueryErrorCode toQueryErrorCode() {
    switch (this) {
      case 'INTERNAL_FAILURE':
        return QueryErrorCode.internalFailure;
      case 'ACCESS_DENIED':
        return QueryErrorCode.accessDenied;
    }
    throw Exception('$this is not known in enum QueryErrorCode');
  }
}

/// Represents the raw content of an email message.
class RawMessage {
  /// The raw email message. The message has to meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// The message has to contain a header and a body, separated by one blank line.
  /// </li>
  /// <li>
  /// All of the required header fields must be present in the message.
  /// </li>
  /// <li>
  /// Each part of a multipart MIME message must be formatted properly.
  /// </li>
  /// <li>
  /// Attachments must be in a file format that the Amazon SES supports.
  /// </li>
  /// <li>
  /// The raw data of the message needs to base64-encoded if you are accessing
  /// Amazon SES directly through the HTTPS interface. If you are accessing Amazon
  /// SES using an Amazon Web Services SDK, the SDK takes care of the base
  /// 64-encoding for you.
  /// </li>
  /// <li>
  /// If any of the MIME parts in your message contain content that is outside of
  /// the 7-bit ASCII character range, you should encode that content to ensure
  /// that recipients' email clients render the message properly.
  /// </li>
  /// <li>
  /// The length of any single line of text in the message can't exceed 1,000
  /// characters. This restriction is defined in <a
  /// href="https://tools.ietf.org/html/rfc5321">RFC 5321</a>.
  /// </li>
  /// </ul>
  final Uint8List data;

  RawMessage({
    required this.data,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      'Data': base64Encode(data),
    };
  }
}

/// A recommendation generated for your account.
class Recommendation {
  /// The first time this issue was encountered and the recommendation was
  /// generated.
  final DateTime? createdTimestamp;

  /// The recommendation description / disambiguator - e.g. <code>DKIM1</code> and
  /// <code>DKIM2</code> are different recommendations about your DKIM setup.
  final String? description;

  /// The recommendation impact, with values like <code>HIGH</code> or
  /// <code>LOW</code>.
  final RecommendationImpact? impact;

  /// The last time the recommendation was updated.
  final DateTime? lastUpdatedTimestamp;

  /// The resource affected by the recommendation, with values like
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  final String? resourceArn;

  /// The recommendation status, with values like <code>OPEN</code> or
  /// <code>FIXED</code>.
  final RecommendationStatus? status;

  /// The recommendation type, with values like <code>DKIM</code>,
  /// <code>SPF</code>, <code>DMARC</code> or <code>BIMI</code>.
  final RecommendationType? type;

  Recommendation({
    this.createdTimestamp,
    this.description,
    this.impact,
    this.lastUpdatedTimestamp,
    this.resourceArn,
    this.status,
    this.type,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      description: json['Description'] as String?,
      impact: (json['Impact'] as String?)?.toRecommendationImpact(),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      resourceArn: json['ResourceArn'] as String?,
      status: (json['Status'] as String?)?.toRecommendationStatus(),
      type: (json['Type'] as String?)?.toRecommendationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final impact = this.impact;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final resourceArn = this.resourceArn;
    final status = this.status;
    final type = this.type;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (description != null) 'Description': description,
      if (impact != null) 'Impact': impact.toValue(),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RecommendationImpact {
  low,
  high,
}

extension RecommendationImpactValueExtension on RecommendationImpact {
  String toValue() {
    switch (this) {
      case RecommendationImpact.low:
        return 'LOW';
      case RecommendationImpact.high:
        return 'HIGH';
    }
  }
}

extension RecommendationImpactFromString on String {
  RecommendationImpact toRecommendationImpact() {
    switch (this) {
      case 'LOW':
        return RecommendationImpact.low;
      case 'HIGH':
        return RecommendationImpact.high;
    }
    throw Exception('$this is not known in enum RecommendationImpact');
  }
}

enum RecommendationStatus {
  open,
  fixed,
}

extension RecommendationStatusValueExtension on RecommendationStatus {
  String toValue() {
    switch (this) {
      case RecommendationStatus.open:
        return 'OPEN';
      case RecommendationStatus.fixed:
        return 'FIXED';
    }
  }
}

extension RecommendationStatusFromString on String {
  RecommendationStatus toRecommendationStatus() {
    switch (this) {
      case 'OPEN':
        return RecommendationStatus.open;
      case 'FIXED':
        return RecommendationStatus.fixed;
    }
    throw Exception('$this is not known in enum RecommendationStatus');
  }
}

enum RecommendationType {
  dkim,
  dmarc,
  spf,
  bimi,
}

extension RecommendationTypeValueExtension on RecommendationType {
  String toValue() {
    switch (this) {
      case RecommendationType.dkim:
        return 'DKIM';
      case RecommendationType.dmarc:
        return 'DMARC';
      case RecommendationType.spf:
        return 'SPF';
      case RecommendationType.bimi:
        return 'BIMI';
    }
  }
}

extension RecommendationTypeFromString on String {
  RecommendationType toRecommendationType() {
    switch (this) {
      case 'DKIM':
        return RecommendationType.dkim;
      case 'DMARC':
        return RecommendationType.dmarc;
      case 'SPF':
        return RecommendationType.spf;
      case 'BIMI':
        return RecommendationType.bimi;
    }
    throw Exception('$this is not known in enum RecommendationType');
  }
}

/// The <code>ReplaceEmailContent</code> object to be used for a specific
/// <code>BulkEmailEntry</code>. The <code>ReplacementTemplate</code> can be
/// specified within this object.
class ReplacementEmailContent {
  /// The <code>ReplacementTemplate</code> associated with
  /// <code>ReplacementEmailContent</code>.
  final ReplacementTemplate? replacementTemplate;

  ReplacementEmailContent({
    this.replacementTemplate,
  });

  Map<String, dynamic> toJson() {
    final replacementTemplate = this.replacementTemplate;
    return {
      if (replacementTemplate != null)
        'ReplacementTemplate': replacementTemplate,
    };
  }
}

/// An object which contains <code>ReplacementTemplateData</code> to be used for
/// a specific <code>BulkEmailEntry</code>.
class ReplacementTemplate {
  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  final String? replacementTemplateData;

  ReplacementTemplate({
    this.replacementTemplateData,
  });

  Map<String, dynamic> toJson() {
    final replacementTemplateData = this.replacementTemplateData;
    return {
      if (replacementTemplateData != null)
        'ReplacementTemplateData': replacementTemplateData,
    };
  }
}

/// Enable or disable collection of reputation metrics for emails that you send
/// using this configuration set in the current Amazon Web Services Region.
class ReputationOptions {
  /// The date and time (in Unix time) when the reputation metrics were last given
  /// a fresh start. When your account is given a fresh start, your reputation
  /// metrics are calculated starting from the date of the fresh start.
  final DateTime? lastFreshStart;

  /// If <code>true</code>, tracking of reputation metrics is enabled for the
  /// configuration set. If <code>false</code>, tracking of reputation metrics is
  /// disabled for the configuration set.
  final bool? reputationMetricsEnabled;

  ReputationOptions({
    this.lastFreshStart,
    this.reputationMetricsEnabled,
  });

  factory ReputationOptions.fromJson(Map<String, dynamic> json) {
    return ReputationOptions(
      lastFreshStart: timeStampFromJson(json['LastFreshStart']),
      reputationMetricsEnabled: json['ReputationMetricsEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastFreshStart = this.lastFreshStart;
    final reputationMetricsEnabled = this.reputationMetricsEnabled;
    return {
      if (lastFreshStart != null)
        'LastFreshStart': unixTimestampToJson(lastFreshStart),
      if (reputationMetricsEnabled != null)
        'ReputationMetricsEnabled': reputationMetricsEnabled,
    };
  }
}

/// An object that contains information about your account details review.
class ReviewDetails {
  /// The associated support center case ID (if any).
  final String? caseId;

  /// The status of the latest review of your account. The status can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – We have received your appeal and are in the process
  /// of reviewing it.
  /// </li>
  /// <li>
  /// <code>GRANTED</code> – Your appeal has been reviewed and your production
  /// access has been granted.
  /// </li>
  /// <li>
  /// <code>DENIED</code> – Your appeal has been reviewed and your production
  /// access has been denied.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – An internal error occurred and we didn't receive your
  /// appeal. You can submit your appeal again.
  /// </li>
  /// </ul>
  final ReviewStatus? status;

  ReviewDetails({
    this.caseId,
    this.status,
  });

  factory ReviewDetails.fromJson(Map<String, dynamic> json) {
    return ReviewDetails(
      caseId: json['CaseId'] as String?,
      status: (json['Status'] as String?)?.toReviewStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    final status = this.status;
    return {
      if (caseId != null) 'CaseId': caseId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ReviewStatus {
  pending,
  failed,
  granted,
  denied,
}

extension ReviewStatusValueExtension on ReviewStatus {
  String toValue() {
    switch (this) {
      case ReviewStatus.pending:
        return 'PENDING';
      case ReviewStatus.failed:
        return 'FAILED';
      case ReviewStatus.granted:
        return 'GRANTED';
      case ReviewStatus.denied:
        return 'DENIED';
    }
  }
}

extension ReviewStatusFromString on String {
  ReviewStatus toReviewStatus() {
    switch (this) {
      case 'PENDING':
        return ReviewStatus.pending;
      case 'FAILED':
        return ReviewStatus.failed;
      case 'GRANTED':
        return ReviewStatus.granted;
      case 'DENIED':
        return ReviewStatus.denied;
    }
    throw Exception('$this is not known in enum ReviewStatus');
  }
}

/// An object that contains information about the start of authority (SOA)
/// record associated with the identity.
class SOARecord {
  /// Administrative contact email from the SOA record.
  final String? adminEmail;

  /// Primary name server specified in the SOA record.
  final String? primaryNameServer;

  /// Serial number from the SOA record.
  final int? serialNumber;

  SOARecord({
    this.adminEmail,
    this.primaryNameServer,
    this.serialNumber,
  });

  factory SOARecord.fromJson(Map<String, dynamic> json) {
    return SOARecord(
      adminEmail: json['AdminEmail'] as String?,
      primaryNameServer: json['PrimaryNameServer'] as String?,
      serialNumber: json['SerialNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminEmail = this.adminEmail;
    final primaryNameServer = this.primaryNameServer;
    final serialNumber = this.serialNumber;
    return {
      if (adminEmail != null) 'AdminEmail': adminEmail,
      if (primaryNameServer != null) 'PrimaryNameServer': primaryNameServer,
      if (serialNumber != null) 'SerialNumber': serialNumber,
    };
  }
}

enum ScalingMode {
  standard,
  managed,
}

extension ScalingModeValueExtension on ScalingMode {
  String toValue() {
    switch (this) {
      case ScalingMode.standard:
        return 'STANDARD';
      case ScalingMode.managed:
        return 'MANAGED';
    }
  }
}

extension ScalingModeFromString on String {
  ScalingMode toScalingMode() {
    switch (this) {
      case 'STANDARD':
        return ScalingMode.standard;
      case 'MANAGED':
        return ScalingMode.managed;
    }
    throw Exception('$this is not known in enum ScalingMode');
  }
}

/// The following data is returned in JSON format by the service.
class SendBulkEmailResponse {
  /// One object per intended recipient. Check each response object and retry any
  /// messages with a failure status.
  final List<BulkEmailEntryResult> bulkEmailEntryResults;

  SendBulkEmailResponse({
    required this.bulkEmailEntryResults,
  });

  factory SendBulkEmailResponse.fromJson(Map<String, dynamic> json) {
    return SendBulkEmailResponse(
      bulkEmailEntryResults: (json['BulkEmailEntryResults'] as List)
          .whereNotNull()
          .map((e) => BulkEmailEntryResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bulkEmailEntryResults = this.bulkEmailEntryResults;
    return {
      'BulkEmailEntryResults': bulkEmailEntryResults,
    };
  }
}

/// The following element is returned by the service.
class SendCustomVerificationEmailResponse {
  /// The unique message identifier returned from the
  /// <code>SendCustomVerificationEmail</code> operation.
  final String? messageId;

  SendCustomVerificationEmailResponse({
    this.messageId,
  });

  factory SendCustomVerificationEmailResponse.fromJson(
      Map<String, dynamic> json) {
    return SendCustomVerificationEmailResponse(
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

/// A unique message ID that you receive when an email is accepted for sending.
class SendEmailResponse {
  /// A unique identifier for the message that is generated when the message is
  /// accepted.
  /// <note>
  /// It's possible for Amazon SES to accept a message without sending it. For
  /// example, this can happen when the message that you're trying to send has an
  /// attachment that contains a virus, or when you send a templated email that
  /// contains invalid personalization content.
  /// </note>
  final String? messageId;

  SendEmailResponse({
    this.messageId,
  });

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) {
    return SendEmailResponse(
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

/// An object that contains information about the per-day and per-second sending
/// limits for your Amazon SES account in the current Amazon Web Services
/// Region.
class SendQuota {
  /// The maximum number of emails that you can send in the current Amazon Web
  /// Services Region over a 24-hour period. A value of -1 signifies an unlimited
  /// quota. (This value is also referred to as your <i>sending quota</i>.)
  final double? max24HourSend;

  /// The maximum number of emails that you can send per second in the current
  /// Amazon Web Services Region. This value is also called your <i>maximum
  /// sending rate</i> or your <i>maximum TPS (transactions per second) rate</i>.
  final double? maxSendRate;

  /// The number of emails sent from your Amazon SES account in the current Amazon
  /// Web Services Region over the past 24 hours.
  final double? sentLast24Hours;

  SendQuota({
    this.max24HourSend,
    this.maxSendRate,
    this.sentLast24Hours,
  });

  factory SendQuota.fromJson(Map<String, dynamic> json) {
    return SendQuota(
      max24HourSend: json['Max24HourSend'] as double?,
      maxSendRate: json['MaxSendRate'] as double?,
      sentLast24Hours: json['SentLast24Hours'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final max24HourSend = this.max24HourSend;
    final maxSendRate = this.maxSendRate;
    final sentLast24Hours = this.sentLast24Hours;
    return {
      if (max24HourSend != null) 'Max24HourSend': max24HourSend,
      if (maxSendRate != null) 'MaxSendRate': maxSendRate,
      if (sentLast24Hours != null) 'SentLast24Hours': sentLast24Hours,
    };
  }
}

/// Used to enable or disable email sending for messages that use this
/// configuration set in the current Amazon Web Services Region.
class SendingOptions {
  /// If <code>true</code>, email sending is enabled for the configuration set. If
  /// <code>false</code>, email sending is disabled for the configuration set.
  final bool? sendingEnabled;

  SendingOptions({
    this.sendingEnabled,
  });

  factory SendingOptions.fromJson(Map<String, dynamic> json) {
    return SendingOptions(
      sendingEnabled: json['SendingEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final sendingEnabled = this.sendingEnabled;
    return {
      if (sendingEnabled != null) 'SendingEnabled': sendingEnabled,
    };
  }
}

/// An object that defines an Amazon SNS destination for email events. You can
/// use Amazon SNS to send notification when certain email events occur.
class SnsDestination {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to publish email
  /// events to. For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String topicArn;

  SnsDestination({
    required this.topicArn,
  });

  factory SnsDestination.fromJson(Map<String, dynamic> json) {
    return SnsDestination(
      topicArn: json['TopicArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      'TopicArn': topicArn,
    };
  }
}

enum SubscriptionStatus {
  optIn,
  optOut,
}

extension SubscriptionStatusValueExtension on SubscriptionStatus {
  String toValue() {
    switch (this) {
      case SubscriptionStatus.optIn:
        return 'OPT_IN';
      case SubscriptionStatus.optOut:
        return 'OPT_OUT';
    }
  }
}

extension SubscriptionStatusFromString on String {
  SubscriptionStatus toSubscriptionStatus() {
    switch (this) {
      case 'OPT_IN':
        return SubscriptionStatus.optIn;
      case 'OPT_OUT':
        return SubscriptionStatus.optOut;
    }
    throw Exception('$this is not known in enum SubscriptionStatus');
  }
}

/// An object that contains information about an email address that is on the
/// suppression list for your account.
class SuppressedDestination {
  /// The email address that is on the suppression list for your account.
  final String emailAddress;

  /// The date and time when the suppressed destination was last updated, shown in
  /// Unix time format.
  final DateTime lastUpdateTime;

  /// The reason that the address was added to the suppression list for your
  /// account.
  final SuppressionListReason reason;

  /// An optional value that can contain additional information about the reasons
  /// that the address was added to the suppression list for your account.
  final SuppressedDestinationAttributes? attributes;

  SuppressedDestination({
    required this.emailAddress,
    required this.lastUpdateTime,
    required this.reason,
    this.attributes,
  });

  factory SuppressedDestination.fromJson(Map<String, dynamic> json) {
    return SuppressedDestination(
      emailAddress: json['EmailAddress'] as String,
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['LastUpdateTime'] as Object),
      reason: (json['Reason'] as String).toSuppressionListReason(),
      attributes: json['Attributes'] != null
          ? SuppressedDestinationAttributes.fromJson(
              json['Attributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final lastUpdateTime = this.lastUpdateTime;
    final reason = this.reason;
    final attributes = this.attributes;
    return {
      'EmailAddress': emailAddress,
      'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'Reason': reason.toValue(),
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// An object that contains additional attributes that are related an email
/// address that is on the suppression list for your account.
class SuppressedDestinationAttributes {
  /// A unique identifier that's generated when an email address is added to the
  /// suppression list for your account.
  final String? feedbackId;

  /// The unique identifier of the email message that caused the email address to
  /// be added to the suppression list for your account.
  final String? messageId;

  SuppressedDestinationAttributes({
    this.feedbackId,
    this.messageId,
  });

  factory SuppressedDestinationAttributes.fromJson(Map<String, dynamic> json) {
    return SuppressedDestinationAttributes(
      feedbackId: json['FeedbackId'] as String?,
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final feedbackId = this.feedbackId;
    final messageId = this.messageId;
    return {
      if (feedbackId != null) 'FeedbackId': feedbackId,
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

/// A summary that describes the suppressed email address.
class SuppressedDestinationSummary {
  /// The email address that's on the suppression list for your account.
  final String emailAddress;

  /// The date and time when the suppressed destination was last updated, shown in
  /// Unix time format.
  final DateTime lastUpdateTime;

  /// The reason that the address was added to the suppression list for your
  /// account.
  final SuppressionListReason reason;

  SuppressedDestinationSummary({
    required this.emailAddress,
    required this.lastUpdateTime,
    required this.reason,
  });

  factory SuppressedDestinationSummary.fromJson(Map<String, dynamic> json) {
    return SuppressedDestinationSummary(
      emailAddress: json['EmailAddress'] as String,
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['LastUpdateTime'] as Object),
      reason: (json['Reason'] as String).toSuppressionListReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final lastUpdateTime = this.lastUpdateTime;
    final reason = this.reason;
    return {
      'EmailAddress': emailAddress,
      'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'Reason': reason.toValue(),
    };
  }
}

/// An object that contains information about the email address suppression
/// preferences for your account in the current Amazon Web Services Region.
class SuppressionAttributes {
  /// A list that contains the reasons that email addresses will be automatically
  /// added to the suppression list for your account. This list can contain any or
  /// all of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLAINT</code> – Amazon SES adds an email address to the suppression
  /// list for your account when a message sent to that address results in a
  /// complaint.
  /// </li>
  /// <li>
  /// <code>BOUNCE</code> – Amazon SES adds an email address to the suppression
  /// list for your account when a message sent to that address results in a hard
  /// bounce.
  /// </li>
  /// </ul>
  final List<SuppressionListReason>? suppressedReasons;

  SuppressionAttributes({
    this.suppressedReasons,
  });

  factory SuppressionAttributes.fromJson(Map<String, dynamic> json) {
    return SuppressionAttributes(
      suppressedReasons: (json['SuppressedReasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSuppressionListReason())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final suppressedReasons = this.suppressedReasons;
    return {
      if (suppressedReasons != null)
        'SuppressedReasons': suppressedReasons.map((e) => e.toValue()).toList(),
    };
  }
}

/// An object that contains details about the action of suppression list.
class SuppressionListDestination {
  /// The type of action to perform on the address. The following are possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// PUT: add the addresses to the suppression list. If the record already
  /// exists, it will override it with the new value.
  /// </li>
  /// <li>
  /// DELETE: remove the addresses from the suppression list.
  /// </li>
  /// </ul>
  final SuppressionListImportAction suppressionListImportAction;

  SuppressionListDestination({
    required this.suppressionListImportAction,
  });

  factory SuppressionListDestination.fromJson(Map<String, dynamic> json) {
    return SuppressionListDestination(
      suppressionListImportAction:
          (json['SuppressionListImportAction'] as String)
              .toSuppressionListImportAction(),
    );
  }

  Map<String, dynamic> toJson() {
    final suppressionListImportAction = this.suppressionListImportAction;
    return {
      'SuppressionListImportAction': suppressionListImportAction.toValue(),
    };
  }
}

/// The type of action to perform on the address. The following are possible
/// values:
///
/// <ul>
/// <li>
/// PUT: add the addresses to the suppression list.
/// </li>
/// <li>
/// DELETE: remove the address from the suppression list.
/// </li>
/// </ul>
enum SuppressionListImportAction {
  delete,
  put,
}

extension SuppressionListImportActionValueExtension
    on SuppressionListImportAction {
  String toValue() {
    switch (this) {
      case SuppressionListImportAction.delete:
        return 'DELETE';
      case SuppressionListImportAction.put:
        return 'PUT';
    }
  }
}

extension SuppressionListImportActionFromString on String {
  SuppressionListImportAction toSuppressionListImportAction() {
    switch (this) {
      case 'DELETE':
        return SuppressionListImportAction.delete;
      case 'PUT':
        return SuppressionListImportAction.put;
    }
    throw Exception('$this is not known in enum SuppressionListImportAction');
  }
}

/// The reason that the address was added to the suppression list for your
/// account. The value can be one of the following:
///
/// <ul>
/// <li>
/// <code>COMPLAINT</code> – Amazon SES added an email address to the
/// suppression list for your account because a message sent to that address
/// results in a complaint.
/// </li>
/// <li>
/// <code>BOUNCE</code> – Amazon SES added an email address to the suppression
/// list for your account because a message sent to that address results in a
/// hard bounce.
/// </li>
/// </ul>
enum SuppressionListReason {
  bounce,
  complaint,
}

extension SuppressionListReasonValueExtension on SuppressionListReason {
  String toValue() {
    switch (this) {
      case SuppressionListReason.bounce:
        return 'BOUNCE';
      case SuppressionListReason.complaint:
        return 'COMPLAINT';
    }
  }
}

extension SuppressionListReasonFromString on String {
  SuppressionListReason toSuppressionListReason() {
    switch (this) {
      case 'BOUNCE':
        return SuppressionListReason.bounce;
      case 'COMPLAINT':
        return SuppressionListReason.complaint;
    }
    throw Exception('$this is not known in enum SuppressionListReason');
  }
}

/// An object that contains information about the suppression list preferences
/// for your account.
class SuppressionOptions {
  /// A list that contains the reasons that email addresses are automatically
  /// added to the suppression list for your account. This list can contain any or
  /// all of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLAINT</code> – Amazon SES adds an email address to the suppression
  /// list for your account when a message sent to that address results in a
  /// complaint.
  /// </li>
  /// <li>
  /// <code>BOUNCE</code> – Amazon SES adds an email address to the suppression
  /// list for your account when a message sent to that address results in a hard
  /// bounce.
  /// </li>
  /// </ul>
  final List<SuppressionListReason>? suppressedReasons;

  SuppressionOptions({
    this.suppressedReasons,
  });

  factory SuppressionOptions.fromJson(Map<String, dynamic> json) {
    return SuppressionOptions(
      suppressedReasons: (json['SuppressedReasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSuppressionListReason())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final suppressedReasons = this.suppressedReasons;
    return {
      if (suppressedReasons != null)
        'SuppressedReasons': suppressedReasons.map((e) => e.toValue()).toList(),
    };
  }
}

/// An object that defines the tags that are associated with a resource.
/// A <i>tag</i> is a label that you optionally define and associate with a
/// resource. Tags can help you categorize and manage resources in different
/// ways, such as by purpose, owner, environment, or other criteria. A resource
/// can have as many as 50 tags.
///
/// Each tag consists of a required <i>tag key</i> and an associated <i>tag
/// value</i>, both of which you define. A tag key is a general label that acts
/// as a category for a more specific tag value. A tag value acts as a
/// descriptor within a tag key. A tag key can contain as many as 128
/// characters. A tag value can contain as many as 256 characters. The
/// characters can be Unicode letters, digits, white space, or one of the
/// following symbols: _ . : / = + -. The following additional restrictions
/// apply to tags:
///
/// <ul>
/// <li>
/// Tag keys and values are case sensitive.
/// </li>
/// <li>
/// For each associated resource, each tag key must be unique and it can have
/// only one value.
/// </li>
/// <li>
/// The <code>aws:</code> prefix is reserved for use by Amazon Web Services; you
/// can’t use it in any tag keys or values that you define. In addition, you
/// can't edit or remove tag keys or values that use this prefix. Tags that use
/// this prefix don’t count against the limit of 50 tags per resource.
/// </li>
/// <li>
/// You can associate tags with public or shared resources, but the tags are
/// available only for your Amazon Web Services account, not any other accounts
/// that share the resource. In addition, the tags are available only for
/// resources that are located in the specified Amazon Web Services Region for
/// your Amazon Web Services account.
/// </li>
/// </ul>
class Tag {
  /// One part of a key-value pair that defines a tag. The maximum length of a tag
  /// key is 128 characters. The minimum length is 1 character.
  final String key;

  /// The optional part of a key-value pair that defines a tag. The maximum length
  /// of a tag value is 256 characters. The minimum length is 0 characters. If you
  /// don't want a resource to have a specific tag value, don't specify a value
  /// for this parameter. If you don't specify a value, Amazon SES sets the value
  /// to an empty string.
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that defines the email template to use for an email message, and
/// the values to use for any message variables in that template. An <i>email
/// template</i> is a type of message template that contains content that you
/// want to define, save, and reuse in email messages that you send.
class Template {
  /// The list of message headers that will be added to the email message.
  final List<MessageHeader>? headers;

  /// The Amazon Resource Name (ARN) of the template.
  final String? templateArn;

  /// An object that defines the values to use for message variables in the
  /// template. This object is a set of key-value pairs. Each key defines a
  /// message variable in the template. The corresponding value defines the value
  /// to use for that variable.
  final String? templateData;

  /// The name of the template. You will refer to this name when you send email
  /// using the <code>SendTemplatedEmail</code> or
  /// <code>SendBulkTemplatedEmail</code> operations.
  final String? templateName;

  Template({
    this.headers,
    this.templateArn,
    this.templateData,
    this.templateName,
  });

  Map<String, dynamic> toJson() {
    final headers = this.headers;
    final templateArn = this.templateArn;
    final templateData = this.templateData;
    final templateName = this.templateName;
    return {
      if (headers != null) 'Headers': headers,
      if (templateArn != null) 'TemplateArn': templateArn,
      if (templateData != null) 'TemplateData': templateData,
      if (templateName != null) 'TemplateName': templateName,
    };
  }
}

/// The following element is returned by the service.
class TestRenderEmailTemplateResponse {
  /// The complete MIME message rendered by applying the data in the
  /// <code>TemplateData</code> parameter to the template specified in the
  /// TemplateName parameter.
  final String renderedTemplate;

  TestRenderEmailTemplateResponse({
    required this.renderedTemplate,
  });

  factory TestRenderEmailTemplateResponse.fromJson(Map<String, dynamic> json) {
    return TestRenderEmailTemplateResponse(
      renderedTemplate: json['RenderedTemplate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final renderedTemplate = this.renderedTemplate;
    return {
      'RenderedTemplate': renderedTemplate,
    };
  }
}

/// Specifies whether messages that use the configuration set are required to
/// use Transport Layer Security (TLS). If the value is <code>Require</code>,
/// messages are only delivered if a TLS connection can be established. If the
/// value is <code>Optional</code>, messages can be delivered in plain text if a
/// TLS connection can't be established.
enum TlsPolicy {
  require,
  optional,
}

extension TlsPolicyValueExtension on TlsPolicy {
  String toValue() {
    switch (this) {
      case TlsPolicy.require:
        return 'REQUIRE';
      case TlsPolicy.optional:
        return 'OPTIONAL';
    }
  }
}

extension TlsPolicyFromString on String {
  TlsPolicy toTlsPolicy() {
    switch (this) {
      case 'REQUIRE':
        return TlsPolicy.require;
      case 'OPTIONAL':
        return TlsPolicy.optional;
    }
    throw Exception('$this is not known in enum TlsPolicy');
  }
}

/// An interest group, theme, or label within a list. Lists can have multiple
/// topics.
class Topic {
  /// The default subscription status to be applied to a contact if the contact
  /// has not noted their preference for subscribing to a topic.
  final SubscriptionStatus defaultSubscriptionStatus;

  /// The name of the topic the contact will see.
  final String displayName;

  /// The name of the topic.
  final String topicName;

  /// A description of what the topic is about, which the contact will see.
  final String? description;

  Topic({
    required this.defaultSubscriptionStatus,
    required this.displayName,
    required this.topicName,
    this.description,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      defaultSubscriptionStatus:
          (json['DefaultSubscriptionStatus'] as String).toSubscriptionStatus(),
      displayName: json['DisplayName'] as String,
      topicName: json['TopicName'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultSubscriptionStatus = this.defaultSubscriptionStatus;
    final displayName = this.displayName;
    final topicName = this.topicName;
    final description = this.description;
    return {
      'DefaultSubscriptionStatus': defaultSubscriptionStatus.toValue(),
      'DisplayName': displayName,
      'TopicName': topicName,
      if (description != null) 'Description': description,
    };
  }
}

/// Used for filtering by a specific topic preference.
class TopicFilter {
  /// The name of a topic on which you wish to apply the filter.
  final String? topicName;

  /// Notes that the default subscription status should be applied to a contact
  /// because the contact has not noted their preference for subscribing to a
  /// topic.
  final bool? useDefaultIfPreferenceUnavailable;

  TopicFilter({
    this.topicName,
    this.useDefaultIfPreferenceUnavailable,
  });

  Map<String, dynamic> toJson() {
    final topicName = this.topicName;
    final useDefaultIfPreferenceUnavailable =
        this.useDefaultIfPreferenceUnavailable;
    return {
      if (topicName != null) 'TopicName': topicName,
      if (useDefaultIfPreferenceUnavailable != null)
        'UseDefaultIfPreferenceUnavailable': useDefaultIfPreferenceUnavailable,
    };
  }
}

/// The contact's preference for being opted-in to or opted-out of a topic.
class TopicPreference {
  /// The contact's subscription status to a topic which is either
  /// <code>OPT_IN</code> or <code>OPT_OUT</code>.
  final SubscriptionStatus subscriptionStatus;

  /// The name of the topic.
  final String topicName;

  TopicPreference({
    required this.subscriptionStatus,
    required this.topicName,
  });

  factory TopicPreference.fromJson(Map<String, dynamic> json) {
    return TopicPreference(
      subscriptionStatus:
          (json['SubscriptionStatus'] as String).toSubscriptionStatus(),
      topicName: json['TopicName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionStatus = this.subscriptionStatus;
    final topicName = this.topicName;
    return {
      'SubscriptionStatus': subscriptionStatus.toValue(),
      'TopicName': topicName,
    };
  }
}

/// An object that defines the tracking options for a configuration set. When
/// you use the Amazon SES API v2 to send an email, it contains an invisible
/// image that's used to track when recipients open your email. If your email
/// contains links, those links are changed slightly in order to track when
/// recipients click them.
///
/// These images and links include references to a domain operated by Amazon Web
/// Services. You can optionally configure the Amazon SES to use a domain that
/// you operate for these images and links.
class TrackingOptions {
  /// The domain to use for tracking open and click events.
  final String customRedirectDomain;

  TrackingOptions({
    required this.customRedirectDomain,
  });

  factory TrackingOptions.fromJson(Map<String, dynamic> json) {
    return TrackingOptions(
      customRedirectDomain: json['CustomRedirectDomain'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final customRedirectDomain = this.customRedirectDomain;
    return {
      'CustomRedirectDomain': customRedirectDomain,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();

  factory UpdateConfigurationSetEventDestinationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateContactListResponse {
  UpdateContactListResponse();

  factory UpdateContactListResponse.fromJson(Map<String, dynamic> _) {
    return UpdateContactListResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateContactResponse {
  UpdateContactResponse();

  factory UpdateContactResponse.fromJson(Map<String, dynamic> _) {
    return UpdateContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class UpdateCustomVerificationEmailTemplateResponse {
  UpdateCustomVerificationEmailTemplateResponse();

  factory UpdateCustomVerificationEmailTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateCustomVerificationEmailTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class UpdateEmailIdentityPolicyResponse {
  UpdateEmailIdentityPolicyResponse();

  factory UpdateEmailIdentityPolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEmailIdentityPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class UpdateEmailTemplateResponse {
  UpdateEmailTemplateResponse();

  factory UpdateEmailTemplateResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEmailTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The VDM attributes that apply to your Amazon SES account.
class VdmAttributes {
  /// Specifies the status of your VDM configuration. Can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – Amazon SES enables VDM for your account.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – Amazon SES disables VDM for your account.
  /// </li>
  /// </ul>
  final FeatureStatus vdmEnabled;

  /// Specifies additional settings for your VDM configuration as applicable to
  /// the Dashboard.
  final DashboardAttributes? dashboardAttributes;

  /// Specifies additional settings for your VDM configuration as applicable to
  /// the Guardian.
  final GuardianAttributes? guardianAttributes;

  VdmAttributes({
    required this.vdmEnabled,
    this.dashboardAttributes,
    this.guardianAttributes,
  });

  factory VdmAttributes.fromJson(Map<String, dynamic> json) {
    return VdmAttributes(
      vdmEnabled: (json['VdmEnabled'] as String).toFeatureStatus(),
      dashboardAttributes: json['DashboardAttributes'] != null
          ? DashboardAttributes.fromJson(
              json['DashboardAttributes'] as Map<String, dynamic>)
          : null,
      guardianAttributes: json['GuardianAttributes'] != null
          ? GuardianAttributes.fromJson(
              json['GuardianAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vdmEnabled = this.vdmEnabled;
    final dashboardAttributes = this.dashboardAttributes;
    final guardianAttributes = this.guardianAttributes;
    return {
      'VdmEnabled': vdmEnabled.toValue(),
      if (dashboardAttributes != null)
        'DashboardAttributes': dashboardAttributes,
      if (guardianAttributes != null) 'GuardianAttributes': guardianAttributes,
    };
  }
}

/// An object that defines the VDM settings that apply to emails that you send
/// using the configuration set.
class VdmOptions {
  /// Specifies additional settings for your VDM configuration as applicable to
  /// the Dashboard.
  final DashboardOptions? dashboardOptions;

  /// Specifies additional settings for your VDM configuration as applicable to
  /// the Guardian.
  final GuardianOptions? guardianOptions;

  VdmOptions({
    this.dashboardOptions,
    this.guardianOptions,
  });

  factory VdmOptions.fromJson(Map<String, dynamic> json) {
    return VdmOptions(
      dashboardOptions: json['DashboardOptions'] != null
          ? DashboardOptions.fromJson(
              json['DashboardOptions'] as Map<String, dynamic>)
          : null,
      guardianOptions: json['GuardianOptions'] != null
          ? GuardianOptions.fromJson(
              json['GuardianOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardOptions = this.dashboardOptions;
    final guardianOptions = this.guardianOptions;
    return {
      if (dashboardOptions != null) 'DashboardOptions': dashboardOptions,
      if (guardianOptions != null) 'GuardianOptions': guardianOptions,
    };
  }
}

enum VerificationError {
  serviceError,
  dnsServerError,
  hostNotFound,
  typeNotFound,
  invalidValue,
}

extension VerificationErrorValueExtension on VerificationError {
  String toValue() {
    switch (this) {
      case VerificationError.serviceError:
        return 'SERVICE_ERROR';
      case VerificationError.dnsServerError:
        return 'DNS_SERVER_ERROR';
      case VerificationError.hostNotFound:
        return 'HOST_NOT_FOUND';
      case VerificationError.typeNotFound:
        return 'TYPE_NOT_FOUND';
      case VerificationError.invalidValue:
        return 'INVALID_VALUE';
    }
  }
}

extension VerificationErrorFromString on String {
  VerificationError toVerificationError() {
    switch (this) {
      case 'SERVICE_ERROR':
        return VerificationError.serviceError;
      case 'DNS_SERVER_ERROR':
        return VerificationError.dnsServerError;
      case 'HOST_NOT_FOUND':
        return VerificationError.hostNotFound;
      case 'TYPE_NOT_FOUND':
        return VerificationError.typeNotFound;
      case 'INVALID_VALUE':
        return VerificationError.invalidValue;
    }
    throw Exception('$this is not known in enum VerificationError');
  }
}

/// An object that contains additional information about the verification status
/// for the identity.
class VerificationInfo {
  /// Provides the reason for the failure describing why Amazon SES was not able
  /// to successfully verify the identity. Below are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>INVALID_VALUE</code> – Amazon SES was able to find the record, but the
  /// value contained within the record was invalid. Ensure you have published the
  /// correct values for the record.
  /// </li>
  /// <li>
  /// <code>TYPE_NOT_FOUND</code> – The queried hostname exists but does not have
  /// the requested type of DNS record. Ensure that you have published the correct
  /// type of DNS record.
  /// </li>
  /// <li>
  /// <code>HOST_NOT_FOUND</code> – The queried hostname does not exist or was not
  /// reachable at the time of the request. Ensure that you have published the
  /// required DNS record(s).
  /// </li>
  /// <li>
  /// <code>SERVICE_ERROR</code> – A temporary issue is preventing Amazon SES from
  /// determining the verification status of the domain.
  /// </li>
  /// <li>
  /// <code>DNS_SERVER_ERROR</code> – The DNS server encountered an issue and was
  /// unable to complete the request.
  /// </li>
  /// </ul>
  final VerificationError? errorType;

  /// The last time a verification attempt was made for this identity.
  final DateTime? lastCheckedTimestamp;

  /// The last time a successful verification was made for this identity.
  final DateTime? lastSuccessTimestamp;

  /// An object that contains information about the start of authority (SOA)
  /// record associated with the identity.
  final SOARecord? sOARecord;

  VerificationInfo({
    this.errorType,
    this.lastCheckedTimestamp,
    this.lastSuccessTimestamp,
    this.sOARecord,
  });

  factory VerificationInfo.fromJson(Map<String, dynamic> json) {
    return VerificationInfo(
      errorType: (json['ErrorType'] as String?)?.toVerificationError(),
      lastCheckedTimestamp: timeStampFromJson(json['LastCheckedTimestamp']),
      lastSuccessTimestamp: timeStampFromJson(json['LastSuccessTimestamp']),
      sOARecord: json['SOARecord'] != null
          ? SOARecord.fromJson(json['SOARecord'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorType = this.errorType;
    final lastCheckedTimestamp = this.lastCheckedTimestamp;
    final lastSuccessTimestamp = this.lastSuccessTimestamp;
    final sOARecord = this.sOARecord;
    return {
      if (errorType != null) 'ErrorType': errorType.toValue(),
      if (lastCheckedTimestamp != null)
        'LastCheckedTimestamp': unixTimestampToJson(lastCheckedTimestamp),
      if (lastSuccessTimestamp != null)
        'LastSuccessTimestamp': unixTimestampToJson(lastSuccessTimestamp),
      if (sOARecord != null) 'SOARecord': sOARecord,
    };
  }
}

enum VerificationStatus {
  pending,
  success,
  failed,
  temporaryFailure,
  notStarted,
}

extension VerificationStatusValueExtension on VerificationStatus {
  String toValue() {
    switch (this) {
      case VerificationStatus.pending:
        return 'PENDING';
      case VerificationStatus.success:
        return 'SUCCESS';
      case VerificationStatus.failed:
        return 'FAILED';
      case VerificationStatus.temporaryFailure:
        return 'TEMPORARY_FAILURE';
      case VerificationStatus.notStarted:
        return 'NOT_STARTED';
    }
  }
}

extension VerificationStatusFromString on String {
  VerificationStatus toVerificationStatus() {
    switch (this) {
      case 'PENDING':
        return VerificationStatus.pending;
      case 'SUCCESS':
        return VerificationStatus.success;
      case 'FAILED':
        return VerificationStatus.failed;
      case 'TEMPORARY_FAILURE':
        return VerificationStatus.temporaryFailure;
      case 'NOT_STARTED':
        return VerificationStatus.notStarted;
    }
    throw Exception('$this is not known in enum VerificationStatus');
  }
}

/// An object that contains information about the amount of email that was
/// delivered to recipients.
class VolumeStatistics {
  /// The total number of emails that arrived in recipients' inboxes.
  final int? inboxRawCount;

  /// An estimate of the percentage of emails sent from the current domain that
  /// will arrive in recipients' inboxes.
  final int? projectedInbox;

  /// An estimate of the percentage of emails sent from the current domain that
  /// will arrive in recipients' spam or junk mail folders.
  final int? projectedSpam;

  /// The total number of emails that arrived in recipients' spam or junk mail
  /// folders.
  final int? spamRawCount;

  VolumeStatistics({
    this.inboxRawCount,
    this.projectedInbox,
    this.projectedSpam,
    this.spamRawCount,
  });

  factory VolumeStatistics.fromJson(Map<String, dynamic> json) {
    return VolumeStatistics(
      inboxRawCount: json['InboxRawCount'] as int?,
      projectedInbox: json['ProjectedInbox'] as int?,
      projectedSpam: json['ProjectedSpam'] as int?,
      spamRawCount: json['SpamRawCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inboxRawCount = this.inboxRawCount;
    final projectedInbox = this.projectedInbox;
    final projectedSpam = this.projectedSpam;
    final spamRawCount = this.spamRawCount;
    return {
      if (inboxRawCount != null) 'InboxRawCount': inboxRawCount,
      if (projectedInbox != null) 'ProjectedInbox': projectedInbox,
      if (projectedSpam != null) 'ProjectedSpam': projectedSpam,
      if (spamRawCount != null) 'SpamRawCount': spamRawCount,
    };
  }
}

/// The warmup status of a dedicated IP.
enum WarmupStatus {
  inProgress,
  done,
}

extension WarmupStatusValueExtension on WarmupStatus {
  String toValue() {
    switch (this) {
      case WarmupStatus.inProgress:
        return 'IN_PROGRESS';
      case WarmupStatus.done:
        return 'DONE';
    }
  }
}

extension WarmupStatusFromString on String {
  WarmupStatus toWarmupStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return WarmupStatus.inProgress;
      case 'DONE':
        return WarmupStatus.done;
    }
    throw Exception('$this is not known in enum WarmupStatus');
  }
}

class AccountSuspendedException extends _s.GenericAwsException {
  AccountSuspendedException({String? type, String? message})
      : super(type: type, code: 'AccountSuspendedException', message: message);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MailFromDomainNotVerifiedException extends _s.GenericAwsException {
  MailFromDomainNotVerifiedException({String? type, String? message})
      : super(
            type: type,
            code: 'MailFromDomainNotVerifiedException',
            message: message);
}

class MessageRejected extends _s.GenericAwsException {
  MessageRejected({String? type, String? message})
      : super(type: type, code: 'MessageRejected', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class SendingPausedException extends _s.GenericAwsException {
  SendingPausedException({String? type, String? message})
      : super(type: type, code: 'SendingPausedException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccountSuspendedException': (type, message) =>
      AccountSuspendedException(type: type, message: message),
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MailFromDomainNotVerifiedException': (type, message) =>
      MailFromDomainNotVerifiedException(type: type, message: message),
  'MessageRejected': (type, message) =>
      MessageRejected(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'SendingPausedException': (type, message) =>
      SendingPausedException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
