// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// This document contains reference information for the <a
/// href="https://aws.amazon.com/ses/">Amazon Simple Email Service</a> (Amazon
/// SES) API, version 2010-12-01. This document is best used in conjunction with
/// the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html">Amazon
/// SES Developer Guide</a>.
/// <note>
/// For a list of Amazon SES endpoints to use in service requests, see <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html">Regions
/// and Amazon SES</a> in the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html">Amazon
/// SES Developer Guide</a>.
/// </note>
/// This documentation contains reference information related to the following:
class Ses {
  final _s.QueryProtocol _protocol;

  Ses({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
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

  /// Creates a receipt rule set by cloning an existing one. All receipt rules
  /// and configurations are copied to the new receipt rule set and are
  /// completely independent of the source rule set.
  ///
  /// For information about setting up rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [originalRuleSetName] :
  /// The name of the rule set to clone.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the rule set to create. The name must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain 64 characters or fewer.
  /// </li>
  /// </ul>
  Future<void> cloneReceiptRuleSet({
    required String originalRuleSetName,
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      'OriginalRuleSetName': originalRuleSetName,
      'RuleSetName': ruleSetName,
    };
    await _protocol.send(
      $request,
      action: 'CloneReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CloneReceiptRuleSetResult',
    );
  }

  /// Creates a configuration set.
  ///
  /// Configuration sets enable you to publish email sending events. For
  /// information about using configuration sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetAlreadyExistsException].
  /// May throw [InvalidConfigurationSetException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [configurationSet] :
  /// A data structure that contains the name of the configuration set.
  Future<void> createConfigurationSet({
    required ConfigurationSet configurationSet,
  }) async {
    final $request = <String, String>{
      for (var e1 in configurationSet.toQueryMap().entries)
        'ConfigurationSet.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'CreateConfigurationSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateConfigurationSetResult',
    );
  }

  /// Creates a configuration set event destination.
  /// <note>
  /// When you create or update an event destination, you must provide one, and
  /// only one, destination. The destination can be CloudWatch, Amazon Kinesis
  /// Firehose, or Amazon Simple Notification Service (Amazon SNS).
  /// </note>
  /// An event destination is the Amazon Web Services service to which Amazon
  /// SES publishes the email sending events associated with a configuration
  /// set. For information about using configuration sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [EventDestinationAlreadyExistsException].
  /// May throw [InvalidCloudWatchDestinationException].
  /// May throw [InvalidFirehoseDestinationException].
  /// May throw [InvalidSNSDestinationException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that the event destination should be
  /// associated with.
  ///
  /// Parameter [eventDestination] :
  /// An object that describes the Amazon Web Services service that email
  /// sending event where information is published.
  Future<void> createConfigurationSetEventDestination({
    required String configurationSetName,
    required EventDestination eventDestination,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      for (var e1 in eventDestination.toQueryMap().entries)
        'EventDestination.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'CreateConfigurationSetEventDestination',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateConfigurationSetEventDestinationResult',
    );
  }

  /// Creates an association between a configuration set and a custom domain for
  /// open and click event tracking.
  ///
  /// By default, images and links used for tracking open and click events are
  /// hosted on domains operated by Amazon SES. You can configure a subdomain of
  /// your own to handle these events. For information about using custom
  /// domains, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [TrackingOptionsAlreadyExistsException].
  /// May throw [InvalidTrackingOptionsException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that the tracking options should be
  /// associated with.
  Future<void> createConfigurationSetTrackingOptions({
    required String configurationSetName,
    required TrackingOptions trackingOptions,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      for (var e1 in trackingOptions.toQueryMap().entries)
        'TrackingOptions.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'CreateConfigurationSetTrackingOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateConfigurationSetTrackingOptionsResult',
    );
  }

  /// Creates a new custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [CustomVerificationEmailTemplateAlreadyExistsException].
  /// May throw [FromEmailAddressNotVerifiedException].
  /// May throw [CustomVerificationEmailInvalidContentException].
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
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Custom
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
    final $request = <String, String>{
      'FailureRedirectionURL': failureRedirectionURL,
      'FromEmailAddress': fromEmailAddress,
      'SuccessRedirectionURL': successRedirectionURL,
      'TemplateContent': templateContent,
      'TemplateName': templateName,
      'TemplateSubject': templateSubject,
    };
    await _protocol.send(
      $request,
      action: 'CreateCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new IP address filter.
  ///
  /// For information about setting up IP address filters, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [filter] :
  /// A data structure that describes the IP address filter to create, which
  /// consists of a name, an IP address range, and whether to allow or block
  /// mail from it.
  Future<void> createReceiptFilter({
    required ReceiptFilter filter,
  }) async {
    final $request = <String, String>{
      for (var e1 in filter.toQueryMap().entries) 'Filter.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'CreateReceiptFilter',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateReceiptFilterResult',
    );
  }

  /// Creates a receipt rule.
  ///
  /// For information about setting up receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [InvalidSnsTopicException].
  /// May throw [InvalidS3ConfigurationException].
  /// May throw [InvalidLambdaFunctionException].
  /// May throw [AlreadyExistsException].
  /// May throw [RuleDoesNotExistException].
  /// May throw [RuleSetDoesNotExistException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [rule] :
  /// A data structure that contains the specified rule's name, actions,
  /// recipients, domains, enabled status, scan status, and TLS policy.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the rule set where the receipt rule is added.
  ///
  /// Parameter [after] :
  /// The name of an existing rule after which the new rule is placed. If this
  /// parameter is null, the new rule is inserted at the beginning of the rule
  /// list.
  Future<void> createReceiptRule({
    required ReceiptRule rule,
    required String ruleSetName,
    String? after,
  }) async {
    final $request = <String, String>{
      for (var e1 in rule.toQueryMap().entries) 'Rule.${e1.key}': e1.value,
      'RuleSetName': ruleSetName,
      if (after != null) 'After': after,
    };
    await _protocol.send(
      $request,
      action: 'CreateReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateReceiptRuleResult',
    );
  }

  /// Creates an empty receipt rule set.
  ///
  /// For information about setting up receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [ruleSetName] :
  /// The name of the rule set to create. The name must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain 64 characters or fewer.
  /// </li>
  /// </ul>
  Future<void> createReceiptRuleSet({
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      'RuleSetName': ruleSetName,
    };
    await _protocol.send(
      $request,
      action: 'CreateReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateReceiptRuleSetResult',
    );
  }

  /// Creates an email template. Email templates enable you to send personalized
  /// email to one or more destinations in a single operation. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidTemplateException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [template] :
  /// The content of the email, composed of a subject line and either an HTML
  /// part or a text-only part.
  Future<void> createTemplate({
    required Template template,
  }) async {
    final $request = <String, String>{
      for (var e1 in template.toQueryMap().entries)
        'Template.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'CreateTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateTemplateResult',
    );
  }

  /// Deletes a configuration set. Configuration sets enable you to publish
  /// email sending events. For information about using configuration sets, see
  /// the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to delete.
  Future<void> deleteConfigurationSet({
    required String configurationSetName,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteConfigurationSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteConfigurationSetResult',
    );
  }

  /// Deletes a configuration set event destination. Configuration set event
  /// destinations are associated with configuration sets, which enable you to
  /// publish email sending events. For information about using configuration
  /// sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [EventDestinationDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set from which to delete the event
  /// destination.
  ///
  /// Parameter [eventDestinationName] :
  /// The name of the event destination to delete.
  Future<void> deleteConfigurationSetEventDestination({
    required String configurationSetName,
    required String eventDestinationName,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      'EventDestinationName': eventDestinationName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteConfigurationSetEventDestination',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteConfigurationSetEventDestinationResult',
    );
  }

  /// Deletes an association between a configuration set and a custom domain for
  /// open and click event tracking.
  ///
  /// By default, images and links used for tracking open and click events are
  /// hosted on domains operated by Amazon SES. You can configure a subdomain of
  /// your own to handle these events. For information about using custom
  /// domains, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Deleting this kind of association results in emails sent using the
  /// specified configuration set to capture open and click events using the
  /// standard, Amazon SES-operated domains.
  /// </note>
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [TrackingOptionsDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  Future<void> deleteConfigurationSetTrackingOptions({
    required String configurationSetName,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteConfigurationSetTrackingOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteConfigurationSetTrackingOptionsResult',
    );
  }

  /// Deletes an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template to delete.
  Future<void> deleteCustomVerificationEmailTemplate({
    required String templateName,
  }) async {
    final $request = <String, String>{
      'TemplateName': templateName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified identity (an email address or a domain) from the
  /// list of verified identities.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identity] :
  /// The identity to be removed from the list of identities for the Amazon Web
  /// Services account.
  Future<void> deleteIdentity({
    required String identity,
  }) async {
    final $request = <String, String>{
      'Identity': identity,
    };
    await _protocol.send(
      $request,
      action: 'DeleteIdentity',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteIdentityResult',
    );
  }

  /// Deletes the specified sending authorization policy for the given identity
  /// (an email address or a domain). This operation returns successfully even
  /// if a policy with the specified name does not exist.
  /// <note>
  /// This operation is for the identity owner only. If you have not verified
  /// the identity, it returns an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identity] :
  /// The identity that is associated with the policy to delete. You can specify
  /// the identity by using its name or by using its Amazon Resource Name (ARN).
  /// Examples: <code>user@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this operation, you must own the identity.
  ///
  /// Parameter [policyName] :
  /// The name of the policy to be deleted.
  Future<void> deleteIdentityPolicy({
    required String identity,
    required String policyName,
  }) async {
    final $request = <String, String>{
      'Identity': identity,
      'PolicyName': policyName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteIdentityPolicy',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteIdentityPolicyResult',
    );
  }

  /// Deletes the specified IP address filter.
  ///
  /// For information about managing IP address filters, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [filterName] :
  /// The name of the IP address filter to delete.
  Future<void> deleteReceiptFilter({
    required String filterName,
  }) async {
    final $request = <String, String>{
      'FilterName': filterName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteReceiptFilter',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteReceiptFilterResult',
    );
  }

  /// Deletes the specified receipt rule.
  ///
  /// For information about managing receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  ///
  /// Parameter [ruleName] :
  /// The name of the receipt rule to delete.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set that contains the receipt rule to delete.
  Future<void> deleteReceiptRule({
    required String ruleName,
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      'RuleName': ruleName,
      'RuleSetName': ruleSetName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteReceiptRuleResult',
    );
  }

  /// Deletes the specified receipt rule set and all of the receipt rules it
  /// contains.
  /// <note>
  /// The currently active rule set cannot be deleted.
  /// </note>
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [CannotDeleteException].
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set to delete.
  Future<void> deleteReceiptRuleSet({
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      'RuleSetName': ruleSetName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteReceiptRuleSetResult',
    );
  }

  /// Deletes an email template.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [templateName] :
  /// The name of the template to be deleted.
  Future<void> deleteTemplate({
    required String templateName,
  }) async {
    final $request = <String, String>{
      'TemplateName': templateName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteTemplateResult',
    );
  }

  /// Deprecated. Use the <code>DeleteIdentity</code> operation to delete email
  /// addresses and domains.
  ///
  /// Parameter [emailAddress] :
  /// An email address to be removed from the list of verified addresses.
  Future<void> deleteVerifiedEmailAddress({
    required String emailAddress,
  }) async {
    final $request = <String, String>{
      'EmailAddress': emailAddress,
    };
    await _protocol.send(
      $request,
      action: 'DeleteVerifiedEmailAddress',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the metadata and receipt rules for the receipt rule set that is
  /// currently active.
  ///
  /// For information about setting up receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  Future<DescribeActiveReceiptRuleSetResponse>
      describeActiveReceiptRuleSet() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeActiveReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeActiveReceiptRuleSetResult',
    );
    return DescribeActiveReceiptRuleSetResponse.fromXml($result);
  }

  /// Returns the details of the specified configuration set. For information
  /// about using configuration sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to describe.
  ///
  /// Parameter [configurationSetAttributeNames] :
  /// A list of configuration set attributes to return.
  Future<DescribeConfigurationSetResponse> describeConfigurationSet({
    required String configurationSetName,
    List<ConfigurationSetAttribute>? configurationSetAttributeNames,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      if (configurationSetAttributeNames != null)
        if (configurationSetAttributeNames.isEmpty)
          'ConfigurationSetAttributeNames': ''
        else
          for (var i1 = 0; i1 < configurationSetAttributeNames.length; i1++)
            'ConfigurationSetAttributeNames.member.${i1 + 1}':
                configurationSetAttributeNames[i1].value,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeConfigurationSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeConfigurationSetResult',
    );
    return DescribeConfigurationSetResponse.fromXml($result);
  }

  /// Returns the details of the specified receipt rule.
  ///
  /// For information about setting up receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleDoesNotExistException].
  /// May throw [RuleSetDoesNotExistException].
  ///
  /// Parameter [ruleName] :
  /// The name of the receipt rule.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set that the receipt rule belongs to.
  Future<DescribeReceiptRuleResponse> describeReceiptRule({
    required String ruleName,
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      'RuleName': ruleName,
      'RuleSetName': ruleSetName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeReceiptRuleResult',
    );
    return DescribeReceiptRuleResponse.fromXml($result);
  }

  /// Returns the details of the specified receipt rule set.
  ///
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set to describe.
  Future<DescribeReceiptRuleSetResponse> describeReceiptRuleSet({
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      'RuleSetName': ruleSetName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeReceiptRuleSetResult',
    );
    return DescribeReceiptRuleSetResponse.fromXml($result);
  }

  /// Returns the email sending status of the Amazon SES account for the current
  /// Region.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetAccountSendingEnabledResponse> getAccountSendingEnabled() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetAccountSendingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetAccountSendingEnabledResult',
    );
    return GetAccountSendingEnabledResponse.fromXml($result);
  }

  /// Returns the custom email verification template for the template name you
  /// specify.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [CustomVerificationEmailTemplateDoesNotExistException].
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template to retrieve.
  Future<GetCustomVerificationEmailTemplateResponse>
      getCustomVerificationEmailTemplate({
    required String templateName,
  }) async {
    final $request = <String, String>{
      'TemplateName': templateName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetCustomVerificationEmailTemplateResult',
    );
    return GetCustomVerificationEmailTemplateResponse.fromXml($result);
  }

  /// Returns the current status of Easy DKIM signing for an entity. For domain
  /// name identities, this operation also returns the DKIM tokens that are
  /// required for Easy DKIM signing, and whether Amazon SES has successfully
  /// verified that these tokens have been published.
  ///
  /// This operation takes a list of identities as input and returns the
  /// following information for each:
  ///
  /// <ul>
  /// <li>
  /// Whether Easy DKIM signing is enabled or disabled.
  /// </li>
  /// <li>
  /// A set of DKIM tokens that represent the identity. If the identity is an
  /// email address, the tokens represent the domain of that address.
  /// </li>
  /// <li>
  /// Whether Amazon SES has successfully verified the DKIM tokens published in
  /// the domain's DNS. This information is only returned for domain name
  /// identities, not for email addresses.
  /// </li>
  /// </ul>
  /// This operation is throttled at one request per second and can only get
  /// DKIM attributes for up to 100 identities at a time.
  ///
  /// For more information about creating DNS records using DKIM tokens, go to
  /// the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy-managing.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [identities] :
  /// A list of one or more verified identities - email addresses, domains, or
  /// both.
  Future<GetIdentityDkimAttributesResponse> getIdentityDkimAttributes({
    required List<String> identities,
  }) async {
    final $request = <String, String>{
      if (identities.isEmpty)
        'Identities': ''
      else
        for (var i1 = 0; i1 < identities.length; i1++)
          'Identities.member.${i1 + 1}': identities[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityDkimAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetIdentityDkimAttributesResult',
    );
    return GetIdentityDkimAttributesResponse.fromXml($result);
  }

  /// Returns the custom MAIL FROM attributes for a list of identities (email
  /// addresses : domains).
  ///
  /// This operation is throttled at one request per second and can only get
  /// custom MAIL FROM attributes for up to 100 identities at a time.
  ///
  /// Parameter [identities] :
  /// A list of one or more identities.
  Future<GetIdentityMailFromDomainAttributesResponse>
      getIdentityMailFromDomainAttributes({
    required List<String> identities,
  }) async {
    final $request = <String, String>{
      if (identities.isEmpty)
        'Identities': ''
      else
        for (var i1 = 0; i1 < identities.length; i1++)
          'Identities.member.${i1 + 1}': identities[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityMailFromDomainAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetIdentityMailFromDomainAttributesResult',
    );
    return GetIdentityMailFromDomainAttributesResponse.fromXml($result);
  }

  /// Given a list of verified identities (email addresses and/or domains),
  /// returns a structure describing identity notification attributes.
  ///
  /// This operation is throttled at one request per second and can only get
  /// notification attributes for up to 100 identities at a time.
  ///
  /// For more information about using notifications with Amazon SES, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [identities] :
  /// A list of one or more identities. You can specify an identity by using its
  /// name or by using its Amazon Resource Name (ARN). Examples:
  /// <code>user@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  Future<GetIdentityNotificationAttributesResponse>
      getIdentityNotificationAttributes({
    required List<String> identities,
  }) async {
    final $request = <String, String>{
      if (identities.isEmpty)
        'Identities': ''
      else
        for (var i1 = 0; i1 < identities.length; i1++)
          'Identities.member.${i1 + 1}': identities[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityNotificationAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetIdentityNotificationAttributesResult',
    );
    return GetIdentityNotificationAttributesResponse.fromXml($result);
  }

  /// Returns the requested sending authorization policies for the given
  /// identity (an email address or a domain). The policies are returned as a
  /// map of policy names to policy contents. You can retrieve a maximum of 20
  /// policies at a time.
  /// <note>
  /// This operation is for the identity owner only. If you have not verified
  /// the identity, it returns an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identity] :
  /// The identity for which the policies are retrieved. You can specify an
  /// identity by using its name or by using its Amazon Resource Name (ARN).
  /// Examples: <code>user@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this operation, you must own the identity.
  ///
  /// Parameter [policyNames] :
  /// A list of the names of policies to be retrieved. You can retrieve a
  /// maximum of 20 policies at a time. If you do not know the names of the
  /// policies that are attached to the identity, you can use
  /// <code>ListIdentityPolicies</code>.
  Future<GetIdentityPoliciesResponse> getIdentityPolicies({
    required String identity,
    required List<String> policyNames,
  }) async {
    final $request = <String, String>{
      'Identity': identity,
      if (policyNames.isEmpty)
        'PolicyNames': ''
      else
        for (var i1 = 0; i1 < policyNames.length; i1++)
          'PolicyNames.member.${i1 + 1}': policyNames[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityPolicies',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetIdentityPoliciesResult',
    );
    return GetIdentityPoliciesResponse.fromXml($result);
  }

  /// Given a list of identities (email addresses and/or domains), returns the
  /// verification status and (for domain identities) the verification token for
  /// each identity.
  ///
  /// The verification status of an email address is "Pending" until the email
  /// address owner clicks the link within the verification email that Amazon
  /// SES sent to that address. If the email address owner clicks the link
  /// within 24 hours, the verification status of the email address changes to
  /// "Success". If the link is not clicked within 24 hours, the verification
  /// status changes to "Failed." In that case, to verify the email address, you
  /// must restart the verification process from the beginning.
  ///
  /// For domain identities, the domain's verification status is "Pending" as
  /// Amazon SES searches for the required TXT record in the DNS settings of the
  /// domain. When Amazon SES detects the record, the domain's verification
  /// status changes to "Success". If Amazon SES is unable to detect the record
  /// within 72 hours, the domain's verification status changes to "Failed." In
  /// that case, to verify the domain, you must restart the verification process
  /// from the beginning.
  ///
  /// This operation is throttled at one request per second and can only get
  /// verification attributes for up to 100 identities at a time.
  ///
  /// Parameter [identities] :
  /// A list of identities.
  Future<GetIdentityVerificationAttributesResponse>
      getIdentityVerificationAttributes({
    required List<String> identities,
  }) async {
    final $request = <String, String>{
      if (identities.isEmpty)
        'Identities': ''
      else
        for (var i1 = 0; i1 < identities.length; i1++)
          'Identities.member.${i1 + 1}': identities[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityVerificationAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetIdentityVerificationAttributesResult',
    );
    return GetIdentityVerificationAttributesResponse.fromXml($result);
  }

  /// Provides the sending limits for the Amazon SES account.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetSendQuotaResponse> getSendQuota() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetSendQuota',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetSendQuotaResult',
    );
    return GetSendQuotaResponse.fromXml($result);
  }

  /// Provides sending statistics for the current Amazon Web Services Region.
  /// The result is a list of data points, representing the last two weeks of
  /// sending activity. Each data point in the list contains statistics for a
  /// 15-minute period of time.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetSendStatisticsResponse> getSendStatistics() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetSendStatistics',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetSendStatisticsResult',
    );
    return GetSendStatisticsResponse.fromXml($result);
  }

  /// Displays the template object (which includes the Subject line, HTML part
  /// and text part) for the template you specify.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [TemplateDoesNotExistException].
  ///
  /// Parameter [templateName] :
  /// The name of the template to retrieve.
  Future<GetTemplateResponse> getTemplate({
    required String templateName,
  }) async {
    final $request = <String, String>{
      'TemplateName': templateName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetTemplateResult',
    );
    return GetTemplateResponse.fromXml($result);
  }

  /// Provides a list of the configuration sets associated with your Amazon SES
  /// account in the current Amazon Web Services Region. For information about
  /// using configuration sets, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Monitoring
  /// Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer
  /// Guide.</i>
  ///
  /// You can execute this operation no more than once per second. This
  /// operation returns up to 1,000 configuration sets each time it is run. If
  /// your Amazon SES account has more than 1,000 configuration sets, this
  /// operation also returns <code>NextToken</code>. You can then execute the
  /// <code>ListConfigurationSets</code> operation again, passing the
  /// <code>NextToken</code> parameter and the value of the NextToken element to
  /// retrieve additional results.
  ///
  /// Parameter [maxItems] :
  /// The number of configuration sets to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to
  /// <code>ListConfigurationSets</code> to indicate the position of the
  /// configuration set in the configuration set list.
  Future<ListConfigurationSetsResponse> listConfigurationSets({
    int? maxItems,
    String? nextToken,
  }) async {
    final $request = <String, String>{
      if (maxItems != null) 'MaxItems': maxItems.toString(),
      if (nextToken != null) 'NextToken': nextToken,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListConfigurationSets',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListConfigurationSetsResult',
    );
    return ListConfigurationSetsResponse.fromXml($result);
  }

  /// Lists the existing custom verification email templates for your account in
  /// the current Amazon Web Services Region.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom verification email templates to return. This
  /// value must be at least 1 and less than or equal to 50. If you do not
  /// specify a value, or if you specify a value less than 1 or greater than 50,
  /// the operation returns up to 50 results.
  ///
  /// Parameter [nextToken] :
  /// An array the contains the name and creation time stamp for each template
  /// in your Amazon SES account.
  Future<ListCustomVerificationEmailTemplatesResponse>
      listCustomVerificationEmailTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $request = <String, String>{
      if (maxResults != null) 'MaxResults': maxResults.toString(),
      if (nextToken != null) 'NextToken': nextToken,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListCustomVerificationEmailTemplates',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListCustomVerificationEmailTemplatesResult',
    );
    return ListCustomVerificationEmailTemplatesResponse.fromXml($result);
  }

  /// Returns a list containing all of the identities (email addresses and
  /// domains) for your Amazon Web Services account in the current Amazon Web
  /// Services Region, regardless of verification status.
  ///
  /// You can execute this operation no more than once per second.
  /// <note>
  /// It's recommended that for successive pagination calls of this API, you
  /// continue to the use the same parameter/value pairs as used in the original
  /// call, e.g., if you used <code>IdentityType=Domain</code> in the the
  /// original call and received a <code>NextToken</code> in the response, you
  /// should continue providing the <code>IdentityType=Domain</code> parameter
  /// for further <code>NextToken</code> calls; however, if you didn't provide
  /// the <code>IdentityType</code> parameter in the original call, then
  /// continue to not provide it for successive pagination calls. Using this
  /// protocol will ensure consistent results.
  /// </note>
  ///
  /// Parameter [identityType] :
  /// The type of the identities to list. Possible values are "EmailAddress" and
  /// "Domain". If this parameter is omitted, then all identities are listed.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of identities per page. Possible values are 1-1000
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// The token to use for pagination.
  Future<ListIdentitiesResponse> listIdentities({
    IdentityType? identityType,
    int? maxItems,
    String? nextToken,
  }) async {
    final $request = <String, String>{
      if (identityType != null) 'IdentityType': identityType.value,
      if (maxItems != null) 'MaxItems': maxItems.toString(),
      if (nextToken != null) 'NextToken': nextToken,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListIdentities',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListIdentitiesResult',
    );
    return ListIdentitiesResponse.fromXml($result);
  }

  /// Returns a list of sending authorization policies that are attached to the
  /// given identity (an email address or a domain). This operation returns only
  /// a list. To get the actual policy content, use
  /// <code>GetIdentityPolicies</code>.
  /// <note>
  /// This operation is for the identity owner only. If you have not verified
  /// the identity, it returns an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identity] :
  /// The identity that is associated with the policy for which the policies are
  /// listed. You can specify an identity by using its name or by using its
  /// Amazon Resource Name (ARN). Examples: <code>user@example.com</code>,
  /// <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this operation, you must own the identity.
  Future<ListIdentityPoliciesResponse> listIdentityPolicies({
    required String identity,
  }) async {
    final $request = <String, String>{
      'Identity': identity,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListIdentityPolicies',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListIdentityPoliciesResult',
    );
    return ListIdentityPoliciesResponse.fromXml($result);
  }

  /// Lists the IP address filters associated with your Amazon Web Services
  /// account in the current Amazon Web Services Region.
  ///
  /// For information about managing IP address filters, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  Future<ListReceiptFiltersResponse> listReceiptFilters() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListReceiptFilters',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListReceiptFiltersResult',
    );
    return ListReceiptFiltersResponse.fromXml($result);
  }

  /// Lists the receipt rule sets that exist under your Amazon Web Services
  /// account in the current Amazon Web Services Region. If there are additional
  /// receipt rule sets to be retrieved, you receive a <code>NextToken</code>
  /// that you can provide to the next call to <code>ListReceiptRuleSets</code>
  /// to retrieve the additional entries.
  ///
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListReceiptRuleSets</code>
  /// to indicate the position in the receipt rule set list.
  Future<ListReceiptRuleSetsResponse> listReceiptRuleSets({
    String? nextToken,
  }) async {
    final $request = <String, String>{
      if (nextToken != null) 'NextToken': nextToken,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListReceiptRuleSets',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListReceiptRuleSetsResult',
    );
    return ListReceiptRuleSetsResponse.fromXml($result);
  }

  /// Lists the email templates present in your Amazon SES account in the
  /// current Amazon Web Services Region.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of templates to return. This value must be at least 1
  /// and less than or equal to 100. If more than 100 items are requested, the
  /// page size will automatically set to 100. If you do not specify a value, 10
  /// is the default page size.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListTemplates</code> to
  /// indicate the position in the list of email templates.
  Future<ListTemplatesResponse> listTemplates({
    int? maxItems,
    String? nextToken,
  }) async {
    final $request = <String, String>{
      if (maxItems != null) 'MaxItems': maxItems.toString(),
      if (nextToken != null) 'NextToken': nextToken,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListTemplates',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListTemplatesResult',
    );
    return ListTemplatesResponse.fromXml($result);
  }

  /// Deprecated. Use the <code>ListIdentities</code> operation to list the
  /// email addresses and domains associated with your account.
  Future<ListVerifiedEmailAddressesResponse>
      listVerifiedEmailAddresses() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListVerifiedEmailAddresses',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListVerifiedEmailAddressesResult',
    );
    return ListVerifiedEmailAddressesResponse.fromXml($result);
  }

  /// Adds or updates the delivery options for a configuration set.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [InvalidDeliveryOptionsException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  ///
  /// Parameter [deliveryOptions] :
  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS).
  Future<void> putConfigurationSetDeliveryOptions({
    required String configurationSetName,
    DeliveryOptions? deliveryOptions,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      if (deliveryOptions != null)
        for (var e1 in deliveryOptions.toQueryMap().entries)
          'DeliveryOptions.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'PutConfigurationSetDeliveryOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'PutConfigurationSetDeliveryOptionsResult',
    );
  }

  /// Adds or updates a sending authorization policy for the specified identity
  /// (an email address or a domain).
  /// <note>
  /// This operation is for the identity owner only. If you have not verified
  /// the identity, it returns an error.
  /// </note>
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [InvalidPolicyException].
  ///
  /// Parameter [identity] :
  /// The identity to which that the policy applies. You can specify an identity
  /// by using its name or by using its Amazon Resource Name (ARN). Examples:
  /// <code>user@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this operation, you must own the identity.
  ///
  /// Parameter [policy] :
  /// The text of the policy in JSON format. The policy cannot exceed 4 KB.
  ///
  /// For information about the syntax of sending authorization policies, see
  /// the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-policies.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// The policy name cannot exceed 64 characters and can only include
  /// alphanumeric characters, dashes, and underscores.
  Future<void> putIdentityPolicy({
    required String identity,
    required String policy,
    required String policyName,
  }) async {
    final $request = <String, String>{
      'Identity': identity,
      'Policy': policy,
      'PolicyName': policyName,
    };
    await _protocol.send(
      $request,
      action: 'PutIdentityPolicy',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'PutIdentityPolicyResult',
    );
  }

  /// Reorders the receipt rules within a receipt rule set.
  /// <note>
  /// All of the rules in the rule set must be represented in this request. That
  /// is, it is error if the reorder request doesn't explicitly position all of
  /// the rules.
  /// </note>
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  /// May throw [RuleDoesNotExistException].
  ///
  /// Parameter [ruleNames] :
  /// The specified receipt rule set's receipt rules, in order.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set to reorder.
  Future<void> reorderReceiptRuleSet({
    required List<String> ruleNames,
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      if (ruleNames.isEmpty)
        'RuleNames': ''
      else
        for (var i1 = 0; i1 < ruleNames.length; i1++)
          'RuleNames.member.${i1 + 1}': ruleNames[i1],
      'RuleSetName': ruleSetName,
    };
    await _protocol.send(
      $request,
      action: 'ReorderReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ReorderReceiptRuleSetResult',
    );
  }

  /// Generates and sends a bounce message to the sender of an email you
  /// received through Amazon SES. You can only use this operation on an email
  /// up to 24 hours after you receive it.
  /// <note>
  /// You cannot use this operation to send generic bounces for mail that was
  /// not received by Amazon SES.
  /// </note>
  /// For information about receiving email through Amazon SES, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [MessageRejected].
  ///
  /// Parameter [bounceSender] :
  /// The address to use in the "From" header of the bounce message. This must
  /// be an identity that you have verified with Amazon SES.
  ///
  /// Parameter [bouncedRecipientInfoList] :
  /// A list of recipients of the bounced message, including the information
  /// required to create the Delivery Status Notifications (DSNs) for the
  /// recipients. You must specify at least one
  /// <code>BouncedRecipientInfo</code> in the list.
  ///
  /// Parameter [originalMessageId] :
  /// The message ID of the message to be bounced.
  ///
  /// Parameter [bounceSenderArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the address in the "From" header of the bounce. For
  /// more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [explanation] :
  /// Human-readable text for the bounce message to explain the failure. If not
  /// specified, the text is auto-generated based on the bounced recipient
  /// information.
  ///
  /// Parameter [messageDsn] :
  /// Message-related DSN fields. If not specified, Amazon SES chooses the
  /// values.
  Future<SendBounceResponse> sendBounce({
    required String bounceSender,
    required List<BouncedRecipientInfo> bouncedRecipientInfoList,
    required String originalMessageId,
    String? bounceSenderArn,
    String? explanation,
    MessageDsn? messageDsn,
  }) async {
    final $request = <String, String>{
      'BounceSender': bounceSender,
      if (bouncedRecipientInfoList.isEmpty)
        'BouncedRecipientInfoList': ''
      else
        for (var i1 = 0; i1 < bouncedRecipientInfoList.length; i1++)
          for (var e3 in bouncedRecipientInfoList[i1].toQueryMap().entries)
            'BouncedRecipientInfoList.member.${i1 + 1}.${e3.key}': e3.value,
      'OriginalMessageId': originalMessageId,
      if (bounceSenderArn != null) 'BounceSenderArn': bounceSenderArn,
      if (explanation != null) 'Explanation': explanation,
      if (messageDsn != null)
        for (var e1 in messageDsn.toQueryMap().entries)
          'MessageDsn.${e1.key}': e1.value,
    };
    final $result = await _protocol.send(
      $request,
      action: 'SendBounce',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SendBounceResult',
    );
    return SendBounceResponse.fromXml($result);
  }

  /// Composes an email message to multiple destinations. The message body is
  /// created using an email template.
  ///
  /// To send email using this operation, your call must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// The call must refer to an existing email template. You can create email
  /// templates using <a>CreateTemplate</a>.
  /// </li>
  /// <li>
  /// The message must be sent from a verified email address or domain.
  /// </li>
  /// <li>
  /// If your account is still in the Amazon SES sandbox, you may send only to
  /// verified addresses or domains, or to email addresses associated with the
  /// Amazon SES Mailbox Simulator. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html">Verifying
  /// Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i>
  /// </li>
  /// <li>
  /// The maximum message size is 10 MB.
  /// </li>
  /// <li>
  /// Each <code>Destination</code> parameter must include at least one
  /// recipient email address. The recipient address can be a To: address, a CC:
  /// address, or a BCC: address. If a recipient email address is invalid (that
  /// is, it is not in the format
  /// <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message is
  /// rejected, even if the message contains other recipients that are valid.
  /// </li>
  /// <li>
  /// The message may not include more than 50 recipients, across the To:, CC:
  /// and BCC: fields. If you need to send an email message to a larger
  /// audience, you can divide your recipient list into groups of 50 or fewer,
  /// and then call the <code>SendBulkTemplatedEmail</code> operation several
  /// times to send the message to each group.
  /// </li>
  /// <li>
  /// The number of destinations you can contact in a single call can be limited
  /// by your account's maximum sending rate.
  /// </li>
  /// </ul>
  ///
  /// May throw [MessageRejected].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [TemplateDoesNotExistException].
  /// May throw [ConfigurationSetSendingPausedException].
  /// May throw [AccountSendingPausedException].
  ///
  /// Parameter [defaultTemplateData] :
  /// A list of replacement values to apply to the template when replacement
  /// data is not specified in a Destination object. These values act as a
  /// default or fallback option when no other data is available.
  ///
  /// The template data is a JSON object, typically consisting of key-value
  /// pairs in which the keys correspond to replacement tags in the email
  /// template.
  ///
  /// Parameter [destinations] :
  /// One or more <code>Destination</code> objects. All of the recipients in a
  /// <code>Destination</code> receive the same version of the email. You can
  /// specify up to 50 <code>Destination</code> objects within a
  /// <code>Destinations</code> array.
  ///
  /// Parameter [source] :
  /// The email address that is sending the email. This email address must be
  /// either individually verified with Amazon SES, or from a domain that has
  /// been verified with Amazon SES. For information about verifying identities,
  /// see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// <code>SourceArn</code> parameter. For more information about sending
  /// authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in <a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason,
  /// the email address string must be 7-bit ASCII. If you want to send to or
  /// from email addresses that contain Unicode characters in the domain part of
  /// an address, you must encode the domain using Punycode. Punycode is not
  /// permitted in the local part of the email address (the part before the @
  /// sign) nor in the "friendly from" name. If you want to use Unicode
  /// characters in the "friendly from" name, you must encode the "friendly
  /// from" name using MIME encoded-word syntax, as described in <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html">Sending
  /// raw email using the Amazon SES API</a>. For more information about
  /// Punycode, see <a href="http://tools.ietf.org/html/rfc3492">RFC 3492</a>.
  /// </note>
  ///
  /// Parameter [template] :
  /// The template to use when sending this email.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use when you send an email using
  /// <code>SendBulkTemplatedEmail</code>.
  ///
  /// Parameter [defaultTags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send to a destination using <code>SendBulkTemplatedEmail</code>.
  ///
  /// Parameter [replyToAddresses] :
  /// The reply-to email address(es) for the message. If the recipient replies
  /// to the message, each reply-to address receives the reply.
  ///
  /// Parameter [returnPath] :
  /// The email address that bounces and complaints are forwarded to when
  /// feedback forwarding is enabled. If the message cannot be delivered to the
  /// recipient, then an error message is returned from the recipient's ISP;
  /// this message is forwarded to the email address specified by the
  /// <code>ReturnPath</code> parameter. The <code>ReturnPath</code> parameter
  /// is never overwritten. This email address must be either individually
  /// verified with Amazon SES, or from a domain that has been verified with
  /// Amazon SES.
  ///
  /// Parameter [returnPathArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>ReturnPath</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to use
  /// <code>feedback@example.com</code>, then you would specify the
  /// <code>ReturnPathArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>ReturnPath</code> to be <code>feedback@example.com</code>.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [sourceArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to send for the email address specified in the
  /// <code>Source</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to send from
  /// <code>user@example.com</code>, then you would specify the
  /// <code>SourceArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>Source</code> to be <code>user@example.com</code>.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [templateArn] :
  /// The ARN of the template to use when sending this email.
  Future<SendBulkTemplatedEmailResponse> sendBulkTemplatedEmail({
    required String defaultTemplateData,
    required List<BulkEmailDestination> destinations,
    required String source,
    required String template,
    String? configurationSetName,
    List<MessageTag>? defaultTags,
    List<String>? replyToAddresses,
    String? returnPath,
    String? returnPathArn,
    String? sourceArn,
    String? templateArn,
  }) async {
    final $request = <String, String>{
      'DefaultTemplateData': defaultTemplateData,
      if (destinations.isEmpty)
        'Destinations': ''
      else
        for (var i1 = 0; i1 < destinations.length; i1++)
          for (var e3 in destinations[i1].toQueryMap().entries)
            'Destinations.member.${i1 + 1}.${e3.key}': e3.value,
      'Source': source,
      'Template': template,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (defaultTags != null)
        if (defaultTags.isEmpty)
          'DefaultTags': ''
        else
          for (var i1 = 0; i1 < defaultTags.length; i1++)
            for (var e3 in defaultTags[i1].toQueryMap().entries)
              'DefaultTags.member.${i1 + 1}.${e3.key}': e3.value,
      if (replyToAddresses != null)
        if (replyToAddresses.isEmpty)
          'ReplyToAddresses': ''
        else
          for (var i1 = 0; i1 < replyToAddresses.length; i1++)
            'ReplyToAddresses.member.${i1 + 1}': replyToAddresses[i1],
      if (returnPath != null) 'ReturnPath': returnPath,
      if (returnPathArn != null) 'ReturnPathArn': returnPathArn,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (templateArn != null) 'TemplateArn': templateArn,
    };
    final $result = await _protocol.send(
      $request,
      action: 'SendBulkTemplatedEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SendBulkTemplatedEmailResult',
    );
    return SendBulkTemplatedEmailResponse.fromXml($result);
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
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [MessageRejected].
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [CustomVerificationEmailTemplateDoesNotExistException].
  /// May throw [FromEmailAddressNotVerifiedException].
  /// May throw [ProductionAccessNotGrantedException].
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
    final $request = <String, String>{
      'EmailAddress': emailAddress,
      'TemplateName': templateName,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'SendCustomVerificationEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SendCustomVerificationEmailResult',
    );
    return SendCustomVerificationEmailResponse.fromXml($result);
  }

  /// Composes an email message and immediately queues it for sending. To send
  /// email using this operation, your message must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// The message must be sent from a verified email address or domain. If you
  /// attempt to send email using a non-verified address or domain, the
  /// operation results in an "Email address not verified" error.
  /// </li>
  /// <li>
  /// If your account is still in the Amazon SES sandbox, you may only send to
  /// verified addresses or domains, or to email addresses associated with the
  /// Amazon SES Mailbox Simulator. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html">Verifying
  /// Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i>
  /// </li>
  /// <li>
  /// The maximum message size is 10 MB.
  /// </li>
  /// <li>
  /// The message must include at least one recipient email address. The
  /// recipient address can be a To: address, a CC: address, or a BCC: address.
  /// If a recipient email address is invalid (that is, it is not in the format
  /// <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message is
  /// rejected, even if the message contains other recipients that are valid.
  /// </li>
  /// <li>
  /// The message may not include more than 50 recipients, across the To:, CC:
  /// and BCC: fields. If you need to send an email message to a larger
  /// audience, you can divide your recipient list into groups of 50 or fewer,
  /// and then call the <code>SendEmail</code> operation several times to send
  /// the message to each group.
  /// </li>
  /// </ul> <important>
  /// For every message that you send, the total number of recipients (including
  /// each recipient in the To:, CC: and BCC: fields) is counted against the
  /// maximum number of emails you can send in a 24-hour period (your <i>sending
  /// quota</i>). For more information about sending quotas in Amazon SES, see
  /// <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/manage-sending-quotas.html">Managing
  /// Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer
  /// Guide.</i>
  /// </important>
  ///
  /// May throw [MessageRejected].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [ConfigurationSetSendingPausedException].
  /// May throw [AccountSendingPausedException].
  ///
  /// Parameter [destination] :
  /// The destination for this email, composed of To:, CC:, and BCC: fields.
  ///
  /// Parameter [message] :
  /// The message to be sent.
  ///
  /// Parameter [source] :
  /// The email address that is sending the email. This email address must be
  /// either individually verified with Amazon SES, or from a domain that has
  /// been verified with Amazon SES. For information about verifying identities,
  /// see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// <code>SourceArn</code> parameter. For more information about sending
  /// authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in <a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason,
  /// the email address string must be 7-bit ASCII. If you want to send to or
  /// from email addresses that contain Unicode characters in the domain part of
  /// an address, you must encode the domain using Punycode. Punycode is not
  /// permitted in the local part of the email address (the part before the @
  /// sign) nor in the "friendly from" name. If you want to use Unicode
  /// characters in the "friendly from" name, you must encode the "friendly
  /// from" name using MIME encoded-word syntax, as described in <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html">Sending
  /// raw email using the Amazon SES API</a>. For more information about
  /// Punycode, see <a href="http://tools.ietf.org/html/rfc3492">RFC 3492</a>.
  /// </note>
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use when you send an email using
  /// <code>SendEmail</code>.
  ///
  /// Parameter [replyToAddresses] :
  /// The reply-to email address(es) for the message. If the recipient replies
  /// to the message, each reply-to address receives the reply.
  ///
  /// Parameter [returnPath] :
  /// The email address that bounces and complaints are forwarded to when
  /// feedback forwarding is enabled. If the message cannot be delivered to the
  /// recipient, then an error message is returned from the recipient's ISP;
  /// this message is forwarded to the email address specified by the
  /// <code>ReturnPath</code> parameter. The <code>ReturnPath</code> parameter
  /// is never overwritten. This email address must be either individually
  /// verified with Amazon SES, or from a domain that has been verified with
  /// Amazon SES.
  ///
  /// Parameter [returnPathArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>ReturnPath</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to use
  /// <code>feedback@example.com</code>, then you would specify the
  /// <code>ReturnPathArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>ReturnPath</code> to be <code>feedback@example.com</code>.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [sourceArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to send for the email address specified in the
  /// <code>Source</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to send from
  /// <code>user@example.com</code>, then you would specify the
  /// <code>SourceArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>Source</code> to be <code>user@example.com</code>.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [tags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using <code>SendEmail</code>. Tags correspond to characteristics
  /// of the email that you define, so that you can publish email sending
  /// events.
  Future<SendEmailResponse> sendEmail({
    required Destination destination,
    required Message message,
    required String source,
    String? configurationSetName,
    List<String>? replyToAddresses,
    String? returnPath,
    String? returnPathArn,
    String? sourceArn,
    List<MessageTag>? tags,
  }) async {
    final $request = <String, String>{
      for (var e1 in destination.toQueryMap().entries)
        'Destination.${e1.key}': e1.value,
      for (var e1 in message.toQueryMap().entries)
        'Message.${e1.key}': e1.value,
      'Source': source,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (replyToAddresses != null)
        if (replyToAddresses.isEmpty)
          'ReplyToAddresses': ''
        else
          for (var i1 = 0; i1 < replyToAddresses.length; i1++)
            'ReplyToAddresses.member.${i1 + 1}': replyToAddresses[i1],
      if (returnPath != null) 'ReturnPath': returnPath,
      if (returnPathArn != null) 'ReturnPathArn': returnPathArn,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (tags != null)
        if (tags.isEmpty)
          'Tags': ''
        else
          for (var i1 = 0; i1 < tags.length; i1++)
            for (var e3 in tags[i1].toQueryMap().entries)
              'Tags.member.${i1 + 1}.${e3.key}': e3.value,
    };
    final $result = await _protocol.send(
      $request,
      action: 'SendEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SendEmailResult',
    );
    return SendEmailResponse.fromXml($result);
  }

  /// Composes an email message and immediately queues it for sending.
  ///
  /// This operation is more flexible than the <code>SendEmail</code> operation.
  /// When you use the <code>SendRawEmail</code> operation, you can specify the
  /// headers of the message as well as its content. This flexibility is useful,
  /// for example, when you need to send a multipart MIME email (such a message
  /// that contains both a text and an HTML version). You can also use this
  /// operation to send messages that include attachments.
  ///
  /// The <code>SendRawEmail</code> operation has the following requirements:
  ///
  /// <ul>
  /// <li>
  /// You can only send email from <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html">verified
  /// email addresses or domains</a>. If you try to send email from an address
  /// that isn't verified, the operation results in an "Email address not
  /// verified" error.
  /// </li>
  /// <li>
  /// If your account is still in the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/request-production-access.html">Amazon
  /// SES sandbox</a>, you can only send email to other verified addresses in
  /// your account, or to addresses that are associated with the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-an-email-from-console.html">Amazon
  /// SES mailbox simulator</a>.
  /// </li>
  /// <li>
  /// The maximum message size, including attachments, is 10 MB.
  /// </li>
  /// <li>
  /// Each message has to include at least one recipient address. A recipient
  /// address includes any address on the To:, CC:, or BCC: lines.
  /// </li>
  /// <li>
  /// If you send a single message to more than one recipient address, and one
  /// of the recipient addresses isn't in a valid format (that is, it's not in
  /// the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), Amazon SES
  /// rejects the entire message, even if the other addresses are valid.
  /// </li>
  /// <li>
  /// Each message can include up to 50 recipient addresses across the To:, CC:,
  /// or BCC: lines. If you need to send a single message to more than 50
  /// recipients, you have to split the list of recipient addresses into groups
  /// of less than 50 recipients, and send separate messages to each group.
  /// </li>
  /// <li>
  /// Amazon SES allows you to specify 8-bit Content-Transfer-Encoding for MIME
  /// message parts. However, if Amazon SES has to modify the contents of your
  /// message (for example, if you use open and click tracking), 8-bit content
  /// isn't preserved. For this reason, we highly recommend that you encode all
  /// content that isn't 7-bit ASCII. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html#send-email-mime-encoding">MIME
  /// Encoding</a> in the <i>Amazon SES Developer Guide</i>.
  /// </li>
  /// </ul>
  /// Additionally, keep the following considerations in mind when using the
  /// <code>SendRawEmail</code> operation:
  ///
  /// <ul>
  /// <li>
  /// Although you can customize the message headers when using the
  /// <code>SendRawEmail</code> operation, Amazon SES automatically applies its
  /// own <code>Message-ID</code> and <code>Date</code> headers; if you passed
  /// these headers when creating the message, they are overwritten by the
  /// values that Amazon SES provides.
  /// </li>
  /// <li>
  /// If you are using sending authorization to send on behalf of another user,
  /// <code>SendRawEmail</code> enables you to specify the cross-account
  /// identity for the email's Source, From, and Return-Path parameters in one
  /// of two ways: you can pass optional parameters <code>SourceArn</code>,
  /// <code>FromArn</code>, and/or <code>ReturnPathArn</code>, or you can
  /// include the following X-headers in the header of your raw email:
  ///
  /// <ul>
  /// <li>
  /// <code>X-SES-SOURCE-ARN</code>
  /// </li>
  /// <li>
  /// <code>X-SES-FROM-ARN</code>
  /// </li>
  /// <li>
  /// <code>X-SES-RETURN-PATH-ARN</code>
  /// </li>
  /// </ul> <important>
  /// Don't include these X-headers in the DKIM signature. Amazon SES removes
  /// these before it sends the email.
  /// </important>
  /// If you only specify the <code>SourceIdentityArn</code> parameter, Amazon
  /// SES sets the From and Return-Path addresses to the same identity that you
  /// specified.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Using
  /// Sending Authorization with Amazon SES</a> in the <i>Amazon SES Developer
  /// Guide.</i>
  /// </li>
  /// <li>
  /// For every message that you send, the total number of recipients (including
  /// each recipient in the To:, CC: and BCC: fields) is counted against the
  /// maximum number of emails you can send in a 24-hour period (your <i>sending
  /// quota</i>). For more information about sending quotas in Amazon SES, see
  /// <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/manage-sending-quotas.html">Managing
  /// Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer
  /// Guide.</i>
  /// </li>
  /// </ul>
  ///
  /// May throw [MessageRejected].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [ConfigurationSetSendingPausedException].
  /// May throw [AccountSendingPausedException].
  ///
  /// Parameter [rawMessage] :
  /// The raw email message itself. The message has to meet the following
  /// criteria:
  ///
  /// <ul>
  /// <li>
  /// The message has to contain a header and a body, separated by a blank line.
  /// </li>
  /// <li>
  /// All of the required header fields must be present in the message.
  /// </li>
  /// <li>
  /// Each part of a multipart MIME message must be formatted properly.
  /// </li>
  /// <li>
  /// Attachments must be of a content type that Amazon SES supports. For a list
  /// on unsupported content types, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/mime-types.html">Unsupported
  /// Attachment Types</a> in the <i>Amazon SES Developer Guide</i>.
  /// </li>
  /// <li>
  /// The entire message must be base64-encoded.
  /// </li>
  /// <li>
  /// If any of the MIME parts in your message contain content that is outside
  /// of the 7-bit ASCII character range, we highly recommend that you encode
  /// that content. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html">Sending
  /// Raw Email</a> in the <i>Amazon SES Developer Guide</i>.
  /// </li>
  /// <li>
  /// Per <a href="https://tools.ietf.org/html/rfc5321#section-4.5.3.1.6">RFC
  /// 5321</a>, the maximum length of each line of text, including the
  /// &lt;CRLF&gt;, must not exceed 1,000 characters.
  /// </li>
  /// </ul>
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use when you send an email using
  /// <code>SendRawEmail</code>.
  ///
  /// Parameter [destinations] :
  /// A list of destinations for the message, consisting of To:, CC:, and BCC:
  /// addresses.
  ///
  /// Parameter [fromArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to specify a particular "From" address in the header of the
  /// raw email.
  ///
  /// Instead of using this parameter, you can use the X-header
  /// <code>X-SES-FROM-ARN</code> in the raw message of the email. If you use
  /// both the <code>FromArn</code> parameter and the corresponding X-header,
  /// Amazon SES uses the value of the <code>FromArn</code> parameter.
  /// <note>
  /// For information about when to use this parameter, see the description of
  /// <code>SendRawEmail</code> in this guide, or see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-delegate-sender-tasks-email.html">Amazon
  /// SES Developer Guide</a>.
  /// </note>
  ///
  /// Parameter [returnPathArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>ReturnPath</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to use
  /// <code>feedback@example.com</code>, then you would specify the
  /// <code>ReturnPathArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>ReturnPath</code> to be <code>feedback@example.com</code>.
  ///
  /// Instead of using this parameter, you can use the X-header
  /// <code>X-SES-RETURN-PATH-ARN</code> in the raw message of the email. If you
  /// use both the <code>ReturnPathArn</code> parameter and the corresponding
  /// X-header, Amazon SES uses the value of the <code>ReturnPathArn</code>
  /// parameter.
  /// <note>
  /// For information about when to use this parameter, see the description of
  /// <code>SendRawEmail</code> in this guide, or see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-delegate-sender-tasks-email.html">Amazon
  /// SES Developer Guide</a>.
  /// </note>
  ///
  /// Parameter [source] :
  /// The identity's email address. If you do not provide a value for this
  /// parameter, you must specify a "From" address in the raw text of the
  /// message. (You can also specify both.)
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in<a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason,
  /// the email address string must be 7-bit ASCII. If you want to send to or
  /// from email addresses that contain Unicode characters in the domain part of
  /// an address, you must encode the domain using Punycode. Punycode is not
  /// permitted in the local part of the email address (the part before the @
  /// sign) nor in the "friendly from" name. If you want to use Unicode
  /// characters in the "friendly from" name, you must encode the "friendly
  /// from" name using MIME encoded-word syntax, as described in <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html">Sending
  /// raw email using the Amazon SES API</a>. For more information about
  /// Punycode, see <a href="http://tools.ietf.org/html/rfc3492">RFC 3492</a>.
  /// </note>
  /// If you specify the <code>Source</code> parameter and have feedback
  /// forwarding enabled, then bounces and complaints are sent to this email
  /// address. This takes precedence over any Return-Path header that you might
  /// include in the raw text of the message.
  ///
  /// Parameter [sourceArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to send for the email address specified in the
  /// <code>Source</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to send from
  /// <code>user@example.com</code>, then you would specify the
  /// <code>SourceArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>Source</code> to be <code>user@example.com</code>.
  ///
  /// Instead of using this parameter, you can use the X-header
  /// <code>X-SES-SOURCE-ARN</code> in the raw message of the email. If you use
  /// both the <code>SourceArn</code> parameter and the corresponding X-header,
  /// Amazon SES uses the value of the <code>SourceArn</code> parameter.
  /// <note>
  /// For information about when to use this parameter, see the description of
  /// <code>SendRawEmail</code> in this guide, or see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-delegate-sender-tasks-email.html">Amazon
  /// SES Developer Guide</a>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using <code>SendRawEmail</code>. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  Future<SendRawEmailResponse> sendRawEmail({
    required RawMessage rawMessage,
    String? configurationSetName,
    List<String>? destinations,
    String? fromArn,
    String? returnPathArn,
    String? source,
    String? sourceArn,
    List<MessageTag>? tags,
  }) async {
    final $request = <String, String>{
      for (var e1 in rawMessage.toQueryMap().entries)
        'RawMessage.${e1.key}': e1.value,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (destinations != null)
        if (destinations.isEmpty)
          'Destinations': ''
        else
          for (var i1 = 0; i1 < destinations.length; i1++)
            'Destinations.member.${i1 + 1}': destinations[i1],
      if (fromArn != null) 'FromArn': fromArn,
      if (returnPathArn != null) 'ReturnPathArn': returnPathArn,
      if (source != null) 'Source': source,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (tags != null)
        if (tags.isEmpty)
          'Tags': ''
        else
          for (var i1 = 0; i1 < tags.length; i1++)
            for (var e3 in tags[i1].toQueryMap().entries)
              'Tags.member.${i1 + 1}.${e3.key}': e3.value,
    };
    final $result = await _protocol.send(
      $request,
      action: 'SendRawEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SendRawEmailResult',
    );
    return SendRawEmailResponse.fromXml($result);
  }

  /// Composes an email message using an email template and immediately queues
  /// it for sending.
  ///
  /// To send email using this operation, your call must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// The call must refer to an existing email template. You can create email
  /// templates using the <a>CreateTemplate</a> operation.
  /// </li>
  /// <li>
  /// The message must be sent from a verified email address or domain.
  /// </li>
  /// <li>
  /// If your account is still in the Amazon SES sandbox, you may only send to
  /// verified addresses or domains, or to email addresses associated with the
  /// Amazon SES Mailbox Simulator. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html">Verifying
  /// Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i>
  /// </li>
  /// <li>
  /// The maximum message size is 10 MB.
  /// </li>
  /// <li>
  /// Calls to the <code>SendTemplatedEmail</code> operation may only include
  /// one <code>Destination</code> parameter. A destination is a set of
  /// recipients that receives the same version of the email. The
  /// <code>Destination</code> parameter can include up to 50 recipients, across
  /// the To:, CC: and BCC: fields.
  /// </li>
  /// <li>
  /// The <code>Destination</code> parameter must include at least one recipient
  /// email address. The recipient address can be a To: address, a CC: address,
  /// or a BCC: address. If a recipient email address is invalid (that is, it is
  /// not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the
  /// entire message is rejected, even if the message contains other recipients
  /// that are valid.
  /// </li>
  /// </ul> <important>
  /// If your call to the <code>SendTemplatedEmail</code> operation includes all
  /// of the required parameters, Amazon SES accepts it and returns a Message
  /// ID. However, if Amazon SES can't render the email because the template
  /// contains errors, it doesn't send the email. Additionally, because it
  /// already accepted the message, Amazon SES doesn't return a message stating
  /// that it was unable to send the email.
  ///
  /// For these reasons, we highly recommend that you set up Amazon SES to send
  /// you notifications when Rendering Failure events occur. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html">Sending
  /// Personalized Email Using the Amazon SES API</a> in the <i>Amazon Simple
  /// Email Service Developer Guide</i>.
  /// </important>
  ///
  /// May throw [MessageRejected].
  /// May throw [MailFromDomainNotVerifiedException].
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [TemplateDoesNotExistException].
  /// May throw [ConfigurationSetSendingPausedException].
  /// May throw [AccountSendingPausedException].
  ///
  /// Parameter [destination] :
  /// The destination for this email, composed of To:, CC:, and BCC: fields. A
  /// Destination can include up to 50 recipients across these three fields.
  ///
  /// Parameter [source] :
  /// The email address that is sending the email. This email address must be
  /// either individually verified with Amazon SES, or from a domain that has
  /// been verified with Amazon SES. For information about verifying identities,
  /// see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// <code>SourceArn</code> parameter. For more information about sending
  /// authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in <a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. for this reason,
  /// The email address string must be 7-bit ASCII. If you want to send to or
  /// from email addresses that contain Unicode characters in the domain part of
  /// an address, you must encode the domain using Punycode. Punycode is not
  /// permitted in the local part of the email address (the part before the @
  /// sign) nor in the "friendly from" name. If you want to use Unicode
  /// characters in the "friendly from" name, you must encode the "friendly
  /// from" name using MIME encoded-word syntax, as described in <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html">Sending
  /// raw email using the Amazon SES API</a>. For more information about
  /// Punycode, see <a href="http://tools.ietf.org/html/rfc3492">RFC 3492</a>.
  /// </note>
  ///
  /// Parameter [template] :
  /// The template to use when sending this email.
  ///
  /// Parameter [templateData] :
  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use when you send an email using
  /// <code>SendTemplatedEmail</code>.
  ///
  /// Parameter [replyToAddresses] :
  /// The reply-to email address(es) for the message. If the recipient replies
  /// to the message, each reply-to address receives the reply.
  ///
  /// Parameter [returnPath] :
  /// The email address that bounces and complaints are forwarded to when
  /// feedback forwarding is enabled. If the message cannot be delivered to the
  /// recipient, then an error message is returned from the recipient's ISP;
  /// this message is forwarded to the email address specified by the
  /// <code>ReturnPath</code> parameter. The <code>ReturnPath</code> parameter
  /// is never overwritten. This email address must be either individually
  /// verified with Amazon SES, or from a domain that has been verified with
  /// Amazon SES.
  ///
  /// Parameter [returnPathArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to use the email address specified in the
  /// <code>ReturnPath</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to use
  /// <code>feedback@example.com</code>, then you would specify the
  /// <code>ReturnPathArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>ReturnPath</code> to be <code>feedback@example.com</code>.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [sourceArn] :
  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to send for the email address specified in the
  /// <code>Source</code> parameter.
  ///
  /// For example, if the owner of <code>example.com</code> (which has ARN
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>)
  /// attaches a policy to it that authorizes you to send from
  /// <code>user@example.com</code>, then you would specify the
  /// <code>SourceArn</code> to be
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and
  /// the <code>Source</code> to be <code>user@example.com</code>.
  ///
  /// For more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [tags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using <code>SendTemplatedEmail</code>. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  ///
  /// Parameter [templateArn] :
  /// The ARN of the template to use when sending this email.
  Future<SendTemplatedEmailResponse> sendTemplatedEmail({
    required Destination destination,
    required String source,
    required String template,
    required String templateData,
    String? configurationSetName,
    List<String>? replyToAddresses,
    String? returnPath,
    String? returnPathArn,
    String? sourceArn,
    List<MessageTag>? tags,
    String? templateArn,
  }) async {
    final $request = <String, String>{
      for (var e1 in destination.toQueryMap().entries)
        'Destination.${e1.key}': e1.value,
      'Source': source,
      'Template': template,
      'TemplateData': templateData,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (replyToAddresses != null)
        if (replyToAddresses.isEmpty)
          'ReplyToAddresses': ''
        else
          for (var i1 = 0; i1 < replyToAddresses.length; i1++)
            'ReplyToAddresses.member.${i1 + 1}': replyToAddresses[i1],
      if (returnPath != null) 'ReturnPath': returnPath,
      if (returnPathArn != null) 'ReturnPathArn': returnPathArn,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (tags != null)
        if (tags.isEmpty)
          'Tags': ''
        else
          for (var i1 = 0; i1 < tags.length; i1++)
            for (var e3 in tags[i1].toQueryMap().entries)
              'Tags.member.${i1 + 1}.${e3.key}': e3.value,
      if (templateArn != null) 'TemplateArn': templateArn,
    };
    final $result = await _protocol.send(
      $request,
      action: 'SendTemplatedEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SendTemplatedEmailResult',
    );
    return SendTemplatedEmailResponse.fromXml($result);
  }

  /// Sets the specified receipt rule set as the active receipt rule set.
  /// <note>
  /// To disable your email-receiving through Amazon SES completely, you can
  /// call this operation with <code>RuleSetName</code> set to null.
  /// </note>
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set to make active. Setting this value to
  /// null disables all email receiving.
  Future<void> setActiveReceiptRuleSet({
    String? ruleSetName,
  }) async {
    final $request = <String, String>{
      if (ruleSetName != null) 'RuleSetName': ruleSetName,
    };
    await _protocol.send(
      $request,
      action: 'SetActiveReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SetActiveReceiptRuleSetResult',
    );
  }

  /// Enables or disables Easy DKIM signing of email sent from an identity. If
  /// Easy DKIM signing is enabled for a domain, then Amazon SES uses DKIM to
  /// sign all email that it sends from addresses on that domain. If Easy DKIM
  /// signing is enabled for an email address, then Amazon SES uses DKIM to sign
  /// all email it sends from that address.
  /// <note>
  /// For email addresses (for example, <code>user@example.com</code>), you can
  /// only enable DKIM signing if the corresponding domain (in this case,
  /// <code>example.com</code>) has been set up to use Easy DKIM.
  /// </note>
  /// You can enable DKIM signing for an identity at any time after you start
  /// the verification process for the identity, even if the verification
  /// process isn't complete.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about Easy DKIM signing, go to the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [dkimEnabled] :
  /// Sets whether DKIM signing is enabled for an identity. Set to
  /// <code>true</code> to enable DKIM signing for this identity;
  /// <code>false</code> to disable it.
  ///
  /// Parameter [identity] :
  /// The identity for which DKIM signing should be enabled or disabled.
  Future<void> setIdentityDkimEnabled({
    required bool dkimEnabled,
    required String identity,
  }) async {
    final $request = <String, String>{
      'DkimEnabled': dkimEnabled.toString(),
      'Identity': identity,
    };
    await _protocol.send(
      $request,
      action: 'SetIdentityDkimEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SetIdentityDkimEnabledResult',
    );
  }

  /// Given an identity (an email address or a domain), enables or disables
  /// whether Amazon SES forwards bounce and complaint notifications as email.
  /// Feedback forwarding can only be disabled when Amazon Simple Notification
  /// Service (Amazon SNS) topics are specified for both bounces and complaints.
  /// <note>
  /// Feedback forwarding does not apply to delivery notifications. Delivery
  /// notifications are only available through Amazon SNS.
  /// </note>
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about using notifications with Amazon SES, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [forwardingEnabled] :
  /// Sets whether Amazon SES forwards bounce and complaint notifications as
  /// email. <code>true</code> specifies that Amazon SES forwards bounce and
  /// complaint notifications as email, in addition to any Amazon SNS topic
  /// publishing otherwise specified. <code>false</code> specifies that Amazon
  /// SES publishes bounce and complaint notifications only through Amazon SNS.
  /// This value can only be set to <code>false</code> when Amazon SNS topics
  /// are set for both <code>Bounce</code> and <code>Complaint</code>
  /// notification types.
  ///
  /// Parameter [identity] :
  /// The identity for which to set bounce and complaint notification
  /// forwarding. Examples: <code>user@example.com</code>,
  /// <code>example.com</code>.
  Future<void> setIdentityFeedbackForwardingEnabled({
    required bool forwardingEnabled,
    required String identity,
  }) async {
    final $request = <String, String>{
      'ForwardingEnabled': forwardingEnabled.toString(),
      'Identity': identity,
    };
    await _protocol.send(
      $request,
      action: 'SetIdentityFeedbackForwardingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SetIdentityFeedbackForwardingEnabledResult',
    );
  }

  /// Given an identity (an email address or a domain), sets whether Amazon SES
  /// includes the original email headers in the Amazon Simple Notification
  /// Service (Amazon SNS) notifications of a specified type.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about using notifications with Amazon SES, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [enabled] :
  /// Sets whether Amazon SES includes the original email headers in Amazon SNS
  /// notifications of the specified notification type. A value of
  /// <code>true</code> specifies that Amazon SES includes headers in
  /// notifications, and a value of <code>false</code> specifies that Amazon SES
  /// does not include headers in notifications.
  ///
  /// This value can only be set when <code>NotificationType</code> is already
  /// set to use a particular Amazon SNS topic.
  ///
  /// Parameter [identity] :
  /// The identity for which to enable or disable headers in notifications.
  /// Examples: <code>user@example.com</code>, <code>example.com</code>.
  ///
  /// Parameter [notificationType] :
  /// The notification type for which to enable or disable headers in
  /// notifications.
  Future<void> setIdentityHeadersInNotificationsEnabled({
    required bool enabled,
    required String identity,
    required NotificationType notificationType,
  }) async {
    final $request = <String, String>{
      'Enabled': enabled.toString(),
      'Identity': identity,
      'NotificationType': notificationType.value,
    };
    await _protocol.send(
      $request,
      action: 'SetIdentityHeadersInNotificationsEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SetIdentityHeadersInNotificationsEnabledResult',
    );
  }

  /// Enables or disables the custom MAIL FROM domain setup for a verified
  /// identity (an email address or a domain).
  /// <important>
  /// To send emails using the specified MAIL FROM domain, you must add an MX
  /// record to your MAIL FROM domain's DNS settings. To ensure that your emails
  /// pass Sender Policy Framework (SPF) checks, you must also add or update an
  /// SPF record. For more information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/mail-from.html">Amazon SES
  /// Developer Guide</a>.
  /// </important>
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identity] :
  /// The verified identity.
  ///
  /// Parameter [behaviorOnMXFailure] :
  /// The action for Amazon SES to take if it cannot successfully read the
  /// required MX record when you send an email. If you choose
  /// <code>UseDefaultValue</code>, Amazon SES uses amazonses.com (or a
  /// subdomain of that) as the MAIL FROM domain. If you choose
  /// <code>RejectMessage</code>, Amazon SES returns a
  /// <code>MailFromDomainNotVerified</code> error and not send the email.
  ///
  /// The action specified in <code>BehaviorOnMXFailure</code> is taken when the
  /// custom MAIL FROM domain setup is in the <code>Pending</code>,
  /// <code>Failed</code>, and <code>TemporaryFailure</code> states.
  ///
  /// Parameter [mailFromDomain] :
  /// The custom MAIL FROM domain for the verified identity to use. The MAIL
  /// FROM domain must 1) be a subdomain of the verified identity, 2) not be
  /// used in a "From" address if the MAIL FROM domain is the destination of
  /// email feedback forwarding (for more information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/mail-from.html">Amazon SES
  /// Developer Guide</a>), and 3) not be used to receive emails. A value of
  /// <code>null</code> disables the custom MAIL FROM setting for the identity.
  Future<void> setIdentityMailFromDomain({
    required String identity,
    BehaviorOnMXFailure? behaviorOnMXFailure,
    String? mailFromDomain,
  }) async {
    final $request = <String, String>{
      'Identity': identity,
      if (behaviorOnMXFailure != null)
        'BehaviorOnMXFailure': behaviorOnMXFailure.value,
      if (mailFromDomain != null) 'MailFromDomain': mailFromDomain,
    };
    await _protocol.send(
      $request,
      action: 'SetIdentityMailFromDomain',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SetIdentityMailFromDomainResult',
    );
  }

  /// Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when
  /// delivering notifications. When you use this operation, you specify a
  /// verified identity, such as an email address or domain. When you send an
  /// email that uses the chosen identity in the Source field, Amazon SES sends
  /// notifications to the topic you specified. You can send bounce, complaint,
  /// or delivery notifications (or any combination of the three) to the Amazon
  /// SNS topic that you specify.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about feedback notification, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [identity] :
  /// The identity (email address or domain) for the Amazon SNS topic.
  /// <important>
  /// You can only specify a verified identity for this parameter.
  /// </important>
  /// You can specify an identity by using its name or by using its Amazon
  /// Resource Name (ARN). The following examples are all valid identities:
  /// <code>sender@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// Parameter [notificationType] :
  /// The type of notifications that are published to the specified Amazon SNS
  /// topic.
  ///
  /// Parameter [snsTopic] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter
  /// is omitted from the request or a null value is passed,
  /// <code>SnsTopic</code> is cleared and publishing is disabled.
  Future<void> setIdentityNotificationTopic({
    required String identity,
    required NotificationType notificationType,
    String? snsTopic,
  }) async {
    final $request = <String, String>{
      'Identity': identity,
      'NotificationType': notificationType.value,
      if (snsTopic != null) 'SnsTopic': snsTopic,
    };
    await _protocol.send(
      $request,
      action: 'SetIdentityNotificationTopic',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SetIdentityNotificationTopicResult',
    );
  }

  /// Sets the position of the specified receipt rule in the receipt rule set.
  ///
  /// For information about managing receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  /// May throw [RuleDoesNotExistException].
  ///
  /// Parameter [ruleName] :
  /// The name of the receipt rule to reposition.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set that contains the receipt rule to
  /// reposition.
  ///
  /// Parameter [after] :
  /// The name of the receipt rule after which to place the specified receipt
  /// rule.
  Future<void> setReceiptRulePosition({
    required String ruleName,
    required String ruleSetName,
    String? after,
  }) async {
    final $request = <String, String>{
      'RuleName': ruleName,
      'RuleSetName': ruleSetName,
      if (after != null) 'After': after,
    };
    await _protocol.send(
      $request,
      action: 'SetReceiptRulePosition',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SetReceiptRulePositionResult',
    );
  }

  /// Creates a preview of the MIME content of an email when provided with a
  /// template and a set of replacement data.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [TemplateDoesNotExistException].
  /// May throw [InvalidRenderingParameterException].
  /// May throw [MissingRenderingAttributeException].
  ///
  /// Parameter [templateData] :
  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  ///
  /// Parameter [templateName] :
  /// The name of the template to render.
  Future<TestRenderTemplateResponse> testRenderTemplate({
    required String templateData,
    required String templateName,
  }) async {
    final $request = <String, String>{
      'TemplateData': templateData,
      'TemplateName': templateName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'TestRenderTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'TestRenderTemplateResult',
    );
    return TestRenderTemplateResponse.fromXml($result);
  }

  /// Enables or disables email sending across your entire Amazon SES account in
  /// the current Amazon Web Services Region. You can use this operation in
  /// conjunction with Amazon CloudWatch alarms to temporarily pause email
  /// sending across your Amazon SES account in a given Amazon Web Services
  /// Region when reputation metrics (such as your bounce or complaint rates)
  /// reach certain thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [enabled] :
  /// Describes whether email sending is enabled or disabled for your Amazon SES
  /// account in the current Amazon Web Services Region.
  Future<void> updateAccountSendingEnabled({
    bool? enabled,
  }) async {
    final $request = <String, String>{
      if (enabled != null) 'Enabled': enabled.toString(),
    };
    await _protocol.send(
      $request,
      action: 'UpdateAccountSendingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the event destination of a configuration set. Event destinations
  /// are associated with configuration sets, which enable you to publish email
  /// sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon
  /// Simple Notification Service (Amazon SNS). For information about using
  /// configuration sets, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Monitoring
  /// Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer
  /// Guide.</i>
  /// <note>
  /// When you create or update an event destination, you must provide one, and
  /// only one, destination. The destination can be Amazon CloudWatch, Amazon
  /// Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).
  /// </note>
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [EventDestinationDoesNotExistException].
  /// May throw [InvalidCloudWatchDestinationException].
  /// May throw [InvalidFirehoseDestinationException].
  /// May throw [InvalidSNSDestinationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that contains the event destination.
  ///
  /// Parameter [eventDestination] :
  /// The event destination object.
  Future<void> updateConfigurationSetEventDestination({
    required String configurationSetName,
    required EventDestination eventDestination,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      for (var e1 in eventDestination.toQueryMap().entries)
        'EventDestination.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetEventDestination',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateConfigurationSetEventDestinationResult',
    );
  }

  /// Enables or disables the publishing of reputation metrics for emails sent
  /// using a specific configuration set in a given Amazon Web Services Region.
  /// Reputation metrics include bounce and complaint rates. These metrics are
  /// published to Amazon CloudWatch. By using CloudWatch, you can create alarms
  /// when bounce or complaint rates exceed certain thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to update.
  ///
  /// Parameter [enabled] :
  /// Describes whether or not Amazon SES publishes reputation metrics for the
  /// configuration set, such as bounce and complaint rates, to Amazon
  /// CloudWatch.
  Future<void> updateConfigurationSetReputationMetricsEnabled({
    required String configurationSetName,
    required bool enabled,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      'Enabled': enabled.toString(),
    };
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetReputationMetricsEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables or disables email sending for messages sent using a specific
  /// configuration set in a given Amazon Web Services Region. You can use this
  /// operation in conjunction with Amazon CloudWatch alarms to temporarily
  /// pause email sending for a configuration set when the reputation metrics
  /// for that configuration set (such as your bounce on complaint rate) exceed
  /// certain thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to update.
  ///
  /// Parameter [enabled] :
  /// Describes whether email sending is enabled or disabled for the
  /// configuration set.
  Future<void> updateConfigurationSetSendingEnabled({
    required String configurationSetName,
    required bool enabled,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      'Enabled': enabled.toString(),
    };
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetSendingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Modifies an association between a configuration set and a custom domain
  /// for open and click event tracking.
  ///
  /// By default, images and links used for tracking open and click events are
  /// hosted on domains operated by Amazon SES. You can configure a subdomain of
  /// your own to handle these events. For information about using custom
  /// domains, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [TrackingOptionsDoesNotExistException].
  /// May throw [InvalidTrackingOptionsException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set.
  Future<void> updateConfigurationSetTrackingOptions({
    required String configurationSetName,
    required TrackingOptions trackingOptions,
  }) async {
    final $request = <String, String>{
      'ConfigurationSetName': configurationSetName,
      for (var e1 in trackingOptions.toQueryMap().entries)
        'TrackingOptions.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetTrackingOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateConfigurationSetTrackingOptionsResult',
    );
  }

  /// Updates an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [CustomVerificationEmailTemplateDoesNotExistException].
  /// May throw [FromEmailAddressNotVerifiedException].
  /// May throw [CustomVerificationEmailInvalidContentException].
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template to update.
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
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom">Custom
  /// Verification Email Frequently Asked Questions</a> in the <i>Amazon SES
  /// Developer Guide</i>.
  ///
  /// Parameter [templateSubject] :
  /// The subject line of the custom verification email.
  Future<void> updateCustomVerificationEmailTemplate({
    required String templateName,
    String? failureRedirectionURL,
    String? fromEmailAddress,
    String? successRedirectionURL,
    String? templateContent,
    String? templateSubject,
  }) async {
    final $request = <String, String>{
      'TemplateName': templateName,
      if (failureRedirectionURL != null)
        'FailureRedirectionURL': failureRedirectionURL,
      if (fromEmailAddress != null) 'FromEmailAddress': fromEmailAddress,
      if (successRedirectionURL != null)
        'SuccessRedirectionURL': successRedirectionURL,
      if (templateContent != null) 'TemplateContent': templateContent,
      if (templateSubject != null) 'TemplateSubject': templateSubject,
    };
    await _protocol.send(
      $request,
      action: 'UpdateCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a receipt rule.
  ///
  /// For information about managing receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [InvalidSnsTopicException].
  /// May throw [InvalidS3ConfigurationException].
  /// May throw [InvalidLambdaFunctionException].
  /// May throw [RuleSetDoesNotExistException].
  /// May throw [RuleDoesNotExistException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [rule] :
  /// A data structure that contains the updated receipt rule information.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set that the receipt rule belongs to.
  Future<void> updateReceiptRule({
    required ReceiptRule rule,
    required String ruleSetName,
  }) async {
    final $request = <String, String>{
      for (var e1 in rule.toQueryMap().entries) 'Rule.${e1.key}': e1.value,
      'RuleSetName': ruleSetName,
    };
    await _protocol.send(
      $request,
      action: 'UpdateReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateReceiptRuleResult',
    );
  }

  /// Updates an email template. Email templates enable you to send personalized
  /// email to one or more destinations in a single operation. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [TemplateDoesNotExistException].
  /// May throw [InvalidTemplateException].
  Future<void> updateTemplate({
    required Template template,
  }) async {
    final $request = <String, String>{
      for (var e1 in template.toQueryMap().entries)
        'Template.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'UpdateTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateTemplateResult',
    );
  }

  /// Returns a set of DKIM tokens for a domain identity.
  /// <important>
  /// When you execute the <code>VerifyDomainDkim</code> operation, the domain
  /// that you specify is added to the list of identities that are associated
  /// with your account. This is true even if you haven't already associated the
  /// domain with your account by using the <code>VerifyDomainIdentity</code>
  /// operation. However, you can't send email from the domain until you either
  /// successfully <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#verify-domain-procedure">verify
  /// it</a> or you successfully <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html">set
  /// up DKIM for it</a>.
  /// </important>
  /// You use the tokens that are generated by this operation to create CNAME
  /// records. When Amazon SES detects that you've added these records to the
  /// DNS configuration for a domain, you can start sending email from that
  /// domain. You can start sending email even if you haven't added the TXT
  /// record provided by the VerifyDomainIdentity operation to the DNS
  /// configuration for your domain. All email that you send from the domain is
  /// authenticated using DKIM.
  ///
  /// To create the CNAME records for DKIM authentication, use the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <b>Name</b>: <i>token</i>._domainkey.<i>example.com</i>
  /// </li>
  /// <li>
  /// <b>Type</b>: CNAME
  /// </li>
  /// <li>
  /// <b>Value</b>: <i>token</i>.dkim.amazonses.com
  /// </li>
  /// </ul>
  /// In the preceding example, replace <i>token</i> with one of the tokens that
  /// are generated when you execute this operation. Replace <i>example.com</i>
  /// with your domain. Repeat this process for each token that's generated by
  /// this operation.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [domain] :
  /// The name of the domain to be verified for Easy DKIM signing.
  Future<VerifyDomainDkimResponse> verifyDomainDkim({
    required String domain,
  }) async {
    final $request = <String, String>{
      'Domain': domain,
    };
    final $result = await _protocol.send(
      $request,
      action: 'VerifyDomainDkim',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'VerifyDomainDkimResult',
    );
    return VerifyDomainDkimResponse.fromXml($result);
  }

  /// Adds a domain to the list of identities for your Amazon SES account in the
  /// current Amazon Web Services Region and attempts to verify it. For more
  /// information about verifying domains, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html">Verifying
  /// Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i>
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [domain] :
  /// The domain to be verified.
  Future<VerifyDomainIdentityResponse> verifyDomainIdentity({
    required String domain,
  }) async {
    final $request = <String, String>{
      'Domain': domain,
    };
    final $result = await _protocol.send(
      $request,
      action: 'VerifyDomainIdentity',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'VerifyDomainIdentityResult',
    );
    return VerifyDomainIdentityResponse.fromXml($result);
  }

  /// Deprecated. Use the <code>VerifyEmailIdentity</code> operation to verify a
  /// new email address.
  ///
  /// Parameter [emailAddress] :
  /// The email address to be verified.
  Future<void> verifyEmailAddress({
    required String emailAddress,
  }) async {
    final $request = <String, String>{
      'EmailAddress': emailAddress,
    };
    await _protocol.send(
      $request,
      action: 'VerifyEmailAddress',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds an email address to the list of identities for your Amazon SES
  /// account in the current Amazon Web Services Region and attempts to verify
  /// it. As a result of executing this operation, a verification email is sent
  /// to the specified address.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [emailAddress] :
  /// The email address to be verified.
  Future<void> verifyEmailIdentity({
    required String emailAddress,
  }) async {
    final $request = <String, String>{
      'EmailAddress': emailAddress,
    };
    await _protocol.send(
      $request,
      action: 'VerifyEmailIdentity',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'VerifyEmailIdentityResult',
    );
  }
}

/// When included in a receipt rule, this action adds a header to the received
/// email.
///
/// For information about adding a header using a receipt rule, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-add-header.html">Amazon
/// SES Developer Guide</a>.
class AddHeaderAction {
  /// The name of the header to add to the incoming message. The name must contain
  /// at least one character, and can contain up to 50 characters. It consists of
  /// alphanumeric (a–z, A–Z, 0–9) characters and dashes.
  final String headerName;

  /// The content to include in the header. This value can contain up to 2048
  /// characters. It can't contain newline (<code>\n</code>) or carriage return
  /// (<code>\r</code>) characters.
  final String headerValue;

  AddHeaderAction({
    required this.headerName,
    required this.headerValue,
  });
  factory AddHeaderAction.fromXml(_s.XmlElement elem) {
    return AddHeaderAction(
      headerName: _s.extractXmlStringValue(elem, 'HeaderName')!,
      headerValue: _s.extractXmlStringValue(elem, 'HeaderValue')!,
    );
  }

  Map<String, dynamic> toJson() {
    final headerName = this.headerName;
    final headerValue = this.headerValue;
    return {
      'HeaderName': headerName,
      'HeaderValue': headerValue,
    };
  }

  Map<String, String> toQueryMap() {
    final headerName = this.headerName;
    final headerValue = this.headerValue;
    return {
      'HeaderName': headerName,
      'HeaderValue': headerValue,
    };
  }
}

enum BehaviorOnMXFailure {
  useDefaultValue('UseDefaultValue'),
  rejectMessage('RejectMessage'),
  ;

  final String value;

  const BehaviorOnMXFailure(this.value);

  static BehaviorOnMXFailure fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum BehaviorOnMXFailure'));
}

/// Represents the body of the message. You can specify text, HTML, or both. If
/// you use both, then the message should display correctly in the widest
/// variety of email clients.
class Body {
  /// The content of the message, in HTML format. Use this for email clients that
  /// can process HTML. You can include clickable links, formatted text, and much
  /// more in an HTML message.
  final Content? html;

  /// The content of the message, in text format. Use this for text-based email
  /// clients, or clients on high-latency networks (such as mobile devices).
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

  Map<String, String> toQueryMap() {
    final html = this.html;
    final text = this.text;
    return {
      if (html != null)
        for (var e1 in html.toQueryMap().entries) 'Html.${e1.key}': e1.value,
      if (text != null)
        for (var e1 in text.toQueryMap().entries) 'Text.${e1.key}': e1.value,
    };
  }
}

/// When included in a receipt rule, this action rejects the received email by
/// returning a bounce response to the sender and, optionally, publishes a
/// notification to Amazon Simple Notification Service (Amazon SNS).
///
/// For information about sending a bounce message in response to a received
/// email, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-bounce.html">Amazon
/// SES Developer Guide</a>.
class BounceAction {
  /// Human-readable text to include in the bounce message.
  final String message;

  /// The email address of the sender of the bounced email. This is the address
  /// from which the bounce message is sent.
  final String sender;

  /// The SMTP reply code, as defined by <a
  /// href="https://tools.ietf.org/html/rfc5321">RFC 5321</a>.
  final String smtpReplyCode;

  /// The SMTP enhanced status code, as defined by <a
  /// href="https://tools.ietf.org/html/rfc3463">RFC 3463</a>.
  final String? statusCode;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// bounce action is taken. You can find the ARN of a topic by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html">ListTopics</a>
  /// operation in Amazon SNS.
  ///
  /// For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String? topicArn;

  BounceAction({
    required this.message,
    required this.sender,
    required this.smtpReplyCode,
    this.statusCode,
    this.topicArn,
  });
  factory BounceAction.fromXml(_s.XmlElement elem) {
    return BounceAction(
      message: _s.extractXmlStringValue(elem, 'Message')!,
      sender: _s.extractXmlStringValue(elem, 'Sender')!,
      smtpReplyCode: _s.extractXmlStringValue(elem, 'SmtpReplyCode')!,
      statusCode: _s.extractXmlStringValue(elem, 'StatusCode'),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final sender = this.sender;
    final smtpReplyCode = this.smtpReplyCode;
    final statusCode = this.statusCode;
    final topicArn = this.topicArn;
    return {
      'Message': message,
      'Sender': sender,
      'SmtpReplyCode': smtpReplyCode,
      if (statusCode != null) 'StatusCode': statusCode,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }

  Map<String, String> toQueryMap() {
    final message = this.message;
    final sender = this.sender;
    final smtpReplyCode = this.smtpReplyCode;
    final statusCode = this.statusCode;
    final topicArn = this.topicArn;
    return {
      'Message': message,
      'Sender': sender,
      'SmtpReplyCode': smtpReplyCode,
      if (statusCode != null) 'StatusCode': statusCode,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

enum BounceType {
  doesNotExist('DoesNotExist'),
  messageTooLarge('MessageTooLarge'),
  exceededQuota('ExceededQuota'),
  contentRejected('ContentRejected'),
  undefined('Undefined'),
  temporaryFailure('TemporaryFailure'),
  ;

  final String value;

  const BounceType(this.value);

  static BounceType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum BounceType'));
}

/// Recipient-related information to include in the Delivery Status Notification
/// (DSN) when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html">Amazon
/// SES Developer Guide</a>.
class BouncedRecipientInfo {
  /// The email address of the recipient of the bounced email.
  final String recipient;

  /// The reason for the bounce. You must provide either this parameter or
  /// <code>RecipientDsnFields</code>.
  final BounceType? bounceType;

  /// This parameter is used only for sending authorization. It is the ARN of the
  /// identity that is associated with the sending authorization policy that
  /// permits you to receive email for the recipient of the bounced email. For
  /// more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  final String? recipientArn;

  /// Recipient-related DSN fields, most of which would normally be filled in
  /// automatically when provided with a <code>BounceType</code>. You must provide
  /// either this parameter or <code>BounceType</code>.
  final RecipientDsnFields? recipientDsnFields;

  BouncedRecipientInfo({
    required this.recipient,
    this.bounceType,
    this.recipientArn,
    this.recipientDsnFields,
  });

  Map<String, dynamic> toJson() {
    final recipient = this.recipient;
    final bounceType = this.bounceType;
    final recipientArn = this.recipientArn;
    final recipientDsnFields = this.recipientDsnFields;
    return {
      'Recipient': recipient,
      if (bounceType != null) 'BounceType': bounceType.value,
      if (recipientArn != null) 'RecipientArn': recipientArn,
      if (recipientDsnFields != null) 'RecipientDsnFields': recipientDsnFields,
    };
  }

  Map<String, String> toQueryMap() {
    final recipient = this.recipient;
    final bounceType = this.bounceType;
    final recipientArn = this.recipientArn;
    final recipientDsnFields = this.recipientDsnFields;
    return {
      'Recipient': recipient,
      if (bounceType != null) 'BounceType': bounceType.value,
      if (recipientArn != null) 'RecipientArn': recipientArn,
      if (recipientDsnFields != null)
        for (var e1 in recipientDsnFields.toQueryMap().entries)
          'RecipientDsnFields.${e1.key}': e1.value,
    };
  }
}

/// An array that contains one or more Destinations, as well as the tags and
/// replacement data associated with each of those Destinations.
class BulkEmailDestination {
  final Destination destination;

  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using <code>SendBulkTemplatedEmail</code>. Tags correspond to
  /// characteristics of the email that you define, so that you can publish email
  /// sending events.
  final List<MessageTag>? replacementTags;

  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  final String? replacementTemplateData;

  BulkEmailDestination({
    required this.destination,
    this.replacementTags,
    this.replacementTemplateData,
  });

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final replacementTags = this.replacementTags;
    final replacementTemplateData = this.replacementTemplateData;
    return {
      'Destination': destination,
      if (replacementTags != null) 'ReplacementTags': replacementTags,
      if (replacementTemplateData != null)
        'ReplacementTemplateData': replacementTemplateData,
    };
  }

  Map<String, String> toQueryMap() {
    final destination = this.destination;
    final replacementTags = this.replacementTags;
    final replacementTemplateData = this.replacementTemplateData;
    return {
      for (var e1 in destination.toQueryMap().entries)
        'Destination.${e1.key}': e1.value,
      if (replacementTags != null)
        if (replacementTags.isEmpty)
          'ReplacementTags': ''
        else
          for (var i1 = 0; i1 < replacementTags.length; i1++)
            for (var e3 in replacementTags[i1].toQueryMap().entries)
              'ReplacementTags.member.${i1 + 1}.${e3.key}': e3.value,
      if (replacementTemplateData != null)
        'ReplacementTemplateData': replacementTemplateData,
    };
  }
}

/// An object that contains the response from the
/// <code>SendBulkTemplatedEmail</code> operation.
class BulkEmailDestinationStatus {
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
  /// <code>Success</code>: Amazon SES accepted the message, and attempts to
  /// deliver it to the recipients.
  /// </li>
  /// <li>
  /// <code>MessageRejected</code>: The message was rejected because it contained
  /// a virus.
  /// </li>
  /// <li>
  /// <code>MailFromDomainNotVerified</code>: The sender's email address or domain
  /// was not verified.
  /// </li>
  /// <li>
  /// <code>ConfigurationSetDoesNotExist</code>: The configuration set you
  /// specified does not exist.
  /// </li>
  /// <li>
  /// <code>TemplateDoesNotExist</code>: The template you specified does not
  /// exist.
  /// </li>
  /// <li>
  /// <code>AccountSuspended</code>: Your account has been shut down because of
  /// issues related to your email sending practices.
  /// </li>
  /// <li>
  /// <code>AccountThrottled</code>: The number of emails you can send has been
  /// reduced because your account has exceeded its allocated sending limit.
  /// </li>
  /// <li>
  /// <code>AccountDailyQuotaExceeded</code>: You have reached or exceeded the
  /// maximum number of emails you can send from your account in a 24-hour period.
  /// </li>
  /// <li>
  /// <code>InvalidSendingPoolName</code>: The configuration set you specified
  /// refers to an IP pool that does not exist.
  /// </li>
  /// <li>
  /// <code>AccountSendingPaused</code>: Email sending for the Amazon SES account
  /// was disabled using the <a>UpdateAccountSendingEnabled</a> operation.
  /// </li>
  /// <li>
  /// <code>ConfigurationSetSendingPaused</code>: Email sending for this
  /// configuration set was disabled using the
  /// <a>UpdateConfigurationSetSendingEnabled</a> operation.
  /// </li>
  /// <li>
  /// <code>InvalidParameterValue</code>: One or more of the parameters you
  /// specified when calling this operation was invalid. See the error message for
  /// additional information.
  /// </li>
  /// <li>
  /// <code>TransientFailure</code>: Amazon SES was unable to process your request
  /// because of a temporary issue.
  /// </li>
  /// <li>
  /// <code>Failed</code>: Amazon SES was unable to process your request. See the
  /// error message for additional information.
  /// </li>
  /// </ul>
  final BulkEmailStatus? status;

  BulkEmailDestinationStatus({
    this.error,
    this.messageId,
    this.status,
  });
  factory BulkEmailDestinationStatus.fromXml(_s.XmlElement elem) {
    return BulkEmailDestinationStatus(
      error: _s.extractXmlStringValue(elem, 'Error'),
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.let(BulkEmailStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final messageId = this.messageId;
    final status = this.status;
    return {
      if (error != null) 'Error': error,
      if (messageId != null) 'MessageId': messageId,
      if (status != null) 'Status': status.value,
    };
  }
}

enum BulkEmailStatus {
  success('Success'),
  messageRejected('MessageRejected'),
  mailFromDomainNotVerified('MailFromDomainNotVerified'),
  configurationSetDoesNotExist('ConfigurationSetDoesNotExist'),
  templateDoesNotExist('TemplateDoesNotExist'),
  accountSuspended('AccountSuspended'),
  accountThrottled('AccountThrottled'),
  accountDailyQuotaExceeded('AccountDailyQuotaExceeded'),
  invalidSendingPoolName('InvalidSendingPoolName'),
  accountSendingPaused('AccountSendingPaused'),
  configurationSetSendingPaused('ConfigurationSetSendingPaused'),
  invalidParameterValue('InvalidParameterValue'),
  transientFailure('TransientFailure'),
  failed('Failed'),
  ;

  final String value;

  const BulkEmailStatus(this.value);

  static BulkEmailStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum BulkEmailStatus'));
}

/// An empty element returned on a successful request.
class CloneReceiptRuleSetResponse {
  CloneReceiptRuleSetResponse();
  factory CloneReceiptRuleSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CloneReceiptRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information associated with an Amazon CloudWatch event destination
/// to which email sending events are published.
///
/// Event destinations, such as Amazon CloudWatch, are associated with
/// configuration sets, which enable you to publish email sending events. For
/// information about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class CloudWatchDestination {
  /// A list of dimensions upon which to categorize your emails when you publish
  /// email sending events to Amazon CloudWatch.
  final List<CloudWatchDimensionConfiguration> dimensionConfigurations;

  CloudWatchDestination({
    required this.dimensionConfigurations,
  });
  factory CloudWatchDestination.fromXml(_s.XmlElement elem) {
    return CloudWatchDestination(
      dimensionConfigurations: _s
          .extractXmlChild(elem, 'DimensionConfigurations')!
          .findElements('member')
          .map(CloudWatchDimensionConfiguration.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionConfigurations = this.dimensionConfigurations;
    return {
      'DimensionConfigurations': dimensionConfigurations,
    };
  }

  Map<String, String> toQueryMap() {
    final dimensionConfigurations = this.dimensionConfigurations;
    return {
      if (dimensionConfigurations.isEmpty)
        'DimensionConfigurations': ''
      else
        for (var i1 = 0; i1 < dimensionConfigurations.length; i1++)
          for (var e3 in dimensionConfigurations[i1].toQueryMap().entries)
            'DimensionConfigurations.member.${i1 + 1}.${e3.key}': e3.value,
    };
  }
}

/// Contains the dimension configuration to use when you publish email sending
/// events to Amazon CloudWatch.
///
/// For information about publishing email sending events to Amazon CloudWatch,
/// see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class CloudWatchDimensionConfiguration {
  /// The default value of the dimension that is published to Amazon CloudWatch if
  /// you do not provide the value of the dimension when you send an email. The
  /// default value must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_),
  /// dashes (-), at signs (@), or periods (.).
  /// </li>
  /// <li>
  /// Contain 256 characters or fewer.
  /// </li>
  /// </ul>
  final String defaultDimensionValue;

  /// The name of an Amazon CloudWatch dimension associated with an email sending
  /// metric. The name must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_),
  /// dashes (-), or colons (:).
  /// </li>
  /// <li>
  /// Contain 256 characters or fewer.
  /// </li>
  /// </ul>
  final String dimensionName;

  /// The place where Amazon SES finds the value of a dimension to publish to
  /// Amazon CloudWatch. To use the message tags that you specify using an
  /// <code>X-SES-MESSAGE-TAGS</code> header or a parameter to the
  /// <code>SendEmail</code>/<code>SendRawEmail</code> API, specify
  /// <code>messageTag</code>. To use your own email headers, specify
  /// <code>emailHeader</code>. To put a custom tag on any link included in your
  /// email, specify <code>linkTag</code>.
  final DimensionValueSource dimensionValueSource;

  CloudWatchDimensionConfiguration({
    required this.defaultDimensionValue,
    required this.dimensionName,
    required this.dimensionValueSource,
  });
  factory CloudWatchDimensionConfiguration.fromXml(_s.XmlElement elem) {
    return CloudWatchDimensionConfiguration(
      defaultDimensionValue:
          _s.extractXmlStringValue(elem, 'DefaultDimensionValue')!,
      dimensionName: _s.extractXmlStringValue(elem, 'DimensionName')!,
      dimensionValueSource: _s
          .extractXmlStringValue(elem, 'DimensionValueSource')!
          .let(DimensionValueSource.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultDimensionValue = this.defaultDimensionValue;
    final dimensionName = this.dimensionName;
    final dimensionValueSource = this.dimensionValueSource;
    return {
      'DefaultDimensionValue': defaultDimensionValue,
      'DimensionName': dimensionName,
      'DimensionValueSource': dimensionValueSource.value,
    };
  }

  Map<String, String> toQueryMap() {
    final defaultDimensionValue = this.defaultDimensionValue;
    final dimensionName = this.dimensionName;
    final dimensionValueSource = this.dimensionValueSource;
    return {
      'DefaultDimensionValue': defaultDimensionValue,
      'DimensionName': dimensionName,
      'DimensionValueSource': dimensionValueSource.value,
    };
  }
}

/// The name of the configuration set.
///
/// Configuration sets let you create groups of rules that you can apply to the
/// emails you send using Amazon SES. For more information about using
/// configuration sets, see <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/using-configuration-sets.html">Using
/// Amazon SES Configuration Sets</a> in the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/">Amazon SES Developer
/// Guide</a>.
class ConfigurationSet {
  /// The name of the configuration set. The name must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes
  /// (-).
  /// </li>
  /// <li>
  /// Contain 64 characters or fewer.
  /// </li>
  /// </ul>
  final String name;

  ConfigurationSet({
    required this.name,
  });
  factory ConfigurationSet.fromXml(_s.XmlElement elem) {
    return ConfigurationSet(
      name: _s.extractXmlStringValue(elem, 'Name')!,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }

  Map<String, String> toQueryMap() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

enum ConfigurationSetAttribute {
  eventDestinations('eventDestinations'),
  trackingOptions('trackingOptions'),
  deliveryOptions('deliveryOptions'),
  reputationOptions('reputationOptions'),
  ;

  final String value;

  const ConfigurationSetAttribute(this.value);

  static ConfigurationSetAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConfigurationSetAttribute'));
}

/// Represents textual data, plus an optional character set specification.
///
/// By default, the text must be 7-bit ASCII, due to the constraints of the SMTP
/// protocol. If the text must contain any other characters, then you must also
/// specify a character set. Examples include UTF-8, ISO-8859-1, and Shift_JIS.
class Content {
  /// The textual data of the content.
  final String data;

  /// The character set of the content.
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

  Map<String, String> toQueryMap() {
    final data = this.data;
    final charset = this.charset;
    return {
      'Data': data,
      if (charset != null) 'Charset': charset,
    };
  }
}

/// An empty element returned on a successful request.
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();
  factory CreateConfigurationSetEventDestinationResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();
  factory CreateConfigurationSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateConfigurationSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class CreateConfigurationSetTrackingOptionsResponse {
  CreateConfigurationSetTrackingOptionsResponse();
  factory CreateConfigurationSetTrackingOptionsResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateConfigurationSetTrackingOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class CreateReceiptFilterResponse {
  CreateReceiptFilterResponse();
  factory CreateReceiptFilterResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateReceiptFilterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class CreateReceiptRuleResponse {
  CreateReceiptRuleResponse();
  factory CreateReceiptRuleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateReceiptRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class CreateReceiptRuleSetResponse {
  CreateReceiptRuleSetResponse();
  factory CreateReceiptRuleSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateReceiptRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateTemplateResponse {
  CreateTemplateResponse();
  factory CreateTemplateResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum CustomMailFromStatus {
  pending('Pending'),
  success('Success'),
  failed('Failed'),
  temporaryFailure('TemporaryFailure'),
  ;

  final String value;

  const CustomMailFromStatus(this.value);

  static CustomMailFromStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CustomMailFromStatus'));
}

/// Contains information about a custom verification email template.
class CustomVerificationEmailTemplate {
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

  CustomVerificationEmailTemplate({
    this.failureRedirectionURL,
    this.fromEmailAddress,
    this.successRedirectionURL,
    this.templateName,
    this.templateSubject,
  });
  factory CustomVerificationEmailTemplate.fromXml(_s.XmlElement elem) {
    return CustomVerificationEmailTemplate(
      failureRedirectionURL:
          _s.extractXmlStringValue(elem, 'FailureRedirectionURL'),
      fromEmailAddress: _s.extractXmlStringValue(elem, 'FromEmailAddress'),
      successRedirectionURL:
          _s.extractXmlStringValue(elem, 'SuccessRedirectionURL'),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
      templateSubject: _s.extractXmlStringValue(elem, 'TemplateSubject'),
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

/// An empty element returned on a successful request.
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();
  factory DeleteConfigurationSetEventDestinationResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();
  factory DeleteConfigurationSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteConfigurationSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class DeleteConfigurationSetTrackingOptionsResponse {
  DeleteConfigurationSetTrackingOptionsResponse();
  factory DeleteConfigurationSetTrackingOptionsResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteConfigurationSetTrackingOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class DeleteIdentityPolicyResponse {
  DeleteIdentityPolicyResponse();
  factory DeleteIdentityPolicyResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteIdentityPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class DeleteIdentityResponse {
  DeleteIdentityResponse();
  factory DeleteIdentityResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteIdentityResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class DeleteReceiptFilterResponse {
  DeleteReceiptFilterResponse();
  factory DeleteReceiptFilterResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteReceiptFilterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class DeleteReceiptRuleResponse {
  DeleteReceiptRuleResponse();
  factory DeleteReceiptRuleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteReceiptRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class DeleteReceiptRuleSetResponse {
  DeleteReceiptRuleSetResponse();
  factory DeleteReceiptRuleSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteReceiptRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTemplateResponse {
  DeleteTemplateResponse();
  factory DeleteTemplateResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies whether messages that use the configuration set are required to
/// use Transport Layer Security (TLS).
class DeliveryOptions {
  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS). If the value is <code>Require</code>,
  /// messages are only delivered if a TLS connection can be established. If the
  /// value is <code>Optional</code>, messages can be delivered in plain text if a
  /// TLS connection can't be established.
  final TlsPolicy? tlsPolicy;

  DeliveryOptions({
    this.tlsPolicy,
  });
  factory DeliveryOptions.fromXml(_s.XmlElement elem) {
    return DeliveryOptions(
      tlsPolicy: _s
          .extractXmlStringValue(elem, 'TlsPolicy')
          ?.let(TlsPolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final tlsPolicy = this.tlsPolicy;
    return {
      if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.value,
    };
  }

  Map<String, String> toQueryMap() {
    final tlsPolicy = this.tlsPolicy;
    return {
      if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.value,
    };
  }
}

/// Represents the metadata and receipt rules for the receipt rule set that is
/// currently active.
class DescribeActiveReceiptRuleSetResponse {
  /// The metadata for the currently active receipt rule set. The metadata
  /// consists of the rule set name and a timestamp of when the rule set was
  /// created.
  final ReceiptRuleSetMetadata? metadata;

  /// The receipt rules that belong to the active rule set.
  final List<ReceiptRule>? rules;

  DescribeActiveReceiptRuleSetResponse({
    this.metadata,
    this.rules,
  });
  factory DescribeActiveReceiptRuleSetResponse.fromXml(_s.XmlElement elem) {
    return DescribeActiveReceiptRuleSetResponse(
      metadata: _s
          .extractXmlChild(elem, 'Metadata')
          ?.let(ReceiptRuleSetMetadata.fromXml),
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) =>
          elem.findElements('member').map(ReceiptRule.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final rules = this.rules;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (rules != null) 'Rules': rules,
    };
  }
}

/// Represents the details of a configuration set. Configuration sets enable you
/// to publish email sending events. For information about using configuration
/// sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class DescribeConfigurationSetResponse {
  /// The configuration set object associated with the specified configuration
  /// set.
  final ConfigurationSet? configurationSet;
  final DeliveryOptions? deliveryOptions;

  /// A list of event destinations associated with the configuration set.
  final List<EventDestination>? eventDestinations;

  /// An object that represents the reputation settings for the configuration set.
  final ReputationOptions? reputationOptions;

  /// The name of the custom open and click tracking domain associated with the
  /// configuration set.
  final TrackingOptions? trackingOptions;

  DescribeConfigurationSetResponse({
    this.configurationSet,
    this.deliveryOptions,
    this.eventDestinations,
    this.reputationOptions,
    this.trackingOptions,
  });
  factory DescribeConfigurationSetResponse.fromXml(_s.XmlElement elem) {
    return DescribeConfigurationSetResponse(
      configurationSet: _s
          .extractXmlChild(elem, 'ConfigurationSet')
          ?.let(ConfigurationSet.fromXml),
      deliveryOptions: _s
          .extractXmlChild(elem, 'DeliveryOptions')
          ?.let(DeliveryOptions.fromXml),
      eventDestinations: _s.extractXmlChild(elem, 'EventDestinations')?.let(
          (elem) => elem
              .findElements('member')
              .map(EventDestination.fromXml)
              .toList()),
      reputationOptions: _s
          .extractXmlChild(elem, 'ReputationOptions')
          ?.let(ReputationOptions.fromXml),
      trackingOptions: _s
          .extractXmlChild(elem, 'TrackingOptions')
          ?.let(TrackingOptions.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSet = this.configurationSet;
    final deliveryOptions = this.deliveryOptions;
    final eventDestinations = this.eventDestinations;
    final reputationOptions = this.reputationOptions;
    final trackingOptions = this.trackingOptions;
    return {
      if (configurationSet != null) 'ConfigurationSet': configurationSet,
      if (deliveryOptions != null) 'DeliveryOptions': deliveryOptions,
      if (eventDestinations != null) 'EventDestinations': eventDestinations,
      if (reputationOptions != null) 'ReputationOptions': reputationOptions,
      if (trackingOptions != null) 'TrackingOptions': trackingOptions,
    };
  }
}

/// Represents the details of a receipt rule.
class DescribeReceiptRuleResponse {
  /// A data structure that contains the specified receipt rule's name, actions,
  /// recipients, domains, enabled status, scan status, and Transport Layer
  /// Security (TLS) policy.
  final ReceiptRule? rule;

  DescribeReceiptRuleResponse({
    this.rule,
  });
  factory DescribeReceiptRuleResponse.fromXml(_s.XmlElement elem) {
    return DescribeReceiptRuleResponse(
      rule: _s.extractXmlChild(elem, 'Rule')?.let(ReceiptRule.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      if (rule != null) 'Rule': rule,
    };
  }
}

/// Represents the details of the specified receipt rule set.
class DescribeReceiptRuleSetResponse {
  /// The metadata for the receipt rule set, which consists of the rule set name
  /// and the timestamp of when the rule set was created.
  final ReceiptRuleSetMetadata? metadata;

  /// A list of the receipt rules that belong to the specified receipt rule set.
  final List<ReceiptRule>? rules;

  DescribeReceiptRuleSetResponse({
    this.metadata,
    this.rules,
  });
  factory DescribeReceiptRuleSetResponse.fromXml(_s.XmlElement elem) {
    return DescribeReceiptRuleSetResponse(
      metadata: _s
          .extractXmlChild(elem, 'Metadata')
          ?.let(ReceiptRuleSetMetadata.fromXml),
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) =>
          elem.findElements('member').map(ReceiptRule.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final rules = this.rules;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (rules != null) 'Rules': rules,
    };
  }
}

/// Represents the destination of the message, consisting of To:, CC:, and BCC:
/// fields.
/// <note>
/// Amazon SES does not support the SMTPUTF8 extension, as described in <a
/// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason, the
/// email address string must be 7-bit ASCII. If you want to send to or from
/// email addresses that contain Unicode characters in the domain part of an
/// address, you must encode the domain using Punycode. Punycode is not
/// permitted in the local part of the email address (the part before the @
/// sign) nor in the "friendly from" name. If you want to use Unicode characters
/// in the "friendly from" name, you must encode the "friendly from" name using
/// MIME encoded-word syntax, as described in <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html">Sending
/// raw email using the Amazon SES API</a>. For more information about Punycode,
/// see <a href="http://tools.ietf.org/html/rfc3492">RFC 3492</a>.
/// </note>
class Destination {
  /// The recipients to place on the BCC: line of the message.
  final List<String>? bccAddresses;

  /// The recipients to place on the CC: line of the message.
  final List<String>? ccAddresses;

  /// The recipients to place on the To: line of the message.
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

  Map<String, String> toQueryMap() {
    final bccAddresses = this.bccAddresses;
    final ccAddresses = this.ccAddresses;
    final toAddresses = this.toAddresses;
    return {
      if (bccAddresses != null)
        if (bccAddresses.isEmpty)
          'BccAddresses': ''
        else
          for (var i1 = 0; i1 < bccAddresses.length; i1++)
            'BccAddresses.member.${i1 + 1}': bccAddresses[i1],
      if (ccAddresses != null)
        if (ccAddresses.isEmpty)
          'CcAddresses': ''
        else
          for (var i1 = 0; i1 < ccAddresses.length; i1++)
            'CcAddresses.member.${i1 + 1}': ccAddresses[i1],
      if (toAddresses != null)
        if (toAddresses.isEmpty)
          'ToAddresses': ''
        else
          for (var i1 = 0; i1 < toAddresses.length; i1++)
            'ToAddresses.member.${i1 + 1}': toAddresses[i1],
    };
  }
}

enum DimensionValueSource {
  messageTag('messageTag'),
  emailHeader('emailHeader'),
  linkTag('linkTag'),
  ;

  final String value;

  const DimensionValueSource(this.value);

  static DimensionValueSource fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DimensionValueSource'));
}

enum DsnAction {
  failed('failed'),
  delayed('delayed'),
  delivered('delivered'),
  relayed('relayed'),
  expanded('expanded'),
  ;

  final String value;

  const DsnAction(this.value);

  static DsnAction fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DsnAction'));
}

/// Contains information about an event destination.
/// <note>
/// When you create or update an event destination, you must provide one, and
/// only one, destination. The destination can be Amazon CloudWatch, Amazon
/// Kinesis Firehose or Amazon Simple Notification Service (Amazon SNS).
/// </note>
/// Event destinations are associated with configuration sets, which enable you
/// to publish email sending events to Amazon CloudWatch, Amazon Kinesis
/// Firehose, or Amazon Simple Notification Service (Amazon SNS). For
/// information about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class EventDestination {
  /// The type of email sending events to publish to the event destination.
  ///
  /// <ul>
  /// <li>
  /// <code>send</code> - The call was successful and Amazon SES is attempting to
  /// deliver the email.
  /// </li>
  /// <li>
  /// <code>reject</code> - Amazon SES determined that the email contained a virus
  /// and rejected it.
  /// </li>
  /// <li>
  /// <code>bounce</code> - The recipient's mail server permanently rejected the
  /// email. This corresponds to a hard bounce.
  /// </li>
  /// <li>
  /// <code>complaint</code> - The recipient marked the email as spam.
  /// </li>
  /// <li>
  /// <code>delivery</code> - Amazon SES successfully delivered the email to the
  /// recipient's mail server.
  /// </li>
  /// <li>
  /// <code>open</code> - The recipient received the email and opened it in their
  /// email client.
  /// </li>
  /// <li>
  /// <code>click</code> - The recipient clicked one or more links in the email.
  /// </li>
  /// <li>
  /// <code>renderingFailure</code> - Amazon SES did not send the email because of
  /// a template rendering issue.
  /// </li>
  /// </ul>
  final List<EventType> matchingEventTypes;

  /// The name of the event destination. The name must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  /// </li>
  /// <li>
  /// Contain 64 characters or fewer.
  /// </li>
  /// </ul>
  final String name;

  /// An object that contains the names, default values, and sources of the
  /// dimensions associated with an Amazon CloudWatch event destination.
  final CloudWatchDestination? cloudWatchDestination;

  /// Sets whether Amazon SES publishes events to this destination when you send
  /// an email with the associated configuration set. Set to <code>true</code> to
  /// enable publishing to this destination; set to <code>false</code> to prevent
  /// publishing to this destination. The default value is <code>false</code>.
  final bool? enabled;

  /// An object that contains the delivery stream ARN and the IAM role ARN
  /// associated with an Amazon Kinesis Firehose event destination.
  final KinesisFirehoseDestination? kinesisFirehoseDestination;

  /// An object that contains the topic ARN associated with an Amazon Simple
  /// Notification Service (Amazon SNS) event destination.
  final SNSDestination? sNSDestination;

  EventDestination({
    required this.matchingEventTypes,
    required this.name,
    this.cloudWatchDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.sNSDestination,
  });
  factory EventDestination.fromXml(_s.XmlElement elem) {
    return EventDestination(
      matchingEventTypes: _s
          .extractXmlStringListValues(
              _s.extractXmlChild(elem, 'MatchingEventTypes')!, 'member')
          .map(EventType.fromString)
          .toList(),
      name: _s.extractXmlStringValue(elem, 'Name')!,
      cloudWatchDestination: _s
          .extractXmlChild(elem, 'CloudWatchDestination')
          ?.let(CloudWatchDestination.fromXml),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      kinesisFirehoseDestination: _s
          .extractXmlChild(elem, 'KinesisFirehoseDestination')
          ?.let(KinesisFirehoseDestination.fromXml),
      sNSDestination: _s
          .extractXmlChild(elem, 'SNSDestination')
          ?.let(SNSDestination.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final matchingEventTypes = this.matchingEventTypes;
    final name = this.name;
    final cloudWatchDestination = this.cloudWatchDestination;
    final enabled = this.enabled;
    final kinesisFirehoseDestination = this.kinesisFirehoseDestination;
    final sNSDestination = this.sNSDestination;
    return {
      'MatchingEventTypes': matchingEventTypes.map((e) => e.value).toList(),
      'Name': name,
      if (cloudWatchDestination != null)
        'CloudWatchDestination': cloudWatchDestination,
      if (enabled != null) 'Enabled': enabled,
      if (kinesisFirehoseDestination != null)
        'KinesisFirehoseDestination': kinesisFirehoseDestination,
      if (sNSDestination != null) 'SNSDestination': sNSDestination,
    };
  }

  Map<String, String> toQueryMap() {
    final matchingEventTypes = this.matchingEventTypes;
    final name = this.name;
    final cloudWatchDestination = this.cloudWatchDestination;
    final enabled = this.enabled;
    final kinesisFirehoseDestination = this.kinesisFirehoseDestination;
    final sNSDestination = this.sNSDestination;
    return {
      if (matchingEventTypes.isEmpty)
        'MatchingEventTypes': ''
      else
        for (var i1 = 0; i1 < matchingEventTypes.length; i1++)
          'MatchingEventTypes.member.${i1 + 1}': matchingEventTypes[i1].value,
      'Name': name,
      if (cloudWatchDestination != null)
        for (var e1 in cloudWatchDestination.toQueryMap().entries)
          'CloudWatchDestination.${e1.key}': e1.value,
      if (enabled != null) 'Enabled': enabled.toString(),
      if (kinesisFirehoseDestination != null)
        for (var e1 in kinesisFirehoseDestination.toQueryMap().entries)
          'KinesisFirehoseDestination.${e1.key}': e1.value,
      if (sNSDestination != null)
        for (var e1 in sNSDestination.toQueryMap().entries)
          'SNSDestination.${e1.key}': e1.value,
    };
  }
}

enum EventType {
  send('send'),
  reject('reject'),
  bounce('bounce'),
  complaint('complaint'),
  delivery('delivery'),
  open('open'),
  click('click'),
  renderingFailure('renderingFailure'),
  ;

  final String value;

  const EventType(this.value);

  static EventType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EventType'));
}

/// Additional X-headers to include in the Delivery Status Notification (DSN)
/// when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html">Amazon
/// SES Developer Guide</a>.
class ExtensionField {
  /// The name of the header to add. Must be between 1 and 50 characters,
  /// inclusive, and consist of alphanumeric (a-z, A-Z, 0-9) characters and dashes
  /// only.
  final String name;

  /// The value of the header to add. Must contain 2048 characters or fewer, and
  /// must not contain newline characters ("\r" or "\n").
  final String value;

  ExtensionField({
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

  Map<String, String> toQueryMap() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// Represents a request to return the email sending status for your Amazon SES
/// account in the current Amazon Web Services Region.
class GetAccountSendingEnabledResponse {
  /// Describes whether email sending is enabled or disabled for your Amazon SES
  /// account in the current Amazon Web Services Region.
  final bool? enabled;

  GetAccountSendingEnabledResponse({
    this.enabled,
  });
  factory GetAccountSendingEnabledResponse.fromXml(_s.XmlElement elem) {
    return GetAccountSendingEnabledResponse(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// The content of the custom verification email template.
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
  factory GetCustomVerificationEmailTemplateResponse.fromXml(
      _s.XmlElement elem) {
    return GetCustomVerificationEmailTemplateResponse(
      failureRedirectionURL:
          _s.extractXmlStringValue(elem, 'FailureRedirectionURL'),
      fromEmailAddress: _s.extractXmlStringValue(elem, 'FromEmailAddress'),
      successRedirectionURL:
          _s.extractXmlStringValue(elem, 'SuccessRedirectionURL'),
      templateContent: _s.extractXmlStringValue(elem, 'TemplateContent'),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
      templateSubject: _s.extractXmlStringValue(elem, 'TemplateSubject'),
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

/// Represents the status of Amazon SES Easy DKIM signing for an identity. For
/// domain identities, this response also contains the DKIM tokens that are
/// required for Easy DKIM signing, and whether Amazon SES successfully verified
/// that these tokens were published.
class GetIdentityDkimAttributesResponse {
  /// The DKIM attributes for an email address or a domain.
  final Map<String, IdentityDkimAttributes> dkimAttributes;

  GetIdentityDkimAttributesResponse({
    required this.dkimAttributes,
  });
  factory GetIdentityDkimAttributesResponse.fromXml(_s.XmlElement elem) {
    return GetIdentityDkimAttributesResponse(
      dkimAttributes: Map.fromEntries(
        elem.getElement('DkimAttributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    IdentityDkimAttributes.fromXml(
                        _s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final dkimAttributes = this.dkimAttributes;
    return {
      'DkimAttributes': dkimAttributes,
    };
  }
}

/// Represents the custom MAIL FROM attributes for a list of identities.
class GetIdentityMailFromDomainAttributesResponse {
  /// A map of identities to custom MAIL FROM attributes.
  final Map<String, IdentityMailFromDomainAttributes> mailFromDomainAttributes;

  GetIdentityMailFromDomainAttributesResponse({
    required this.mailFromDomainAttributes,
  });
  factory GetIdentityMailFromDomainAttributesResponse.fromXml(
      _s.XmlElement elem) {
    return GetIdentityMailFromDomainAttributesResponse(
      mailFromDomainAttributes: Map.fromEntries(
        elem.getElement('MailFromDomainAttributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    IdentityMailFromDomainAttributes.fromXml(
                        _s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final mailFromDomainAttributes = this.mailFromDomainAttributes;
    return {
      'MailFromDomainAttributes': mailFromDomainAttributes,
    };
  }
}

/// Represents the notification attributes for a list of identities.
class GetIdentityNotificationAttributesResponse {
  /// A map of Identity to IdentityNotificationAttributes.
  final Map<String, IdentityNotificationAttributes> notificationAttributes;

  GetIdentityNotificationAttributesResponse({
    required this.notificationAttributes,
  });
  factory GetIdentityNotificationAttributesResponse.fromXml(
      _s.XmlElement elem) {
    return GetIdentityNotificationAttributesResponse(
      notificationAttributes: Map.fromEntries(
        elem.getElement('NotificationAttributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    IdentityNotificationAttributes.fromXml(
                        _s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationAttributes = this.notificationAttributes;
    return {
      'NotificationAttributes': notificationAttributes,
    };
  }
}

/// Represents the requested sending authorization policies.
class GetIdentityPoliciesResponse {
  /// A map of policy names to policies.
  final Map<String, String> policies;

  GetIdentityPoliciesResponse({
    required this.policies,
  });
  factory GetIdentityPoliciesResponse.fromXml(_s.XmlElement elem) {
    return GetIdentityPoliciesResponse(
      policies: Map.fromEntries(
        elem.getElement('Policies')?.findElements('entry').map(
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
    final policies = this.policies;
    return {
      'Policies': policies,
    };
  }
}

/// The Amazon SES verification status of a list of identities. For domain
/// identities, this response also contains the verification token.
class GetIdentityVerificationAttributesResponse {
  /// A map of Identities to IdentityVerificationAttributes objects.
  final Map<String, IdentityVerificationAttributes> verificationAttributes;

  GetIdentityVerificationAttributesResponse({
    required this.verificationAttributes,
  });
  factory GetIdentityVerificationAttributesResponse.fromXml(
      _s.XmlElement elem) {
    return GetIdentityVerificationAttributesResponse(
      verificationAttributes: Map.fromEntries(
        elem.getElement('VerificationAttributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    IdentityVerificationAttributes.fromXml(
                        _s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final verificationAttributes = this.verificationAttributes;
    return {
      'VerificationAttributes': verificationAttributes,
    };
  }
}

/// Represents your Amazon SES daily sending quota, maximum send rate, and the
/// number of emails you have sent in the last 24 hours.
class GetSendQuotaResponse {
  /// The maximum number of emails the user is allowed to send in a 24-hour
  /// interval. A value of -1 signifies an unlimited quota.
  final double? max24HourSend;

  /// The maximum number of emails that Amazon SES can accept from the user's
  /// account per second.
  /// <note>
  /// The rate at which Amazon SES accepts the user's messages might be less than
  /// the maximum send rate.
  /// </note>
  final double? maxSendRate;

  /// The number of emails sent during the previous 24 hours.
  final double? sentLast24Hours;

  GetSendQuotaResponse({
    this.max24HourSend,
    this.maxSendRate,
    this.sentLast24Hours,
  });
  factory GetSendQuotaResponse.fromXml(_s.XmlElement elem) {
    return GetSendQuotaResponse(
      max24HourSend: _s.extractXmlDoubleValue(elem, 'Max24HourSend'),
      maxSendRate: _s.extractXmlDoubleValue(elem, 'MaxSendRate'),
      sentLast24Hours: _s.extractXmlDoubleValue(elem, 'SentLast24Hours'),
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

/// Represents a list of data points. This list contains aggregated data from
/// the previous two weeks of your sending activity with Amazon SES.
class GetSendStatisticsResponse {
  /// A list of data points, each of which represents 15 minutes of activity.
  final List<SendDataPoint>? sendDataPoints;

  GetSendStatisticsResponse({
    this.sendDataPoints,
  });
  factory GetSendStatisticsResponse.fromXml(_s.XmlElement elem) {
    return GetSendStatisticsResponse(
      sendDataPoints: _s.extractXmlChild(elem, 'SendDataPoints')?.let((elem) =>
          elem.findElements('member').map(SendDataPoint.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final sendDataPoints = this.sendDataPoints;
    return {
      if (sendDataPoints != null) 'SendDataPoints': sendDataPoints,
    };
  }
}

class GetTemplateResponse {
  final Template? template;

  GetTemplateResponse({
    this.template,
  });
  factory GetTemplateResponse.fromXml(_s.XmlElement elem) {
    return GetTemplateResponse(
      template: _s.extractXmlChild(elem, 'Template')?.let(Template.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final template = this.template;
    return {
      if (template != null) 'Template': template,
    };
  }
}

/// Represents the DKIM attributes of a verified email address or a domain.
class IdentityDkimAttributes {
  /// Is true if DKIM signing is enabled for email sent from the identity. It's
  /// false otherwise. The default value is true.
  final bool dkimEnabled;

  /// Describes whether Amazon SES has successfully verified the DKIM DNS records
  /// (tokens) published in the domain name's DNS. (This only applies to domain
  /// identities, not email address identities.)
  final VerificationStatus dkimVerificationStatus;

  /// A set of character strings that represent the domain's identity. Using these
  /// tokens, you need to create DNS CNAME records that point to DKIM public keys
  /// that are hosted by Amazon SES. Amazon Web Services eventually detects that
  /// you've updated your DNS records. This detection process might take up to 72
  /// hours. After successful detection, Amazon SES is able to DKIM-sign email
  /// originating from that domain. (This only applies to domain identities, not
  /// email address identities.)
  ///
  /// For more information about creating DNS records using DKIM tokens, see the
  /// <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html">Amazon
  /// SES Developer Guide</a>.
  final List<String>? dkimTokens;

  IdentityDkimAttributes({
    required this.dkimEnabled,
    required this.dkimVerificationStatus,
    this.dkimTokens,
  });
  factory IdentityDkimAttributes.fromXml(_s.XmlElement elem) {
    return IdentityDkimAttributes(
      dkimEnabled: _s.extractXmlBoolValue(elem, 'DkimEnabled')!,
      dkimVerificationStatus: _s
          .extractXmlStringValue(elem, 'DkimVerificationStatus')!
          .let(VerificationStatus.fromString),
      dkimTokens: _s
          .extractXmlChild(elem, 'DkimTokens')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final dkimEnabled = this.dkimEnabled;
    final dkimVerificationStatus = this.dkimVerificationStatus;
    final dkimTokens = this.dkimTokens;
    return {
      'DkimEnabled': dkimEnabled,
      'DkimVerificationStatus': dkimVerificationStatus.value,
      if (dkimTokens != null) 'DkimTokens': dkimTokens,
    };
  }
}

/// Represents the custom MAIL FROM domain attributes of a verified identity
/// (email address or domain).
class IdentityMailFromDomainAttributes {
  /// The action that Amazon SES takes if it cannot successfully read the required
  /// MX record when you send an email. A value of <code>UseDefaultValue</code>
  /// indicates that if Amazon SES cannot read the required MX record, it uses
  /// amazonses.com (or a subdomain of that) as the MAIL FROM domain. A value of
  /// <code>RejectMessage</code> indicates that if Amazon SES cannot read the
  /// required MX record, Amazon SES returns a
  /// <code>MailFromDomainNotVerified</code> error and does not send the email.
  ///
  /// The custom MAIL FROM setup states that result in this behavior are
  /// <code>Pending</code>, <code>Failed</code>, and
  /// <code>TemporaryFailure</code>.
  final BehaviorOnMXFailure behaviorOnMXFailure;

  /// The custom MAIL FROM domain that the identity is configured to use.
  final String mailFromDomain;

  /// The state that indicates whether Amazon SES has successfully read the MX
  /// record required for custom MAIL FROM domain setup. If the state is
  /// <code>Success</code>, Amazon SES uses the specified custom MAIL FROM domain
  /// when the verified identity sends an email. All other states indicate that
  /// Amazon SES takes the action described by <code>BehaviorOnMXFailure</code>.
  final CustomMailFromStatus mailFromDomainStatus;

  IdentityMailFromDomainAttributes({
    required this.behaviorOnMXFailure,
    required this.mailFromDomain,
    required this.mailFromDomainStatus,
  });
  factory IdentityMailFromDomainAttributes.fromXml(_s.XmlElement elem) {
    return IdentityMailFromDomainAttributes(
      behaviorOnMXFailure: _s
          .extractXmlStringValue(elem, 'BehaviorOnMXFailure')!
          .let(BehaviorOnMXFailure.fromString),
      mailFromDomain: _s.extractXmlStringValue(elem, 'MailFromDomain')!,
      mailFromDomainStatus: _s
          .extractXmlStringValue(elem, 'MailFromDomainStatus')!
          .let(CustomMailFromStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final behaviorOnMXFailure = this.behaviorOnMXFailure;
    final mailFromDomain = this.mailFromDomain;
    final mailFromDomainStatus = this.mailFromDomainStatus;
    return {
      'BehaviorOnMXFailure': behaviorOnMXFailure.value,
      'MailFromDomain': mailFromDomain,
      'MailFromDomainStatus': mailFromDomainStatus.value,
    };
  }
}

/// Represents the notification attributes of an identity, including whether an
/// identity has Amazon Simple Notification Service (Amazon SNS) topics set for
/// bounce, complaint, and/or delivery notifications, and whether feedback
/// forwarding is enabled for bounce and complaint notifications.
class IdentityNotificationAttributes {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES
  /// publishes bounce notifications.
  final String bounceTopic;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES
  /// publishes complaint notifications.
  final String complaintTopic;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES
  /// publishes delivery notifications.
  final String deliveryTopic;

  /// Describes whether Amazon SES forwards bounce and complaint notifications as
  /// email. <code>true</code> indicates that Amazon SES forwards bounce and
  /// complaint notifications as email, while <code>false</code> indicates that
  /// bounce and complaint notifications are published only to the specified
  /// bounce and complaint Amazon SNS topics.
  final bool forwardingEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type <code>Bounce</code>. A value of <code>true</code>
  /// specifies that Amazon SES includes headers in bounce notifications, and a
  /// value of <code>false</code> specifies that Amazon SES does not include
  /// headers in bounce notifications.
  final bool? headersInBounceNotificationsEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type <code>Complaint</code>. A value of
  /// <code>true</code> specifies that Amazon SES includes headers in complaint
  /// notifications, and a value of <code>false</code> specifies that Amazon SES
  /// does not include headers in complaint notifications.
  final bool? headersInComplaintNotificationsEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type <code>Delivery</code>. A value of
  /// <code>true</code> specifies that Amazon SES includes headers in delivery
  /// notifications, and a value of <code>false</code> specifies that Amazon SES
  /// does not include headers in delivery notifications.
  final bool? headersInDeliveryNotificationsEnabled;

  IdentityNotificationAttributes({
    required this.bounceTopic,
    required this.complaintTopic,
    required this.deliveryTopic,
    required this.forwardingEnabled,
    this.headersInBounceNotificationsEnabled,
    this.headersInComplaintNotificationsEnabled,
    this.headersInDeliveryNotificationsEnabled,
  });
  factory IdentityNotificationAttributes.fromXml(_s.XmlElement elem) {
    return IdentityNotificationAttributes(
      bounceTopic: _s.extractXmlStringValue(elem, 'BounceTopic')!,
      complaintTopic: _s.extractXmlStringValue(elem, 'ComplaintTopic')!,
      deliveryTopic: _s.extractXmlStringValue(elem, 'DeliveryTopic')!,
      forwardingEnabled: _s.extractXmlBoolValue(elem, 'ForwardingEnabled')!,
      headersInBounceNotificationsEnabled:
          _s.extractXmlBoolValue(elem, 'HeadersInBounceNotificationsEnabled'),
      headersInComplaintNotificationsEnabled: _s.extractXmlBoolValue(
          elem, 'HeadersInComplaintNotificationsEnabled'),
      headersInDeliveryNotificationsEnabled:
          _s.extractXmlBoolValue(elem, 'HeadersInDeliveryNotificationsEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final bounceTopic = this.bounceTopic;
    final complaintTopic = this.complaintTopic;
    final deliveryTopic = this.deliveryTopic;
    final forwardingEnabled = this.forwardingEnabled;
    final headersInBounceNotificationsEnabled =
        this.headersInBounceNotificationsEnabled;
    final headersInComplaintNotificationsEnabled =
        this.headersInComplaintNotificationsEnabled;
    final headersInDeliveryNotificationsEnabled =
        this.headersInDeliveryNotificationsEnabled;
    return {
      'BounceTopic': bounceTopic,
      'ComplaintTopic': complaintTopic,
      'DeliveryTopic': deliveryTopic,
      'ForwardingEnabled': forwardingEnabled,
      if (headersInBounceNotificationsEnabled != null)
        'HeadersInBounceNotificationsEnabled':
            headersInBounceNotificationsEnabled,
      if (headersInComplaintNotificationsEnabled != null)
        'HeadersInComplaintNotificationsEnabled':
            headersInComplaintNotificationsEnabled,
      if (headersInDeliveryNotificationsEnabled != null)
        'HeadersInDeliveryNotificationsEnabled':
            headersInDeliveryNotificationsEnabled,
    };
  }
}

enum IdentityType {
  emailAddress('EmailAddress'),
  domain('Domain'),
  ;

  final String value;

  const IdentityType(this.value);

  static IdentityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum IdentityType'));
}

/// Represents the verification attributes of a single identity.
class IdentityVerificationAttributes {
  /// The verification status of the identity: "Pending", "Success", "Failed", or
  /// "TemporaryFailure".
  final VerificationStatus verificationStatus;

  /// The verification token for a domain identity. Null for email address
  /// identities.
  final String? verificationToken;

  IdentityVerificationAttributes({
    required this.verificationStatus,
    this.verificationToken,
  });
  factory IdentityVerificationAttributes.fromXml(_s.XmlElement elem) {
    return IdentityVerificationAttributes(
      verificationStatus: _s
          .extractXmlStringValue(elem, 'VerificationStatus')!
          .let(VerificationStatus.fromString),
      verificationToken: _s.extractXmlStringValue(elem, 'VerificationToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final verificationStatus = this.verificationStatus;
    final verificationToken = this.verificationToken;
    return {
      'VerificationStatus': verificationStatus.value,
      if (verificationToken != null) 'VerificationToken': verificationToken,
    };
  }
}

enum InvocationType {
  event('Event'),
  requestResponse('RequestResponse'),
  ;

  final String value;

  const InvocationType(this.value);

  static InvocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum InvocationType'));
}

/// Contains the delivery stream ARN and the IAM role ARN associated with an
/// Amazon Kinesis Firehose event destination.
///
/// Event destinations, such as Amazon Kinesis Firehose, are associated with
/// configuration sets, which enable you to publish email sending events. For
/// information about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class KinesisFirehoseDestination {
  /// The ARN of the Amazon Kinesis Firehose stream that email sending events
  /// should be published to.
  final String deliveryStreamARN;

  /// The ARN of the IAM role under which Amazon SES publishes email sending
  /// events to the Amazon Kinesis Firehose stream.
  final String iAMRoleARN;

  KinesisFirehoseDestination({
    required this.deliveryStreamARN,
    required this.iAMRoleARN,
  });
  factory KinesisFirehoseDestination.fromXml(_s.XmlElement elem) {
    return KinesisFirehoseDestination(
      deliveryStreamARN: _s.extractXmlStringValue(elem, 'DeliveryStreamARN')!,
      iAMRoleARN: _s.extractXmlStringValue(elem, 'IAMRoleARN')!,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamARN = this.deliveryStreamARN;
    final iAMRoleARN = this.iAMRoleARN;
    return {
      'DeliveryStreamARN': deliveryStreamARN,
      'IAMRoleARN': iAMRoleARN,
    };
  }

  Map<String, String> toQueryMap() {
    final deliveryStreamARN = this.deliveryStreamARN;
    final iAMRoleARN = this.iAMRoleARN;
    return {
      'DeliveryStreamARN': deliveryStreamARN,
      'IAMRoleARN': iAMRoleARN,
    };
  }
}

/// When included in a receipt rule, this action calls an Amazon Web Services
/// Lambda function and, optionally, publishes a notification to Amazon Simple
/// Notification Service (Amazon SNS).
///
/// To enable Amazon SES to call your Amazon Web Services Lambda function or to
/// publish to an Amazon SNS topic of another account, Amazon SES must have
/// permission to access those resources. For information about giving
/// permissions, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html">Amazon
/// SES Developer Guide</a>.
///
/// For information about using Amazon Web Services Lambda actions in receipt
/// rules, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-lambda.html">Amazon
/// SES Developer Guide</a>.
class LambdaAction {
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Lambda function.
  /// An example of an Amazon Web Services Lambda function ARN is
  /// <code>arn:aws:lambda:us-west-2:account-id:function:MyFunction</code>. For
  /// more information about Amazon Web Services Lambda, see the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/welcome.html">Amazon Web
  /// Services Lambda Developer Guide</a>.
  final String functionArn;

  /// The invocation type of the Amazon Web Services Lambda function. An
  /// invocation type of <code>RequestResponse</code> means that the execution of
  /// the function immediately results in a response, and a value of
  /// <code>Event</code> means that the function is invoked asynchronously. The
  /// default value is <code>Event</code>. For information about Amazon Web
  /// Services Lambda invocation types, see the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html">Amazon
  /// Web Services Lambda Developer Guide</a>.
  /// <important>
  /// There is a 30-second timeout on <code>RequestResponse</code> invocations.
  /// You should use <code>Event</code> invocation in most cases. Use
  /// <code>RequestResponse</code> only to make a mail flow decision, such as
  /// whether to stop the receipt rule or the receipt rule set.
  /// </important>
  final InvocationType? invocationType;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// Lambda action is executed. You can find the ARN of a topic by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html">ListTopics</a>
  /// operation in Amazon SNS.
  ///
  /// For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String? topicArn;

  LambdaAction({
    required this.functionArn,
    this.invocationType,
    this.topicArn,
  });
  factory LambdaAction.fromXml(_s.XmlElement elem) {
    return LambdaAction(
      functionArn: _s.extractXmlStringValue(elem, 'FunctionArn')!,
      invocationType: _s
          .extractXmlStringValue(elem, 'InvocationType')
          ?.let(InvocationType.fromString),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    final invocationType = this.invocationType;
    final topicArn = this.topicArn;
    return {
      'FunctionArn': functionArn,
      if (invocationType != null) 'InvocationType': invocationType.value,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }

  Map<String, String> toQueryMap() {
    final functionArn = this.functionArn;
    final invocationType = this.invocationType;
    final topicArn = this.topicArn;
    return {
      'FunctionArn': functionArn,
      if (invocationType != null) 'InvocationType': invocationType.value,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

/// A list of configuration sets associated with your Amazon Web Services
/// account. Configuration sets enable you to publish email sending events. For
/// information about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class ListConfigurationSetsResponse {
  /// A list of configuration sets.
  final List<ConfigurationSet>? configurationSets;

  /// A token indicating that there are additional configuration sets available to
  /// be listed. Pass this token to successive calls of
  /// <code>ListConfigurationSets</code>.
  final String? nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });
  factory ListConfigurationSetsResponse.fromXml(_s.XmlElement elem) {
    return ListConfigurationSetsResponse(
      configurationSets: _s.extractXmlChild(elem, 'ConfigurationSets')?.let(
          (elem) => elem
              .findElements('member')
              .map(ConfigurationSet.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
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

/// A paginated list of custom verification email templates.
class ListCustomVerificationEmailTemplatesResponse {
  /// A list of the custom verification email templates that exist in your
  /// account.
  final List<CustomVerificationEmailTemplate>? customVerificationEmailTemplates;

  /// A token indicating that there are additional custom verification email
  /// templates available to be listed. Pass this token to a subsequent call to
  /// <code>ListTemplates</code> to retrieve the next 50 custom verification email
  /// templates.
  final String? nextToken;

  ListCustomVerificationEmailTemplatesResponse({
    this.customVerificationEmailTemplates,
    this.nextToken,
  });
  factory ListCustomVerificationEmailTemplatesResponse.fromXml(
      _s.XmlElement elem) {
    return ListCustomVerificationEmailTemplatesResponse(
      customVerificationEmailTemplates: _s
          .extractXmlChild(elem, 'CustomVerificationEmailTemplates')
          ?.let((elem) => elem
              .findElements('member')
              .map(CustomVerificationEmailTemplate.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
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

/// A list of all identities that you have attempted to verify under your Amazon
/// Web Services account, regardless of verification status.
class ListIdentitiesResponse {
  /// A list of identities.
  final List<String> identities;

  /// The token used for pagination.
  final String? nextToken;

  ListIdentitiesResponse({
    required this.identities,
    this.nextToken,
  });
  factory ListIdentitiesResponse.fromXml(_s.XmlElement elem) {
    return ListIdentitiesResponse(
      identities: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'Identities')!, 'member'),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final identities = this.identities;
    final nextToken = this.nextToken;
    return {
      'Identities': identities,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A list of names of sending authorization policies that apply to an identity.
class ListIdentityPoliciesResponse {
  /// A list of names of policies that apply to the specified identity.
  final List<String> policyNames;

  ListIdentityPoliciesResponse({
    required this.policyNames,
  });
  factory ListIdentityPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListIdentityPoliciesResponse(
      policyNames: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'PolicyNames')!, 'member'),
    );
  }

  Map<String, dynamic> toJson() {
    final policyNames = this.policyNames;
    return {
      'PolicyNames': policyNames,
    };
  }
}

/// A list of IP address filters that exist under your Amazon Web Services
/// account.
class ListReceiptFiltersResponse {
  /// A list of IP address filter data structures, which each consist of a name,
  /// an IP address range, and whether to allow or block mail from it.
  final List<ReceiptFilter>? filters;

  ListReceiptFiltersResponse({
    this.filters,
  });
  factory ListReceiptFiltersResponse.fromXml(_s.XmlElement elem) {
    return ListReceiptFiltersResponse(
      filters: _s.extractXmlChild(elem, 'Filters')?.let((elem) =>
          elem.findElements('member').map(ReceiptFilter.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      if (filters != null) 'Filters': filters,
    };
  }
}

/// A list of receipt rule sets that exist under your Amazon Web Services
/// account.
class ListReceiptRuleSetsResponse {
  /// A token indicating that there are additional receipt rule sets available to
  /// be listed. Pass this token to successive calls of
  /// <code>ListReceiptRuleSets</code> to retrieve up to 100 receipt rule sets at
  /// a time.
  final String? nextToken;

  /// The metadata for the currently active receipt rule set. The metadata
  /// consists of the rule set name and the timestamp of when the rule set was
  /// created.
  final List<ReceiptRuleSetMetadata>? ruleSets;

  ListReceiptRuleSetsResponse({
    this.nextToken,
    this.ruleSets,
  });
  factory ListReceiptRuleSetsResponse.fromXml(_s.XmlElement elem) {
    return ListReceiptRuleSetsResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      ruleSets: _s.extractXmlChild(elem, 'RuleSets')?.let((elem) => elem
          .findElements('member')
          .map(ReceiptRuleSetMetadata.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final ruleSets = this.ruleSets;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleSets != null) 'RuleSets': ruleSets,
    };
  }
}

class ListTemplatesResponse {
  /// A token indicating that there are additional email templates available to be
  /// listed. Pass this token to a subsequent call to <code>ListTemplates</code>
  /// to retrieve the next set of email templates within your page size.
  final String? nextToken;

  /// An array the contains the name and creation time stamp for each template in
  /// your Amazon SES account.
  final List<TemplateMetadata>? templatesMetadata;

  ListTemplatesResponse({
    this.nextToken,
    this.templatesMetadata,
  });
  factory ListTemplatesResponse.fromXml(_s.XmlElement elem) {
    return ListTemplatesResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      templatesMetadata: _s.extractXmlChild(elem, 'TemplatesMetadata')?.let(
          (elem) => elem
              .findElements('member')
              .map(TemplateMetadata.fromXml)
              .toList()),
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

/// A list of email addresses that you have verified with Amazon SES under your
/// Amazon Web Services account.
class ListVerifiedEmailAddressesResponse {
  /// A list of email addresses that have been verified.
  final List<String>? verifiedEmailAddresses;

  ListVerifiedEmailAddressesResponse({
    this.verifiedEmailAddresses,
  });
  factory ListVerifiedEmailAddressesResponse.fromXml(_s.XmlElement elem) {
    return ListVerifiedEmailAddressesResponse(
      verifiedEmailAddresses: _s
          .extractXmlChild(elem, 'VerifiedEmailAddresses')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final verifiedEmailAddresses = this.verifiedEmailAddresses;
    return {
      if (verifiedEmailAddresses != null)
        'VerifiedEmailAddresses': verifiedEmailAddresses,
    };
  }
}

/// Represents the message to be sent, composed of a subject and a body.
class Message {
  /// The message body.
  final Body body;

  /// The subject of the message: A short summary of the content, which appears in
  /// the recipient's inbox.
  final Content subject;

  Message({
    required this.body,
    required this.subject,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final subject = this.subject;
    return {
      'Body': body,
      'Subject': subject,
    };
  }

  Map<String, String> toQueryMap() {
    final body = this.body;
    final subject = this.subject;
    return {
      for (var e1 in body.toQueryMap().entries) 'Body.${e1.key}': e1.value,
      for (var e1 in subject.toQueryMap().entries)
        'Subject.${e1.key}': e1.value,
    };
  }
}

/// Message-related information to include in the Delivery Status Notification
/// (DSN) when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html">Amazon
/// SES Developer Guide</a>.
class MessageDsn {
  /// The reporting MTA that attempted to deliver the message, formatted as
  /// specified in <a href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>
  /// (<code>mta-name-type; mta-name</code>). The default value is <code>dns;
  /// inbound-smtp.[region].amazonaws.com</code>.
  final String reportingMta;

  /// When the message was received by the reporting mail transfer agent (MTA), in
  /// <a href="https://www.ietf.org/rfc/rfc0822.txt">RFC 822</a> date-time format.
  final DateTime? arrivalDate;

  /// Additional X-headers to include in the DSN.
  final List<ExtensionField>? extensionFields;

  MessageDsn({
    required this.reportingMta,
    this.arrivalDate,
    this.extensionFields,
  });

  Map<String, dynamic> toJson() {
    final reportingMta = this.reportingMta;
    final arrivalDate = this.arrivalDate;
    final extensionFields = this.extensionFields;
    return {
      'ReportingMta': reportingMta,
      if (arrivalDate != null) 'ArrivalDate': iso8601ToJson(arrivalDate),
      if (extensionFields != null) 'ExtensionFields': extensionFields,
    };
  }

  Map<String, String> toQueryMap() {
    final reportingMta = this.reportingMta;
    final arrivalDate = this.arrivalDate;
    final extensionFields = this.extensionFields;
    return {
      'ReportingMta': reportingMta,
      if (arrivalDate != null) 'ArrivalDate': _s.iso8601ToJson(arrivalDate),
      if (extensionFields != null)
        if (extensionFields.isEmpty)
          'ExtensionFields': ''
        else
          for (var i1 = 0; i1 < extensionFields.length; i1++)
            for (var e3 in extensionFields[i1].toQueryMap().entries)
              'ExtensionFields.member.${i1 + 1}.${e3.key}': e3.value,
    };
  }
}

/// Contains the name and value of a tag that you can provide to
/// <code>SendEmail</code> or <code>SendRawEmail</code> to apply to an email.
///
/// Message tags, which you use with configuration sets, enable you to publish
/// email sending events. For information about using configuration sets, see
/// the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class MessageTag {
  /// The name of the tag. The name must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  /// </li>
  /// <li>
  /// Contain 256 characters or fewer.
  /// </li>
  /// </ul>
  final String name;

  /// The value of the tag. The value must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  /// </li>
  /// <li>
  /// Contain 256 characters or fewer.
  /// </li>
  /// </ul>
  final String value;

  MessageTag({
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

  Map<String, String> toQueryMap() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

enum NotificationType {
  bounce('Bounce'),
  complaint('Complaint'),
  delivery('Delivery'),
  ;

  final String value;

  const NotificationType(this.value);

  static NotificationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum NotificationType'));
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetDeliveryOptionsResponse {
  PutConfigurationSetDeliveryOptionsResponse();
  factory PutConfigurationSetDeliveryOptionsResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutConfigurationSetDeliveryOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class PutIdentityPolicyResponse {
  PutIdentityPolicyResponse();
  factory PutIdentityPolicyResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutIdentityPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the raw data of the message.
class RawMessage {
  /// The raw data of the message. This data needs to base64-encoded if you are
  /// accessing Amazon SES directly through the HTTPS interface. If you are
  /// accessing Amazon SES using an Amazon Web Services SDK, the SDK takes care of
  /// the base 64-encoding for you. In all cases, the client must ensure that the
  /// message format complies with Internet email standards regarding email header
  /// fields, MIME types, and MIME encoding.
  ///
  /// The To:, CC:, and BCC: headers in the raw message can contain a group list.
  ///
  /// If you are using <code>SendRawEmail</code> with sending authorization, you
  /// can include X-headers in the raw message to specify the "Source," "From,"
  /// and "Return-Path" addresses. For more information, see the documentation for
  /// <code>SendRawEmail</code>.
  /// <important>
  /// Do not include these X-headers in the DKIM signature, because they are
  /// removed by Amazon SES before sending the email.
  /// </important>
  /// For more information, go to the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html">Amazon
  /// SES Developer Guide</a>.
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

  Map<String, String> toQueryMap() {
    final data = this.data;
    return {
      'Data': base64Encode(data),
    };
  }
}

/// An action that Amazon SES can take when it receives an email on behalf of
/// one or more email addresses or domains that you own. An instance of this
/// data type can represent only one action.
///
/// For information about setting up receipt rules, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
/// SES Developer Guide</a>.
class ReceiptAction {
  /// Adds a header to the received email.
  final AddHeaderAction? addHeaderAction;

  /// Rejects the received email by returning a bounce response to the sender and,
  /// optionally, publishes a notification to Amazon Simple Notification Service
  /// (Amazon SNS).
  final BounceAction? bounceAction;

  /// Calls an Amazon Web Services Lambda function, and optionally, publishes a
  /// notification to Amazon SNS.
  final LambdaAction? lambdaAction;

  /// Saves the received message to an Amazon Simple Storage Service (Amazon S3)
  /// bucket and, optionally, publishes a notification to Amazon SNS.
  final S3Action? s3Action;

  /// Publishes the email content within a notification to Amazon SNS.
  final SNSAction? sNSAction;

  /// Terminates the evaluation of the receipt rule set and optionally publishes a
  /// notification to Amazon SNS.
  final StopAction? stopAction;

  /// Calls Amazon WorkMail and, optionally, publishes a notification to Amazon
  /// Amazon SNS.
  final WorkmailAction? workmailAction;

  ReceiptAction({
    this.addHeaderAction,
    this.bounceAction,
    this.lambdaAction,
    this.s3Action,
    this.sNSAction,
    this.stopAction,
    this.workmailAction,
  });
  factory ReceiptAction.fromXml(_s.XmlElement elem) {
    return ReceiptAction(
      addHeaderAction: _s
          .extractXmlChild(elem, 'AddHeaderAction')
          ?.let(AddHeaderAction.fromXml),
      bounceAction:
          _s.extractXmlChild(elem, 'BounceAction')?.let(BounceAction.fromXml),
      lambdaAction:
          _s.extractXmlChild(elem, 'LambdaAction')?.let(LambdaAction.fromXml),
      s3Action: _s.extractXmlChild(elem, 'S3Action')?.let(S3Action.fromXml),
      sNSAction: _s.extractXmlChild(elem, 'SNSAction')?.let(SNSAction.fromXml),
      stopAction:
          _s.extractXmlChild(elem, 'StopAction')?.let(StopAction.fromXml),
      workmailAction: _s
          .extractXmlChild(elem, 'WorkmailAction')
          ?.let(WorkmailAction.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final addHeaderAction = this.addHeaderAction;
    final bounceAction = this.bounceAction;
    final lambdaAction = this.lambdaAction;
    final s3Action = this.s3Action;
    final sNSAction = this.sNSAction;
    final stopAction = this.stopAction;
    final workmailAction = this.workmailAction;
    return {
      if (addHeaderAction != null) 'AddHeaderAction': addHeaderAction,
      if (bounceAction != null) 'BounceAction': bounceAction,
      if (lambdaAction != null) 'LambdaAction': lambdaAction,
      if (s3Action != null) 'S3Action': s3Action,
      if (sNSAction != null) 'SNSAction': sNSAction,
      if (stopAction != null) 'StopAction': stopAction,
      if (workmailAction != null) 'WorkmailAction': workmailAction,
    };
  }

  Map<String, String> toQueryMap() {
    final addHeaderAction = this.addHeaderAction;
    final bounceAction = this.bounceAction;
    final lambdaAction = this.lambdaAction;
    final s3Action = this.s3Action;
    final sNSAction = this.sNSAction;
    final stopAction = this.stopAction;
    final workmailAction = this.workmailAction;
    return {
      if (addHeaderAction != null)
        for (var e1 in addHeaderAction.toQueryMap().entries)
          'AddHeaderAction.${e1.key}': e1.value,
      if (bounceAction != null)
        for (var e1 in bounceAction.toQueryMap().entries)
          'BounceAction.${e1.key}': e1.value,
      if (lambdaAction != null)
        for (var e1 in lambdaAction.toQueryMap().entries)
          'LambdaAction.${e1.key}': e1.value,
      if (s3Action != null)
        for (var e1 in s3Action.toQueryMap().entries)
          'S3Action.${e1.key}': e1.value,
      if (sNSAction != null)
        for (var e1 in sNSAction.toQueryMap().entries)
          'SNSAction.${e1.key}': e1.value,
      if (stopAction != null)
        for (var e1 in stopAction.toQueryMap().entries)
          'StopAction.${e1.key}': e1.value,
      if (workmailAction != null)
        for (var e1 in workmailAction.toQueryMap().entries)
          'WorkmailAction.${e1.key}': e1.value,
    };
  }
}

/// A receipt IP address filter enables you to specify whether to accept or
/// reject mail originating from an IP address or range of IP addresses.
///
/// For information about setting up IP address filters, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html">Amazon
/// SES Developer Guide</a>.
class ReceiptFilter {
  /// A structure that provides the IP addresses to block or allow, and whether to
  /// block or allow incoming mail from them.
  final ReceiptIpFilter ipFilter;

  /// The name of the IP address filter. The name must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain 64 characters or fewer.
  /// </li>
  /// </ul>
  final String name;

  ReceiptFilter({
    required this.ipFilter,
    required this.name,
  });
  factory ReceiptFilter.fromXml(_s.XmlElement elem) {
    return ReceiptFilter(
      ipFilter: ReceiptIpFilter.fromXml(_s.extractXmlChild(elem, 'IpFilter')!),
      name: _s.extractXmlStringValue(elem, 'Name')!,
    );
  }

  Map<String, dynamic> toJson() {
    final ipFilter = this.ipFilter;
    final name = this.name;
    return {
      'IpFilter': ipFilter,
      'Name': name,
    };
  }

  Map<String, String> toQueryMap() {
    final ipFilter = this.ipFilter;
    final name = this.name;
    return {
      for (var e1 in ipFilter.toQueryMap().entries)
        'IpFilter.${e1.key}': e1.value,
      'Name': name,
    };
  }
}

enum ReceiptFilterPolicy {
  block('Block'),
  allow('Allow'),
  ;

  final String value;

  const ReceiptFilterPolicy(this.value);

  static ReceiptFilterPolicy fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ReceiptFilterPolicy'));
}

/// A receipt IP address filter enables you to specify whether to accept or
/// reject mail originating from an IP address or range of IP addresses.
///
/// For information about setting up IP address filters, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html">Amazon
/// SES Developer Guide</a>.
class ReceiptIpFilter {
  /// A single IP address or a range of IP addresses to block or allow, specified
  /// in Classless Inter-Domain Routing (CIDR) notation. An example of a single
  /// email address is 10.0.0.1. An example of a range of IP addresses is
  /// 10.0.0.1/24. For more information about CIDR notation, see <a
  /// href="https://tools.ietf.org/html/rfc2317">RFC 2317</a>.
  final String cidr;

  /// Indicates whether to block or allow incoming mail from the specified IP
  /// addresses.
  final ReceiptFilterPolicy policy;

  ReceiptIpFilter({
    required this.cidr,
    required this.policy,
  });
  factory ReceiptIpFilter.fromXml(_s.XmlElement elem) {
    return ReceiptIpFilter(
      cidr: _s.extractXmlStringValue(elem, 'Cidr')!,
      policy: _s
          .extractXmlStringValue(elem, 'Policy')!
          .let(ReceiptFilterPolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final cidr = this.cidr;
    final policy = this.policy;
    return {
      'Cidr': cidr,
      'Policy': policy.value,
    };
  }

  Map<String, String> toQueryMap() {
    final cidr = this.cidr;
    final policy = this.policy;
    return {
      'Cidr': cidr,
      'Policy': policy.value,
    };
  }
}

/// Receipt rules enable you to specify which actions Amazon SES should take
/// when it receives mail on behalf of one or more email addresses or domains
/// that you own.
///
/// Each receipt rule defines a set of email addresses or domains that it
/// applies to. If the email addresses or domains match at least one recipient
/// address of the message, Amazon SES executes all of the receipt rule's
/// actions on the message.
///
/// For information about setting up receipt rules, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html">Amazon
/// SES Developer Guide</a>.
class ReceiptRule {
  /// The name of the receipt rule. The name must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_),
  /// dashes (-), or periods (.).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain 64 characters or fewer.
  /// </li>
  /// </ul>
  final String name;

  /// An ordered list of actions to perform on messages that match at least one of
  /// the recipient email addresses or domains specified in the receipt rule.
  final List<ReceiptAction>? actions;

  /// If <code>true</code>, the receipt rule is active. The default value is
  /// <code>false</code>.
  final bool? enabled;

  /// The recipient domains and email addresses that the receipt rule applies to.
  /// If this field is not specified, this rule matches all recipients on all
  /// verified domains.
  final List<String>? recipients;

  /// If <code>true</code>, then messages that this receipt rule applies to are
  /// scanned for spam and viruses. The default value is <code>false</code>.
  final bool? scanEnabled;

  /// Specifies whether Amazon SES should require that incoming email is delivered
  /// over a connection encrypted with Transport Layer Security (TLS). If this
  /// parameter is set to <code>Require</code>, Amazon SES bounces emails that are
  /// not received over TLS. The default is <code>Optional</code>.
  final TlsPolicy? tlsPolicy;

  ReceiptRule({
    required this.name,
    this.actions,
    this.enabled,
    this.recipients,
    this.scanEnabled,
    this.tlsPolicy,
  });
  factory ReceiptRule.fromXml(_s.XmlElement elem) {
    return ReceiptRule(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      actions: _s.extractXmlChild(elem, 'Actions')?.let((elem) =>
          elem.findElements('member').map(ReceiptAction.fromXml).toList()),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      recipients: _s
          .extractXmlChild(elem, 'Recipients')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      scanEnabled: _s.extractXmlBoolValue(elem, 'ScanEnabled'),
      tlsPolicy: _s
          .extractXmlStringValue(elem, 'TlsPolicy')
          ?.let(TlsPolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final actions = this.actions;
    final enabled = this.enabled;
    final recipients = this.recipients;
    final scanEnabled = this.scanEnabled;
    final tlsPolicy = this.tlsPolicy;
    return {
      'Name': name,
      if (actions != null) 'Actions': actions,
      if (enabled != null) 'Enabled': enabled,
      if (recipients != null) 'Recipients': recipients,
      if (scanEnabled != null) 'ScanEnabled': scanEnabled,
      if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.value,
    };
  }

  Map<String, String> toQueryMap() {
    final name = this.name;
    final actions = this.actions;
    final enabled = this.enabled;
    final recipients = this.recipients;
    final scanEnabled = this.scanEnabled;
    final tlsPolicy = this.tlsPolicy;
    return {
      'Name': name,
      if (actions != null)
        if (actions.isEmpty)
          'Actions': ''
        else
          for (var i1 = 0; i1 < actions.length; i1++)
            for (var e3 in actions[i1].toQueryMap().entries)
              'Actions.member.${i1 + 1}.${e3.key}': e3.value,
      if (enabled != null) 'Enabled': enabled.toString(),
      if (recipients != null)
        if (recipients.isEmpty)
          'Recipients': ''
        else
          for (var i1 = 0; i1 < recipients.length; i1++)
            'Recipients.member.${i1 + 1}': recipients[i1],
      if (scanEnabled != null) 'ScanEnabled': scanEnabled.toString(),
      if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.value,
    };
  }
}

/// Information about a receipt rule set.
///
/// A receipt rule set is a collection of rules that specify what Amazon SES
/// should do with mail it receives on behalf of your account's verified
/// domains.
///
/// For information about setting up receipt rule sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules">Amazon
/// SES Developer Guide</a>.
class ReceiptRuleSetMetadata {
  /// The date and time the receipt rule set was created.
  final DateTime? createdTimestamp;

  /// The name of the receipt rule set. The name must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain 64 characters or fewer.
  /// </li>
  /// </ul>
  final String? name;

  ReceiptRuleSetMetadata({
    this.createdTimestamp,
    this.name,
  });
  factory ReceiptRuleSetMetadata.fromXml(_s.XmlElement elem) {
    return ReceiptRuleSetMetadata(
      createdTimestamp: _s.extractXmlDateTimeValue(elem, 'CreatedTimestamp'),
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (name != null) 'Name': name,
    };
  }
}

/// Recipient-related information to include in the Delivery Status Notification
/// (DSN) when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html">Amazon
/// SES Developer Guide</a>.
class RecipientDsnFields {
  /// The action performed by the reporting mail transfer agent (MTA) as a result
  /// of its attempt to deliver the message to the recipient address. This is
  /// required by <a href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>.
  final DsnAction action;

  /// The status code that indicates what went wrong. This is required by <a
  /// href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>.
  final String status;

  /// An extended explanation of what went wrong; this is usually an SMTP
  /// response. See <a href="https://tools.ietf.org/html/rfc3463">RFC 3463</a> for
  /// the correct formatting of this parameter.
  final String? diagnosticCode;

  /// Additional X-headers to include in the DSN.
  final List<ExtensionField>? extensionFields;

  /// The email address that the message was ultimately delivered to. This
  /// corresponds to the <code>Final-Recipient</code> in the DSN. If not
  /// specified, <code>FinalRecipient</code> is set to the <code>Recipient</code>
  /// specified in the <code>BouncedRecipientInfo</code> structure. Either
  /// <code>FinalRecipient</code> or the recipient in
  /// <code>BouncedRecipientInfo</code> must be a recipient of the original
  /// bounced message.
  /// <note>
  /// Do not prepend the <code>FinalRecipient</code> email address with <code>rfc
  /// 822;</code>, as described in <a
  /// href="https://tools.ietf.org/html/rfc3798">RFC 3798</a>.
  /// </note>
  final String? finalRecipient;

  /// The time the final delivery attempt was made, in <a
  /// href="https://www.ietf.org/rfc/rfc0822.txt">RFC 822</a> date-time format.
  final DateTime? lastAttemptDate;

  /// The MTA to which the remote MTA attempted to deliver the message, formatted
  /// as specified in <a href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>
  /// (<code>mta-name-type; mta-name</code>). This parameter typically applies
  /// only to propagating synchronous bounces.
  final String? remoteMta;

  RecipientDsnFields({
    required this.action,
    required this.status,
    this.diagnosticCode,
    this.extensionFields,
    this.finalRecipient,
    this.lastAttemptDate,
    this.remoteMta,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final status = this.status;
    final diagnosticCode = this.diagnosticCode;
    final extensionFields = this.extensionFields;
    final finalRecipient = this.finalRecipient;
    final lastAttemptDate = this.lastAttemptDate;
    final remoteMta = this.remoteMta;
    return {
      'Action': action.value,
      'Status': status,
      if (diagnosticCode != null) 'DiagnosticCode': diagnosticCode,
      if (extensionFields != null) 'ExtensionFields': extensionFields,
      if (finalRecipient != null) 'FinalRecipient': finalRecipient,
      if (lastAttemptDate != null)
        'LastAttemptDate': iso8601ToJson(lastAttemptDate),
      if (remoteMta != null) 'RemoteMta': remoteMta,
    };
  }

  Map<String, String> toQueryMap() {
    final action = this.action;
    final status = this.status;
    final diagnosticCode = this.diagnosticCode;
    final extensionFields = this.extensionFields;
    final finalRecipient = this.finalRecipient;
    final lastAttemptDate = this.lastAttemptDate;
    final remoteMta = this.remoteMta;
    return {
      'Action': action.value,
      'Status': status,
      if (diagnosticCode != null) 'DiagnosticCode': diagnosticCode,
      if (extensionFields != null)
        if (extensionFields.isEmpty)
          'ExtensionFields': ''
        else
          for (var i1 = 0; i1 < extensionFields.length; i1++)
            for (var e3 in extensionFields[i1].toQueryMap().entries)
              'ExtensionFields.member.${i1 + 1}.${e3.key}': e3.value,
      if (finalRecipient != null) 'FinalRecipient': finalRecipient,
      if (lastAttemptDate != null)
        'LastAttemptDate': _s.iso8601ToJson(lastAttemptDate),
      if (remoteMta != null) 'RemoteMta': remoteMta,
    };
  }
}

/// An empty element returned on a successful request.
class ReorderReceiptRuleSetResponse {
  ReorderReceiptRuleSetResponse();
  factory ReorderReceiptRuleSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ReorderReceiptRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about the reputation settings for a configuration set.
class ReputationOptions {
  /// The date and time at which the reputation metrics for the configuration set
  /// were last reset. Resetting these metrics is known as a <i>fresh start</i>.
  ///
  /// When you disable email sending for a configuration set using
  /// <a>UpdateConfigurationSetSendingEnabled</a> and later re-enable it, the
  /// reputation metrics for the configuration set (but not for the entire Amazon
  /// SES account) are reset.
  ///
  /// If email sending for the configuration set has never been disabled and later
  /// re-enabled, the value of this attribute is <code>null</code>.
  final DateTime? lastFreshStart;

  /// Describes whether or not Amazon SES publishes reputation metrics for the
  /// configuration set, such as bounce and complaint rates, to Amazon CloudWatch.
  ///
  /// If the value is <code>true</code>, reputation metrics are published. If the
  /// value is <code>false</code>, reputation metrics are not published. The
  /// default value is <code>false</code>.
  final bool? reputationMetricsEnabled;

  /// Describes whether email sending is enabled or disabled for the configuration
  /// set. If the value is <code>true</code>, then Amazon SES sends emails that
  /// use the configuration set. If the value is <code>false</code>, Amazon SES
  /// does not send emails that use the configuration set. The default value is
  /// <code>true</code>. You can change this setting using
  /// <a>UpdateConfigurationSetSendingEnabled</a>.
  final bool? sendingEnabled;

  ReputationOptions({
    this.lastFreshStart,
    this.reputationMetricsEnabled,
    this.sendingEnabled,
  });
  factory ReputationOptions.fromXml(_s.XmlElement elem) {
    return ReputationOptions(
      lastFreshStart: _s.extractXmlDateTimeValue(elem, 'LastFreshStart'),
      reputationMetricsEnabled:
          _s.extractXmlBoolValue(elem, 'ReputationMetricsEnabled'),
      sendingEnabled: _s.extractXmlBoolValue(elem, 'SendingEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final lastFreshStart = this.lastFreshStart;
    final reputationMetricsEnabled = this.reputationMetricsEnabled;
    final sendingEnabled = this.sendingEnabled;
    return {
      if (lastFreshStart != null)
        'LastFreshStart': iso8601ToJson(lastFreshStart),
      if (reputationMetricsEnabled != null)
        'ReputationMetricsEnabled': reputationMetricsEnabled,
      if (sendingEnabled != null) 'SendingEnabled': sendingEnabled,
    };
  }
}

/// When included in a receipt rule, this action saves the received message to
/// an Amazon Simple Storage Service (Amazon S3) bucket and, optionally,
/// publishes a notification to Amazon Simple Notification Service (Amazon SNS).
///
/// To enable Amazon SES to write emails to your Amazon S3 bucket, use an Amazon
/// Web Services KMS key to encrypt your emails, or publish to an Amazon SNS
/// topic of another account, Amazon SES must have permission to access those
/// resources. For information about granting permissions, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html">Amazon
/// SES Developer Guide</a>.
/// <note>
/// When you save your emails to an Amazon S3 bucket, the maximum email size
/// (including headers) is 40 MB. Emails larger than that bounces.
/// </note>
/// For information about specifying Amazon S3 actions in receipt rules, see the
/// <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-s3.html">Amazon
/// SES Developer Guide</a>.
class S3Action {
  /// The name of the Amazon S3 bucket for incoming email.
  final String bucketName;

  /// The ARN of the IAM role to be used by Amazon Simple Email Service while
  /// writing to the Amazon S3 bucket, optionally encrypting your mail via the
  /// provided customer managed key, and publishing to the Amazon SNS topic. This
  /// role should have access to the following APIs:
  ///
  /// <ul>
  /// <li>
  /// <code>s3:PutObject</code>, <code>kms:Encrypt</code> and
  /// <code>kms:GenerateDataKey</code> for the given Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>kms:GenerateDataKey</code> for the given Amazon Web Services KMS
  /// customer managed key.
  /// </li>
  /// <li>
  /// <code>sns:Publish</code> for the given Amazon SNS topic.
  /// </li>
  /// </ul> <note>
  /// If an IAM role ARN is provided, the role (and only the role) is used to
  /// access all the given resources (Amazon S3 bucket, Amazon Web Services KMS
  /// customer managed key and Amazon SNS topic). Therefore, setting up individual
  /// resource access permissions is not required.
  /// </note>
  final String? iamRoleArn;

  /// The customer managed key that Amazon SES should use to encrypt your emails
  /// before saving them to the Amazon S3 bucket. You can use the default managed
  /// key or a custom managed key that you created in Amazon Web Services KMS as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// To use the default managed key, provide an ARN in the form of
  /// <code>arn:aws:kms:REGION:ACCOUNT-ID-WITHOUT-HYPHENS:alias/aws/ses</code>.
  /// For example, if your Amazon Web Services account ID is 123456789012 and you
  /// want to use the default managed key in the US West (Oregon) Region, the ARN
  /// of the default master key would be
  /// <code>arn:aws:kms:us-west-2:123456789012:alias/aws/ses</code>. If you use
  /// the default managed key, you don't need to perform any extra steps to give
  /// Amazon SES permission to use the key.
  /// </li>
  /// <li>
  /// To use a custom managed key that you created in Amazon Web Services KMS,
  /// provide the ARN of the managed key and ensure that you add a statement to
  /// your key's policy to give Amazon SES permission to use it. For more
  /// information about giving permissions, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html">Amazon
  /// SES Developer Guide</a>.
  /// </li>
  /// </ul>
  /// For more information about key policies, see the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html">Amazon
  /// Web Services KMS Developer Guide</a>. If you do not specify a managed key,
  /// Amazon SES does not encrypt your emails.
  /// <important>
  /// Your mail is encrypted by Amazon SES using the Amazon S3 encryption client
  /// before the mail is submitted to Amazon S3 for storage. It is not encrypted
  /// using Amazon S3 server-side encryption. This means that you must use the
  /// Amazon S3 encryption client to decrypt the email after retrieving it from
  /// Amazon S3, as the service has no access to use your Amazon Web Services KMS
  /// keys for decryption. This encryption client is currently available with the
  /// <a href="http://aws.amazon.com/sdk-for-java/">Amazon Web Services SDK for
  /// Java</a> and <a href="http://aws.amazon.com/sdk-for-ruby/">Amazon Web
  /// Services SDK for Ruby</a> only. For more information about client-side
  /// encryption using Amazon Web Services KMS managed keys, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 Developer Guide</a>.
  /// </important>
  final String? kmsKeyArn;

  /// The key prefix of the Amazon S3 bucket. The key prefix is similar to a
  /// directory name that enables you to store similar data under the same
  /// directory in a bucket.
  final String? objectKeyPrefix;

  /// The ARN of the Amazon SNS topic to notify when the message is saved to the
  /// Amazon S3 bucket. You can find the ARN of a topic by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html">ListTopics</a>
  /// operation in Amazon SNS.
  ///
  /// For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String? topicArn;

  S3Action({
    required this.bucketName,
    this.iamRoleArn,
    this.kmsKeyArn,
    this.objectKeyPrefix,
    this.topicArn,
  });
  factory S3Action.fromXml(_s.XmlElement elem) {
    return S3Action(
      bucketName: _s.extractXmlStringValue(elem, 'BucketName')!,
      iamRoleArn: _s.extractXmlStringValue(elem, 'IamRoleArn'),
      kmsKeyArn: _s.extractXmlStringValue(elem, 'KmsKeyArn'),
      objectKeyPrefix: _s.extractXmlStringValue(elem, 'ObjectKeyPrefix'),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final iamRoleArn = this.iamRoleArn;
    final kmsKeyArn = this.kmsKeyArn;
    final objectKeyPrefix = this.objectKeyPrefix;
    final topicArn = this.topicArn;
    return {
      'BucketName': bucketName,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (objectKeyPrefix != null) 'ObjectKeyPrefix': objectKeyPrefix,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }

  Map<String, String> toQueryMap() {
    final bucketName = this.bucketName;
    final iamRoleArn = this.iamRoleArn;
    final kmsKeyArn = this.kmsKeyArn;
    final objectKeyPrefix = this.objectKeyPrefix;
    final topicArn = this.topicArn;
    return {
      'BucketName': bucketName,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (objectKeyPrefix != null) 'ObjectKeyPrefix': objectKeyPrefix,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

/// When included in a receipt rule, this action publishes a notification to
/// Amazon Simple Notification Service (Amazon SNS). This action includes a
/// complete copy of the email content in the Amazon SNS notifications. Amazon
/// SNS notifications for all other actions simply provide information about the
/// email. They do not include the email content itself.
///
/// If you own the Amazon SNS topic, you don't need to do anything to give
/// Amazon SES permission to publish emails to it. However, if you don't own the
/// Amazon SNS topic, you need to attach a policy to the topic to give Amazon
/// SES permissions to access it. For information about giving permissions, see
/// the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html">Amazon
/// SES Developer Guide</a>.
/// <important>
/// You can only publish emails that are 150 KB or less (including the header)
/// to Amazon SNS. Larger emails bounce. If you anticipate emails larger than
/// 150 KB, use the S3 action instead.
/// </important>
/// For information about using a receipt rule to publish an Amazon SNS
/// notification, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-sns.html">Amazon
/// SES Developer Guide</a>.
class SNSAction {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. You can
  /// find the ARN of a topic by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html">ListTopics</a>
  /// operation in Amazon SNS.
  ///
  /// For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String topicArn;

  /// The encoding to use for the email within the Amazon SNS notification. UTF-8
  /// is easier to use, but may not preserve all special characters when a message
  /// was encoded with a different encoding format. Base64 preserves all special
  /// characters. The default value is UTF-8.
  final SNSActionEncoding? encoding;

  SNSAction({
    required this.topicArn,
    this.encoding,
  });
  factory SNSAction.fromXml(_s.XmlElement elem) {
    return SNSAction(
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn')!,
      encoding: _s
          .extractXmlStringValue(elem, 'Encoding')
          ?.let(SNSActionEncoding.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    final encoding = this.encoding;
    return {
      'TopicArn': topicArn,
      if (encoding != null) 'Encoding': encoding.value,
    };
  }

  Map<String, String> toQueryMap() {
    final topicArn = this.topicArn;
    final encoding = this.encoding;
    return {
      'TopicArn': topicArn,
      if (encoding != null) 'Encoding': encoding.value,
    };
  }
}

enum SNSActionEncoding {
  utf_8('UTF-8'),
  base64('Base64'),
  ;

  final String value;

  const SNSActionEncoding(this.value);

  static SNSActionEncoding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SNSActionEncoding'));
}

/// Contains the topic ARN associated with an Amazon Simple Notification Service
/// (Amazon SNS) event destination.
///
/// Event destinations, such as Amazon SNS, are associated with configuration
/// sets, which enable you to publish email sending events. For information
/// about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class SNSDestination {
  /// The ARN of the Amazon SNS topic for email sending events. You can find the
  /// ARN of a topic by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html">ListTopics</a>
  /// Amazon SNS operation.
  ///
  /// For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String topicARN;

  SNSDestination({
    required this.topicARN,
  });
  factory SNSDestination.fromXml(_s.XmlElement elem) {
    return SNSDestination(
      topicARN: _s.extractXmlStringValue(elem, 'TopicARN')!,
    );
  }

  Map<String, dynamic> toJson() {
    final topicARN = this.topicARN;
    return {
      'TopicARN': topicARN,
    };
  }

  Map<String, String> toQueryMap() {
    final topicARN = this.topicARN;
    return {
      'TopicARN': topicARN,
    };
  }
}

/// Represents a unique message ID.
class SendBounceResponse {
  /// The message ID of the bounce message.
  final String? messageId;

  SendBounceResponse({
    this.messageId,
  });
  factory SendBounceResponse.fromXml(_s.XmlElement elem) {
    return SendBounceResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

class SendBulkTemplatedEmailResponse {
  /// One object per intended recipient. Check each response object and retry any
  /// messages with a failure status. (Note that order of responses will be
  /// respective to order of destinations in the request.)Receipt rules enable you
  /// to specify which actions
  final List<BulkEmailDestinationStatus> status;

  SendBulkTemplatedEmailResponse({
    required this.status,
  });
  factory SendBulkTemplatedEmailResponse.fromXml(_s.XmlElement elem) {
    return SendBulkTemplatedEmailResponse(
      status: _s
          .extractXmlChild(elem, 'Status')!
          .findElements('member')
          .map(BulkEmailDestinationStatus.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'Status': status,
    };
  }
}

/// The response received when attempting to send the custom verification email.
class SendCustomVerificationEmailResponse {
  /// The unique message identifier returned from the
  /// <code>SendCustomVerificationEmail</code> operation.
  final String? messageId;

  SendCustomVerificationEmailResponse({
    this.messageId,
  });
  factory SendCustomVerificationEmailResponse.fromXml(_s.XmlElement elem) {
    return SendCustomVerificationEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

/// Represents sending statistics data. Each <code>SendDataPoint</code> contains
/// statistics for a 15-minute period of sending activity.
class SendDataPoint {
  /// Number of emails that have bounced.
  final int? bounces;

  /// Number of unwanted emails that were rejected by recipients.
  final int? complaints;

  /// Number of emails that have been sent.
  final int? deliveryAttempts;

  /// Number of emails rejected by Amazon SES.
  final int? rejects;

  /// Time of the data point.
  final DateTime? timestamp;

  SendDataPoint({
    this.bounces,
    this.complaints,
    this.deliveryAttempts,
    this.rejects,
    this.timestamp,
  });
  factory SendDataPoint.fromXml(_s.XmlElement elem) {
    return SendDataPoint(
      bounces: _s.extractXmlIntValue(elem, 'Bounces'),
      complaints: _s.extractXmlIntValue(elem, 'Complaints'),
      deliveryAttempts: _s.extractXmlIntValue(elem, 'DeliveryAttempts'),
      rejects: _s.extractXmlIntValue(elem, 'Rejects'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final bounces = this.bounces;
    final complaints = this.complaints;
    final deliveryAttempts = this.deliveryAttempts;
    final rejects = this.rejects;
    final timestamp = this.timestamp;
    return {
      if (bounces != null) 'Bounces': bounces,
      if (complaints != null) 'Complaints': complaints,
      if (deliveryAttempts != null) 'DeliveryAttempts': deliveryAttempts,
      if (rejects != null) 'Rejects': rejects,
      if (timestamp != null) 'Timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Represents a unique message ID.
class SendEmailResponse {
  /// The unique message identifier returned from the <code>SendEmail</code>
  /// action.
  final String messageId;

  SendEmailResponse({
    required this.messageId,
  });
  factory SendEmailResponse.fromXml(_s.XmlElement elem) {
    return SendEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      'MessageId': messageId,
    };
  }
}

/// Represents a unique message ID.
class SendRawEmailResponse {
  /// The unique message identifier returned from the <code>SendRawEmail</code>
  /// action.
  final String messageId;

  SendRawEmailResponse({
    required this.messageId,
  });
  factory SendRawEmailResponse.fromXml(_s.XmlElement elem) {
    return SendRawEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      'MessageId': messageId,
    };
  }
}

class SendTemplatedEmailResponse {
  /// The unique message identifier returned from the
  /// <code>SendTemplatedEmail</code> action.
  final String messageId;

  SendTemplatedEmailResponse({
    required this.messageId,
  });
  factory SendTemplatedEmailResponse.fromXml(_s.XmlElement elem) {
    return SendTemplatedEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      'MessageId': messageId,
    };
  }
}

/// An empty element returned on a successful request.
class SetActiveReceiptRuleSetResponse {
  SetActiveReceiptRuleSetResponse();
  factory SetActiveReceiptRuleSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetActiveReceiptRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class SetIdentityDkimEnabledResponse {
  SetIdentityDkimEnabledResponse();
  factory SetIdentityDkimEnabledResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityDkimEnabledResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class SetIdentityFeedbackForwardingEnabledResponse {
  SetIdentityFeedbackForwardingEnabledResponse();
  factory SetIdentityFeedbackForwardingEnabledResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityFeedbackForwardingEnabledResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class SetIdentityHeadersInNotificationsEnabledResponse {
  SetIdentityHeadersInNotificationsEnabledResponse();
  factory SetIdentityHeadersInNotificationsEnabledResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityHeadersInNotificationsEnabledResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class SetIdentityMailFromDomainResponse {
  SetIdentityMailFromDomainResponse();
  factory SetIdentityMailFromDomainResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityMailFromDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class SetIdentityNotificationTopicResponse {
  SetIdentityNotificationTopicResponse();
  factory SetIdentityNotificationTopicResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityNotificationTopicResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class SetReceiptRulePositionResponse {
  SetReceiptRulePositionResponse();
  factory SetReceiptRulePositionResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetReceiptRulePositionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// When included in a receipt rule, this action terminates the evaluation of
/// the receipt rule set and, optionally, publishes a notification to Amazon
/// Simple Notification Service (Amazon SNS).
///
/// For information about setting a stop action in a receipt rule, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-stop.html">Amazon
/// SES Developer Guide</a>.
class StopAction {
  /// The scope of the StopAction. The only acceptable value is
  /// <code>RuleSet</code>.
  final StopScope scope;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// stop action is taken. You can find the ARN of a topic by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html">ListTopics</a>
  /// Amazon SNS operation.
  ///
  /// For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String? topicArn;

  StopAction({
    required this.scope,
    this.topicArn,
  });
  factory StopAction.fromXml(_s.XmlElement elem) {
    return StopAction(
      scope: _s.extractXmlStringValue(elem, 'Scope')!.let(StopScope.fromString),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final scope = this.scope;
    final topicArn = this.topicArn;
    return {
      'Scope': scope.value,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }

  Map<String, String> toQueryMap() {
    final scope = this.scope;
    final topicArn = this.topicArn;
    return {
      'Scope': scope.value,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

enum StopScope {
  ruleSet('RuleSet'),
  ;

  final String value;

  const StopScope(this.value);

  static StopScope fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum StopScope'));
}

/// The content of the email, composed of a subject line and either an HTML part
/// or a text-only part.
class Template {
  /// The name of the template. You use this name when you send email using the
  /// <code>SendTemplatedEmail</code> or <code>SendBulkTemplatedEmail</code>
  /// operations.
  final String templateName;

  /// The HTML body of the email.
  final String? htmlPart;

  /// The subject line of the email.
  final String? subjectPart;

  /// The email body that is visible to recipients whose email clients do not
  /// display HTML content.
  final String? textPart;

  Template({
    required this.templateName,
    this.htmlPart,
    this.subjectPart,
    this.textPart,
  });
  factory Template.fromXml(_s.XmlElement elem) {
    return Template(
      templateName: _s.extractXmlStringValue(elem, 'TemplateName')!,
      htmlPart: _s.extractXmlStringValue(elem, 'HtmlPart'),
      subjectPart: _s.extractXmlStringValue(elem, 'SubjectPart'),
      textPart: _s.extractXmlStringValue(elem, 'TextPart'),
    );
  }

  Map<String, dynamic> toJson() {
    final templateName = this.templateName;
    final htmlPart = this.htmlPart;
    final subjectPart = this.subjectPart;
    final textPart = this.textPart;
    return {
      'TemplateName': templateName,
      if (htmlPart != null) 'HtmlPart': htmlPart,
      if (subjectPart != null) 'SubjectPart': subjectPart,
      if (textPart != null) 'TextPart': textPart,
    };
  }

  Map<String, String> toQueryMap() {
    final templateName = this.templateName;
    final htmlPart = this.htmlPart;
    final subjectPart = this.subjectPart;
    final textPart = this.textPart;
    return {
      'TemplateName': templateName,
      if (htmlPart != null) 'HtmlPart': htmlPart,
      if (subjectPart != null) 'SubjectPart': subjectPart,
      if (textPart != null) 'TextPart': textPart,
    };
  }
}

/// Contains information about an email template.
class TemplateMetadata {
  /// The time and date the template was created.
  final DateTime? createdTimestamp;

  /// The name of the template.
  final String? name;

  TemplateMetadata({
    this.createdTimestamp,
    this.name,
  });
  factory TemplateMetadata.fromXml(_s.XmlElement elem) {
    return TemplateMetadata(
      createdTimestamp: _s.extractXmlDateTimeValue(elem, 'CreatedTimestamp'),
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (name != null) 'Name': name,
    };
  }
}

class TestRenderTemplateResponse {
  /// The complete MIME message rendered by applying the data in the TemplateData
  /// parameter to the template specified in the TemplateName parameter.
  final String? renderedTemplate;

  TestRenderTemplateResponse({
    this.renderedTemplate,
  });
  factory TestRenderTemplateResponse.fromXml(_s.XmlElement elem) {
    return TestRenderTemplateResponse(
      renderedTemplate: _s.extractXmlStringValue(elem, 'RenderedTemplate'),
    );
  }

  Map<String, dynamic> toJson() {
    final renderedTemplate = this.renderedTemplate;
    return {
      if (renderedTemplate != null) 'RenderedTemplate': renderedTemplate,
    };
  }
}

enum TlsPolicy {
  require('Require'),
  optional('Optional'),
  ;

  final String value;

  const TlsPolicy(this.value);

  static TlsPolicy fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum TlsPolicy'));
}

/// A domain that is used to redirect email recipients to an Amazon SES-operated
/// domain. This domain captures open and click events generated by Amazon SES
/// emails.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html">Configuring
/// Custom Domains to Handle Open and Click Tracking</a> in the <i>Amazon SES
/// Developer Guide</i>.
class TrackingOptions {
  /// The custom subdomain that is used to redirect email recipients to the Amazon
  /// SES event tracking domain.
  final String? customRedirectDomain;

  TrackingOptions({
    this.customRedirectDomain,
  });
  factory TrackingOptions.fromXml(_s.XmlElement elem) {
    return TrackingOptions(
      customRedirectDomain:
          _s.extractXmlStringValue(elem, 'CustomRedirectDomain'),
    );
  }

  Map<String, dynamic> toJson() {
    final customRedirectDomain = this.customRedirectDomain;
    return {
      if (customRedirectDomain != null)
        'CustomRedirectDomain': customRedirectDomain,
    };
  }

  Map<String, String> toQueryMap() {
    final customRedirectDomain = this.customRedirectDomain;
    return {
      if (customRedirectDomain != null)
        'CustomRedirectDomain': customRedirectDomain,
    };
  }
}

/// An empty element returned on a successful request.
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();
  factory UpdateConfigurationSetEventDestinationResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class UpdateConfigurationSetTrackingOptionsResponse {
  UpdateConfigurationSetTrackingOptionsResponse();
  factory UpdateConfigurationSetTrackingOptionsResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateConfigurationSetTrackingOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element returned on a successful request.
class UpdateReceiptRuleResponse {
  UpdateReceiptRuleResponse();
  factory UpdateReceiptRuleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateReceiptRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTemplateResponse {
  UpdateTemplateResponse();
  factory UpdateTemplateResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum VerificationStatus {
  pending('Pending'),
  success('Success'),
  failed('Failed'),
  temporaryFailure('TemporaryFailure'),
  notStarted('NotStarted'),
  ;

  final String value;

  const VerificationStatus(this.value);

  static VerificationStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum VerificationStatus'));
}

/// Returns CNAME records that you must publish to the DNS server of your domain
/// to set up Easy DKIM with Amazon SES.
class VerifyDomainDkimResponse {
  /// A set of character strings that represent the domain's identity. If the
  /// identity is an email address, the tokens represent the domain of that
  /// address.
  ///
  /// Using these tokens, you need to create DNS CNAME records that point to DKIM
  /// public keys that are hosted by Amazon SES. Amazon Web Services eventually
  /// detects that you've updated your DNS records. This detection process might
  /// take up to 72 hours. After successful detection, Amazon SES is able to
  /// DKIM-sign email originating from that domain. (This only applies to domain
  /// identities, not email address identities.)
  ///
  /// For more information about creating DNS records using DKIM tokens, see the
  /// <a
  /// href="https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html">Amazon
  /// SES Developer Guide</a>.
  final List<String> dkimTokens;

  VerifyDomainDkimResponse({
    required this.dkimTokens,
  });
  factory VerifyDomainDkimResponse.fromXml(_s.XmlElement elem) {
    return VerifyDomainDkimResponse(
      dkimTokens: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'DkimTokens')!, 'member'),
    );
  }

  Map<String, dynamic> toJson() {
    final dkimTokens = this.dkimTokens;
    return {
      'DkimTokens': dkimTokens,
    };
  }
}

/// Returns a TXT record that you must publish to the DNS server of your domain
/// to complete domain verification with Amazon SES.
class VerifyDomainIdentityResponse {
  /// A TXT record that you must place in the DNS settings of the domain to
  /// complete domain verification with Amazon SES.
  ///
  /// As Amazon SES searches for the TXT record, the domain's verification status
  /// is "Pending". When Amazon SES detects the record, the domain's verification
  /// status changes to "Success". If Amazon SES is unable to detect the record
  /// within 72 hours, the domain's verification status changes to "Failed." In
  /// that case, to verify the domain, you must restart the verification process
  /// from the beginning. The domain's verification status also changes to
  /// "Success" when it is DKIM verified.
  final String verificationToken;

  VerifyDomainIdentityResponse({
    required this.verificationToken,
  });
  factory VerifyDomainIdentityResponse.fromXml(_s.XmlElement elem) {
    return VerifyDomainIdentityResponse(
      verificationToken: _s.extractXmlStringValue(elem, 'VerificationToken')!,
    );
  }

  Map<String, dynamic> toJson() {
    final verificationToken = this.verificationToken;
    return {
      'VerificationToken': verificationToken,
    };
  }
}

/// An empty element returned on a successful request.
class VerifyEmailIdentityResponse {
  VerifyEmailIdentityResponse();
  factory VerifyEmailIdentityResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return VerifyEmailIdentityResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// When included in a receipt rule, this action calls Amazon WorkMail and,
/// optionally, publishes a notification to Amazon Simple Notification Service
/// (Amazon SNS). It usually isn't necessary to set this up manually, because
/// Amazon WorkMail adds the rule automatically during its setup procedure.
///
/// For information using a receipt rule to call Amazon WorkMail, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-workmail.html">Amazon
/// SES Developer Guide</a>.
class WorkmailAction {
  /// The Amazon Resource Name (ARN) of the Amazon WorkMail organization. Amazon
  /// WorkMail ARNs use the following format:
  ///
  /// <code>arn:aws:workmail:&lt;region&gt;:&lt;awsAccountId&gt;:organization/&lt;workmailOrganizationId&gt;</code>
  ///
  /// You can find the ID of your organization by using the <a
  /// href="https://docs.aws.amazon.com/workmail/latest/APIReference/API_ListOrganizations.html">ListOrganizations</a>
  /// operation in Amazon WorkMail. Amazon WorkMail organization IDs begin with
  /// "<code>m-</code>", followed by a string of alphanumeric characters.
  ///
  /// For information about Amazon WorkMail organizations, see the <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/organizations_overview.html">Amazon
  /// WorkMail Administrator Guide</a>.
  final String organizationArn;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// WorkMail action is called. You can find the ARN of a topic by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html">ListTopics</a>
  /// operation in Amazon SNS.
  ///
  /// For more information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  final String? topicArn;

  WorkmailAction({
    required this.organizationArn,
    this.topicArn,
  });
  factory WorkmailAction.fromXml(_s.XmlElement elem) {
    return WorkmailAction(
      organizationArn: _s.extractXmlStringValue(elem, 'OrganizationArn')!,
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationArn = this.organizationArn;
    final topicArn = this.topicArn;
    return {
      'OrganizationArn': organizationArn,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }

  Map<String, String> toQueryMap() {
    final organizationArn = this.organizationArn;
    final topicArn = this.topicArn;
    return {
      'OrganizationArn': organizationArn,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

class AccountSendingPausedException extends _s.GenericAwsException {
  AccountSendingPausedException({String? type, String? message})
      : super(
            type: type,
            code: 'AccountSendingPausedException',
            message: message);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class CannotDeleteException extends _s.GenericAwsException {
  CannotDeleteException({String? type, String? message})
      : super(type: type, code: 'CannotDeleteException', message: message);
}

class ConfigurationSetAlreadyExistsException extends _s.GenericAwsException {
  ConfigurationSetAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ConfigurationSetAlreadyExistsException',
            message: message);
}

class ConfigurationSetDoesNotExistException extends _s.GenericAwsException {
  ConfigurationSetDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'ConfigurationSetDoesNotExistException',
            message: message);
}

class ConfigurationSetSendingPausedException extends _s.GenericAwsException {
  ConfigurationSetSendingPausedException({String? type, String? message})
      : super(
            type: type,
            code: 'ConfigurationSetSendingPausedException',
            message: message);
}

class CustomVerificationEmailInvalidContentException
    extends _s.GenericAwsException {
  CustomVerificationEmailInvalidContentException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'CustomVerificationEmailInvalidContentException',
            message: message);
}

class CustomVerificationEmailTemplateAlreadyExistsException
    extends _s.GenericAwsException {
  CustomVerificationEmailTemplateAlreadyExistsException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'CustomVerificationEmailTemplateAlreadyExistsException',
            message: message);
}

class CustomVerificationEmailTemplateDoesNotExistException
    extends _s.GenericAwsException {
  CustomVerificationEmailTemplateDoesNotExistException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'CustomVerificationEmailTemplateDoesNotExistException',
            message: message);
}

class EventDestinationAlreadyExistsException extends _s.GenericAwsException {
  EventDestinationAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDestinationAlreadyExistsException',
            message: message);
}

class EventDestinationDoesNotExistException extends _s.GenericAwsException {
  EventDestinationDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDestinationDoesNotExistException',
            message: message);
}

class FromEmailAddressNotVerifiedException extends _s.GenericAwsException {
  FromEmailAddressNotVerifiedException({String? type, String? message})
      : super(
            type: type,
            code: 'FromEmailAddressNotVerifiedException',
            message: message);
}

class InvalidCloudWatchDestinationException extends _s.GenericAwsException {
  InvalidCloudWatchDestinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCloudWatchDestinationException',
            message: message);
}

class InvalidConfigurationSetException extends _s.GenericAwsException {
  InvalidConfigurationSetException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConfigurationSetException',
            message: message);
}

class InvalidDeliveryOptionsException extends _s.GenericAwsException {
  InvalidDeliveryOptionsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeliveryOptionsException',
            message: message);
}

class InvalidFirehoseDestinationException extends _s.GenericAwsException {
  InvalidFirehoseDestinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidFirehoseDestinationException',
            message: message);
}

class InvalidLambdaFunctionException extends _s.GenericAwsException {
  InvalidLambdaFunctionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidLambdaFunctionException',
            message: message);
}

class InvalidPolicyException extends _s.GenericAwsException {
  InvalidPolicyException({String? type, String? message})
      : super(type: type, code: 'InvalidPolicyException', message: message);
}

class InvalidRenderingParameterException extends _s.GenericAwsException {
  InvalidRenderingParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRenderingParameterException',
            message: message);
}

class InvalidS3ConfigurationException extends _s.GenericAwsException {
  InvalidS3ConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidS3ConfigurationException',
            message: message);
}

class InvalidSNSDestinationException extends _s.GenericAwsException {
  InvalidSNSDestinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSNSDestinationException',
            message: message);
}

class InvalidSnsTopicException extends _s.GenericAwsException {
  InvalidSnsTopicException({String? type, String? message})
      : super(type: type, code: 'InvalidSnsTopicException', message: message);
}

class InvalidTemplateException extends _s.GenericAwsException {
  InvalidTemplateException({String? type, String? message})
      : super(type: type, code: 'InvalidTemplateException', message: message);
}

class InvalidTrackingOptionsException extends _s.GenericAwsException {
  InvalidTrackingOptionsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTrackingOptionsException',
            message: message);
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

class MissingRenderingAttributeException extends _s.GenericAwsException {
  MissingRenderingAttributeException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingRenderingAttributeException',
            message: message);
}

class ProductionAccessNotGrantedException extends _s.GenericAwsException {
  ProductionAccessNotGrantedException({String? type, String? message})
      : super(
            type: type,
            code: 'ProductionAccessNotGrantedException',
            message: message);
}

class RuleDoesNotExistException extends _s.GenericAwsException {
  RuleDoesNotExistException({String? type, String? message})
      : super(type: type, code: 'RuleDoesNotExistException', message: message);
}

class RuleSetDoesNotExistException extends _s.GenericAwsException {
  RuleSetDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'RuleSetDoesNotExistException', message: message);
}

class TemplateDoesNotExistException extends _s.GenericAwsException {
  TemplateDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'TemplateDoesNotExistException',
            message: message);
}

class TrackingOptionsAlreadyExistsException extends _s.GenericAwsException {
  TrackingOptionsAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'TrackingOptionsAlreadyExistsException',
            message: message);
}

class TrackingOptionsDoesNotExistException extends _s.GenericAwsException {
  TrackingOptionsDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'TrackingOptionsDoesNotExistException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccountSendingPausedException': (type, message) =>
      AccountSendingPausedException(type: type, message: message),
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'CannotDeleteException': (type, message) =>
      CannotDeleteException(type: type, message: message),
  'ConfigurationSetAlreadyExistsException': (type, message) =>
      ConfigurationSetAlreadyExistsException(type: type, message: message),
  'ConfigurationSetDoesNotExistException': (type, message) =>
      ConfigurationSetDoesNotExistException(type: type, message: message),
  'ConfigurationSetSendingPausedException': (type, message) =>
      ConfigurationSetSendingPausedException(type: type, message: message),
  'CustomVerificationEmailInvalidContentException': (type, message) =>
      CustomVerificationEmailInvalidContentException(
          type: type, message: message),
  'CustomVerificationEmailTemplateAlreadyExistsException': (type, message) =>
      CustomVerificationEmailTemplateAlreadyExistsException(
          type: type, message: message),
  'CustomVerificationEmailTemplateDoesNotExistException': (type, message) =>
      CustomVerificationEmailTemplateDoesNotExistException(
          type: type, message: message),
  'EventDestinationAlreadyExistsException': (type, message) =>
      EventDestinationAlreadyExistsException(type: type, message: message),
  'EventDestinationDoesNotExistException': (type, message) =>
      EventDestinationDoesNotExistException(type: type, message: message),
  'FromEmailAddressNotVerifiedException': (type, message) =>
      FromEmailAddressNotVerifiedException(type: type, message: message),
  'InvalidCloudWatchDestinationException': (type, message) =>
      InvalidCloudWatchDestinationException(type: type, message: message),
  'InvalidConfigurationSetException': (type, message) =>
      InvalidConfigurationSetException(type: type, message: message),
  'InvalidDeliveryOptionsException': (type, message) =>
      InvalidDeliveryOptionsException(type: type, message: message),
  'InvalidFirehoseDestinationException': (type, message) =>
      InvalidFirehoseDestinationException(type: type, message: message),
  'InvalidLambdaFunctionException': (type, message) =>
      InvalidLambdaFunctionException(type: type, message: message),
  'InvalidPolicyException': (type, message) =>
      InvalidPolicyException(type: type, message: message),
  'InvalidRenderingParameterException': (type, message) =>
      InvalidRenderingParameterException(type: type, message: message),
  'InvalidS3ConfigurationException': (type, message) =>
      InvalidS3ConfigurationException(type: type, message: message),
  'InvalidSNSDestinationException': (type, message) =>
      InvalidSNSDestinationException(type: type, message: message),
  'InvalidSnsTopicException': (type, message) =>
      InvalidSnsTopicException(type: type, message: message),
  'InvalidTemplateException': (type, message) =>
      InvalidTemplateException(type: type, message: message),
  'InvalidTrackingOptionsException': (type, message) =>
      InvalidTrackingOptionsException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MailFromDomainNotVerifiedException': (type, message) =>
      MailFromDomainNotVerifiedException(type: type, message: message),
  'MessageRejected': (type, message) =>
      MessageRejected(type: type, message: message),
  'MissingRenderingAttributeException': (type, message) =>
      MissingRenderingAttributeException(type: type, message: message),
  'ProductionAccessNotGrantedException': (type, message) =>
      ProductionAccessNotGrantedException(type: type, message: message),
  'RuleDoesNotExistException': (type, message) =>
      RuleDoesNotExistException(type: type, message: message),
  'RuleSetDoesNotExistException': (type, message) =>
      RuleSetDoesNotExistException(type: type, message: message),
  'TemplateDoesNotExistException': (type, message) =>
      TemplateDoesNotExistException(type: type, message: message),
  'TrackingOptionsAlreadyExistsException': (type, message) =>
      TrackingOptionsAlreadyExistsException(type: type, message: message),
  'TrackingOptionsDoesNotExistException': (type, message) =>
      TrackingOptionsDoesNotExistException(type: type, message: message),
};
