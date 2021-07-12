// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Welcome to the Amazon SES API v2 Reference. This guide provides information
/// about the Amazon SES API v2, including supported operations, data types,
/// parameters, and schemas.
class SesV2 {
  final _s.RestJsonProtocol _protocol;
  SesV2({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

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
  /// The name of the configuration set.
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
  /// An array of objects that define the tags (keys and values) that you want
  /// to associate with the configuration set.
  ///
  /// Parameter [trackingOptions] :
  /// An object that defines the open and click tracking options for emails that
  /// you send using the configuration set.
  Future<void> createConfigurationSet({
    required String configurationSetName,
    DeliveryOptions? deliveryOptions,
    ReputationOptions? reputationOptions,
    SendingOptions? sendingOptions,
    SuppressionOptions? suppressionOptions,
    List<Tag>? tags,
    TrackingOptions? trackingOptions,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final $payload = <String, dynamic>{
      'ConfigurationSetName': configurationSetName,
      if (deliveryOptions != null) 'DeliveryOptions': deliveryOptions,
      if (reputationOptions != null) 'ReputationOptions': reputationOptions,
      if (sendingOptions != null) 'SendingOptions': sendingOptions,
      if (suppressionOptions != null) 'SuppressionOptions': suppressionOptions,
      if (tags != null) 'Tags': tags,
      if (trackingOptions != null) 'TrackingOptions': trackingOptions,
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
  /// The name of the configuration set that you want to add an event
  /// destination to.
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
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestination, 'eventDestination');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html#custom-verification-emails-faq">Custom
  /// Verification Email Frequently Asked Questions</a> in the <i>Amazon SES
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
    ArgumentError.checkNotNull(failureRedirectionURL, 'failureRedirectionURL');
    ArgumentError.checkNotNull(fromEmailAddress, 'fromEmailAddress');
    ArgumentError.checkNotNull(successRedirectionURL, 'successRedirectionURL');
    ArgumentError.checkNotNull(templateContent, 'templateContent');
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateSubject, 'templateSubject');
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
  /// more dedicated IP addresses that are associated with your AWS account. You
  /// can associate a pool with a configuration set. When you send an email that
  /// uses that configuration set, the message is sent from one of the addresses
  /// in the associated pool.
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
  /// Parameter [tags] :
  /// An object that defines the tags (keys and values) that you want to
  /// associate with the pool.
  Future<void> createDedicatedIpPool({
    required String poolName,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(poolName, 'poolName');
    final $payload = <String, dynamic>{
      'PoolName': poolName,
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
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(fromEmailAddress, 'fromEmailAddress');
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
  /// the public key that you want to use for DKIM authentication) and a private
  /// key.
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
  /// The email address or domain that you want to verify.
  ///
  /// Parameter [configurationSetName] :
  /// The configuration set to use by default when sending from this identity.
  /// Note that any configuration set defined in the email sending request takes
  /// precedence.
  ///
  /// Parameter [dkimSigningAttributes] :
  /// If your request includes this object, Amazon SES configures the identity
  /// to use Bring Your Own DKIM (BYODKIM) for DKIM authentication purposes, as
  /// opposed to the default method, <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy
  /// DKIM</a>.
  ///
  /// You can only specify this object if the email identity is a domain, as
  /// opposed to an address.
  ///
  /// Parameter [tags] :
  /// An array of objects that define the tags (keys and values) that you want
  /// to associate with the email identity.
  Future<CreateEmailIdentityResponse> createEmailIdentity({
    required String emailIdentity,
    String? configurationSetName,
    DkimSigningAttributes? dkimSigningAttributes,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// The email identity for which you want to create a policy.
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
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      64,
      isRequired: true,
    );
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
  /// The name of the template you want to create.
  Future<void> createEmailTemplate({
    required EmailTemplateContent templateContent,
    required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateContent, 'templateContent');
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(importDataSource, 'importDataSource');
    ArgumentError.checkNotNull(importDestination, 'importDestination');
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
  /// The name of the configuration set that you want to delete.
  Future<void> deleteConfigurationSet({
    required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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
  /// The name of the configuration set that contains the event destination that
  /// you want to delete.
  ///
  /// Parameter [eventDestinationName] :
  /// The name of the event destination that you want to delete.
  Future<void> deleteConfigurationSetEventDestination({
    required String configurationSetName,
    required String eventDestinationName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
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
  /// href="https://docs.aws.amazon.com/es/latest/DeveloperGuide/send-email-verify-address-custom.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
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
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(poolName, 'poolName');
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
  /// The identity (that is, the email address or domain) that you want to
  /// delete.
  Future<void> deleteEmailIdentity({
    required String emailIdentity,
  }) async {
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// The email identity for which you want to delete a policy.
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
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      64,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/suppression/addresses/${Uri.encodeComponent(emailAddress)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Obtain information about the email-sending status and capabilities of your
  /// Amazon SES account in the current AWS Region.
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
    ArgumentError.checkNotNull(blacklistItemNames, 'blacklistItemNames');
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
  /// The name of the configuration set that you want to obtain more information
  /// about.
  Future<GetConfigurationSetResponse> getConfigurationSet({
    required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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
  /// The contact's email addres.
  Future<GetContactResponse> getContact({
    required String contactListName,
    required String emailAddress,
  }) async {
    ArgumentError.checkNotNull(contactListName, 'contactListName');
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
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
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// AWS account.
  Future<GetDedicatedIpResponse> getDedicatedIp({
    required String ip,
  }) async {
    ArgumentError.checkNotNull(ip, 'ip');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/dedicated-ips/${Uri.encodeComponent(ip)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDedicatedIpResponse.fromJson(response);
  }

  /// List the dedicated IP addresses that are associated with your AWS account.
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
  /// and other AWS services. For more information about the features and cost
  /// of a Deliverability dashboard subscription, see <a
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
    ArgumentError.checkNotNull(reportId, 'reportId');
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
    ArgumentError.checkNotNull(campaignId, 'campaignId');
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
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(endDate, 'endDate');
    ArgumentError.checkNotNull(startDate, 'startDate');
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
  /// The email identity that you want to retrieve details for.
  Future<GetEmailIdentityResponse> getEmailIdentity({
    required String emailIdentity,
  }) async {
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// The email identity that you want to retrieve policies for.
  Future<GetEmailIdentityPoliciesResponse> getEmailIdentityPolicies({
    required String emailIdentity,
  }) async {
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// The name of the template you want to retrieve.
  Future<GetEmailTemplateResponse> getEmailTemplate({
    required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEmailTemplateResponse.fromJson(response);
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
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/import-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetImportJobResponse.fromJson(response);
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
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}/contacts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListContactsResponse.fromJson(response);
  }

  /// Lists the existing custom verification email templates for your account in
  /// the current AWS Region.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
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

  /// List all of the dedicated IP pools that exist in your AWS account in the
  /// current Region.
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
  /// The last day, in Unix time format, that you want to obtain deliverability
  /// data for. This value has to be less than or equal to 30 days after the
  /// value of the <code>StartDate</code> parameter.
  ///
  /// Parameter [startDate] :
  /// The first day, in Unix time format, that you want to obtain deliverability
  /// data for.
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
    ArgumentError.checkNotNull(endDate, 'endDate');
    ArgumentError.checkNotNull(startDate, 'startDate');
    ArgumentError.checkNotNull(subscribedDomain, 'subscribedDomain');
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
  /// your AWS account. An identity can be either an email address or a domain.
  /// This operation returns identities that are verified as well as those that
  /// aren't. This operation returns identities that are associated with Amazon
  /// SES and Amazon Pinpoint.
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
  /// current AWS Region.
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
  /// The value you specify has to be at least 1, and can be no more than 10.
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
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/email/import-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListImportJobsResponse.fromJson(response);
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
  /// includes addresses that were added to the list before a specific date. The
  /// date that you specify should be in Unix time format.
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
  /// includes addresses that were added to the list after a specific date. The
  /// date that you specify should be in Unix time format.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// AWS Region. Set to <code>true</code> to enable the automatic warm-up
  /// feature, or set to <code>false</code> to disable it.
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
  /// current AWS Region.
  ///
  /// If the value is <code>false</code>, then your account is in the
  /// <i>sandbox</i>. When your account is in the sandbox, you can only send
  /// email to verified identities. Additionally, the maximum number of emails
  /// you can send in a 24-hour period (your sending quota) is 200, and the
  /// maximum number of emails you can send per second (your maximum sending
  /// rate) is 1.
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
    ArgumentError.checkNotNull(mailType, 'mailType');
    ArgumentError.checkNotNull(useCaseDescription, 'useCaseDescription');
    _s.validateStringLength(
      'useCaseDescription',
      useCaseDescription,
      1,
      5000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(websiteURL, 'websiteURL');
    _s.validateStringLength(
      'websiteURL',
      websiteURL,
      1,
      1000,
      isRequired: true,
    );
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
  /// If AWS paused your account's ability to send email, you can't use this
  /// operation to resume your account's ability to send email.
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

  /// Associate a configuration set with a dedicated IP pool. You can use
  /// dedicated IP pools to create groups of dedicated IP addresses for sending
  /// specific types of email.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that you want to associate with a
  /// dedicated IP pool.
  ///
  /// Parameter [sendingPoolName] :
  /// The name of the dedicated IP pool that you want to associate with the
  /// configuration set.
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
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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
  /// send using a particular configuration set in a specific AWS Region.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that you want to enable or disable
  /// reputation metric tracking for.
  ///
  /// Parameter [reputationMetricsEnabled] :
  /// If <code>true</code>, tracking of reputation metrics is enabled for the
  /// configuration set. If <code>false</code>, tracking of reputation metrics
  /// is disabled for the configuration set.
  Future<void> putConfigurationSetReputationOptions({
    required String configurationSetName,
    bool? reputationMetricsEnabled,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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
  /// configuration set in a specific AWS Region.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that you want to enable or disable email
  /// sending for.
  ///
  /// Parameter [sendingEnabled] :
  /// If <code>true</code>, email sending is enabled for the configuration set.
  /// If <code>false</code>, email sending is disabled for the configuration
  /// set.
  Future<void> putConfigurationSetSendingOptions({
    required String configurationSetName,
    bool? sendingEnabled,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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
  /// The name of the configuration set that you want to change the suppression
  /// list preferences for.
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
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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
  /// The name of the configuration set that you want to add a custom tracking
  /// domain to.
  ///
  /// Parameter [customRedirectDomain] :
  /// The domain that you want to use to track open and click events.
  Future<void> putConfigurationSetTrackingOptions({
    required String configurationSetName,
    String? customRedirectDomain,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
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

  /// Move a dedicated IP address to an existing dedicated IP pool.
  /// <note>
  /// The dedicated IP address that you specify must already exist, and must be
  /// associated with your AWS account.
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
  /// AWS account.
  Future<void> putDedicatedIpInPool({
    required String destinationPoolName,
    required String ip,
  }) async {
    ArgumentError.checkNotNull(destinationPoolName, 'destinationPoolName');
    ArgumentError.checkNotNull(ip, 'ip');
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
    ArgumentError.checkNotNull(ip, 'ip');
    ArgumentError.checkNotNull(warmupPercentage, 'warmupPercentage');
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
  /// and other AWS services. For more information about the features and cost
  /// of a Deliverability dashboard subscription, see <a
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
    ArgumentError.checkNotNull(dashboardEnabled, 'dashboardEnabled');
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
  /// The email address or domain that you want to associate with a
  /// configuration set.
  ///
  /// Parameter [configurationSetName] :
  /// The configuration set that you want to associate with an email identity.
  Future<void> putEmailIdentityConfigurationSetAttributes({
    required String emailIdentity,
    String? configurationSetName,
  }) async {
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// The email identity that you want to change the DKIM settings for.
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
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// The email identity that you want to configure DKIM for.
  ///
  /// Parameter [signingAttributesOrigin] :
  /// The method that you want to use to configure DKIM for the identity. There
  /// are two possible values:
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
  /// that you want to use to configure DKIM for the identity. This object is
  /// only required if you want to configure Bring Your Own DKIM (BYODKIM) for
  /// the identity.
  Future<PutEmailIdentityDkimSigningAttributesResponse>
      putEmailIdentityDkimSigningAttributes({
    required String emailIdentity,
    required DkimSigningAttributesOrigin signingAttributesOrigin,
    DkimSigningAttributes? signingAttributes,
  }) async {
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        signingAttributesOrigin, 'signingAttributesOrigin');
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
  /// The email identity that you want to configure bounce and complaint
  /// feedback forwarding for.
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
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// The verified email identity that you want to set up the custom MAIL FROM
  /// domain for.
  ///
  /// Parameter [behaviorOnMxFailure] :
  /// The action that you want to take if the required MX record isn't found
  /// when you send an email. When you set this value to
  /// <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i>
  /// as the MAIL FROM domain. When you set this value to
  /// <code>RejectMessage</code>, the Amazon SES API v2 returns a
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
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    ArgumentError.checkNotNull(reason, 'reason');
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
  /// The name of the configuration set that you want to use when sending the
  /// email.
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
  /// The email address that you want to use as the "From" address for the
  /// email. The address that you specify has to be verified.
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
    ArgumentError.checkNotNull(bulkEmailEntries, 'bulkEmailEntries');
    ArgumentError.checkNotNull(defaultContent, 'defaultContent');
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
  /// account in the current AWS Region and attempts to verify it. As a result
  /// of executing this operation, a customized verification email is sent to
  /// the specified address.
  ///
  /// To use this operation, you must first create a custom verification email
  /// template. For more information about creating and using custom
  /// verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
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
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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

  /// Sends an email message. You can use the Amazon SES API v2 to send two
  /// types of messages:
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
  /// Simple message Raw message or a template Message.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that you want to use when sending the
  /// email.
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
  /// The email address that you want to use as the "From" address for the
  /// email. The address that you specify has to be verified.
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
    ArgumentError.checkNotNull(content, 'content');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
  /// The name of the template that you want to render.
  Future<TestRenderEmailTemplateResponse> testRenderEmailTemplate({
    required String templateData,
    required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateData, 'templateData');
    _s.validateStringLength(
      'templateData',
      templateData,
      0,
      262144,
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// The name of the configuration set that contains the event destination that
  /// you want to modify.
  ///
  /// Parameter [eventDestination] :
  /// An object that defines the event destination.
  ///
  /// Parameter [eventDestinationName] :
  /// The name of the event destination that you want to modify.
  Future<void> updateConfigurationSetEventDestination({
    required String configurationSetName,
    required EventDestinationDefinition eventDestination,
    required String eventDestinationName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestination, 'eventDestination');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
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

  /// Updates a contact's preferences for a list. It is not necessary to specify
  /// all existing topic preferences in the TopicPreferences object, just the
  /// ones that need updating.
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
  /// The contact's email addres.
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
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
    ArgumentError.checkNotNull(contactListName, 'contactListName');
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html#custom-verification-emails-faq">Custom
  /// Verification Email Frequently Asked Questions</a> in the <i>Amazon SES
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
    ArgumentError.checkNotNull(failureRedirectionURL, 'failureRedirectionURL');
    ArgumentError.checkNotNull(fromEmailAddress, 'fromEmailAddress');
    ArgumentError.checkNotNull(successRedirectionURL, 'successRedirectionURL');
    ArgumentError.checkNotNull(templateContent, 'templateContent');
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateSubject, 'templateSubject');
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
  /// The email identity for which you want to update policy.
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
    ArgumentError.checkNotNull(emailIdentity, 'emailIdentity');
    _s.validateStringLength(
      'emailIdentity',
      emailIdentity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      64,
      isRequired: true,
    );
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
  /// The name of the template you want to update.
  Future<void> updateEmailTemplate({
    required EmailTemplateContent templateContent,
    required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateContent, 'templateContent');
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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

/// The action that you want to take if the required MX record can't be found
/// when you send an email. When you set this value to
/// <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i> as
/// the MAIL FROM domain. When you set this value to <code>RejectMessage</code>,
/// the Amazon SES API v2 returns a <code>MailFromDomainNotVerified</code>
/// error, and doesn't attempt to deliver the email.
///
/// These behaviors are taken when the custom MAIL FROM domain configuration is
/// in the <code>Pending</code>, <code>Failed</code>, and
/// <code>TemporaryFailure</code> states.
enum BehaviorOnMxFailure {
  useDefaultValue,
  rejectMessage,
}

extension on BehaviorOnMxFailure {
  String toValue() {
    switch (this) {
      case BehaviorOnMxFailure.useDefaultValue:
        return 'USE_DEFAULT_VALUE';
      case BehaviorOnMxFailure.rejectMessage:
        return 'REJECT_MESSAGE';
    }
  }
}

extension on String {
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

  /// The time when the blacklisting event occurred, shown in Unix time format.
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

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      html: json['Html'] != null
          ? Content.fromJson(json['Html'] as Map<String, dynamic>)
          : null,
      text: json['Text'] != null
          ? Content.fromJson(json['Text'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final html = this.html;
    final text = this.text;
    return {
      if (html != null) 'Html': html,
      if (text != null) 'Text': text,
    };
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

  factory BulkEmailContent.fromJson(Map<String, dynamic> json) {
    return BulkEmailContent(
      template: json['Template'] != null
          ? Template.fromJson(json['Template'] as Map<String, dynamic>)
          : null,
    );
  }

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

  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using the <code>SendBulkTemplatedEmail</code> operation. Tags
  /// correspond to characteristics of the email that you define, so that you can
  /// publish email sending events.
  final List<MessageTag>? replacementTags;

  BulkEmailEntry({
    required this.destination,
    this.replacementEmailContent,
    this.replacementTags,
  });

  factory BulkEmailEntry.fromJson(Map<String, dynamic> json) {
    return BulkEmailEntry(
      destination:
          Destination.fromJson(json['Destination'] as Map<String, dynamic>),
      replacementEmailContent: json['ReplacementEmailContent'] != null
          ? ReplacementEmailContent.fromJson(
              json['ReplacementEmailContent'] as Map<String, dynamic>)
          : null,
      replacementTags: (json['ReplacementTags'] as List?)
          ?.whereNotNull()
          .map((e) => MessageTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final replacementEmailContent = this.replacementEmailContent;
    final replacementTags = this.replacementTags;
    return {
      'Destination': destination,
      if (replacementEmailContent != null)
        'ReplacementEmailContent': replacementEmailContent,
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

extension on BulkEmailStatus {
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

extension on String {
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
  /// It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores
  /// (_), or dashes (-).
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
  /// publish to Amazon CloudWatch. If you want to use the message tags that you
  /// specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to
  /// the <code>SendEmail</code> or <code>SendRawEmail</code> API, choose
  /// <code>messageTag</code>. If you want to use your own email headers, choose
  /// <code>emailHeader</code>. If you want to use link tags, choose
  /// <code>linkTags</code>.
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

extension on ContactLanguage {
  String toValue() {
    switch (this) {
      case ContactLanguage.en:
        return 'EN';
      case ContactLanguage.ja:
        return 'JA';
    }
  }
}

extension on String {
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
  /// &gt;The type of action that you want to perform on the addresses. Acceptable
  /// values:
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

extension on ContactListImportAction {
  String toValue() {
    switch (this) {
      case ContactListImportAction.delete:
        return 'DELETE';
      case ContactListImportAction.put:
        return 'PUT';
    }
  }
}

extension on String {
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

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      data: json['Data'] as String,
      charset: json['Charset'] as String?,
    );
  }

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

  /// The email identity type.
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

/// The data format of the import job's data source.
enum DataFormat {
  csv,
  json,
}

extension on DataFormat {
  String toValue() {
    switch (this) {
      case DataFormat.csv:
        return 'CSV';
      case DataFormat.json:
        return 'JSON';
    }
  }
}

extension on String {
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

extension on DeliverabilityDashboardAccountStatus {
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

extension on String {
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
  /// The date and time when the predictive inbox placement test was created, in
  /// Unix time format.
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

extension on DeliverabilityTestStatus {
  String toValue() {
    switch (this) {
      case DeliverabilityTestStatus.inProgress:
        return 'IN_PROGRESS';
      case DeliverabilityTestStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension on String {
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

/// Used to associate a configuration set with a dedicated IP pool.
class DeliveryOptions {
  /// The name of the dedicated IP pool that you want to associate with the
  /// configuration set.
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

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      bccAddresses: (json['BccAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ccAddresses: (json['CcAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      toAddresses: (json['ToAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

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
/// publish to Amazon CloudWatch. If you want to use the message tags that you
/// specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to
/// the <code>SendEmail</code> or <code>SendRawEmail</code> API, choose
/// <code>messageTag</code>. If you want to use your own email headers, choose
/// <code>emailHeader</code>. If you want to use link tags, choose
/// <code>linkTags</code>.
enum DimensionValueSource {
  messageTag,
  emailHeader,
  linkTag,
}

extension on DimensionValueSource {
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

extension on String {
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
  /// A string that indicates how DKIM was configured for the identity. There are
  /// two possible values:
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
    this.signingAttributesOrigin,
    this.signingEnabled,
    this.status,
    this.tokens,
  });

  factory DkimAttributes.fromJson(Map<String, dynamic> json) {
    return DkimAttributes(
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
    final signingAttributesOrigin = this.signingAttributesOrigin;
    final signingEnabled = this.signingEnabled;
    final status = this.status;
    final tokens = this.tokens;
    return {
      if (signingAttributesOrigin != null)
        'SigningAttributesOrigin': signingAttributesOrigin.toValue(),
      if (signingEnabled != null) 'SigningEnabled': signingEnabled,
      if (status != null) 'Status': status.toValue(),
      if (tokens != null) 'Tokens': tokens,
    };
  }
}

/// An object that contains information about the tokens used for setting up
/// Bring Your Own DKIM (BYODKIM).
class DkimSigningAttributes {
  /// A private key that's used to generate a DKIM signature.
  ///
  /// The private key must use 1024-bit RSA encryption, and must be encoded using
  /// base64 encoding.
  final String domainSigningPrivateKey;

  /// A string that's used to identify a public key in the DNS configuration for a
  /// domain.
  final String domainSigningSelector;

  DkimSigningAttributes({
    required this.domainSigningPrivateKey,
    required this.domainSigningSelector,
  });

  factory DkimSigningAttributes.fromJson(Map<String, dynamic> json) {
    return DkimSigningAttributes(
      domainSigningPrivateKey: json['DomainSigningPrivateKey'] as String,
      domainSigningSelector: json['DomainSigningSelector'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final domainSigningPrivateKey = this.domainSigningPrivateKey;
    final domainSigningSelector = this.domainSigningSelector;
    return {
      'DomainSigningPrivateKey': domainSigningPrivateKey,
      'DomainSigningSelector': domainSigningSelector,
    };
  }
}

enum DkimSigningAttributesOrigin {
  awsSes,
  external,
}

extension on DkimSigningAttributesOrigin {
  String toValue() {
    switch (this) {
      case DkimSigningAttributesOrigin.awsSes:
        return 'AWS_SES';
      case DkimSigningAttributesOrigin.external:
        return 'EXTERNAL';
    }
  }
}

extension on String {
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

extension on DkimStatus {
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

extension on String {
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

  /// The first time, in Unix time format, when the email message was delivered to
  /// any recipient's inbox. This value can help you determine how long it took
  /// for a campaign to deliver an email message.
  final DateTime? firstSeenDateTime;

  /// The verified email address that the email message was sent from.
  final String? fromAddress;

  /// The URL of an image that contains a snapshot of the email message that was
  /// sent.
  final String? imageUrl;

  /// The number of email messages that were delivered to recipients’ inboxes.
  final int? inboxCount;

  /// The last time, in Unix time format, when the email message was delivered to
  /// any recipient's inbox. This value can help you determine how long it took
  /// for a campaign to deliver an email message.
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
  /// A verified domain that’s associated with your AWS account and currently has
  /// an active Deliverability dashboard subscription.
  final String? domain;

  /// An object that contains information about the inbox placement data settings
  /// for the domain.
  final InboxPlacementTrackingOption? inboxPlacementTrackingOption;

  /// The date, in Unix time format, when you enabled the Deliverability dashboard
  /// for the domain.
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
  /// The entire message must be Base64 encoded.
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

  factory EmailContent.fromJson(Map<String, dynamic> json) {
    return EmailContent(
      raw: json['Raw'] != null
          ? RawMessage.fromJson(json['Raw'] as Map<String, dynamic>)
          : null,
      simple: json['Simple'] != null
          ? Message.fromJson(json['Simple'] as Map<String, dynamic>)
          : null,
      template: json['Template'] != null
          ? Template.fromJson(json['Template'] as Map<String, dynamic>)
          : null,
    );
  }

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

/// In the Amazon SES API v2, <i>events</i> include message sends, deliveries,
/// opens, clicks, bounces, complaints and delivery delays. <i>Event
/// destinations</i> are places that you can send information about these events
/// to. For example, you can send event data to Amazon SNS to receive
/// notifications when you receive bounces or complaints, or you can use Amazon
/// Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.
class EventDestination {
  /// The types of events that Amazon SES sends to the specified event
  /// destinations.
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

  factory EventDestinationDefinition.fromJson(Map<String, dynamic> json) {
    return EventDestinationDefinition(
      cloudWatchDestination: json['CloudWatchDestination'] != null
          ? CloudWatchDestination.fromJson(
              json['CloudWatchDestination'] as Map<String, dynamic>)
          : null,
      enabled: json['Enabled'] as bool?,
      kinesisFirehoseDestination: json['KinesisFirehoseDestination'] != null
          ? KinesisFirehoseDestination.fromJson(
              json['KinesisFirehoseDestination'] as Map<String, dynamic>)
          : null,
      matchingEventTypes: (json['MatchingEventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventType())
          .toList(),
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

extension on EventType {
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

extension on String {
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

/// An object that contains the failure details about an import job.
class FailureInfo {
  /// A message about why the import job failed.
  final String? errorMessage;

  /// An Amazon S3 presigned URL that contains all the failed records and related
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

/// A list of details about the email-sending capabilities of your Amazon SES
/// account in the current AWS Region.
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
  /// AWS Region.
  ///
  /// If the value is <code>false</code>, then your account is in the
  /// <i>sandbox</i>. When your account is in the sandbox, you can only send email
  /// to verified identities. Additionally, the maximum number of emails you can
  /// send in a 24-hour period (your sending quota) is 200, and the maximum number
  /// of emails you can send per second (your maximum sending rate) is 1.
  ///
  /// If the value is <code>true</code>, then your account has production access.
  /// When your account has production access, you can send email to any address.
  /// The sending quota and maximum sending rate for your account vary based on
  /// your specific use case.
  final bool? productionAccessEnabled;

  /// An object that contains information about the per-day and per-second sending
  /// limits for your Amazon SES account in the current AWS Region.
  final SendQuota? sendQuota;

  /// Indicates whether or not email sending is enabled for your Amazon SES
  /// account in the current AWS Region.
  final bool? sendingEnabled;

  /// An object that contains information about the email address suppression
  /// preferences for your account in the current AWS Region.
  final SuppressionAttributes? suppressionAttributes;

  GetAccountResponse({
    this.dedicatedIpAutoWarmupEnabled,
    this.details,
    this.enforcementStatus,
    this.productionAccessEnabled,
    this.sendQuota,
    this.sendingEnabled,
    this.suppressionAttributes,
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

  GetConfigurationSetResponse({
    this.configurationSetName,
    this.deliveryOptions,
    this.reputationOptions,
    this.sendingOptions,
    this.suppressionOptions,
    this.tags,
    this.trackingOptions,
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
    return {
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (deliveryOptions != null) 'DeliveryOptions': deliveryOptions,
      if (reputationOptions != null) 'ReputationOptions': reputationOptions,
      if (sendingOptions != null) 'SendingOptions': sendingOptions,
      if (suppressionOptions != null) 'SuppressionOptions': suppressionOptions,
      if (tags != null) 'Tags': tags,
      if (trackingOptions != null) 'TrackingOptions': trackingOptions,
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

  /// The contact's email addres.
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
/// AWS account.
class GetDedicatedIpsResponse {
  /// A list of dedicated IP addresses that are associated with your AWS account.
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

  /// The date, in Unix time format, when your current subscription to the
  /// Deliverability dashboard is scheduled to expire, if your subscription is
  /// scheduled to expire at the end of the current calendar month. This value is
  /// null if you have an active subscription that isn’t due to expire at the end
  /// of the month.
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

  /// The email identity type.
  final IdentityType? identityType;

  /// An object that contains information about the Mail-From attributes for the
  /// email identity.
  final MailFromAttributes? mailFromAttributes;

  /// A map of policy names to policies.
  final Map<String, String>? policies;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the email identity.
  final List<Tag>? tags;

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

  /// The name of the template you want to retrieve.
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

/// Information about an email identity.
class IdentityInfo {
  /// The address or domain of the identity.
  final String? identityName;

  /// The email identity type. The identity type can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>EMAIL_ADDRESS</code> – The identity is an email address.
  /// </li>
  /// <li>
  /// <code>DOMAIN</code> – The identity is a domain.
  /// </li>
  /// <li>
  /// <code>MANAGED_DOMAIN</code> – The identity is a domain that is managed by
  /// AWS.
  /// </li>
  /// </ul>
  final IdentityType? identityType;

  /// Indicates whether or not you can send email from the identity.
  ///
  /// An <i>identity</i> is an email address or domain that you send email from.
  /// Before you can send email from an identity, you have to demostrate that you
  /// own the identity, and that you authorize Amazon SES to send email from that
  /// identity.
  final bool? sendingEnabled;

  IdentityInfo({
    this.identityName,
    this.identityType,
    this.sendingEnabled,
  });

  factory IdentityInfo.fromJson(Map<String, dynamic> json) {
    return IdentityInfo(
      identityName: json['IdentityName'] as String?,
      identityType: (json['IdentityType'] as String?)?.toIdentityType(),
      sendingEnabled: json['SendingEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityName = this.identityName;
    final identityType = this.identityType;
    final sendingEnabled = this.sendingEnabled;
    return {
      if (identityName != null) 'IdentityName': identityName,
      if (identityType != null) 'IdentityType': identityType.toValue(),
      if (sendingEnabled != null) 'SendingEnabled': sendingEnabled,
    };
  }
}

/// The email identity type. The identity type can be one of the following:
///
/// <ul>
/// <li>
/// <code>EMAIL_ADDRESS</code> – The identity is an email address.
/// </li>
/// <li>
/// <code>DOMAIN</code> – The identity is a domain.
/// </li>
/// </ul>
enum IdentityType {
  emailAddress,
  domain,
  managedDomain,
}

extension on IdentityType {
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

extension on String {
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

extension on ImportDestinationType {
  String toValue() {
    switch (this) {
      case ImportDestinationType.suppressionList:
        return 'SUPPRESSION_LIST';
      case ImportDestinationType.contactList:
        return 'CONTACT_LIST';
    }
  }
}

extension on String {
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
  final ImportDestination? importDestination;
  final String? jobId;
  final JobStatus? jobStatus;

  ImportJobSummary({
    this.createdTimestamp,
    this.importDestination,
    this.jobId,
    this.jobStatus,
  });

  factory ImportJobSummary.fromJson(Map<String, dynamic> json) {
    return ImportJobSummary(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      importDestination: json['ImportDestination'] != null
          ? ImportDestination.fromJson(
              json['ImportDestination'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final importDestination = this.importDestination;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (importDestination != null) 'ImportDestination': importDestination,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

/// An object that contains information about the inbox placement data settings
/// for a verified domain that’s associated with your AWS account. This data is
/// available only if you enabled the Deliverability dashboard for the domain.
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

/// The status of the import job.
enum JobStatus {
  created,
  processing,
  completed,
  failed,
}

extension on JobStatus {
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
    }
  }
}

extension on String {
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

/// A list of configuration sets in your Amazon SES account in the current AWS
/// Region.
class ListConfigurationSetsResponse {
  /// An array that contains all of the configuration sets in your Amazon SES
  /// account in the current AWS Region.
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

  factory ListContactsFilter.fromJson(Map<String, dynamic> json) {
    return ListContactsFilter(
      filteredStatus:
          (json['FilteredStatus'] as String?)?.toSubscriptionStatus(),
      topicFilter: json['TopicFilter'] != null
          ? TopicFilter.fromJson(json['TopicFilter'] as Map<String, dynamic>)
          : null,
    );
  }

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
  /// A list of all of the dedicated IP pools that are associated with your AWS
  /// account in the current Region.
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
  /// An array that includes all of the email identities associated with your AWS
  /// account.
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

  factory ListManagementOptions.fromJson(Map<String, dynamic> json) {
    return ListManagementOptions(
      contactListName: json['ContactListName'] as String,
      topicName: json['TopicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactListName = this.contactListName;
    final topicName = this.topicName;
    return {
      'ContactListName': contactListName,
      if (topicName != null) 'TopicName': topicName,
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
  /// The action that you want to take if the required MX record can't be found
  /// when you send an email. When you set this value to
  /// <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i> as
  /// the MAIL FROM domain. When you set this value to <code>RejectMessage</code>,
  /// the Amazon SES API v2 returns a <code>MailFromDomainNotVerified</code>
  /// error, and doesn't attempt to deliver the email.
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

extension on MailFromDomainStatus {
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

extension on String {
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

extension on MailType {
  String toValue() {
    switch (this) {
      case MailType.marketing:
        return 'MARKETING';
      case MailType.transactional:
        return 'TRANSACTIONAL';
    }
  }
}

extension on String {
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

  Message({
    required this.body,
    required this.subject,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      body: Body.fromJson(json['Body'] as Map<String, dynamic>),
      subject: Content.fromJson(json['Subject'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final subject = this.subject;
    return {
      'Body': body,
      'Subject': subject,
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
  /// The Amazon Resource Name (ARN) of the Amazon Pinpoint project that you want
  /// to send email events to.
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
  /// The entire message must be Base64 encoded.
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

  factory RawMessage.fromJson(Map<String, dynamic> json) {
    return RawMessage(
      data: _s.decodeUint8List(json['Data']! as String),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      'Data': base64Encode(data),
    };
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

  factory ReplacementEmailContent.fromJson(Map<String, dynamic> json) {
    return ReplacementEmailContent(
      replacementTemplate: json['ReplacementTemplate'] != null
          ? ReplacementTemplate.fromJson(
              json['ReplacementTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

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

  factory ReplacementTemplate.fromJson(Map<String, dynamic> json) {
    return ReplacementTemplate(
      replacementTemplateData: json['ReplacementTemplateData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replacementTemplateData = this.replacementTemplateData;
    return {
      if (replacementTemplateData != null)
        'ReplacementTemplateData': replacementTemplateData,
    };
  }
}

/// Enable or disable collection of reputation metrics for emails that you send
/// using this configuration set in the current AWS Region.
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

extension on ReviewStatus {
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

extension on String {
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

/// The following data is returned in JSON format by the service.
class SendBulkEmailResponse {
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
  /// It's possible for Amazon SES to accept a message without sending it. This
  /// can happen when the message that you're trying to send has an attachment
  /// contains a virus, or when you send a templated email that contains invalid
  /// personalization content, for example.
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
/// limits for your Amazon SES account in the current AWS Region.
class SendQuota {
  /// The maximum number of emails that you can send in the current AWS Region
  /// over a 24-hour period. This value is also called your <i>sending quota</i>.
  final double? max24HourSend;

  /// The maximum number of emails that you can send per second in the current AWS
  /// Region. This value is also called your <i>maximum sending rate</i> or your
  /// <i>maximum TPS (transactions per second) rate</i>.
  final double? maxSendRate;

  /// The number of emails sent from your Amazon SES account in the current AWS
  /// Region over the past 24 hours.
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
/// configuration set in the current AWS Region.
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
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to
  /// publish email events to. For more information about Amazon SNS topics, see
  /// the <a
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

extension on SubscriptionStatus {
  String toValue() {
    switch (this) {
      case SubscriptionStatus.optIn:
        return 'OPT_IN';
      case SubscriptionStatus.optOut:
        return 'OPT_OUT';
    }
  }
}

extension on String {
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
/// preferences for your account in the current AWS Region.
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
  /// The type of action that you want to perform on the address. Acceptable
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

/// The type of action that you want to perform on the address. Acceptable
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

extension on SuppressionListImportAction {
  String toValue() {
    switch (this) {
      case SuppressionListImportAction.delete:
        return 'DELETE';
      case SuppressionListImportAction.put:
        return 'PUT';
    }
  }
}

extension on String {
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

extension on SuppressionListReason {
  String toValue() {
    switch (this) {
      case SuppressionListReason.bounce:
        return 'BOUNCE';
      case SuppressionListReason.complaint:
        return 'COMPLAINT';
    }
  }
}

extension on String {
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
/// The <code>aws:</code> prefix is reserved for use by AWS; you can’t use it in
/// any tag keys or values that you define. In addition, you can't edit or
/// remove tag keys or values that use this prefix. Tags that use this prefix
/// don’t count against the limit of 50 tags per resource.
/// </li>
/// <li>
/// You can associate tags with public or shared resources, but the tags are
/// available only for your AWS account, not any other accounts that share the
/// resource. In addition, the tags are available only for resources that are
/// located in the specified AWS Region for your AWS account.
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
    this.templateArn,
    this.templateData,
    this.templateName,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      templateArn: json['TemplateArn'] as String?,
      templateData: json['TemplateData'] as String?,
      templateName: json['TemplateName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateArn = this.templateArn;
    final templateData = this.templateData;
    final templateName = this.templateName;
    return {
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

extension on TlsPolicy {
  String toValue() {
    switch (this) {
      case TlsPolicy.require:
        return 'REQUIRE';
      case TlsPolicy.optional:
        return 'OPTIONAL';
    }
  }
}

extension on String {
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

  factory TopicFilter.fromJson(Map<String, dynamic> json) {
    return TopicFilter(
      topicName: json['TopicName'] as String?,
      useDefaultIfPreferenceUnavailable:
          json['UseDefaultIfPreferenceUnavailable'] as bool?,
    );
  }

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
/// These images and links include references to a domain operated by AWS. You
/// can optionally configure the Amazon SES to use a domain that you operate for
/// these images and links.
class TrackingOptions {
  /// The domain that you want to use for tracking open and click events.
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

extension on WarmupStatus {
  String toValue() {
    switch (this) {
      case WarmupStatus.inProgress:
        return 'IN_PROGRESS';
      case WarmupStatus.done:
        return 'DONE';
    }
  }
}

extension on String {
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
