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

import '2010-12-01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

part '2010-12-01.g.dart';

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
class Ses {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Ses({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'email',
            signingName: 'ses',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Creates a receipt rule set by cloning an existing one. All receipt rules
  /// and configurations are copied to the new receipt rule set and are
  /// completely independent of the source rule set.
  ///
  /// For information about setting up rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon
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
  /// The name of the rule set to create. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain less than 64 characters.
  /// </li>
  /// </ul>
  Future<void> cloneReceiptRuleSet({
    @_s.required String originalRuleSetName,
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(originalRuleSetName, 'originalRuleSetName');
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['OriginalRuleSetName'] = originalRuleSetName;
    $request['RuleSetName'] = ruleSetName;
    await _protocol.send(
      $request,
      action: 'CloneReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CloneReceiptRuleSetRequest'],
      shapes: shapes,
      resultWrapper: 'CloneReceiptRuleSetResult',
    );
  }

  /// Creates a configuration set.
  ///
  /// Configuration sets enable you to publish email sending events. For
  /// information about using configuration sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
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
    @_s.required ConfigurationSet configurationSet,
  }) async {
    ArgumentError.checkNotNull(configurationSet, 'configurationSet');
    final $request = <String, dynamic>{};
    $request['ConfigurationSet'] = configurationSet;
    await _protocol.send(
      $request,
      action: 'CreateConfigurationSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateConfigurationSetRequest'],
      shapes: shapes,
      resultWrapper: 'CreateConfigurationSetResult',
    );
  }

  /// Creates a configuration set event destination.
  /// <note>
  /// When you create or update an event destination, you must provide one, and
  /// only one, destination. The destination can be CloudWatch, Amazon Kinesis
  /// Firehose, or Amazon Simple Notification Service (Amazon SNS).
  /// </note>
  /// An event destination is the AWS service to which Amazon SES publishes the
  /// email sending events associated with a configuration set. For information
  /// about using configuration sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
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
  /// An object that describes the AWS service that email sending event
  /// information will be published to.
  Future<void> createConfigurationSetEventDestination({
    @_s.required String configurationSetName,
    @_s.required EventDestination eventDestination,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestination, 'eventDestination');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    $request['EventDestination'] = eventDestination;
    await _protocol.send(
      $request,
      action: 'CreateConfigurationSetEventDestination',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateConfigurationSetEventDestinationRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon
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
    @_s.required String configurationSetName,
    @_s.required TrackingOptions trackingOptions,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(trackingOptions, 'trackingOptions');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    $request['TrackingOptions'] = trackingOptions;
    await _protocol.send(
      $request,
      action: 'CreateConfigurationSetTrackingOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateConfigurationSetTrackingOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'CreateConfigurationSetTrackingOptionsResult',
    );
  }

  /// Creates a new custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html#custom-verification-emails-faq">Custom
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
    ArgumentError.checkNotNull(templateSubject, 'templateSubject');
    final $request = <String, dynamic>{};
    $request['FailureRedirectionURL'] = failureRedirectionURL;
    $request['FromEmailAddress'] = fromEmailAddress;
    $request['SuccessRedirectionURL'] = successRedirectionURL;
    $request['TemplateContent'] = templateContent;
    $request['TemplateName'] = templateName;
    $request['TemplateSubject'] = templateSubject;
    await _protocol.send(
      $request,
      action: 'CreateCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateCustomVerificationEmailTemplateRequest'],
      shapes: shapes,
    );
  }

  /// Creates a new IP address filter.
  ///
  /// For information about setting up IP address filters, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html">Amazon
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
    @_s.required ReceiptFilter filter,
  }) async {
    ArgumentError.checkNotNull(filter, 'filter');
    final $request = <String, dynamic>{};
    $request['Filter'] = filter;
    await _protocol.send(
      $request,
      action: 'CreateReceiptFilter',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateReceiptFilterRequest'],
      shapes: shapes,
      resultWrapper: 'CreateReceiptFilterResult',
    );
  }

  /// Creates a receipt rule.
  ///
  /// For information about setting up receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon
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
  /// The name of the rule set that the receipt rule will be added to.
  ///
  /// Parameter [after] :
  /// The name of an existing rule after which the new rule will be placed. If
  /// this parameter is null, the new rule will be inserted at the beginning of
  /// the rule list.
  Future<void> createReceiptRule({
    @_s.required ReceiptRule rule,
    @_s.required String ruleSetName,
    String after,
  }) async {
    ArgumentError.checkNotNull(rule, 'rule');
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['Rule'] = rule;
    $request['RuleSetName'] = ruleSetName;
    after?.also((arg) => $request['After'] = arg);
    await _protocol.send(
      $request,
      action: 'CreateReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateReceiptRuleRequest'],
      shapes: shapes,
      resultWrapper: 'CreateReceiptRuleResult',
    );
  }

  /// Creates an empty receipt rule set.
  ///
  /// For information about setting up receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [ruleSetName] :
  /// The name of the rule set to create. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain less than 64 characters.
  /// </li>
  /// </ul>
  Future<void> createReceiptRuleSet({
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['RuleSetName'] = ruleSetName;
    await _protocol.send(
      $request,
      action: 'CreateReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateReceiptRuleSetRequest'],
      shapes: shapes,
      resultWrapper: 'CreateReceiptRuleSetResult',
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
  /// May throw [InvalidTemplateException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [template] :
  /// The content of the email, composed of a subject line, an HTML part, and a
  /// text-only part.
  Future<void> createTemplate({
    @_s.required Template template,
  }) async {
    ArgumentError.checkNotNull(template, 'template');
    final $request = <String, dynamic>{};
    $request['Template'] = template;
    await _protocol.send(
      $request,
      action: 'CreateTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateTemplateRequest'],
      shapes: shapes,
      resultWrapper: 'CreateTemplateResult',
    );
  }

  /// Deletes a configuration set. Configuration sets enable you to publish
  /// email sending events. For information about using configuration sets, see
  /// the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to delete.
  Future<void> deleteConfigurationSet({
    @_s.required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    await _protocol.send(
      $request,
      action: 'DeleteConfigurationSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteConfigurationSetRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteConfigurationSetResult',
    );
  }

  /// Deletes a configuration set event destination. Configuration set event
  /// destinations are associated with configuration sets, which enable you to
  /// publish email sending events. For information about using configuration
  /// sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
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
    @_s.required String configurationSetName,
    @_s.required String eventDestinationName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    $request['EventDestinationName'] = eventDestinationName;
    await _protocol.send(
      $request,
      action: 'DeleteConfigurationSetEventDestination',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteConfigurationSetEventDestinationRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Deleting this kind of association will result in emails sent using the
  /// specified configuration set to capture open and click events using the
  /// standard, Amazon SES-operated domains.
  /// </note>
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [TrackingOptionsDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set from which you want to delete the
  /// tracking options.
  Future<void> deleteConfigurationSetTrackingOptions({
    @_s.required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    await _protocol.send(
      $request,
      action: 'DeleteConfigurationSetTrackingOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteConfigurationSetTrackingOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteConfigurationSetTrackingOptionsResult',
    );
  }

  /// Deletes an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template that you want to
  /// delete.
  Future<void> deleteCustomVerificationEmailTemplate({
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    final $request = <String, dynamic>{};
    $request['TemplateName'] = templateName;
    await _protocol.send(
      $request,
      action: 'DeleteCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteCustomVerificationEmailTemplateRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified identity (an email address or a domain) from the
  /// list of verified identities.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identity] :
  /// The identity to be removed from the list of identities for the AWS
  /// Account.
  Future<void> deleteIdentity({
    @_s.required String identity,
  }) async {
    ArgumentError.checkNotNull(identity, 'identity');
    final $request = <String, dynamic>{};
    $request['Identity'] = identity;
    await _protocol.send(
      $request,
      action: 'DeleteIdentity',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteIdentityRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteIdentityResult',
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
  /// Parameter [identity] :
  /// The identity that is associated with the policy that you want to delete.
  /// You can specify the identity by using its name or by using its Amazon
  /// Resource Name (ARN). Examples: <code>user@example.com</code>,
  /// <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this API, you must own the identity.
  ///
  /// Parameter [policyName] :
  /// The name of the policy to be deleted.
  Future<void> deleteIdentityPolicy({
    @_s.required String identity,
    @_s.required String policyName,
  }) async {
    ArgumentError.checkNotNull(identity, 'identity');
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      64,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Identity'] = identity;
    $request['PolicyName'] = policyName;
    await _protocol.send(
      $request,
      action: 'DeleteIdentityPolicy',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteIdentityPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteIdentityPolicyResult',
    );
  }

  /// Deletes the specified IP address filter.
  ///
  /// For information about managing IP address filters, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [filterName] :
  /// The name of the IP address filter to delete.
  Future<void> deleteReceiptFilter({
    @_s.required String filterName,
  }) async {
    ArgumentError.checkNotNull(filterName, 'filterName');
    final $request = <String, dynamic>{};
    $request['FilterName'] = filterName;
    await _protocol.send(
      $request,
      action: 'DeleteReceiptFilter',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteReceiptFilterRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteReceiptFilterResult',
    );
  }

  /// Deletes the specified receipt rule.
  ///
  /// For information about managing receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon
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
    @_s.required String ruleName,
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['RuleName'] = ruleName;
    $request['RuleSetName'] = ruleSetName;
    await _protocol.send(
      $request,
      action: 'DeleteReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteReceiptRuleRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteReceiptRuleResult',
    );
  }

  /// Deletes the specified receipt rule set and all of the receipt rules it
  /// contains.
  /// <note>
  /// The currently active rule set cannot be deleted.
  /// </note>
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [CannotDeleteException].
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set to delete.
  Future<void> deleteReceiptRuleSet({
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['RuleSetName'] = ruleSetName;
    await _protocol.send(
      $request,
      action: 'DeleteReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteReceiptRuleSetRequest'],
      shapes: shapes,
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
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    final $request = <String, dynamic>{};
    $request['TemplateName'] = templateName;
    await _protocol.send(
      $request,
      action: 'DeleteTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteTemplateRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteTemplateResult',
    );
  }

  /// Deprecated. Use the <code>DeleteIdentity</code> operation to delete email
  /// addresses and domains.
  ///
  /// Parameter [emailAddress] :
  /// An email address to be removed from the list of verified addresses.
  Future<void> deleteVerifiedEmailAddress({
    @_s.required String emailAddress,
  }) async {
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    final $request = <String, dynamic>{};
    $request['EmailAddress'] = emailAddress;
    await _protocol.send(
      $request,
      action: 'DeleteVerifiedEmailAddress',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteVerifiedEmailAddressRequest'],
      shapes: shapes,
    );
  }

  /// Returns the metadata and receipt rules for the receipt rule set that is
  /// currently active.
  ///
  /// For information about setting up receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  Future<DescribeActiveReceiptRuleSetResponse>
      describeActiveReceiptRuleSet() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeActiveReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeActiveReceiptRuleSetRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeActiveReceiptRuleSetResult',
    );
    return DescribeActiveReceiptRuleSetResponse.fromXml($result);
  }

  /// Returns the details of the specified configuration set. For information
  /// about using configuration sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
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
    @_s.required String configurationSetName,
    List<ConfigurationSetAttribute> configurationSetAttributeNames,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    configurationSetAttributeNames?.also((arg) =>
        $request['ConfigurationSetAttributeNames'] =
            arg.map((e) => e?.toValue() ?? '').toList());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeConfigurationSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeConfigurationSetRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeConfigurationSetResult',
    );
    return DescribeConfigurationSetResponse.fromXml($result);
  }

  /// Returns the details of the specified receipt rule.
  ///
  /// For information about setting up receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon
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
    @_s.required String ruleName,
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['RuleName'] = ruleName;
    $request['RuleSetName'] = ruleSetName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReceiptRuleRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeReceiptRuleResult',
    );
    return DescribeReceiptRuleResponse.fromXml($result);
  }

  /// Returns the details of the specified receipt rule set.
  ///
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set to describe.
  Future<DescribeReceiptRuleSetResponse> describeReceiptRuleSet({
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['RuleSetName'] = ruleSetName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReceiptRuleSetRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeReceiptRuleSetResult',
    );
    return DescribeReceiptRuleSetResponse.fromXml($result);
  }

  /// Returns the email sending status of the Amazon SES account for the current
  /// region.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetAccountSendingEnabledResponse> getAccountSendingEnabled() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetAccountSendingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'GetAccountSendingEnabledResult',
    );
    return GetAccountSendingEnabledResponse.fromXml($result);
  }

  /// Returns the custom email verification template for the template name you
  /// specify.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [CustomVerificationEmailTemplateDoesNotExistException].
  ///
  /// Parameter [templateName] :
  /// The name of the custom verification email template that you want to
  /// retrieve.
  Future<GetCustomVerificationEmailTemplateResponse>
      getCustomVerificationEmailTemplate({
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    final $request = <String, dynamic>{};
    $request['TemplateName'] = templateName;
    final $result = await _protocol.send(
      $request,
      action: 'GetCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetCustomVerificationEmailTemplateRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [identities] :
  /// A list of one or more verified identities - email addresses, domains, or
  /// both.
  Future<GetIdentityDkimAttributesResponse> getIdentityDkimAttributes({
    @_s.required List<String> identities,
  }) async {
    ArgumentError.checkNotNull(identities, 'identities');
    final $request = <String, dynamic>{};
    $request['Identities'] = identities;
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityDkimAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetIdentityDkimAttributesRequest'],
      shapes: shapes,
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
    @_s.required List<String> identities,
  }) async {
    ArgumentError.checkNotNull(identities, 'identities');
    final $request = <String, dynamic>{};
    $request['Identities'] = identities;
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityMailFromDomainAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetIdentityMailFromDomainAttributesRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [identities] :
  /// A list of one or more identities. You can specify an identity by using its
  /// name or by using its Amazon Resource Name (ARN). Examples:
  /// <code>user@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  Future<GetIdentityNotificationAttributesResponse>
      getIdentityNotificationAttributes({
    @_s.required List<String> identities,
  }) async {
    ArgumentError.checkNotNull(identities, 'identities');
    final $request = <String, dynamic>{};
    $request['Identities'] = identities;
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityNotificationAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetIdentityNotificationAttributesRequest'],
      shapes: shapes,
      resultWrapper: 'GetIdentityNotificationAttributesResult',
    );
    return GetIdentityNotificationAttributesResponse.fromXml($result);
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
  /// Parameter [identity] :
  /// The identity for which the policies will be retrieved. You can specify an
  /// identity by using its name or by using its Amazon Resource Name (ARN).
  /// Examples: <code>user@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this API, you must own the identity.
  ///
  /// Parameter [policyNames] :
  /// A list of the names of policies to be retrieved. You can retrieve a
  /// maximum of 20 policies at a time. If you do not know the names of the
  /// policies that are attached to the identity, you can use
  /// <code>ListIdentityPolicies</code>.
  Future<GetIdentityPoliciesResponse> getIdentityPolicies({
    @_s.required String identity,
    @_s.required List<String> policyNames,
  }) async {
    ArgumentError.checkNotNull(identity, 'identity');
    ArgumentError.checkNotNull(policyNames, 'policyNames');
    final $request = <String, dynamic>{};
    $request['Identity'] = identity;
    $request['PolicyNames'] = policyNames;
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityPolicies',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetIdentityPoliciesRequest'],
      shapes: shapes,
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
  /// status changes to "Failed." In that case, if you still want to verify the
  /// email address, you must restart the verification process from the
  /// beginning.
  ///
  /// For domain identities, the domain's verification status is "Pending" as
  /// Amazon SES searches for the required TXT record in the DNS settings of the
  /// domain. When Amazon SES detects the record, the domain's verification
  /// status changes to "Success". If Amazon SES is unable to detect the record
  /// within 72 hours, the domain's verification status changes to "Failed." In
  /// that case, if you still want to verify the domain, you must restart the
  /// verification process from the beginning.
  ///
  /// This operation is throttled at one request per second and can only get
  /// verification attributes for up to 100 identities at a time.
  ///
  /// Parameter [identities] :
  /// A list of identities.
  Future<GetIdentityVerificationAttributesResponse>
      getIdentityVerificationAttributes({
    @_s.required List<String> identities,
  }) async {
    ArgumentError.checkNotNull(identities, 'identities');
    final $request = <String, dynamic>{};
    $request['Identities'] = identities;
    final $result = await _protocol.send(
      $request,
      action: 'GetIdentityVerificationAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetIdentityVerificationAttributesRequest'],
      shapes: shapes,
      resultWrapper: 'GetIdentityVerificationAttributesResult',
    );
    return GetIdentityVerificationAttributesResponse.fromXml($result);
  }

  /// Provides the sending limits for the Amazon SES account.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetSendQuotaResponse> getSendQuota() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetSendQuota',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'GetSendQuotaResult',
    );
    return GetSendQuotaResponse.fromXml($result);
  }

  /// Provides sending statistics for the current AWS Region. The result is a
  /// list of data points, representing the last two weeks of sending activity.
  /// Each data point in the list contains statistics for a 15-minute period of
  /// time.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetSendStatisticsResponse> getSendStatistics() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetSendStatistics',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
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
  /// The name of the template you want to retrieve.
  Future<GetTemplateResponse> getTemplate({
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    final $request = <String, dynamic>{};
    $request['TemplateName'] = templateName;
    final $result = await _protocol.send(
      $request,
      action: 'GetTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetTemplateRequest'],
      shapes: shapes,
      resultWrapper: 'GetTemplateResult',
    );
    return GetTemplateResponse.fromXml($result);
  }

  /// Provides a list of the configuration sets associated with your Amazon SES
  /// account in the current AWS Region. For information about using
  /// configuration sets, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Monitoring
  /// Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer
  /// Guide.</i>
  ///
  /// You can execute this operation no more than once per second. This
  /// operation will return up to 1,000 configuration sets each time it is run.
  /// If your Amazon SES account has more than 1,000 configuration sets, this
  /// operation will also return a NextToken element. You can then execute the
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
    int maxItems,
    String nextToken,
  }) async {
    final $request = <String, dynamic>{};
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListConfigurationSets',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListConfigurationSetsRequest'],
      shapes: shapes,
      resultWrapper: 'ListConfigurationSetsResult',
    );
    return ListConfigurationSetsResponse.fromXml($result);
  }

  /// Lists the existing custom verification email templates for your account in
  /// the current AWS Region.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using
  /// Custom Verification Email Templates</a> in the <i>Amazon SES Developer
  /// Guide</i>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom verification email templates to return. This
  /// value must be at least 1 and less than or equal to 50. If you do not
  /// specify a value, or if you specify a value less than 1 or greater than 50,
  /// the operation will return up to 50 results.
  ///
  /// Parameter [nextToken] :
  /// An array the contains the name and creation time stamp for each template
  /// in your Amazon SES account.
  Future<ListCustomVerificationEmailTemplatesResponse>
      listCustomVerificationEmailTemplates({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListCustomVerificationEmailTemplates',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListCustomVerificationEmailTemplatesRequest'],
      shapes: shapes,
      resultWrapper: 'ListCustomVerificationEmailTemplatesResult',
    );
    return ListCustomVerificationEmailTemplatesResponse.fromXml($result);
  }

  /// Returns a list containing all of the identities (email addresses and
  /// domains) for your AWS account in the current AWS Region, regardless of
  /// verification status.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identityType] :
  /// The type of the identities to list. Possible values are "EmailAddress" and
  /// "Domain". If this parameter is omitted, then all identities will be
  /// listed.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of identities per page. Possible values are 1-1000
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// The token to use for pagination.
  Future<ListIdentitiesResponse> listIdentities({
    IdentityType identityType,
    int maxItems,
    String nextToken,
  }) async {
    final $request = <String, dynamic>{};
    identityType?.also((arg) => $request['IdentityType'] = arg.toValue());
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListIdentities',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListIdentitiesRequest'],
      shapes: shapes,
      resultWrapper: 'ListIdentitiesResult',
    );
    return ListIdentitiesResponse.fromXml($result);
  }

  /// Returns a list of sending authorization policies that are attached to the
  /// given identity (an email address or a domain). This API returns only a
  /// list. If you want the actual policy content, you can use
  /// <code>GetIdentityPolicies</code>.
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
  /// Parameter [identity] :
  /// The identity that is associated with the policy for which the policies
  /// will be listed. You can specify an identity by using its name or by using
  /// its Amazon Resource Name (ARN). Examples: <code>user@example.com</code>,
  /// <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this API, you must own the identity.
  Future<ListIdentityPoliciesResponse> listIdentityPolicies({
    @_s.required String identity,
  }) async {
    ArgumentError.checkNotNull(identity, 'identity');
    final $request = <String, dynamic>{};
    $request['Identity'] = identity;
    final $result = await _protocol.send(
      $request,
      action: 'ListIdentityPolicies',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListIdentityPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListIdentityPoliciesResult',
    );
    return ListIdentityPoliciesResponse.fromXml($result);
  }

  /// Lists the IP address filters associated with your AWS account in the
  /// current AWS Region.
  ///
  /// For information about managing IP address filters, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  Future<ListReceiptFiltersResponse> listReceiptFilters() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListReceiptFilters',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListReceiptFiltersRequest'],
      shapes: shapes,
      resultWrapper: 'ListReceiptFiltersResult',
    );
    return ListReceiptFiltersResponse.fromXml($result);
  }

  /// Lists the receipt rule sets that exist under your AWS account in the
  /// current AWS Region. If there are additional receipt rule sets to be
  /// retrieved, you will receive a <code>NextToken</code> that you can provide
  /// to the next call to <code>ListReceiptRuleSets</code> to retrieve the
  /// additional entries.
  ///
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListReceiptRuleSets</code>
  /// to indicate the position in the receipt rule set list.
  Future<ListReceiptRuleSetsResponse> listReceiptRuleSets({
    String nextToken,
  }) async {
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListReceiptRuleSets',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListReceiptRuleSetsRequest'],
      shapes: shapes,
      resultWrapper: 'ListReceiptRuleSetsResult',
    );
    return ListReceiptRuleSetsResponse.fromXml($result);
  }

  /// Lists the email templates present in your Amazon SES account in the
  /// current AWS Region.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of templates to return. This value must be at least 1
  /// and less than or equal to 10. If you do not specify a value, or if you
  /// specify a value less than 1 or greater than 10, the operation will return
  /// up to 10 results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to <code>ListTemplates</code> to
  /// indicate the position in the list of email templates.
  Future<ListTemplatesResponse> listTemplates({
    int maxItems,
    String nextToken,
  }) async {
    final $request = <String, dynamic>{};
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListTemplates',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTemplatesRequest'],
      shapes: shapes,
      resultWrapper: 'ListTemplatesResult',
    );
    return ListTemplatesResponse.fromXml($result);
  }

  /// Deprecated. Use the <code>ListIdentities</code> operation to list the
  /// email addresses and domains associated with your account.
  Future<ListVerifiedEmailAddressesResponse>
      listVerifiedEmailAddresses() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListVerifiedEmailAddresses',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
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
  /// The name of the configuration set that you want to specify the delivery
  /// options for.
  ///
  /// Parameter [deliveryOptions] :
  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS).
  Future<void> putConfigurationSetDeliveryOptions({
    @_s.required String configurationSetName,
    DeliveryOptions deliveryOptions,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    deliveryOptions?.also((arg) => $request['DeliveryOptions'] = arg);
    await _protocol.send(
      $request,
      action: 'PutConfigurationSetDeliveryOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutConfigurationSetDeliveryOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'PutConfigurationSetDeliveryOptionsResult',
    );
  }

  /// Adds or updates a sending authorization policy for the specified identity
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
  /// May throw [InvalidPolicyException].
  ///
  /// Parameter [identity] :
  /// The identity that the policy will apply to. You can specify an identity by
  /// using its name or by using its Amazon Resource Name (ARN). Examples:
  /// <code>user@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// To successfully call this API, you must own the identity.
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
  Future<void> putIdentityPolicy({
    @_s.required String identity,
    @_s.required String policy,
    @_s.required String policyName,
  }) async {
    ArgumentError.checkNotNull(identity, 'identity');
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
    final $request = <String, dynamic>{};
    $request['Identity'] = identity;
    $request['Policy'] = policy;
    $request['PolicyName'] = policyName;
    await _protocol.send(
      $request,
      action: 'PutIdentityPolicy',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutIdentityPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'PutIdentityPolicyResult',
    );
  }

  /// Reorders the receipt rules within a receipt rule set.
  /// <note>
  /// All of the rules in the rule set must be represented in this request. That
  /// is, this API will return an error if the reorder request doesn't
  /// explicitly position all of the rules.
  /// </note>
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [RuleSetDoesNotExistException].
  /// May throw [RuleDoesNotExistException].
  ///
  /// Parameter [ruleNames] :
  /// A list of the specified receipt rule set's receipt rules in the order that
  /// you want to put them.
  ///
  /// Parameter [ruleSetName] :
  /// The name of the receipt rule set to reorder.
  Future<void> reorderReceiptRuleSet({
    @_s.required List<String> ruleNames,
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(ruleNames, 'ruleNames');
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['RuleNames'] = ruleNames;
    $request['RuleSetName'] = ruleSetName;
    await _protocol.send(
      $request,
      action: 'ReorderReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ReorderReceiptRuleSetRequest'],
      shapes: shapes,
      resultWrapper: 'ReorderReceiptRuleSetResult',
    );
  }

  /// Generates and sends a bounce message to the sender of an email you
  /// received through Amazon SES. You can only use this API on an email up to
  /// 24 hours after you receive it.
  /// <note>
  /// You cannot use this API to send generic bounces for mail that was not
  /// received by Amazon SES.
  /// </note>
  /// For information about receiving email through Amazon SES, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [explanation] :
  /// Human-readable text for the bounce message to explain the failure. If not
  /// specified, the text will be auto-generated based on the bounced recipient
  /// information.
  ///
  /// Parameter [messageDsn] :
  /// Message-related DSN fields. If not specified, Amazon SES will choose the
  /// values.
  Future<SendBounceResponse> sendBounce({
    @_s.required String bounceSender,
    @_s.required List<BouncedRecipientInfo> bouncedRecipientInfoList,
    @_s.required String originalMessageId,
    String bounceSenderArn,
    String explanation,
    MessageDsn messageDsn,
  }) async {
    ArgumentError.checkNotNull(bounceSender, 'bounceSender');
    ArgumentError.checkNotNull(
        bouncedRecipientInfoList, 'bouncedRecipientInfoList');
    ArgumentError.checkNotNull(originalMessageId, 'originalMessageId');
    final $request = <String, dynamic>{};
    $request['BounceSender'] = bounceSender;
    $request['BouncedRecipientInfoList'] = bouncedRecipientInfoList;
    $request['OriginalMessageId'] = originalMessageId;
    bounceSenderArn?.also((arg) => $request['BounceSenderArn'] = arg);
    explanation?.also((arg) => $request['Explanation'] = arg);
    messageDsn?.also((arg) => $request['MessageDsn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SendBounce',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SendBounceRequest'],
      shapes: shapes,
      resultWrapper: 'SendBounceResult',
    );
    return SendBounceResponse.fromXml($result);
  }

  /// Composes an email message to multiple destinations. The message body is
  /// created using an email template.
  ///
  /// In order to send email using the <code>SendBulkTemplatedEmail</code>
  /// operation, your call to the API must meet the following requirements:
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying
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
  /// <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message
  /// will be rejected, even if the message contains other recipients that are
  /// valid.
  /// </li>
  /// <li>
  /// The message may not include more than 50 recipients, across the To:, CC:
  /// and BCC: fields. If you need to send an email message to a larger
  /// audience, you can divide your recipient list into groups of 50 or fewer,
  /// and then call the <code>SendBulkTemplatedEmail</code> operation several
  /// times to send the message to each group.
  /// </li>
  /// <li>
  /// The number of destinations you can contact in a single call to the API may
  /// be limited by your account's maximum sending rate.
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
  /// Parameter [destinations] :
  /// One or more <code>Destination</code> objects. All of the recipients in a
  /// <code>Destination</code> will receive the same version of the email. You
  /// can specify up to 50 <code>Destination</code> objects within a
  /// <code>Destinations</code> array.
  ///
  /// Parameter [source] :
  /// The email address that is sending the email. This email address must be
  /// either individually verified with Amazon SES, or from a domain that has
  /// been verified with Amazon SES. For information about verifying identities,
  /// see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// <code>SourceArn</code> parameter. For more information about sending
  /// authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in <a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason,
  /// the <i>local part</i> of a source email address (the part of the email
  /// address that precedes the @ sign) may only contain <a
  /// href="https://en.wikipedia.org/wiki/Email_address#Local-part">7-bit ASCII
  /// characters</a>. If the <i>domain part</i> of an address (the part after
  /// the @ sign) contains non-ASCII characters, they must be encoded using
  /// Punycode, as described in <a
  /// href="https://tools.ietf.org/html/rfc3492.html">RFC3492</a>. The sender
  /// name (also known as the <i>friendly name</i>) may contain non-ASCII
  /// characters. These characters must be encoded using MIME encoded-word
  /// syntax, as described in <a href="https://tools.ietf.org/html/rfc2047">RFC
  /// 2047</a>. MIME encoded-word syntax uses the following form:
  /// <code>=?charset?encoding?encoded-text?=</code>.
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
  /// Parameter [defaultTemplateData] :
  /// A list of replacement values to apply to the template when replacement
  /// data is not specified in a Destination object. These values act as a
  /// default or fallback option when no other data is available.
  ///
  /// The template data is a JSON object, typically consisting of key-value
  /// pairs in which the keys correspond to replacement tags in the email
  /// template.
  ///
  /// Parameter [replyToAddresses] :
  /// The reply-to email address(es) for the message. If the recipient replies
  /// to the message, each reply-to address will receive the reply.
  ///
  /// Parameter [returnPath] :
  /// The email address that bounces and complaints will be forwarded to when
  /// feedback forwarding is enabled. If the message cannot be delivered to the
  /// recipient, then an error message will be returned from the recipient's
  /// ISP; this message will then be forwarded to the email address specified by
  /// the <code>ReturnPath</code> parameter. The <code>ReturnPath</code>
  /// parameter is never overwritten. This email address must be either
  /// individually verified with Amazon SES, or from a domain that has been
  /// verified with Amazon SES.
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [templateArn] :
  /// The ARN of the template to use when sending this email.
  Future<SendBulkTemplatedEmailResponse> sendBulkTemplatedEmail({
    @_s.required List<BulkEmailDestination> destinations,
    @_s.required String source,
    @_s.required String template,
    String configurationSetName,
    List<MessageTag> defaultTags,
    String defaultTemplateData,
    List<String> replyToAddresses,
    String returnPath,
    String returnPathArn,
    String sourceArn,
    String templateArn,
  }) async {
    ArgumentError.checkNotNull(destinations, 'destinations');
    ArgumentError.checkNotNull(source, 'source');
    ArgumentError.checkNotNull(template, 'template');
    _s.validateStringLength(
      'defaultTemplateData',
      defaultTemplateData,
      0,
      262144,
    );
    final $request = <String, dynamic>{};
    $request['Destinations'] = destinations;
    $request['Source'] = source;
    $request['Template'] = template;
    configurationSetName?.also((arg) => $request['ConfigurationSetName'] = arg);
    defaultTags?.also((arg) => $request['DefaultTags'] = arg);
    defaultTemplateData?.also((arg) => $request['DefaultTemplateData'] = arg);
    replyToAddresses?.also((arg) => $request['ReplyToAddresses'] = arg);
    returnPath?.also((arg) => $request['ReturnPath'] = arg);
    returnPathArn?.also((arg) => $request['ReturnPathArn'] = arg);
    sourceArn?.also((arg) => $request['SourceArn'] = arg);
    templateArn?.also((arg) => $request['TemplateArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SendBulkTemplatedEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SendBulkTemplatedEmailRequest'],
      shapes: shapes,
      resultWrapper: 'SendBulkTemplatedEmailResult',
    );
    return SendBulkTemplatedEmailResponse.fromXml($result);
  }

  /// Adds an email address to the list of identities for your Amazon SES
  /// account in the current AWS Region and attempts to verify it. As a result
  /// of executing this operation, a customized verification email is sent to
  /// the specified address.
  ///
  /// To use this operation, you must first create a custom verification email
  /// template. For more information about creating and using custom
  /// verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using
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
    @_s.required String emailAddress,
    @_s.required String templateName,
    String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    ArgumentError.checkNotNull(templateName, 'templateName');
    final $request = <String, dynamic>{};
    $request['EmailAddress'] = emailAddress;
    $request['TemplateName'] = templateName;
    configurationSetName?.also((arg) => $request['ConfigurationSetName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SendCustomVerificationEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SendCustomVerificationEmailRequest'],
      shapes: shapes,
      resultWrapper: 'SendCustomVerificationEmailResult',
    );
    return SendCustomVerificationEmailResponse.fromXml($result);
  }

  /// Composes an email message and immediately queues it for sending. In order
  /// to send email using the <code>SendEmail</code> operation, your message
  /// must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// The message must be sent from a verified email address or domain. If you
  /// attempt to send email using a non-verified address or domain, the
  /// operation will result in an "Email address not verified" error.
  /// </li>
  /// <li>
  /// If your account is still in the Amazon SES sandbox, you may only send to
  /// verified addresses or domains, or to email addresses associated with the
  /// Amazon SES Mailbox Simulator. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying
  /// Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i>
  /// </li>
  /// <li>
  /// The maximum message size is 10 MB.
  /// </li>
  /// <li>
  /// The message must include at least one recipient email address. The
  /// recipient address can be a To: address, a CC: address, or a BCC: address.
  /// If a recipient email address is invalid (that is, it is not in the format
  /// <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message
  /// will be rejected, even if the message contains other recipients that are
  /// valid.
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Managing
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// <code>SourceArn</code> parameter. For more information about sending
  /// authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in <a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason,
  /// the <i>local part</i> of a source email address (the part of the email
  /// address that precedes the @ sign) may only contain <a
  /// href="https://en.wikipedia.org/wiki/Email_address#Local-part">7-bit ASCII
  /// characters</a>. If the <i>domain part</i> of an address (the part after
  /// the @ sign) contains non-ASCII characters, they must be encoded using
  /// Punycode, as described in <a
  /// href="https://tools.ietf.org/html/rfc3492.html">RFC3492</a>. The sender
  /// name (also known as the <i>friendly name</i>) may contain non-ASCII
  /// characters. These characters must be encoded using MIME encoded-word
  /// syntax, as described in <a href="https://tools.ietf.org/html/rfc2047">RFC
  /// 2047</a>. MIME encoded-word syntax uses the following form:
  /// <code>=?charset?encoding?encoded-text?=</code>.
  /// </note>
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use when you send an email using
  /// <code>SendEmail</code>.
  ///
  /// Parameter [replyToAddresses] :
  /// The reply-to email address(es) for the message. If the recipient replies
  /// to the message, each reply-to address will receive the reply.
  ///
  /// Parameter [returnPath] :
  /// The email address that bounces and complaints will be forwarded to when
  /// feedback forwarding is enabled. If the message cannot be delivered to the
  /// recipient, then an error message will be returned from the recipient's
  /// ISP; this message will then be forwarded to the email address specified by
  /// the <code>ReturnPath</code> parameter. The <code>ReturnPath</code>
  /// parameter is never overwritten. This email address must be either
  /// individually verified with Amazon SES, or from a domain that has been
  /// verified with Amazon SES.
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [tags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using <code>SendEmail</code>. Tags correspond to characteristics
  /// of the email that you define, so that you can publish email sending
  /// events.
  Future<SendEmailResponse> sendEmail({
    @_s.required Destination destination,
    @_s.required Message message,
    @_s.required String source,
    String configurationSetName,
    List<String> replyToAddresses,
    String returnPath,
    String returnPathArn,
    String sourceArn,
    List<MessageTag> tags,
  }) async {
    ArgumentError.checkNotNull(destination, 'destination');
    ArgumentError.checkNotNull(message, 'message');
    ArgumentError.checkNotNull(source, 'source');
    final $request = <String, dynamic>{};
    $request['Destination'] = destination;
    $request['Message'] = message;
    $request['Source'] = source;
    configurationSetName?.also((arg) => $request['ConfigurationSetName'] = arg);
    replyToAddresses?.also((arg) => $request['ReplyToAddresses'] = arg);
    returnPath?.also((arg) => $request['ReturnPath'] = arg);
    returnPathArn?.also((arg) => $request['ReturnPathArn'] = arg);
    sourceArn?.also((arg) => $request['SourceArn'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SendEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SendEmailRequest'],
      shapes: shapes,
      resultWrapper: 'SendEmailResult',
    );
    return SendEmailResponse.fromXml($result);
  }

  /// Composes an email message and immediately queues it for sending.
  ///
  /// This operation is more flexible than the <code>SendEmail</code> API
  /// operation. When you use the <code>SendRawEmail</code> operation, you can
  /// specify the headers of the message as well as its content. This
  /// flexibility is useful, for example, when you want to send a multipart MIME
  /// email (such a message that contains both a text and an HTML version). You
  /// can also use this operation to send messages that include attachments.
  ///
  /// The <code>SendRawEmail</code> operation has the following requirements:
  ///
  /// <ul>
  /// <li>
  /// You can only send email from <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">verified
  /// email addresses or domains</a>. If you try to send email from an address
  /// that isn't verified, the operation results in an "Email address not
  /// verified" error.
  /// </li>
  /// <li>
  /// If your account is still in the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/request-production-access.html">Amazon
  /// SES sandbox</a>, you can only send email to other verified addresses in
  /// your account, or to addresses that are associated with the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mailbox-simulator.html">Amazon
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html#send-email-mime-encoding">MIME
  /// Encoding</a> in the <i>Amazon SES Developer Guide</i>.
  /// </li>
  /// </ul>
  /// Additionally, keep the following considerations in mind when using the
  /// <code>SendRawEmail</code> operation:
  ///
  /// <ul>
  /// <li>
  /// Although you can customize the message headers when using the
  /// <code>SendRawEmail</code> operation, Amazon SES will automatically apply
  /// its own <code>Message-ID</code> and <code>Date</code> headers; if you
  /// passed these headers when creating the message, they will be overwritten
  /// by the values that Amazon SES provides.
  /// </li>
  /// <li>
  /// If you are using sending authorization to send on behalf of another user,
  /// <code>SendRawEmail</code> enables you to specify the cross-account
  /// identity for the email's Source, From, and Return-Path parameters in one
  /// of two ways: you can pass optional parameters <code>SourceArn</code>,
  /// <code>FromArn</code>, and/or <code>ReturnPathArn</code> to the API, or you
  /// can include the following X-headers in the header of your raw email:
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Using
  /// Sending Authorization with Amazon SES</a> in the <i>Amazon SES Developer
  /// Guide.</i>
  /// </li>
  /// <li>
  /// For every message that you send, the total number of recipients (including
  /// each recipient in the To:, CC: and BCC: fields) is counted against the
  /// maximum number of emails you can send in a 24-hour period (your <i>sending
  /// quota</i>). For more information about sending quotas in Amazon SES, see
  /// <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Managing
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mime-types.html">Unsupported
  /// Attachment Types</a> in the <i>Amazon SES Developer Guide</i>.
  /// </li>
  /// <li>
  /// The entire message must be base64-encoded.
  /// </li>
  /// <li>
  /// If any of the MIME parts in your message contain content that is outside
  /// of the 7-bit ASCII character range, we highly recommend that you encode
  /// that content. For more information, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html">Sending
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html">Amazon
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html">Amazon
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
  /// the <i>local part</i> of a source email address (the part of the email
  /// address that precedes the @ sign) may only contain <a
  /// href="https://en.wikipedia.org/wiki/Email_address#Local-part">7-bit ASCII
  /// characters</a>. If the <i>domain part</i> of an address (the part after
  /// the @ sign) contains non-ASCII characters, they must be encoded using
  /// Punycode, as described in <a
  /// href="https://tools.ietf.org/html/rfc3492.html">RFC3492</a>. The sender
  /// name (also known as the <i>friendly name</i>) may contain non-ASCII
  /// characters. These characters must be encoded using MIME encoded-word
  /// syntax, as described in <a href="https://tools.ietf.org/html/rfc2047">RFC
  /// 2047</a>. MIME encoded-word syntax uses the following form:
  /// <code>=?charset?encoding?encoded-text?=</code>.
  /// </note>
  /// If you specify the <code>Source</code> parameter and have feedback
  /// forwarding enabled, then bounces and complaints will be sent to this email
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html">Amazon
  /// SES Developer Guide</a>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using <code>SendRawEmail</code>. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  Future<SendRawEmailResponse> sendRawEmail({
    @_s.required RawMessage rawMessage,
    String configurationSetName,
    List<String> destinations,
    String fromArn,
    String returnPathArn,
    String source,
    String sourceArn,
    List<MessageTag> tags,
  }) async {
    ArgumentError.checkNotNull(rawMessage, 'rawMessage');
    final $request = <String, dynamic>{};
    $request['RawMessage'] = rawMessage;
    configurationSetName?.also((arg) => $request['ConfigurationSetName'] = arg);
    destinations?.also((arg) => $request['Destinations'] = arg);
    fromArn?.also((arg) => $request['FromArn'] = arg);
    returnPathArn?.also((arg) => $request['ReturnPathArn'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    sourceArn?.also((arg) => $request['SourceArn'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SendRawEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SendRawEmailRequest'],
      shapes: shapes,
      resultWrapper: 'SendRawEmailResult',
    );
    return SendRawEmailResponse.fromXml($result);
  }

  /// Composes an email message using an email template and immediately queues
  /// it for sending.
  ///
  /// In order to send email using the <code>SendTemplatedEmail</code>
  /// operation, your call to the API must meet the following requirements:
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying
  /// Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i>
  /// </li>
  /// <li>
  /// The maximum message size is 10 MB.
  /// </li>
  /// <li>
  /// Calls to the <code>SendTemplatedEmail</code> operation may only include
  /// one <code>Destination</code> parameter. A destination is a set of
  /// recipients who will receive the same version of the email. The
  /// <code>Destination</code> parameter can include up to 50 recipients, across
  /// the To:, CC: and BCC: fields.
  /// </li>
  /// <li>
  /// The <code>Destination</code> parameter must include at least one recipient
  /// email address. The recipient address can be a To: address, a CC: address,
  /// or a BCC: address. If a recipient email address is invalid (that is, it is
  /// not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the
  /// entire message will be rejected, even if the message contains other
  /// recipients that are valid.
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Sending
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// <code>SourceArn</code> parameter. For more information about sending
  /// authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  /// <note>
  /// Amazon SES does not support the SMTPUTF8 extension, as described in <a
  /// href="https://tools.ietf.org/html/rfc6531">RFC6531</a>. For this reason,
  /// the <i>local part</i> of a source email address (the part of the email
  /// address that precedes the @ sign) may only contain <a
  /// href="https://en.wikipedia.org/wiki/Email_address#Local-part">7-bit ASCII
  /// characters</a>. If the <i>domain part</i> of an address (the part after
  /// the @ sign) contains non-ASCII characters, they must be encoded using
  /// Punycode, as described in <a
  /// href="https://tools.ietf.org/html/rfc3492.html">RFC3492</a>. The sender
  /// name (also known as the <i>friendly name</i>) may contain non-ASCII
  /// characters. These characters must be encoded using MIME encoded-word
  /// syntax, as described in<a href="https://tools.ietf.org/html/rfc2047">RFC
  /// 2047</a>. MIME encoded-word syntax uses the following form:
  /// <code>=?charset?encoding?encoded-text?=</code>.
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
  /// to the message, each reply-to address will receive the reply.
  ///
  /// Parameter [returnPath] :
  /// The email address that bounces and complaints will be forwarded to when
  /// feedback forwarding is enabled. If the message cannot be delivered to the
  /// recipient, then an error message will be returned from the recipient's
  /// ISP; this message will then be forwarded to the email address specified by
  /// the <code>ReturnPath</code> parameter. The <code>ReturnPath</code>
  /// parameter is never overwritten. This email address must be either
  /// individually verified with Amazon SES, or from a domain that has been
  /// verified with Amazon SES.
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
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
    @_s.required Destination destination,
    @_s.required String source,
    @_s.required String template,
    @_s.required String templateData,
    String configurationSetName,
    List<String> replyToAddresses,
    String returnPath,
    String returnPathArn,
    String sourceArn,
    List<MessageTag> tags,
    String templateArn,
  }) async {
    ArgumentError.checkNotNull(destination, 'destination');
    ArgumentError.checkNotNull(source, 'source');
    ArgumentError.checkNotNull(template, 'template');
    ArgumentError.checkNotNull(templateData, 'templateData');
    _s.validateStringLength(
      'templateData',
      templateData,
      0,
      262144,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Destination'] = destination;
    $request['Source'] = source;
    $request['Template'] = template;
    $request['TemplateData'] = templateData;
    configurationSetName?.also((arg) => $request['ConfigurationSetName'] = arg);
    replyToAddresses?.also((arg) => $request['ReplyToAddresses'] = arg);
    returnPath?.also((arg) => $request['ReturnPath'] = arg);
    returnPathArn?.also((arg) => $request['ReturnPathArn'] = arg);
    sourceArn?.also((arg) => $request['SourceArn'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    templateArn?.also((arg) => $request['TemplateArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SendTemplatedEmail',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SendTemplatedEmailRequest'],
      shapes: shapes,
      resultWrapper: 'SendTemplatedEmailResult',
    );
    return SendTemplatedEmailResponse.fromXml($result);
  }

  /// Sets the specified receipt rule set as the active receipt rule set.
  /// <note>
  /// To disable your email-receiving through Amazon SES completely, you can
  /// call this API with RuleSetName set to null.
  /// </note>
  /// For information about managing receipt rule sets, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon
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
    String ruleSetName,
  }) async {
    final $request = <String, dynamic>{};
    ruleSetName?.also((arg) => $request['RuleSetName'] = arg);
    await _protocol.send(
      $request,
      action: 'SetActiveReceiptRuleSet',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetActiveReceiptRuleSetRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon
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
    @_s.required bool dkimEnabled,
    @_s.required String identity,
  }) async {
    ArgumentError.checkNotNull(dkimEnabled, 'dkimEnabled');
    ArgumentError.checkNotNull(identity, 'identity');
    final $request = <String, dynamic>{};
    $request['DkimEnabled'] = dkimEnabled;
    $request['Identity'] = identity;
    await _protocol.send(
      $request,
      action: 'SetIdentityDkimEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetIdentityDkimEnabledRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [forwardingEnabled] :
  /// Sets whether Amazon SES will forward bounce and complaint notifications as
  /// email. <code>true</code> specifies that Amazon SES will forward bounce and
  /// complaint notifications as email, in addition to any Amazon SNS topic
  /// publishing otherwise specified. <code>false</code> specifies that Amazon
  /// SES will publish bounce and complaint notifications only through Amazon
  /// SNS. This value can only be set to <code>false</code> when Amazon SNS
  /// topics are set for both <code>Bounce</code> and <code>Complaint</code>
  /// notification types.
  ///
  /// Parameter [identity] :
  /// The identity for which to set bounce and complaint notification
  /// forwarding. Examples: <code>user@example.com</code>,
  /// <code>example.com</code>.
  Future<void> setIdentityFeedbackForwardingEnabled({
    @_s.required bool forwardingEnabled,
    @_s.required String identity,
  }) async {
    ArgumentError.checkNotNull(forwardingEnabled, 'forwardingEnabled');
    ArgumentError.checkNotNull(identity, 'identity');
    final $request = <String, dynamic>{};
    $request['ForwardingEnabled'] = forwardingEnabled;
    $request['Identity'] = identity;
    await _protocol.send(
      $request,
      action: 'SetIdentityFeedbackForwardingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetIdentityFeedbackForwardingEnabledRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [enabled] :
  /// Sets whether Amazon SES includes the original email headers in Amazon SNS
  /// notifications of the specified notification type. A value of
  /// <code>true</code> specifies that Amazon SES will include headers in
  /// notifications, and a value of <code>false</code> specifies that Amazon SES
  /// will not include headers in notifications.
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
    @_s.required bool enabled,
    @_s.required String identity,
    @_s.required NotificationType notificationType,
  }) async {
    ArgumentError.checkNotNull(enabled, 'enabled');
    ArgumentError.checkNotNull(identity, 'identity');
    ArgumentError.checkNotNull(notificationType, 'notificationType');
    final $request = <String, dynamic>{};
    $request['Enabled'] = enabled;
    $request['Identity'] = identity;
    $request['NotificationType'] = notificationType.toValue();
    await _protocol.send(
      $request,
      action: 'SetIdentityHeadersInNotificationsEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetIdentityHeadersInNotificationsEnabledRequest'],
      shapes: shapes,
      resultWrapper: 'SetIdentityHeadersInNotificationsEnabledResult',
    );
  }

  /// Enables or disables the custom MAIL FROM domain setup for a verified
  /// identity (an email address or a domain).
  /// <important>
  /// To send emails using the specified MAIL FROM domain, you must add an MX
  /// record to your MAIL FROM domain's DNS settings. If you want your emails to
  /// pass Sender Policy Framework (SPF) checks, you must also add or update an
  /// SPF record. For more information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-set.html">Amazon
  /// SES Developer Guide</a>.
  /// </important>
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [identity] :
  /// The verified identity for which you want to enable or disable the
  /// specified custom MAIL FROM domain.
  ///
  /// Parameter [behaviorOnMXFailure] :
  /// The action that you want Amazon SES to take if it cannot successfully read
  /// the required MX record when you send an email. If you choose
  /// <code>UseDefaultValue</code>, Amazon SES will use amazonses.com (or a
  /// subdomain of that) as the MAIL FROM domain. If you choose
  /// <code>RejectMessage</code>, Amazon SES will return a
  /// <code>MailFromDomainNotVerified</code> error and not send the email.
  ///
  /// The action specified in <code>BehaviorOnMXFailure</code> is taken when the
  /// custom MAIL FROM domain setup is in the <code>Pending</code>,
  /// <code>Failed</code>, and <code>TemporaryFailure</code> states.
  ///
  /// Parameter [mailFromDomain] :
  /// The custom MAIL FROM domain that you want the verified identity to use.
  /// The MAIL FROM domain must 1) be a subdomain of the verified identity, 2)
  /// not be used in a "From" address if the MAIL FROM domain is the destination
  /// of email feedback forwarding (for more information, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from.html">Amazon
  /// SES Developer Guide</a>), and 3) not be used to receive emails. A value of
  /// <code>null</code> disables the custom MAIL FROM setting for the identity.
  Future<void> setIdentityMailFromDomain({
    @_s.required String identity,
    BehaviorOnMXFailure behaviorOnMXFailure,
    String mailFromDomain,
  }) async {
    ArgumentError.checkNotNull(identity, 'identity');
    final $request = <String, dynamic>{};
    $request['Identity'] = identity;
    behaviorOnMXFailure
        ?.also((arg) => $request['BehaviorOnMXFailure'] = arg.toValue());
    mailFromDomain?.also((arg) => $request['MailFromDomain'] = arg);
    await _protocol.send(
      $request,
      action: 'SetIdentityMailFromDomain',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetIdentityMailFromDomainRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// Parameter [identity] :
  /// The identity (email address or domain) that you want to set the Amazon SNS
  /// topic for.
  /// <important>
  /// You can only specify a verified identity for this parameter.
  /// </important>
  /// You can specify an identity by using its name or by using its Amazon
  /// Resource Name (ARN). The following examples are all valid identities:
  /// <code>sender@example.com</code>, <code>example.com</code>,
  /// <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.
  ///
  /// Parameter [notificationType] :
  /// The type of notifications that will be published to the specified Amazon
  /// SNS topic.
  ///
  /// Parameter [snsTopic] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter
  /// is omitted from the request or a null value is passed,
  /// <code>SnsTopic</code> is cleared and publishing is disabled.
  Future<void> setIdentityNotificationTopic({
    @_s.required String identity,
    @_s.required NotificationType notificationType,
    String snsTopic,
  }) async {
    ArgumentError.checkNotNull(identity, 'identity');
    ArgumentError.checkNotNull(notificationType, 'notificationType');
    final $request = <String, dynamic>{};
    $request['Identity'] = identity;
    $request['NotificationType'] = notificationType.toValue();
    snsTopic?.also((arg) => $request['SnsTopic'] = arg);
    await _protocol.send(
      $request,
      action: 'SetIdentityNotificationTopic',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetIdentityNotificationTopicRequest'],
      shapes: shapes,
      resultWrapper: 'SetIdentityNotificationTopicResult',
    );
  }

  /// Sets the position of the specified receipt rule in the receipt rule set.
  ///
  /// For information about managing receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon
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
    @_s.required String ruleName,
    @_s.required String ruleSetName,
    String after,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['RuleName'] = ruleName;
    $request['RuleSetName'] = ruleSetName;
    after?.also((arg) => $request['After'] = arg);
    await _protocol.send(
      $request,
      action: 'SetReceiptRulePosition',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetReceiptRulePositionRequest'],
      shapes: shapes,
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
  /// The name of the template that you want to render.
  Future<TestRenderTemplateResponse> testRenderTemplate({
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
    final $request = <String, dynamic>{};
    $request['TemplateData'] = templateData;
    $request['TemplateName'] = templateName;
    final $result = await _protocol.send(
      $request,
      action: 'TestRenderTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TestRenderTemplateRequest'],
      shapes: shapes,
      resultWrapper: 'TestRenderTemplateResult',
    );
    return TestRenderTemplateResponse.fromXml($result);
  }

  /// Enables or disables email sending across your entire Amazon SES account in
  /// the current AWS Region. You can use this operation in conjunction with
  /// Amazon CloudWatch alarms to temporarily pause email sending across your
  /// Amazon SES account in a given AWS Region when reputation metrics (such as
  /// your bounce or complaint rates) reach certain thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [enabled] :
  /// Describes whether email sending is enabled or disabled for your Amazon SES
  /// account in the current AWS Region.
  Future<void> updateAccountSendingEnabled({
    bool enabled,
  }) async {
    final $request = <String, dynamic>{};
    enabled?.also((arg) => $request['Enabled'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateAccountSendingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateAccountSendingEnabledRequest'],
      shapes: shapes,
    );
  }

  /// Updates the event destination of a configuration set. Event destinations
  /// are associated with configuration sets, which enable you to publish email
  /// sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon
  /// Simple Notification Service (Amazon SNS). For information about using
  /// configuration sets, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Monitoring
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
  /// The name of the configuration set that contains the event destination that
  /// you want to update.
  ///
  /// Parameter [eventDestination] :
  /// The event destination object that you want to apply to the specified
  /// configuration set.
  Future<void> updateConfigurationSetEventDestination({
    @_s.required String configurationSetName,
    @_s.required EventDestination eventDestination,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestination, 'eventDestination');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    $request['EventDestination'] = eventDestination;
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetEventDestination',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateConfigurationSetEventDestinationRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateConfigurationSetEventDestinationResult',
    );
  }

  /// Enables or disables the publishing of reputation metrics for emails sent
  /// using a specific configuration set in a given AWS Region. Reputation
  /// metrics include bounce and complaint rates. These metrics are published to
  /// Amazon CloudWatch. By using CloudWatch, you can create alarms when bounce
  /// or complaint rates exceed certain thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that you want to update.
  ///
  /// Parameter [enabled] :
  /// Describes whether or not Amazon SES will publish reputation metrics for
  /// the configuration set, such as bounce and complaint rates, to Amazon
  /// CloudWatch.
  Future<void> updateConfigurationSetReputationMetricsEnabled({
    @_s.required String configurationSetName,
    @_s.required bool enabled,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(enabled, 'enabled');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    $request['Enabled'] = enabled;
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetReputationMetricsEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateConfigurationSetReputationMetricsEnabledRequest'],
      shapes: shapes,
    );
  }

  /// Enables or disables email sending for messages sent using a specific
  /// configuration set in a given AWS Region. You can use this operation in
  /// conjunction with Amazon CloudWatch alarms to temporarily pause email
  /// sending for a configuration set when the reputation metrics for that
  /// configuration set (such as your bounce on complaint rate) exceed certain
  /// thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that you want to update.
  ///
  /// Parameter [enabled] :
  /// Describes whether email sending is enabled or disabled for the
  /// configuration set.
  Future<void> updateConfigurationSetSendingEnabled({
    @_s.required String configurationSetName,
    @_s.required bool enabled,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(enabled, 'enabled');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    $request['Enabled'] = enabled;
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetSendingEnabled',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateConfigurationSetSendingEnabledRequest'],
      shapes: shapes,
    );
  }

  /// Modifies an association between a configuration set and a custom domain
  /// for open and click event tracking.
  ///
  /// By default, images and links used for tracking open and click events are
  /// hosted on domains operated by Amazon SES. You can configure a subdomain of
  /// your own to handle these events. For information about using custom
  /// domains, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon
  /// SES Developer Guide</a>.
  ///
  /// May throw [ConfigurationSetDoesNotExistException].
  /// May throw [TrackingOptionsDoesNotExistException].
  /// May throw [InvalidTrackingOptionsException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set for which you want to update the custom
  /// tracking domain.
  Future<void> updateConfigurationSetTrackingOptions({
    @_s.required String configurationSetName,
    @_s.required TrackingOptions trackingOptions,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(trackingOptions, 'trackingOptions');
    final $request = <String, dynamic>{};
    $request['ConfigurationSetName'] = configurationSetName;
    $request['TrackingOptions'] = trackingOptions;
    await _protocol.send(
      $request,
      action: 'UpdateConfigurationSetTrackingOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateConfigurationSetTrackingOptionsRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateConfigurationSetTrackingOptionsResult',
    );
  }

  /// Updates an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using
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
  /// The name of the custom verification email template that you want to
  /// update.
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html#custom-verification-emails-faq">Custom
  /// Verification Email Frequently Asked Questions</a> in the <i>Amazon SES
  /// Developer Guide</i>.
  ///
  /// Parameter [templateSubject] :
  /// The subject line of the custom verification email.
  Future<void> updateCustomVerificationEmailTemplate({
    @_s.required String templateName,
    String failureRedirectionURL,
    String fromEmailAddress,
    String successRedirectionURL,
    String templateContent,
    String templateSubject,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    final $request = <String, dynamic>{};
    $request['TemplateName'] = templateName;
    failureRedirectionURL
        ?.also((arg) => $request['FailureRedirectionURL'] = arg);
    fromEmailAddress?.also((arg) => $request['FromEmailAddress'] = arg);
    successRedirectionURL
        ?.also((arg) => $request['SuccessRedirectionURL'] = arg);
    templateContent?.also((arg) => $request['TemplateContent'] = arg);
    templateSubject?.also((arg) => $request['TemplateSubject'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateCustomVerificationEmailTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateCustomVerificationEmailTemplateRequest'],
      shapes: shapes,
    );
  }

  /// Updates a receipt rule.
  ///
  /// For information about managing receipt rules, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon
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
    @_s.required ReceiptRule rule,
    @_s.required String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(rule, 'rule');
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    final $request = <String, dynamic>{};
    $request['Rule'] = rule;
    $request['RuleSetName'] = ruleSetName;
    await _protocol.send(
      $request,
      action: 'UpdateReceiptRule',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateReceiptRuleRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateReceiptRuleResult',
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
  /// May throw [TemplateDoesNotExistException].
  /// May throw [InvalidTemplateException].
  Future<void> updateTemplate({
    @_s.required Template template,
  }) async {
    ArgumentError.checkNotNull(template, 'template');
    final $request = <String, dynamic>{};
    $request['Template'] = template;
    await _protocol.send(
      $request,
      action: 'UpdateTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateTemplateRequest'],
      shapes: shapes,
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-domains.html">verify
  /// it</a> or you successfully <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">set
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
    @_s.required String domain,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    final $request = <String, dynamic>{};
    $request['Domain'] = domain;
    final $result = await _protocol.send(
      $request,
      action: 'VerifyDomainDkim',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['VerifyDomainDkimRequest'],
      shapes: shapes,
      resultWrapper: 'VerifyDomainDkimResult',
    );
    return VerifyDomainDkimResponse.fromXml($result);
  }

  /// Adds a domain to the list of identities for your Amazon SES account in the
  /// current AWS Region and attempts to verify it. For more information about
  /// verifying domains, see <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying
  /// Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i>
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [domain] :
  /// The domain to be verified.
  Future<VerifyDomainIdentityResponse> verifyDomainIdentity({
    @_s.required String domain,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    final $request = <String, dynamic>{};
    $request['Domain'] = domain;
    final $result = await _protocol.send(
      $request,
      action: 'VerifyDomainIdentity',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['VerifyDomainIdentityRequest'],
      shapes: shapes,
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
    @_s.required String emailAddress,
  }) async {
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    final $request = <String, dynamic>{};
    $request['EmailAddress'] = emailAddress;
    await _protocol.send(
      $request,
      action: 'VerifyEmailAddress',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['VerifyEmailAddressRequest'],
      shapes: shapes,
    );
  }

  /// Adds an email address to the list of identities for your Amazon SES
  /// account in the current AWS region and attempts to verify it. As a result
  /// of executing this operation, a verification email is sent to the specified
  /// address.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// Parameter [emailAddress] :
  /// The email address to be verified.
  Future<void> verifyEmailIdentity({
    @_s.required String emailAddress,
  }) async {
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    final $request = <String, dynamic>{};
    $request['EmailAddress'] = emailAddress;
    await _protocol.send(
      $request,
      action: 'VerifyEmailIdentity',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['VerifyEmailIdentityRequest'],
      shapes: shapes,
      resultWrapper: 'VerifyEmailIdentityResult',
    );
  }
}

/// When included in a receipt rule, this action adds a header to the received
/// email.
///
/// For information about adding a header using a receipt rule, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-add-header.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AddHeaderAction {
  /// The name of the header to add. Must be between 1 and 50 characters,
  /// inclusive, and consist of alphanumeric (a-z, A-Z, 0-9) characters and dashes
  /// only.
  @_s.JsonKey(name: 'HeaderName')
  final String headerName;

  /// Must be less than 2048 characters, and must not contain newline characters
  /// ("\r" or "\n").
  @_s.JsonKey(name: 'HeaderValue')
  final String headerValue;

  AddHeaderAction({
    @_s.required this.headerName,
    @_s.required this.headerValue,
  });
  factory AddHeaderAction.fromXml(_s.XmlElement elem) {
    return AddHeaderAction(
      headerName: _s.extractXmlStringValue(elem, 'HeaderName'),
      headerValue: _s.extractXmlStringValue(elem, 'HeaderValue'),
    );
  }

  Map<String, dynamic> toJson() => _$AddHeaderActionToJson(this);
}

enum BehaviorOnMXFailure {
  @_s.JsonValue('UseDefaultValue')
  useDefaultValue,
  @_s.JsonValue('RejectMessage')
  rejectMessage,
}

extension on BehaviorOnMXFailure {
  String toValue() {
    switch (this) {
      case BehaviorOnMXFailure.useDefaultValue:
        return 'UseDefaultValue';
      case BehaviorOnMXFailure.rejectMessage:
        return 'RejectMessage';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  BehaviorOnMXFailure toBehaviorOnMXFailure() {
    switch (this) {
      case 'UseDefaultValue':
        return BehaviorOnMXFailure.useDefaultValue;
      case 'RejectMessage':
        return BehaviorOnMXFailure.rejectMessage;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the body of the message. You can specify text, HTML, or both. If
/// you use both, then the message should display correctly in the widest
/// variety of email clients.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Body {
  /// The content of the message, in HTML format. Use this for email clients that
  /// can process HTML. You can include clickable links, formatted text, and much
  /// more in an HTML message.
  @_s.JsonKey(name: 'Html')
  final Content html;

  /// The content of the message, in text format. Use this for text-based email
  /// clients, or clients on high-latency networks (such as mobile devices).
  @_s.JsonKey(name: 'Text')
  final Content text;

  Body({
    this.html,
    this.text,
  });
  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

/// When included in a receipt rule, this action rejects the received email by
/// returning a bounce response to the sender and, optionally, publishes a
/// notification to Amazon Simple Notification Service (Amazon SNS).
///
/// For information about sending a bounce message in response to a received
/// email, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-bounce.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BounceAction {
  /// Human-readable text to include in the bounce message.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The email address of the sender of the bounced email. This is the address
  /// from which the bounce message will be sent.
  @_s.JsonKey(name: 'Sender')
  final String sender;

  /// The SMTP reply code, as defined by <a
  /// href="https://tools.ietf.org/html/rfc5321">RFC 5321</a>.
  @_s.JsonKey(name: 'SmtpReplyCode')
  final String smtpReplyCode;

  /// The SMTP enhanced status code, as defined by <a
  /// href="https://tools.ietf.org/html/rfc3463">RFC 3463</a>.
  @_s.JsonKey(name: 'StatusCode')
  final String statusCode;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// bounce action is taken. An example of an Amazon SNS topic ARN is
  /// <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more
  /// information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  BounceAction({
    @_s.required this.message,
    @_s.required this.sender,
    @_s.required this.smtpReplyCode,
    this.statusCode,
    this.topicArn,
  });
  factory BounceAction.fromXml(_s.XmlElement elem) {
    return BounceAction(
      message: _s.extractXmlStringValue(elem, 'Message'),
      sender: _s.extractXmlStringValue(elem, 'Sender'),
      smtpReplyCode: _s.extractXmlStringValue(elem, 'SmtpReplyCode'),
      statusCode: _s.extractXmlStringValue(elem, 'StatusCode'),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() => _$BounceActionToJson(this);
}

enum BounceType {
  @_s.JsonValue('DoesNotExist')
  doesNotExist,
  @_s.JsonValue('MessageTooLarge')
  messageTooLarge,
  @_s.JsonValue('ExceededQuota')
  exceededQuota,
  @_s.JsonValue('ContentRejected')
  contentRejected,
  @_s.JsonValue('Undefined')
  undefined,
  @_s.JsonValue('TemporaryFailure')
  temporaryFailure,
}

extension on String {
  BounceType toBounceType() {
    switch (this) {
      case 'DoesNotExist':
        return BounceType.doesNotExist;
      case 'MessageTooLarge':
        return BounceType.messageTooLarge;
      case 'ExceededQuota':
        return BounceType.exceededQuota;
      case 'ContentRejected':
        return BounceType.contentRejected;
      case 'Undefined':
        return BounceType.undefined;
      case 'TemporaryFailure':
        return BounceType.temporaryFailure;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Recipient-related information to include in the Delivery Status Notification
/// (DSN) when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BouncedRecipientInfo {
  /// The email address of the recipient of the bounced email.
  @_s.JsonKey(name: 'Recipient')
  final String recipient;

  /// The reason for the bounce. You must provide either this parameter or
  /// <code>RecipientDsnFields</code>.
  @_s.JsonKey(name: 'BounceType')
  final BounceType bounceType;

  /// This parameter is used only for sending authorization. It is the ARN of the
  /// identity that is associated with the sending authorization policy that
  /// permits you to receive email for the recipient of the bounced email. For
  /// more information about sending authorization, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon
  /// SES Developer Guide</a>.
  @_s.JsonKey(name: 'RecipientArn')
  final String recipientArn;

  /// Recipient-related DSN fields, most of which would normally be filled in
  /// automatically when provided with a <code>BounceType</code>. You must provide
  /// either this parameter or <code>BounceType</code>.
  @_s.JsonKey(name: 'RecipientDsnFields')
  final RecipientDsnFields recipientDsnFields;

  BouncedRecipientInfo({
    @_s.required this.recipient,
    this.bounceType,
    this.recipientArn,
    this.recipientDsnFields,
  });
  Map<String, dynamic> toJson() => _$BouncedRecipientInfoToJson(this);
}

/// An array that contains one or more Destinations, as well as the tags and
/// replacement data associated with each of those Destinations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BulkEmailDestination {
  @_s.JsonKey(name: 'Destination')
  final Destination destination;

  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using <code>SendBulkTemplatedEmail</code>. Tags correspond to
  /// characteristics of the email that you define, so that you can publish email
  /// sending events.
  @_s.JsonKey(name: 'ReplacementTags')
  final List<MessageTag> replacementTags;

  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  @_s.JsonKey(name: 'ReplacementTemplateData')
  final String replacementTemplateData;

  BulkEmailDestination({
    @_s.required this.destination,
    this.replacementTags,
    this.replacementTemplateData,
  });
  Map<String, dynamic> toJson() => _$BulkEmailDestinationToJson(this);
}

/// An object that contains the response from the
/// <code>SendBulkTemplatedEmail</code> operation.
class BulkEmailDestinationStatus {
  /// A description of an error that prevented a message being sent using the
  /// <code>SendBulkTemplatedEmail</code> operation.
  final String error;

  /// The unique message identifier returned from the
  /// <code>SendBulkTemplatedEmail</code> operation.
  final String messageId;

  /// The status of a message sent using the <code>SendBulkTemplatedEmail</code>
  /// operation.
  ///
  /// Possible values for this parameter include:
  ///
  /// <ul>
  /// <li>
  /// <code>Success</code>: Amazon SES accepted the message, and will attempt to
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
  final BulkEmailStatus status;

  BulkEmailDestinationStatus({
    this.error,
    this.messageId,
    this.status,
  });
  factory BulkEmailDestinationStatus.fromXml(_s.XmlElement elem) {
    return BulkEmailDestinationStatus(
      error: _s.extractXmlStringValue(elem, 'Error'),
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toBulkEmailStatus(),
    );
  }
}

enum BulkEmailStatus {
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('MessageRejected')
  messageRejected,
  @_s.JsonValue('MailFromDomainNotVerified')
  mailFromDomainNotVerified,
  @_s.JsonValue('ConfigurationSetDoesNotExist')
  configurationSetDoesNotExist,
  @_s.JsonValue('TemplateDoesNotExist')
  templateDoesNotExist,
  @_s.JsonValue('AccountSuspended')
  accountSuspended,
  @_s.JsonValue('AccountThrottled')
  accountThrottled,
  @_s.JsonValue('AccountDailyQuotaExceeded')
  accountDailyQuotaExceeded,
  @_s.JsonValue('InvalidSendingPoolName')
  invalidSendingPoolName,
  @_s.JsonValue('AccountSendingPaused')
  accountSendingPaused,
  @_s.JsonValue('ConfigurationSetSendingPaused')
  configurationSetSendingPaused,
  @_s.JsonValue('InvalidParameterValue')
  invalidParameterValue,
  @_s.JsonValue('TransientFailure')
  transientFailure,
  @_s.JsonValue('Failed')
  failed,
}

extension on String {
  BulkEmailStatus toBulkEmailStatus() {
    switch (this) {
      case 'Success':
        return BulkEmailStatus.success;
      case 'MessageRejected':
        return BulkEmailStatus.messageRejected;
      case 'MailFromDomainNotVerified':
        return BulkEmailStatus.mailFromDomainNotVerified;
      case 'ConfigurationSetDoesNotExist':
        return BulkEmailStatus.configurationSetDoesNotExist;
      case 'TemplateDoesNotExist':
        return BulkEmailStatus.templateDoesNotExist;
      case 'AccountSuspended':
        return BulkEmailStatus.accountSuspended;
      case 'AccountThrottled':
        return BulkEmailStatus.accountThrottled;
      case 'AccountDailyQuotaExceeded':
        return BulkEmailStatus.accountDailyQuotaExceeded;
      case 'InvalidSendingPoolName':
        return BulkEmailStatus.invalidSendingPoolName;
      case 'AccountSendingPaused':
        return BulkEmailStatus.accountSendingPaused;
      case 'ConfigurationSetSendingPaused':
        return BulkEmailStatus.configurationSetSendingPaused;
      case 'InvalidParameterValue':
        return BulkEmailStatus.invalidParameterValue;
      case 'TransientFailure':
        return BulkEmailStatus.transientFailure;
      case 'Failed':
        return BulkEmailStatus.failed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An empty element returned on a successful request.
class CloneReceiptRuleSetResponse {
  CloneReceiptRuleSetResponse();
  factory CloneReceiptRuleSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CloneReceiptRuleSetResponse();
  }
}

/// Contains information associated with an Amazon CloudWatch event destination
/// to which email sending events are published.
///
/// Event destinations, such as Amazon CloudWatch, are associated with
/// configuration sets, which enable you to publish email sending events. For
/// information about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloudWatchDestination {
  /// A list of dimensions upon which to categorize your emails when you publish
  /// email sending events to Amazon CloudWatch.
  @_s.JsonKey(name: 'DimensionConfigurations')
  final List<CloudWatchDimensionConfiguration> dimensionConfigurations;

  CloudWatchDestination({
    @_s.required this.dimensionConfigurations,
  });
  factory CloudWatchDestination.fromXml(_s.XmlElement elem) {
    return CloudWatchDestination(
      dimensionConfigurations: _s
          .extractXmlChild(elem, 'DimensionConfigurations')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => CloudWatchDimensionConfiguration.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() => _$CloudWatchDestinationToJson(this);
}

/// Contains the dimension configuration to use when you publish email sending
/// events to Amazon CloudWatch.
///
/// For information about publishing email sending events to Amazon CloudWatch,
/// see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloudWatchDimensionConfiguration {
  /// The default value of the dimension that is published to Amazon CloudWatch if
  /// you do not provide the value of the dimension when you send an email. The
  /// default value must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Contain less than 256 characters.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DefaultDimensionValue')
  final String defaultDimensionValue;

  /// The name of an Amazon CloudWatch dimension associated with an email sending
  /// metric. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Contain less than 256 characters.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DimensionName')
  final String dimensionName;

  /// The place where Amazon SES finds the value of a dimension to publish to
  /// Amazon CloudWatch. If you want Amazon SES to use the message tags that you
  /// specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to
  /// the <code>SendEmail</code>/<code>SendRawEmail</code> API, choose
  /// <code>messageTag</code>. If you want Amazon SES to use your own email
  /// headers, choose <code>emailHeader</code>.
  @_s.JsonKey(name: 'DimensionValueSource')
  final DimensionValueSource dimensionValueSource;

  CloudWatchDimensionConfiguration({
    @_s.required this.defaultDimensionValue,
    @_s.required this.dimensionName,
    @_s.required this.dimensionValueSource,
  });
  factory CloudWatchDimensionConfiguration.fromXml(_s.XmlElement elem) {
    return CloudWatchDimensionConfiguration(
      defaultDimensionValue:
          _s.extractXmlStringValue(elem, 'DefaultDimensionValue'),
      dimensionName: _s.extractXmlStringValue(elem, 'DimensionName'),
      dimensionValueSource: _s
          .extractXmlStringValue(elem, 'DimensionValueSource')
          ?.toDimensionValueSource(),
    );
  }

  Map<String, dynamic> toJson() =>
      _$CloudWatchDimensionConfigurationToJson(this);
}

/// The name of the configuration set.
///
/// Configuration sets let you create groups of rules that you can apply to the
/// emails you send using Amazon SES. For more information about using
/// configuration sets, see <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/using-configuration-sets.html">Using
/// Amazon SES Configuration Sets</a> in the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/">Amazon SES
/// Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Name')
  final String name;

  ConfigurationSet({
    @_s.required this.name,
  });
  factory ConfigurationSet.fromXml(_s.XmlElement elem) {
    return ConfigurationSet(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() => _$ConfigurationSetToJson(this);
}

enum ConfigurationSetAttribute {
  @_s.JsonValue('eventDestinations')
  eventDestinations,
  @_s.JsonValue('trackingOptions')
  trackingOptions,
  @_s.JsonValue('deliveryOptions')
  deliveryOptions,
  @_s.JsonValue('reputationOptions')
  reputationOptions,
}

extension on ConfigurationSetAttribute {
  String toValue() {
    switch (this) {
      case ConfigurationSetAttribute.eventDestinations:
        return 'eventDestinations';
      case ConfigurationSetAttribute.trackingOptions:
        return 'trackingOptions';
      case ConfigurationSetAttribute.deliveryOptions:
        return 'deliveryOptions';
      case ConfigurationSetAttribute.reputationOptions:
        return 'reputationOptions';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ConfigurationSetAttribute toConfigurationSetAttribute() {
    switch (this) {
      case 'eventDestinations':
        return ConfigurationSetAttribute.eventDestinations;
      case 'trackingOptions':
        return ConfigurationSetAttribute.trackingOptions;
      case 'deliveryOptions':
        return ConfigurationSetAttribute.deliveryOptions;
      case 'reputationOptions':
        return ConfigurationSetAttribute.reputationOptions;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents textual data, plus an optional character set specification.
///
/// By default, the text must be 7-bit ASCII, due to the constraints of the SMTP
/// protocol. If the text must contain any other characters, then you must also
/// specify a character set. Examples include UTF-8, ISO-8859-1, and Shift_JIS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Content {
  /// The textual data of the content.
  @_s.JsonKey(name: 'Data')
  final String data;

  /// The character set of the content.
  @_s.JsonKey(name: 'Charset')
  final String charset;

  Content({
    @_s.required this.data,
    this.charset,
  });
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

/// An empty element returned on a successful request.
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();
  factory CreateConfigurationSetEventDestinationResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateConfigurationSetEventDestinationResponse();
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
}

/// An empty element returned on a successful request.
class CreateConfigurationSetTrackingOptionsResponse {
  CreateConfigurationSetTrackingOptionsResponse();
  factory CreateConfigurationSetTrackingOptionsResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateConfigurationSetTrackingOptionsResponse();
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
}

/// An empty element returned on a successful request.
class CreateReceiptRuleResponse {
  CreateReceiptRuleResponse();
  factory CreateReceiptRuleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateReceiptRuleResponse();
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
}

class CreateTemplateResponse {
  CreateTemplateResponse();
  factory CreateTemplateResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateTemplateResponse();
  }
}

enum CustomMailFromStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('TemporaryFailure')
  temporaryFailure,
}

extension on String {
  CustomMailFromStatus toCustomMailFromStatus() {
    switch (this) {
      case 'Pending':
        return CustomMailFromStatus.pending;
      case 'Success':
        return CustomMailFromStatus.success;
      case 'Failed':
        return CustomMailFromStatus.failed;
      case 'TemporaryFailure':
        return CustomMailFromStatus.temporaryFailure;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a custom verification email template.
class CustomVerificationEmailTemplate {
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  final String failureRedirectionURL;

  /// The email address that the custom verification email is sent from.
  final String fromEmailAddress;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  final String successRedirectionURL;

  /// The name of the custom verification email template.
  final String templateName;

  /// The subject line of the custom verification email.
  final String templateSubject;

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
}

/// An empty element returned on a successful request.
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();
  factory DeleteConfigurationSetEventDestinationResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteConfigurationSetEventDestinationResponse();
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
}

/// An empty element returned on a successful request.
class DeleteConfigurationSetTrackingOptionsResponse {
  DeleteConfigurationSetTrackingOptionsResponse();
  factory DeleteConfigurationSetTrackingOptionsResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteConfigurationSetTrackingOptionsResponse();
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
}

/// An empty element returned on a successful request.
class DeleteIdentityResponse {
  DeleteIdentityResponse();
  factory DeleteIdentityResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteIdentityResponse();
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
}

/// An empty element returned on a successful request.
class DeleteReceiptRuleResponse {
  DeleteReceiptRuleResponse();
  factory DeleteReceiptRuleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteReceiptRuleResponse();
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
}

class DeleteTemplateResponse {
  DeleteTemplateResponse();
  factory DeleteTemplateResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteTemplateResponse();
  }
}

/// Specifies whether messages that use the configuration set are required to
/// use Transport Layer Security (TLS).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeliveryOptions {
  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS). If the value is <code>Require</code>,
  /// messages are only delivered if a TLS connection can be established. If the
  /// value is <code>Optional</code>, messages can be delivered in plain text if a
  /// TLS connection can't be established.
  @_s.JsonKey(name: 'TlsPolicy')
  final TlsPolicy tlsPolicy;

  DeliveryOptions({
    this.tlsPolicy,
  });
  factory DeliveryOptions.fromXml(_s.XmlElement elem) {
    return DeliveryOptions(
      tlsPolicy: _s.extractXmlStringValue(elem, 'TlsPolicy')?.toTlsPolicy(),
    );
  }

  Map<String, dynamic> toJson() => _$DeliveryOptionsToJson(this);
}

/// Represents the metadata and receipt rules for the receipt rule set that is
/// currently active.
class DescribeActiveReceiptRuleSetResponse {
  /// The metadata for the currently active receipt rule set. The metadata
  /// consists of the rule set name and a timestamp of when the rule set was
  /// created.
  final ReceiptRuleSetMetadata metadata;

  /// The receipt rules that belong to the active rule set.
  final List<ReceiptRule> rules;

  DescribeActiveReceiptRuleSetResponse({
    this.metadata,
    this.rules,
  });
  factory DescribeActiveReceiptRuleSetResponse.fromXml(_s.XmlElement elem) {
    return DescribeActiveReceiptRuleSetResponse(
      metadata: _s
          .extractXmlChild(elem, 'Metadata')
          ?.let((e) => ReceiptRuleSetMetadata.fromXml(e)),
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) => elem
          .findElements('member')
          .map((c) => ReceiptRule.fromXml(c))
          .toList()),
    );
  }
}

/// Represents the details of a configuration set. Configuration sets enable you
/// to publish email sending events. For information about using configuration
/// sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class DescribeConfigurationSetResponse {
  /// The configuration set object associated with the specified configuration
  /// set.
  final ConfigurationSet configurationSet;
  final DeliveryOptions deliveryOptions;

  /// A list of event destinations associated with the configuration set.
  final List<EventDestination> eventDestinations;

  /// An object that represents the reputation settings for the configuration set.
  final ReputationOptions reputationOptions;

  /// The name of the custom open and click tracking domain associated with the
  /// configuration set.
  final TrackingOptions trackingOptions;

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
          ?.let((e) => ConfigurationSet.fromXml(e)),
      deliveryOptions: _s
          .extractXmlChild(elem, 'DeliveryOptions')
          ?.let((e) => DeliveryOptions.fromXml(e)),
      eventDestinations: _s.extractXmlChild(elem, 'EventDestinations')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => EventDestination.fromXml(c))
              .toList()),
      reputationOptions: _s
          .extractXmlChild(elem, 'ReputationOptions')
          ?.let((e) => ReputationOptions.fromXml(e)),
      trackingOptions: _s
          .extractXmlChild(elem, 'TrackingOptions')
          ?.let((e) => TrackingOptions.fromXml(e)),
    );
  }
}

/// Represents the details of a receipt rule.
class DescribeReceiptRuleResponse {
  /// A data structure that contains the specified receipt rule's name, actions,
  /// recipients, domains, enabled status, scan status, and Transport Layer
  /// Security (TLS) policy.
  final ReceiptRule rule;

  DescribeReceiptRuleResponse({
    this.rule,
  });
  factory DescribeReceiptRuleResponse.fromXml(_s.XmlElement elem) {
    return DescribeReceiptRuleResponse(
      rule:
          _s.extractXmlChild(elem, 'Rule')?.let((e) => ReceiptRule.fromXml(e)),
    );
  }
}

/// Represents the details of the specified receipt rule set.
class DescribeReceiptRuleSetResponse {
  /// The metadata for the receipt rule set, which consists of the rule set name
  /// and the timestamp of when the rule set was created.
  final ReceiptRuleSetMetadata metadata;

  /// A list of the receipt rules that belong to the specified receipt rule set.
  final List<ReceiptRule> rules;

  DescribeReceiptRuleSetResponse({
    this.metadata,
    this.rules,
  });
  factory DescribeReceiptRuleSetResponse.fromXml(_s.XmlElement elem) {
    return DescribeReceiptRuleSetResponse(
      metadata: _s
          .extractXmlChild(elem, 'Metadata')
          ?.let((e) => ReceiptRuleSetMetadata.fromXml(e)),
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) => elem
          .findElements('member')
          .map((c) => ReceiptRule.fromXml(c))
          .toList()),
    );
  }
}

/// Represents the destination of the message, consisting of To:, CC:, and BCC:
/// fields.
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Destination {
  /// The recipients to place on the BCC: line of the message.
  @_s.JsonKey(name: 'BccAddresses')
  final List<String> bccAddresses;

  /// The recipients to place on the CC: line of the message.
  @_s.JsonKey(name: 'CcAddresses')
  final List<String> ccAddresses;

  /// The recipients to place on the To: line of the message.
  @_s.JsonKey(name: 'ToAddresses')
  final List<String> toAddresses;

  Destination({
    this.bccAddresses,
    this.ccAddresses,
    this.toAddresses,
  });
  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

enum DimensionValueSource {
  @_s.JsonValue('messageTag')
  messageTag,
  @_s.JsonValue('emailHeader')
  emailHeader,
  @_s.JsonValue('linkTag')
  linkTag,
}

extension on String {
  DimensionValueSource toDimensionValueSource() {
    switch (this) {
      case 'messageTag':
        return DimensionValueSource.messageTag;
      case 'emailHeader':
        return DimensionValueSource.emailHeader;
      case 'linkTag':
        return DimensionValueSource.linkTag;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DsnAction {
  @_s.JsonValue('failed')
  failed,
  @_s.JsonValue('delayed')
  delayed,
  @_s.JsonValue('delivered')
  delivered,
  @_s.JsonValue('relayed')
  relayed,
  @_s.JsonValue('expanded')
  expanded,
}

extension on String {
  DsnAction toDsnAction() {
    switch (this) {
      case 'failed':
        return DsnAction.failed;
      case 'delayed':
        return DsnAction.delayed;
      case 'delivered':
        return DsnAction.delivered;
      case 'relayed':
        return DsnAction.relayed;
      case 'expanded':
        return DsnAction.expanded;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about the event destination that the specified email
/// sending events will be published to.
/// <note>
/// When you create or update an event destination, you must provide one, and
/// only one, destination. The destination can be Amazon CloudWatch, Amazon
/// Kinesis Firehose or Amazon Simple Notification Service (Amazon SNS).
/// </note>
/// Event destinations are associated with configuration sets, which enable you
/// to publish email sending events to Amazon CloudWatch, Amazon Kinesis
/// Firehose, or Amazon Simple Notification Service (Amazon SNS). For
/// information about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventDestination {
  /// The type of email sending events to publish to the event destination.
  @_s.JsonKey(name: 'MatchingEventTypes')
  final List<EventType> matchingEventTypes;

  /// The name of the event destination. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Contain less than 64 characters.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An object that contains the names, default values, and sources of the
  /// dimensions associated with an Amazon CloudWatch event destination.
  @_s.JsonKey(name: 'CloudWatchDestination')
  final CloudWatchDestination cloudWatchDestination;

  /// Sets whether Amazon SES publishes events to this destination when you send
  /// an email with the associated configuration set. Set to <code>true</code> to
  /// enable publishing to this destination; set to <code>false</code> to prevent
  /// publishing to this destination. The default value is <code>false</code>.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// An object that contains the delivery stream ARN and the IAM role ARN
  /// associated with an Amazon Kinesis Firehose event destination.
  @_s.JsonKey(name: 'KinesisFirehoseDestination')
  final KinesisFirehoseDestination kinesisFirehoseDestination;

  /// An object that contains the topic ARN associated with an Amazon Simple
  /// Notification Service (Amazon SNS) event destination.
  @_s.JsonKey(name: 'SNSDestination')
  final SNSDestination sNSDestination;

  EventDestination({
    @_s.required this.matchingEventTypes,
    @_s.required this.name,
    this.cloudWatchDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.sNSDestination,
  });
  factory EventDestination.fromXml(_s.XmlElement elem) {
    return EventDestination(
      matchingEventTypes: _s.extractXmlChild(elem, 'MatchingEventTypes')?.let(
          (elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toEventType())
              .toList()),
      name: _s.extractXmlStringValue(elem, 'Name'),
      cloudWatchDestination: _s
          .extractXmlChild(elem, 'CloudWatchDestination')
          ?.let((e) => CloudWatchDestination.fromXml(e)),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      kinesisFirehoseDestination: _s
          .extractXmlChild(elem, 'KinesisFirehoseDestination')
          ?.let((e) => KinesisFirehoseDestination.fromXml(e)),
      sNSDestination: _s
          .extractXmlChild(elem, 'SNSDestination')
          ?.let((e) => SNSDestination.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() => _$EventDestinationToJson(this);
}

enum EventType {
  @_s.JsonValue('send')
  send,
  @_s.JsonValue('reject')
  reject,
  @_s.JsonValue('bounce')
  bounce,
  @_s.JsonValue('complaint')
  complaint,
  @_s.JsonValue('delivery')
  delivery,
  @_s.JsonValue('open')
  open,
  @_s.JsonValue('click')
  click,
  @_s.JsonValue('renderingFailure')
  renderingFailure,
}

extension on String {
  EventType toEventType() {
    switch (this) {
      case 'send':
        return EventType.send;
      case 'reject':
        return EventType.reject;
      case 'bounce':
        return EventType.bounce;
      case 'complaint':
        return EventType.complaint;
      case 'delivery':
        return EventType.delivery;
      case 'open':
        return EventType.open;
      case 'click':
        return EventType.click;
      case 'renderingFailure':
        return EventType.renderingFailure;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Additional X-headers to include in the Delivery Status Notification (DSN)
/// when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExtensionField {
  /// The name of the header to add. Must be between 1 and 50 characters,
  /// inclusive, and consist of alphanumeric (a-z, A-Z, 0-9) characters and dashes
  /// only.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the header to add. Must be less than 2048 characters, and must
  /// not contain newline characters ("\r" or "\n").
  @_s.JsonKey(name: 'Value')
  final String value;

  ExtensionField({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$ExtensionFieldToJson(this);
}

/// Represents a request to return the email sending status for your Amazon SES
/// account in the current AWS Region.
class GetAccountSendingEnabledResponse {
  /// Describes whether email sending is enabled or disabled for your Amazon SES
  /// account in the current AWS Region.
  final bool enabled;

  GetAccountSendingEnabledResponse({
    this.enabled,
  });
  factory GetAccountSendingEnabledResponse.fromXml(_s.XmlElement elem) {
    return GetAccountSendingEnabledResponse(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
    );
  }
}

/// The content of the custom verification email template.
class GetCustomVerificationEmailTemplateResponse {
  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  final String failureRedirectionURL;

  /// The email address that the custom verification email is sent from.
  final String fromEmailAddress;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  final String successRedirectionURL;

  /// The content of the custom verification email.
  final String templateContent;

  /// The name of the custom verification email template.
  final String templateName;

  /// The subject line of the custom verification email.
  final String templateSubject;

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
}

/// Represents the status of Amazon SES Easy DKIM signing for an identity. For
/// domain identities, this response also contains the DKIM tokens that are
/// required for Easy DKIM signing, and whether Amazon SES successfully verified
/// that these tokens were published.
class GetIdentityDkimAttributesResponse {
  /// The DKIM attributes for an email address or a domain.
  final Map<String, IdentityDkimAttributes> dkimAttributes;

  GetIdentityDkimAttributesResponse({
    @_s.required this.dkimAttributes,
  });
  factory GetIdentityDkimAttributesResponse.fromXml(_s.XmlElement elem) {
    return GetIdentityDkimAttributesResponse(
      dkimAttributes: Map.fromEntries(
        elem.getElement('DkimAttributes').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s
                    .extractXmlChild(c, 'value')
                    ?.let((e) => IdentityDkimAttributes.fromXml(e)),
              ),
            ),
      ),
    );
  }
}

/// Represents the custom MAIL FROM attributes for a list of identities.
class GetIdentityMailFromDomainAttributesResponse {
  /// A map of identities to custom MAIL FROM attributes.
  final Map<String, IdentityMailFromDomainAttributes> mailFromDomainAttributes;

  GetIdentityMailFromDomainAttributesResponse({
    @_s.required this.mailFromDomainAttributes,
  });
  factory GetIdentityMailFromDomainAttributesResponse.fromXml(
      _s.XmlElement elem) {
    return GetIdentityMailFromDomainAttributesResponse(
      mailFromDomainAttributes: Map.fromEntries(
        elem.getElement('MailFromDomainAttributes').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s
                    .extractXmlChild(c, 'value')
                    ?.let((e) => IdentityMailFromDomainAttributes.fromXml(e)),
              ),
            ),
      ),
    );
  }
}

/// Represents the notification attributes for a list of identities.
class GetIdentityNotificationAttributesResponse {
  /// A map of Identity to IdentityNotificationAttributes.
  final Map<String, IdentityNotificationAttributes> notificationAttributes;

  GetIdentityNotificationAttributesResponse({
    @_s.required this.notificationAttributes,
  });
  factory GetIdentityNotificationAttributesResponse.fromXml(
      _s.XmlElement elem) {
    return GetIdentityNotificationAttributesResponse(
      notificationAttributes: Map.fromEntries(
        elem.getElement('NotificationAttributes').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s
                    .extractXmlChild(c, 'value')
                    ?.let((e) => IdentityNotificationAttributes.fromXml(e)),
              ),
            ),
      ),
    );
  }
}

/// Represents the requested sending authorization policies.
class GetIdentityPoliciesResponse {
  /// A map of policy names to policies.
  final Map<String, String> policies;

  GetIdentityPoliciesResponse({
    @_s.required this.policies,
  });
  factory GetIdentityPoliciesResponse.fromXml(_s.XmlElement elem) {
    return GetIdentityPoliciesResponse(
      policies: Map.fromEntries(
        elem.getElement('Policies').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s.extractXmlStringValue(c, 'value'),
              ),
            ),
      ),
    );
  }
}

/// The Amazon SES verification status of a list of identities. For domain
/// identities, this response also contains the verification token.
class GetIdentityVerificationAttributesResponse {
  /// A map of Identities to IdentityVerificationAttributes objects.
  final Map<String, IdentityVerificationAttributes> verificationAttributes;

  GetIdentityVerificationAttributesResponse({
    @_s.required this.verificationAttributes,
  });
  factory GetIdentityVerificationAttributesResponse.fromXml(
      _s.XmlElement elem) {
    return GetIdentityVerificationAttributesResponse(
      verificationAttributes: Map.fromEntries(
        elem.getElement('VerificationAttributes').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s
                    .extractXmlChild(c, 'value')
                    ?.let((e) => IdentityVerificationAttributes.fromXml(e)),
              ),
            ),
      ),
    );
  }
}

/// Represents your Amazon SES daily sending quota, maximum send rate, and the
/// number of emails you have sent in the last 24 hours.
class GetSendQuotaResponse {
  /// The maximum number of emails the user is allowed to send in a 24-hour
  /// interval. A value of -1 signifies an unlimited quota.
  final double max24HourSend;

  /// The maximum number of emails that Amazon SES can accept from the user's
  /// account per second.
  /// <note>
  /// The rate at which Amazon SES accepts the user's messages might be less than
  /// the maximum send rate.
  /// </note>
  final double maxSendRate;

  /// The number of emails sent during the previous 24 hours.
  final double sentLast24Hours;

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
}

/// Represents a list of data points. This list contains aggregated data from
/// the previous two weeks of your sending activity with Amazon SES.
class GetSendStatisticsResponse {
  /// A list of data points, each of which represents 15 minutes of activity.
  final List<SendDataPoint> sendDataPoints;

  GetSendStatisticsResponse({
    this.sendDataPoints,
  });
  factory GetSendStatisticsResponse.fromXml(_s.XmlElement elem) {
    return GetSendStatisticsResponse(
      sendDataPoints: _s.extractXmlChild(elem, 'SendDataPoints')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => SendDataPoint.fromXml(c))
              .toList()),
    );
  }
}

class GetTemplateResponse {
  final Template template;

  GetTemplateResponse({
    this.template,
  });
  factory GetTemplateResponse.fromXml(_s.XmlElement elem) {
    return GetTemplateResponse(
      template:
          _s.extractXmlChild(elem, 'Template')?.let((e) => Template.fromXml(e)),
    );
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon
  /// SES Developer Guide</a>.
  final List<String> dkimTokens;

  IdentityDkimAttributes({
    @_s.required this.dkimEnabled,
    @_s.required this.dkimVerificationStatus,
    this.dkimTokens,
  });
  factory IdentityDkimAttributes.fromXml(_s.XmlElement elem) {
    return IdentityDkimAttributes(
      dkimEnabled: _s.extractXmlBoolValue(elem, 'DkimEnabled'),
      dkimVerificationStatus: _s
          .extractXmlStringValue(elem, 'DkimVerificationStatus')
          ?.toVerificationStatus(),
      dkimTokens: _s
          .extractXmlChild(elem, 'DkimTokens')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
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
    @_s.required this.behaviorOnMXFailure,
    @_s.required this.mailFromDomain,
    @_s.required this.mailFromDomainStatus,
  });
  factory IdentityMailFromDomainAttributes.fromXml(_s.XmlElement elem) {
    return IdentityMailFromDomainAttributes(
      behaviorOnMXFailure: _s
          .extractXmlStringValue(elem, 'BehaviorOnMXFailure')
          ?.toBehaviorOnMXFailure(),
      mailFromDomain: _s.extractXmlStringValue(elem, 'MailFromDomain'),
      mailFromDomainStatus: _s
          .extractXmlStringValue(elem, 'MailFromDomainStatus')
          ?.toCustomMailFromStatus(),
    );
  }
}

/// Represents the notification attributes of an identity, including whether an
/// identity has Amazon Simple Notification Service (Amazon SNS) topics set for
/// bounce, complaint, and/or delivery notifications, and whether feedback
/// forwarding is enabled for bounce and complaint notifications.
class IdentityNotificationAttributes {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will
  /// publish bounce notifications.
  final String bounceTopic;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will
  /// publish complaint notifications.
  final String complaintTopic;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will
  /// publish delivery notifications.
  final String deliveryTopic;

  /// Describes whether Amazon SES will forward bounce and complaint notifications
  /// as email. <code>true</code> indicates that Amazon SES will forward bounce
  /// and complaint notifications as email, while <code>false</code> indicates
  /// that bounce and complaint notifications will be published only to the
  /// specified bounce and complaint Amazon SNS topics.
  final bool forwardingEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type <code>Bounce</code>. A value of <code>true</code>
  /// specifies that Amazon SES will include headers in bounce notifications, and
  /// a value of <code>false</code> specifies that Amazon SES will not include
  /// headers in bounce notifications.
  final bool headersInBounceNotificationsEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type <code>Complaint</code>. A value of
  /// <code>true</code> specifies that Amazon SES will include headers in
  /// complaint notifications, and a value of <code>false</code> specifies that
  /// Amazon SES will not include headers in complaint notifications.
  final bool headersInComplaintNotificationsEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type <code>Delivery</code>. A value of
  /// <code>true</code> specifies that Amazon SES will include headers in delivery
  /// notifications, and a value of <code>false</code> specifies that Amazon SES
  /// will not include headers in delivery notifications.
  final bool headersInDeliveryNotificationsEnabled;

  IdentityNotificationAttributes({
    @_s.required this.bounceTopic,
    @_s.required this.complaintTopic,
    @_s.required this.deliveryTopic,
    @_s.required this.forwardingEnabled,
    this.headersInBounceNotificationsEnabled,
    this.headersInComplaintNotificationsEnabled,
    this.headersInDeliveryNotificationsEnabled,
  });
  factory IdentityNotificationAttributes.fromXml(_s.XmlElement elem) {
    return IdentityNotificationAttributes(
      bounceTopic: _s.extractXmlStringValue(elem, 'BounceTopic'),
      complaintTopic: _s.extractXmlStringValue(elem, 'ComplaintTopic'),
      deliveryTopic: _s.extractXmlStringValue(elem, 'DeliveryTopic'),
      forwardingEnabled: _s.extractXmlBoolValue(elem, 'ForwardingEnabled'),
      headersInBounceNotificationsEnabled:
          _s.extractXmlBoolValue(elem, 'HeadersInBounceNotificationsEnabled'),
      headersInComplaintNotificationsEnabled: _s.extractXmlBoolValue(
          elem, 'HeadersInComplaintNotificationsEnabled'),
      headersInDeliveryNotificationsEnabled:
          _s.extractXmlBoolValue(elem, 'HeadersInDeliveryNotificationsEnabled'),
    );
  }
}

enum IdentityType {
  @_s.JsonValue('EmailAddress')
  emailAddress,
  @_s.JsonValue('Domain')
  domain,
}

extension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.emailAddress:
        return 'EmailAddress';
      case IdentityType.domain:
        return 'Domain';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  IdentityType toIdentityType() {
    switch (this) {
      case 'EmailAddress':
        return IdentityType.emailAddress;
      case 'Domain':
        return IdentityType.domain;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the verification attributes of a single identity.
class IdentityVerificationAttributes {
  /// The verification status of the identity: "Pending", "Success", "Failed", or
  /// "TemporaryFailure".
  final VerificationStatus verificationStatus;

  /// The verification token for a domain identity. Null for email address
  /// identities.
  final String verificationToken;

  IdentityVerificationAttributes({
    @_s.required this.verificationStatus,
    this.verificationToken,
  });
  factory IdentityVerificationAttributes.fromXml(_s.XmlElement elem) {
    return IdentityVerificationAttributes(
      verificationStatus: _s
          .extractXmlStringValue(elem, 'VerificationStatus')
          ?.toVerificationStatus(),
      verificationToken: _s.extractXmlStringValue(elem, 'VerificationToken'),
    );
  }
}

enum InvocationType {
  @_s.JsonValue('Event')
  event,
  @_s.JsonValue('RequestResponse')
  requestResponse,
}

extension on String {
  InvocationType toInvocationType() {
    switch (this) {
      case 'Event':
        return InvocationType.event;
      case 'RequestResponse':
        return InvocationType.requestResponse;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the delivery stream ARN and the IAM role ARN associated with an
/// Amazon Kinesis Firehose event destination.
///
/// Event destinations, such as Amazon Kinesis Firehose, are associated with
/// configuration sets, which enable you to publish email sending events. For
/// information about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseDestination {
  /// The ARN of the Amazon Kinesis Firehose stream that email sending events
  /// should be published to.
  @_s.JsonKey(name: 'DeliveryStreamARN')
  final String deliveryStreamARN;

  /// The ARN of the IAM role under which Amazon SES publishes email sending
  /// events to the Amazon Kinesis Firehose stream.
  @_s.JsonKey(name: 'IAMRoleARN')
  final String iAMRoleARN;

  KinesisFirehoseDestination({
    @_s.required this.deliveryStreamARN,
    @_s.required this.iAMRoleARN,
  });
  factory KinesisFirehoseDestination.fromXml(_s.XmlElement elem) {
    return KinesisFirehoseDestination(
      deliveryStreamARN: _s.extractXmlStringValue(elem, 'DeliveryStreamARN'),
      iAMRoleARN: _s.extractXmlStringValue(elem, 'IAMRoleARN'),
    );
  }

  Map<String, dynamic> toJson() => _$KinesisFirehoseDestinationToJson(this);
}

/// When included in a receipt rule, this action calls an AWS Lambda function
/// and, optionally, publishes a notification to Amazon Simple Notification
/// Service (Amazon SNS).
///
/// To enable Amazon SES to call your AWS Lambda function or to publish to an
/// Amazon SNS topic of another account, Amazon SES must have permission to
/// access those resources. For information about giving permissions, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html">Amazon
/// SES Developer Guide</a>.
///
/// For information about using AWS Lambda actions in receipt rules, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-lambda.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaAction {
  /// The Amazon Resource Name (ARN) of the AWS Lambda function. An example of an
  /// AWS Lambda function ARN is
  /// <code>arn:aws:lambda:us-west-2:account-id:function:MyFunction</code>. For
  /// more information about AWS Lambda, see the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/welcome.html">AWS Lambda
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The invocation type of the AWS Lambda function. An invocation type of
  /// <code>RequestResponse</code> means that the execution of the function will
  /// immediately result in a response, and a value of <code>Event</code> means
  /// that the function will be invoked asynchronously. The default value is
  /// <code>Event</code>. For information about AWS Lambda invocation types, see
  /// the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html">AWS
  /// Lambda Developer Guide</a>.
  /// <important>
  /// There is a 30-second timeout on <code>RequestResponse</code> invocations.
  /// You should use <code>Event</code> invocation in most cases. Use
  /// <code>RequestResponse</code> only when you want to make a mail flow
  /// decision, such as whether to stop the receipt rule or the receipt rule set.
  /// </important>
  @_s.JsonKey(name: 'InvocationType')
  final InvocationType invocationType;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// Lambda action is taken. An example of an Amazon SNS topic ARN is
  /// <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more
  /// information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  LambdaAction({
    @_s.required this.functionArn,
    this.invocationType,
    this.topicArn,
  });
  factory LambdaAction.fromXml(_s.XmlElement elem) {
    return LambdaAction(
      functionArn: _s.extractXmlStringValue(elem, 'FunctionArn'),
      invocationType:
          _s.extractXmlStringValue(elem, 'InvocationType')?.toInvocationType(),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() => _$LambdaActionToJson(this);
}

/// A list of configuration sets associated with your AWS account. Configuration
/// sets enable you to publish email sending events. For information about using
/// configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
class ListConfigurationSetsResponse {
  /// A list of configuration sets.
  final List<ConfigurationSet> configurationSets;

  /// A token indicating that there are additional configuration sets available to
  /// be listed. Pass this token to successive calls of
  /// <code>ListConfigurationSets</code>.
  final String nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });
  factory ListConfigurationSetsResponse.fromXml(_s.XmlElement elem) {
    return ListConfigurationSetsResponse(
      configurationSets: _s.extractXmlChild(elem, 'ConfigurationSets')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => ConfigurationSet.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// A paginated list of custom verification email templates.
class ListCustomVerificationEmailTemplatesResponse {
  /// A list of the custom verification email templates that exist in your
  /// account.
  final List<CustomVerificationEmailTemplate> customVerificationEmailTemplates;

  /// A token indicating that there are additional custom verification email
  /// templates available to be listed. Pass this token to a subsequent call to
  /// <code>ListTemplates</code> to retrieve the next 50 custom verification email
  /// templates.
  final String nextToken;

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
              .map((c) => CustomVerificationEmailTemplate.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// A list of all identities that you have attempted to verify under your AWS
/// account, regardless of verification status.
class ListIdentitiesResponse {
  /// A list of identities.
  final List<String> identities;

  /// The token used for pagination.
  final String nextToken;

  ListIdentitiesResponse({
    @_s.required this.identities,
    this.nextToken,
  });
  factory ListIdentitiesResponse.fromXml(_s.XmlElement elem) {
    return ListIdentitiesResponse(
      identities: _s
          .extractXmlChild(elem, 'Identities')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// A list of names of sending authorization policies that apply to an identity.
class ListIdentityPoliciesResponse {
  /// A list of names of policies that apply to the specified identity.
  final List<String> policyNames;

  ListIdentityPoliciesResponse({
    @_s.required this.policyNames,
  });
  factory ListIdentityPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListIdentityPoliciesResponse(
      policyNames: _s
          .extractXmlChild(elem, 'PolicyNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// A list of IP address filters that exist under your AWS account.
class ListReceiptFiltersResponse {
  /// A list of IP address filter data structures, which each consist of a name,
  /// an IP address range, and whether to allow or block mail from it.
  final List<ReceiptFilter> filters;

  ListReceiptFiltersResponse({
    this.filters,
  });
  factory ListReceiptFiltersResponse.fromXml(_s.XmlElement elem) {
    return ListReceiptFiltersResponse(
      filters: _s.extractXmlChild(elem, 'Filters')?.let((elem) => elem
          .findElements('member')
          .map((c) => ReceiptFilter.fromXml(c))
          .toList()),
    );
  }
}

/// A list of receipt rule sets that exist under your AWS account.
class ListReceiptRuleSetsResponse {
  /// A token indicating that there are additional receipt rule sets available to
  /// be listed. Pass this token to successive calls of
  /// <code>ListReceiptRuleSets</code> to retrieve up to 100 receipt rule sets at
  /// a time.
  final String nextToken;

  /// The metadata for the currently active receipt rule set. The metadata
  /// consists of the rule set name and the timestamp of when the rule set was
  /// created.
  final List<ReceiptRuleSetMetadata> ruleSets;

  ListReceiptRuleSetsResponse({
    this.nextToken,
    this.ruleSets,
  });
  factory ListReceiptRuleSetsResponse.fromXml(_s.XmlElement elem) {
    return ListReceiptRuleSetsResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      ruleSets: _s.extractXmlChild(elem, 'RuleSets')?.let((elem) => elem
          .findElements('member')
          .map((c) => ReceiptRuleSetMetadata.fromXml(c))
          .toList()),
    );
  }
}

class ListTemplatesResponse {
  /// A token indicating that there are additional email templates available to be
  /// listed. Pass this token to a subsequent call to <code>ListTemplates</code>
  /// to retrieve the next 50 email templates.
  final String nextToken;

  /// An array the contains the name and creation time stamp for each template in
  /// your Amazon SES account.
  final List<TemplateMetadata> templatesMetadata;

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
              .map((c) => TemplateMetadata.fromXml(c))
              .toList()),
    );
  }
}

/// A list of email addresses that you have verified with Amazon SES under your
/// AWS account.
class ListVerifiedEmailAddressesResponse {
  /// A list of email addresses that have been verified.
  final List<String> verifiedEmailAddresses;

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
}

/// Represents the message to be sent, composed of a subject and a body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Message {
  /// The message body.
  @_s.JsonKey(name: 'Body')
  final Body body;

  /// The subject of the message: A short summary of the content, which will
  /// appear in the recipient's inbox.
  @_s.JsonKey(name: 'Subject')
  final Content subject;

  Message({
    @_s.required this.body,
    @_s.required this.subject,
  });
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// Message-related information to include in the Delivery Status Notification
/// (DSN) when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MessageDsn {
  /// The reporting MTA that attempted to deliver the message, formatted as
  /// specified in <a href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>
  /// (<code>mta-name-type; mta-name</code>). The default value is <code>dns;
  /// inbound-smtp.[region].amazonaws.com</code>.
  @_s.JsonKey(name: 'ReportingMta')
  final String reportingMta;

  /// When the message was received by the reporting mail transfer agent (MTA), in
  /// <a href="https://www.ietf.org/rfc/rfc0822.txt">RFC 822</a> date-time format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'ArrivalDate')
  final DateTime arrivalDate;

  /// Additional X-headers to include in the DSN.
  @_s.JsonKey(name: 'ExtensionFields')
  final List<ExtensionField> extensionFields;

  MessageDsn({
    @_s.required this.reportingMta,
    this.arrivalDate,
    this.extensionFields,
  });
  Map<String, dynamic> toJson() => _$MessageDsnToJson(this);
}

/// Contains the name and value of a tag that you can provide to
/// <code>SendEmail</code> or <code>SendRawEmail</code> to apply to an email.
///
/// Message tags, which you use with configuration sets, enable you to publish
/// email sending events. For information about using configuration sets, see
/// the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MessageTag {
  /// The name of the tag. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Contain less than 256 characters.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the tag. The value must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Contain less than 256 characters.
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

enum NotificationType {
  @_s.JsonValue('Bounce')
  bounce,
  @_s.JsonValue('Complaint')
  complaint,
  @_s.JsonValue('Delivery')
  delivery,
}

extension on NotificationType {
  String toValue() {
    switch (this) {
      case NotificationType.bounce:
        return 'Bounce';
      case NotificationType.complaint:
        return 'Complaint';
      case NotificationType.delivery:
        return 'Delivery';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  NotificationType toNotificationType() {
    switch (this) {
      case 'Bounce':
        return NotificationType.bounce;
      case 'Complaint':
        return NotificationType.complaint;
      case 'Delivery':
        return NotificationType.delivery;
    }
    throw Exception('Unknown enum value: $this');
  }
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
}

/// An empty element returned on a successful request.
class PutIdentityPolicyResponse {
  PutIdentityPolicyResponse();
  factory PutIdentityPolicyResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutIdentityPolicyResponse();
  }
}

/// Represents the raw data of the message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RawMessage {
  /// The raw data of the message. This data needs to base64-encoded if you are
  /// accessing Amazon SES directly through the HTTPS interface. If you are
  /// accessing Amazon SES using an AWS SDK, the SDK takes care of the base
  /// 64-encoding for you. In all cases, the client must ensure that the message
  /// format complies with Internet email standards regarding email header fields,
  /// MIME types, and MIME encoding.
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html">Amazon
  /// SES Developer Guide</a>.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Data')
  final Uint8List data;

  RawMessage({
    @_s.required this.data,
  });
  Map<String, dynamic> toJson() => _$RawMessageToJson(this);
}

/// An action that Amazon SES can take when it receives an email on behalf of
/// one or more email addresses or domains that you own. An instance of this
/// data type can represent only one action.
///
/// For information about setting up receipt rules, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReceiptAction {
  /// Adds a header to the received email.
  @_s.JsonKey(name: 'AddHeaderAction')
  final AddHeaderAction addHeaderAction;

  /// Rejects the received email by returning a bounce response to the sender and,
  /// optionally, publishes a notification to Amazon Simple Notification Service
  /// (Amazon SNS).
  @_s.JsonKey(name: 'BounceAction')
  final BounceAction bounceAction;

  /// Calls an AWS Lambda function, and optionally, publishes a notification to
  /// Amazon SNS.
  @_s.JsonKey(name: 'LambdaAction')
  final LambdaAction lambdaAction;

  /// Saves the received message to an Amazon Simple Storage Service (Amazon S3)
  /// bucket and, optionally, publishes a notification to Amazon SNS.
  @_s.JsonKey(name: 'S3Action')
  final S3Action s3Action;

  /// Publishes the email content within a notification to Amazon SNS.
  @_s.JsonKey(name: 'SNSAction')
  final SNSAction sNSAction;

  /// Terminates the evaluation of the receipt rule set and optionally publishes a
  /// notification to Amazon SNS.
  @_s.JsonKey(name: 'StopAction')
  final StopAction stopAction;

  /// Calls Amazon WorkMail and, optionally, publishes a notification to Amazon
  /// Amazon SNS.
  @_s.JsonKey(name: 'WorkmailAction')
  final WorkmailAction workmailAction;

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
          ?.let((e) => AddHeaderAction.fromXml(e)),
      bounceAction: _s
          .extractXmlChild(elem, 'BounceAction')
          ?.let((e) => BounceAction.fromXml(e)),
      lambdaAction: _s
          .extractXmlChild(elem, 'LambdaAction')
          ?.let((e) => LambdaAction.fromXml(e)),
      s3Action:
          _s.extractXmlChild(elem, 'S3Action')?.let((e) => S3Action.fromXml(e)),
      sNSAction: _s
          .extractXmlChild(elem, 'SNSAction')
          ?.let((e) => SNSAction.fromXml(e)),
      stopAction: _s
          .extractXmlChild(elem, 'StopAction')
          ?.let((e) => StopAction.fromXml(e)),
      workmailAction: _s
          .extractXmlChild(elem, 'WorkmailAction')
          ?.let((e) => WorkmailAction.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() => _$ReceiptActionToJson(this);
}

/// A receipt IP address filter enables you to specify whether to accept or
/// reject mail originating from an IP address or range of IP addresses.
///
/// For information about setting up IP address filters, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReceiptFilter {
  /// A structure that provides the IP addresses to block or allow, and whether to
  /// block or allow incoming mail from them.
  @_s.JsonKey(name: 'IpFilter')
  final ReceiptIpFilter ipFilter;

  /// The name of the IP address filter. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain less than 64 characters.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Name')
  final String name;

  ReceiptFilter({
    @_s.required this.ipFilter,
    @_s.required this.name,
  });
  factory ReceiptFilter.fromXml(_s.XmlElement elem) {
    return ReceiptFilter(
      ipFilter: _s
          .extractXmlChild(elem, 'IpFilter')
          ?.let((e) => ReceiptIpFilter.fromXml(e)),
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() => _$ReceiptFilterToJson(this);
}

enum ReceiptFilterPolicy {
  @_s.JsonValue('Block')
  block,
  @_s.JsonValue('Allow')
  allow,
}

extension on String {
  ReceiptFilterPolicy toReceiptFilterPolicy() {
    switch (this) {
      case 'Block':
        return ReceiptFilterPolicy.block;
      case 'Allow':
        return ReceiptFilterPolicy.allow;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A receipt IP address filter enables you to specify whether to accept or
/// reject mail originating from an IP address or range of IP addresses.
///
/// For information about setting up IP address filters, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReceiptIpFilter {
  /// A single IP address or a range of IP addresses that you want to block or
  /// allow, specified in Classless Inter-Domain Routing (CIDR) notation. An
  /// example of a single email address is 10.0.0.1. An example of a range of IP
  /// addresses is 10.0.0.1/24. For more information about CIDR notation, see <a
  /// href="https://tools.ietf.org/html/rfc2317">RFC 2317</a>.
  @_s.JsonKey(name: 'Cidr')
  final String cidr;

  /// Indicates whether to block or allow incoming mail from the specified IP
  /// addresses.
  @_s.JsonKey(name: 'Policy')
  final ReceiptFilterPolicy policy;

  ReceiptIpFilter({
    @_s.required this.cidr,
    @_s.required this.policy,
  });
  factory ReceiptIpFilter.fromXml(_s.XmlElement elem) {
    return ReceiptIpFilter(
      cidr: _s.extractXmlStringValue(elem, 'Cidr'),
      policy: _s.extractXmlStringValue(elem, 'Policy')?.toReceiptFilterPolicy(),
    );
  }

  Map<String, dynamic> toJson() => _$ReceiptIpFilterToJson(this);
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
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReceiptRule {
  /// The name of the receipt rule. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain less than 64 characters.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An ordered list of actions to perform on messages that match at least one of
  /// the recipient email addresses or domains specified in the receipt rule.
  @_s.JsonKey(name: 'Actions')
  final List<ReceiptAction> actions;

  /// If <code>true</code>, the receipt rule is active. The default value is
  /// <code>false</code>.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The recipient domains and email addresses that the receipt rule applies to.
  /// If this field is not specified, this rule will match all recipients under
  /// all verified domains.
  @_s.JsonKey(name: 'Recipients')
  final List<String> recipients;

  /// If <code>true</code>, then messages that this receipt rule applies to are
  /// scanned for spam and viruses. The default value is <code>false</code>.
  @_s.JsonKey(name: 'ScanEnabled')
  final bool scanEnabled;

  /// Specifies whether Amazon SES should require that incoming email is delivered
  /// over a connection encrypted with Transport Layer Security (TLS). If this
  /// parameter is set to <code>Require</code>, Amazon SES will bounce emails that
  /// are not received over TLS. The default is <code>Optional</code>.
  @_s.JsonKey(name: 'TlsPolicy')
  final TlsPolicy tlsPolicy;

  ReceiptRule({
    @_s.required this.name,
    this.actions,
    this.enabled,
    this.recipients,
    this.scanEnabled,
    this.tlsPolicy,
  });
  factory ReceiptRule.fromXml(_s.XmlElement elem) {
    return ReceiptRule(
      name: _s.extractXmlStringValue(elem, 'Name'),
      actions: _s.extractXmlChild(elem, 'Actions')?.let((elem) => elem
          .findElements('member')
          .map((c) => ReceiptAction.fromXml(c))
          .toList()),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      recipients: _s
          .extractXmlChild(elem, 'Recipients')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      scanEnabled: _s.extractXmlBoolValue(elem, 'ScanEnabled'),
      tlsPolicy: _s.extractXmlStringValue(elem, 'TlsPolicy')?.toTlsPolicy(),
    );
  }

  Map<String, dynamic> toJson() => _$ReceiptRuleToJson(this);
}

/// Information about a receipt rule set.
///
/// A receipt rule set is a collection of rules that specify what Amazon SES
/// should do with mail it receives on behalf of your account's verified
/// domains.
///
/// For information about setting up receipt rule sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon
/// SES Developer Guide</a>.
class ReceiptRuleSetMetadata {
  /// The date and time the receipt rule set was created.
  final DateTime createdTimestamp;

  /// The name of the receipt rule set. The name must:
  ///
  /// <ul>
  /// <li>
  /// This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  /// </li>
  /// <li>
  /// Start and end with a letter or number.
  /// </li>
  /// <li>
  /// Contain less than 64 characters.
  /// </li>
  /// </ul>
  final String name;

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
}

/// Recipient-related information to include in the Delivery Status Notification
/// (DSN) when an email that Amazon SES receives on your behalf bounces.
///
/// For information about receiving email through Amazon SES, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RecipientDsnFields {
  /// The action performed by the reporting mail transfer agent (MTA) as a result
  /// of its attempt to deliver the message to the recipient address. This is
  /// required by <a href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>.
  @_s.JsonKey(name: 'Action')
  final DsnAction action;

  /// The status code that indicates what went wrong. This is required by <a
  /// href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// An extended explanation of what went wrong; this is usually an SMTP
  /// response. See <a href="https://tools.ietf.org/html/rfc3463">RFC 3463</a> for
  /// the correct formatting of this parameter.
  @_s.JsonKey(name: 'DiagnosticCode')
  final String diagnosticCode;

  /// Additional X-headers to include in the DSN.
  @_s.JsonKey(name: 'ExtensionFields')
  final List<ExtensionField> extensionFields;

  /// The email address that the message was ultimately delivered to. This
  /// corresponds to the <code>Final-Recipient</code> in the DSN. If not
  /// specified, <code>FinalRecipient</code> will be set to the
  /// <code>Recipient</code> specified in the <code>BouncedRecipientInfo</code>
  /// structure. Either <code>FinalRecipient</code> or the recipient in
  /// <code>BouncedRecipientInfo</code> must be a recipient of the original
  /// bounced message.
  /// <note>
  /// Do not prepend the <code>FinalRecipient</code> email address with <code>rfc
  /// 822;</code>, as described in <a
  /// href="https://tools.ietf.org/html/rfc3798">RFC 3798</a>.
  /// </note>
  @_s.JsonKey(name: 'FinalRecipient')
  final String finalRecipient;

  /// The time the final delivery attempt was made, in <a
  /// href="https://www.ietf.org/rfc/rfc0822.txt">RFC 822</a> date-time format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'LastAttemptDate')
  final DateTime lastAttemptDate;

  /// The MTA to which the remote MTA attempted to deliver the message, formatted
  /// as specified in <a href="https://tools.ietf.org/html/rfc3464">RFC 3464</a>
  /// (<code>mta-name-type; mta-name</code>). This parameter typically applies
  /// only to propagating synchronous bounces.
  @_s.JsonKey(name: 'RemoteMta')
  final String remoteMta;

  RecipientDsnFields({
    @_s.required this.action,
    @_s.required this.status,
    this.diagnosticCode,
    this.extensionFields,
    this.finalRecipient,
    this.lastAttemptDate,
    this.remoteMta,
  });
  Map<String, dynamic> toJson() => _$RecipientDsnFieldsToJson(this);
}

/// An empty element returned on a successful request.
class ReorderReceiptRuleSetResponse {
  ReorderReceiptRuleSetResponse();
  factory ReorderReceiptRuleSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ReorderReceiptRuleSetResponse();
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
  final DateTime lastFreshStart;

  /// Describes whether or not Amazon SES publishes reputation metrics for the
  /// configuration set, such as bounce and complaint rates, to Amazon CloudWatch.
  ///
  /// If the value is <code>true</code>, reputation metrics are published. If the
  /// value is <code>false</code>, reputation metrics are not published. The
  /// default value is <code>false</code>.
  final bool reputationMetricsEnabled;

  /// Describes whether email sending is enabled or disabled for the configuration
  /// set. If the value is <code>true</code>, then Amazon SES will send emails
  /// that use the configuration set. If the value is <code>false</code>, Amazon
  /// SES will not send emails that use the configuration set. The default value
  /// is <code>true</code>. You can change this setting using
  /// <a>UpdateConfigurationSetSendingEnabled</a>.
  final bool sendingEnabled;

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
}

/// When included in a receipt rule, this action saves the received message to
/// an Amazon Simple Storage Service (Amazon S3) bucket and, optionally,
/// publishes a notification to Amazon Simple Notification Service (Amazon SNS).
///
/// To enable Amazon SES to write emails to your Amazon S3 bucket, use an AWS
/// KMS key to encrypt your emails, or publish to an Amazon SNS topic of another
/// account, Amazon SES must have permission to access those resources. For
/// information about giving permissions, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html">Amazon
/// SES Developer Guide</a>.
/// <note>
/// When you save your emails to an Amazon S3 bucket, the maximum email size
/// (including headers) is 30 MB. Emails larger than that will bounce.
/// </note>
/// For information about specifying Amazon S3 actions in receipt rules, see the
/// <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-s3.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3Action {
  /// The name of the Amazon S3 bucket that incoming email will be saved to.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// The customer master key that Amazon SES should use to encrypt your emails
  /// before saving them to the Amazon S3 bucket. You can use the default master
  /// key or a custom master key you created in AWS KMS as follows:
  ///
  /// <ul>
  /// <li>
  /// To use the default master key, provide an ARN in the form of
  /// <code>arn:aws:kms:REGION:ACCOUNT-ID-WITHOUT-HYPHENS:alias/aws/ses</code>.
  /// For example, if your AWS account ID is 123456789012 and you want to use the
  /// default master key in the US West (Oregon) region, the ARN of the default
  /// master key would be
  /// <code>arn:aws:kms:us-west-2:123456789012:alias/aws/ses</code>. If you use
  /// the default master key, you don't need to perform any extra steps to give
  /// Amazon SES permission to use the key.
  /// </li>
  /// <li>
  /// To use a custom master key you created in AWS KMS, provide the ARN of the
  /// master key and ensure that you add a statement to your key's policy to give
  /// Amazon SES permission to use it. For more information about giving
  /// permissions, see the <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html">Amazon
  /// SES Developer Guide</a>.
  /// </li>
  /// </ul>
  /// For more information about key policies, see the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html">AWS
  /// KMS Developer Guide</a>. If you do not specify a master key, Amazon SES will
  /// not encrypt your emails.
  /// <important>
  /// Your mail is encrypted by Amazon SES using the Amazon S3 encryption client
  /// before the mail is submitted to Amazon S3 for storage. It is not encrypted
  /// using Amazon S3 server-side encryption. This means that you must use the
  /// Amazon S3 encryption client to decrypt the email after retrieving it from
  /// Amazon S3, as the service has no access to use your AWS KMS keys for
  /// decryption. This encryption client is currently available with the <a
  /// href="http://aws.amazon.com/sdk-for-java/">AWS SDK for Java</a> and <a
  /// href="http://aws.amazon.com/sdk-for-ruby/">AWS SDK for Ruby</a> only. For
  /// more information about client-side encryption using AWS KMS master keys, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 Developer Guide</a>.
  /// </important>
  @_s.JsonKey(name: 'KmsKeyArn')
  final String kmsKeyArn;

  /// The key prefix of the Amazon S3 bucket. The key prefix is similar to a
  /// directory name that enables you to store similar data under the same
  /// directory in a bucket.
  @_s.JsonKey(name: 'ObjectKeyPrefix')
  final String objectKeyPrefix;

  /// The ARN of the Amazon SNS topic to notify when the message is saved to the
  /// Amazon S3 bucket. An example of an Amazon SNS topic ARN is
  /// <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more
  /// information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  S3Action({
    @_s.required this.bucketName,
    this.kmsKeyArn,
    this.objectKeyPrefix,
    this.topicArn,
  });
  factory S3Action.fromXml(_s.XmlElement elem) {
    return S3Action(
      bucketName: _s.extractXmlStringValue(elem, 'BucketName'),
      kmsKeyArn: _s.extractXmlStringValue(elem, 'KmsKeyArn'),
      objectKeyPrefix: _s.extractXmlStringValue(elem, 'ObjectKeyPrefix'),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() => _$S3ActionToJson(this);
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
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html">Amazon
/// SES Developer Guide</a>.
/// <important>
/// You can only publish emails that are 150 KB or less (including the header)
/// to Amazon SNS. Larger emails will bounce. If you anticipate emails larger
/// than 150 KB, use the S3 action instead.
/// </important>
/// For information about using a receipt rule to publish an Amazon SNS
/// notification, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-sns.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SNSAction {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. An example
  /// of an Amazon SNS topic ARN is
  /// <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more
  /// information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  /// The encoding to use for the email within the Amazon SNS notification. UTF-8
  /// is easier to use, but may not preserve all special characters when a message
  /// was encoded with a different encoding format. Base64 preserves all special
  /// characters. The default value is UTF-8.
  @_s.JsonKey(name: 'Encoding')
  final SNSActionEncoding encoding;

  SNSAction({
    @_s.required this.topicArn,
    this.encoding,
  });
  factory SNSAction.fromXml(_s.XmlElement elem) {
    return SNSAction(
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
      encoding:
          _s.extractXmlStringValue(elem, 'Encoding')?.toSNSActionEncoding(),
    );
  }

  Map<String, dynamic> toJson() => _$SNSActionToJson(this);
}

enum SNSActionEncoding {
  @_s.JsonValue('UTF-8')
  utf_8,
  @_s.JsonValue('Base64')
  base64,
}

extension on String {
  SNSActionEncoding toSNSActionEncoding() {
    switch (this) {
      case 'UTF-8':
        return SNSActionEncoding.utf_8;
      case 'Base64':
        return SNSActionEncoding.base64;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the topic ARN associated with an Amazon Simple Notification Service
/// (Amazon SNS) event destination.
///
/// Event destinations, such as Amazon SNS, are associated with configuration
/// sets, which enable you to publish email sending events. For information
/// about using configuration sets, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SNSDestination {
  /// The ARN of the Amazon SNS topic that email sending events will be published
  /// to. An example of an Amazon SNS topic ARN is
  /// <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more
  /// information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicARN')
  final String topicARN;

  SNSDestination({
    @_s.required this.topicARN,
  });
  factory SNSDestination.fromXml(_s.XmlElement elem) {
    return SNSDestination(
      topicARN: _s.extractXmlStringValue(elem, 'TopicARN'),
    );
  }

  Map<String, dynamic> toJson() => _$SNSDestinationToJson(this);
}

/// Represents a unique message ID.
class SendBounceResponse {
  /// The message ID of the bounce message.
  final String messageId;

  SendBounceResponse({
    this.messageId,
  });
  factory SendBounceResponse.fromXml(_s.XmlElement elem) {
    return SendBounceResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
    );
  }
}

class SendBulkTemplatedEmailResponse {
  /// The unique message identifier returned from the
  /// <code>SendBulkTemplatedEmail</code> action.
  final List<BulkEmailDestinationStatus> status;

  SendBulkTemplatedEmailResponse({
    @_s.required this.status,
  });
  factory SendBulkTemplatedEmailResponse.fromXml(_s.XmlElement elem) {
    return SendBulkTemplatedEmailResponse(
      status: _s.extractXmlChild(elem, 'Status')?.let((elem) => elem
          .findElements('member')
          .map((c) => BulkEmailDestinationStatus.fromXml(c))
          .toList()),
    );
  }
}

/// The response received when attempting to send the custom verification email.
class SendCustomVerificationEmailResponse {
  /// The unique message identifier returned from the
  /// <code>SendCustomVerificationEmail</code> operation.
  final String messageId;

  SendCustomVerificationEmailResponse({
    this.messageId,
  });
  factory SendCustomVerificationEmailResponse.fromXml(_s.XmlElement elem) {
    return SendCustomVerificationEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
    );
  }
}

/// Represents sending statistics data. Each <code>SendDataPoint</code> contains
/// statistics for a 15-minute period of sending activity.
class SendDataPoint {
  /// Number of emails that have bounced.
  final int bounces;

  /// Number of unwanted emails that were rejected by recipients.
  final int complaints;

  /// Number of emails that have been sent.
  final int deliveryAttempts;

  /// Number of emails rejected by Amazon SES.
  final int rejects;

  /// Time of the data point.
  final DateTime timestamp;

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
}

/// Represents a unique message ID.
class SendEmailResponse {
  /// The unique message identifier returned from the <code>SendEmail</code>
  /// action.
  final String messageId;

  SendEmailResponse({
    @_s.required this.messageId,
  });
  factory SendEmailResponse.fromXml(_s.XmlElement elem) {
    return SendEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
    );
  }
}

/// Represents a unique message ID.
class SendRawEmailResponse {
  /// The unique message identifier returned from the <code>SendRawEmail</code>
  /// action.
  final String messageId;

  SendRawEmailResponse({
    @_s.required this.messageId,
  });
  factory SendRawEmailResponse.fromXml(_s.XmlElement elem) {
    return SendRawEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
    );
  }
}

class SendTemplatedEmailResponse {
  /// The unique message identifier returned from the
  /// <code>SendTemplatedEmail</code> action.
  final String messageId;

  SendTemplatedEmailResponse({
    @_s.required this.messageId,
  });
  factory SendTemplatedEmailResponse.fromXml(_s.XmlElement elem) {
    return SendTemplatedEmailResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
    );
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
}

/// An empty element returned on a successful request.
class SetIdentityDkimEnabledResponse {
  SetIdentityDkimEnabledResponse();
  factory SetIdentityDkimEnabledResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityDkimEnabledResponse();
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
}

/// An empty element returned on a successful request.
class SetIdentityHeadersInNotificationsEnabledResponse {
  SetIdentityHeadersInNotificationsEnabledResponse();
  factory SetIdentityHeadersInNotificationsEnabledResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityHeadersInNotificationsEnabledResponse();
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
}

/// An empty element returned on a successful request.
class SetIdentityNotificationTopicResponse {
  SetIdentityNotificationTopicResponse();
  factory SetIdentityNotificationTopicResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetIdentityNotificationTopicResponse();
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
}

/// When included in a receipt rule, this action terminates the evaluation of
/// the receipt rule set and, optionally, publishes a notification to Amazon
/// Simple Notification Service (Amazon SNS).
///
/// For information about setting a stop action in a receipt rule, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-stop.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StopAction {
  /// The scope of the StopAction. The only acceptable value is
  /// <code>RuleSet</code>.
  @_s.JsonKey(name: 'Scope')
  final StopScope scope;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// stop action is taken. An example of an Amazon SNS topic ARN is
  /// <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more
  /// information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  StopAction({
    @_s.required this.scope,
    this.topicArn,
  });
  factory StopAction.fromXml(_s.XmlElement elem) {
    return StopAction(
      scope: _s.extractXmlStringValue(elem, 'Scope')?.toStopScope(),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() => _$StopActionToJson(this);
}

enum StopScope {
  @_s.JsonValue('RuleSet')
  ruleSet,
}

extension on String {
  StopScope toStopScope() {
    switch (this) {
      case 'RuleSet':
        return StopScope.ruleSet;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The content of the email, composed of a subject line, an HTML part, and a
/// text-only part.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Template {
  /// The name of the template. You will refer to this name when you send email
  /// using the <code>SendTemplatedEmail</code> or
  /// <code>SendBulkTemplatedEmail</code> operations.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The HTML body of the email.
  @_s.JsonKey(name: 'HtmlPart')
  final String htmlPart;

  /// The subject line of the email.
  @_s.JsonKey(name: 'SubjectPart')
  final String subjectPart;

  /// The email body that will be visible to recipients whose email clients do not
  /// display HTML.
  @_s.JsonKey(name: 'TextPart')
  final String textPart;

  Template({
    @_s.required this.templateName,
    this.htmlPart,
    this.subjectPart,
    this.textPart,
  });
  factory Template.fromXml(_s.XmlElement elem) {
    return Template(
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
      htmlPart: _s.extractXmlStringValue(elem, 'HtmlPart'),
      subjectPart: _s.extractXmlStringValue(elem, 'SubjectPart'),
      textPart: _s.extractXmlStringValue(elem, 'TextPart'),
    );
  }

  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

/// Contains information about an email template.
class TemplateMetadata {
  /// The time and date the template was created.
  final DateTime createdTimestamp;

  /// The name of the template.
  final String name;

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
}

class TestRenderTemplateResponse {
  /// The complete MIME message rendered by applying the data in the TemplateData
  /// parameter to the template specified in the TemplateName parameter.
  final String renderedTemplate;

  TestRenderTemplateResponse({
    this.renderedTemplate,
  });
  factory TestRenderTemplateResponse.fromXml(_s.XmlElement elem) {
    return TestRenderTemplateResponse(
      renderedTemplate: _s.extractXmlStringValue(elem, 'RenderedTemplate'),
    );
  }
}

enum TlsPolicy {
  @_s.JsonValue('Require')
  require,
  @_s.JsonValue('Optional')
  optional,
}

extension on String {
  TlsPolicy toTlsPolicy() {
    switch (this) {
      case 'Require':
        return TlsPolicy.require;
      case 'Optional':
        return TlsPolicy.optional;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A domain that is used to redirect email recipients to an Amazon SES-operated
/// domain. This domain captures open and click events generated by Amazon SES
/// emails.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Configuring
/// Custom Domains to Handle Open and Click Tracking</a> in the <i>Amazon SES
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TrackingOptions {
  /// The custom subdomain that will be used to redirect email recipients to the
  /// Amazon SES event tracking domain.
  @_s.JsonKey(name: 'CustomRedirectDomain')
  final String customRedirectDomain;

  TrackingOptions({
    this.customRedirectDomain,
  });
  factory TrackingOptions.fromXml(_s.XmlElement elem) {
    return TrackingOptions(
      customRedirectDomain:
          _s.extractXmlStringValue(elem, 'CustomRedirectDomain'),
    );
  }

  Map<String, dynamic> toJson() => _$TrackingOptionsToJson(this);
}

/// An empty element returned on a successful request.
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();
  factory UpdateConfigurationSetEventDestinationResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateConfigurationSetEventDestinationResponse();
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
}

/// An empty element returned on a successful request.
class UpdateReceiptRuleResponse {
  UpdateReceiptRuleResponse();
  factory UpdateReceiptRuleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateReceiptRuleResponse();
  }
}

class UpdateTemplateResponse {
  UpdateTemplateResponse();
  factory UpdateTemplateResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateTemplateResponse();
  }
}

enum VerificationStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('TemporaryFailure')
  temporaryFailure,
  @_s.JsonValue('NotStarted')
  notStarted,
}

extension on String {
  VerificationStatus toVerificationStatus() {
    switch (this) {
      case 'Pending':
        return VerificationStatus.pending;
      case 'Success':
        return VerificationStatus.success;
      case 'Failed':
        return VerificationStatus.failed;
      case 'TemporaryFailure':
        return VerificationStatus.temporaryFailure;
      case 'NotStarted':
        return VerificationStatus.notStarted;
    }
    throw Exception('Unknown enum value: $this');
  }
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
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon
  /// SES Developer Guide</a>.
  final List<String> dkimTokens;

  VerifyDomainDkimResponse({
    @_s.required this.dkimTokens,
  });
  factory VerifyDomainDkimResponse.fromXml(_s.XmlElement elem) {
    return VerifyDomainDkimResponse(
      dkimTokens: _s
          .extractXmlChild(elem, 'DkimTokens')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
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
  /// that case, if you still want to verify the domain, you must restart the
  /// verification process from the beginning.
  final String verificationToken;

  VerifyDomainIdentityResponse({
    @_s.required this.verificationToken,
  });
  factory VerifyDomainIdentityResponse.fromXml(_s.XmlElement elem) {
    return VerifyDomainIdentityResponse(
      verificationToken: _s.extractXmlStringValue(elem, 'VerificationToken'),
    );
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
}

/// When included in a receipt rule, this action calls Amazon WorkMail and,
/// optionally, publishes a notification to Amazon Simple Notification Service
/// (Amazon SNS). You will typically not use this action directly because Amazon
/// WorkMail adds the rule automatically during its setup procedure.
///
/// For information using a receipt rule to call Amazon WorkMail, see the <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-workmail.html">Amazon
/// SES Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WorkmailAction {
  /// The ARN of the Amazon WorkMail organization. An example of an Amazon
  /// WorkMail organization ARN is
  /// <code>arn:aws:workmail:us-west-2:123456789012:organization/m-68755160c4cb4e29a2b2f8fb58f359d7</code>.
  /// For information about Amazon WorkMail organizations, see the <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/organizations_overview.html">Amazon
  /// WorkMail Administrator Guide</a>.
  @_s.JsonKey(name: 'OrganizationArn')
  final String organizationArn;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// WorkMail action is called. An example of an Amazon SNS topic ARN is
  /// <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more
  /// information about Amazon SNS topics, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  WorkmailAction({
    @_s.required this.organizationArn,
    this.topicArn,
  });
  factory WorkmailAction.fromXml(_s.XmlElement elem) {
    return WorkmailAction(
      organizationArn: _s.extractXmlStringValue(elem, 'OrganizationArn'),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() => _$WorkmailActionToJson(this);
}

class AccountSendingPausedException extends _s.GenericAwsException {
  AccountSendingPausedException({String type, String message})
      : super(
            type: type,
            code: 'AccountSendingPausedException',
            message: message);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class CannotDeleteException extends _s.GenericAwsException {
  CannotDeleteException({String type, String message})
      : super(type: type, code: 'CannotDeleteException', message: message);
}

class ConfigurationSetAlreadyExistsException extends _s.GenericAwsException {
  ConfigurationSetAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ConfigurationSetAlreadyExistsException',
            message: message);
}

class ConfigurationSetDoesNotExistException extends _s.GenericAwsException {
  ConfigurationSetDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'ConfigurationSetDoesNotExistException',
            message: message);
}

class ConfigurationSetSendingPausedException extends _s.GenericAwsException {
  ConfigurationSetSendingPausedException({String type, String message})
      : super(
            type: type,
            code: 'ConfigurationSetSendingPausedException',
            message: message);
}

class CustomVerificationEmailInvalidContentException
    extends _s.GenericAwsException {
  CustomVerificationEmailInvalidContentException({String type, String message})
      : super(
            type: type,
            code: 'CustomVerificationEmailInvalidContentException',
            message: message);
}

class CustomVerificationEmailTemplateAlreadyExistsException
    extends _s.GenericAwsException {
  CustomVerificationEmailTemplateAlreadyExistsException(
      {String type, String message})
      : super(
            type: type,
            code: 'CustomVerificationEmailTemplateAlreadyExistsException',
            message: message);
}

class CustomVerificationEmailTemplateDoesNotExistException
    extends _s.GenericAwsException {
  CustomVerificationEmailTemplateDoesNotExistException(
      {String type, String message})
      : super(
            type: type,
            code: 'CustomVerificationEmailTemplateDoesNotExistException',
            message: message);
}

class EventDestinationAlreadyExistsException extends _s.GenericAwsException {
  EventDestinationAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'EventDestinationAlreadyExistsException',
            message: message);
}

class EventDestinationDoesNotExistException extends _s.GenericAwsException {
  EventDestinationDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'EventDestinationDoesNotExistException',
            message: message);
}

class FromEmailAddressNotVerifiedException extends _s.GenericAwsException {
  FromEmailAddressNotVerifiedException({String type, String message})
      : super(
            type: type,
            code: 'FromEmailAddressNotVerifiedException',
            message: message);
}

class InvalidCloudWatchDestinationException extends _s.GenericAwsException {
  InvalidCloudWatchDestinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidCloudWatchDestinationException',
            message: message);
}

class InvalidConfigurationSetException extends _s.GenericAwsException {
  InvalidConfigurationSetException({String type, String message})
      : super(
            type: type,
            code: 'InvalidConfigurationSetException',
            message: message);
}

class InvalidDeliveryOptionsException extends _s.GenericAwsException {
  InvalidDeliveryOptionsException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeliveryOptionsException',
            message: message);
}

class InvalidFirehoseDestinationException extends _s.GenericAwsException {
  InvalidFirehoseDestinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidFirehoseDestinationException',
            message: message);
}

class InvalidLambdaFunctionException extends _s.GenericAwsException {
  InvalidLambdaFunctionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidLambdaFunctionException',
            message: message);
}

class InvalidPolicyException extends _s.GenericAwsException {
  InvalidPolicyException({String type, String message})
      : super(type: type, code: 'InvalidPolicyException', message: message);
}

class InvalidRenderingParameterException extends _s.GenericAwsException {
  InvalidRenderingParameterException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRenderingParameterException',
            message: message);
}

class InvalidS3ConfigurationException extends _s.GenericAwsException {
  InvalidS3ConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidS3ConfigurationException',
            message: message);
}

class InvalidSNSDestinationException extends _s.GenericAwsException {
  InvalidSNSDestinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSNSDestinationException',
            message: message);
}

class InvalidSnsTopicException extends _s.GenericAwsException {
  InvalidSnsTopicException({String type, String message})
      : super(type: type, code: 'InvalidSnsTopicException', message: message);
}

class InvalidTemplateException extends _s.GenericAwsException {
  InvalidTemplateException({String type, String message})
      : super(type: type, code: 'InvalidTemplateException', message: message);
}

class InvalidTrackingOptionsException extends _s.GenericAwsException {
  InvalidTrackingOptionsException({String type, String message})
      : super(
            type: type,
            code: 'InvalidTrackingOptionsException',
            message: message);
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

class MissingRenderingAttributeException extends _s.GenericAwsException {
  MissingRenderingAttributeException({String type, String message})
      : super(
            type: type,
            code: 'MissingRenderingAttributeException',
            message: message);
}

class ProductionAccessNotGrantedException extends _s.GenericAwsException {
  ProductionAccessNotGrantedException({String type, String message})
      : super(
            type: type,
            code: 'ProductionAccessNotGrantedException',
            message: message);
}

class RuleDoesNotExistException extends _s.GenericAwsException {
  RuleDoesNotExistException({String type, String message})
      : super(type: type, code: 'RuleDoesNotExistException', message: message);
}

class RuleSetDoesNotExistException extends _s.GenericAwsException {
  RuleSetDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'RuleSetDoesNotExistException', message: message);
}

class TemplateDoesNotExistException extends _s.GenericAwsException {
  TemplateDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'TemplateDoesNotExistException',
            message: message);
}

class TrackingOptionsAlreadyExistsException extends _s.GenericAwsException {
  TrackingOptionsAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'TrackingOptionsAlreadyExistsException',
            message: message);
}

class TrackingOptionsDoesNotExistException extends _s.GenericAwsException {
  TrackingOptionsDoesNotExistException({String type, String message})
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
