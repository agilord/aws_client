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

part '2019-09-27.g.dart';

/// Welcome to the Amazon SES API v2 Reference. This guide provides information
/// about the Amazon SES API v2, including supported operations, data types,
/// parameters, and schemas.
class SesV2 {
  final _s.RestJsonProtocol _protocol;
  SesV2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String configurationSetName,
    DeliveryOptions deliveryOptions,
    ReputationOptions reputationOptions,
    SendingOptions sendingOptions,
    SuppressionOptions suppressionOptions,
    List<Tag> tags,
    TrackingOptions trackingOptions,
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
    return CreateConfigurationSetResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    @_s.required EventDestinationDefinition eventDestination,
    @_s.required String eventDestinationName,
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
    return CreateConfigurationSetEventDestinationResponse.fromJson(response);
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
    @_s.required String contactListName,
    @_s.required String emailAddress,
    String attributesData,
    List<TopicPreference> topicPreferences,
    bool unsubscribeAll,
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
    return CreateContactResponse.fromJson(response);
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
    @_s.required String contactListName,
    String description,
    List<Tag> tags,
    List<Topic> topics,
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
    return CreateContactListResponse.fromJson(response);
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
    @_s.required String failureRedirectionURL,
    @_s.required String fromEmailAddress,
    @_s.required String successRedirectionURL,
    @_s.required String templateContent,
    @_s.required String templateName,
    @_s.required String templateSubject,
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
    return CreateCustomVerificationEmailTemplateResponse.fromJson(response);
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
    @_s.required String poolName,
    List<Tag> tags,
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
    return CreateDedicatedIpPoolResponse.fromJson(response);
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
    @_s.required EmailContent content,
    @_s.required String fromEmailAddress,
    String reportName,
    List<Tag> tags,
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
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [emailIdentity] :
  /// The email address or domain that you want to verify.
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
    @_s.required String emailIdentity,
    DkimSigningAttributes dkimSigningAttributes,
    List<Tag> tags,
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
    @_s.required String emailIdentity,
    @_s.required String policy,
    @_s.required String policyName,
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
    return CreateEmailIdentityPolicyResponse.fromJson(response);
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
    @_s.required EmailTemplateContent templateContent,
    @_s.required String templateName,
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
    return CreateEmailTemplateResponse.fromJson(response);
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
    @_s.required ImportDataSource importDataSource,
    @_s.required ImportDestination importDestination,
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
    @_s.required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConfigurationSetResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    @_s.required String eventDestinationName,
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
    return DeleteConfigurationSetEventDestinationResponse.fromJson(response);
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
    @_s.required String contactListName,
    @_s.required String emailAddress,
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
    return DeleteContactResponse.fromJson(response);
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
    @_s.required String contactListName,
  }) async {
    ArgumentError.checkNotNull(contactListName, 'contactListName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/contact-lists/${Uri.encodeComponent(contactListName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteContactListResponse.fromJson(response);
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
    @_s.required String templateName,
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
    return DeleteCustomVerificationEmailTemplateResponse.fromJson(response);
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
    @_s.required String poolName,
  }) async {
    ArgumentError.checkNotNull(poolName, 'poolName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/dedicated-ip-pools/${Uri.encodeComponent(poolName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDedicatedIpPoolResponse.fromJson(response);
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
    @_s.required String emailIdentity,
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
    return DeleteEmailIdentityResponse.fromJson(response);
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
    @_s.required String emailIdentity,
    @_s.required String policyName,
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
    return DeleteEmailIdentityPolicyResponse.fromJson(response);
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
    @_s.required String templateName,
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
    return DeleteEmailTemplateResponse.fromJson(response);
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
    @_s.required String emailAddress,
  }) async {
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/email/suppression/addresses/${Uri.encodeComponent(emailAddress)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSuppressedDestinationResponse.fromJson(response);
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
    @_s.required List<String> blacklistItemNames,
  }) async {
    ArgumentError.checkNotNull(blacklistItemNames, 'blacklistItemNames');
    final $query = <String, List<String>>{
      if (blacklistItemNames != null) 'BlacklistItemNames': blacklistItemNames,
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
    @_s.required String configurationSetName,
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
    @_s.required String configurationSetName,
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
    @_s.required String contactListName,
    @_s.required String emailAddress,
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
    @_s.required String contactListName,
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
    @_s.required String templateName,
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
    @_s.required String ip,
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
    String nextToken,
    int pageSize,
    String poolName,
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
    @_s.required String reportId,
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
    @_s.required String campaignId,
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
    @_s.required String domain,
    @_s.required DateTime endDate,
    @_s.required DateTime startDate,
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
      if (endDate != null) 'EndDate': [_s.iso8601ToJson(endDate).toString()],
      if (startDate != null)
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
    @_s.required String emailIdentity,
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
    @_s.required String emailIdentity,
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
    @_s.required String templateName,
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
    @_s.required String jobId,
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
    @_s.required String emailAddress,
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
    String nextToken,
    int pageSize,
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
    String nextToken,
    int pageSize,
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
    @_s.required String contactListName,
    ListContactsFilter filter,
    String nextToken,
    int pageSize,
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
    String nextToken,
    int pageSize,
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
    String nextToken,
    int pageSize,
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
    String nextToken,
    int pageSize,
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
    @_s.required DateTime endDate,
    @_s.required DateTime startDate,
    @_s.required String subscribedDomain,
    String nextToken,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(endDate, 'endDate');
    ArgumentError.checkNotNull(startDate, 'startDate');
    ArgumentError.checkNotNull(subscribedDomain, 'subscribedDomain');
    final $query = <String, List<String>>{
      if (endDate != null) 'EndDate': [_s.iso8601ToJson(endDate).toString()],
      if (startDate != null)
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
    String nextToken,
    int pageSize,
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
    String nextToken,
    int pageSize,
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
    ImportDestinationType importDestinationType,
    String nextToken,
    int pageSize,
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
    DateTime endDate,
    String nextToken,
    int pageSize,
    List<SuppressionListReason> reasons,
    DateTime startDate,
  }) async {
    final $query = <String, List<String>>{
      if (endDate != null) 'EndDate': [_s.iso8601ToJson(endDate).toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize.toString()],
      if (reasons != null)
        'Reason': reasons.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'ResourceArn': [resourceArn],
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
    bool autoWarmupEnabled,
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
    return PutAccountDedicatedIpWarmupAttributesResponse.fromJson(response);
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
    @_s.required MailType mailType,
    @_s.required String useCaseDescription,
    @_s.required String websiteURL,
    List<String> additionalContactEmailAddresses,
    ContactLanguage contactLanguage,
    bool productionAccessEnabled,
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
    _s.validateStringPattern(
      'websiteURL',
      websiteURL,
      r'''^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'MailType': mailType?.toValue() ?? '',
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
    return PutAccountDetailsResponse.fromJson(response);
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
    bool sendingEnabled,
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
    return PutAccountSendingAttributesResponse.fromJson(response);
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
    List<SuppressionListReason> suppressedReasons,
  }) async {
    final $payload = <String, dynamic>{
      if (suppressedReasons != null)
        'SuppressedReasons':
            suppressedReasons.map((e) => e?.toValue() ?? '').toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/account/suppression',
      exceptionFnMap: _exceptionFns,
    );
    return PutAccountSuppressionAttributesResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    String sendingPoolName,
    TlsPolicy tlsPolicy,
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
    return PutConfigurationSetDeliveryOptionsResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    bool reputationMetricsEnabled,
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
    return PutConfigurationSetReputationOptionsResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    bool sendingEnabled,
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
    return PutConfigurationSetSendingOptionsResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    List<SuppressionListReason> suppressedReasons,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final $payload = <String, dynamic>{
      if (suppressedReasons != null)
        'SuppressedReasons':
            suppressedReasons.map((e) => e?.toValue() ?? '').toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/email/configuration-sets/${Uri.encodeComponent(configurationSetName)}/suppression-options',
      exceptionFnMap: _exceptionFns,
    );
    return PutConfigurationSetSuppressionOptionsResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    String customRedirectDomain,
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
    return PutConfigurationSetTrackingOptionsResponse.fromJson(response);
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
    @_s.required String destinationPoolName,
    @_s.required String ip,
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
    return PutDedicatedIpInPoolResponse.fromJson(response);
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
    @_s.required String ip,
    @_s.required int warmupPercentage,
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
    return PutDedicatedIpWarmupAttributesResponse.fromJson(response);
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
    @_s.required bool dashboardEnabled,
    List<DomainDeliverabilityTrackingOption> subscribedDomains,
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
    return PutDeliverabilityDashboardOptionResponse.fromJson(response);
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
    @_s.required String emailIdentity,
    bool signingEnabled,
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
    return PutEmailIdentityDkimAttributesResponse.fromJson(response);
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
    @_s.required String emailIdentity,
    @_s.required DkimSigningAttributesOrigin signingAttributesOrigin,
    DkimSigningAttributes signingAttributes,
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
      'SigningAttributesOrigin': signingAttributesOrigin?.toValue() ?? '',
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
    @_s.required String emailIdentity,
    bool emailForwardingEnabled,
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
    return PutEmailIdentityFeedbackAttributesResponse.fromJson(response);
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
    @_s.required String emailIdentity,
    BehaviorOnMxFailure behaviorOnMxFailure,
    String mailFromDomain,
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
    return PutEmailIdentityMailFromAttributesResponse.fromJson(response);
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
    @_s.required String emailAddress,
    @_s.required SuppressionListReason reason,
  }) async {
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    ArgumentError.checkNotNull(reason, 'reason');
    final $payload = <String, dynamic>{
      'EmailAddress': emailAddress,
      'Reason': reason?.toValue() ?? '',
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/email/suppression/addresses',
      exceptionFnMap: _exceptionFns,
    );
    return PutSuppressedDestinationResponse.fromJson(response);
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
    @_s.required List<BulkEmailEntry> bulkEmailEntries,
    @_s.required BulkEmailContent defaultContent,
    String configurationSetName,
    List<MessageTag> defaultEmailTags,
    String feedbackForwardingEmailAddress,
    String feedbackForwardingEmailAddressIdentityArn,
    String fromEmailAddress,
    String fromEmailAddressIdentityArn,
    List<String> replyToAddresses,
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
    @_s.required String emailAddress,
    @_s.required String templateName,
    String configurationSetName,
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
    @_s.required EmailContent content,
    String configurationSetName,
    Destination destination,
    List<MessageTag> emailTags,
    String feedbackForwardingEmailAddress,
    String feedbackForwardingEmailAddressIdentityArn,
    String fromEmailAddress,
    String fromEmailAddressIdentityArn,
    ListManagementOptions listManagementOptions,
    List<String> replyToAddresses,
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String templateData,
    @_s.required String templateName,
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'ResourceArn': [resourceArn],
      if (tagKeys != null) 'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/email/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String configurationSetName,
    @_s.required EventDestinationDefinition eventDestination,
    @_s.required String eventDestinationName,
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
    return UpdateConfigurationSetEventDestinationResponse.fromJson(response);
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
    @_s.required String contactListName,
    @_s.required String emailAddress,
    String attributesData,
    List<TopicPreference> topicPreferences,
    bool unsubscribeAll,
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
    return UpdateContactResponse.fromJson(response);
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
    @_s.required String contactListName,
    String description,
    List<Topic> topics,
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
    return UpdateContactListResponse.fromJson(response);
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
    @_s.required String failureRedirectionURL,
    @_s.required String fromEmailAddress,
    @_s.required String successRedirectionURL,
    @_s.required String templateContent,
    @_s.required String templateName,
    @_s.required String templateSubject,
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
    return UpdateCustomVerificationEmailTemplateResponse.fromJson(response);
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
    @_s.required String emailIdentity,
    @_s.required String policy,
    @_s.required String policyName,
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
    return UpdateEmailIdentityPolicyResponse.fromJson(response);
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
    @_s.required EmailTemplateContent templateContent,
    @_s.required String templateName,
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
    return UpdateEmailTemplateResponse.fromJson(response);
  }
}

/// An object that contains information about your account details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountDetails {
  /// Additional email addresses where updates are sent about your account review
  /// process.
  @_s.JsonKey(name: 'AdditionalContactEmailAddresses')
  final List<String> additionalContactEmailAddresses;

  /// The language you would prefer for the case. The contact language can be one
  /// of <code>ENGLISH</code> or <code>JAPANESE</code>.
  @_s.JsonKey(name: 'ContactLanguage')
  final ContactLanguage contactLanguage;

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
  @_s.JsonKey(name: 'MailType')
  final MailType mailType;

  /// Information about the review of the latest details you submitted.
  @_s.JsonKey(name: 'ReviewDetails')
  final ReviewDetails reviewDetails;

  /// A description of the types of email that you plan to send.
  @_s.JsonKey(name: 'UseCaseDescription')
  final String useCaseDescription;

  /// The URL of your website. This information helps us better understand the
  /// type of content that you plan to send.
  @_s.JsonKey(name: 'WebsiteURL')
  final String websiteURL;

  AccountDetails({
    this.additionalContactEmailAddresses,
    this.contactLanguage,
    this.mailType,
    this.reviewDetails,
    this.useCaseDescription,
    this.websiteURL,
  });
  factory AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsFromJson(json);
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
  @_s.JsonValue('USE_DEFAULT_VALUE')
  useDefaultValue,
  @_s.JsonValue('REJECT_MESSAGE')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that contains information about a blacklisting event that impacts
/// one of the dedicated IP addresses that is associated with your account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BlacklistEntry {
  /// Additional information about the blacklisting event, as provided by the
  /// blacklist maintainer.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The time when the blacklisting event occurred, shown in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ListingTime')
  final DateTime listingTime;

  /// The name of the blacklist that the IP address appears on.
  @_s.JsonKey(name: 'RblName')
  final String rblName;

  BlacklistEntry({
    this.description,
    this.listingTime,
    this.rblName,
  });
  factory BlacklistEntry.fromJson(Map<String, dynamic> json) =>
      _$BlacklistEntryFromJson(json);
}

/// Represents the body of the email message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Body {
  /// An object that represents the version of the message that is displayed in
  /// email clients that support HTML. HTML messages can include formatted text,
  /// hyperlinks, images, and more.
  @_s.JsonKey(name: 'Html')
  final Content html;

  /// An object that represents the version of the message that is displayed in
  /// email clients that don't support HTML, or clients where the recipient has
  /// disabled HTML rendering.
  @_s.JsonKey(name: 'Text')
  final Content text;

  Body({
    this.html,
    this.text,
  });
  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

/// An object that contains the body of the message. You can specify a template
/// message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BulkEmailContent {
  /// The template to use for the bulk email message.
  @_s.JsonKey(name: 'Template')
  final Template template;

  BulkEmailContent({
    this.template,
  });
  Map<String, dynamic> toJson() => _$BulkEmailContentToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Destination')
  final Destination destination;

  /// The <code>ReplacementEmailContent</code> associated with a
  /// <code>BulkEmailEntry</code>.
  @_s.JsonKey(name: 'ReplacementEmailContent')
  final ReplacementEmailContent replacementEmailContent;

  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using the <code>SendBulkTemplatedEmail</code> operation. Tags
  /// correspond to characteristics of the email that you define, so that you can
  /// publish email sending events.
  @_s.JsonKey(name: 'ReplacementTags')
  final List<MessageTag> replacementTags;

  BulkEmailEntry({
    @_s.required this.destination,
    this.replacementEmailContent,
    this.replacementTags,
  });
  Map<String, dynamic> toJson() => _$BulkEmailEntryToJson(this);
}

/// The result of the <code>SendBulkEmail</code> operation of each specified
/// <code>BulkEmailEntry</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BulkEmailEntryResult {
  /// A description of an error that prevented a message being sent using the
  /// <code>SendBulkTemplatedEmail</code> operation.
  @_s.JsonKey(name: 'Error')
  final String error;

  /// The unique message identifier returned from the
  /// <code>SendBulkTemplatedEmail</code> operation.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

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
  @_s.JsonKey(name: 'Status')
  final BulkEmailStatus status;

  BulkEmailEntryResult({
    this.error,
    this.messageId,
    this.status,
  });
  factory BulkEmailEntryResult.fromJson(Map<String, dynamic> json) =>
      _$BulkEmailEntryResultFromJson(json);
}

enum BulkEmailStatus {
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('MESSAGE_REJECTED')
  messageRejected,
  @_s.JsonValue('MAIL_FROM_DOMAIN_NOT_VERIFIED')
  mailFromDomainNotVerified,
  @_s.JsonValue('CONFIGURATION_SET_NOT_FOUND')
  configurationSetNotFound,
  @_s.JsonValue('TEMPLATE_NOT_FOUND')
  templateNotFound,
  @_s.JsonValue('ACCOUNT_SUSPENDED')
  accountSuspended,
  @_s.JsonValue('ACCOUNT_THROTTLED')
  accountThrottled,
  @_s.JsonValue('ACCOUNT_DAILY_QUOTA_EXCEEDED')
  accountDailyQuotaExceeded,
  @_s.JsonValue('INVALID_SENDING_POOL_NAME')
  invalidSendingPoolName,
  @_s.JsonValue('ACCOUNT_SENDING_PAUSED')
  accountSendingPaused,
  @_s.JsonValue('CONFIGURATION_SET_SENDING_PAUSED')
  configurationSetSendingPaused,
  @_s.JsonValue('INVALID_PARAMETER')
  invalidParameter,
  @_s.JsonValue('TRANSIENT_FAILURE')
  transientFailure,
  @_s.JsonValue('FAILED')
  failed,
}

/// An object that defines an Amazon CloudWatch destination for email events.
/// You can use Amazon CloudWatch to monitor and gain insights on your email
/// sending metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchDestination {
  /// An array of objects that define the dimensions to use when you send email
  /// events to Amazon CloudWatch.
  @_s.JsonKey(name: 'DimensionConfigurations')
  final List<CloudWatchDimensionConfiguration> dimensionConfigurations;

  CloudWatchDestination({
    @_s.required this.dimensionConfigurations,
  });
  factory CloudWatchDestination.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchDestinationToJson(this);
}

/// An object that defines the dimension configuration to use when you send
/// email events to Amazon CloudWatch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'DefaultDimensionValue')
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
  @_s.JsonKey(name: 'DimensionName')
  final String dimensionName;

  /// The location where the Amazon SES API v2 finds the value of a dimension to
  /// publish to Amazon CloudWatch. If you want to use the message tags that you
  /// specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to
  /// the <code>SendEmail</code> or <code>SendRawEmail</code> API, choose
  /// <code>messageTag</code>. If you want to use your own email headers, choose
  /// <code>emailHeader</code>. If you want to use link tags, choose
  /// <code>linkTags</code>.
  @_s.JsonKey(name: 'DimensionValueSource')
  final DimensionValueSource dimensionValueSource;

  CloudWatchDimensionConfiguration({
    @_s.required this.defaultDimensionValue,
    @_s.required this.dimensionName,
    @_s.required this.dimensionValueSource,
  });
  factory CloudWatchDimensionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$CloudWatchDimensionConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CloudWatchDimensionConfigurationToJson(this);
}

/// A contact is the end-user who is receiving the email.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Contact {
  /// The contact's email address.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// A timestamp noting the last time the contact's information was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The default topic preferences applied to the contact.
  @_s.JsonKey(name: 'TopicDefaultPreferences')
  final List<TopicPreference> topicDefaultPreferences;

  /// The contact's preference for being opted-in to or opted-out of a topic.
  @_s.JsonKey(name: 'TopicPreferences')
  final List<TopicPreference> topicPreferences;

  /// A boolean value status noting if the contact is unsubscribed from all
  /// contact list topics.
  @_s.JsonKey(name: 'UnsubscribeAll')
  final bool unsubscribeAll;

  Contact({
    this.emailAddress,
    this.lastUpdatedTimestamp,
    this.topicDefaultPreferences,
    this.topicPreferences,
    this.unsubscribeAll,
  });
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

enum ContactLanguage {
  @_s.JsonValue('EN')
  en,
  @_s.JsonValue('JA')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A list that contains contacts that have subscribed to a particular topic or
/// topics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactList {
  /// The name of the contact list.
  @_s.JsonKey(name: 'ContactListName')
  final String contactListName;

  /// A timestamp noting the last time the contact list was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  ContactList({
    this.contactListName,
    this.lastUpdatedTimestamp,
  });
  factory ContactList.fromJson(Map<String, dynamic> json) =>
      _$ContactListFromJson(json);
}

/// An object that contains details about the action of a contact list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'ContactListImportAction')
  final ContactListImportAction contactListImportAction;

  /// The name of the contact list.
  @_s.JsonKey(name: 'ContactListName')
  final String contactListName;

  ContactListDestination({
    @_s.required this.contactListImportAction,
    @_s.required this.contactListName,
  });
  factory ContactListDestination.fromJson(Map<String, dynamic> json) =>
      _$ContactListDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$ContactListDestinationToJson(this);
}

enum ContactListImportAction {
  @_s.JsonValue('DELETE')
  delete,
  @_s.JsonValue('PUT')
  put,
}

/// An object that represents the content of the email, and optionally a
/// character set specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Content {
  /// The content of the message itself.
  @_s.JsonKey(name: 'Data')
  final String data;

  /// The character set for the content. Because of the constraints of the SMTP
  /// protocol, Amazon SES uses 7-bit ASCII by default. If the text includes
  /// characters outside of the ASCII range, you have to specify a character set.
  /// For example, you could specify <code>UTF-8</code>, <code>ISO-8859-1</code>,
  /// or <code>Shift_JIS</code>.
  @_s.JsonKey(name: 'Charset')
  final String charset;

  Content({
    @_s.required this.data,
    this.charset,
  });
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();
  factory CreateConfigurationSetEventDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateConfigurationSetEventDestinationResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();
  factory CreateConfigurationSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConfigurationSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContactListResponse {
  CreateContactListResponse();
  factory CreateContactListResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateContactListResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContactResponse {
  CreateContactResponse();
  factory CreateContactResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateContactResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCustomVerificationEmailTemplateResponse {
  CreateCustomVerificationEmailTemplateResponse();
  factory CreateCustomVerificationEmailTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCustomVerificationEmailTemplateResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDedicatedIpPoolResponse {
  CreateDedicatedIpPoolResponse();
  factory CreateDedicatedIpPoolResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDedicatedIpPoolResponseFromJson(json);
}

/// Information about the predictive inbox placement test that you created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeliverabilityTestReportResponse {
  /// The status of the predictive inbox placement test. If the status is
  /// <code>IN_PROGRESS</code>, then the predictive inbox placement test is
  /// currently running. Predictive inbox placement tests are usually complete
  /// within 24 hours of creating the test. If the status is
  /// <code>COMPLETE</code>, then the test is finished, and you can use the
  /// <code>GetDeliverabilityTestReport</code> to view the results of the test.
  @_s.JsonKey(name: 'DeliverabilityTestStatus')
  final DeliverabilityTestStatus deliverabilityTestStatus;

  /// A unique string that identifies the predictive inbox placement test.
  @_s.JsonKey(name: 'ReportId')
  final String reportId;

  CreateDeliverabilityTestReportResponse({
    @_s.required this.deliverabilityTestStatus,
    @_s.required this.reportId,
  });
  factory CreateDeliverabilityTestReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDeliverabilityTestReportResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEmailIdentityPolicyResponse {
  CreateEmailIdentityPolicyResponse();
  factory CreateEmailIdentityPolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateEmailIdentityPolicyResponseFromJson(json);
}

/// If the email identity is a domain, this object contains information about
/// the DKIM verification status for the domain.
///
/// If the email identity is an email address, this object is empty.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEmailIdentityResponse {
  /// An object that contains information about the DKIM attributes for the
  /// identity.
  @_s.JsonKey(name: 'DkimAttributes')
  final DkimAttributes dkimAttributes;

  /// The email identity type.
  @_s.JsonKey(name: 'IdentityType')
  final IdentityType identityType;

  /// Specifies whether or not the identity is verified. You can only send email
  /// from verified email addresses or domains. For more information about
  /// verifying identities, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html">Amazon
  /// Pinpoint User Guide</a>.
  @_s.JsonKey(name: 'VerifiedForSendingStatus')
  final bool verifiedForSendingStatus;

  CreateEmailIdentityResponse({
    this.dkimAttributes,
    this.identityType,
    this.verifiedForSendingStatus,
  });
  factory CreateEmailIdentityResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEmailIdentityResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEmailTemplateResponse {
  CreateEmailTemplateResponse();
  factory CreateEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEmailTemplateResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateImportJobResponse {
  /// A string that represents the import job ID.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  CreateImportJobResponse({
    this.jobId,
  });
  factory CreateImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateImportJobResponseFromJson(json);
}

/// Contains information about a custom verification email template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomVerificationEmailTemplateMetadata {
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  @_s.JsonKey(name: 'FailureRedirectionURL')
  final String failureRedirectionURL;

  /// The email address that the custom verification email is sent from.
  @_s.JsonKey(name: 'FromEmailAddress')
  final String fromEmailAddress;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  @_s.JsonKey(name: 'SuccessRedirectionURL')
  final String successRedirectionURL;

  /// The name of the custom verification email template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The subject line of the custom verification email.
  @_s.JsonKey(name: 'TemplateSubject')
  final String templateSubject;

  CustomVerificationEmailTemplateMetadata({
    this.failureRedirectionURL,
    this.fromEmailAddress,
    this.successRedirectionURL,
    this.templateName,
    this.templateSubject,
  });
  factory CustomVerificationEmailTemplateMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$CustomVerificationEmailTemplateMetadataFromJson(json);
}

/// An object that contains information about the volume of email sent on each
/// day of the analysis period.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DailyVolume {
  /// An object that contains inbox placement metrics for a specified day in the
  /// analysis period, broken out by the recipient's email provider.
  @_s.JsonKey(name: 'DomainIspPlacements')
  final List<DomainIspPlacement> domainIspPlacements;

  /// The date that the DailyVolume metrics apply to, in Unix time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDate')
  final DateTime startDate;

  /// An object that contains inbox placement metrics for a specific day in the
  /// analysis period.
  @_s.JsonKey(name: 'VolumeStatistics')
  final VolumeStatistics volumeStatistics;

  DailyVolume({
    this.domainIspPlacements,
    this.startDate,
    this.volumeStatistics,
  });
  factory DailyVolume.fromJson(Map<String, dynamic> json) =>
      _$DailyVolumeFromJson(json);
}

/// The data format of the import job's data source.
enum DataFormat {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('JSON')
  json,
}

/// Contains information about a dedicated IP address that is associated with
/// your Amazon SES account.
///
/// To learn more about requesting dedicated IP addresses, see <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/dedicated-ip-case.html">Requesting
/// and Relinquishing Dedicated IP Addresses</a> in the <i>Amazon SES Developer
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DedicatedIp {
  /// An IPv4 address.
  @_s.JsonKey(name: 'Ip')
  final String ip;

  /// Indicates how complete the dedicated IP warm-up process is. When this value
  /// equals 1, the address has completed the warm-up process and is ready for
  /// use.
  @_s.JsonKey(name: 'WarmupPercentage')
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
  @_s.JsonKey(name: 'WarmupStatus')
  final WarmupStatus warmupStatus;

  /// The name of the dedicated IP pool that the IP address is associated with.
  @_s.JsonKey(name: 'PoolName')
  final String poolName;

  DedicatedIp({
    @_s.required this.ip,
    @_s.required this.warmupPercentage,
    @_s.required this.warmupStatus,
    this.poolName,
  });
  factory DedicatedIp.fromJson(Map<String, dynamic> json) =>
      _$DedicatedIpFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();
  factory DeleteConfigurationSetEventDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteConfigurationSetEventDestinationResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();
  factory DeleteConfigurationSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConfigurationSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteContactListResponse {
  DeleteContactListResponse();
  factory DeleteContactListResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteContactListResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteContactResponse {
  DeleteContactResponse();
  factory DeleteContactResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteContactResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCustomVerificationEmailTemplateResponse {
  DeleteCustomVerificationEmailTemplateResponse();
  factory DeleteCustomVerificationEmailTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteCustomVerificationEmailTemplateResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDedicatedIpPoolResponse {
  DeleteDedicatedIpPoolResponse();
  factory DeleteDedicatedIpPoolResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDedicatedIpPoolResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEmailIdentityPolicyResponse {
  DeleteEmailIdentityPolicyResponse();
  factory DeleteEmailIdentityPolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteEmailIdentityPolicyResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEmailIdentityResponse {
  DeleteEmailIdentityResponse();
  factory DeleteEmailIdentityResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEmailIdentityResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEmailTemplateResponse {
  DeleteEmailTemplateResponse();
  factory DeleteEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEmailTemplateResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSuppressedDestinationResponse {
  DeleteSuppressedDestinationResponse();
  factory DeleteSuppressedDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteSuppressedDestinationResponseFromJson(json);
}

/// The current status of your Deliverability dashboard subscription. If this
/// value is <code>PENDING_EXPIRATION</code>, your subscription is scheduled to
/// expire at the end of the current calendar month.
enum DeliverabilityDashboardAccountStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('PENDING_EXPIRATION')
  pendingExpiration,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// An object that contains metadata related to a predictive inbox placement
/// test.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeliverabilityTestReport {
  /// The date and time when the predictive inbox placement test was created, in
  /// Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The status of the predictive inbox placement test. If the status is
  /// <code>IN_PROGRESS</code>, then the predictive inbox placement test is
  /// currently running. Predictive inbox placement tests are usually complete
  /// within 24 hours of creating the test. If the status is
  /// <code>COMPLETE</code>, then the test is finished, and you can use the
  /// <code>GetDeliverabilityTestReport</code> to view the results of the test.
  @_s.JsonKey(name: 'DeliverabilityTestStatus')
  final DeliverabilityTestStatus deliverabilityTestStatus;

  /// The sender address that you specified for the predictive inbox placement
  /// test.
  @_s.JsonKey(name: 'FromEmailAddress')
  final String fromEmailAddress;

  /// A unique string that identifies the predictive inbox placement test.
  @_s.JsonKey(name: 'ReportId')
  final String reportId;

  /// A name that helps you identify a predictive inbox placement test report.
  @_s.JsonKey(name: 'ReportName')
  final String reportName;

  /// The subject line for an email that you submitted in a predictive inbox
  /// placement test.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  DeliverabilityTestReport({
    this.createDate,
    this.deliverabilityTestStatus,
    this.fromEmailAddress,
    this.reportId,
    this.reportName,
    this.subject,
  });
  factory DeliverabilityTestReport.fromJson(Map<String, dynamic> json) =>
      _$DeliverabilityTestReportFromJson(json);
}

/// The status of a predictive inbox placement test. If the status is
/// <code>IN_PROGRESS</code>, then the predictive inbox placement test is
/// currently running. Predictive inbox placement tests are usually complete
/// within 24 hours of creating the test. If the status is
/// <code>COMPLETE</code>, then the test is finished, and you can use the
/// <code>GetDeliverabilityTestReport</code> operation to view the results of
/// the test.
enum DeliverabilityTestStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
}

/// Used to associate a configuration set with a dedicated IP pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeliveryOptions {
  /// The name of the dedicated IP pool that you want to associate with the
  /// configuration set.
  @_s.JsonKey(name: 'SendingPoolName')
  final String sendingPoolName;

  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS). If the value is <code>Require</code>,
  /// messages are only delivered if a TLS connection can be established. If the
  /// value is <code>Optional</code>, messages can be delivered in plain text if a
  /// TLS connection can't be established.
  @_s.JsonKey(name: 'TlsPolicy')
  final TlsPolicy tlsPolicy;

  DeliveryOptions({
    this.sendingPoolName,
    this.tlsPolicy,
  });
  factory DeliveryOptions.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOptionsToJson(this);
}

/// An object that describes the recipients for an email.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Destination {
  /// An array that contains the email addresses of the "BCC" (blind carbon copy)
  /// recipients for the email.
  @_s.JsonKey(name: 'BccAddresses')
  final List<String> bccAddresses;

  /// An array that contains the email addresses of the "CC" (carbon copy)
  /// recipients for the email.
  @_s.JsonKey(name: 'CcAddresses')
  final List<String> ccAddresses;

  /// An array that contains the email addresses of the "To" recipients for the
  /// email.
  @_s.JsonKey(name: 'ToAddresses')
  final List<String> toAddresses;

  Destination({
    this.bccAddresses,
    this.ccAddresses,
    this.toAddresses,
  });
  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

/// The location where the Amazon SES API v2 finds the value of a dimension to
/// publish to Amazon CloudWatch. If you want to use the message tags that you
/// specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to
/// the <code>SendEmail</code> or <code>SendRawEmail</code> API, choose
/// <code>messageTag</code>. If you want to use your own email headers, choose
/// <code>emailHeader</code>. If you want to use link tags, choose
/// <code>linkTags</code>.
enum DimensionValueSource {
  @_s.JsonValue('MESSAGE_TAG')
  messageTag,
  @_s.JsonValue('EMAIL_HEADER')
  emailHeader,
  @_s.JsonValue('LINK_TAG')
  linkTag,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'SigningAttributesOrigin')
  final DkimSigningAttributesOrigin signingAttributesOrigin;

  /// If the value is <code>true</code>, then the messages that you send from the
  /// identity are signed using DKIM. If the value is <code>false</code>, then the
  /// messages that you send from the identity aren't DKIM-signed.
  @_s.JsonKey(name: 'SigningEnabled')
  final bool signingEnabled;

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
  @_s.JsonKey(name: 'Status')
  final DkimStatus status;

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
  @_s.JsonKey(name: 'Tokens')
  final List<String> tokens;

  DkimAttributes({
    this.signingAttributesOrigin,
    this.signingEnabled,
    this.status,
    this.tokens,
  });
  factory DkimAttributes.fromJson(Map<String, dynamic> json) =>
      _$DkimAttributesFromJson(json);
}

/// An object that contains information about the tokens used for setting up
/// Bring Your Own DKIM (BYODKIM).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DkimSigningAttributes {
  /// A private key that's used to generate a DKIM signature.
  ///
  /// The private key must use 1024-bit RSA encryption, and must be encoded using
  /// base64 encoding.
  @_s.JsonKey(name: 'DomainSigningPrivateKey')
  final String domainSigningPrivateKey;

  /// A string that's used to identify a public key in the DNS configuration for a
  /// domain.
  @_s.JsonKey(name: 'DomainSigningSelector')
  final String domainSigningSelector;

  DkimSigningAttributes({
    @_s.required this.domainSigningPrivateKey,
    @_s.required this.domainSigningSelector,
  });
  Map<String, dynamic> toJson() => _$DkimSigningAttributesToJson(this);
}

enum DkimSigningAttributesOrigin {
  @_s.JsonValue('AWS_SES')
  awsSes,
  @_s.JsonValue('EXTERNAL')
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
    throw Exception('Unknown enum value: $this');
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
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TEMPORARY_FAILURE')
  temporaryFailure,
  @_s.JsonValue('NOT_STARTED')
  notStarted,
}

/// An object that contains the deliverability data for a specific campaign.
/// This data is available for a campaign only if the campaign sent email by
/// using a domain that the Deliverability dashboard is enabled for
/// (<code>PutDeliverabilityDashboardOption</code> operation).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainDeliverabilityCampaign {
  /// The unique identifier for the campaign. The Deliverability dashboard
  /// automatically generates and assigns this identifier to a campaign.
  @_s.JsonKey(name: 'CampaignId')
  final String campaignId;

  /// The percentage of email messages that were deleted by recipients, without
  /// being opened first. Due to technical limitations, this value only includes
  /// recipients who opened the message by using an email client that supports
  /// images.
  @_s.JsonKey(name: 'DeleteRate')
  final double deleteRate;

  /// The major email providers who handled the email message.
  @_s.JsonKey(name: 'Esps')
  final List<String> esps;

  /// The first time, in Unix time format, when the email message was delivered to
  /// any recipient's inbox. This value can help you determine how long it took
  /// for a campaign to deliver an email message.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FirstSeenDateTime')
  final DateTime firstSeenDateTime;

  /// The verified email address that the email message was sent from.
  @_s.JsonKey(name: 'FromAddress')
  final String fromAddress;

  /// The URL of an image that contains a snapshot of the email message that was
  /// sent.
  @_s.JsonKey(name: 'ImageUrl')
  final String imageUrl;

  /// The number of email messages that were delivered to recipients’ inboxes.
  @_s.JsonKey(name: 'InboxCount')
  final int inboxCount;

  /// The last time, in Unix time format, when the email message was delivered to
  /// any recipient's inbox. This value can help you determine how long it took
  /// for a campaign to deliver an email message.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastSeenDateTime')
  final DateTime lastSeenDateTime;

  /// The projected number of recipients that the email message was sent to.
  @_s.JsonKey(name: 'ProjectedVolume')
  final int projectedVolume;

  /// The percentage of email messages that were opened and then deleted by
  /// recipients. Due to technical limitations, this value only includes
  /// recipients who opened the message by using an email client that supports
  /// images.
  @_s.JsonKey(name: 'ReadDeleteRate')
  final double readDeleteRate;

  /// The percentage of email messages that were opened by recipients. Due to
  /// technical limitations, this value only includes recipients who opened the
  /// message by using an email client that supports images.
  @_s.JsonKey(name: 'ReadRate')
  final double readRate;

  /// The IP addresses that were used to send the email message.
  @_s.JsonKey(name: 'SendingIps')
  final List<String> sendingIps;

  /// The number of email messages that were delivered to recipients' spam or junk
  /// mail folders.
  @_s.JsonKey(name: 'SpamCount')
  final int spamCount;

  /// The subject line, or title, of the email message.
  @_s.JsonKey(name: 'Subject')
  final String subject;

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
  factory DomainDeliverabilityCampaign.fromJson(Map<String, dynamic> json) =>
      _$DomainDeliverabilityCampaignFromJson(json);
}

/// An object that contains information about the Deliverability dashboard
/// subscription for a verified domain that you use to send email and currently
/// has an active Deliverability dashboard subscription. If a Deliverability
/// dashboard subscription is active for a domain, you gain access to
/// reputation, inbox placement, and other metrics for the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DomainDeliverabilityTrackingOption {
  /// A verified domain that’s associated with your AWS account and currently has
  /// an active Deliverability dashboard subscription.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// An object that contains information about the inbox placement data settings
  /// for the domain.
  @_s.JsonKey(name: 'InboxPlacementTrackingOption')
  final InboxPlacementTrackingOption inboxPlacementTrackingOption;

  /// The date, in Unix time format, when you enabled the Deliverability dashboard
  /// for the domain.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubscriptionStartDate')
  final DateTime subscriptionStartDate;

  DomainDeliverabilityTrackingOption({
    this.domain,
    this.inboxPlacementTrackingOption,
    this.subscriptionStartDate,
  });
  factory DomainDeliverabilityTrackingOption.fromJson(
          Map<String, dynamic> json) =>
      _$DomainDeliverabilityTrackingOptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DomainDeliverabilityTrackingOptionToJson(this);
}

/// An object that contains inbox placement data for email sent from one of your
/// email domains to a specific email provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainIspPlacement {
  /// The percentage of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' inboxes.
  @_s.JsonKey(name: 'InboxPercentage')
  final double inboxPercentage;

  /// The total number of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' inboxes.
  @_s.JsonKey(name: 'InboxRawCount')
  final int inboxRawCount;

  /// The name of the email provider that the inbox placement data applies to.
  @_s.JsonKey(name: 'IspName')
  final String ispName;

  /// The percentage of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' spam or junk mail
  /// folders.
  @_s.JsonKey(name: 'SpamPercentage')
  final double spamPercentage;

  /// The total number of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' spam or junk mail
  /// folders.
  @_s.JsonKey(name: 'SpamRawCount')
  final int spamRawCount;

  DomainIspPlacement({
    this.inboxPercentage,
    this.inboxRawCount,
    this.ispName,
    this.spamPercentage,
    this.spamRawCount,
  });
  factory DomainIspPlacement.fromJson(Map<String, dynamic> json) =>
      _$DomainIspPlacementFromJson(json);
}

/// An object that defines the entire content of the email, including the
/// message headers and the body content. You can create a simple email message,
/// in which you specify the subject and the text and HTML versions of the
/// message body. You can also create raw messages, in which you specify a
/// complete MIME-formatted message. Raw messages can include attachments and
/// custom headers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Raw')
  final RawMessage raw;

  /// The simple email message. The message consists of a subject and a message
  /// body.
  @_s.JsonKey(name: 'Simple')
  final Message simple;

  /// The template to use for the email message.
  @_s.JsonKey(name: 'Template')
  final Template template;

  EmailContent({
    this.raw,
    this.simple,
    this.template,
  });
  Map<String, dynamic> toJson() => _$EmailContentToJson(this);
}

/// The content of the email, composed of a subject line, an HTML part, and a
/// text-only part.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmailTemplateContent {
  /// The HTML body of the email.
  @_s.JsonKey(name: 'Html')
  final String html;

  /// The subject line of the email.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  /// The email body that will be visible to recipients whose email clients do not
  /// display HTML.
  @_s.JsonKey(name: 'Text')
  final String text;

  EmailTemplateContent({
    this.html,
    this.subject,
    this.text,
  });
  factory EmailTemplateContent.fromJson(Map<String, dynamic> json) =>
      _$EmailTemplateContentFromJson(json);

  Map<String, dynamic> toJson() => _$EmailTemplateContentToJson(this);
}

/// Contains information about an email template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EmailTemplateMetadata {
  /// The time and date the template was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The name of the template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  EmailTemplateMetadata({
    this.createdTimestamp,
    this.templateName,
  });
  factory EmailTemplateMetadata.fromJson(Map<String, dynamic> json) =>
      _$EmailTemplateMetadataFromJson(json);
}

/// In the Amazon SES API v2, <i>events</i> include message sends, deliveries,
/// opens, clicks, bounces, complaints and delivery delays. <i>Event
/// destinations</i> are places that you can send information about these events
/// to. For example, you can send event data to Amazon SNS to receive
/// notifications when you receive bounces or complaints, or you can use Amazon
/// Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventDestination {
  /// The types of events that Amazon SES sends to the specified event
  /// destinations.
  @_s.JsonKey(name: 'MatchingEventTypes')
  final List<EventType> matchingEventTypes;

  /// A name that identifies the event destination.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An object that defines an Amazon CloudWatch destination for email events.
  /// You can use Amazon CloudWatch to monitor and gain insights on your email
  /// sending metrics.
  @_s.JsonKey(name: 'CloudWatchDestination')
  final CloudWatchDestination cloudWatchDestination;

  /// If <code>true</code>, the event destination is enabled. When the event
  /// destination is enabled, the specified event types are sent to the
  /// destinations in this <code>EventDestinationDefinition</code>.
  ///
  /// If <code>false</code>, the event destination is disabled. When the event
  /// destination is disabled, events aren't sent to the specified destinations.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// An object that defines an Amazon Kinesis Data Firehose destination for email
  /// events. You can use Amazon Kinesis Data Firehose to stream data to other
  /// services, such as Amazon S3 and Amazon Redshift.
  @_s.JsonKey(name: 'KinesisFirehoseDestination')
  final KinesisFirehoseDestination kinesisFirehoseDestination;

  /// An object that defines an Amazon Pinpoint project destination for email
  /// events. You can send email event data to a Amazon Pinpoint project to view
  /// metrics using the Transactional Messaging dashboards that are built in to
  /// Amazon Pinpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional
  /// Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.
  @_s.JsonKey(name: 'PinpointDestination')
  final PinpointDestination pinpointDestination;

  /// An object that defines an Amazon SNS destination for email events. You can
  /// use Amazon SNS to send notification when certain email events occur.
  @_s.JsonKey(name: 'SnsDestination')
  final SnsDestination snsDestination;

  EventDestination({
    @_s.required this.matchingEventTypes,
    @_s.required this.name,
    this.cloudWatchDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.pinpointDestination,
    this.snsDestination,
  });
  factory EventDestination.fromJson(Map<String, dynamic> json) =>
      _$EventDestinationFromJson(json);
}

/// An object that defines the event destination. Specifically, it defines which
/// services receive events from emails sent using the configuration set that
/// the event destination is associated with. Also defines the types of events
/// that are sent to the event destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventDestinationDefinition {
  /// An object that defines an Amazon CloudWatch destination for email events.
  /// You can use Amazon CloudWatch to monitor and gain insights on your email
  /// sending metrics.
  @_s.JsonKey(name: 'CloudWatchDestination')
  final CloudWatchDestination cloudWatchDestination;

  /// If <code>true</code>, the event destination is enabled. When the event
  /// destination is enabled, the specified event types are sent to the
  /// destinations in this <code>EventDestinationDefinition</code>.
  ///
  /// If <code>false</code>, the event destination is disabled. When the event
  /// destination is disabled, events aren't sent to the specified destinations.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// An object that defines an Amazon Kinesis Data Firehose destination for email
  /// events. You can use Amazon Kinesis Data Firehose to stream data to other
  /// services, such as Amazon S3 and Amazon Redshift.
  @_s.JsonKey(name: 'KinesisFirehoseDestination')
  final KinesisFirehoseDestination kinesisFirehoseDestination;

  /// An array that specifies which events the Amazon SES API v2 should send to
  /// the destinations in this <code>EventDestinationDefinition</code>.
  @_s.JsonKey(name: 'MatchingEventTypes')
  final List<EventType> matchingEventTypes;

  /// An object that defines an Amazon Pinpoint project destination for email
  /// events. You can send email event data to a Amazon Pinpoint project to view
  /// metrics using the Transactional Messaging dashboards that are built in to
  /// Amazon Pinpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional
  /// Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.
  @_s.JsonKey(name: 'PinpointDestination')
  final PinpointDestination pinpointDestination;

  /// An object that defines an Amazon SNS destination for email events. You can
  /// use Amazon SNS to send notification when certain email events occur.
  @_s.JsonKey(name: 'SnsDestination')
  final SnsDestination snsDestination;

  EventDestinationDefinition({
    this.cloudWatchDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.pinpointDestination,
    this.snsDestination,
  });
  Map<String, dynamic> toJson() => _$EventDestinationDefinitionToJson(this);
}

/// An email sending event type. For example, email sends, opens, and bounces
/// are all email events.
enum EventType {
  @_s.JsonValue('SEND')
  send,
  @_s.JsonValue('REJECT')
  reject,
  @_s.JsonValue('BOUNCE')
  bounce,
  @_s.JsonValue('COMPLAINT')
  complaint,
  @_s.JsonValue('DELIVERY')
  delivery,
  @_s.JsonValue('OPEN')
  open,
  @_s.JsonValue('CLICK')
  click,
  @_s.JsonValue('RENDERING_FAILURE')
  renderingFailure,
  @_s.JsonValue('DELIVERY_DELAY')
  deliveryDelay,
  @_s.JsonValue('SUBSCRIPTION')
  subscription,
}

/// An object that contains the failure details about an import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailureInfo {
  /// A message about why the import job failed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// An Amazon S3 presigned URL that contains all the failed records and related
  /// information.
  @_s.JsonKey(name: 'FailedRecordsS3Url')
  final String failedRecordsS3Url;

  FailureInfo({
    this.errorMessage,
    this.failedRecordsS3Url,
  });
  factory FailureInfo.fromJson(Map<String, dynamic> json) =>
      _$FailureInfoFromJson(json);
}

/// A list of details about the email-sending capabilities of your Amazon SES
/// account in the current AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccountResponse {
  /// Indicates whether or not the automatic warm-up feature is enabled for
  /// dedicated IP addresses that are associated with your account.
  @_s.JsonKey(name: 'DedicatedIpAutoWarmupEnabled')
  final bool dedicatedIpAutoWarmupEnabled;

  /// An object that defines your account details.
  @_s.JsonKey(name: 'Details')
  final AccountDetails details;

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
  @_s.JsonKey(name: 'EnforcementStatus')
  final String enforcementStatus;

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
  @_s.JsonKey(name: 'ProductionAccessEnabled')
  final bool productionAccessEnabled;

  /// An object that contains information about the per-day and per-second sending
  /// limits for your Amazon SES account in the current AWS Region.
  @_s.JsonKey(name: 'SendQuota')
  final SendQuota sendQuota;

  /// Indicates whether or not email sending is enabled for your Amazon SES
  /// account in the current AWS Region.
  @_s.JsonKey(name: 'SendingEnabled')
  final bool sendingEnabled;

  /// An object that contains information about the email address suppression
  /// preferences for your account in the current AWS Region.
  @_s.JsonKey(name: 'SuppressionAttributes')
  final SuppressionAttributes suppressionAttributes;

  GetAccountResponse({
    this.dedicatedIpAutoWarmupEnabled,
    this.details,
    this.enforcementStatus,
    this.productionAccessEnabled,
    this.sendQuota,
    this.sendingEnabled,
    this.suppressionAttributes,
  });
  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);
}

/// An object that contains information about blacklist events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBlacklistReportsResponse {
  /// An object that contains information about a blacklist that one of your
  /// dedicated IP addresses appears on.
  @_s.JsonKey(name: 'BlacklistReport')
  final Map<String, List<BlacklistEntry>> blacklistReport;

  GetBlacklistReportsResponse({
    @_s.required this.blacklistReport,
  });
  factory GetBlacklistReportsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBlacklistReportsResponseFromJson(json);
}

/// Information about an event destination for a configuration set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConfigurationSetEventDestinationsResponse {
  /// An array that includes all of the events destinations that have been
  /// configured for the configuration set.
  @_s.JsonKey(name: 'EventDestinations')
  final List<EventDestination> eventDestinations;

  GetConfigurationSetEventDestinationsResponse({
    this.eventDestinations,
  });
  factory GetConfigurationSetEventDestinationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetConfigurationSetEventDestinationsResponseFromJson(json);
}

/// Information about a configuration set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConfigurationSetResponse {
  /// The name of the configuration set.
  @_s.JsonKey(name: 'ConfigurationSetName')
  final String configurationSetName;

  /// An object that defines the dedicated IP pool that is used to send emails
  /// that you send using the configuration set.
  @_s.JsonKey(name: 'DeliveryOptions')
  final DeliveryOptions deliveryOptions;

  /// An object that defines whether or not Amazon SES collects reputation metrics
  /// for the emails that you send that use the configuration set.
  @_s.JsonKey(name: 'ReputationOptions')
  final ReputationOptions reputationOptions;

  /// An object that defines whether or not Amazon SES can send email that you
  /// send using the configuration set.
  @_s.JsonKey(name: 'SendingOptions')
  final SendingOptions sendingOptions;

  /// An object that contains information about the suppression list preferences
  /// for your account.
  @_s.JsonKey(name: 'SuppressionOptions')
  final SuppressionOptions suppressionOptions;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the configuration set.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// An object that defines the open and click tracking options for emails that
  /// you send using the configuration set.
  @_s.JsonKey(name: 'TrackingOptions')
  final TrackingOptions trackingOptions;

  GetConfigurationSetResponse({
    this.configurationSetName,
    this.deliveryOptions,
    this.reputationOptions,
    this.sendingOptions,
    this.suppressionOptions,
    this.tags,
    this.trackingOptions,
  });
  factory GetConfigurationSetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConfigurationSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContactListResponse {
  /// The name of the contact list.
  @_s.JsonKey(name: 'ContactListName')
  final String contactListName;

  /// A timestamp noting when the contact list was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// A description of what the contact list is about.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A timestamp noting the last time the contact list was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The tags associated with a contact list.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// An interest group, theme, or label within a list. A contact list can have
  /// multiple topics.
  @_s.JsonKey(name: 'Topics')
  final List<Topic> topics;

  GetContactListResponse({
    this.contactListName,
    this.createdTimestamp,
    this.description,
    this.lastUpdatedTimestamp,
    this.tags,
    this.topics,
  });
  factory GetContactListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContactListResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContactResponse {
  /// The attribute data attached to a contact.
  @_s.JsonKey(name: 'AttributesData')
  final String attributesData;

  /// The name of the contact list to which the contact belongs.
  @_s.JsonKey(name: 'ContactListName')
  final String contactListName;

  /// A timestamp noting when the contact was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The contact's email addres.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// A timestamp noting the last time the contact's information was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The default topic preferences applied to the contact.
  @_s.JsonKey(name: 'TopicDefaultPreferences')
  final List<TopicPreference> topicDefaultPreferences;

  /// The contact's preference for being opted-in to or opted-out of a topic.&gt;
  @_s.JsonKey(name: 'TopicPreferences')
  final List<TopicPreference> topicPreferences;

  /// A boolean value status noting if the contact is unsubscribed from all
  /// contact list topics.
  @_s.JsonKey(name: 'UnsubscribeAll')
  final bool unsubscribeAll;

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
  factory GetContactResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContactResponseFromJson(json);
}

/// The following elements are returned by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCustomVerificationEmailTemplateResponse {
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  @_s.JsonKey(name: 'FailureRedirectionURL')
  final String failureRedirectionURL;

  /// The email address that the custom verification email is sent from.
  @_s.JsonKey(name: 'FromEmailAddress')
  final String fromEmailAddress;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  @_s.JsonKey(name: 'SuccessRedirectionURL')
  final String successRedirectionURL;

  /// The content of the custom verification email.
  @_s.JsonKey(name: 'TemplateContent')
  final String templateContent;

  /// The name of the custom verification email template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The subject line of the custom verification email.
  @_s.JsonKey(name: 'TemplateSubject')
  final String templateSubject;

  GetCustomVerificationEmailTemplateResponse({
    this.failureRedirectionURL,
    this.fromEmailAddress,
    this.successRedirectionURL,
    this.templateContent,
    this.templateName,
    this.templateSubject,
  });
  factory GetCustomVerificationEmailTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCustomVerificationEmailTemplateResponseFromJson(json);
}

/// Information about a dedicated IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDedicatedIpResponse {
  /// An object that contains information about a dedicated IP address.
  @_s.JsonKey(name: 'DedicatedIp')
  final DedicatedIp dedicatedIp;

  GetDedicatedIpResponse({
    this.dedicatedIp,
  });
  factory GetDedicatedIpResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDedicatedIpResponseFromJson(json);
}

/// Information about the dedicated IP addresses that are associated with your
/// AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDedicatedIpsResponse {
  /// A list of dedicated IP addresses that are associated with your AWS account.
  @_s.JsonKey(name: 'DedicatedIps')
  final List<DedicatedIp> dedicatedIps;

  /// A token that indicates that there are additional dedicated IP addresses to
  /// list. To view additional addresses, issue another request to
  /// <code>GetDedicatedIps</code>, passing this token in the
  /// <code>NextToken</code> parameter.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetDedicatedIpsResponse({
    this.dedicatedIps,
    this.nextToken,
  });
  factory GetDedicatedIpsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDedicatedIpsResponseFromJson(json);
}

/// An object that shows the status of the Deliverability dashboard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeliverabilityDashboardOptionsResponse {
  /// Specifies whether the Deliverability dashboard is enabled. If this value is
  /// <code>true</code>, the dashboard is enabled.
  @_s.JsonKey(name: 'DashboardEnabled')
  final bool dashboardEnabled;

  /// The current status of your Deliverability dashboard subscription. If this
  /// value is <code>PENDING_EXPIRATION</code>, your subscription is scheduled to
  /// expire at the end of the current calendar month.
  @_s.JsonKey(name: 'AccountStatus')
  final DeliverabilityDashboardAccountStatus accountStatus;

  /// An array of objects, one for each verified domain that you use to send email
  /// and currently has an active Deliverability dashboard subscription that isn’t
  /// scheduled to expire at the end of the current calendar month.
  @_s.JsonKey(name: 'ActiveSubscribedDomains')
  final List<DomainDeliverabilityTrackingOption> activeSubscribedDomains;

  /// An array of objects, one for each verified domain that you use to send email
  /// and currently has an active Deliverability dashboard subscription that's
  /// scheduled to expire at the end of the current calendar month.
  @_s.JsonKey(name: 'PendingExpirationSubscribedDomains')
  final List<DomainDeliverabilityTrackingOption>
      pendingExpirationSubscribedDomains;

  /// The date, in Unix time format, when your current subscription to the
  /// Deliverability dashboard is scheduled to expire, if your subscription is
  /// scheduled to expire at the end of the current calendar month. This value is
  /// null if you have an active subscription that isn’t due to expire at the end
  /// of the month.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubscriptionExpiryDate')
  final DateTime subscriptionExpiryDate;

  GetDeliverabilityDashboardOptionsResponse({
    @_s.required this.dashboardEnabled,
    this.accountStatus,
    this.activeSubscribedDomains,
    this.pendingExpirationSubscribedDomains,
    this.subscriptionExpiryDate,
  });
  factory GetDeliverabilityDashboardOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDeliverabilityDashboardOptionsResponseFromJson(json);
}

/// The results of the predictive inbox placement test.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeliverabilityTestReportResponse {
  /// An object that contains the results of the predictive inbox placement test.
  @_s.JsonKey(name: 'DeliverabilityTestReport')
  final DeliverabilityTestReport deliverabilityTestReport;

  /// An object that describes how the test email was handled by several email
  /// providers, including Gmail, Hotmail, Yahoo, AOL, and others.
  @_s.JsonKey(name: 'IspPlacements')
  final List<IspPlacement> ispPlacements;

  /// An object that specifies how many test messages that were sent during the
  /// predictive inbox placement test were delivered to recipients' inboxes, how
  /// many were sent to recipients' spam folders, and how many weren't delivered.
  @_s.JsonKey(name: 'OverallPlacement')
  final PlacementStatistics overallPlacement;

  /// An object that contains the message that you sent when you performed this
  /// predictive inbox placement test.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the predictive inbox placement test.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  GetDeliverabilityTestReportResponse({
    @_s.required this.deliverabilityTestReport,
    @_s.required this.ispPlacements,
    @_s.required this.overallPlacement,
    this.message,
    this.tags,
  });
  factory GetDeliverabilityTestReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDeliverabilityTestReportResponseFromJson(json);
}

/// An object that contains all the deliverability data for a specific campaign.
/// This data is available for a campaign only if the campaign sent email by
/// using a domain that the Deliverability dashboard is enabled for.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainDeliverabilityCampaignResponse {
  /// An object that contains the deliverability data for the campaign.
  @_s.JsonKey(name: 'DomainDeliverabilityCampaign')
  final DomainDeliverabilityCampaign domainDeliverabilityCampaign;

  GetDomainDeliverabilityCampaignResponse({
    @_s.required this.domainDeliverabilityCampaign,
  });
  factory GetDomainDeliverabilityCampaignResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDomainDeliverabilityCampaignResponseFromJson(json);
}

/// An object that includes statistics that are related to the domain that you
/// specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainStatisticsReportResponse {
  /// An object that contains deliverability metrics for the domain that you
  /// specified. This object contains data for each day, starting on the
  /// <code>StartDate</code> and ending on the <code>EndDate</code>.
  @_s.JsonKey(name: 'DailyVolumes')
  final List<DailyVolume> dailyVolumes;

  /// An object that contains deliverability metrics for the domain that you
  /// specified. The data in this object is a summary of all of the data that was
  /// collected from the <code>StartDate</code> to the <code>EndDate</code>.
  @_s.JsonKey(name: 'OverallVolume')
  final OverallVolume overallVolume;

  GetDomainStatisticsReportResponse({
    @_s.required this.dailyVolumes,
    @_s.required this.overallVolume,
  });
  factory GetDomainStatisticsReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDomainStatisticsReportResponseFromJson(json);
}

/// Identity policies associated with email identity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEmailIdentityPoliciesResponse {
  /// A map of policy names to policies.
  @_s.JsonKey(name: 'Policies')
  final Map<String, String> policies;

  GetEmailIdentityPoliciesResponse({
    this.policies,
  });
  factory GetEmailIdentityPoliciesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetEmailIdentityPoliciesResponseFromJson(json);
}

/// Details about an email identity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEmailIdentityResponse {
  /// An object that contains information about the DKIM attributes for the
  /// identity.
  @_s.JsonKey(name: 'DkimAttributes')
  final DkimAttributes dkimAttributes;

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
  @_s.JsonKey(name: 'FeedbackForwardingStatus')
  final bool feedbackForwardingStatus;

  /// The email identity type.
  @_s.JsonKey(name: 'IdentityType')
  final IdentityType identityType;

  /// An object that contains information about the Mail-From attributes for the
  /// email identity.
  @_s.JsonKey(name: 'MailFromAttributes')
  final MailFromAttributes mailFromAttributes;

  /// A map of policy names to policies.
  @_s.JsonKey(name: 'Policies')
  final Map<String, String> policies;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the email identity.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// Specifies whether or not the identity is verified. You can only send email
  /// from verified email addresses or domains. For more information about
  /// verifying identities, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html">Amazon
  /// Pinpoint User Guide</a>.
  @_s.JsonKey(name: 'VerifiedForSendingStatus')
  final bool verifiedForSendingStatus;

  GetEmailIdentityResponse({
    this.dkimAttributes,
    this.feedbackForwardingStatus,
    this.identityType,
    this.mailFromAttributes,
    this.policies,
    this.tags,
    this.verifiedForSendingStatus,
  });
  factory GetEmailIdentityResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEmailIdentityResponseFromJson(json);
}

/// The following element is returned by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEmailTemplateResponse {
  /// The content of the email template, composed of a subject line, an HTML part,
  /// and a text-only part.
  @_s.JsonKey(name: 'TemplateContent')
  final EmailTemplateContent templateContent;

  /// The name of the template you want to retrieve.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  GetEmailTemplateResponse({
    @_s.required this.templateContent,
    @_s.required this.templateName,
  });
  factory GetEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEmailTemplateResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImportJobResponse {
  /// The time stamp of when the import job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletedTimestamp')
  final DateTime completedTimestamp;

  /// The time stamp of when the import job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The number of records that failed processing because of invalid input or
  /// other reasons.
  @_s.JsonKey(name: 'FailedRecordsCount')
  final int failedRecordsCount;

  /// The failure details about an import job.
  @_s.JsonKey(name: 'FailureInfo')
  final FailureInfo failureInfo;

  /// The data source of the import job.
  @_s.JsonKey(name: 'ImportDataSource')
  final ImportDataSource importDataSource;

  /// The destination of the import job.
  @_s.JsonKey(name: 'ImportDestination')
  final ImportDestination importDestination;

  /// A string that represents the import job ID.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The status of the import job.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The current number of records processed.
  @_s.JsonKey(name: 'ProcessedRecordsCount')
  final int processedRecordsCount;

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
  factory GetImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImportJobResponseFromJson(json);
}

/// Information about the suppressed email address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSuppressedDestinationResponse {
  /// An object containing information about the suppressed email address.
  @_s.JsonKey(name: 'SuppressedDestination')
  final SuppressedDestination suppressedDestination;

  GetSuppressedDestinationResponse({
    @_s.required this.suppressedDestination,
  });
  factory GetSuppressedDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSuppressedDestinationResponseFromJson(json);
}

/// Information about an email identity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdentityInfo {
  /// The address or domain of the identity.
  @_s.JsonKey(name: 'IdentityName')
  final String identityName;

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
  @_s.JsonKey(name: 'IdentityType')
  final IdentityType identityType;

  /// Indicates whether or not you can send email from the identity.
  ///
  /// An <i>identity</i> is an email address or domain that you send email from.
  /// Before you can send email from an identity, you have to demostrate that you
  /// own the identity, and that you authorize Amazon SES to send email from that
  /// identity.
  @_s.JsonKey(name: 'SendingEnabled')
  final bool sendingEnabled;

  IdentityInfo({
    this.identityName,
    this.identityType,
    this.sendingEnabled,
  });
  factory IdentityInfo.fromJson(Map<String, dynamic> json) =>
      _$IdentityInfoFromJson(json);
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
  @_s.JsonValue('EMAIL_ADDRESS')
  emailAddress,
  @_s.JsonValue('DOMAIN')
  domain,
  @_s.JsonValue('MANAGED_DOMAIN')
  managedDomain,
}

/// An object that contains details about the data source of the import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImportDataSource {
  /// The data format of the import job's data source.
  @_s.JsonKey(name: 'DataFormat')
  final DataFormat dataFormat;

  /// An Amazon S3 URL in the format
  /// s3://<i>&lt;bucket_name&gt;</i>/<i>&lt;object&gt;</i>.
  @_s.JsonKey(name: 'S3Url')
  final String s3Url;

  ImportDataSource({
    @_s.required this.dataFormat,
    @_s.required this.s3Url,
  });
  factory ImportDataSource.fromJson(Map<String, dynamic> json) =>
      _$ImportDataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ImportDataSourceToJson(this);
}

/// An object that contains details about the resource destination the import
/// job is going to target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImportDestination {
  /// An object that contains the action of the import job towards a contact list.
  @_s.JsonKey(name: 'ContactListDestination')
  final ContactListDestination contactListDestination;

  /// An object that contains the action of the import job towards suppression
  /// list.
  @_s.JsonKey(name: 'SuppressionListDestination')
  final SuppressionListDestination suppressionListDestination;

  ImportDestination({
    this.contactListDestination,
    this.suppressionListDestination,
  });
  factory ImportDestination.fromJson(Map<String, dynamic> json) =>
      _$ImportDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$ImportDestinationToJson(this);
}

/// The destination of the import job, which can be used to list import jobs
/// that have a certain <code>ImportDestinationType</code>.
enum ImportDestinationType {
  @_s.JsonValue('SUPPRESSION_LIST')
  suppressionList,
  @_s.JsonValue('CONTACT_LIST')
  contactList,
}

/// A summary of the import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportJobSummary {
  /// The date and time when the import job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;
  @_s.JsonKey(name: 'ImportDestination')
  final ImportDestination importDestination;
  @_s.JsonKey(name: 'JobId')
  final String jobId;
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  ImportJobSummary({
    this.createdTimestamp,
    this.importDestination,
    this.jobId,
    this.jobStatus,
  });
  factory ImportJobSummary.fromJson(Map<String, dynamic> json) =>
      _$ImportJobSummaryFromJson(json);
}

/// An object that contains information about the inbox placement data settings
/// for a verified domain that’s associated with your AWS account. This data is
/// available only if you enabled the Deliverability dashboard for the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InboxPlacementTrackingOption {
  /// Specifies whether inbox placement data is being tracked for the domain.
  @_s.JsonKey(name: 'Global')
  final bool global;

  /// An array of strings, one for each major email provider that the inbox
  /// placement data applies to.
  @_s.JsonKey(name: 'TrackedIsps')
  final List<String> trackedIsps;

  InboxPlacementTrackingOption({
    this.global,
    this.trackedIsps,
  });
  factory InboxPlacementTrackingOption.fromJson(Map<String, dynamic> json) =>
      _$InboxPlacementTrackingOptionFromJson(json);

  Map<String, dynamic> toJson() => _$InboxPlacementTrackingOptionToJson(this);
}

/// An object that describes how email sent during the predictive inbox
/// placement test was handled by a certain email provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IspPlacement {
  /// The name of the email provider that the inbox placement data applies to.
  @_s.JsonKey(name: 'IspName')
  final String ispName;

  /// An object that contains inbox placement metrics for a specific email
  /// provider.
  @_s.JsonKey(name: 'PlacementStatistics')
  final PlacementStatistics placementStatistics;

  IspPlacement({
    this.ispName,
    this.placementStatistics,
  });
  factory IspPlacement.fromJson(Map<String, dynamic> json) =>
      _$IspPlacementFromJson(json);
}

/// The status of the import job.
enum JobStatus {
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('PROCESSING')
  processing,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

/// An object that defines an Amazon Kinesis Data Firehose destination for email
/// events. You can use Amazon Kinesis Data Firehose to stream data to other
/// services, such as Amazon S3 and Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose stream
  /// that the Amazon SES API v2 sends email events to.
  @_s.JsonKey(name: 'DeliveryStreamArn')
  final String deliveryStreamArn;

  /// The Amazon Resource Name (ARN) of the IAM role that the Amazon SES API v2
  /// uses to send email events to the Amazon Kinesis Data Firehose stream.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  KinesisFirehoseDestination({
    @_s.required this.deliveryStreamArn,
    @_s.required this.iamRoleArn,
  });
  factory KinesisFirehoseDestination.fromJson(Map<String, dynamic> json) =>
      _$KinesisFirehoseDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisFirehoseDestinationToJson(this);
}

/// A list of configuration sets in your Amazon SES account in the current AWS
/// Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigurationSetsResponse {
  /// An array that contains all of the configuration sets in your Amazon SES
  /// account in the current AWS Region.
  @_s.JsonKey(name: 'ConfigurationSets')
  final List<String> configurationSets;

  /// A token that indicates that there are additional configuration sets to list.
  /// To view additional configuration sets, issue another request to
  /// <code>ListConfigurationSets</code>, and pass this token in the
  /// <code>NextToken</code> parameter.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });
  factory ListConfigurationSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListConfigurationSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListContactListsResponse {
  /// The available contact lists.
  @_s.JsonKey(name: 'ContactLists')
  final List<ContactList> contactLists;

  /// A string token indicating that there might be additional contact lists
  /// available to be listed. Copy this token to a subsequent call to
  /// <code>ListContactLists</code> with the same parameters to retrieve the next
  /// page of contact lists.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListContactListsResponse({
    this.contactLists,
    this.nextToken,
  });
  factory ListContactListsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListContactListsResponseFromJson(json);
}

/// A filter that can be applied to a list of contacts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListContactsFilter {
  /// The status by which you are filtering: <code>OPT_IN</code> or
  /// <code>OPT_OUT</code>.
  @_s.JsonKey(name: 'FilteredStatus')
  final SubscriptionStatus filteredStatus;

  /// Used for filtering by a specific topic preference.
  @_s.JsonKey(name: 'TopicFilter')
  final TopicFilter topicFilter;

  ListContactsFilter({
    this.filteredStatus,
    this.topicFilter,
  });
  Map<String, dynamic> toJson() => _$ListContactsFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListContactsResponse {
  /// The contacts present in a specific contact list.
  @_s.JsonKey(name: 'Contacts')
  final List<Contact> contacts;

  /// A string token indicating that there might be additional contacts available
  /// to be listed. Copy this token to a subsequent call to
  /// <code>ListContacts</code> with the same parameters to retrieve the next page
  /// of contacts.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListContactsResponse({
    this.contacts,
    this.nextToken,
  });
  factory ListContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListContactsResponseFromJson(json);
}

/// The following elements are returned by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCustomVerificationEmailTemplatesResponse {
  /// A list of the custom verification email templates that exist in your
  /// account.
  @_s.JsonKey(name: 'CustomVerificationEmailTemplates')
  final List<CustomVerificationEmailTemplateMetadata>
      customVerificationEmailTemplates;

  /// A token indicating that there are additional custom verification email
  /// templates available to be listed. Pass this token to a subsequent call to
  /// <code>ListCustomVerificationEmailTemplates</code> to retrieve the next 50
  /// custom verification email templates.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCustomVerificationEmailTemplatesResponse({
    this.customVerificationEmailTemplates,
    this.nextToken,
  });
  factory ListCustomVerificationEmailTemplatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCustomVerificationEmailTemplatesResponseFromJson(json);
}

/// A list of dedicated IP pools.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDedicatedIpPoolsResponse {
  /// A list of all of the dedicated IP pools that are associated with your AWS
  /// account in the current Region.
  @_s.JsonKey(name: 'DedicatedIpPools')
  final List<String> dedicatedIpPools;

  /// A token that indicates that there are additional IP pools to list. To view
  /// additional IP pools, issue another request to
  /// <code>ListDedicatedIpPools</code>, passing this token in the
  /// <code>NextToken</code> parameter.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDedicatedIpPoolsResponse({
    this.dedicatedIpPools,
    this.nextToken,
  });
  factory ListDedicatedIpPoolsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDedicatedIpPoolsResponseFromJson(json);
}

/// A list of the predictive inbox placement test reports that are available for
/// your account, regardless of whether or not those tests are complete.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeliverabilityTestReportsResponse {
  /// An object that contains a lists of predictive inbox placement tests that
  /// you've performed.
  @_s.JsonKey(name: 'DeliverabilityTestReports')
  final List<DeliverabilityTestReport> deliverabilityTestReports;

  /// A token that indicates that there are additional predictive inbox placement
  /// tests to list. To view additional predictive inbox placement tests, issue
  /// another request to <code>ListDeliverabilityTestReports</code>, and pass this
  /// token in the <code>NextToken</code> parameter.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDeliverabilityTestReportsResponse({
    @_s.required this.deliverabilityTestReports,
    this.nextToken,
  });
  factory ListDeliverabilityTestReportsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDeliverabilityTestReportsResponseFromJson(json);
}

/// An array of objects that provide deliverability data for all the campaigns
/// that used a specific domain to send email during a specified time range.
/// This data is available for a domain only if you enabled the Deliverability
/// dashboard for the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainDeliverabilityCampaignsResponse {
  /// An array of responses, one for each campaign that used the domain to send
  /// email during the specified time range.
  @_s.JsonKey(name: 'DomainDeliverabilityCampaigns')
  final List<DomainDeliverabilityCampaign> domainDeliverabilityCampaigns;

  /// A token that’s returned from a previous call to the
  /// <code>ListDomainDeliverabilityCampaigns</code> operation. This token
  /// indicates the position of the campaign in the list of campaigns.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDomainDeliverabilityCampaignsResponse({
    @_s.required this.domainDeliverabilityCampaigns,
    this.nextToken,
  });
  factory ListDomainDeliverabilityCampaignsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDomainDeliverabilityCampaignsResponseFromJson(json);
}

/// A list of all of the identities that you've attempted to verify, regardless
/// of whether or not those identities were successfully verified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEmailIdentitiesResponse {
  /// An array that includes all of the email identities associated with your AWS
  /// account.
  @_s.JsonKey(name: 'EmailIdentities')
  final List<IdentityInfo> emailIdentities;

  /// A token that indicates that there are additional configuration sets to list.
  /// To view additional configuration sets, issue another request to
  /// <code>ListEmailIdentities</code>, and pass this token in the
  /// <code>NextToken</code> parameter.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEmailIdentitiesResponse({
    this.emailIdentities,
    this.nextToken,
  });
  factory ListEmailIdentitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEmailIdentitiesResponseFromJson(json);
}

/// The following elements are returned by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEmailTemplatesResponse {
  /// A token indicating that there are additional email templates available to be
  /// listed. Pass this token to a subsequent <code>ListEmailTemplates</code> call
  /// to retrieve the next 10 email templates.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array the contains the name and creation time stamp for each template in
  /// your Amazon SES account.
  @_s.JsonKey(name: 'TemplatesMetadata')
  final List<EmailTemplateMetadata> templatesMetadata;

  ListEmailTemplatesResponse({
    this.nextToken,
    this.templatesMetadata,
  });
  factory ListEmailTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEmailTemplatesResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListImportJobsResponse {
  /// A list of the import job summaries.
  @_s.JsonKey(name: 'ImportJobs')
  final List<ImportJobSummary> importJobs;

  /// A string token indicating that there might be additional import jobs
  /// available to be listed. Copy this token to a subsequent call to
  /// <code>ListImportJobs</code> with the same parameters to retrieve the next
  /// page of import jobs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListImportJobsResponse({
    this.importJobs,
    this.nextToken,
  });
  factory ListImportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImportJobsResponseFromJson(json);
}

/// An object used to specify a list or topic to which an email belongs, which
/// will be used when a contact chooses to unsubscribe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListManagementOptions {
  /// The name of the contact list.
  @_s.JsonKey(name: 'ContactListName')
  final String contactListName;

  /// The name of the topic.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  ListManagementOptions({
    @_s.required this.contactListName,
    this.topicName,
  });
  Map<String, dynamic> toJson() => _$ListManagementOptionsToJson(this);
}

/// A list of suppressed email addresses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSuppressedDestinationsResponse {
  /// A token that indicates that there are additional email addresses on the
  /// suppression list for your account. To view additional suppressed addresses,
  /// issue another request to <code>ListSuppressedDestinations</code>, and pass
  /// this token in the <code>NextToken</code> parameter.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of summaries, each containing a summary for a suppressed email
  /// destination.
  @_s.JsonKey(name: 'SuppressedDestinationSummaries')
  final List<SuppressedDestinationSummary> suppressedDestinationSummaries;

  ListSuppressedDestinationsResponse({
    this.nextToken,
    this.suppressedDestinationSummaries,
  });
  factory ListSuppressedDestinationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSuppressedDestinationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// An array that lists all the tags that are associated with the resource. Each
  /// tag consists of a required tag key (<code>Key</code>) and an associated tag
  /// value (<code>Value</code>)
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    @_s.required this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// A list of attributes that are associated with a MAIL FROM domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'BehaviorOnMxFailure')
  final BehaviorOnMxFailure behaviorOnMxFailure;

  /// The name of a domain that an email identity uses as a custom MAIL FROM
  /// domain.
  @_s.JsonKey(name: 'MailFromDomain')
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
  @_s.JsonKey(name: 'MailFromDomainStatus')
  final MailFromDomainStatus mailFromDomainStatus;

  MailFromAttributes({
    @_s.required this.behaviorOnMxFailure,
    @_s.required this.mailFromDomain,
    @_s.required this.mailFromDomainStatus,
  });
  factory MailFromAttributes.fromJson(Map<String, dynamic> json) =>
      _$MailFromAttributesFromJson(json);
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
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TEMPORARY_FAILURE')
  temporaryFailure,
}

enum MailType {
  @_s.JsonValue('MARKETING')
  marketing,
  @_s.JsonValue('TRANSACTIONAL')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the email message that you're sending. The <code>Message</code>
/// object consists of a subject line and a message body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Message {
  /// The body of the message. You can specify an HTML version of the message, a
  /// text-only version of the message, or both.
  @_s.JsonKey(name: 'Body')
  final Body body;

  /// The subject line of the email. The subject line can only contain 7-bit ASCII
  /// characters. However, you can specify non-ASCII characters in the subject
  /// line by using encoded-word syntax, as described in <a
  /// href="https://tools.ietf.org/html/rfc2047">RFC 2047</a>.
  @_s.JsonKey(name: 'Subject')
  final Content subject;

  Message({
    @_s.required this.body,
    @_s.required this.subject,
  });
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// Contains the name and value of a tag that you apply to an email. You can use
/// message tags when you publish email sending events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Name')
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
  @_s.JsonKey(name: 'Value')
  final String value;

  MessageTag({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$MessageTagToJson(this);
}

/// An object that contains information about email that was sent from the
/// selected domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OverallVolume {
  /// An object that contains inbox and junk mail placement metrics for individual
  /// email providers.
  @_s.JsonKey(name: 'DomainIspPlacements')
  final List<DomainIspPlacement> domainIspPlacements;

  /// The percentage of emails that were sent from the domain that were read by
  /// their recipients.
  @_s.JsonKey(name: 'ReadRatePercent')
  final double readRatePercent;

  /// An object that contains information about the numbers of messages that
  /// arrived in recipients' inboxes and junk mail folders.
  @_s.JsonKey(name: 'VolumeStatistics')
  final VolumeStatistics volumeStatistics;

  OverallVolume({
    this.domainIspPlacements,
    this.readRatePercent,
    this.volumeStatistics,
  });
  factory OverallVolume.fromJson(Map<String, dynamic> json) =>
      _$OverallVolumeFromJson(json);
}

/// An object that defines an Amazon Pinpoint project destination for email
/// events. You can send email event data to a Amazon Pinpoint project to view
/// metrics using the Transactional Messaging dashboards that are built in to
/// Amazon Pinpoint. For more information, see <a
/// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional
/// Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PinpointDestination {
  /// The Amazon Resource Name (ARN) of the Amazon Pinpoint project that you want
  /// to send email events to.
  @_s.JsonKey(name: 'ApplicationArn')
  final String applicationArn;

  PinpointDestination({
    this.applicationArn,
  });
  factory PinpointDestination.fromJson(Map<String, dynamic> json) =>
      _$PinpointDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$PinpointDestinationToJson(this);
}

/// An object that contains inbox placement data for an email provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlacementStatistics {
  /// The percentage of emails that were authenticated by using DomainKeys
  /// Identified Mail (DKIM) during the predictive inbox placement test.
  @_s.JsonKey(name: 'DkimPercentage')
  final double dkimPercentage;

  /// The percentage of emails that arrived in recipients' inboxes during the
  /// predictive inbox placement test.
  @_s.JsonKey(name: 'InboxPercentage')
  final double inboxPercentage;

  /// The percentage of emails that didn't arrive in recipients' inboxes at all
  /// during the predictive inbox placement test.
  @_s.JsonKey(name: 'MissingPercentage')
  final double missingPercentage;

  /// The percentage of emails that arrived in recipients' spam or junk mail
  /// folders during the predictive inbox placement test.
  @_s.JsonKey(name: 'SpamPercentage')
  final double spamPercentage;

  /// The percentage of emails that were authenticated by using Sender Policy
  /// Framework (SPF) during the predictive inbox placement test.
  @_s.JsonKey(name: 'SpfPercentage')
  final double spfPercentage;

  PlacementStatistics({
    this.dkimPercentage,
    this.inboxPercentage,
    this.missingPercentage,
    this.spamPercentage,
    this.spfPercentage,
  });
  factory PlacementStatistics.fromJson(Map<String, dynamic> json) =>
      _$PlacementStatisticsFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAccountDedicatedIpWarmupAttributesResponse {
  PutAccountDedicatedIpWarmupAttributesResponse();
  factory PutAccountDedicatedIpWarmupAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAccountDedicatedIpWarmupAttributesResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAccountDetailsResponse {
  PutAccountDetailsResponse();
  factory PutAccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutAccountDetailsResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAccountSendingAttributesResponse {
  PutAccountSendingAttributesResponse();
  factory PutAccountSendingAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAccountSendingAttributesResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAccountSuppressionAttributesResponse {
  PutAccountSuppressionAttributesResponse();
  factory PutAccountSuppressionAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAccountSuppressionAttributesResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConfigurationSetDeliveryOptionsResponse {
  PutConfigurationSetDeliveryOptionsResponse();
  factory PutConfigurationSetDeliveryOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutConfigurationSetDeliveryOptionsResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConfigurationSetReputationOptionsResponse {
  PutConfigurationSetReputationOptionsResponse();
  factory PutConfigurationSetReputationOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutConfigurationSetReputationOptionsResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConfigurationSetSendingOptionsResponse {
  PutConfigurationSetSendingOptionsResponse();
  factory PutConfigurationSetSendingOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutConfigurationSetSendingOptionsResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConfigurationSetSuppressionOptionsResponse {
  PutConfigurationSetSuppressionOptionsResponse();
  factory PutConfigurationSetSuppressionOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutConfigurationSetSuppressionOptionsResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConfigurationSetTrackingOptionsResponse {
  PutConfigurationSetTrackingOptionsResponse();
  factory PutConfigurationSetTrackingOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutConfigurationSetTrackingOptionsResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDedicatedIpInPoolResponse {
  PutDedicatedIpInPoolResponse();
  factory PutDedicatedIpInPoolResponse.fromJson(Map<String, dynamic> json) =>
      _$PutDedicatedIpInPoolResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDedicatedIpWarmupAttributesResponse {
  PutDedicatedIpWarmupAttributesResponse();
  factory PutDedicatedIpWarmupAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutDedicatedIpWarmupAttributesResponseFromJson(json);
}

/// A response that indicates whether the Deliverability dashboard is enabled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDeliverabilityDashboardOptionResponse {
  PutDeliverabilityDashboardOptionResponse();
  factory PutDeliverabilityDashboardOptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutDeliverabilityDashboardOptionResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEmailIdentityDkimAttributesResponse {
  PutEmailIdentityDkimAttributesResponse();
  factory PutEmailIdentityDkimAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutEmailIdentityDkimAttributesResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response.
///
/// The following data is returned in JSON format by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'DkimStatus')
  final DkimStatus dkimStatus;

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
  @_s.JsonKey(name: 'DkimTokens')
  final List<String> dkimTokens;

  PutEmailIdentityDkimSigningAttributesResponse({
    this.dkimStatus,
    this.dkimTokens,
  });
  factory PutEmailIdentityDkimSigningAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutEmailIdentityDkimSigningAttributesResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEmailIdentityFeedbackAttributesResponse {
  PutEmailIdentityFeedbackAttributesResponse();
  factory PutEmailIdentityFeedbackAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutEmailIdentityFeedbackAttributesResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEmailIdentityMailFromAttributesResponse {
  PutEmailIdentityMailFromAttributesResponse();
  factory PutEmailIdentityMailFromAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutEmailIdentityMailFromAttributesResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSuppressedDestinationResponse {
  PutSuppressedDestinationResponse();
  factory PutSuppressedDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutSuppressedDestinationResponseFromJson(json);
}

/// Represents the raw content of an email message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Data')
  final Uint8List data;

  RawMessage({
    @_s.required this.data,
  });
  Map<String, dynamic> toJson() => _$RawMessageToJson(this);
}

/// The <code>ReplaceEmailContent</code> object to be used for a specific
/// <code>BulkEmailEntry</code>. The <code>ReplacementTemplate</code> can be
/// specified within this object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplacementEmailContent {
  /// The <code>ReplacementTemplate</code> associated with
  /// <code>ReplacementEmailContent</code>.
  @_s.JsonKey(name: 'ReplacementTemplate')
  final ReplacementTemplate replacementTemplate;

  ReplacementEmailContent({
    this.replacementTemplate,
  });
  Map<String, dynamic> toJson() => _$ReplacementEmailContentToJson(this);
}

/// An object which contains <code>ReplacementTemplateData</code> to be used for
/// a specific <code>BulkEmailEntry</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplacementTemplate {
  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  @_s.JsonKey(name: 'ReplacementTemplateData')
  final String replacementTemplateData;

  ReplacementTemplate({
    this.replacementTemplateData,
  });
  Map<String, dynamic> toJson() => _$ReplacementTemplateToJson(this);
}

/// Enable or disable collection of reputation metrics for emails that you send
/// using this configuration set in the current AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ReputationOptions {
  /// The date and time (in Unix time) when the reputation metrics were last given
  /// a fresh start. When your account is given a fresh start, your reputation
  /// metrics are calculated starting from the date of the fresh start.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastFreshStart')
  final DateTime lastFreshStart;

  /// If <code>true</code>, tracking of reputation metrics is enabled for the
  /// configuration set. If <code>false</code>, tracking of reputation metrics is
  /// disabled for the configuration set.
  @_s.JsonKey(name: 'ReputationMetricsEnabled')
  final bool reputationMetricsEnabled;

  ReputationOptions({
    this.lastFreshStart,
    this.reputationMetricsEnabled,
  });
  factory ReputationOptions.fromJson(Map<String, dynamic> json) =>
      _$ReputationOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ReputationOptionsToJson(this);
}

/// An object that contains information about your account details review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReviewDetails {
  /// The associated support center case ID (if any).
  @_s.JsonKey(name: 'CaseId')
  final String caseId;

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
  @_s.JsonKey(name: 'Status')
  final ReviewStatus status;

  ReviewDetails({
    this.caseId,
    this.status,
  });
  factory ReviewDetails.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailsFromJson(json);
}

enum ReviewStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('GRANTED')
  granted,
  @_s.JsonValue('DENIED')
  denied,
}

/// The following data is returned in JSON format by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendBulkEmailResponse {
  @_s.JsonKey(name: 'BulkEmailEntryResults')
  final List<BulkEmailEntryResult> bulkEmailEntryResults;

  SendBulkEmailResponse({
    @_s.required this.bulkEmailEntryResults,
  });
  factory SendBulkEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendBulkEmailResponseFromJson(json);
}

/// The following element is returned by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendCustomVerificationEmailResponse {
  /// The unique message identifier returned from the
  /// <code>SendCustomVerificationEmail</code> operation.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  SendCustomVerificationEmailResponse({
    this.messageId,
  });
  factory SendCustomVerificationEmailResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SendCustomVerificationEmailResponseFromJson(json);
}

/// A unique message ID that you receive when an email is accepted for sending.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendEmailResponse {
  /// A unique identifier for the message that is generated when the message is
  /// accepted.
  /// <note>
  /// It's possible for Amazon SES to accept a message without sending it. This
  /// can happen when the message that you're trying to send has an attachment
  /// contains a virus, or when you send a templated email that contains invalid
  /// personalization content, for example.
  /// </note>
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  SendEmailResponse({
    this.messageId,
  });
  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);
}

/// An object that contains information about the per-day and per-second sending
/// limits for your Amazon SES account in the current AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendQuota {
  /// The maximum number of emails that you can send in the current AWS Region
  /// over a 24-hour period. This value is also called your <i>sending quota</i>.
  @_s.JsonKey(name: 'Max24HourSend')
  final double max24HourSend;

  /// The maximum number of emails that you can send per second in the current AWS
  /// Region. This value is also called your <i>maximum sending rate</i> or your
  /// <i>maximum TPS (transactions per second) rate</i>.
  @_s.JsonKey(name: 'MaxSendRate')
  final double maxSendRate;

  /// The number of emails sent from your Amazon SES account in the current AWS
  /// Region over the past 24 hours.
  @_s.JsonKey(name: 'SentLast24Hours')
  final double sentLast24Hours;

  SendQuota({
    this.max24HourSend,
    this.maxSendRate,
    this.sentLast24Hours,
  });
  factory SendQuota.fromJson(Map<String, dynamic> json) =>
      _$SendQuotaFromJson(json);
}

/// Used to enable or disable email sending for messages that use this
/// configuration set in the current AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SendingOptions {
  /// If <code>true</code>, email sending is enabled for the configuration set. If
  /// <code>false</code>, email sending is disabled for the configuration set.
  @_s.JsonKey(name: 'SendingEnabled')
  final bool sendingEnabled;

  SendingOptions({
    this.sendingEnabled,
  });
  factory SendingOptions.fromJson(Map<String, dynamic> json) =>
      _$SendingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SendingOptionsToJson(this);
}

/// An object that defines an Amazon SNS destination for email events. You can
/// use Amazon SNS to send notification when certain email events occur.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnsDestination {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to
  /// publish email events to. For more information about Amazon SNS topics, see
  /// the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  SnsDestination({
    @_s.required this.topicArn,
  });
  factory SnsDestination.fromJson(Map<String, dynamic> json) =>
      _$SnsDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$SnsDestinationToJson(this);
}

enum SubscriptionStatus {
  @_s.JsonValue('OPT_IN')
  optIn,
  @_s.JsonValue('OPT_OUT')
  optOut,
}

/// An object that contains information about an email address that is on the
/// suppression list for your account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SuppressedDestination {
  /// The email address that is on the suppression list for your account.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// The date and time when the suppressed destination was last updated, shown in
  /// Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  /// The reason that the address was added to the suppression list for your
  /// account.
  @_s.JsonKey(name: 'Reason')
  final SuppressionListReason reason;

  /// An optional value that can contain additional information about the reasons
  /// that the address was added to the suppression list for your account.
  @_s.JsonKey(name: 'Attributes')
  final SuppressedDestinationAttributes attributes;

  SuppressedDestination({
    @_s.required this.emailAddress,
    @_s.required this.lastUpdateTime,
    @_s.required this.reason,
    this.attributes,
  });
  factory SuppressedDestination.fromJson(Map<String, dynamic> json) =>
      _$SuppressedDestinationFromJson(json);
}

/// An object that contains additional attributes that are related an email
/// address that is on the suppression list for your account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SuppressedDestinationAttributes {
  /// A unique identifier that's generated when an email address is added to the
  /// suppression list for your account.
  @_s.JsonKey(name: 'FeedbackId')
  final String feedbackId;

  /// The unique identifier of the email message that caused the email address to
  /// be added to the suppression list for your account.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  SuppressedDestinationAttributes({
    this.feedbackId,
    this.messageId,
  });
  factory SuppressedDestinationAttributes.fromJson(Map<String, dynamic> json) =>
      _$SuppressedDestinationAttributesFromJson(json);
}

/// A summary that describes the suppressed email address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SuppressedDestinationSummary {
  /// The email address that's on the suppression list for your account.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// The date and time when the suppressed destination was last updated, shown in
  /// Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  /// The reason that the address was added to the suppression list for your
  /// account.
  @_s.JsonKey(name: 'Reason')
  final SuppressionListReason reason;

  SuppressedDestinationSummary({
    @_s.required this.emailAddress,
    @_s.required this.lastUpdateTime,
    @_s.required this.reason,
  });
  factory SuppressedDestinationSummary.fromJson(Map<String, dynamic> json) =>
      _$SuppressedDestinationSummaryFromJson(json);
}

/// An object that contains information about the email address suppression
/// preferences for your account in the current AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'SuppressedReasons')
  final List<SuppressionListReason> suppressedReasons;

  SuppressionAttributes({
    this.suppressedReasons,
  });
  factory SuppressionAttributes.fromJson(Map<String, dynamic> json) =>
      _$SuppressionAttributesFromJson(json);
}

/// An object that contains details about the action of suppression list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'SuppressionListImportAction')
  final SuppressionListImportAction suppressionListImportAction;

  SuppressionListDestination({
    @_s.required this.suppressionListImportAction,
  });
  factory SuppressionListDestination.fromJson(Map<String, dynamic> json) =>
      _$SuppressionListDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$SuppressionListDestinationToJson(this);
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
  @_s.JsonValue('DELETE')
  delete,
  @_s.JsonValue('PUT')
  put,
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
  @_s.JsonValue('BOUNCE')
  bounce,
  @_s.JsonValue('COMPLAINT')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that contains information about the suppression list preferences
/// for your account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'SuppressedReasons')
  final List<SuppressionListReason> suppressedReasons;

  SuppressionOptions({
    this.suppressedReasons,
  });
  factory SuppressionOptions.fromJson(Map<String, dynamic> json) =>
      _$SuppressionOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SuppressionOptionsToJson(this);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// One part of a key-value pair that defines a tag. The maximum length of a tag
  /// key is 128 characters. The minimum length is 1 character.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The optional part of a key-value pair that defines a tag. The maximum length
  /// of a tag value is 256 characters. The minimum length is 0 characters. If you
  /// don't want a resource to have a specific tag value, don't specify a value
  /// for this parameter. If you don't specify a value, Amazon SES sets the value
  /// to an empty string.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
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

/// An object that defines the email template to use for an email message, and
/// the values to use for any message variables in that template. An <i>email
/// template</i> is a type of message template that contains content that you
/// want to define, save, and reuse in email messages that you send.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Template {
  /// The Amazon Resource Name (ARN) of the template.
  @_s.JsonKey(name: 'TemplateArn')
  final String templateArn;

  /// An object that defines the values to use for message variables in the
  /// template. This object is a set of key-value pairs. Each key defines a
  /// message variable in the template. The corresponding value defines the value
  /// to use for that variable.
  @_s.JsonKey(name: 'TemplateData')
  final String templateData;

  /// The name of the template. You will refer to this name when you send email
  /// using the <code>SendTemplatedEmail</code> or
  /// <code>SendBulkTemplatedEmail</code> operations.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  Template({
    this.templateArn,
    this.templateData,
    this.templateName,
  });
  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

/// The following element is returned by the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestRenderEmailTemplateResponse {
  /// The complete MIME message rendered by applying the data in the
  /// <code>TemplateData</code> parameter to the template specified in the
  /// TemplateName parameter.
  @_s.JsonKey(name: 'RenderedTemplate')
  final String renderedTemplate;

  TestRenderEmailTemplateResponse({
    @_s.required this.renderedTemplate,
  });
  factory TestRenderEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$TestRenderEmailTemplateResponseFromJson(json);
}

/// Specifies whether messages that use the configuration set are required to
/// use Transport Layer Security (TLS). If the value is <code>Require</code>,
/// messages are only delivered if a TLS connection can be established. If the
/// value is <code>Optional</code>, messages can be delivered in plain text if a
/// TLS connection can't be established.
enum TlsPolicy {
  @_s.JsonValue('REQUIRE')
  require,
  @_s.JsonValue('OPTIONAL')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// An interest group, theme, or label within a list. Lists can have multiple
/// topics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Topic {
  /// The default subscription status to be applied to a contact if the contact
  /// has not noted their preference for subscribing to a topic.
  @_s.JsonKey(name: 'DefaultSubscriptionStatus')
  final SubscriptionStatus defaultSubscriptionStatus;

  /// The name of the topic the contact will see.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the topic.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  /// A description of what the topic is about, which the contact will see.
  @_s.JsonKey(name: 'Description')
  final String description;

  Topic({
    @_s.required this.defaultSubscriptionStatus,
    @_s.required this.displayName,
    @_s.required this.topicName,
    this.description,
  });
  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

/// Used for filtering by a specific topic preference.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TopicFilter {
  /// The name of a topic on which you wish to apply the filter.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  /// Notes that the default subscription status should be applied to a contact
  /// because the contact has not noted their preference for subscribing to a
  /// topic.
  @_s.JsonKey(name: 'UseDefaultIfPreferenceUnavailable')
  final bool useDefaultIfPreferenceUnavailable;

  TopicFilter({
    this.topicName,
    this.useDefaultIfPreferenceUnavailable,
  });
  Map<String, dynamic> toJson() => _$TopicFilterToJson(this);
}

/// The contact's preference for being opted-in to or opted-out of a topic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TopicPreference {
  /// The contact's subscription status to a topic which is either
  /// <code>OPT_IN</code> or <code>OPT_OUT</code>.
  @_s.JsonKey(name: 'SubscriptionStatus')
  final SubscriptionStatus subscriptionStatus;

  /// The name of the topic.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  TopicPreference({
    @_s.required this.subscriptionStatus,
    @_s.required this.topicName,
  });
  factory TopicPreference.fromJson(Map<String, dynamic> json) =>
      _$TopicPreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$TopicPreferenceToJson(this);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrackingOptions {
  /// The domain that you want to use for tracking open and click events.
  @_s.JsonKey(name: 'CustomRedirectDomain')
  final String customRedirectDomain;

  TrackingOptions({
    @_s.required this.customRedirectDomain,
  });
  factory TrackingOptions.fromJson(Map<String, dynamic> json) =>
      _$TrackingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingOptionsToJson(this);
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

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();
  factory UpdateConfigurationSetEventDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateConfigurationSetEventDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContactListResponse {
  UpdateContactListResponse();
  factory UpdateContactListResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateContactListResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContactResponse {
  UpdateContactResponse();
  factory UpdateContactResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateContactResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCustomVerificationEmailTemplateResponse {
  UpdateCustomVerificationEmailTemplateResponse();
  factory UpdateCustomVerificationEmailTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCustomVerificationEmailTemplateResponseFromJson(json);
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEmailIdentityPolicyResponse {
  UpdateEmailIdentityPolicyResponse();
  factory UpdateEmailIdentityPolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateEmailIdentityPolicyResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEmailTemplateResponse {
  UpdateEmailTemplateResponse();
  factory UpdateEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailTemplateResponseFromJson(json);
}

/// An object that contains information about the amount of email that was
/// delivered to recipients.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VolumeStatistics {
  /// The total number of emails that arrived in recipients' inboxes.
  @_s.JsonKey(name: 'InboxRawCount')
  final int inboxRawCount;

  /// An estimate of the percentage of emails sent from the current domain that
  /// will arrive in recipients' inboxes.
  @_s.JsonKey(name: 'ProjectedInbox')
  final int projectedInbox;

  /// An estimate of the percentage of emails sent from the current domain that
  /// will arrive in recipients' spam or junk mail folders.
  @_s.JsonKey(name: 'ProjectedSpam')
  final int projectedSpam;

  /// The total number of emails that arrived in recipients' spam or junk mail
  /// folders.
  @_s.JsonKey(name: 'SpamRawCount')
  final int spamRawCount;

  VolumeStatistics({
    this.inboxRawCount,
    this.projectedInbox,
    this.projectedSpam,
    this.spamRawCount,
  });
  factory VolumeStatistics.fromJson(Map<String, dynamic> json) =>
      _$VolumeStatisticsFromJson(json);
}

/// The warmup status of a dedicated IP.
enum WarmupStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('DONE')
  done,
}

class AccountSuspendedException extends _s.GenericAwsException {
  AccountSuspendedException({String type, String message})
      : super(type: type, code: 'AccountSuspendedException', message: message);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MailFromDomainNotVerifiedException extends _s.GenericAwsException {
  MailFromDomainNotVerifiedException({String type, String message})
      : super(
            type: type,
            code: 'MailFromDomainNotVerifiedException',
            message: message);
}

class MessageRejected extends _s.GenericAwsException {
  MessageRejected({String type, String message})
      : super(type: type, code: 'MessageRejected', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class SendingPausedException extends _s.GenericAwsException {
  SendingPausedException({String type, String message})
      : super(type: type, code: 'SendingPausedException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
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
