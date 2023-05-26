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

/// <p/>
class LexModelsV2 {
  final _s.RestJsonProtocol _protocol;
  LexModelsV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'models-v2-lex',
            signingName: 'lex',
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

  /// Create a batch of custom vocabulary items for a given bot locale's custom
  /// vocabulary.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with this custom vocabulary.
  ///
  /// Parameter [botVersion] :
  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  ///
  /// Parameter [customVocabularyItemList] :
  /// A list of new custom vocabulary items. Each entry must contain a phrase
  /// and can optionally contain a displayAs and/or a weight.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">
  /// Supported Languages </a>.
  Future<BatchCreateCustomVocabularyItemResponse>
      batchCreateCustomVocabularyItem({
    required String botId,
    required String botVersion,
    required List<NewCustomVocabularyItem> customVocabularyItemList,
    required String localeId,
  }) async {
    final $payload = <String, dynamic>{
      'customVocabularyItemList': customVocabularyItemList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/customvocabulary/DEFAULT/batchcreate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateCustomVocabularyItemResponse.fromJson(response);
  }

  /// Delete a batch of custom vocabulary items for a given bot locale's custom
  /// vocabulary.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with this custom vocabulary.
  ///
  /// Parameter [botVersion] :
  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  ///
  /// Parameter [customVocabularyItemList] :
  /// A list of custom vocabulary items requested to be deleted. Each entry must
  /// contain the unique custom vocabulary entry identifier.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">
  /// Supported Languages </a>.
  Future<BatchDeleteCustomVocabularyItemResponse>
      batchDeleteCustomVocabularyItem({
    required String botId,
    required String botVersion,
    required List<CustomVocabularyEntryId> customVocabularyItemList,
    required String localeId,
  }) async {
    final $payload = <String, dynamic>{
      'customVocabularyItemList': customVocabularyItemList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/customvocabulary/DEFAULT/batchdelete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteCustomVocabularyItemResponse.fromJson(response);
  }

  /// Update a batch of custom vocabulary items for a given bot locale's custom
  /// vocabulary.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with this custom vocabulary
  ///
  /// Parameter [botVersion] :
  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  ///
  /// Parameter [customVocabularyItemList] :
  /// A list of custom vocabulary items with updated fields. Each entry must
  /// contain a phrase and can optionally contain a displayAs and/or a weight.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">
  /// Supported Languages </a>.
  Future<BatchUpdateCustomVocabularyItemResponse>
      batchUpdateCustomVocabularyItem({
    required String botId,
    required String botVersion,
    required List<CustomVocabularyItem> customVocabularyItemList,
    required String localeId,
  }) async {
    final $payload = <String, dynamic>{
      'customVocabularyItemList': customVocabularyItemList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/customvocabulary/DEFAULT/batchupdate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateCustomVocabularyItemResponse.fromJson(response);
  }

  /// Builds a bot, its intents, and its slot types into a specific locale. A
  /// bot can be built into multiple locales. At runtime the locale is used to
  /// choose a specific build of the bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to build. The identifier is returned in the
  /// response from the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_CreateBot.html">CreateBot</a>
  /// operation.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to build. This can only be the draft version of the
  /// bot.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that the bot will be used in.
  /// The string must match one of the supported locales. All of the intents,
  /// slot types, and slots used in the bot must have the same locale. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  Future<BuildBotLocaleResponse> buildBotLocale({
    required String botId,
    required String botVersion,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return BuildBotLocaleResponse.fromJson(response);
  }

  /// Creates an Amazon Lex conversational bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botName] :
  /// The name of the bot. The bot name must be unique in the account that
  /// creates the bot.
  ///
  /// Parameter [dataPrivacy] :
  /// Provides information on additional privacy protections Amazon Lex should
  /// use with the bot's data.
  ///
  /// Parameter [idleSessionTTLInSeconds] :
  /// The time, in seconds, that Amazon Lex should keep information about a
  /// user's conversation with the bot.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon Lex
  /// deletes any data provided before the timeout.
  ///
  /// You can specify between 60 (1 minute) and 86,400 (24 hours) seconds.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permission to
  /// access the bot.
  ///
  /// Parameter [botMembers] :
  /// The list of bot members in a network to be created.
  ///
  /// Parameter [botTags] :
  /// A list of tags to add to the bot. You can only add tags when you create a
  /// bot. You can't use the <code>UpdateBot</code> operation to update tags. To
  /// update tags, use the <code>TagResource</code> operation.
  ///
  /// Parameter [botType] :
  /// The type of a bot to create.
  ///
  /// Parameter [description] :
  /// A description of the bot. It appears in lists to help you identify a
  /// particular bot.
  ///
  /// Parameter [testBotAliasTags] :
  /// A list of tags to add to the test alias for a bot. You can only add tags
  /// when you create a bot. You can't use the <code>UpdateAlias</code>
  /// operation to update tags. To update tags on the test alias, use the
  /// <code>TagResource</code> operation.
  Future<CreateBotResponse> createBot({
    required String botName,
    required DataPrivacy dataPrivacy,
    required int idleSessionTTLInSeconds,
    required String roleArn,
    List<BotMember>? botMembers,
    Map<String, String>? botTags,
    BotType? botType,
    String? description,
    Map<String, String>? testBotAliasTags,
  }) async {
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      86400,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'botName': botName,
      'dataPrivacy': dataPrivacy,
      'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      'roleArn': roleArn,
      if (botMembers != null) 'botMembers': botMembers,
      if (botTags != null) 'botTags': botTags,
      if (botType != null) 'botType': botType.toValue(),
      if (description != null) 'description': description,
      if (testBotAliasTags != null) 'testBotAliasTags': testBotAliasTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/bots/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotResponse.fromJson(response);
  }

  /// Creates an alias for the specified version of a bot. Use an alias to
  /// enable you to change the version of a bot without updating applications
  /// that use the bot.
  ///
  /// For example, you can create an alias called "PROD" that your applications
  /// use to call the Amazon Lex bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botAliasName] :
  /// The alias to create. The name must be unique for the bot.
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that the alias applies to.
  ///
  /// Parameter [botAliasLocaleSettings] :
  /// Maps configuration information to a specific locale. You can use this
  /// parameter to specify a specific Lambda function to run different functions
  /// in different locales.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that this alias points to. You can use the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_UpdateBotAlias.html">UpdateBotAlias</a>
  /// operation to change the bot version associated with the alias.
  ///
  /// Parameter [conversationLogSettings] :
  /// Specifies whether Amazon Lex logs text and audio for a conversation with
  /// the bot. When you enable conversation logs, text logs store text input,
  /// transcripts of audio input, and associated metadata in Amazon CloudWatch
  /// Logs. Audio logs store audio input in Amazon S3.
  ///
  /// Parameter [description] :
  /// A description of the alias. Use this description to help identify the
  /// alias.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the bot alias. You can only add tags when you
  /// create an alias, you can't use the <code>UpdateBotAlias</code> operation
  /// to update the tags on a bot alias. To update tags, use the
  /// <code>TagResource</code> operation.
  Future<CreateBotAliasResponse> createBotAlias({
    required String botAliasName,
    required String botId,
    Map<String, BotAliasLocaleSettings>? botAliasLocaleSettings,
    String? botVersion,
    ConversationLogSettings? conversationLogSettings,
    String? description,
    SentimentAnalysisSettings? sentimentAnalysisSettings,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'botAliasName': botAliasName,
      if (botAliasLocaleSettings != null)
        'botAliasLocaleSettings': botAliasLocaleSettings,
      if (botVersion != null) 'botVersion': botVersion,
      if (conversationLogSettings != null)
        'conversationLogSettings': conversationLogSettings,
      if (description != null) 'description': description,
      if (sentimentAnalysisSettings != null)
        'sentimentAnalysisSettings': sentimentAnalysisSettings,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/botaliases/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotAliasResponse.fromJson(response);
  }

  /// Creates a locale in the bot. The locale contains the intents and slot
  /// types that the bot uses in conversations with users in the specified
  /// language and locale. You must add a locale to a bot before you can add
  /// intents and slot types to the bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to create the locale for.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to create the locale for. This can only be the
  /// draft version of the bot.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that the bot will be used in.
  /// The string must match one of the supported locales. All of the intents,
  /// slot types, and slots used in the bot must have the same locale. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [nluIntentConfidenceThreshold] :
  /// Determines the threshold where Amazon Lex will insert the
  /// <code>AMAZON.FallbackIntent</code>,
  /// <code>AMAZON.KendraSearchIntent</code>, or both when returning alternative
  /// intents. <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> are only inserted if they are
  /// configured for the bot.
  ///
  /// For example, suppose a bot is configured with the confidence threshold of
  /// 0.80 and the <code>AMAZON.FallbackIntent</code>. Amazon Lex returns three
  /// alternative intents with the following confidence scores: IntentA (0.70),
  /// IntentB (0.60), IntentC (0.50). The response from the
  /// <code>RecognizeText</code> operation would be:
  ///
  /// <ul>
  /// <li>
  /// AMAZON.FallbackIntent
  /// </li>
  /// <li>
  /// IntentA
  /// </li>
  /// <li>
  /// IntentB
  /// </li>
  /// <li>
  /// IntentC
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the bot locale. Use this to help identify the bot locale
  /// in lists.
  ///
  /// Parameter [voiceSettings] :
  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user.
  Future<CreateBotLocaleResponse> createBotLocale({
    required String botId,
    required String botVersion,
    required String localeId,
    required double nluIntentConfidenceThreshold,
    String? description,
    VoiceSettings? voiceSettings,
  }) async {
    _s.validateNumRange(
      'nluIntentConfidenceThreshold',
      nluIntentConfidenceThreshold,
      0,
      1,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'localeId': localeId,
      'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (description != null) 'description': description,
      if (voiceSettings != null) 'voiceSettings': voiceSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotLocaleResponse.fromJson(response);
  }

  /// Creates a new version of the bot based on the <code>DRAFT</code> version.
  /// If the <code>DRAFT</code> version of this resource hasn't changed since
  /// you created the last version, Amazon Lex doesn't create a new version, it
  /// returns the last created version.
  ///
  /// When you create the first version of a bot, Amazon Lex sets the version to
  /// 1. Subsequent versions increment by 1.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to create the version for.
  ///
  /// Parameter [botVersionLocaleSpecification] :
  /// Specifies the locales that Amazon Lex adds to this version. You can choose
  /// the <code>Draft</code> version or any other previously published version
  /// for each locale. When you specify a source version, the locale data is
  /// copied from the source version to the new version.
  ///
  /// Parameter [description] :
  /// A description of the version. Use the description to help identify the
  /// version in lists.
  Future<CreateBotVersionResponse> createBotVersion({
    required String botId,
    required Map<String, BotVersionLocaleDetails> botVersionLocaleSpecification,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'botVersionLocaleSpecification': botVersionLocaleSpecification,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/botversions/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotVersionResponse.fromJson(response);
  }

  /// Creates a zip archive containing the contents of a bot or a bot locale.
  /// The archive contains a directory structure that contains JSON files that
  /// define the bot.
  ///
  /// You can create an archive that contains the complete definition of a bot,
  /// or you can specify that the archive contain only the definition of a
  /// single bot locale.
  ///
  /// For more information about exporting bots, and about the structure of the
  /// export archive, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/importing-exporting.html">
  /// Importing and exporting bots </a>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [fileFormat] :
  /// The file format of the bot or bot locale definition files.
  ///
  /// Parameter [resourceSpecification] :
  /// Specifies the type of resource to export, either a bot or a bot locale.
  /// You can only specify one type of resource to export.
  ///
  /// Parameter [filePassword] :
  /// An password to use to encrypt the exported archive. Using a password is
  /// optional, but you should encrypt the archive to protect the data in
  /// transit between Amazon Lex and your local computer.
  Future<CreateExportResponse> createExport({
    required ImportExportFileFormat fileFormat,
    required ExportResourceSpecification resourceSpecification,
    String? filePassword,
  }) async {
    final $payload = <String, dynamic>{
      'fileFormat': fileFormat.toValue(),
      'resourceSpecification': resourceSpecification,
      if (filePassword != null) 'filePassword': filePassword,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/exports/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateExportResponse.fromJson(response);
  }

  /// Creates an intent.
  ///
  /// To define the interaction between the user and your bot, you define one or
  /// more intents. For example, for a pizza ordering bot you would create an
  /// <code>OrderPizza</code> intent.
  ///
  /// When you create an intent, you must provide a name. You can optionally
  /// provide the following:
  ///
  /// <ul>
  /// <li>
  /// Sample utterances. For example, "I want to order a pizza" and "Can I order
  /// a pizza." You can't provide utterances for built-in intents.
  /// </li>
  /// <li>
  /// Information to be gathered. You specify slots for the information that you
  /// bot requests from the user. You can specify standard slot types, such as
  /// date and time, or custom slot types for your application.
  /// </li>
  /// <li>
  /// How the intent is fulfilled. You can provide a Lambda function or
  /// configure the intent to return the intent information to your client
  /// application. If you use a Lambda function, Amazon Lex invokes the function
  /// when all of the intent information is available.
  /// </li>
  /// <li>
  /// A confirmation prompt to send to the user to confirm an intent. For
  /// example, "Shall I order your pizza?"
  /// </li>
  /// <li>
  /// A conclusion statement to send to the user after the intent is fulfilled.
  /// For example, "I ordered your pizza."
  /// </li>
  /// <li>
  /// A follow-up prompt that asks the user for additional activity. For
  /// example, "Do you want a drink with your pizza?"
  /// </li>
  /// </ul>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with this intent.
  ///
  /// Parameter [botVersion] :
  /// The identifier of the version of the bot associated with this intent.
  ///
  /// Parameter [intentName] :
  /// The name of the intent. Intent names must be unique in the locale that
  /// contains the intent and cannot match the name of any built-in intent.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where this intent is used. All
  /// of the bots, slot types, and slots used by the intent must have the same
  /// locale. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [description] :
  /// A description of the intent. Use the description to help identify the
  /// intent in lists.
  ///
  /// Parameter [dialogCodeHook] :
  /// Specifies that Amazon Lex invokes the alias Lambda function for each user
  /// input. You can invoke this Lambda function to personalize user
  /// interaction.
  ///
  /// For example, suppose that your bot determines that the user's name is
  /// John. You Lambda function might retrieve John's information from a backend
  /// database and prepopulate some of the values. For example, if you find that
  /// John is gluten intolerant, you might set the corresponding intent slot,
  /// <code>glutenIntolerant</code> to <code>true</code>. You might find John's
  /// phone number and set the corresponding session attribute.
  ///
  /// Parameter [fulfillmentCodeHook] :
  /// Specifies that Amazon Lex invokes the alias Lambda function when the
  /// intent is ready for fulfillment. You can invoke this function to complete
  /// the bot's transaction with the user.
  ///
  /// For example, in a pizza ordering bot, the Lambda function can look up the
  /// closest pizza restaurant to the customer's location and then place an
  /// order on the customer's behalf.
  ///
  /// Parameter [initialResponseSetting] :
  /// Configuration settings for the response that is sent to the user at the
  /// beginning of a conversation, before eliciting slot values.
  ///
  /// Parameter [inputContexts] :
  /// A list of contexts that must be active for this intent to be considered by
  /// Amazon Lex.
  ///
  /// When an intent has an input context list, Amazon Lex only considers using
  /// the intent in an interaction with the user when the specified contexts are
  /// included in the active context list for the session. If the contexts are
  /// not active, then Amazon Lex will not use the intent.
  ///
  /// A context can be automatically activated using the
  /// <code>outputContexts</code> property or it can be set at runtime.
  ///
  /// For example, if there are two intents with different input contexts that
  /// respond to the same utterances, only the intent with the active context
  /// will respond.
  ///
  /// An intent may have up to 5 input contexts. If an intent has multiple input
  /// contexts, all of the contexts must be active to consider the intent.
  ///
  /// Parameter [intentClosingSetting] :
  /// Sets the response that Amazon Lex sends to the user when the intent is
  /// closed.
  ///
  /// Parameter [intentConfirmationSetting] :
  /// Provides prompts that Amazon Lex sends to the user to confirm the
  /// completion of an intent. If the user answers "no," the settings contain a
  /// statement that is sent to the user to end the intent.
  ///
  /// Parameter [kendraConfiguration] :
  /// Configuration information required to use the
  /// <code>AMAZON.KendraSearchIntent</code> intent to connect to an Amazon
  /// Kendra index. The <code>AMAZON.KendraSearchIntent</code> intent is called
  /// when Amazon Lex can't determine another intent to invoke.
  ///
  /// Parameter [outputContexts] :
  /// A lists of contexts that the intent activates when it is fulfilled.
  ///
  /// You can use an output context to indicate the intents that Amazon Lex
  /// should consider for the next turn of the conversation with a customer.
  ///
  /// When you use the <code>outputContextsList</code> property, all of the
  /// contexts specified in the list are activated when the intent is fulfilled.
  /// You can set up to 10 output contexts. You can also set the number of
  /// conversation turns that the context should be active, or the length of
  /// time that the context should be active.
  ///
  /// Parameter [parentIntentSignature] :
  /// A unique identifier for the built-in intent to base this intent on.
  ///
  /// Parameter [sampleUtterances] :
  /// An array of strings that a user might say to signal the intent. For
  /// example, "I want a pizza", or "I want a {PizzaSize} pizza".
  ///
  /// In an utterance, slot names are enclosed in curly braces ("{", "}") to
  /// indicate where they should be displayed in the utterance shown to the
  /// user..
  Future<CreateIntentResponse> createIntent({
    required String botId,
    required String botVersion,
    required String intentName,
    required String localeId,
    String? description,
    DialogCodeHookSettings? dialogCodeHook,
    FulfillmentCodeHookSettings? fulfillmentCodeHook,
    InitialResponseSetting? initialResponseSetting,
    List<InputContext>? inputContexts,
    IntentClosingSetting? intentClosingSetting,
    IntentConfirmationSetting? intentConfirmationSetting,
    KendraConfiguration? kendraConfiguration,
    List<OutputContext>? outputContexts,
    String? parentIntentSignature,
    List<SampleUtterance>? sampleUtterances,
  }) async {
    final $payload = <String, dynamic>{
      'intentName': intentName,
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (fulfillmentCodeHook != null)
        'fulfillmentCodeHook': fulfillmentCodeHook,
      if (initialResponseSetting != null)
        'initialResponseSetting': initialResponseSetting,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (intentClosingSetting != null)
        'intentClosingSetting': intentClosingSetting,
      if (intentConfirmationSetting != null)
        'intentConfirmationSetting': intentConfirmationSetting,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIntentResponse.fromJson(response);
  }

  /// Creates a new resource policy with the specified policy statements.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PreconditionFailedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [policy] :
  /// A resource policy to add to the resource. The policy is a JSON structure
  /// that contains one or more statements that define the policy. The policy
  /// must follow the IAM syntax. For more information about the contents of a
  /// JSON policy document, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">
  /// IAM JSON policy reference </a>.
  ///
  /// If the policy isn't valid, Amazon Lex returns a validation exception.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  Future<CreateResourcePolicyResponse> createResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policy/${Uri.encodeComponent(resourceArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourcePolicyResponse.fromJson(response);
  }

  /// Adds a new resource policy statement to a bot or bot alias. If a resource
  /// policy exists, the statement is added to the current resource policy. If a
  /// policy doesn't exist, a new policy is created.
  ///
  /// You can't create a resource policy statement that allows cross-account
  /// access.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PreconditionFailedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [action] :
  /// The Amazon Lex action that this policy either allows or denies. The action
  /// must apply to the resource type of the specified ARN. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonlexv2.html">
  /// Actions, resources, and condition keys for Amazon Lex V2</a>.
  ///
  /// Parameter [effect] :
  /// Determines whether the statement allows or denies access to the resource.
  ///
  /// Parameter [principal] :
  /// An IAM principal, such as an IAM users, IAM roles, or AWS services that is
  /// allowed or denied access to a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">AWS
  /// JSON policy elements: Principal</a>.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  ///
  /// Parameter [statementId] :
  /// The name of the statement. The ID is the same as the <code>Sid</code> IAM
  /// property. The statement name must be unique within the policy. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_sid.html">IAM
  /// JSON policy elements: Sid</a>.
  ///
  /// Parameter [condition] :
  /// Specifies a condition when the policy is in effect. If the principal of
  /// the policy is a service principal, you must provide two condition blocks,
  /// one with a SourceAccount global condition key and one with a SourceArn
  /// global condition key.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition.html">IAM
  /// JSON policy elements: Condition </a>.
  ///
  /// Parameter [expectedRevisionId] :
  /// The identifier of the revision of the policy to edit. If this revision ID
  /// doesn't match the current revision ID, Amazon Lex throws an exception.
  ///
  /// If you don't specify a revision, Amazon Lex overwrites the contents of the
  /// policy with the new values.
  Future<CreateResourcePolicyStatementResponse> createResourcePolicyStatement({
    required List<String> action,
    required Effect effect,
    required List<Principal> principal,
    required String resourceArn,
    required String statementId,
    Map<String, Map<String, String>>? condition,
    String? expectedRevisionId,
  }) async {
    final $query = <String, List<String>>{
      if (expectedRevisionId != null)
        'expectedRevisionId': [expectedRevisionId],
    };
    final $payload = <String, dynamic>{
      'action': action,
      'effect': effect.toValue(),
      'principal': principal,
      'statementId': statementId,
      if (condition != null) 'condition': condition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policy/${Uri.encodeComponent(resourceArn)}/statements/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourcePolicyStatementResponse.fromJson(response);
  }

  /// Creates a slot in an intent. A slot is a variable needed to fulfill an
  /// intent. For example, an <code>OrderPizza</code> intent might need slots
  /// for size, crust, and number of pizzas. For each slot, you define one or
  /// more utterances that Amazon Lex uses to elicit a response from the user.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the slot.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the slot.
  ///
  /// Parameter [intentId] :
  /// The identifier of the intent that contains the slot.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that the slot will be used in.
  /// The string must match one of the supported locales. All of the bots,
  /// intents, slot types used by the slot must have the same locale. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotName] :
  /// The name of the slot. Slot names must be unique within the bot that
  /// contains the slot.
  ///
  /// Parameter [valueElicitationSetting] :
  /// Specifies prompts that Amazon Lex sends to the user to elicit a response
  /// that provides the value for the slot.
  ///
  /// Parameter [description] :
  /// A description of the slot. Use this to help identify the slot in lists.
  ///
  /// Parameter [multipleValuesSetting] :
  /// Indicates whether the slot returns multiple values in one response.
  /// Multi-value slots are only available in the en-US locale. If you set this
  /// value to <code>true</code> in any other locale, Amazon Lex throws a
  /// <code>ValidationException</code>.
  ///
  /// If the <code>multipleValuesSetting</code> is not set, the default value is
  /// <code>false</code>.
  ///
  /// Parameter [obfuscationSetting] :
  /// Determines how slot values are used in Amazon CloudWatch logs. If the
  /// value of the <code>obfuscationSetting</code> parameter is
  /// <code>DefaultObfuscation</code>, slot values are obfuscated in the log
  /// output. If the value is <code>None</code>, the actual value is present in
  /// the log output.
  ///
  /// The default is to obfuscate values in the CloudWatch logs.
  ///
  /// Parameter [slotTypeId] :
  /// The unique identifier for the slot type associated with this slot. The
  /// slot type determines the values that can be entered into the slot.
  ///
  /// Parameter [subSlotSetting] :
  /// Specifications for the constituent sub slots and the expression for the
  /// composite slot.
  Future<CreateSlotResponse> createSlot({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
    required String slotName,
    required SlotValueElicitationSetting valueElicitationSetting,
    String? description,
    MultipleValuesSetting? multipleValuesSetting,
    ObfuscationSetting? obfuscationSetting,
    String? slotTypeId,
    SubSlotSetting? subSlotSetting,
  }) async {
    final $payload = <String, dynamic>{
      'slotName': slotName,
      'valueElicitationSetting': valueElicitationSetting,
      if (description != null) 'description': description,
      if (multipleValuesSetting != null)
        'multipleValuesSetting': multipleValuesSetting,
      if (obfuscationSetting != null) 'obfuscationSetting': obfuscationSetting,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (subSlotSetting != null) 'subSlotSetting': subSlotSetting,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/slots/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSlotResponse.fromJson(response);
  }

  /// Creates a custom slot type
  ///
  /// To create a custom slot type, specify a name for the slot type and a set
  /// of enumeration values, the values that a slot of this type can assume.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with this slot type.
  ///
  /// Parameter [botVersion] :
  /// The identifier of the bot version associated with this slot type.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that the slot type will be used
  /// in. The string must match one of the supported locales. All of the bots,
  /// intents, and slots used by the slot type must have the same locale. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotTypeName] :
  /// The name for the slot. A slot type name must be unique within the account.
  ///
  /// Parameter [compositeSlotTypeSetting] :
  /// Specifications for a composite slot type.
  ///
  /// Parameter [description] :
  /// A description of the slot type. Use the description to help identify the
  /// slot type in lists.
  ///
  /// Parameter [externalSourceSetting] :
  /// Sets the type of external information used to create the slot type.
  ///
  /// Parameter [parentSlotTypeSignature] :
  /// The built-in slot type used as a parent of this slot type. When you define
  /// a parent slot type, the new slot type has the configuration of the parent
  /// slot type.
  ///
  /// Only <code>AMAZON.AlphaNumeric</code> is supported.
  ///
  /// Parameter [slotTypeValues] :
  /// A list of <code>SlotTypeValue</code> objects that defines the values that
  /// the slot type can take. Each value can have a list of synonyms, additional
  /// values that help train the machine learning model about the values that it
  /// resolves for a slot.
  ///
  /// Parameter [valueSelectionSetting] :
  /// Determines the strategy that Amazon Lex uses to select a value from the
  /// list of possible values. The field can be set to one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>OriginalValue</code> - Returns the value entered by the user, if the
  /// user value is similar to the slot value.
  /// </li>
  /// <li>
  /// <code>TopResolution</code> - If there is a resolution list for the slot,
  /// return the first value in the resolution list. If there is no resolution
  /// list, return null.
  /// </li>
  /// </ul>
  /// If you don't specify the <code>valueSelectionSetting</code> parameter, the
  /// default is <code>OriginalValue</code>.
  Future<CreateSlotTypeResponse> createSlotType({
    required String botId,
    required String botVersion,
    required String localeId,
    required String slotTypeName,
    CompositeSlotTypeSetting? compositeSlotTypeSetting,
    String? description,
    ExternalSourceSetting? externalSourceSetting,
    String? parentSlotTypeSignature,
    List<SlotTypeValue>? slotTypeValues,
    SlotValueSelectionSetting? valueSelectionSetting,
  }) async {
    final $payload = <String, dynamic>{
      'slotTypeName': slotTypeName,
      if (compositeSlotTypeSetting != null)
        'compositeSlotTypeSetting': compositeSlotTypeSetting,
      if (description != null) 'description': description,
      if (externalSourceSetting != null)
        'externalSourceSetting': externalSourceSetting,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeValues != null) 'slotTypeValues': slotTypeValues,
      if (valueSelectionSetting != null)
        'valueSelectionSetting': valueSelectionSetting,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/slottypes/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSlotTypeResponse.fromJson(response);
  }

  /// Gets a pre-signed S3 write URL that you use to upload the zip archive when
  /// importing a bot or a bot locale.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  Future<CreateUploadUrlResponse> createUploadUrl() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/createuploadurl/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUploadUrlResponse.fromJson(response);
  }

  /// Deletes all versions of a bot, including the <code>Draft</code> version.
  /// To delete a specific version, use the <code>DeleteBotVersion</code>
  /// operation.
  ///
  /// When you delete a bot, all of the resources contained in the bot are also
  /// deleted. Deleting a bot removes all locales, intents, slot, and slot types
  /// defined for the bot.
  ///
  /// If a bot has an alias, the <code>DeleteBot</code> operation returns a
  /// <code>ResourceInUseException</code> exception. If you want to delete the
  /// bot and the alias, set the <code>skipResourceInUseCheck</code> parameter
  /// to <code>true</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to delete.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, Amazon Lex checks if any other resource, such as an alias or
  /// bot network, is using the bot version before it is deleted and throws a
  /// <code>ResourceInUseException</code> exception if the bot is being used by
  /// another resource. Set this parameter to <code>true</code> to skip this
  /// check and remove the bot even if it is being used by another resource.
  Future<DeleteBotResponse> deleteBot({
    required String botId,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBotResponse.fromJson(response);
  }

  /// Deletes the specified bot alias.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botAliasId] :
  /// The unique identifier of the bot alias to delete.
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot associated with the alias to delete.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, Amazon Lex checks if any other resource, such as a bot
  /// network, is using the bot alias before it is deleted and throws a
  /// <code>ResourceInUseException</code> exception if the alias is being used
  /// by another resource. Set this parameter to <code>true</code> to skip this
  /// check and remove the alias even if it is being used by another resource.
  Future<DeleteBotAliasResponse> deleteBotAlias({
    required String botAliasId,
    required String botId,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botaliases/${Uri.encodeComponent(botAliasId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBotAliasResponse.fromJson(response);
  }

  /// Removes a locale from a bot.
  ///
  /// When you delete a locale, all intents, slots, and slot types defined for
  /// the locale are also deleted.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the locale.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the locale.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that will be deleted. The string
  /// must match one of the supported locales. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  Future<DeleteBotLocaleResponse> deleteBotLocale({
    required String botId,
    required String botVersion,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBotLocaleResponse.fromJson(response);
  }

  /// Deletes a specific version of a bot. To delete all versions of a bot, use
  /// the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_DeleteBot.html">DeleteBot</a>
  /// operation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that contains the version.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to delete.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, Amazon Lex checks if any other resource, such as an alias or
  /// bot network, is using the bot version before it is deleted and throws a
  /// <code>ResourceInUseException</code> exception if the version is being used
  /// by another resource. Set this parameter to <code>true</code> to skip this
  /// check and remove the version even if it is being used by another resource.
  Future<DeleteBotVersionResponse> deleteBotVersion({
    required String botId,
    required String botVersion,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBotVersionResponse.fromJson(response);
  }

  /// Removes a custom vocabulary from the specified locale in the specified
  /// bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot to remove the custom vocabulary from.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to remove the custom vocabulary from.
  ///
  /// Parameter [localeId] :
  /// The locale identifier for the locale that contains the custom vocabulary
  /// to remove.
  Future<DeleteCustomVocabularyResponse> deleteCustomVocabulary({
    required String botId,
    required String botVersion,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/customvocabulary',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCustomVocabularyResponse.fromJson(response);
  }

  /// Removes a previous export and the associated files stored in an S3 bucket.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [exportId] :
  /// The unique identifier of the export to delete.
  Future<DeleteExportResponse> deleteExport({
    required String exportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/exports/${Uri.encodeComponent(exportId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteExportResponse.fromJson(response);
  }

  /// Removes a previous import and the associated file stored in an S3 bucket.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [importId] :
  /// The unique identifier of the import to delete.
  Future<DeleteImportResponse> deleteImport({
    required String importId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/imports/${Uri.encodeComponent(importId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteImportResponse.fromJson(response);
  }

  /// Removes the specified intent.
  ///
  /// Deleting an intent also deletes the slots associated with the intent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the intent.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the intent.
  ///
  /// Parameter [intentId] :
  /// The unique identifier of the intent to delete.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where the bot will be deleted.
  /// The string must match one of the supported locales. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  Future<void> deleteIntent({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes an existing policy from a bot or bot alias. If the resource
  /// doesn't have a policy attached, Amazon Lex returns an exception.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the bot or bot alias that has the
  /// resource policy attached.
  ///
  /// Parameter [expectedRevisionId] :
  /// The identifier of the revision to edit. If this ID doesn't match the
  /// current revision number, Amazon Lex returns an exception
  ///
  /// If you don't specify a revision ID, Amazon Lex will delete the current
  /// policy.
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy({
    required String resourceArn,
    String? expectedRevisionId,
  }) async {
    final $query = <String, List<String>>{
      if (expectedRevisionId != null)
        'expectedRevisionId': [expectedRevisionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/policy/${Uri.encodeComponent(resourceArn)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourcePolicyResponse.fromJson(response);
  }

  /// Deletes a policy statement from a resource policy. If you delete the last
  /// statement from a policy, the policy is deleted. If you specify a statement
  /// ID that doesn't exist in the policy, or if the bot or bot alias doesn't
  /// have a policy attached, Amazon Lex returns an exception.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  ///
  /// Parameter [statementId] :
  /// The name of the statement (SID) to delete from the policy.
  ///
  /// Parameter [expectedRevisionId] :
  /// The identifier of the revision of the policy to delete the statement from.
  /// If this revision ID doesn't match the current revision ID, Amazon Lex
  /// throws an exception.
  ///
  /// If you don't specify a revision, Amazon Lex removes the current contents
  /// of the statement.
  Future<DeleteResourcePolicyStatementResponse> deleteResourcePolicyStatement({
    required String resourceArn,
    required String statementId,
    String? expectedRevisionId,
  }) async {
    final $query = <String, List<String>>{
      if (expectedRevisionId != null)
        'expectedRevisionId': [expectedRevisionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/policy/${Uri.encodeComponent(resourceArn)}/statements/${Uri.encodeComponent(statementId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourcePolicyStatementResponse.fromJson(response);
  }

  /// Deletes the specified slot from an intent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the slot to delete.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the slot to delete.
  ///
  /// Parameter [intentId] :
  /// The identifier of the intent associated with the slot.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that the slot will be deleted
  /// from. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotId] :
  /// The identifier of the slot to delete.
  Future<void> deleteSlot({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
    required String slotId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/slots/${Uri.encodeComponent(slotId)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a slot type from a bot locale.
  ///
  /// If a slot is using the slot type, Amazon Lex throws a
  /// <code>ResourceInUseException</code> exception. To avoid the exception, set
  /// the <code>skipResourceInUseCheck</code> parameter to <code>true</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the slot type.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the slot type.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that the slot type will be
  /// deleted from. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotTypeId] :
  /// The identifier of the slot type to delete.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, the <code>DeleteSlotType</code> operations throws a
  /// <code>ResourceInUseException</code> exception if you try to delete a slot
  /// type used by a slot. Set the <code>skipResourceInUseCheck</code> parameter
  /// to <code>true</code> to skip this check and remove the slot type even if a
  /// slot uses it.
  Future<void> deleteSlotType({
    required String botId,
    required String botVersion,
    required String localeId,
    required String slotTypeId,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/slottypes/${Uri.encodeComponent(slotTypeId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes stored utterances.
  ///
  /// Amazon Lex stores the utterances that users send to your bot. Utterances
  /// are stored for 15 days for use with the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListAggregatedUtterances.html">ListAggregatedUtterances</a>
  /// operation, and then stored indefinitely for use in improving the ability
  /// of your bot to respond to user input..
  ///
  /// Use the <code>DeleteUtterances</code> operation to manually delete
  /// utterances for a specific session. When you use the
  /// <code>DeleteUtterances</code> operation, utterances stored for improving
  /// your bot's ability to respond to user input are deleted immediately.
  /// Utterances stored for use with the <code>ListAggregatedUtterances</code>
  /// operation are deleted after 15 days.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the utterances.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where the utterances were
  /// collected. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session with the user. The ID is returned in
  /// the response from the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_runtime_RecognizeText.html">RecognizeText</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_runtime_RecognizeUtterance.html">RecognizeUtterance</a>
  /// operations.
  Future<void> deleteUtterances({
    required String botId,
    String? localeId,
    String? sessionId,
  }) async {
    final $query = <String, List<String>>{
      if (localeId != null) 'localeId': [localeId],
      if (sessionId != null) 'sessionId': [sessionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/utterances/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Provides metadata information about a bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot to describe.
  Future<DescribeBotResponse> describeBot({
    required String botId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBotResponse.fromJson(response);
  }

  /// Get information about a specific bot alias.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botAliasId] :
  /// The identifier of the bot alias to describe.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the bot alias to describe.
  Future<DescribeBotAliasResponse> describeBotAlias({
    required String botAliasId,
    required String botId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botaliases/${Uri.encodeComponent(botAliasId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBotAliasResponse.fromJson(response);
  }

  /// Describes the settings that a bot has for a specific locale.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the locale.
  ///
  /// Parameter [botVersion] :
  /// The identifier of the version of the bot associated with the locale.
  ///
  /// Parameter [localeId] :
  /// The unique identifier of the locale to describe. The string must match one
  /// of the supported locales. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  Future<DescribeBotLocaleResponse> describeBotLocale({
    required String botId,
    required String botVersion,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBotLocaleResponse.fromJson(response);
  }

  /// Provides metadata information about a bot recommendation. This information
  /// will enable you to get a description on the request inputs, to download
  /// associated transcripts after processing is complete, and to download
  /// intents and slot-types generated by the bot recommendation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot associated with the bot recommendation.
  ///
  /// Parameter [botRecommendationId] :
  /// The identifier of the bot recommendation to describe.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the bot recommendation.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the bot recommendation to
  /// describe. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  Future<DescribeBotRecommendationResponse> describeBotRecommendation({
    required String botId,
    required String botRecommendationId,
    required String botVersion,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/botrecommendations/${Uri.encodeComponent(botRecommendationId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBotRecommendationResponse.fromJson(response);
  }

  /// Provides metadata about a version of a bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot containing the version to return metadata for.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to return metadata for.
  Future<DescribeBotVersionResponse> describeBotVersion({
    required String botId,
    required String botVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBotVersionResponse.fromJson(response);
  }

  /// Provides metadata information about a custom vocabulary.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the custom vocabulary.
  ///
  /// Parameter [botVersion] :
  /// The bot version of the bot to return metadata for.
  ///
  /// Parameter [localeId] :
  /// The locale to return the custom vocabulary information for. The locale
  /// must be <code>en_GB</code>.
  Future<DescribeCustomVocabularyMetadataResponse>
      describeCustomVocabularyMetadata({
    required String botId,
    required String botVersion,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/customvocabulary/DEFAULT/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCustomVocabularyMetadataResponse.fromJson(response);
  }

  /// Gets information about a specific export.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [exportId] :
  /// The unique identifier of the export to describe.
  Future<DescribeExportResponse> describeExport({
    required String exportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/exports/${Uri.encodeComponent(exportId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeExportResponse.fromJson(response);
  }

  /// Gets information about a specific import.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [importId] :
  /// The unique identifier of the import to describe.
  Future<DescribeImportResponse> describeImport({
    required String importId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/imports/${Uri.encodeComponent(importId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeImportResponse.fromJson(response);
  }

  /// Returns metadata about an intent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the intent.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the intent.
  ///
  /// Parameter [intentId] :
  /// The identifier of the intent to describe.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the intent to describe. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  Future<DescribeIntentResponse> describeIntent({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIntentResponse.fromJson(response);
  }

  /// Gets the resource policy and policy revision for a bot or bot alias.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  Future<DescribeResourcePolicyResponse> describeResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policy/${Uri.encodeComponent(resourceArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeResourcePolicyResponse.fromJson(response);
  }

  /// Gets metadata information about a slot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the slot.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the slot.
  ///
  /// Parameter [intentId] :
  /// The identifier of the intent that contains the slot.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the slot to describe. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotId] :
  /// The unique identifier for the slot.
  Future<DescribeSlotResponse> describeSlot({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
    required String slotId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/slots/${Uri.encodeComponent(slotId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSlotResponse.fromJson(response);
  }

  /// Gets metadata information about a slot type.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot associated with the slot type.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot associated with the slot type.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the slot type to describe.
  /// The string must match one of the supported locales. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotTypeId] :
  /// The identifier of the slot type.
  Future<DescribeSlotTypeResponse> describeSlotType({
    required String botId,
    required String botVersion,
    required String localeId,
    required String slotTypeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/slottypes/${Uri.encodeComponent(slotTypeId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSlotTypeResponse.fromJson(response);
  }

  /// Provides a list of utterances that users have sent to the bot.
  ///
  /// Utterances are aggregated by the text of the utterance. For example, all
  /// instances where customers used the phrase "I want to order pizza" are
  /// aggregated into the same line in the response.
  ///
  /// You can see both detected utterances and missed utterances. A detected
  /// utterance is where the bot properly recognized the utterance and activated
  /// the associated intent. A missed utterance was not recognized by the bot
  /// and didn't activate an intent.
  ///
  /// Utterances can be aggregated for a bot alias or for a bot version, but not
  /// both at the same time.
  ///
  /// Utterances statistics are not generated under the following conditions:
  ///
  /// <ul>
  /// <li>
  /// The <code>childDirected</code> field was set to true when the bot was
  /// created.
  /// </li>
  /// <li>
  /// You are using slot obfuscation with one or more slots.
  /// </li>
  /// <li>
  /// You opted out of participating in improving Amazon Lex.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [aggregationDuration] :
  /// The time window for aggregating the utterance information. You can specify
  /// a time between one hour and two weeks.
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot associated with this request.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where the utterances were
  /// collected. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [botAliasId] :
  /// The identifier of the bot alias associated with this request. If you
  /// specify the bot alias, you can't specify the bot version.
  ///
  /// Parameter [botVersion] :
  /// The identifier of the bot version associated with this request. If you
  /// specify the bot version, you can't specify the bot alias.
  ///
  /// Parameter [filters] :
  /// Provides the specification of a filter used to limit the utterances in the
  /// response to only those that match the filter specification. You can only
  /// specify one filter and one string to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of utterances to return in each page of results. If
  /// there are fewer results than the maximum page size, only the actual number
  /// of results are returned. If you don't specify the <code>maxResults</code>
  /// parameter, 1,000 results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListAggregatedUtterances</code> operation
  /// contains more results that specified in the <code>maxResults</code>
  /// parameter, a token is returned in the response. Use that token in the
  /// <code>nextToken</code> parameter to return the next page of results.
  ///
  /// Parameter [sortBy] :
  /// Specifies sorting parameters for the list of utterances. You can sort by
  /// the hit count, the missed count, or the number of distinct sessions the
  /// utterance appeared in.
  Future<ListAggregatedUtterancesResponse> listAggregatedUtterances({
    required UtteranceAggregationDuration aggregationDuration,
    required String botId,
    required String localeId,
    String? botAliasId,
    String? botVersion,
    List<AggregatedUtterancesFilter>? filters,
    int? maxResults,
    String? nextToken,
    AggregatedUtterancesSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'aggregationDuration': aggregationDuration,
      'localeId': localeId,
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botVersion != null) 'botVersion': botVersion,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/aggregatedutterances/',
      exceptionFnMap: _exceptionFns,
    );
    return ListAggregatedUtterancesResponse.fromJson(response);
  }

  /// Gets a list of aliases for the specified bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to list aliases for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of aliases to return in each page of results. If there
  /// are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListBotAliases</code> operation contains
  /// more results than specified in the <code>maxResults</code> parameter, a
  /// token is returned in the response. Use that token in the
  /// <code>nextToken</code> parameter to return the next page of results.
  Future<ListBotAliasesResponse> listBotAliases({
    required String botId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/botaliases/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotAliasesResponse.fromJson(response);
  }

  /// Gets a list of locales for the specified bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to list locales for.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to list locales for.
  ///
  /// Parameter [filters] :
  /// Provides the specification for a filter used to limit the response to only
  /// those locales that match the filter specification. You can only specify
  /// one filter and one value to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of aliases to return in each page of results. If there
  /// are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListBotLocales</code> operation contains
  /// more results than specified in the <code>maxResults</code> parameter, a
  /// token is returned in the response. Use that token as the
  /// <code>nextToken</code> parameter to return the next page of results.
  ///
  /// Parameter [sortBy] :
  /// Specifies sorting parameters for the list of locales. You can sort by
  /// locale name in ascending or descending order.
  Future<ListBotLocalesResponse> listBotLocales({
    required String botId,
    required String botVersion,
    List<BotLocaleFilter>? filters,
    int? maxResults,
    String? nextToken,
    BotLocaleSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotLocalesResponse.fromJson(response);
  }

  /// Get a list of bot recommendations that meet the specified criteria.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the bot recommendation
  /// list.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the bot recommendation list.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the bot recommendation list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bot recommendations to return in each page of
  /// results. If there are fewer results than the max page size, only the
  /// actual number of results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListBotRecommendation operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response. Use that token in the nextToken parameter to return the next
  /// page of results.
  Future<ListBotRecommendationsResponse> listBotRecommendations({
    required String botId,
    required String botVersion,
    required String localeId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/botrecommendations/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotRecommendationsResponse.fromJson(response);
  }

  /// Gets information about all of the versions of a bot.
  ///
  /// The <code>ListBotVersions</code> operation returns a summary of each
  /// version of a bot. For example, if a bot has three numbered versions, the
  /// <code>ListBotVersions</code> operation returns for summaries, one for each
  /// numbered version and one for the <code>DRAFT</code> version.
  ///
  /// The <code>ListBotVersions</code> operation always returns at least one
  /// version, the <code>DRAFT</code> version.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to list versions for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of versions to return in each page of results. If there
  /// are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response to the <code>ListBotVersion</code> operation contains more
  /// results than specified in the <code>maxResults</code> parameter, a token
  /// is returned in the response. Use that token in the <code>nextToken</code>
  /// parameter to return the next page of results.
  ///
  /// Parameter [sortBy] :
  /// Specifies sorting parameters for the list of versions. You can specify
  /// that the list be sorted by version name in either ascending or descending
  /// order.
  Future<ListBotVersionsResponse> listBotVersions({
    required String botId,
    int? maxResults,
    String? nextToken,
    BotVersionSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/botversions/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotVersionsResponse.fromJson(response);
  }

  /// Gets a list of available bots.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// Provides the specification of a filter used to limit the bots in the
  /// response to only those that match the filter specification. You can only
  /// specify one filter and one string to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bots to return in each page of results. If there are
  /// fewer results than the maximum page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListBots</code> operation contains more
  /// results than specified in the <code>maxResults</code> parameter, a token
  /// is returned in the response.
  ///
  /// Use the returned token in the <code>nextToken</code> parameter of a
  /// <code>ListBots</code> request to return the next page of results. For a
  /// complete set of results, call the <code>ListBots</code> operation until
  /// the <code>nextToken</code> returned in the response is null.
  ///
  /// Parameter [sortBy] :
  /// Specifies sorting parameters for the list of bots. You can specify that
  /// the list be sorted by bot name in ascending or descending order.
  Future<ListBotsResponse> listBots({
    List<BotFilter>? filters,
    int? maxResults,
    String? nextToken,
    BotSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotsResponse.fromJson(response);
  }

  /// Gets a list of built-in intents provided by Amazon Lex that you can use in
  /// your bot.
  ///
  /// To use a built-in intent as a the base for your own intent, include the
  /// built-in intent signature in the <code>parentIntentSignature</code>
  /// parameter when you call the <code>CreateIntent</code> operation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_CreateIntent.html">CreateIntent</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the intents to list. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of built-in intents to return in each page of results.
  /// If there are fewer results than the max page size, only the actual number
  /// of results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListBuiltInIntents</code> operation
  /// contains more results than specified in the <code>maxResults</code>
  /// parameter, a token is returned in the response. Use that token in the
  /// <code>nextToken</code> parameter to return the next page of results.
  ///
  /// Parameter [sortBy] :
  /// Specifies sorting parameters for the list of built-in intents. You can
  /// specify that the list be sorted by the built-in intent signature in either
  /// ascending or descending order.
  Future<ListBuiltInIntentsResponse> listBuiltInIntents({
    required String localeId,
    int? maxResults,
    String? nextToken,
    BuiltInIntentSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      20,
      20,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/builtins/locales/${Uri.encodeComponent(localeId)}/intents/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBuiltInIntentsResponse.fromJson(response);
  }

  /// Gets a list of built-in slot types that meet the specified criteria.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the slot types to list. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of built-in slot types to return in each page of
  /// results. If there are fewer results than the max page size, only the
  /// actual number of results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListBuiltInSlotTypes</code> operation
  /// contains more results than specified in the <code>maxResults</code>
  /// parameter, a token is returned in the response. Use that token in the
  /// <code>nextToken</code> parameter to return the next page of results.
  ///
  /// Parameter [sortBy] :
  /// Determines the sort order for the response from the
  /// <code>ListBuiltInSlotTypes</code> operation. You can choose to sort by the
  /// slot type signature in either ascending or descending order.
  Future<ListBuiltInSlotTypesResponse> listBuiltInSlotTypes({
    required String localeId,
    int? maxResults,
    String? nextToken,
    BuiltInSlotTypeSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      20,
      20,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/builtins/locales/${Uri.encodeComponent(localeId)}/slottypes/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBuiltInSlotTypesResponse.fromJson(response);
  }

  /// Paginated list of custom vocabulary items for a given bot locale's custom
  /// vocabulary.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  ///
  /// Parameter [botVersion] :
  /// The bot version of the bot to the list custom vocabulary request.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see Supported languages
  /// (https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items returned by the list operation.
  ///
  /// Parameter [nextToken] :
  /// The nextToken identifier to the list custom vocabulary request.
  Future<ListCustomVocabularyItemsResponse> listCustomVocabularyItems({
    required String botId,
    required String botVersion,
    required String localeId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/customvocabulary/DEFAULT/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomVocabularyItemsResponse.fromJson(response);
  }

  /// Lists the exports for a bot, bot locale, or custom vocabulary. Exports are
  /// kept in the list for 7 days.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier that Amazon Lex assigned to the bot.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to list exports for.
  ///
  /// Parameter [filters] :
  /// Provides the specification of a filter used to limit the exports in the
  /// response to only those that match the filter specification. You can only
  /// specify one filter and one string to filter on.
  ///
  /// Parameter [localeId] :
  /// Specifies the resources that should be exported. If you don't specify a
  /// resource type in the <code>filters</code> parameter, both bot locales and
  /// custom vocabularies are exported.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of exports to return in each page of results. If there
  /// are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListExports</code> operation contains more
  /// results that specified in the <code>maxResults</code> parameter, a token
  /// is returned in the response.
  ///
  /// Use the returned token in the <code>nextToken</code> parameter of a
  /// <code>ListExports</code> request to return the next page of results. For a
  /// complete set of results, call the <code>ListExports</code> operation until
  /// the <code>nextToken</code> returned in the response is null.
  ///
  /// Parameter [sortBy] :
  /// Determines the field that the list of exports is sorted by. You can sort
  /// by the <code>LastUpdatedDateTime</code> field in ascending or descending
  /// order.
  Future<ListExportsResponse> listExports({
    String? botId,
    String? botVersion,
    List<ExportFilter>? filters,
    String? localeId,
    int? maxResults,
    String? nextToken,
    ExportSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (filters != null) 'filters': filters,
      if (localeId != null) 'localeId': localeId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/exports/',
      exceptionFnMap: _exceptionFns,
    );
    return ListExportsResponse.fromJson(response);
  }

  /// Lists the imports for a bot, bot locale, or custom vocabulary. Imports are
  /// kept in the list for 7 days.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier that Amazon Lex assigned to the bot.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot to list imports for.
  ///
  /// Parameter [filters] :
  /// Provides the specification of a filter used to limit the bots in the
  /// response to only those that match the filter specification. You can only
  /// specify one filter and one string to filter on.
  ///
  /// Parameter [localeId] :
  /// Specifies the locale that should be present in the list. If you don't
  /// specify a resource type in the <code>filters</code> parameter, the list
  /// contains both bot locales and custom vocabularies.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of imports to return in each page of results. If there
  /// are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListImports</code> operation contains more
  /// results than specified in the <code>maxResults</code> parameter, a token
  /// is returned in the response.
  ///
  /// Use the returned token in the <code>nextToken</code> parameter of a
  /// <code>ListImports</code> request to return the next page of results. For a
  /// complete set of results, call the <code>ListImports</code> operation until
  /// the <code>nextToken</code> returned in the response is null.
  ///
  /// Parameter [sortBy] :
  /// Determines the field that the list of imports is sorted by. You can sort
  /// by the <code>LastUpdatedDateTime</code> field in ascending or descending
  /// order.
  Future<ListImportsResponse> listImports({
    String? botId,
    String? botVersion,
    List<ImportFilter>? filters,
    String? localeId,
    int? maxResults,
    String? nextToken,
    ImportSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (filters != null) 'filters': filters,
      if (localeId != null) 'localeId': localeId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/imports/',
      exceptionFnMap: _exceptionFns,
    );
    return ListImportsResponse.fromJson(response);
  }

  /// Get a list of intents that meet the specified criteria.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the intent.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the intent.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the intents to list. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [filters] :
  /// Provides the specification of a filter used to limit the intents in the
  /// response to only those that match the filter specification. You can only
  /// specify one filter and only one string to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of intents to return in each page of results. If there
  /// are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListIntents</code> operation contains more
  /// results than specified in the <code>maxResults</code> parameter, a token
  /// is returned in the response.
  ///
  /// Use the returned token in the <code>nextToken</code> parameter of a
  /// <code>ListIntents</code> request to return the next page of results. For a
  /// complete set of results, call the <code>ListIntents</code> operation until
  /// the <code>nextToken</code> returned in the response is null.
  ///
  /// Parameter [sortBy] :
  /// Determines the sort order for the response from the
  /// <code>ListIntents</code> operation. You can choose to sort by the intent
  /// name or last updated date in either ascending or descending order.
  Future<ListIntentsResponse> listIntents({
    required String botId,
    required String botVersion,
    required String localeId,
    List<IntentFilter>? filters,
    int? maxResults,
    String? nextToken,
    IntentSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/',
      exceptionFnMap: _exceptionFns,
    );
    return ListIntentsResponse.fromJson(response);
  }

  /// Gets a list of recommended intents provided by the bot recommendation that
  /// you can use in your bot. Intents in the response are ordered by relevance.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot associated with the recommended intents.
  ///
  /// Parameter [botRecommendationId] :
  /// The identifier of the bot recommendation that contains the recommended
  /// intents.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the recommended intents.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the recommended intents.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bot recommendations to return in each page of
  /// results. If there are fewer results than the max page size, only the
  /// actual number of results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListRecommendedIntents operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response. Use that token in the nextToken parameter to return the next
  /// page of results.
  Future<ListRecommendedIntentsResponse> listRecommendedIntents({
    required String botId,
    required String botRecommendationId,
    required String botVersion,
    required String localeId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/botrecommendations/${Uri.encodeComponent(botRecommendationId)}/intents',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendedIntentsResponse.fromJson(response);
  }

  /// Gets a list of slot types that match the specified criteria.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the slot types.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the slot type.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the slot types to list. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [filters] :
  /// Provides the specification of a filter used to limit the slot types in the
  /// response to only those that match the filter specification. You can only
  /// specify one filter and only one string to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of slot types to return in each page of results. If
  /// there are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListSlotTypes</code> operation contains
  /// more results than specified in the <code>maxResults</code> parameter, a
  /// token is returned in the response. Use that token in the
  /// <code>nextToken</code> parameter to return the next page of results.
  ///
  /// Parameter [sortBy] :
  /// Determines the sort order for the response from the
  /// <code>ListSlotTypes</code> operation. You can choose to sort by the slot
  /// type name or last updated date in either ascending or descending order.
  Future<ListSlotTypesResponse> listSlotTypes({
    required String botId,
    required String botVersion,
    required String localeId,
    List<SlotTypeFilter>? filters,
    int? maxResults,
    String? nextToken,
    SlotTypeSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/slottypes/',
      exceptionFnMap: _exceptionFns,
    );
    return ListSlotTypesResponse.fromJson(response);
  }

  /// Gets a list of slots that match the specified criteria.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that contains the slot.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the slot.
  ///
  /// Parameter [intentId] :
  /// The unique identifier of the intent that contains the slot.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the slots to list. The string
  /// must match one of the supported locales. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [filters] :
  /// Provides the specification of a filter used to limit the slots in the
  /// response to only those that match the filter specification. You can only
  /// specify one filter and only one string to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of slots to return in each page of results. If there
  /// are fewer results than the max page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListSlots</code> operation contains more
  /// results than specified in the <code>maxResults</code> parameter, a token
  /// is returned in the response. Use that token in the <code>nextToken</code>
  /// parameter to return the next page of results.
  ///
  /// Parameter [sortBy] :
  /// Determines the sort order for the response from the <code>ListSlots</code>
  /// operation. You can choose to sort by the slot name or last updated date in
  /// either ascending or descending order.
  Future<ListSlotsResponse> listSlots({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
    List<SlotFilter>? filters,
    int? maxResults,
    String? nextToken,
    SlotSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/slots/',
      exceptionFnMap: _exceptionFns,
    );
    return ListSlotsResponse.fromJson(response);
  }

  /// Gets a list of tags associated with a resource. Only bots, bot aliases,
  /// and bot channels can have tags associated with them.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to get a list of tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceARN)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Search for associated transcripts that meet the specified criteria.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot associated with the transcripts that you
  /// are searching.
  ///
  /// Parameter [botRecommendationId] :
  /// The unique identifier of the bot recommendation associated with the
  /// transcripts to search.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot containing the transcripts that you are searching.
  ///
  /// Parameter [filters] :
  /// A list of filter objects.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the transcripts to search.
  /// The string must match one of the supported locales. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bot recommendations to return in each page of
  /// results. If there are fewer results than the max page size, only the
  /// actual number of results are returned.
  ///
  /// Parameter [nextIndex] :
  /// If the response from the SearchAssociatedTranscriptsRequest operation
  /// contains more results than specified in the maxResults parameter, an index
  /// is returned in the response. Use that index in the nextIndex parameter to
  /// return the next page of results.
  ///
  /// Parameter [searchOrder] :
  /// How SearchResults are ordered. Valid values are Ascending or Descending.
  /// The default is Descending.
  Future<SearchAssociatedTranscriptsResponse> searchAssociatedTranscripts({
    required String botId,
    required String botRecommendationId,
    required String botVersion,
    required List<AssociatedTranscriptFilter> filters,
    required String localeId,
    int? maxResults,
    int? nextIndex,
    SearchOrder? searchOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateNumRange(
      'nextIndex',
      nextIndex,
      0,
      10000000,
    );
    final $payload = <String, dynamic>{
      'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextIndex != null) 'nextIndex': nextIndex,
      if (searchOrder != null) 'searchOrder': searchOrder.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/botrecommendations/${Uri.encodeComponent(botRecommendationId)}/associatedtranscripts',
      exceptionFnMap: _exceptionFns,
    );
    return SearchAssociatedTranscriptsResponse.fromJson(response);
  }

  /// Use this to provide your transcript data, and to start the bot
  /// recommendation process.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot containing the bot recommendation.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot containing the bot recommendation.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the bot recommendation to
  /// start. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  ///
  /// Parameter [transcriptSourceSetting] :
  /// The object representing the Amazon S3 bucket containing the transcript, as
  /// well as the associated metadata.
  ///
  /// Parameter [encryptionSetting] :
  /// The object representing the passwords that will be used to encrypt the
  /// data related to the bot recommendation results, as well as the KMS key ARN
  /// used to encrypt the associated metadata.
  Future<StartBotRecommendationResponse> startBotRecommendation({
    required String botId,
    required String botVersion,
    required String localeId,
    required TranscriptSourceSetting transcriptSourceSetting,
    EncryptionSetting? encryptionSetting,
  }) async {
    final $payload = <String, dynamic>{
      'transcriptSourceSetting': transcriptSourceSetting,
      if (encryptionSetting != null) 'encryptionSetting': encryptionSetting,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/botrecommendations/',
      exceptionFnMap: _exceptionFns,
    );
    return StartBotRecommendationResponse.fromJson(response);
  }

  /// Starts importing a bot, bot locale, or custom vocabulary from a zip
  /// archive that you uploaded to an S3 bucket.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [importId] :
  /// The unique identifier for the import. It is included in the response from
  /// the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_CreateUploadUrl.html">CreateUploadUrl</a>
  /// operation.
  ///
  /// Parameter [mergeStrategy] :
  /// The strategy to use when there is a name conflict between the imported
  /// resource and an existing resource. When the merge strategy is
  /// <code>FailOnConflict</code> existing resources are not overwritten and the
  /// import fails.
  ///
  /// Parameter [resourceSpecification] :
  /// Parameters for creating the bot, bot locale or custom vocabulary.
  ///
  /// Parameter [filePassword] :
  /// The password used to encrypt the zip archive that contains the resource
  /// definition. You should always encrypt the zip archive to protect it during
  /// transit between your site and Amazon Lex.
  Future<StartImportResponse> startImport({
    required String importId,
    required MergeStrategy mergeStrategy,
    required ImportResourceSpecification resourceSpecification,
    String? filePassword,
  }) async {
    final $payload = <String, dynamic>{
      'importId': importId,
      'mergeStrategy': mergeStrategy.toValue(),
      'resourceSpecification': resourceSpecification,
      if (filePassword != null) 'filePassword': filePassword,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/imports/',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportResponse.fromJson(response);
  }

  /// Stop an already running Bot Recommendation request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot containing the bot recommendation to be
  /// stopped.
  ///
  /// Parameter [botRecommendationId] :
  /// The unique identifier of the bot recommendation to be stopped.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot containing the bot recommendation.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the bot recommendation to
  /// stop. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  Future<StopBotRecommendationResponse> stopBotRecommendation({
    required String botId,
    required String botRecommendationId,
    required String botVersion,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/botrecommendations/${Uri.encodeComponent(botRecommendationId)}/stopbotrecommendation',
      exceptionFnMap: _exceptionFns,
    );
    return StopBotRecommendationResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource. If a tag key already
  /// exists, the existing value is replaced with the new value.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the bot, bot alias, or bot channel to
  /// tag.
  ///
  /// Parameter [tags] :
  /// A list of tag keys to add to the resource. If a tag key already exists,
  /// the existing value is replaced with the new value.
  Future<void> tagResource({
    required String resourceARN,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceARN)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a bot, bot alias, or bot channel.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to remove the tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource. If a tag key does not
  /// exist on the resource, it is ignored.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceARN)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration of an existing bot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot to update. This identifier is returned by
  /// the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_CreateBot.html">CreateBot</a>
  /// operation.
  ///
  /// Parameter [botName] :
  /// The new name of the bot. The name must be unique in the account that
  /// creates the bot.
  ///
  /// Parameter [dataPrivacy] :
  /// Provides information on additional privacy protections Amazon Lex should
  /// use with the bot's data.
  ///
  /// Parameter [idleSessionTTLInSeconds] :
  /// The time, in seconds, that Amazon Lex should keep information about a
  /// user's conversation with the bot.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon Lex
  /// deletes any data provided before the timeout.
  ///
  /// You can specify between 60 (1 minute) and 86,400 (24 hours) seconds.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to
  /// access the bot.
  ///
  /// Parameter [botMembers] :
  /// The list of bot members in the network associated with the update action.
  ///
  /// Parameter [botType] :
  /// The type of the bot to be updated.
  ///
  /// Parameter [description] :
  /// A description of the bot.
  Future<UpdateBotResponse> updateBot({
    required String botId,
    required String botName,
    required DataPrivacy dataPrivacy,
    required int idleSessionTTLInSeconds,
    required String roleArn,
    List<BotMember>? botMembers,
    BotType? botType,
    String? description,
  }) async {
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      86400,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'botName': botName,
      'dataPrivacy': dataPrivacy,
      'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      'roleArn': roleArn,
      if (botMembers != null) 'botMembers': botMembers,
      if (botType != null) 'botType': botType.toValue(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBotResponse.fromJson(response);
  }

  /// Updates the configuration of an existing bot alias.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botAliasId] :
  /// The unique identifier of the bot alias.
  ///
  /// Parameter [botAliasName] :
  /// The new name to assign to the bot alias.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot with the updated alias.
  ///
  /// Parameter [botAliasLocaleSettings] :
  /// The new Lambda functions to use in each locale for the bot alias.
  ///
  /// Parameter [botVersion] :
  /// The new bot version to assign to the bot alias.
  ///
  /// Parameter [conversationLogSettings] :
  /// The new settings for storing conversation logs in Amazon CloudWatch Logs
  /// and Amazon S3 buckets.
  ///
  /// Parameter [description] :
  /// The new description to assign to the bot alias.
  Future<UpdateBotAliasResponse> updateBotAlias({
    required String botAliasId,
    required String botAliasName,
    required String botId,
    Map<String, BotAliasLocaleSettings>? botAliasLocaleSettings,
    String? botVersion,
    ConversationLogSettings? conversationLogSettings,
    String? description,
    SentimentAnalysisSettings? sentimentAnalysisSettings,
  }) async {
    final $payload = <String, dynamic>{
      'botAliasName': botAliasName,
      if (botAliasLocaleSettings != null)
        'botAliasLocaleSettings': botAliasLocaleSettings,
      if (botVersion != null) 'botVersion': botVersion,
      if (conversationLogSettings != null)
        'conversationLogSettings': conversationLogSettings,
      if (description != null) 'description': description,
      if (sentimentAnalysisSettings != null)
        'sentimentAnalysisSettings': sentimentAnalysisSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botaliases/${Uri.encodeComponent(botAliasId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBotAliasResponse.fromJson(response);
  }

  /// Updates the settings that a bot has for a specific locale.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the locale.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the locale to be updated. The version
  /// can only be the <code>DRAFT</code> version.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale to update. The string must match
  /// one of the supported locales. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [nluIntentConfidenceThreshold] :
  /// The new confidence threshold where Amazon Lex inserts the
  /// <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> intents in the list of possible
  /// intents for an utterance.
  ///
  /// Parameter [description] :
  /// The new description of the locale.
  ///
  /// Parameter [voiceSettings] :
  /// The new Amazon Polly voice Amazon Lex should use for voice interaction
  /// with the user.
  Future<UpdateBotLocaleResponse> updateBotLocale({
    required String botId,
    required String botVersion,
    required String localeId,
    required double nluIntentConfidenceThreshold,
    String? description,
    VoiceSettings? voiceSettings,
  }) async {
    _s.validateNumRange(
      'nluIntentConfidenceThreshold',
      nluIntentConfidenceThreshold,
      0,
      1,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (description != null) 'description': description,
      if (voiceSettings != null) 'voiceSettings': voiceSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBotLocaleResponse.fromJson(response);
  }

  /// Updates an existing bot recommendation request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot containing the bot recommendation to be
  /// updated.
  ///
  /// Parameter [botRecommendationId] :
  /// The unique identifier of the bot recommendation to be updated.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot containing the bot recommendation to be updated.
  ///
  /// Parameter [encryptionSetting] :
  /// The object representing the passwords that will be used to encrypt the
  /// data related to the bot recommendation results, as well as the KMS key ARN
  /// used to encrypt the associated metadata.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale of the bot recommendation to
  /// update. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  Future<UpdateBotRecommendationResponse> updateBotRecommendation({
    required String botId,
    required String botRecommendationId,
    required String botVersion,
    required EncryptionSetting encryptionSetting,
    required String localeId,
  }) async {
    final $payload = <String, dynamic>{
      'encryptionSetting': encryptionSetting,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/botrecommendations/${Uri.encodeComponent(botRecommendationId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBotRecommendationResponse.fromJson(response);
  }

  /// Updates the password used to protect an export zip archive.
  ///
  /// The password is not required. If you don't supply a password, Amazon Lex
  /// generates a zip file that is not protected by a password. This is the
  /// archive that is available at the pre-signed S3 URL provided by the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_DescribeExport.html">DescribeExport</a>
  /// operation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [exportId] :
  /// The unique identifier Amazon Lex assigned to the export.
  ///
  /// Parameter [filePassword] :
  /// The new password to use to encrypt the export zip archive.
  Future<UpdateExportResponse> updateExport({
    required String exportId,
    String? filePassword,
  }) async {
    final $payload = <String, dynamic>{
      if (filePassword != null) 'filePassword': filePassword,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/exports/${Uri.encodeComponent(exportId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateExportResponse.fromJson(response);
  }

  /// Updates the settings for an intent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that contains the intent.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the intent. Must be
  /// <code>DRAFT</code>.
  ///
  /// Parameter [intentId] :
  /// The unique identifier of the intent to update.
  ///
  /// Parameter [intentName] :
  /// The new name for the intent.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale where this intent is used. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [description] :
  /// The new description of the intent.
  ///
  /// Parameter [dialogCodeHook] :
  /// The new Lambda function to use between each turn of the conversation with
  /// the bot.
  ///
  /// Parameter [fulfillmentCodeHook] :
  /// The new Lambda function to call when all of the intents required slots are
  /// provided and the intent is ready for fulfillment.
  ///
  /// Parameter [initialResponseSetting] :
  /// <p/>
  ///
  /// Parameter [inputContexts] :
  /// A new list of contexts that must be active in order for Amazon Lex to
  /// consider the intent.
  ///
  /// Parameter [intentClosingSetting] :
  /// The new response that Amazon Lex sends the user when the intent is closed.
  ///
  /// Parameter [intentConfirmationSetting] :
  /// New prompts that Amazon Lex sends to the user to confirm the completion of
  /// an intent.
  ///
  /// Parameter [kendraConfiguration] :
  /// New configuration settings for connecting to an Amazon Kendra index.
  ///
  /// Parameter [outputContexts] :
  /// A new list of contexts that Amazon Lex activates when the intent is
  /// fulfilled.
  ///
  /// Parameter [parentIntentSignature] :
  /// The signature of the new built-in intent to use as the parent of this
  /// intent.
  ///
  /// Parameter [sampleUtterances] :
  /// New utterances used to invoke the intent.
  ///
  /// Parameter [slotPriorities] :
  /// A new list of slots and their priorities that are contained by the intent.
  Future<UpdateIntentResponse> updateIntent({
    required String botId,
    required String botVersion,
    required String intentId,
    required String intentName,
    required String localeId,
    String? description,
    DialogCodeHookSettings? dialogCodeHook,
    FulfillmentCodeHookSettings? fulfillmentCodeHook,
    InitialResponseSetting? initialResponseSetting,
    List<InputContext>? inputContexts,
    IntentClosingSetting? intentClosingSetting,
    IntentConfirmationSetting? intentConfirmationSetting,
    KendraConfiguration? kendraConfiguration,
    List<OutputContext>? outputContexts,
    String? parentIntentSignature,
    List<SampleUtterance>? sampleUtterances,
    List<SlotPriority>? slotPriorities,
  }) async {
    final $payload = <String, dynamic>{
      'intentName': intentName,
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (fulfillmentCodeHook != null)
        'fulfillmentCodeHook': fulfillmentCodeHook,
      if (initialResponseSetting != null)
        'initialResponseSetting': initialResponseSetting,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (intentClosingSetting != null)
        'intentClosingSetting': intentClosingSetting,
      if (intentConfirmationSetting != null)
        'intentConfirmationSetting': intentConfirmationSetting,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slotPriorities != null) 'slotPriorities': slotPriorities,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIntentResponse.fromJson(response);
  }

  /// Replaces the existing resource policy for a bot or bot alias with a new
  /// one. If the policy doesn't exist, Amazon Lex returns an exception.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PreconditionFailedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [policy] :
  /// A resource policy to add to the resource. The policy is a JSON structure
  /// that contains one or more statements that define the policy. The policy
  /// must follow the IAM syntax. For more information about the contents of a
  /// JSON policy document, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">
  /// IAM JSON policy reference </a>.
  ///
  /// If the policy isn't valid, Amazon Lex returns a validation exception.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  ///
  /// Parameter [expectedRevisionId] :
  /// The identifier of the revision of the policy to update. If this revision
  /// ID doesn't match the current revision ID, Amazon Lex throws an exception.
  ///
  /// If you don't specify a revision, Amazon Lex overwrites the contents of the
  /// policy with the new values.
  Future<UpdateResourcePolicyResponse> updateResourcePolicy({
    required String policy,
    required String resourceArn,
    String? expectedRevisionId,
  }) async {
    final $query = <String, List<String>>{
      if (expectedRevisionId != null)
        'expectedRevisionId': [expectedRevisionId],
    };
    final $payload = <String, dynamic>{
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/policy/${Uri.encodeComponent(resourceArn)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResourcePolicyResponse.fromJson(response);
  }

  /// Updates the settings for a slot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot that contains the slot.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the slot. Must always be
  /// <code>DRAFT</code>.
  ///
  /// Parameter [intentId] :
  /// The identifier of the intent that contains the slot.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that contains the slot. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotId] :
  /// The unique identifier for the slot to update.
  ///
  /// Parameter [slotName] :
  /// The new name for the slot.
  ///
  /// Parameter [valueElicitationSetting] :
  /// A new set of prompts that Amazon Lex sends to the user to elicit a
  /// response the provides a value for the slot.
  ///
  /// Parameter [description] :
  /// The new description for the slot.
  ///
  /// Parameter [multipleValuesSetting] :
  /// Determines whether the slot accepts multiple values in one response.
  /// Multiple value slots are only available in the en-US locale. If you set
  /// this value to <code>true</code> in any other locale, Amazon Lex throws a
  /// <code>ValidationException</code>.
  ///
  /// If the <code>multipleValuesSetting</code> is not set, the default value is
  /// <code>false</code>.
  ///
  /// Parameter [obfuscationSetting] :
  /// New settings that determine how slot values are formatted in Amazon
  /// CloudWatch logs.
  ///
  /// Parameter [slotTypeId] :
  /// The unique identifier of the new slot type to associate with this slot.
  ///
  /// Parameter [subSlotSetting] :
  /// Specifications for the constituent sub slots and the expression for the
  /// composite slot.
  Future<UpdateSlotResponse> updateSlot({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
    required String slotId,
    required String slotName,
    required SlotValueElicitationSetting valueElicitationSetting,
    String? description,
    MultipleValuesSetting? multipleValuesSetting,
    ObfuscationSetting? obfuscationSetting,
    String? slotTypeId,
    SubSlotSetting? subSlotSetting,
  }) async {
    final $payload = <String, dynamic>{
      'slotName': slotName,
      'valueElicitationSetting': valueElicitationSetting,
      if (description != null) 'description': description,
      if (multipleValuesSetting != null)
        'multipleValuesSetting': multipleValuesSetting,
      if (obfuscationSetting != null) 'obfuscationSetting': obfuscationSetting,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (subSlotSetting != null) 'subSlotSetting': subSlotSetting,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/intents/${Uri.encodeComponent(intentId)}/slots/${Uri.encodeComponent(slotId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSlotResponse.fromJson(response);
  }

  /// Updates the configuration of an existing slot type.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that contains the slot type.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot that contains the slot type. Must be
  /// <code>DRAFT</code>.
  ///
  /// Parameter [localeId] :
  /// The identifier of the language and locale that contains the slot type. The
  /// string must match one of the supported locales. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  ///
  /// Parameter [slotTypeId] :
  /// The unique identifier of the slot type to update.
  ///
  /// Parameter [slotTypeName] :
  /// The new name of the slot type.
  ///
  /// Parameter [compositeSlotTypeSetting] :
  /// Specifications for a composite slot type.
  ///
  /// Parameter [description] :
  /// The new description of the slot type.
  ///
  /// Parameter [parentSlotTypeSignature] :
  /// The new built-in slot type that should be used as the parent of this slot
  /// type.
  ///
  /// Parameter [slotTypeValues] :
  /// A new list of values and their optional synonyms that define the values
  /// that the slot type can take.
  ///
  /// Parameter [valueSelectionSetting] :
  /// The strategy that Amazon Lex should use when deciding on a value from the
  /// list of slot type values.
  Future<UpdateSlotTypeResponse> updateSlotType({
    required String botId,
    required String botVersion,
    required String localeId,
    required String slotTypeId,
    required String slotTypeName,
    CompositeSlotTypeSetting? compositeSlotTypeSetting,
    String? description,
    ExternalSourceSetting? externalSourceSetting,
    String? parentSlotTypeSignature,
    List<SlotTypeValue>? slotTypeValues,
    SlotValueSelectionSetting? valueSelectionSetting,
  }) async {
    final $payload = <String, dynamic>{
      'slotTypeName': slotTypeName,
      if (compositeSlotTypeSetting != null)
        'compositeSlotTypeSetting': compositeSlotTypeSetting,
      if (description != null) 'description': description,
      if (externalSourceSetting != null)
        'externalSourceSetting': externalSourceSetting,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeValues != null) 'slotTypeValues': slotTypeValues,
      if (valueSelectionSetting != null)
        'valueSelectionSetting': valueSelectionSetting,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/slottypes/${Uri.encodeComponent(slotTypeId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSlotTypeResponse.fromJson(response);
  }
}

/// Provides settings that enable advanced recognition settings for slot values.
class AdvancedRecognitionSetting {
  /// Enables using the slot values as a custom vocabulary for recognizing user
  /// utterances.
  final AudioRecognitionStrategy? audioRecognitionStrategy;

  AdvancedRecognitionSetting({
    this.audioRecognitionStrategy,
  });

  factory AdvancedRecognitionSetting.fromJson(Map<String, dynamic> json) {
    return AdvancedRecognitionSetting(
      audioRecognitionStrategy: (json['audioRecognitionStrategy'] as String?)
          ?.toAudioRecognitionStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioRecognitionStrategy = this.audioRecognitionStrategy;
    return {
      if (audioRecognitionStrategy != null)
        'audioRecognitionStrategy': audioRecognitionStrategy.toValue(),
    };
  }
}

/// Filters responses returned by the <code>ListAggregatedUtterances</code>
/// operation.
class AggregatedUtterancesFilter {
  /// The name of the field to filter the utterance list.
  final AggregatedUtterancesFilterName name;

  /// The operator to use for the filter. Specify <code>EQ</code> when the
  /// <code>ListAggregatedUtterances</code> operation should return only
  /// utterances that equal the specified value. Specify <code>CO</code> when the
  /// <code>ListAggregatedUtterances</code> operation should return utterances
  /// that contain the specified value.
  final AggregatedUtterancesFilterOperator operator;

  /// The value to use for filtering the list of bots.
  final List<String> values;

  AggregatedUtterancesFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum AggregatedUtterancesFilterName {
  utterance,
}

extension AggregatedUtterancesFilterNameValueExtension
    on AggregatedUtterancesFilterName {
  String toValue() {
    switch (this) {
      case AggregatedUtterancesFilterName.utterance:
        return 'Utterance';
    }
  }
}

extension AggregatedUtterancesFilterNameFromString on String {
  AggregatedUtterancesFilterName toAggregatedUtterancesFilterName() {
    switch (this) {
      case 'Utterance':
        return AggregatedUtterancesFilterName.utterance;
    }
    throw Exception(
        '$this is not known in enum AggregatedUtterancesFilterName');
  }
}

enum AggregatedUtterancesFilterOperator {
  co,
  eq,
}

extension AggregatedUtterancesFilterOperatorValueExtension
    on AggregatedUtterancesFilterOperator {
  String toValue() {
    switch (this) {
      case AggregatedUtterancesFilterOperator.co:
        return 'CO';
      case AggregatedUtterancesFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension AggregatedUtterancesFilterOperatorFromString on String {
  AggregatedUtterancesFilterOperator toAggregatedUtterancesFilterOperator() {
    switch (this) {
      case 'CO':
        return AggregatedUtterancesFilterOperator.co;
      case 'EQ':
        return AggregatedUtterancesFilterOperator.eq;
    }
    throw Exception(
        '$this is not known in enum AggregatedUtterancesFilterOperator');
  }
}

enum AggregatedUtterancesSortAttribute {
  hitCount,
  missedCount,
}

extension AggregatedUtterancesSortAttributeValueExtension
    on AggregatedUtterancesSortAttribute {
  String toValue() {
    switch (this) {
      case AggregatedUtterancesSortAttribute.hitCount:
        return 'HitCount';
      case AggregatedUtterancesSortAttribute.missedCount:
        return 'MissedCount';
    }
  }
}

extension AggregatedUtterancesSortAttributeFromString on String {
  AggregatedUtterancesSortAttribute toAggregatedUtterancesSortAttribute() {
    switch (this) {
      case 'HitCount':
        return AggregatedUtterancesSortAttribute.hitCount;
      case 'MissedCount':
        return AggregatedUtterancesSortAttribute.missedCount;
    }
    throw Exception(
        '$this is not known in enum AggregatedUtterancesSortAttribute');
  }
}

/// Specifies attributes for sorting a list of utterances.
class AggregatedUtterancesSortBy {
  /// The utterance attribute to sort by.
  final AggregatedUtterancesSortAttribute attribute;

  /// Specifies whether to sort the aggregated utterances in ascending or
  /// descending order.
  final SortOrder order;

  AggregatedUtterancesSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

/// Provides summary information for aggregated utterances. The
/// <code>ListAggregatedUtterances</code> operations combines all instances of
/// the same utterance into a single aggregated summary.
class AggregatedUtterancesSummary {
  /// Aggregated utterance data may contain utterances from versions of your bot
  /// that have since been deleted. When the aggregated contains this kind of
  /// data, this field is set to true.
  final bool? containsDataFromDeletedResources;

  /// The number of times that the utterance was detected by Amazon Lex during the
  /// time period. When an utterance is detected, it activates an intent or a
  /// slot.
  final int? hitCount;

  /// The number of times that the utterance was missed by Amazon Lex An utterance
  /// is missed when it doesn't activate an intent or slot.
  final int? missedCount;

  /// The text of the utterance. If the utterance was used with the
  /// <code>RecognizeUtterance</code> operation, the text is the transcription of
  /// the audio utterance.
  final String? utterance;

  /// The date and time that the utterance was first recorded in the time window
  /// for aggregation. An utterance may have been sent to Amazon Lex before that
  /// time, but only utterances within the time window are counted.
  final DateTime? utteranceFirstRecordedInAggregationDuration;

  /// The last date and time that an utterance was recorded in the time window for
  /// aggregation. An utterance may be sent to Amazon Lex after that time, but
  /// only utterances within the time window are counted.
  final DateTime? utteranceLastRecordedInAggregationDuration;

  AggregatedUtterancesSummary({
    this.containsDataFromDeletedResources,
    this.hitCount,
    this.missedCount,
    this.utterance,
    this.utteranceFirstRecordedInAggregationDuration,
    this.utteranceLastRecordedInAggregationDuration,
  });

  factory AggregatedUtterancesSummary.fromJson(Map<String, dynamic> json) {
    return AggregatedUtterancesSummary(
      containsDataFromDeletedResources:
          json['containsDataFromDeletedResources'] as bool?,
      hitCount: json['hitCount'] as int?,
      missedCount: json['missedCount'] as int?,
      utterance: json['utterance'] as String?,
      utteranceFirstRecordedInAggregationDuration: timeStampFromJson(
          json['utteranceFirstRecordedInAggregationDuration']),
      utteranceLastRecordedInAggregationDuration:
          timeStampFromJson(json['utteranceLastRecordedInAggregationDuration']),
    );
  }

  Map<String, dynamic> toJson() {
    final containsDataFromDeletedResources =
        this.containsDataFromDeletedResources;
    final hitCount = this.hitCount;
    final missedCount = this.missedCount;
    final utterance = this.utterance;
    final utteranceFirstRecordedInAggregationDuration =
        this.utteranceFirstRecordedInAggregationDuration;
    final utteranceLastRecordedInAggregationDuration =
        this.utteranceLastRecordedInAggregationDuration;
    return {
      if (containsDataFromDeletedResources != null)
        'containsDataFromDeletedResources': containsDataFromDeletedResources,
      if (hitCount != null) 'hitCount': hitCount,
      if (missedCount != null) 'missedCount': missedCount,
      if (utterance != null) 'utterance': utterance,
      if (utteranceFirstRecordedInAggregationDuration != null)
        'utteranceFirstRecordedInAggregationDuration':
            unixTimestampToJson(utteranceFirstRecordedInAggregationDuration),
      if (utteranceLastRecordedInAggregationDuration != null)
        'utteranceLastRecordedInAggregationDuration':
            unixTimestampToJson(utteranceLastRecordedInAggregationDuration),
    };
  }
}

/// Specifies the allowed input types.
class AllowedInputTypes {
  /// Indicates whether audio input is allowed.
  final bool allowAudioInput;

  /// Indicates whether DTMF input is allowed.
  final bool allowDTMFInput;

  AllowedInputTypes({
    required this.allowAudioInput,
    required this.allowDTMFInput,
  });

  factory AllowedInputTypes.fromJson(Map<String, dynamic> json) {
    return AllowedInputTypes(
      allowAudioInput: json['allowAudioInput'] as bool,
      allowDTMFInput: json['allowDTMFInput'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final allowAudioInput = this.allowAudioInput;
    final allowDTMFInput = this.allowDTMFInput;
    return {
      'allowAudioInput': allowAudioInput,
      'allowDTMFInput': allowDTMFInput,
    };
  }
}

/// The object containing information that associates the recommended
/// intent/slot type with a conversation.
class AssociatedTranscript {
  /// The content of the transcript that meets the search filter criteria. For the
  /// JSON format of the transcript, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/designing-output-format.html">Output
  /// transcript format</a>.
  final String? transcript;

  AssociatedTranscript({
    this.transcript,
  });

  factory AssociatedTranscript.fromJson(Map<String, dynamic> json) {
    return AssociatedTranscript(
      transcript: json['transcript'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transcript = this.transcript;
    return {
      if (transcript != null) 'transcript': transcript,
    };
  }
}

/// Filters to search for the associated transcript.
class AssociatedTranscriptFilter {
  /// The name of the field to use for filtering. The allowed names are IntentId
  /// and SlotTypeId.
  final AssociatedTranscriptFilterName name;

  /// The values to use to filter the transcript.
  final List<String> values;

  AssociatedTranscriptFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.toValue(),
      'values': values,
    };
  }
}

enum AssociatedTranscriptFilterName {
  intentId,
  slotTypeId,
}

extension AssociatedTranscriptFilterNameValueExtension
    on AssociatedTranscriptFilterName {
  String toValue() {
    switch (this) {
      case AssociatedTranscriptFilterName.intentId:
        return 'IntentId';
      case AssociatedTranscriptFilterName.slotTypeId:
        return 'SlotTypeId';
    }
  }
}

extension AssociatedTranscriptFilterNameFromString on String {
  AssociatedTranscriptFilterName toAssociatedTranscriptFilterName() {
    switch (this) {
      case 'IntentId':
        return AssociatedTranscriptFilterName.intentId;
      case 'SlotTypeId':
        return AssociatedTranscriptFilterName.slotTypeId;
    }
    throw Exception(
        '$this is not known in enum AssociatedTranscriptFilterName');
  }
}

/// Specifies the audio and DTMF input specification.
class AudioAndDTMFInputSpecification {
  /// Time for which a bot waits before assuming that the customer isn't going to
  /// speak or press a key. This timeout is shared between Audio and DTMF inputs.
  final int startTimeoutMs;

  /// Specifies the settings on audio input.
  final AudioSpecification? audioSpecification;

  /// Specifies the settings on DTMF input.
  final DTMFSpecification? dtmfSpecification;

  AudioAndDTMFInputSpecification({
    required this.startTimeoutMs,
    this.audioSpecification,
    this.dtmfSpecification,
  });

  factory AudioAndDTMFInputSpecification.fromJson(Map<String, dynamic> json) {
    return AudioAndDTMFInputSpecification(
      startTimeoutMs: json['startTimeoutMs'] as int,
      audioSpecification: json['audioSpecification'] != null
          ? AudioSpecification.fromJson(
              json['audioSpecification'] as Map<String, dynamic>)
          : null,
      dtmfSpecification: json['dtmfSpecification'] != null
          ? DTMFSpecification.fromJson(
              json['dtmfSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final startTimeoutMs = this.startTimeoutMs;
    final audioSpecification = this.audioSpecification;
    final dtmfSpecification = this.dtmfSpecification;
    return {
      'startTimeoutMs': startTimeoutMs,
      if (audioSpecification != null) 'audioSpecification': audioSpecification,
      if (dtmfSpecification != null) 'dtmfSpecification': dtmfSpecification,
    };
  }
}

/// The location of audio log files collected when conversation logging is
/// enabled for a bot.
class AudioLogDestination {
  /// The Amazon S3 bucket where the audio log files are stored. The IAM role
  /// specified in the <code>roleArn</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_CreateBot.html">CreateBot</a>
  /// operation must have permission to write to this bucket.
  final S3BucketLogDestination s3Bucket;

  AudioLogDestination({
    required this.s3Bucket,
  });

  factory AudioLogDestination.fromJson(Map<String, dynamic> json) {
    return AudioLogDestination(
      s3Bucket: S3BucketLogDestination.fromJson(
          json['s3Bucket'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    return {
      's3Bucket': s3Bucket,
    };
  }
}

/// Settings for logging audio of conversations between Amazon Lex and a user.
/// You specify whether to log audio and the Amazon S3 bucket where the audio
/// file is stored.
class AudioLogSetting {
  final AudioLogDestination destination;

  /// Determines whether audio logging in enabled for the bot.
  final bool enabled;

  AudioLogSetting({
    required this.destination,
    required this.enabled,
  });

  factory AudioLogSetting.fromJson(Map<String, dynamic> json) {
    return AudioLogSetting(
      destination: AudioLogDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final enabled = this.enabled;
    return {
      'destination': destination,
      'enabled': enabled,
    };
  }
}

enum AudioRecognitionStrategy {
  useSlotValuesAsCustomVocabulary,
}

extension AudioRecognitionStrategyValueExtension on AudioRecognitionStrategy {
  String toValue() {
    switch (this) {
      case AudioRecognitionStrategy.useSlotValuesAsCustomVocabulary:
        return 'UseSlotValuesAsCustomVocabulary';
    }
  }
}

extension AudioRecognitionStrategyFromString on String {
  AudioRecognitionStrategy toAudioRecognitionStrategy() {
    switch (this) {
      case 'UseSlotValuesAsCustomVocabulary':
        return AudioRecognitionStrategy.useSlotValuesAsCustomVocabulary;
    }
    throw Exception('$this is not known in enum AudioRecognitionStrategy');
  }
}

/// Specifies the audio input specifications.
class AudioSpecification {
  /// Time for which a bot waits after the customer stops speaking to assume the
  /// utterance is finished.
  final int endTimeoutMs;

  /// Time for how long Amazon Lex waits before speech input is truncated and the
  /// speech is returned to application.
  final int maxLengthMs;

  AudioSpecification({
    required this.endTimeoutMs,
    required this.maxLengthMs,
  });

  factory AudioSpecification.fromJson(Map<String, dynamic> json) {
    return AudioSpecification(
      endTimeoutMs: json['endTimeoutMs'] as int,
      maxLengthMs: json['maxLengthMs'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final endTimeoutMs = this.endTimeoutMs;
    final maxLengthMs = this.maxLengthMs;
    return {
      'endTimeoutMs': endTimeoutMs,
      'maxLengthMs': maxLengthMs,
    };
  }
}

class BatchCreateCustomVocabularyItemResponse {
  /// The identifier of the bot associated with this custom vocabulary.
  final String? botId;

  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  final String? botVersion;

  /// A list of custom vocabulary items that failed to create during the
  /// operation. The reason for the error is contained within each error object.
  final List<FailedCustomVocabularyItem>? errors;

  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">
  /// Supported Languages </a>.
  final String? localeId;

  /// A list of custom vocabulary items that were successfully created during the
  /// operation.
  final List<CustomVocabularyItem>? resources;

  BatchCreateCustomVocabularyItemResponse({
    this.botId,
    this.botVersion,
    this.errors,
    this.localeId,
    this.resources,
  });

  factory BatchCreateCustomVocabularyItemResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateCustomVocabularyItemResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedCustomVocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => CustomVocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final errors = this.errors;
    final localeId = this.localeId;
    final resources = this.resources;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (errors != null) 'errors': errors,
      if (localeId != null) 'localeId': localeId,
      if (resources != null) 'resources': resources,
    };
  }
}

class BatchDeleteCustomVocabularyItemResponse {
  /// The identifier of the bot associated with this custom vocabulary.
  final String? botId;

  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  final String? botVersion;

  /// A list of custom vocabulary items that failed to delete during the
  /// operation. The reason for the error is contained within each error object.
  final List<FailedCustomVocabularyItem>? errors;

  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see Supported languages
  /// (https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html).
  final String? localeId;

  /// A list of custom vocabulary items that were successfully deleted during the
  /// operation.
  final List<CustomVocabularyItem>? resources;

  BatchDeleteCustomVocabularyItemResponse({
    this.botId,
    this.botVersion,
    this.errors,
    this.localeId,
    this.resources,
  });

  factory BatchDeleteCustomVocabularyItemResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteCustomVocabularyItemResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedCustomVocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => CustomVocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final errors = this.errors;
    final localeId = this.localeId;
    final resources = this.resources;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (errors != null) 'errors': errors,
      if (localeId != null) 'localeId': localeId,
      if (resources != null) 'resources': resources,
    };
  }
}

class BatchUpdateCustomVocabularyItemResponse {
  /// The identifier of the bot associated with this custom vocabulary.
  final String? botId;

  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  final String? botVersion;

  /// A list of custom vocabulary items that failed to update during the
  /// operation. The reason for the error is contained within each error object.
  final List<FailedCustomVocabularyItem>? errors;

  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">
  /// Supported Languages </a>.
  final String? localeId;

  /// A list of custom vocabulary items that were successfully updated during the
  /// operation.
  final List<CustomVocabularyItem>? resources;

  BatchUpdateCustomVocabularyItemResponse({
    this.botId,
    this.botVersion,
    this.errors,
    this.localeId,
    this.resources,
  });

  factory BatchUpdateCustomVocabularyItemResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateCustomVocabularyItemResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedCustomVocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => CustomVocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final errors = this.errors;
    final localeId = this.localeId;
    final resources = this.resources;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (errors != null) 'errors': errors,
      if (localeId != null) 'localeId': localeId,
      if (resources != null) 'resources': resources,
    };
  }
}

/// Provides a record of an event that affects a bot alias. For example, when
/// the version of a bot that the alias points to changes.
class BotAliasHistoryEvent {
  /// The version of the bot that was used in the event.
  final String? botVersion;

  /// The date and time that the event ended.
  final DateTime? endDate;

  /// The date and time that the event started.
  final DateTime? startDate;

  BotAliasHistoryEvent({
    this.botVersion,
    this.endDate,
    this.startDate,
  });

  factory BotAliasHistoryEvent.fromJson(Map<String, dynamic> json) {
    return BotAliasHistoryEvent(
      botVersion: json['botVersion'] as String?,
      endDate: timeStampFromJson(json['endDate']),
      startDate: timeStampFromJson(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final botVersion = this.botVersion;
    final endDate = this.endDate;
    final startDate = this.startDate;
    return {
      if (botVersion != null) 'botVersion': botVersion,
      if (endDate != null) 'endDate': unixTimestampToJson(endDate),
      if (startDate != null) 'startDate': unixTimestampToJson(startDate),
    };
  }
}

/// Specifies settings that are unique to a locale. For example, you can use
/// different Lambda function depending on the bot's locale.
class BotAliasLocaleSettings {
  /// Determines whether the locale is enabled for the bot. If the value is
  /// <code>false</code>, the locale isn't available for use.
  final bool enabled;

  /// Specifies the Lambda function that should be used in the locale.
  final CodeHookSpecification? codeHookSpecification;

  BotAliasLocaleSettings({
    required this.enabled,
    this.codeHookSpecification,
  });

  factory BotAliasLocaleSettings.fromJson(Map<String, dynamic> json) {
    return BotAliasLocaleSettings(
      enabled: json['enabled'] as bool,
      codeHookSpecification: json['codeHookSpecification'] != null
          ? CodeHookSpecification.fromJson(
              json['codeHookSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final codeHookSpecification = this.codeHookSpecification;
    return {
      'enabled': enabled,
      if (codeHookSpecification != null)
        'codeHookSpecification': codeHookSpecification,
    };
  }
}

enum BotAliasStatus {
  creating,
  available,
  deleting,
  failed,
}

extension BotAliasStatusValueExtension on BotAliasStatus {
  String toValue() {
    switch (this) {
      case BotAliasStatus.creating:
        return 'Creating';
      case BotAliasStatus.available:
        return 'Available';
      case BotAliasStatus.deleting:
        return 'Deleting';
      case BotAliasStatus.failed:
        return 'Failed';
    }
  }
}

extension BotAliasStatusFromString on String {
  BotAliasStatus toBotAliasStatus() {
    switch (this) {
      case 'Creating':
        return BotAliasStatus.creating;
      case 'Available':
        return BotAliasStatus.available;
      case 'Deleting':
        return BotAliasStatus.deleting;
      case 'Failed':
        return BotAliasStatus.failed;
    }
    throw Exception('$this is not known in enum BotAliasStatus');
  }
}

/// Summary information about bot aliases returned from the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListBotAliases.html">ListBotAliases</a>
/// operation.
class BotAliasSummary {
  /// The unique identifier assigned to the bot alias. You can use this ID to get
  /// detailed information about the alias using the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_DescribeBotAlias.html">DescribeBotAlias</a>
  /// operation.
  final String? botAliasId;

  /// The name of the bot alias.
  final String? botAliasName;

  /// The current state of the bot alias. If the status is <code>Available</code>,
  /// the alias is ready for use.
  final BotAliasStatus? botAliasStatus;

  /// The version of the bot that the bot alias references.
  final String? botVersion;

  /// A timestamp of the date and time that the bot alias was created.
  final DateTime? creationDateTime;

  /// The description of the bot alias.
  final String? description;

  /// A timestamp of the date and time that the bot alias was last updated.
  final DateTime? lastUpdatedDateTime;

  BotAliasSummary({
    this.botAliasId,
    this.botAliasName,
    this.botAliasStatus,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.lastUpdatedDateTime,
  });

  factory BotAliasSummary.fromJson(Map<String, dynamic> json) {
    return BotAliasSummary(
      botAliasId: json['botAliasId'] as String?,
      botAliasName: json['botAliasName'] as String?,
      botAliasStatus: (json['botAliasStatus'] as String?)?.toBotAliasStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botAliasName = this.botAliasName;
    final botAliasStatus = this.botAliasStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    return {
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botAliasName != null) 'botAliasName': botAliasName,
      if (botAliasStatus != null) 'botAliasStatus': botAliasStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
    };
  }
}

/// Provides the identity of a the bot that was exported.
class BotExportSpecification {
  /// The identifier of the bot assigned by Amazon Lex.
  final String botId;

  /// The version of the bot that was exported. This will be either
  /// <code>DRAFT</code> or the version number.
  final String botVersion;

  BotExportSpecification({
    required this.botId,
    required this.botVersion,
  });

  factory BotExportSpecification.fromJson(Map<String, dynamic> json) {
    return BotExportSpecification(
      botId: json['botId'] as String,
      botVersion: json['botVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    return {
      'botId': botId,
      'botVersion': botVersion,
    };
  }
}

/// Filters the responses returned by the <code>ListBots</code> operation.
class BotFilter {
  /// The name of the field to filter the list of bots.
  final BotFilterName name;

  /// The operator to use for the filter. Specify <code>EQ</code> when the
  /// <code>ListBots</code> operation should return only aliases that equal the
  /// specified value. Specify <code>CO</code> when the <code>ListBots</code>
  /// operation should return aliases that contain the specified value.
  final BotFilterOperator operator;

  /// The value to use for filtering the list of bots.
  final List<String> values;

  BotFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum BotFilterName {
  botName,
  botType,
}

extension BotFilterNameValueExtension on BotFilterName {
  String toValue() {
    switch (this) {
      case BotFilterName.botName:
        return 'BotName';
      case BotFilterName.botType:
        return 'BotType';
    }
  }
}

extension BotFilterNameFromString on String {
  BotFilterName toBotFilterName() {
    switch (this) {
      case 'BotName':
        return BotFilterName.botName;
      case 'BotType':
        return BotFilterName.botType;
    }
    throw Exception('$this is not known in enum BotFilterName');
  }
}

enum BotFilterOperator {
  co,
  eq,
  ne,
}

extension BotFilterOperatorValueExtension on BotFilterOperator {
  String toValue() {
    switch (this) {
      case BotFilterOperator.co:
        return 'CO';
      case BotFilterOperator.eq:
        return 'EQ';
      case BotFilterOperator.ne:
        return 'NE';
    }
  }
}

extension BotFilterOperatorFromString on String {
  BotFilterOperator toBotFilterOperator() {
    switch (this) {
      case 'CO':
        return BotFilterOperator.co;
      case 'EQ':
        return BotFilterOperator.eq;
      case 'NE':
        return BotFilterOperator.ne;
    }
    throw Exception('$this is not known in enum BotFilterOperator');
  }
}

/// Provides the bot parameters required for importing a bot.
class BotImportSpecification {
  /// The name that Amazon Lex should use for the bot.
  final String botName;
  final DataPrivacy dataPrivacy;

  /// The Amazon Resource Name (ARN) of the IAM role used to build and run the
  /// bot.
  final String roleArn;

  /// A list of tags to add to the bot. You can only add tags when you import a
  /// bot. You can't use the <code>UpdateBot</code> operation to update tags. To
  /// update tags, use the <code>TagResource</code> operation.
  final Map<String, String>? botTags;

  /// The time, in seconds, that Amazon Lex should keep information about a user's
  /// conversation with the bot.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon Lex
  /// deletes any data provided before the timeout.
  ///
  /// You can specify between 60 (1 minute) and 86,400 (24 hours) seconds.
  final int? idleSessionTTLInSeconds;

  /// A list of tags to add to the test alias for a bot. You can only add tags
  /// when you import a bot. You can't use the <code>UpdateAlias</code> operation
  /// to update tags. To update tags on the test alias, use the
  /// <code>TagResource</code> operation.
  final Map<String, String>? testBotAliasTags;

  BotImportSpecification({
    required this.botName,
    required this.dataPrivacy,
    required this.roleArn,
    this.botTags,
    this.idleSessionTTLInSeconds,
    this.testBotAliasTags,
  });

  factory BotImportSpecification.fromJson(Map<String, dynamic> json) {
    return BotImportSpecification(
      botName: json['botName'] as String,
      dataPrivacy:
          DataPrivacy.fromJson(json['dataPrivacy'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      botTags: (json['botTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      testBotAliasTags: (json['testBotAliasTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final botName = this.botName;
    final dataPrivacy = this.dataPrivacy;
    final roleArn = this.roleArn;
    final botTags = this.botTags;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final testBotAliasTags = this.testBotAliasTags;
    return {
      'botName': botName,
      'dataPrivacy': dataPrivacy,
      'roleArn': roleArn,
      if (botTags != null) 'botTags': botTags,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (testBotAliasTags != null) 'testBotAliasTags': testBotAliasTags,
    };
  }
}

/// Provides the bot locale parameters required for exporting a bot locale.
class BotLocaleExportSpecification {
  /// The identifier of the bot to create the locale for.
  final String botId;

  /// The version of the bot to export.
  final String botVersion;

  /// The identifier of the language and locale to export. The string must match
  /// one of the locales in the bot.
  final String localeId;

  BotLocaleExportSpecification({
    required this.botId,
    required this.botVersion,
    required this.localeId,
  });

  factory BotLocaleExportSpecification.fromJson(Map<String, dynamic> json) {
    return BotLocaleExportSpecification(
      botId: json['botId'] as String,
      botVersion: json['botVersion'] as String,
      localeId: json['localeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    return {
      'botId': botId,
      'botVersion': botVersion,
      'localeId': localeId,
    };
  }
}

/// Filters responses returned by the <code>ListBotLocales</code> operation.
class BotLocaleFilter {
  /// The name of the field to filter the list of bots.
  final BotLocaleFilterName name;

  /// The operator to use for the filter. Specify <code>EQ</code> when the
  /// <code>ListBotLocales</code> operation should return only aliases that equal
  /// the specified value. Specify <code>CO</code> when the
  /// <code>ListBotLocales</code> operation should return aliases that contain the
  /// specified value.
  final BotLocaleFilterOperator operator;

  /// The value to use for filtering the list of bots.
  final List<String> values;

  BotLocaleFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum BotLocaleFilterName {
  botLocaleName,
}

extension BotLocaleFilterNameValueExtension on BotLocaleFilterName {
  String toValue() {
    switch (this) {
      case BotLocaleFilterName.botLocaleName:
        return 'BotLocaleName';
    }
  }
}

extension BotLocaleFilterNameFromString on String {
  BotLocaleFilterName toBotLocaleFilterName() {
    switch (this) {
      case 'BotLocaleName':
        return BotLocaleFilterName.botLocaleName;
    }
    throw Exception('$this is not known in enum BotLocaleFilterName');
  }
}

enum BotLocaleFilterOperator {
  co,
  eq,
}

extension BotLocaleFilterOperatorValueExtension on BotLocaleFilterOperator {
  String toValue() {
    switch (this) {
      case BotLocaleFilterOperator.co:
        return 'CO';
      case BotLocaleFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension BotLocaleFilterOperatorFromString on String {
  BotLocaleFilterOperator toBotLocaleFilterOperator() {
    switch (this) {
      case 'CO':
        return BotLocaleFilterOperator.co;
      case 'EQ':
        return BotLocaleFilterOperator.eq;
    }
    throw Exception('$this is not known in enum BotLocaleFilterOperator');
  }
}

/// Provides information about an event that occurred affecting the bot locale.
class BotLocaleHistoryEvent {
  /// A description of the event that occurred.
  final String event;

  /// A timestamp of the date and time that the event occurred.
  final DateTime eventDate;

  BotLocaleHistoryEvent({
    required this.event,
    required this.eventDate,
  });

  factory BotLocaleHistoryEvent.fromJson(Map<String, dynamic> json) {
    return BotLocaleHistoryEvent(
      event: json['event'] as String,
      eventDate: nonNullableTimeStampFromJson(json['eventDate'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final eventDate = this.eventDate;
    return {
      'event': event,
      'eventDate': unixTimestampToJson(eventDate),
    };
  }
}

/// Provides the bot locale parameters required for importing a bot locale.
class BotLocaleImportSpecification {
  /// The identifier of the bot to import the locale to.
  final String botId;

  /// The version of the bot to import the locale to. This can only be the
  /// <code>DRAFT</code> version of the bot.
  final String botVersion;

  /// The identifier of the language and locale that the bot will be used in. The
  /// string must match one of the supported locales. All of the intents, slot
  /// types, and slots used in the bot must have the same locale. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  final String localeId;

  /// Determines the threshold where Amazon Lex will insert the
  /// <code>AMAZON.FallbackIntent</code>, <code>AMAZON.KendraSearchIntent</code>,
  /// or both when returning alternative intents.
  /// <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> are only inserted if they are
  /// configured for the bot.
  ///
  /// For example, suppose a bot is configured with the confidence threshold of
  /// 0.80 and the <code>AMAZON.FallbackIntent</code>. Amazon Lex returns three
  /// alternative intents with the following confidence scores: IntentA (0.70),
  /// IntentB (0.60), IntentC (0.50). The response from the <code>PostText</code>
  /// operation would be:
  ///
  /// <ul>
  /// <li>
  /// <code>AMAZON.FallbackIntent</code>
  /// </li>
  /// <li>
  /// <code>IntentA</code>
  /// </li>
  /// <li>
  /// <code>IntentB</code>
  /// </li>
  /// <li>
  /// <code>IntentC</code>
  /// </li>
  /// </ul>
  final double? nluIntentConfidenceThreshold;
  final VoiceSettings? voiceSettings;

  BotLocaleImportSpecification({
    required this.botId,
    required this.botVersion,
    required this.localeId,
    this.nluIntentConfidenceThreshold,
    this.voiceSettings,
  });

  factory BotLocaleImportSpecification.fromJson(Map<String, dynamic> json) {
    return BotLocaleImportSpecification(
      botId: json['botId'] as String,
      botVersion: json['botVersion'] as String,
      localeId: json['localeId'] as String,
      nluIntentConfidenceThreshold:
          json['nluIntentConfidenceThreshold'] as double?,
      voiceSettings: json['voiceSettings'] != null
          ? VoiceSettings.fromJson(
              json['voiceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    final nluIntentConfidenceThreshold = this.nluIntentConfidenceThreshold;
    final voiceSettings = this.voiceSettings;
    return {
      'botId': botId,
      'botVersion': botVersion,
      'localeId': localeId,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (voiceSettings != null) 'voiceSettings': voiceSettings,
    };
  }
}

enum BotLocaleSortAttribute {
  botLocaleName,
}

extension BotLocaleSortAttributeValueExtension on BotLocaleSortAttribute {
  String toValue() {
    switch (this) {
      case BotLocaleSortAttribute.botLocaleName:
        return 'BotLocaleName';
    }
  }
}

extension BotLocaleSortAttributeFromString on String {
  BotLocaleSortAttribute toBotLocaleSortAttribute() {
    switch (this) {
      case 'BotLocaleName':
        return BotLocaleSortAttribute.botLocaleName;
    }
    throw Exception('$this is not known in enum BotLocaleSortAttribute');
  }
}

/// Specifies attributes for sorting a list of bot locales.
class BotLocaleSortBy {
  /// The bot locale attribute to sort by.
  final BotLocaleSortAttribute attribute;

  /// Specifies whether to sort the bot locales in ascending or descending order.
  final SortOrder order;

  BotLocaleSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

enum BotLocaleStatus {
  creating,
  building,
  built,
  readyExpressTesting,
  failed,
  deleting,
  notBuilt,
  importing,
  processing,
}

extension BotLocaleStatusValueExtension on BotLocaleStatus {
  String toValue() {
    switch (this) {
      case BotLocaleStatus.creating:
        return 'Creating';
      case BotLocaleStatus.building:
        return 'Building';
      case BotLocaleStatus.built:
        return 'Built';
      case BotLocaleStatus.readyExpressTesting:
        return 'ReadyExpressTesting';
      case BotLocaleStatus.failed:
        return 'Failed';
      case BotLocaleStatus.deleting:
        return 'Deleting';
      case BotLocaleStatus.notBuilt:
        return 'NotBuilt';
      case BotLocaleStatus.importing:
        return 'Importing';
      case BotLocaleStatus.processing:
        return 'Processing';
    }
  }
}

extension BotLocaleStatusFromString on String {
  BotLocaleStatus toBotLocaleStatus() {
    switch (this) {
      case 'Creating':
        return BotLocaleStatus.creating;
      case 'Building':
        return BotLocaleStatus.building;
      case 'Built':
        return BotLocaleStatus.built;
      case 'ReadyExpressTesting':
        return BotLocaleStatus.readyExpressTesting;
      case 'Failed':
        return BotLocaleStatus.failed;
      case 'Deleting':
        return BotLocaleStatus.deleting;
      case 'NotBuilt':
        return BotLocaleStatus.notBuilt;
      case 'Importing':
        return BotLocaleStatus.importing;
      case 'Processing':
        return BotLocaleStatus.processing;
    }
    throw Exception('$this is not known in enum BotLocaleStatus');
  }
}

/// Summary information about bot locales returned by the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListBotLocales.html">ListBotLocales</a>
/// operation.
class BotLocaleSummary {
  /// The current status of the bot locale. When the status is <code>Built</code>
  /// the locale is ready for use.
  final BotLocaleStatus? botLocaleStatus;

  /// The description of the bot locale.
  final String? description;

  /// A timestamp of the date and time that the bot locale was last built.
  final DateTime? lastBuildSubmittedDateTime;

  /// A timestamp of the date and time that the bot locale was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The language and locale of the bot locale.
  final String? localeId;

  /// The name of the bot locale.
  final String? localeName;

  BotLocaleSummary({
    this.botLocaleStatus,
    this.description,
    this.lastBuildSubmittedDateTime,
    this.lastUpdatedDateTime,
    this.localeId,
    this.localeName,
  });

  factory BotLocaleSummary.fromJson(Map<String, dynamic> json) {
    return BotLocaleSummary(
      botLocaleStatus:
          (json['botLocaleStatus'] as String?)?.toBotLocaleStatus(),
      description: json['description'] as String?,
      lastBuildSubmittedDateTime:
          timeStampFromJson(json['lastBuildSubmittedDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      localeName: json['localeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botLocaleStatus = this.botLocaleStatus;
    final description = this.description;
    final lastBuildSubmittedDateTime = this.lastBuildSubmittedDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final localeName = this.localeName;
    return {
      if (botLocaleStatus != null) 'botLocaleStatus': botLocaleStatus.toValue(),
      if (description != null) 'description': description,
      if (lastBuildSubmittedDateTime != null)
        'lastBuildSubmittedDateTime':
            unixTimestampToJson(lastBuildSubmittedDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (localeName != null) 'localeName': localeName,
    };
  }
}

/// A bot that is a member of a network of bots.
class BotMember {
  /// The alias ID of a bot that is a member of this network of bots.
  final String botMemberAliasId;

  /// The alias name of a bot that is a member of this network of bots.
  final String botMemberAliasName;

  /// The unique ID of a bot that is a member of this network of bots.
  final String botMemberId;

  /// The unique name of a bot that is a member of this network of bots.
  final String botMemberName;

  /// The version of a bot that is a member of this network of bots.
  final String botMemberVersion;

  BotMember({
    required this.botMemberAliasId,
    required this.botMemberAliasName,
    required this.botMemberId,
    required this.botMemberName,
    required this.botMemberVersion,
  });

  factory BotMember.fromJson(Map<String, dynamic> json) {
    return BotMember(
      botMemberAliasId: json['botMemberAliasId'] as String,
      botMemberAliasName: json['botMemberAliasName'] as String,
      botMemberId: json['botMemberId'] as String,
      botMemberName: json['botMemberName'] as String,
      botMemberVersion: json['botMemberVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botMemberAliasId = this.botMemberAliasId;
    final botMemberAliasName = this.botMemberAliasName;
    final botMemberId = this.botMemberId;
    final botMemberName = this.botMemberName;
    final botMemberVersion = this.botMemberVersion;
    return {
      'botMemberAliasId': botMemberAliasId,
      'botMemberAliasName': botMemberAliasName,
      'botMemberId': botMemberId,
      'botMemberName': botMemberName,
      'botMemberVersion': botMemberVersion,
    };
  }
}

/// A statistical summary of the bot recommendation results.
class BotRecommendationResultStatistics {
  /// Statistical information about about the intents associated with the bot
  /// recommendation results.
  final IntentStatistics? intents;

  /// Statistical information about the slot types associated with the bot
  /// recommendation results.
  final SlotTypeStatistics? slotTypes;

  BotRecommendationResultStatistics({
    this.intents,
    this.slotTypes,
  });

  factory BotRecommendationResultStatistics.fromJson(
      Map<String, dynamic> json) {
    return BotRecommendationResultStatistics(
      intents: json['intents'] != null
          ? IntentStatistics.fromJson(json['intents'] as Map<String, dynamic>)
          : null,
      slotTypes: json['slotTypes'] != null
          ? SlotTypeStatistics.fromJson(
              json['slotTypes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final intents = this.intents;
    final slotTypes = this.slotTypes;
    return {
      if (intents != null) 'intents': intents,
      if (slotTypes != null) 'slotTypes': slotTypes,
    };
  }
}

/// The object representing the URL of the bot definition, the URL of the
/// associated transcript, and a statistical summary of the bot recommendation
/// results.
class BotRecommendationResults {
  /// The presigned url link of the associated transcript.
  final String? associatedTranscriptsUrl;

  /// The presigned URL link of the recommended bot definition.
  final String? botLocaleExportUrl;

  /// The statistical summary of the bot recommendation results.
  final BotRecommendationResultStatistics? statistics;

  BotRecommendationResults({
    this.associatedTranscriptsUrl,
    this.botLocaleExportUrl,
    this.statistics,
  });

  factory BotRecommendationResults.fromJson(Map<String, dynamic> json) {
    return BotRecommendationResults(
      associatedTranscriptsUrl: json['associatedTranscriptsUrl'] as String?,
      botLocaleExportUrl: json['botLocaleExportUrl'] as String?,
      statistics: json['statistics'] != null
          ? BotRecommendationResultStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedTranscriptsUrl = this.associatedTranscriptsUrl;
    final botLocaleExportUrl = this.botLocaleExportUrl;
    final statistics = this.statistics;
    return {
      if (associatedTranscriptsUrl != null)
        'associatedTranscriptsUrl': associatedTranscriptsUrl,
      if (botLocaleExportUrl != null) 'botLocaleExportUrl': botLocaleExportUrl,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

enum BotRecommendationStatus {
  processing,
  deleting,
  deleted,
  downloading,
  updating,
  available,
  failed,
  stopping,
  stopped,
}

extension BotRecommendationStatusValueExtension on BotRecommendationStatus {
  String toValue() {
    switch (this) {
      case BotRecommendationStatus.processing:
        return 'Processing';
      case BotRecommendationStatus.deleting:
        return 'Deleting';
      case BotRecommendationStatus.deleted:
        return 'Deleted';
      case BotRecommendationStatus.downloading:
        return 'Downloading';
      case BotRecommendationStatus.updating:
        return 'Updating';
      case BotRecommendationStatus.available:
        return 'Available';
      case BotRecommendationStatus.failed:
        return 'Failed';
      case BotRecommendationStatus.stopping:
        return 'Stopping';
      case BotRecommendationStatus.stopped:
        return 'Stopped';
    }
  }
}

extension BotRecommendationStatusFromString on String {
  BotRecommendationStatus toBotRecommendationStatus() {
    switch (this) {
      case 'Processing':
        return BotRecommendationStatus.processing;
      case 'Deleting':
        return BotRecommendationStatus.deleting;
      case 'Deleted':
        return BotRecommendationStatus.deleted;
      case 'Downloading':
        return BotRecommendationStatus.downloading;
      case 'Updating':
        return BotRecommendationStatus.updating;
      case 'Available':
        return BotRecommendationStatus.available;
      case 'Failed':
        return BotRecommendationStatus.failed;
      case 'Stopping':
        return BotRecommendationStatus.stopping;
      case 'Stopped':
        return BotRecommendationStatus.stopped;
    }
    throw Exception('$this is not known in enum BotRecommendationStatus');
  }
}

/// A summary of the bot recommendation.
class BotRecommendationSummary {
  /// The unique identifier of the bot recommendation to be updated.
  final String botRecommendationId;

  /// The status of the bot recommendation.
  ///
  /// If the status is Failed, then the reasons for the failure are listed in the
  /// failureReasons field.
  final BotRecommendationStatus botRecommendationStatus;

  /// A timestamp of the date and time that the bot recommendation was created.
  final DateTime? creationDateTime;

  /// A timestamp of the date and time that the bot recommendation was last
  /// updated.
  final DateTime? lastUpdatedDateTime;

  BotRecommendationSummary({
    required this.botRecommendationId,
    required this.botRecommendationStatus,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });

  factory BotRecommendationSummary.fromJson(Map<String, dynamic> json) {
    return BotRecommendationSummary(
      botRecommendationId: json['botRecommendationId'] as String,
      botRecommendationStatus: (json['botRecommendationStatus'] as String)
          .toBotRecommendationStatus(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final botRecommendationId = this.botRecommendationId;
    final botRecommendationStatus = this.botRecommendationStatus;
    final creationDateTime = this.creationDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    return {
      'botRecommendationId': botRecommendationId,
      'botRecommendationStatus': botRecommendationStatus.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
    };
  }
}

enum BotSortAttribute {
  botName,
}

extension BotSortAttributeValueExtension on BotSortAttribute {
  String toValue() {
    switch (this) {
      case BotSortAttribute.botName:
        return 'BotName';
    }
  }
}

extension BotSortAttributeFromString on String {
  BotSortAttribute toBotSortAttribute() {
    switch (this) {
      case 'BotName':
        return BotSortAttribute.botName;
    }
    throw Exception('$this is not known in enum BotSortAttribute');
  }
}

/// Specifies attributes for sorting a list of bots.
class BotSortBy {
  /// The attribute to use to sort the list of bots.
  final BotSortAttribute attribute;

  /// The order to sort the list. You can choose ascending or descending.
  final SortOrder order;

  BotSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

enum BotStatus {
  creating,
  available,
  inactive,
  deleting,
  failed,
  versioning,
  importing,
  updating,
}

extension BotStatusValueExtension on BotStatus {
  String toValue() {
    switch (this) {
      case BotStatus.creating:
        return 'Creating';
      case BotStatus.available:
        return 'Available';
      case BotStatus.inactive:
        return 'Inactive';
      case BotStatus.deleting:
        return 'Deleting';
      case BotStatus.failed:
        return 'Failed';
      case BotStatus.versioning:
        return 'Versioning';
      case BotStatus.importing:
        return 'Importing';
      case BotStatus.updating:
        return 'Updating';
    }
  }
}

extension BotStatusFromString on String {
  BotStatus toBotStatus() {
    switch (this) {
      case 'Creating':
        return BotStatus.creating;
      case 'Available':
        return BotStatus.available;
      case 'Inactive':
        return BotStatus.inactive;
      case 'Deleting':
        return BotStatus.deleting;
      case 'Failed':
        return BotStatus.failed;
      case 'Versioning':
        return BotStatus.versioning;
      case 'Importing':
        return BotStatus.importing;
      case 'Updating':
        return BotStatus.updating;
    }
    throw Exception('$this is not known in enum BotStatus');
  }
}

/// Summary information about a bot returned by the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListBots.html">ListBots</a>
/// operation.
class BotSummary {
  /// The unique identifier assigned to the bot. Use this ID to get detailed
  /// information about the bot with the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_DescribeBot.html">DescribeBot</a>
  /// operation.
  final String? botId;

  /// The name of the bot.
  final String? botName;

  /// The current status of the bot. When the status is <code>Available</code> the
  /// bot is ready for use.
  final BotStatus? botStatus;

  /// The type of the bot.
  final BotType? botType;

  /// The description of the bot.
  final String? description;

  /// The date and time that the bot was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The latest numerical version in use for the bot.
  final String? latestBotVersion;

  BotSummary({
    this.botId,
    this.botName,
    this.botStatus,
    this.botType,
    this.description,
    this.lastUpdatedDateTime,
    this.latestBotVersion,
  });

  factory BotSummary.fromJson(Map<String, dynamic> json) {
    return BotSummary(
      botId: json['botId'] as String?,
      botName: json['botName'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botType: (json['botType'] as String?)?.toBotType(),
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      latestBotVersion: json['latestBotVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botName = this.botName;
    final botStatus = this.botStatus;
    final botType = this.botType;
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final latestBotVersion = this.latestBotVersion;
    return {
      if (botId != null) 'botId': botId,
      if (botName != null) 'botName': botName,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botType != null) 'botType': botType.toValue(),
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (latestBotVersion != null) 'latestBotVersion': latestBotVersion,
    };
  }
}

enum BotType {
  bot,
  botNetwork,
}

extension BotTypeValueExtension on BotType {
  String toValue() {
    switch (this) {
      case BotType.bot:
        return 'Bot';
      case BotType.botNetwork:
        return 'BotNetwork';
    }
  }
}

extension BotTypeFromString on String {
  BotType toBotType() {
    switch (this) {
      case 'Bot':
        return BotType.bot;
      case 'BotNetwork':
        return BotType.botNetwork;
    }
    throw Exception('$this is not known in enum BotType');
  }
}

/// The version of a bot used for a bot locale.
class BotVersionLocaleDetails {
  /// The version of a bot used for a bot locale.
  final String sourceBotVersion;

  BotVersionLocaleDetails({
    required this.sourceBotVersion,
  });

  factory BotVersionLocaleDetails.fromJson(Map<String, dynamic> json) {
    return BotVersionLocaleDetails(
      sourceBotVersion: json['sourceBotVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceBotVersion = this.sourceBotVersion;
    return {
      'sourceBotVersion': sourceBotVersion,
    };
  }
}

enum BotVersionSortAttribute {
  botVersion,
}

extension BotVersionSortAttributeValueExtension on BotVersionSortAttribute {
  String toValue() {
    switch (this) {
      case BotVersionSortAttribute.botVersion:
        return 'BotVersion';
    }
  }
}

extension BotVersionSortAttributeFromString on String {
  BotVersionSortAttribute toBotVersionSortAttribute() {
    switch (this) {
      case 'BotVersion':
        return BotVersionSortAttribute.botVersion;
    }
    throw Exception('$this is not known in enum BotVersionSortAttribute');
  }
}

/// Specifies attributes for sorting a list of bot versions.
class BotVersionSortBy {
  /// The attribute to use to sort the list of versions.
  final BotVersionSortAttribute attribute;

  /// The order to sort the list. You can specify ascending or descending order.
  final SortOrder order;

  BotVersionSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

/// Summary information about a bot version returned by the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListBotVersions.html">ListBotVersions</a>
/// operation.
class BotVersionSummary {
  /// The name of the bot associated with the version.
  final String? botName;

  /// The status of the bot. When the status is available, the version of the bot
  /// is ready for use.
  final BotStatus? botStatus;

  /// The numeric version of the bot, or <code>DRAFT</code> to indicate that this
  /// is the version of the bot that can be updated..
  final String? botVersion;

  /// A timestamp of the date and time that the version was created.
  final DateTime? creationDateTime;

  /// The description of the version.
  final String? description;

  BotVersionSummary({
    this.botName,
    this.botStatus,
    this.botVersion,
    this.creationDateTime,
    this.description,
  });

  factory BotVersionSummary.fromJson(Map<String, dynamic> json) {
    return BotVersionSummary(
      botName: json['botName'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botName = this.botName;
    final botStatus = this.botStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    return {
      if (botName != null) 'botName': botName,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
    };
  }
}

class BuildBotLocaleResponse {
  /// The identifier of the specified bot.
  final String? botId;

  /// The bot's build status. When the status is <code>ReadyExpressTesting</code>
  /// you can test the bot using the utterances defined for the intents and slot
  /// types. When the status is <code>Built</code>, the bot is ready for use and
  /// can be tested using any utterance.
  final BotLocaleStatus? botLocaleStatus;

  /// The version of the bot that was built. This is only the draft version of the
  /// bot.
  final String? botVersion;

  /// A timestamp indicating the date and time that the bot was last built for
  /// this locale.
  final DateTime? lastBuildSubmittedDateTime;

  /// The language and locale specified of where the bot can be used.
  final String? localeId;

  BuildBotLocaleResponse({
    this.botId,
    this.botLocaleStatus,
    this.botVersion,
    this.lastBuildSubmittedDateTime,
    this.localeId,
  });

  factory BuildBotLocaleResponse.fromJson(Map<String, dynamic> json) {
    return BuildBotLocaleResponse(
      botId: json['botId'] as String?,
      botLocaleStatus:
          (json['botLocaleStatus'] as String?)?.toBotLocaleStatus(),
      botVersion: json['botVersion'] as String?,
      lastBuildSubmittedDateTime:
          timeStampFromJson(json['lastBuildSubmittedDateTime']),
      localeId: json['localeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botLocaleStatus = this.botLocaleStatus;
    final botVersion = this.botVersion;
    final lastBuildSubmittedDateTime = this.lastBuildSubmittedDateTime;
    final localeId = this.localeId;
    return {
      if (botId != null) 'botId': botId,
      if (botLocaleStatus != null) 'botLocaleStatus': botLocaleStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (lastBuildSubmittedDateTime != null)
        'lastBuildSubmittedDateTime':
            unixTimestampToJson(lastBuildSubmittedDateTime),
      if (localeId != null) 'localeId': localeId,
    };
  }
}

enum BuiltInIntentSortAttribute {
  intentSignature,
}

extension BuiltInIntentSortAttributeValueExtension
    on BuiltInIntentSortAttribute {
  String toValue() {
    switch (this) {
      case BuiltInIntentSortAttribute.intentSignature:
        return 'IntentSignature';
    }
  }
}

extension BuiltInIntentSortAttributeFromString on String {
  BuiltInIntentSortAttribute toBuiltInIntentSortAttribute() {
    switch (this) {
      case 'IntentSignature':
        return BuiltInIntentSortAttribute.intentSignature;
    }
    throw Exception('$this is not known in enum BuiltInIntentSortAttribute');
  }
}

/// Specifies attributes for sorting a list of built-in intents.
class BuiltInIntentSortBy {
  /// The attribute to use to sort the list of built-in intents.
  final BuiltInIntentSortAttribute attribute;

  /// The order to sort the list. You can specify ascending or descending order.
  final SortOrder order;

  BuiltInIntentSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

/// Provides summary information about a built-in intent for the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListBuiltInIntents.html">
/// ListBuiltInIntents </a> operation.
class BuiltInIntentSummary {
  /// The description of the intent.
  final String? description;

  /// The signature of the built-in intent. Use this to specify the parent intent
  /// of a derived intent.
  final String? intentSignature;

  BuiltInIntentSummary({
    this.description,
    this.intentSignature,
  });

  factory BuiltInIntentSummary.fromJson(Map<String, dynamic> json) {
    return BuiltInIntentSummary(
      description: json['description'] as String?,
      intentSignature: json['intentSignature'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final intentSignature = this.intentSignature;
    return {
      if (description != null) 'description': description,
      if (intentSignature != null) 'intentSignature': intentSignature,
    };
  }
}

enum BuiltInSlotTypeSortAttribute {
  slotTypeSignature,
}

extension BuiltInSlotTypeSortAttributeValueExtension
    on BuiltInSlotTypeSortAttribute {
  String toValue() {
    switch (this) {
      case BuiltInSlotTypeSortAttribute.slotTypeSignature:
        return 'SlotTypeSignature';
    }
  }
}

extension BuiltInSlotTypeSortAttributeFromString on String {
  BuiltInSlotTypeSortAttribute toBuiltInSlotTypeSortAttribute() {
    switch (this) {
      case 'SlotTypeSignature':
        return BuiltInSlotTypeSortAttribute.slotTypeSignature;
    }
    throw Exception('$this is not known in enum BuiltInSlotTypeSortAttribute');
  }
}

/// Specifies attributes for sorting a list of built-in slot types.
class BuiltInSlotTypeSortBy {
  /// The attribute to use to sort the list of built-in intents.
  final BuiltInSlotTypeSortAttribute attribute;

  /// The order to sort the list. You can choose ascending or descending.
  final SortOrder order;

  BuiltInSlotTypeSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

/// Provides summary information about a built-in slot type for the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListBuiltInSlotTypes.html">
/// ListBuiltInSlotTypes </a> operation.
class BuiltInSlotTypeSummary {
  /// The description of the built-in slot type.
  final String? description;

  /// The signature of the built-in slot type. Use this to specify the parent slot
  /// type of a derived slot type.
  final String? slotTypeSignature;

  BuiltInSlotTypeSummary({
    this.description,
    this.slotTypeSignature,
  });

  factory BuiltInSlotTypeSummary.fromJson(Map<String, dynamic> json) {
    return BuiltInSlotTypeSummary(
      description: json['description'] as String?,
      slotTypeSignature: json['slotTypeSignature'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final slotTypeSignature = this.slotTypeSignature;
    return {
      if (description != null) 'description': description,
      if (slotTypeSignature != null) 'slotTypeSignature': slotTypeSignature,
    };
  }
}

/// Describes a button to use on a response card used to gather slot values from
/// a user.
class Button {
  /// The text that appears on the button. Use this to tell the user what value is
  /// returned when they choose this button.
  final String text;

  /// The value returned to Amazon Lex when the user chooses this button. This
  /// must be one of the slot values configured for the slot.
  final String value;

  Button({
    required this.text,
    required this.value,
  });

  factory Button.fromJson(Map<String, dynamic> json) {
    return Button(
      text: json['text'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final value = this.value;
    return {
      'text': text,
      'value': value,
    };
  }
}

/// The Amazon CloudWatch Logs log group where the text and metadata logs are
/// delivered. The log group must exist before you enable logging.
class CloudWatchLogGroupLogDestination {
  /// The Amazon Resource Name (ARN) of the log group where text and metadata logs
  /// are delivered.
  final String cloudWatchLogGroupArn;

  /// The prefix of the log stream name within the log group that you specified
  final String logPrefix;

  CloudWatchLogGroupLogDestination({
    required this.cloudWatchLogGroupArn,
    required this.logPrefix,
  });

  factory CloudWatchLogGroupLogDestination.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogGroupLogDestination(
      cloudWatchLogGroupArn: json['cloudWatchLogGroupArn'] as String,
      logPrefix: json['logPrefix'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogGroupArn = this.cloudWatchLogGroupArn;
    final logPrefix = this.logPrefix;
    return {
      'cloudWatchLogGroupArn': cloudWatchLogGroupArn,
      'logPrefix': logPrefix,
    };
  }
}

/// Contains information about code hooks that Amazon Lex calls during a
/// conversation.
class CodeHookSpecification {
  final LambdaCodeHook lambdaCodeHook;

  CodeHookSpecification({
    required this.lambdaCodeHook,
  });

  factory CodeHookSpecification.fromJson(Map<String, dynamic> json) {
    return CodeHookSpecification(
      lambdaCodeHook: LambdaCodeHook.fromJson(
          json['lambdaCodeHook'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaCodeHook = this.lambdaCodeHook;
    return {
      'lambdaCodeHook': lambdaCodeHook,
    };
  }
}

/// A composite slot is a combination of two or more slots that capture multiple
/// pieces of information in a single user input.
class CompositeSlotTypeSetting {
  /// Subslots in the composite slot.
  final List<SubSlotTypeComposition>? subSlots;

  CompositeSlotTypeSetting({
    this.subSlots,
  });

  factory CompositeSlotTypeSetting.fromJson(Map<String, dynamic> json) {
    return CompositeSlotTypeSetting(
      subSlots: (json['subSlots'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SubSlotTypeComposition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subSlots = this.subSlots;
    return {
      if (subSlots != null) 'subSlots': subSlots,
    };
  }
}

/// Provides an expression that evaluates to true or false.
class Condition {
  /// The expression string that is evaluated.
  final String expressionString;

  Condition({
    required this.expressionString,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      expressionString: json['expressionString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final expressionString = this.expressionString;
    return {
      'expressionString': expressionString,
    };
  }
}

/// A set of actions that Amazon Lex should run if the condition is matched.
class ConditionalBranch {
  /// Contains the expression to evaluate. If the condition is true, the branch's
  /// actions are taken.
  final Condition condition;

  /// The name of the branch.
  final String name;

  /// The next step in the conversation.
  final DialogState nextStep;
  final ResponseSpecification? response;

  ConditionalBranch({
    required this.condition,
    required this.name,
    required this.nextStep,
    this.response,
  });

  factory ConditionalBranch.fromJson(Map<String, dynamic> json) {
    return ConditionalBranch(
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      name: json['name'] as String,
      nextStep: DialogState.fromJson(json['nextStep'] as Map<String, dynamic>),
      response: json['response'] != null
          ? ResponseSpecification.fromJson(
              json['response'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final name = this.name;
    final nextStep = this.nextStep;
    final response = this.response;
    return {
      'condition': condition,
      'name': name,
      'nextStep': nextStep,
      if (response != null) 'response': response,
    };
  }
}

/// Provides a list of conditional branches. Branches are evaluated in the order
/// that they are entered in the list. The first branch with a condition that
/// evaluates to true is executed. The last branch in the list is the default
/// branch. The default branch should not have any condition expression. The
/// default branch is executed if no other branch has a matching condition.
class ConditionalSpecification {
  /// Determines whether a conditional branch is active. When <code>active</code>
  /// is false, the conditions are not evaluated.
  final bool active;

  /// A list of conditional branches. A conditional branch is made up of a
  /// condition, a response and a next step. The response and next step are
  /// executed when the condition is true.
  final List<ConditionalBranch> conditionalBranches;

  /// The conditional branch that should be followed when the conditions for other
  /// branches are not satisfied. A conditional branch is made up of a condition,
  /// a response and a next step.
  final DefaultConditionalBranch defaultBranch;

  ConditionalSpecification({
    required this.active,
    required this.conditionalBranches,
    required this.defaultBranch,
  });

  factory ConditionalSpecification.fromJson(Map<String, dynamic> json) {
    return ConditionalSpecification(
      active: json['active'] as bool,
      conditionalBranches: (json['conditionalBranches'] as List)
          .whereNotNull()
          .map((e) => ConditionalBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultBranch: DefaultConditionalBranch.fromJson(
          json['defaultBranch'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final conditionalBranches = this.conditionalBranches;
    final defaultBranch = this.defaultBranch;
    return {
      'active': active,
      'conditionalBranches': conditionalBranches,
      'defaultBranch': defaultBranch,
    };
  }
}

/// Configures conversation logging that saves audio, text, and metadata for the
/// conversations with your users.
class ConversationLogSettings {
  /// The Amazon S3 settings for logging audio to an S3 bucket.
  final List<AudioLogSetting>? audioLogSettings;

  /// The Amazon CloudWatch Logs settings for logging text and metadata.
  final List<TextLogSetting>? textLogSettings;

  ConversationLogSettings({
    this.audioLogSettings,
    this.textLogSettings,
  });

  factory ConversationLogSettings.fromJson(Map<String, dynamic> json) {
    return ConversationLogSettings(
      audioLogSettings: (json['audioLogSettings'] as List?)
          ?.whereNotNull()
          .map((e) => AudioLogSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      textLogSettings: (json['textLogSettings'] as List?)
          ?.whereNotNull()
          .map((e) => TextLogSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioLogSettings = this.audioLogSettings;
    final textLogSettings = this.textLogSettings;
    return {
      if (audioLogSettings != null) 'audioLogSettings': audioLogSettings,
      if (textLogSettings != null) 'textLogSettings': textLogSettings,
    };
  }
}

class CreateBotAliasResponse {
  /// The unique identifier of the bot alias.
  final String? botAliasId;

  /// Configuration information for a specific locale.
  final Map<String, BotAliasLocaleSettings>? botAliasLocaleSettings;

  /// The name specified for the bot alias.
  final String? botAliasName;

  /// The current status of the alias. The alias is first put into the
  /// <code>Creating</code> state. When the alias is ready to be used, it is put
  /// into the <code>Available</code> state. You can use the
  /// <code>DescribeBotAlias</code> operation to get the current state of an
  /// alias.
  final BotAliasStatus? botAliasStatus;

  /// The unique identifier of the bot that this alias applies to.
  final String? botId;

  /// The version of the bot associated with this alias.
  final String? botVersion;

  /// The conversation log settings specified for the alias.
  final ConversationLogSettings? conversationLogSettings;

  /// A Unix timestamp indicating the date and time that the bot alias was
  /// created.
  final DateTime? creationDateTime;

  /// The description specified for the bot alias.
  final String? description;
  final SentimentAnalysisSettings? sentimentAnalysisSettings;

  /// A list of tags associated with the bot alias.
  final Map<String, String>? tags;

  CreateBotAliasResponse({
    this.botAliasId,
    this.botAliasLocaleSettings,
    this.botAliasName,
    this.botAliasStatus,
    this.botId,
    this.botVersion,
    this.conversationLogSettings,
    this.creationDateTime,
    this.description,
    this.sentimentAnalysisSettings,
    this.tags,
  });

  factory CreateBotAliasResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotAliasResponse(
      botAliasId: json['botAliasId'] as String?,
      botAliasLocaleSettings: (json['botAliasLocaleSettings']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, BotAliasLocaleSettings.fromJson(e as Map<String, dynamic>))),
      botAliasName: json['botAliasName'] as String?,
      botAliasStatus: (json['botAliasStatus'] as String?)?.toBotAliasStatus(),
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      conversationLogSettings: json['conversationLogSettings'] != null
          ? ConversationLogSettings.fromJson(
              json['conversationLogSettings'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      sentimentAnalysisSettings: json['sentimentAnalysisSettings'] != null
          ? SentimentAnalysisSettings.fromJson(
              json['sentimentAnalysisSettings'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botAliasLocaleSettings = this.botAliasLocaleSettings;
    final botAliasName = this.botAliasName;
    final botAliasStatus = this.botAliasStatus;
    final botId = this.botId;
    final botVersion = this.botVersion;
    final conversationLogSettings = this.conversationLogSettings;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final sentimentAnalysisSettings = this.sentimentAnalysisSettings;
    final tags = this.tags;
    return {
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botAliasLocaleSettings != null)
        'botAliasLocaleSettings': botAliasLocaleSettings,
      if (botAliasName != null) 'botAliasName': botAliasName,
      if (botAliasStatus != null) 'botAliasStatus': botAliasStatus.toValue(),
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (conversationLogSettings != null)
        'conversationLogSettings': conversationLogSettings,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (sentimentAnalysisSettings != null)
        'sentimentAnalysisSettings': sentimentAnalysisSettings,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateBotLocaleResponse {
  /// The specified bot identifier.
  final String? botId;

  /// The status of the bot.
  ///
  /// When the status is <code>Creating</code> the bot locale is being configured.
  /// When the status is <code>Building</code> Amazon Lex is building the bot for
  /// testing and use.
  ///
  /// If the status of the bot is <code>ReadyExpressTesting</code>, you can test
  /// the bot using the exact utterances specified in the bots' intents. When the
  /// bot is ready for full testing or to run, the status is <code>Built</code>.
  ///
  /// If there was a problem with building the bot, the status is
  /// <code>Failed</code>. If the bot was saved but not built, the status is
  /// <code>NotBuilt</code>.
  final BotLocaleStatus? botLocaleStatus;

  /// The specified bot version.
  final String? botVersion;

  /// A timestamp specifying the date and time that the bot locale was created.
  final DateTime? creationDateTime;

  /// The specified description of the bot locale.
  final String? description;

  /// The specified locale identifier.
  final String? localeId;

  /// The specified locale name.
  final String? localeName;

  /// The specified confidence threshold for inserting the
  /// <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> intents.
  final double? nluIntentConfidenceThreshold;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user.
  final VoiceSettings? voiceSettings;

  CreateBotLocaleResponse({
    this.botId,
    this.botLocaleStatus,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.localeId,
    this.localeName,
    this.nluIntentConfidenceThreshold,
    this.voiceSettings,
  });

  factory CreateBotLocaleResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotLocaleResponse(
      botId: json['botId'] as String?,
      botLocaleStatus:
          (json['botLocaleStatus'] as String?)?.toBotLocaleStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      localeId: json['localeId'] as String?,
      localeName: json['localeName'] as String?,
      nluIntentConfidenceThreshold:
          json['nluIntentConfidenceThreshold'] as double?,
      voiceSettings: json['voiceSettings'] != null
          ? VoiceSettings.fromJson(
              json['voiceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botLocaleStatus = this.botLocaleStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final localeId = this.localeId;
    final localeName = this.localeName;
    final nluIntentConfidenceThreshold = this.nluIntentConfidenceThreshold;
    final voiceSettings = this.voiceSettings;
    return {
      if (botId != null) 'botId': botId,
      if (botLocaleStatus != null) 'botLocaleStatus': botLocaleStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (localeId != null) 'localeId': localeId,
      if (localeName != null) 'localeName': localeName,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (voiceSettings != null) 'voiceSettings': voiceSettings,
    };
  }
}

class CreateBotResponse {
  /// A unique identifier for a particular bot. You use this to identify the bot
  /// when you call other Amazon Lex API operations.
  final String? botId;

  /// The list of bots in a network that was created.
  final List<BotMember>? botMembers;

  /// The name specified for the bot.
  final String? botName;

  /// Shows the current status of the bot. The bot is first in the
  /// <code>Creating</code> status. Once the bot is read for use, it changes to
  /// the <code>Available</code> status. After the bot is created, you can use the
  /// <code>DRAFT</code> version of the bot.
  final BotStatus? botStatus;

  /// A list of tags associated with the bot.
  final Map<String, String>? botTags;

  /// The type of a bot that was created.
  final BotType? botType;

  /// A timestamp indicating the date and time that the bot was created.
  final DateTime? creationDateTime;

  /// The data privacy settings specified for the bot.
  final DataPrivacy? dataPrivacy;

  /// The description specified for the bot.
  final String? description;

  /// The session idle time specified for the bot.
  final int? idleSessionTTLInSeconds;

  /// The IAM role specified for the bot.
  final String? roleArn;

  /// A list of tags associated with the test alias for the bot.
  final Map<String, String>? testBotAliasTags;

  CreateBotResponse({
    this.botId,
    this.botMembers,
    this.botName,
    this.botStatus,
    this.botTags,
    this.botType,
    this.creationDateTime,
    this.dataPrivacy,
    this.description,
    this.idleSessionTTLInSeconds,
    this.roleArn,
    this.testBotAliasTags,
  });

  factory CreateBotResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotResponse(
      botId: json['botId'] as String?,
      botMembers: (json['botMembers'] as List?)
          ?.whereNotNull()
          .map((e) => BotMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      botName: json['botName'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botTags: (json['botTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      botType: (json['botType'] as String?)?.toBotType(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      dataPrivacy: json['dataPrivacy'] != null
          ? DataPrivacy.fromJson(json['dataPrivacy'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      roleArn: json['roleArn'] as String?,
      testBotAliasTags: (json['testBotAliasTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botMembers = this.botMembers;
    final botName = this.botName;
    final botStatus = this.botStatus;
    final botTags = this.botTags;
    final botType = this.botType;
    final creationDateTime = this.creationDateTime;
    final dataPrivacy = this.dataPrivacy;
    final description = this.description;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final roleArn = this.roleArn;
    final testBotAliasTags = this.testBotAliasTags;
    return {
      if (botId != null) 'botId': botId,
      if (botMembers != null) 'botMembers': botMembers,
      if (botName != null) 'botName': botName,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botTags != null) 'botTags': botTags,
      if (botType != null) 'botType': botType.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (dataPrivacy != null) 'dataPrivacy': dataPrivacy,
      if (description != null) 'description': description,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (roleArn != null) 'roleArn': roleArn,
      if (testBotAliasTags != null) 'testBotAliasTags': testBotAliasTags,
    };
  }
}

class CreateBotVersionResponse {
  /// The bot identifier specified in the request.
  final String? botId;

  /// When you send a request to create or update a bot, Amazon Lex sets the
  /// status response element to <code>Creating</code>. After Amazon Lex builds
  /// the bot, it sets status to <code>Available</code>. If Amazon Lex can't build
  /// the bot, it sets status to <code>Failed</code>.
  final BotStatus? botStatus;

  /// The version number assigned to the version.
  final String? botVersion;

  /// The source versions used for each locale in the new version.
  final Map<String, BotVersionLocaleDetails>? botVersionLocaleSpecification;

  /// A timestamp of the date and time that the version was created.
  final DateTime? creationDateTime;

  /// The description of the version specified in the request.
  final String? description;

  CreateBotVersionResponse({
    this.botId,
    this.botStatus,
    this.botVersion,
    this.botVersionLocaleSpecification,
    this.creationDateTime,
    this.description,
  });

  factory CreateBotVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotVersionResponse(
      botId: json['botId'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botVersion: json['botVersion'] as String?,
      botVersionLocaleSpecification: (json['botVersionLocaleSpecification']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, BotVersionLocaleDetails.fromJson(e as Map<String, dynamic>))),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botStatus = this.botStatus;
    final botVersion = this.botVersion;
    final botVersionLocaleSpecification = this.botVersionLocaleSpecification;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    return {
      if (botId != null) 'botId': botId,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (botVersionLocaleSpecification != null)
        'botVersionLocaleSpecification': botVersionLocaleSpecification,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
    };
  }
}

class CreateExportResponse {
  /// The date and time that the request to export a bot was created.
  final DateTime? creationDateTime;

  /// An identifier for a specific request to create an export.
  final String? exportId;

  /// The status of the export. When the status is <code>Completed</code>, you can
  /// use the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_DescribeExport.html">DescribeExport</a>
  /// operation to get the pre-signed S3 URL link to your exported bot or bot
  /// locale.
  final ExportStatus? exportStatus;

  /// The file format used for the bot or bot locale definition files.
  final ImportExportFileFormat? fileFormat;

  /// A description of the type of resource that was exported, either a bot or a
  /// bot locale.
  final ExportResourceSpecification? resourceSpecification;

  CreateExportResponse({
    this.creationDateTime,
    this.exportId,
    this.exportStatus,
    this.fileFormat,
    this.resourceSpecification,
  });

  factory CreateExportResponse.fromJson(Map<String, dynamic> json) {
    return CreateExportResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      exportId: json['exportId'] as String?,
      exportStatus: (json['exportStatus'] as String?)?.toExportStatus(),
      fileFormat: (json['fileFormat'] as String?)?.toImportExportFileFormat(),
      resourceSpecification: json['resourceSpecification'] != null
          ? ExportResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final exportId = this.exportId;
    final exportStatus = this.exportStatus;
    final fileFormat = this.fileFormat;
    final resourceSpecification = this.resourceSpecification;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (exportId != null) 'exportId': exportId,
      if (exportStatus != null) 'exportStatus': exportStatus.toValue(),
      if (fileFormat != null) 'fileFormat': fileFormat.toValue(),
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
    };
  }
}

class CreateIntentResponse {
  /// The identifier of the bot associated with the intent.
  final String? botId;

  /// The identifier of the version of the bot associated with the intent.
  final String? botVersion;

  /// A timestamp of the date and time that the intent was created.
  final DateTime? creationDateTime;

  /// The description specified for the intent.
  final String? description;

  /// The dialog Lambda function specified for the intent.
  final DialogCodeHookSettings? dialogCodeHook;

  /// The fulfillment Lambda function specified for the intent.
  final FulfillmentCodeHookSettings? fulfillmentCodeHook;

  /// Configuration settings for the response that is sent to the user at the
  /// beginning of a conversation, before eliciting slot values.
  final InitialResponseSetting? initialResponseSetting;

  /// The list of input contexts specified for the intent.
  final List<InputContext>? inputContexts;

  /// The closing setting specified for the intent.
  final IntentClosingSetting? intentClosingSetting;

  /// The confirmation setting specified for the intent.
  final IntentConfirmationSetting? intentConfirmationSetting;

  /// A unique identifier for the intent.
  final String? intentId;

  /// The name specified for the intent.
  final String? intentName;

  /// Configuration for searching a Amazon Kendra index specified for the intent.
  final KendraConfiguration? kendraConfiguration;

  /// The locale that the intent is specified to use.
  final String? localeId;

  /// The list of output contexts specified for the intent.
  final List<OutputContext>? outputContexts;

  /// The signature of the parent intent specified for the intent.
  final String? parentIntentSignature;

  /// The sample utterances specified for the intent.
  final List<SampleUtterance>? sampleUtterances;

  CreateIntentResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.dialogCodeHook,
    this.fulfillmentCodeHook,
    this.initialResponseSetting,
    this.inputContexts,
    this.intentClosingSetting,
    this.intentConfirmationSetting,
    this.intentId,
    this.intentName,
    this.kendraConfiguration,
    this.localeId,
    this.outputContexts,
    this.parentIntentSignature,
    this.sampleUtterances,
  });

  factory CreateIntentResponse.fromJson(Map<String, dynamic> json) {
    return CreateIntentResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      dialogCodeHook: json['dialogCodeHook'] != null
          ? DialogCodeHookSettings.fromJson(
              json['dialogCodeHook'] as Map<String, dynamic>)
          : null,
      fulfillmentCodeHook: json['fulfillmentCodeHook'] != null
          ? FulfillmentCodeHookSettings.fromJson(
              json['fulfillmentCodeHook'] as Map<String, dynamic>)
          : null,
      initialResponseSetting: json['initialResponseSetting'] != null
          ? InitialResponseSetting.fromJson(
              json['initialResponseSetting'] as Map<String, dynamic>)
          : null,
      inputContexts: (json['inputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => InputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      intentClosingSetting: json['intentClosingSetting'] != null
          ? IntentClosingSetting.fromJson(
              json['intentClosingSetting'] as Map<String, dynamic>)
          : null,
      intentConfirmationSetting: json['intentConfirmationSetting'] != null
          ? IntentConfirmationSetting.fromJson(
              json['intentConfirmationSetting'] as Map<String, dynamic>)
          : null,
      intentId: json['intentId'] as String?,
      intentName: json['intentName'] as String?,
      kendraConfiguration: json['kendraConfiguration'] != null
          ? KendraConfiguration.fromJson(
              json['kendraConfiguration'] as Map<String, dynamic>)
          : null,
      localeId: json['localeId'] as String?,
      outputContexts: (json['outputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentIntentSignature: json['parentIntentSignature'] as String?,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => SampleUtterance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final dialogCodeHook = this.dialogCodeHook;
    final fulfillmentCodeHook = this.fulfillmentCodeHook;
    final initialResponseSetting = this.initialResponseSetting;
    final inputContexts = this.inputContexts;
    final intentClosingSetting = this.intentClosingSetting;
    final intentConfirmationSetting = this.intentConfirmationSetting;
    final intentId = this.intentId;
    final intentName = this.intentName;
    final kendraConfiguration = this.kendraConfiguration;
    final localeId = this.localeId;
    final outputContexts = this.outputContexts;
    final parentIntentSignature = this.parentIntentSignature;
    final sampleUtterances = this.sampleUtterances;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (fulfillmentCodeHook != null)
        'fulfillmentCodeHook': fulfillmentCodeHook,
      if (initialResponseSetting != null)
        'initialResponseSetting': initialResponseSetting,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (intentClosingSetting != null)
        'intentClosingSetting': intentClosingSetting,
      if (intentConfirmationSetting != null)
        'intentConfirmationSetting': intentConfirmationSetting,
      if (intentId != null) 'intentId': intentId,
      if (intentName != null) 'intentName': intentName,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (localeId != null) 'localeId': localeId,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
    };
  }
}

class CreateResourcePolicyResponse {
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy was attached to.
  final String? resourceArn;

  /// The current revision of the resource policy. Use the revision ID to make
  /// sure that you are updating the most current version of a resource policy
  /// when you add a policy statement to a resource, delete a resource, or update
  /// a resource.
  final String? revisionId;

  CreateResourcePolicyResponse({
    this.resourceArn,
    this.revisionId,
  });

  factory CreateResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourcePolicyResponse(
      resourceArn: json['resourceArn'] as String?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final revisionId = this.revisionId;
    return {
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class CreateResourcePolicyStatementResponse {
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  final String? resourceArn;

  /// The current revision of the resource policy. Use the revision ID to make
  /// sure that you are updating the most current version of a resource policy
  /// when you add a policy statement to a resource, delete a resource, or update
  /// a resource.
  final String? revisionId;

  CreateResourcePolicyStatementResponse({
    this.resourceArn,
    this.revisionId,
  });

  factory CreateResourcePolicyStatementResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateResourcePolicyStatementResponse(
      resourceArn: json['resourceArn'] as String?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final revisionId = this.revisionId;
    return {
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class CreateSlotResponse {
  /// The unique identifier of the bot associated with the slot.
  final String? botId;

  /// The version of the bot associated with the slot.
  final String? botVersion;

  /// The timestamp of the date and time that the slot was created.
  final DateTime? creationDateTime;

  /// The description associated with the slot.
  final String? description;

  /// The unique identifier of the intent associated with the slot.
  final String? intentId;

  /// The language and local specified for the slot.
  final String? localeId;

  /// Indicates whether the slot returns multiple values in one response.
  final MultipleValuesSetting? multipleValuesSetting;

  /// Indicates whether the slot is configured to obfuscate values in Amazon
  /// CloudWatch logs.
  final ObfuscationSetting? obfuscationSetting;

  /// The unique identifier associated with the slot. Use this to identify the
  /// slot when you update or delete it.
  final String? slotId;

  /// The name specified for the slot.
  final String? slotName;

  /// The unique identifier of the slot type associated with this slot.
  final String? slotTypeId;

  /// Specifications for the constituent sub slots and the expression for the
  /// composite slot.
  final SubSlotSetting? subSlotSetting;

  /// The value elicitation settings specified for the slot.
  final SlotValueElicitationSetting? valueElicitationSetting;

  CreateSlotResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.intentId,
    this.localeId,
    this.multipleValuesSetting,
    this.obfuscationSetting,
    this.slotId,
    this.slotName,
    this.slotTypeId,
    this.subSlotSetting,
    this.valueElicitationSetting,
  });

  factory CreateSlotResponse.fromJson(Map<String, dynamic> json) {
    return CreateSlotResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      intentId: json['intentId'] as String?,
      localeId: json['localeId'] as String?,
      multipleValuesSetting: json['multipleValuesSetting'] != null
          ? MultipleValuesSetting.fromJson(
              json['multipleValuesSetting'] as Map<String, dynamic>)
          : null,
      obfuscationSetting: json['obfuscationSetting'] != null
          ? ObfuscationSetting.fromJson(
              json['obfuscationSetting'] as Map<String, dynamic>)
          : null,
      slotId: json['slotId'] as String?,
      slotName: json['slotName'] as String?,
      slotTypeId: json['slotTypeId'] as String?,
      subSlotSetting: json['subSlotSetting'] != null
          ? SubSlotSetting.fromJson(
              json['subSlotSetting'] as Map<String, dynamic>)
          : null,
      valueElicitationSetting: json['valueElicitationSetting'] != null
          ? SlotValueElicitationSetting.fromJson(
              json['valueElicitationSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final intentId = this.intentId;
    final localeId = this.localeId;
    final multipleValuesSetting = this.multipleValuesSetting;
    final obfuscationSetting = this.obfuscationSetting;
    final slotId = this.slotId;
    final slotName = this.slotName;
    final slotTypeId = this.slotTypeId;
    final subSlotSetting = this.subSlotSetting;
    final valueElicitationSetting = this.valueElicitationSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (intentId != null) 'intentId': intentId,
      if (localeId != null) 'localeId': localeId,
      if (multipleValuesSetting != null)
        'multipleValuesSetting': multipleValuesSetting,
      if (obfuscationSetting != null) 'obfuscationSetting': obfuscationSetting,
      if (slotId != null) 'slotId': slotId,
      if (slotName != null) 'slotName': slotName,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (subSlotSetting != null) 'subSlotSetting': subSlotSetting,
      if (valueElicitationSetting != null)
        'valueElicitationSetting': valueElicitationSetting,
    };
  }
}

class CreateSlotTypeResponse {
  /// The identifier for the bot associated with the slot type.
  final String? botId;

  /// The version of the bot associated with the slot type.
  final String? botVersion;

  /// Specifications for a composite slot type.
  final CompositeSlotTypeSetting? compositeSlotTypeSetting;

  /// A timestamp of the date and time that the slot type was created.
  final DateTime? creationDateTime;

  /// The description specified for the slot type.
  final String? description;

  /// The type of external information used to create the slot type.
  final ExternalSourceSetting? externalSourceSetting;

  /// The specified language and local specified for the slot type.
  final String? localeId;

  /// The signature of the base slot type specified for the slot type.
  final String? parentSlotTypeSignature;

  /// The unique identifier assigned to the slot type. Use this to identify the
  /// slot type in the <code>UpdateSlotType</code> and <code>DeleteSlotType</code>
  /// operations.
  final String? slotTypeId;

  /// The name specified for the slot type.
  final String? slotTypeName;

  /// The list of values that the slot type can assume.
  final List<SlotTypeValue>? slotTypeValues;

  /// The strategy that Amazon Lex uses to select a value from the list of
  /// possible values.
  final SlotValueSelectionSetting? valueSelectionSetting;

  CreateSlotTypeResponse({
    this.botId,
    this.botVersion,
    this.compositeSlotTypeSetting,
    this.creationDateTime,
    this.description,
    this.externalSourceSetting,
    this.localeId,
    this.parentSlotTypeSignature,
    this.slotTypeId,
    this.slotTypeName,
    this.slotTypeValues,
    this.valueSelectionSetting,
  });

  factory CreateSlotTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateSlotTypeResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      compositeSlotTypeSetting: json['compositeSlotTypeSetting'] != null
          ? CompositeSlotTypeSetting.fromJson(
              json['compositeSlotTypeSetting'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      externalSourceSetting: json['externalSourceSetting'] != null
          ? ExternalSourceSetting.fromJson(
              json['externalSourceSetting'] as Map<String, dynamic>)
          : null,
      localeId: json['localeId'] as String?,
      parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
      slotTypeId: json['slotTypeId'] as String?,
      slotTypeName: json['slotTypeName'] as String?,
      slotTypeValues: (json['slotTypeValues'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueSelectionSetting: json['valueSelectionSetting'] != null
          ? SlotValueSelectionSetting.fromJson(
              json['valueSelectionSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final compositeSlotTypeSetting = this.compositeSlotTypeSetting;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final externalSourceSetting = this.externalSourceSetting;
    final localeId = this.localeId;
    final parentSlotTypeSignature = this.parentSlotTypeSignature;
    final slotTypeId = this.slotTypeId;
    final slotTypeName = this.slotTypeName;
    final slotTypeValues = this.slotTypeValues;
    final valueSelectionSetting = this.valueSelectionSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (compositeSlotTypeSetting != null)
        'compositeSlotTypeSetting': compositeSlotTypeSetting,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (externalSourceSetting != null)
        'externalSourceSetting': externalSourceSetting,
      if (localeId != null) 'localeId': localeId,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (slotTypeName != null) 'slotTypeName': slotTypeName,
      if (slotTypeValues != null) 'slotTypeValues': slotTypeValues,
      if (valueSelectionSetting != null)
        'valueSelectionSetting': valueSelectionSetting,
    };
  }
}

class CreateUploadUrlResponse {
  /// An identifier for a unique import job. Use it when you call the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_StartImport.html">StartImport</a>
  /// operation.
  final String? importId;

  /// A pre-signed S3 write URL. Upload the zip archive file that contains the
  /// definition of your bot or bot locale.
  final String? uploadUrl;

  CreateUploadUrlResponse({
    this.importId,
    this.uploadUrl,
  });

  factory CreateUploadUrlResponse.fromJson(Map<String, dynamic> json) {
    return CreateUploadUrlResponse(
      importId: json['importId'] as String?,
      uploadUrl: json['uploadUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importId = this.importId;
    final uploadUrl = this.uploadUrl;
    return {
      if (importId != null) 'importId': importId,
      if (uploadUrl != null) 'uploadUrl': uploadUrl,
    };
  }
}

/// A custom response string that Amazon Lex sends to your application. You
/// define the content and structure the string.
class CustomPayload {
  /// The string that is sent to your application.
  final String value;

  CustomPayload({
    required this.value,
  });

  factory CustomPayload.fromJson(Map<String, dynamic> json) {
    return CustomPayload(
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// The unique entry identifier for the custom vocabulary items.
class CustomVocabularyEntryId {
  /// The unique item identifier for the custom vocabulary items.
  final String itemId;

  CustomVocabularyEntryId({
    required this.itemId,
  });

  Map<String, dynamic> toJson() {
    final itemId = this.itemId;
    return {
      'itemId': itemId,
    };
  }
}

/// Provides the parameters required for exporting a custom vocabulary.
class CustomVocabularyExportSpecification {
  /// The identifier of the bot that contains the custom vocabulary to export.
  final String botId;

  /// The version of the bot that contains the custom vocabulary to export.
  final String botVersion;

  /// The locale of the bot that contains the custom vocabulary to export.
  final String localeId;

  CustomVocabularyExportSpecification({
    required this.botId,
    required this.botVersion,
    required this.localeId,
  });

  factory CustomVocabularyExportSpecification.fromJson(
      Map<String, dynamic> json) {
    return CustomVocabularyExportSpecification(
      botId: json['botId'] as String,
      botVersion: json['botVersion'] as String,
      localeId: json['localeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    return {
      'botId': botId,
      'botVersion': botVersion,
      'localeId': localeId,
    };
  }
}

/// Provides the parameters required for importing a custom vocabulary.
class CustomVocabularyImportSpecification {
  /// The identifier of the bot to import the custom vocabulary to.
  final String botId;

  /// The version of the bot to import the custom vocabulary to.
  final String botVersion;

  /// The identifier of the local to import the custom vocabulary to. The value
  /// must be <code>en_GB</code>.
  final String localeId;

  CustomVocabularyImportSpecification({
    required this.botId,
    required this.botVersion,
    required this.localeId,
  });

  factory CustomVocabularyImportSpecification.fromJson(
      Map<String, dynamic> json) {
    return CustomVocabularyImportSpecification(
      botId: json['botId'] as String,
      botVersion: json['botVersion'] as String,
      localeId: json['localeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    return {
      'botId': botId,
      'botVersion': botVersion,
      'localeId': localeId,
    };
  }
}

/// The unique custom vocabulary item from the custom vocabulary list.
class CustomVocabularyItem {
  /// The unique item identifer for the custom vocabulary item from the custom
  /// vocabulary list.
  final String itemId;

  /// The unique phrase for the custom vocabulary item from the custom vocabulary
  /// list.
  final String phrase;

  /// The DisplayAs value for the custom vocabulary item from the custom
  /// vocabulary list.
  final String? displayAs;

  /// The weight assigned for the custom vocabulary item from the custom
  /// vocabulary list.
  final int? weight;

  CustomVocabularyItem({
    required this.itemId,
    required this.phrase,
    this.displayAs,
    this.weight,
  });

  factory CustomVocabularyItem.fromJson(Map<String, dynamic> json) {
    return CustomVocabularyItem(
      itemId: json['itemId'] as String,
      phrase: json['phrase'] as String,
      displayAs: json['displayAs'] as String?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final itemId = this.itemId;
    final phrase = this.phrase;
    final displayAs = this.displayAs;
    final weight = this.weight;
    return {
      'itemId': itemId,
      'phrase': phrase,
      if (displayAs != null) 'displayAs': displayAs,
      if (weight != null) 'weight': weight,
    };
  }
}

enum CustomVocabularyStatus {
  ready,
  deleting,
  exporting,
  importing,
  creating,
}

extension CustomVocabularyStatusValueExtension on CustomVocabularyStatus {
  String toValue() {
    switch (this) {
      case CustomVocabularyStatus.ready:
        return 'Ready';
      case CustomVocabularyStatus.deleting:
        return 'Deleting';
      case CustomVocabularyStatus.exporting:
        return 'Exporting';
      case CustomVocabularyStatus.importing:
        return 'Importing';
      case CustomVocabularyStatus.creating:
        return 'Creating';
    }
  }
}

extension CustomVocabularyStatusFromString on String {
  CustomVocabularyStatus toCustomVocabularyStatus() {
    switch (this) {
      case 'Ready':
        return CustomVocabularyStatus.ready;
      case 'Deleting':
        return CustomVocabularyStatus.deleting;
      case 'Exporting':
        return CustomVocabularyStatus.exporting;
      case 'Importing':
        return CustomVocabularyStatus.importing;
      case 'Creating':
        return CustomVocabularyStatus.creating;
    }
    throw Exception('$this is not known in enum CustomVocabularyStatus');
  }
}

/// Specifies the DTMF input specifications.
class DTMFSpecification {
  /// The DTMF character that clears the accumulated DTMF digits and immediately
  /// ends the input.
  final String deletionCharacter;

  /// The DTMF character that immediately ends input. If the user does not press
  /// this character, the input ends after the end timeout.
  final String endCharacter;

  /// How long the bot should wait after the last DTMF character input before
  /// assuming that the input has concluded.
  final int endTimeoutMs;

  /// The maximum number of DTMF digits allowed in an utterance.
  final int maxLength;

  DTMFSpecification({
    required this.deletionCharacter,
    required this.endCharacter,
    required this.endTimeoutMs,
    required this.maxLength,
  });

  factory DTMFSpecification.fromJson(Map<String, dynamic> json) {
    return DTMFSpecification(
      deletionCharacter: json['deletionCharacter'] as String,
      endCharacter: json['endCharacter'] as String,
      endTimeoutMs: json['endTimeoutMs'] as int,
      maxLength: json['maxLength'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionCharacter = this.deletionCharacter;
    final endCharacter = this.endCharacter;
    final endTimeoutMs = this.endTimeoutMs;
    final maxLength = this.maxLength;
    return {
      'deletionCharacter': deletionCharacter,
      'endCharacter': endCharacter,
      'endTimeoutMs': endTimeoutMs,
      'maxLength': maxLength,
    };
  }
}

/// By default, data stored by Amazon Lex is encrypted. The
/// <code>DataPrivacy</code> structure provides settings that determine how
/// Amazon Lex handles special cases of securing the data for your bot.
class DataPrivacy {
  /// For each Amazon Lex bot created with the Amazon Lex Model Building Service,
  /// you must specify whether your use of Amazon Lex is related to a website,
  /// program, or other application that is directed or targeted, in whole or in
  /// part, to children under age 13 and subject to the Children's Online Privacy
  /// Protection Act (COPPA) by specifying <code>true</code> or <code>false</code>
  /// in the <code>childDirected</code> field. By specifying <code>true</code> in
  /// the <code>childDirected</code> field, you confirm that your use of Amazon
  /// Lex <b>is</b> related to a website, program, or other application that is
  /// directed or targeted, in whole or in part, to children under age 13 and
  /// subject to COPPA. By specifying <code>false</code> in the
  /// <code>childDirected</code> field, you confirm that your use of Amazon Lex
  /// <b>is not</b> related to a website, program, or other application that is
  /// directed or targeted, in whole or in part, to children under age 13 and
  /// subject to COPPA. You may not specify a default value for the
  /// <code>childDirected</code> field that does not accurately reflect whether
  /// your use of Amazon Lex is related to a website, program, or other
  /// application that is directed or targeted, in whole or in part, to children
  /// under age 13 and subject to COPPA. If your use of Amazon Lex relates to a
  /// website, program, or other application that is directed in whole or in part,
  /// to children under age 13, you must obtain any required verifiable parental
  /// consent under COPPA. For information regarding the use of Amazon Lex in
  /// connection with websites, programs, or other applications that are directed
  /// or targeted, in whole or in part, to children under age 13, see the <a
  /// href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ</a>.
  final bool childDirected;

  DataPrivacy({
    required this.childDirected,
  });

  factory DataPrivacy.fromJson(Map<String, dynamic> json) {
    return DataPrivacy(
      childDirected: json['childDirected'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final childDirected = this.childDirected;
    return {
      'childDirected': childDirected,
    };
  }
}

/// The object used for specifying the data range that the customer wants Amazon
/// Lex to read through in the input transcripts.
class DateRangeFilter {
  /// A timestamp indicating the end date for the date range filter.
  final DateTime endDateTime;

  /// A timestamp indicating the start date for the date range filter.
  final DateTime startDateTime;

  DateRangeFilter({
    required this.endDateTime,
    required this.startDateTime,
  });

  factory DateRangeFilter.fromJson(Map<String, dynamic> json) {
    return DateRangeFilter(
      endDateTime: nonNullableTimeStampFromJson(json['endDateTime'] as Object),
      startDateTime:
          nonNullableTimeStampFromJson(json['startDateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endDateTime = this.endDateTime;
    final startDateTime = this.startDateTime;
    return {
      'endDateTime': unixTimestampToJson(endDateTime),
      'startDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

/// A set of actions that Amazon Lex should run if none of the other conditions
/// are met.
class DefaultConditionalBranch {
  /// The next step in the conversation.
  final DialogState? nextStep;
  final ResponseSpecification? response;

  DefaultConditionalBranch({
    this.nextStep,
    this.response,
  });

  factory DefaultConditionalBranch.fromJson(Map<String, dynamic> json) {
    return DefaultConditionalBranch(
      nextStep: json['nextStep'] != null
          ? DialogState.fromJson(json['nextStep'] as Map<String, dynamic>)
          : null,
      response: json['response'] != null
          ? ResponseSpecification.fromJson(
              json['response'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextStep = this.nextStep;
    final response = this.response;
    return {
      if (nextStep != null) 'nextStep': nextStep,
      if (response != null) 'response': response,
    };
  }
}

class DeleteBotAliasResponse {
  /// The unique identifier of the bot alias to delete.
  final String? botAliasId;

  /// The current status of the alias. The status is <code>Deleting</code> while
  /// the alias is in the process of being deleted. Once the alias is deleted, it
  /// will no longer appear in the list of aliases returned by the
  /// <code>ListBotAliases</code> operation.
  final BotAliasStatus? botAliasStatus;

  /// The unique identifier of the bot that contains the alias to delete.
  final String? botId;

  DeleteBotAliasResponse({
    this.botAliasId,
    this.botAliasStatus,
    this.botId,
  });

  factory DeleteBotAliasResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBotAliasResponse(
      botAliasId: json['botAliasId'] as String?,
      botAliasStatus: (json['botAliasStatus'] as String?)?.toBotAliasStatus(),
      botId: json['botId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botAliasStatus = this.botAliasStatus;
    final botId = this.botId;
    return {
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botAliasStatus != null) 'botAliasStatus': botAliasStatus.toValue(),
      if (botId != null) 'botId': botId,
    };
  }
}

class DeleteBotLocaleResponse {
  /// The identifier of the bot that contained the deleted locale.
  final String? botId;

  /// The status of deleting the bot locale. The locale first enters the
  /// <code>Deleting</code> status. Once the locale is deleted it no longer
  /// appears in the list of locales for the bot.
  final BotLocaleStatus? botLocaleStatus;

  /// The version of the bot that contained the deleted locale.
  final String? botVersion;

  /// The language and locale of the deleted locale.
  final String? localeId;

  DeleteBotLocaleResponse({
    this.botId,
    this.botLocaleStatus,
    this.botVersion,
    this.localeId,
  });

  factory DeleteBotLocaleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBotLocaleResponse(
      botId: json['botId'] as String?,
      botLocaleStatus:
          (json['botLocaleStatus'] as String?)?.toBotLocaleStatus(),
      botVersion: json['botVersion'] as String?,
      localeId: json['localeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botLocaleStatus = this.botLocaleStatus;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    return {
      if (botId != null) 'botId': botId,
      if (botLocaleStatus != null) 'botLocaleStatus': botLocaleStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (localeId != null) 'localeId': localeId,
    };
  }
}

class DeleteBotResponse {
  /// The unique identifier of the bot that Amazon Lex is deleting.
  final String? botId;

  /// The current status of the bot. The status is <code>Deleting</code> while the
  /// bot and its associated resources are being deleted.
  final BotStatus? botStatus;

  DeleteBotResponse({
    this.botId,
    this.botStatus,
  });

  factory DeleteBotResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBotResponse(
      botId: json['botId'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botStatus = this.botStatus;
    return {
      if (botId != null) 'botId': botId,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
    };
  }
}

class DeleteBotVersionResponse {
  /// The identifier of the bot that is being deleted.
  final String? botId;

  /// The current status of the bot.
  final BotStatus? botStatus;

  /// The version of the bot that is being deleted.
  final String? botVersion;

  DeleteBotVersionResponse({
    this.botId,
    this.botStatus,
    this.botVersion,
  });

  factory DeleteBotVersionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBotVersionResponse(
      botId: json['botId'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botVersion: json['botVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botStatus = this.botStatus;
    final botVersion = this.botVersion;
    return {
      if (botId != null) 'botId': botId,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
    };
  }
}

class DeleteCustomVocabularyResponse {
  /// The identifier of the bot that the custom vocabulary was removed from.
  final String? botId;

  /// The version of the bot that the custom vocabulary was removed from.
  final String? botVersion;

  /// The status of removing the custom vocabulary.
  final CustomVocabularyStatus? customVocabularyStatus;

  /// The locale identifier for the locale that the custom vocabulary was removed
  /// from.
  final String? localeId;

  DeleteCustomVocabularyResponse({
    this.botId,
    this.botVersion,
    this.customVocabularyStatus,
    this.localeId,
  });

  factory DeleteCustomVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCustomVocabularyResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      customVocabularyStatus: (json['customVocabularyStatus'] as String?)
          ?.toCustomVocabularyStatus(),
      localeId: json['localeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final customVocabularyStatus = this.customVocabularyStatus;
    final localeId = this.localeId;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (customVocabularyStatus != null)
        'customVocabularyStatus': customVocabularyStatus.toValue(),
      if (localeId != null) 'localeId': localeId,
    };
  }
}

class DeleteExportResponse {
  /// The unique identifier of the deleted export.
  final String? exportId;

  /// The current status of the deletion. When the deletion is complete, the
  /// export will no longer be returned by the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListExports.html">ListExports</a>
  /// operation and calls to the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_DescribeExport.html">
  /// DescribeExport</a> operation with the export identifier will fail.
  final ExportStatus? exportStatus;

  DeleteExportResponse({
    this.exportId,
    this.exportStatus,
  });

  factory DeleteExportResponse.fromJson(Map<String, dynamic> json) {
    return DeleteExportResponse(
      exportId: json['exportId'] as String?,
      exportStatus: (json['exportStatus'] as String?)?.toExportStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    final exportStatus = this.exportStatus;
    return {
      if (exportId != null) 'exportId': exportId,
      if (exportStatus != null) 'exportStatus': exportStatus.toValue(),
    };
  }
}

class DeleteImportResponse {
  /// The unique identifier of the deleted import.
  final String? importId;

  /// The current status of the deletion. When the deletion is complete, the
  /// import will no longer be returned by the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListImports.html">ListImports</a>
  /// operation and calls to the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_DescribeImport.html">DescribeImport</a>
  /// operation with the import identifier will fail.
  final ImportStatus? importStatus;

  DeleteImportResponse({
    this.importId,
    this.importStatus,
  });

  factory DeleteImportResponse.fromJson(Map<String, dynamic> json) {
    return DeleteImportResponse(
      importId: json['importId'] as String?,
      importStatus: (json['importStatus'] as String?)?.toImportStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final importId = this.importId;
    final importStatus = this.importStatus;
    return {
      if (importId != null) 'importId': importId,
      if (importStatus != null) 'importStatus': importStatus.toValue(),
    };
  }
}

class DeleteResourcePolicyResponse {
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy was deleted from.
  final String? resourceArn;

  /// The current revision of the resource policy. Use the revision ID to make
  /// sure that you are updating the most current version of a resource policy
  /// when you add a policy statement to a resource, delete a resource, or update
  /// a resource.
  final String? revisionId;

  DeleteResourcePolicyResponse({
    this.resourceArn,
    this.revisionId,
  });

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResourcePolicyResponse(
      resourceArn: json['resourceArn'] as String?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final revisionId = this.revisionId;
    return {
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class DeleteResourcePolicyStatementResponse {
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy statement was removed from.
  final String? resourceArn;

  /// The current revision of the resource policy. Use the revision ID to make
  /// sure that you are updating the most current version of a resource policy
  /// when you add a policy statement to a resource, delete a resource, or update
  /// a resource.
  final String? revisionId;

  DeleteResourcePolicyStatementResponse({
    this.resourceArn,
    this.revisionId,
  });

  factory DeleteResourcePolicyStatementResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteResourcePolicyStatementResponse(
      resourceArn: json['resourceArn'] as String?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final revisionId = this.revisionId;
    return {
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class DeleteUtterancesResponse {
  DeleteUtterancesResponse();

  factory DeleteUtterancesResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUtterancesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeBotAliasResponse {
  /// A list of events that affect a bot alias. For example, an event is recorded
  /// when the version that the alias points to changes.
  final List<BotAliasHistoryEvent>? botAliasHistoryEvents;

  /// The identifier of the bot alias.
  final String? botAliasId;

  /// The locale settings that are unique to the alias.
  final Map<String, BotAliasLocaleSettings>? botAliasLocaleSettings;

  /// The name of the bot alias.
  final String? botAliasName;

  /// The current status of the alias. When the alias is <code>Available</code>,
  /// the alias is ready for use with your bot.
  final BotAliasStatus? botAliasStatus;

  /// The identifier of the bot associated with the bot alias.
  final String? botId;

  /// The version of the bot associated with the bot alias.
  final String? botVersion;

  /// Specifics of how Amazon Lex logs text and audio conversations with the bot
  /// associated with the alias.
  final ConversationLogSettings? conversationLogSettings;

  /// A timestamp of the date and time that the alias was created.
  final DateTime? creationDateTime;

  /// The description of the bot alias.
  final String? description;

  /// A timestamp of the date and time that the alias was last updated.
  final DateTime? lastUpdatedDateTime;

  /// A list of the networks to which the bot alias you described belongs.
  final List<ParentBotNetwork>? parentBotNetworks;
  final SentimentAnalysisSettings? sentimentAnalysisSettings;

  DescribeBotAliasResponse({
    this.botAliasHistoryEvents,
    this.botAliasId,
    this.botAliasLocaleSettings,
    this.botAliasName,
    this.botAliasStatus,
    this.botId,
    this.botVersion,
    this.conversationLogSettings,
    this.creationDateTime,
    this.description,
    this.lastUpdatedDateTime,
    this.parentBotNetworks,
    this.sentimentAnalysisSettings,
  });

  factory DescribeBotAliasResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBotAliasResponse(
      botAliasHistoryEvents: (json['botAliasHistoryEvents'] as List?)
          ?.whereNotNull()
          .map((e) => BotAliasHistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      botAliasId: json['botAliasId'] as String?,
      botAliasLocaleSettings: (json['botAliasLocaleSettings']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, BotAliasLocaleSettings.fromJson(e as Map<String, dynamic>))),
      botAliasName: json['botAliasName'] as String?,
      botAliasStatus: (json['botAliasStatus'] as String?)?.toBotAliasStatus(),
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      conversationLogSettings: json['conversationLogSettings'] != null
          ? ConversationLogSettings.fromJson(
              json['conversationLogSettings'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      parentBotNetworks: (json['parentBotNetworks'] as List?)
          ?.whereNotNull()
          .map((e) => ParentBotNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentimentAnalysisSettings: json['sentimentAnalysisSettings'] != null
          ? SentimentAnalysisSettings.fromJson(
              json['sentimentAnalysisSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasHistoryEvents = this.botAliasHistoryEvents;
    final botAliasId = this.botAliasId;
    final botAliasLocaleSettings = this.botAliasLocaleSettings;
    final botAliasName = this.botAliasName;
    final botAliasStatus = this.botAliasStatus;
    final botId = this.botId;
    final botVersion = this.botVersion;
    final conversationLogSettings = this.conversationLogSettings;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final parentBotNetworks = this.parentBotNetworks;
    final sentimentAnalysisSettings = this.sentimentAnalysisSettings;
    return {
      if (botAliasHistoryEvents != null)
        'botAliasHistoryEvents': botAliasHistoryEvents,
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botAliasLocaleSettings != null)
        'botAliasLocaleSettings': botAliasLocaleSettings,
      if (botAliasName != null) 'botAliasName': botAliasName,
      if (botAliasStatus != null) 'botAliasStatus': botAliasStatus.toValue(),
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (conversationLogSettings != null)
        'conversationLogSettings': conversationLogSettings,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (parentBotNetworks != null) 'parentBotNetworks': parentBotNetworks,
      if (sentimentAnalysisSettings != null)
        'sentimentAnalysisSettings': sentimentAnalysisSettings,
    };
  }
}

class DescribeBotLocaleResponse {
  /// The identifier of the bot associated with the locale.
  final String? botId;

  /// History of changes, such as when a locale is used in an alias, that have
  /// taken place for the locale.
  final List<BotLocaleHistoryEvent>? botLocaleHistoryEvents;

  /// The status of the bot. If the status is <code>Failed</code>, the reasons for
  /// the failure are listed in the <code>failureReasons</code> field.
  final BotLocaleStatus? botLocaleStatus;

  /// The identifier of the version of the bot associated with the locale.
  final String? botVersion;

  /// The date and time that the locale was created.
  final DateTime? creationDateTime;

  /// The description of the locale.
  final String? description;

  /// if <code>botLocaleStatus</code> is <code>Failed</code>, Amazon Lex explains
  /// why it failed to build the bot.
  final List<String>? failureReasons;

  /// The number of intents defined for the locale.
  final int? intentsCount;

  /// The date and time that the locale was last submitted for building.
  final DateTime? lastBuildSubmittedDateTime;

  /// The date and time that the locale was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The unique identifier of the described locale.
  final String? localeId;

  /// The name of the locale.
  final String? localeName;

  /// The confidence threshold where Amazon Lex inserts the
  /// <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> intents in the list of possible
  /// intents for an utterance.
  final double? nluIntentConfidenceThreshold;

  /// Recommended actions to take to resolve an error in the
  /// <code>failureReasons</code> field.
  final List<String>? recommendedActions;

  /// The number of slot types defined for the locale.
  final int? slotTypesCount;

  /// The Amazon Polly voice Amazon Lex uses for voice interaction with the user.
  final VoiceSettings? voiceSettings;

  DescribeBotLocaleResponse({
    this.botId,
    this.botLocaleHistoryEvents,
    this.botLocaleStatus,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.failureReasons,
    this.intentsCount,
    this.lastBuildSubmittedDateTime,
    this.lastUpdatedDateTime,
    this.localeId,
    this.localeName,
    this.nluIntentConfidenceThreshold,
    this.recommendedActions,
    this.slotTypesCount,
    this.voiceSettings,
  });

  factory DescribeBotLocaleResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBotLocaleResponse(
      botId: json['botId'] as String?,
      botLocaleHistoryEvents: (json['botLocaleHistoryEvents'] as List?)
          ?.whereNotNull()
          .map((e) => BotLocaleHistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      botLocaleStatus:
          (json['botLocaleStatus'] as String?)?.toBotLocaleStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      intentsCount: json['intentsCount'] as int?,
      lastBuildSubmittedDateTime:
          timeStampFromJson(json['lastBuildSubmittedDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      localeName: json['localeName'] as String?,
      nluIntentConfidenceThreshold:
          json['nluIntentConfidenceThreshold'] as double?,
      recommendedActions: (json['recommendedActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      slotTypesCount: json['slotTypesCount'] as int?,
      voiceSettings: json['voiceSettings'] != null
          ? VoiceSettings.fromJson(
              json['voiceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botLocaleHistoryEvents = this.botLocaleHistoryEvents;
    final botLocaleStatus = this.botLocaleStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final intentsCount = this.intentsCount;
    final lastBuildSubmittedDateTime = this.lastBuildSubmittedDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final localeName = this.localeName;
    final nluIntentConfidenceThreshold = this.nluIntentConfidenceThreshold;
    final recommendedActions = this.recommendedActions;
    final slotTypesCount = this.slotTypesCount;
    final voiceSettings = this.voiceSettings;
    return {
      if (botId != null) 'botId': botId,
      if (botLocaleHistoryEvents != null)
        'botLocaleHistoryEvents': botLocaleHistoryEvents,
      if (botLocaleStatus != null) 'botLocaleStatus': botLocaleStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (intentsCount != null) 'intentsCount': intentsCount,
      if (lastBuildSubmittedDateTime != null)
        'lastBuildSubmittedDateTime':
            unixTimestampToJson(lastBuildSubmittedDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (localeName != null) 'localeName': localeName,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (recommendedActions != null) 'recommendedActions': recommendedActions,
      if (slotTypesCount != null) 'slotTypesCount': slotTypesCount,
      if (voiceSettings != null) 'voiceSettings': voiceSettings,
    };
  }
}

class DescribeBotRecommendationResponse {
  /// The identifier of the bot associated with the bot recommendation.
  final String? botId;

  /// The identifier of the bot recommendation being described.
  final String? botRecommendationId;

  /// The object representing the URL of the bot definition, the URL of the
  /// associated transcript and a statistical summary of the bot recommendation
  /// results.
  final BotRecommendationResults? botRecommendationResults;

  /// The status of the bot recommendation. If the status is Failed, then the
  /// reasons for the failure are listed in the failureReasons field.
  final BotRecommendationStatus? botRecommendationStatus;

  /// The version of the bot associated with the bot recommendation.
  final String? botVersion;

  /// The date and time that the bot recommendation was created.
  final DateTime? creationDateTime;

  /// The object representing the passwords that were used to encrypt the data
  /// related to the bot recommendation results, as well as the KMS key ARN used
  /// to encrypt the associated metadata.
  final EncryptionSetting? encryptionSetting;

  /// If botRecommendationStatus is Failed, Amazon Lex explains why.
  final List<String>? failureReasons;

  /// The date and time that the bot recommendation was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The identifier of the language and locale of the bot recommendation to
  /// describe.
  final String? localeId;

  /// The object representing the Amazon S3 bucket containing the transcript, as
  /// well as the associated metadata.
  final TranscriptSourceSetting? transcriptSourceSetting;

  DescribeBotRecommendationResponse({
    this.botId,
    this.botRecommendationId,
    this.botRecommendationResults,
    this.botRecommendationStatus,
    this.botVersion,
    this.creationDateTime,
    this.encryptionSetting,
    this.failureReasons,
    this.lastUpdatedDateTime,
    this.localeId,
    this.transcriptSourceSetting,
  });

  factory DescribeBotRecommendationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBotRecommendationResponse(
      botId: json['botId'] as String?,
      botRecommendationId: json['botRecommendationId'] as String?,
      botRecommendationResults: json['botRecommendationResults'] != null
          ? BotRecommendationResults.fromJson(
              json['botRecommendationResults'] as Map<String, dynamic>)
          : null,
      botRecommendationStatus: (json['botRecommendationStatus'] as String?)
          ?.toBotRecommendationStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      encryptionSetting: json['encryptionSetting'] != null
          ? EncryptionSetting.fromJson(
              json['encryptionSetting'] as Map<String, dynamic>)
          : null,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      transcriptSourceSetting: json['transcriptSourceSetting'] != null
          ? TranscriptSourceSetting.fromJson(
              json['transcriptSourceSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botRecommendationId = this.botRecommendationId;
    final botRecommendationResults = this.botRecommendationResults;
    final botRecommendationStatus = this.botRecommendationStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final encryptionSetting = this.encryptionSetting;
    final failureReasons = this.failureReasons;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final transcriptSourceSetting = this.transcriptSourceSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botRecommendationId != null)
        'botRecommendationId': botRecommendationId,
      if (botRecommendationResults != null)
        'botRecommendationResults': botRecommendationResults,
      if (botRecommendationStatus != null)
        'botRecommendationStatus': botRecommendationStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (encryptionSetting != null) 'encryptionSetting': encryptionSetting,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (transcriptSourceSetting != null)
        'transcriptSourceSetting': transcriptSourceSetting,
    };
  }
}

class DescribeBotResponse {
  /// The unique identifier of the bot.
  final String? botId;

  /// The list of bots in the network that was described.
  final List<BotMember>? botMembers;

  /// The name of the bot.
  final String? botName;

  /// The current status of the bot. When the status is <code>Available</code> the
  /// bot is ready to be used in conversations with users.
  final BotStatus? botStatus;

  /// The type of the bot that was described.
  final BotType? botType;

  /// A timestamp of the date and time that the bot was created.
  final DateTime? creationDateTime;

  /// Settings for managing data privacy of the bot and its conversations with
  /// users.
  final DataPrivacy? dataPrivacy;

  /// The description of the bot.
  final String? description;

  /// If the <code>botStatus</code> is <code>Failed</code>, this contains a list
  /// of reasons that the bot couldn't be built.
  final List<String>? failureReasons;

  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation.
  final int? idleSessionTTLInSeconds;

  /// A timestamp of the date and time that the bot was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of an IAM role that has permission to access
  /// the bot.
  final String? roleArn;

  DescribeBotResponse({
    this.botId,
    this.botMembers,
    this.botName,
    this.botStatus,
    this.botType,
    this.creationDateTime,
    this.dataPrivacy,
    this.description,
    this.failureReasons,
    this.idleSessionTTLInSeconds,
    this.lastUpdatedDateTime,
    this.roleArn,
  });

  factory DescribeBotResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBotResponse(
      botId: json['botId'] as String?,
      botMembers: (json['botMembers'] as List?)
          ?.whereNotNull()
          .map((e) => BotMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      botName: json['botName'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botType: (json['botType'] as String?)?.toBotType(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      dataPrivacy: json['dataPrivacy'] != null
          ? DataPrivacy.fromJson(json['dataPrivacy'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botMembers = this.botMembers;
    final botName = this.botName;
    final botStatus = this.botStatus;
    final botType = this.botType;
    final creationDateTime = this.creationDateTime;
    final dataPrivacy = this.dataPrivacy;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final roleArn = this.roleArn;
    return {
      if (botId != null) 'botId': botId,
      if (botMembers != null) 'botMembers': botMembers,
      if (botName != null) 'botName': botName,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botType != null) 'botType': botType.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (dataPrivacy != null) 'dataPrivacy': dataPrivacy,
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

class DescribeBotVersionResponse {
  /// The identifier of the bot that contains the version.
  final String? botId;

  /// The members of bot network in the version that was described.
  final List<BotMember>? botMembers;

  /// The name of the bot that contains the version.
  final String? botName;

  /// The current status of the bot. When the status is <code>Available</code>,
  /// the bot version is ready for use.
  final BotStatus? botStatus;

  /// The type of the bot in the version that was described.
  final BotType? botType;

  /// The version of the bot that was described.
  final String? botVersion;

  /// A timestamp of the date and time that the bot version was created.
  final DateTime? creationDateTime;

  /// Data privacy settings for the bot version.
  final DataPrivacy? dataPrivacy;

  /// The description specified for the bot.
  final String? description;

  /// If the <code>botStatus</code> is <code>Failed</code>, this contains a list
  /// of reasons that the version couldn't be built.
  final List<String>? failureReasons;

  /// The number of seconds that a session with the bot remains active before it
  /// is discarded by Amazon Lex.
  final int? idleSessionTTLInSeconds;

  /// A list of the networks to which the bot version you described belongs.
  final List<ParentBotNetwork>? parentBotNetworks;

  /// The Amazon Resource Name (ARN) of an IAM role that has permission to access
  /// the bot version.
  final String? roleArn;

  DescribeBotVersionResponse({
    this.botId,
    this.botMembers,
    this.botName,
    this.botStatus,
    this.botType,
    this.botVersion,
    this.creationDateTime,
    this.dataPrivacy,
    this.description,
    this.failureReasons,
    this.idleSessionTTLInSeconds,
    this.parentBotNetworks,
    this.roleArn,
  });

  factory DescribeBotVersionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBotVersionResponse(
      botId: json['botId'] as String?,
      botMembers: (json['botMembers'] as List?)
          ?.whereNotNull()
          .map((e) => BotMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      botName: json['botName'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botType: (json['botType'] as String?)?.toBotType(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      dataPrivacy: json['dataPrivacy'] != null
          ? DataPrivacy.fromJson(json['dataPrivacy'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      parentBotNetworks: (json['parentBotNetworks'] as List?)
          ?.whereNotNull()
          .map((e) => ParentBotNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botMembers = this.botMembers;
    final botName = this.botName;
    final botStatus = this.botStatus;
    final botType = this.botType;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final dataPrivacy = this.dataPrivacy;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final parentBotNetworks = this.parentBotNetworks;
    final roleArn = this.roleArn;
    return {
      if (botId != null) 'botId': botId,
      if (botMembers != null) 'botMembers': botMembers,
      if (botName != null) 'botName': botName,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botType != null) 'botType': botType.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (dataPrivacy != null) 'dataPrivacy': dataPrivacy,
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (parentBotNetworks != null) 'parentBotNetworks': parentBotNetworks,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

class DescribeCustomVocabularyMetadataResponse {
  /// The identifier of the bot that contains the custom vocabulary.
  final String? botId;

  /// The version of the bot that contains the custom vocabulary to describe.
  final String? botVersion;

  /// The date and time that the custom vocabulary was created.
  final DateTime? creationDateTime;

  /// The status of the custom vocabulary. If the status is <code>Ready</code> the
  /// custom vocabulary is ready to use.
  final CustomVocabularyStatus? customVocabularyStatus;

  /// The date and time that the custom vocabulary was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The locale that contains the custom vocabulary to describe.
  final String? localeId;

  DescribeCustomVocabularyMetadataResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.customVocabularyStatus,
    this.lastUpdatedDateTime,
    this.localeId,
  });

  factory DescribeCustomVocabularyMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCustomVocabularyMetadataResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      customVocabularyStatus: (json['customVocabularyStatus'] as String?)
          ?.toCustomVocabularyStatus(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final customVocabularyStatus = this.customVocabularyStatus;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (customVocabularyStatus != null)
        'customVocabularyStatus': customVocabularyStatus.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
    };
  }
}

class DescribeExportResponse {
  /// The date and time that the export was created.
  final DateTime? creationDateTime;

  /// A pre-signed S3 URL that points to the bot or bot locale archive. The URL is
  /// only available for 5 minutes after calling the <code>DescribeExport</code>
  /// operation.
  final String? downloadUrl;

  /// The unique identifier of the described export.
  final String? exportId;

  /// The status of the export. When the status is <code>Complete</code> the
  /// export archive file is available for download.
  final ExportStatus? exportStatus;

  /// If the <code>exportStatus</code> is failed, contains one or more reasons why
  /// the export could not be completed.
  final List<String>? failureReasons;

  /// The file format used in the files that describe the resource.
  final ImportExportFileFormat? fileFormat;

  /// The last date and time that the export was updated.
  final DateTime? lastUpdatedDateTime;

  /// The bot, bot ID, and optional locale ID of the exported bot or bot locale.
  final ExportResourceSpecification? resourceSpecification;

  DescribeExportResponse({
    this.creationDateTime,
    this.downloadUrl,
    this.exportId,
    this.exportStatus,
    this.failureReasons,
    this.fileFormat,
    this.lastUpdatedDateTime,
    this.resourceSpecification,
  });

  factory DescribeExportResponse.fromJson(Map<String, dynamic> json) {
    return DescribeExportResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      downloadUrl: json['downloadUrl'] as String?,
      exportId: json['exportId'] as String?,
      exportStatus: (json['exportStatus'] as String?)?.toExportStatus(),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      fileFormat: (json['fileFormat'] as String?)?.toImportExportFileFormat(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      resourceSpecification: json['resourceSpecification'] != null
          ? ExportResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final downloadUrl = this.downloadUrl;
    final exportId = this.exportId;
    final exportStatus = this.exportStatus;
    final failureReasons = this.failureReasons;
    final fileFormat = this.fileFormat;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final resourceSpecification = this.resourceSpecification;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
      if (exportId != null) 'exportId': exportId,
      if (exportStatus != null) 'exportStatus': exportStatus.toValue(),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (fileFormat != null) 'fileFormat': fileFormat.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
    };
  }
}

class DescribeImportResponse {
  /// The date and time that the import was created.
  final DateTime? creationDateTime;

  /// If the <code>importStatus</code> field is <code>Failed</code>, this provides
  /// one or more reasons for the failure.
  final List<String>? failureReasons;

  /// The unique identifier of the described import.
  final String? importId;

  /// The status of the import process. When the status is <code>Completed</code>
  /// the resource is imported and ready for use.
  final ImportStatus? importStatus;

  /// The unique identifier that Amazon Lex assigned to the resource created by
  /// the import.
  final String? importedResourceId;

  /// The name of the imported resource.
  final String? importedResourceName;

  /// The date and time that the import was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The strategy used when there was a name conflict between the imported
  /// resource and an existing resource. When the merge strategy is
  /// <code>FailOnConflict</code> existing resources are not overwritten and the
  /// import fails.
  final MergeStrategy? mergeStrategy;

  /// The specifications of the imported bot, bot locale, or custom vocabulary.
  final ImportResourceSpecification? resourceSpecification;

  DescribeImportResponse({
    this.creationDateTime,
    this.failureReasons,
    this.importId,
    this.importStatus,
    this.importedResourceId,
    this.importedResourceName,
    this.lastUpdatedDateTime,
    this.mergeStrategy,
    this.resourceSpecification,
  });

  factory DescribeImportResponse.fromJson(Map<String, dynamic> json) {
    return DescribeImportResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      importId: json['importId'] as String?,
      importStatus: (json['importStatus'] as String?)?.toImportStatus(),
      importedResourceId: json['importedResourceId'] as String?,
      importedResourceName: json['importedResourceName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      mergeStrategy: (json['mergeStrategy'] as String?)?.toMergeStrategy(),
      resourceSpecification: json['resourceSpecification'] != null
          ? ImportResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    final importId = this.importId;
    final importStatus = this.importStatus;
    final importedResourceId = this.importedResourceId;
    final importedResourceName = this.importedResourceName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final mergeStrategy = this.mergeStrategy;
    final resourceSpecification = this.resourceSpecification;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (importId != null) 'importId': importId,
      if (importStatus != null) 'importStatus': importStatus.toValue(),
      if (importedResourceId != null) 'importedResourceId': importedResourceId,
      if (importedResourceName != null)
        'importedResourceName': importedResourceName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (mergeStrategy != null) 'mergeStrategy': mergeStrategy.toValue(),
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
    };
  }
}

class DescribeIntentResponse {
  /// The identifier of the bot associated with the intent.
  final String? botId;

  /// The version of the bot associated with the intent.
  final String? botVersion;

  /// A timestamp of the date and time that the intent was created.
  final DateTime? creationDateTime;

  /// The description of the intent.
  final String? description;

  /// The Lambda function called during each turn of a conversation with the
  /// intent.
  final DialogCodeHookSettings? dialogCodeHook;

  /// The Lambda function called when the intent is complete and ready for
  /// fulfillment.
  final FulfillmentCodeHookSettings? fulfillmentCodeHook;

  /// <p/>
  final InitialResponseSetting? initialResponseSetting;

  /// A list of contexts that must be active for the intent to be considered for
  /// sending to the user.
  final List<InputContext>? inputContexts;

  /// The response that Amazon Lex sends to when the intent is closed.
  final IntentClosingSetting? intentClosingSetting;

  /// Prompts that Amazon Lex sends to the user to confirm completion of an
  /// intent.
  final IntentConfirmationSetting? intentConfirmationSetting;

  /// The unique identifier assigned to the intent when it was created.
  final String? intentId;

  /// The name specified for the intent.
  final String? intentName;

  /// Configuration information required to use the
  /// <code>AMAZON.KendraSearchIntent</code> intent.
  final KendraConfiguration? kendraConfiguration;

  /// A timestamp of the date and time that the intent was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The language and locale specified for the intent.
  final String? localeId;

  /// A list of contexts that are activated when the intent is fulfilled.
  final List<OutputContext>? outputContexts;

  /// The identifier of the built-in intent that this intent is derived from, if
  /// any.
  final String? parentIntentSignature;

  /// User utterances that trigger this intent.
  final List<SampleUtterance>? sampleUtterances;

  /// The list that determines the priority that slots should be elicited from the
  /// user.
  final List<SlotPriority>? slotPriorities;

  DescribeIntentResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.dialogCodeHook,
    this.fulfillmentCodeHook,
    this.initialResponseSetting,
    this.inputContexts,
    this.intentClosingSetting,
    this.intentConfirmationSetting,
    this.intentId,
    this.intentName,
    this.kendraConfiguration,
    this.lastUpdatedDateTime,
    this.localeId,
    this.outputContexts,
    this.parentIntentSignature,
    this.sampleUtterances,
    this.slotPriorities,
  });

  factory DescribeIntentResponse.fromJson(Map<String, dynamic> json) {
    return DescribeIntentResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      dialogCodeHook: json['dialogCodeHook'] != null
          ? DialogCodeHookSettings.fromJson(
              json['dialogCodeHook'] as Map<String, dynamic>)
          : null,
      fulfillmentCodeHook: json['fulfillmentCodeHook'] != null
          ? FulfillmentCodeHookSettings.fromJson(
              json['fulfillmentCodeHook'] as Map<String, dynamic>)
          : null,
      initialResponseSetting: json['initialResponseSetting'] != null
          ? InitialResponseSetting.fromJson(
              json['initialResponseSetting'] as Map<String, dynamic>)
          : null,
      inputContexts: (json['inputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => InputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      intentClosingSetting: json['intentClosingSetting'] != null
          ? IntentClosingSetting.fromJson(
              json['intentClosingSetting'] as Map<String, dynamic>)
          : null,
      intentConfirmationSetting: json['intentConfirmationSetting'] != null
          ? IntentConfirmationSetting.fromJson(
              json['intentConfirmationSetting'] as Map<String, dynamic>)
          : null,
      intentId: json['intentId'] as String?,
      intentName: json['intentName'] as String?,
      kendraConfiguration: json['kendraConfiguration'] != null
          ? KendraConfiguration.fromJson(
              json['kendraConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      outputContexts: (json['outputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentIntentSignature: json['parentIntentSignature'] as String?,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => SampleUtterance.fromJson(e as Map<String, dynamic>))
          .toList(),
      slotPriorities: (json['slotPriorities'] as List?)
          ?.whereNotNull()
          .map((e) => SlotPriority.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final dialogCodeHook = this.dialogCodeHook;
    final fulfillmentCodeHook = this.fulfillmentCodeHook;
    final initialResponseSetting = this.initialResponseSetting;
    final inputContexts = this.inputContexts;
    final intentClosingSetting = this.intentClosingSetting;
    final intentConfirmationSetting = this.intentConfirmationSetting;
    final intentId = this.intentId;
    final intentName = this.intentName;
    final kendraConfiguration = this.kendraConfiguration;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final outputContexts = this.outputContexts;
    final parentIntentSignature = this.parentIntentSignature;
    final sampleUtterances = this.sampleUtterances;
    final slotPriorities = this.slotPriorities;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (fulfillmentCodeHook != null)
        'fulfillmentCodeHook': fulfillmentCodeHook,
      if (initialResponseSetting != null)
        'initialResponseSetting': initialResponseSetting,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (intentClosingSetting != null)
        'intentClosingSetting': intentClosingSetting,
      if (intentConfirmationSetting != null)
        'intentConfirmationSetting': intentConfirmationSetting,
      if (intentId != null) 'intentId': intentId,
      if (intentName != null) 'intentName': intentName,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slotPriorities != null) 'slotPriorities': slotPriorities,
    };
  }
}

class DescribeResourcePolicyResponse {
  /// The JSON structure that contains the resource policy. For more information
  /// about the contents of a JSON policy document, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">
  /// IAM JSON policy reference </a>.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  final String? resourceArn;

  /// The current revision of the resource policy. Use the revision ID to make
  /// sure that you are updating the most current version of a resource policy
  /// when you add a policy statement to a resource, delete a resource, or update
  /// a resource.
  final String? revisionId;

  DescribeResourcePolicyResponse({
    this.policy,
    this.resourceArn,
    this.revisionId,
  });

  factory DescribeResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourcePolicyResponse(
      policy: json['policy'] as String?,
      resourceArn: json['resourceArn'] as String?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    final revisionId = this.revisionId;
    return {
      if (policy != null) 'policy': policy,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class DescribeSlotResponse {
  /// The identifier of the bot associated with the slot.
  final String? botId;

  /// The version of the bot associated with the slot.
  final String? botVersion;

  /// A timestamp of the date and time that the slot was created.
  final DateTime? creationDateTime;

  /// The description specified for the slot.
  final String? description;

  /// The identifier of the intent associated with the slot.
  final String? intentId;

  /// A timestamp of the date and time that the slot was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The language and locale specified for the slot.
  final String? localeId;

  /// Indicates whether the slot accepts multiple values in a single utterance.
  ///
  /// If the <code>multipleValuesSetting</code> is not set, the default value is
  /// <code>false</code>.
  final MultipleValuesSetting? multipleValuesSetting;

  /// Whether slot values are shown in Amazon CloudWatch logs. If the value is
  /// <code>None</code>, the actual value of the slot is shown in logs.
  final ObfuscationSetting? obfuscationSetting;

  /// The unique identifier generated for the slot.
  final String? slotId;

  /// The name specified for the slot.
  final String? slotName;

  /// The identifier of the slot type that determines the values entered into the
  /// slot.
  final String? slotTypeId;

  /// Specifications for the constituent sub slots and the expression for the
  /// composite slot.
  final SubSlotSetting? subSlotSetting;

  /// Prompts that Amazon Lex uses to elicit a value for the slot.
  final SlotValueElicitationSetting? valueElicitationSetting;

  DescribeSlotResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.intentId,
    this.lastUpdatedDateTime,
    this.localeId,
    this.multipleValuesSetting,
    this.obfuscationSetting,
    this.slotId,
    this.slotName,
    this.slotTypeId,
    this.subSlotSetting,
    this.valueElicitationSetting,
  });

  factory DescribeSlotResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSlotResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      intentId: json['intentId'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      multipleValuesSetting: json['multipleValuesSetting'] != null
          ? MultipleValuesSetting.fromJson(
              json['multipleValuesSetting'] as Map<String, dynamic>)
          : null,
      obfuscationSetting: json['obfuscationSetting'] != null
          ? ObfuscationSetting.fromJson(
              json['obfuscationSetting'] as Map<String, dynamic>)
          : null,
      slotId: json['slotId'] as String?,
      slotName: json['slotName'] as String?,
      slotTypeId: json['slotTypeId'] as String?,
      subSlotSetting: json['subSlotSetting'] != null
          ? SubSlotSetting.fromJson(
              json['subSlotSetting'] as Map<String, dynamic>)
          : null,
      valueElicitationSetting: json['valueElicitationSetting'] != null
          ? SlotValueElicitationSetting.fromJson(
              json['valueElicitationSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final intentId = this.intentId;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final multipleValuesSetting = this.multipleValuesSetting;
    final obfuscationSetting = this.obfuscationSetting;
    final slotId = this.slotId;
    final slotName = this.slotName;
    final slotTypeId = this.slotTypeId;
    final subSlotSetting = this.subSlotSetting;
    final valueElicitationSetting = this.valueElicitationSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (intentId != null) 'intentId': intentId,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (multipleValuesSetting != null)
        'multipleValuesSetting': multipleValuesSetting,
      if (obfuscationSetting != null) 'obfuscationSetting': obfuscationSetting,
      if (slotId != null) 'slotId': slotId,
      if (slotName != null) 'slotName': slotName,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (subSlotSetting != null) 'subSlotSetting': subSlotSetting,
      if (valueElicitationSetting != null)
        'valueElicitationSetting': valueElicitationSetting,
    };
  }
}

class DescribeSlotTypeResponse {
  /// The identifier of the bot associated with the slot type.
  final String? botId;

  /// The version of the bot associated with the slot type.
  final String? botVersion;

  /// Specifications for a composite slot type.
  final CompositeSlotTypeSetting? compositeSlotTypeSetting;

  /// A timestamp of the date and time that the slot type was created.
  final DateTime? creationDateTime;

  /// The description specified for the slot type.
  final String? description;
  final ExternalSourceSetting? externalSourceSetting;

  /// A timestamp of the date and time that the slot type was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The language and locale specified for the slot type.
  final String? localeId;

  /// The built in slot type used as a parent to this slot type.
  final String? parentSlotTypeSignature;

  /// The unique identifier for the slot type.
  final String? slotTypeId;

  /// The name specified for the slot type.
  final String? slotTypeName;

  /// The values that the slot type can take. Includes any synonyms for the slot
  /// type values.
  final List<SlotTypeValue>? slotTypeValues;

  /// The strategy that Amazon Lex uses to choose a value from a list of possible
  /// values.
  final SlotValueSelectionSetting? valueSelectionSetting;

  DescribeSlotTypeResponse({
    this.botId,
    this.botVersion,
    this.compositeSlotTypeSetting,
    this.creationDateTime,
    this.description,
    this.externalSourceSetting,
    this.lastUpdatedDateTime,
    this.localeId,
    this.parentSlotTypeSignature,
    this.slotTypeId,
    this.slotTypeName,
    this.slotTypeValues,
    this.valueSelectionSetting,
  });

  factory DescribeSlotTypeResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSlotTypeResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      compositeSlotTypeSetting: json['compositeSlotTypeSetting'] != null
          ? CompositeSlotTypeSetting.fromJson(
              json['compositeSlotTypeSetting'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      externalSourceSetting: json['externalSourceSetting'] != null
          ? ExternalSourceSetting.fromJson(
              json['externalSourceSetting'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
      slotTypeId: json['slotTypeId'] as String?,
      slotTypeName: json['slotTypeName'] as String?,
      slotTypeValues: (json['slotTypeValues'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueSelectionSetting: json['valueSelectionSetting'] != null
          ? SlotValueSelectionSetting.fromJson(
              json['valueSelectionSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final compositeSlotTypeSetting = this.compositeSlotTypeSetting;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final externalSourceSetting = this.externalSourceSetting;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final parentSlotTypeSignature = this.parentSlotTypeSignature;
    final slotTypeId = this.slotTypeId;
    final slotTypeName = this.slotTypeName;
    final slotTypeValues = this.slotTypeValues;
    final valueSelectionSetting = this.valueSelectionSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (compositeSlotTypeSetting != null)
        'compositeSlotTypeSetting': compositeSlotTypeSetting,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (externalSourceSetting != null)
        'externalSourceSetting': externalSourceSetting,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (slotTypeName != null) 'slotTypeName': slotTypeName,
      if (slotTypeValues != null) 'slotTypeValues': slotTypeValues,
      if (valueSelectionSetting != null)
        'valueSelectionSetting': valueSelectionSetting,
    };
  }
}

/// Defines the action that the bot executes at runtime when the conversation
/// reaches this step.
class DialogAction {
  /// The action that the bot should execute.
  final DialogActionType type;

  /// If the dialog action is <code>ElicitSlot</code>, defines the slot to elicit
  /// from the user.
  final String? slotToElicit;

  /// When true the next message for the intent is not used.
  final bool? suppressNextMessage;

  DialogAction({
    required this.type,
    this.slotToElicit,
    this.suppressNextMessage,
  });

  factory DialogAction.fromJson(Map<String, dynamic> json) {
    return DialogAction(
      type: (json['type'] as String).toDialogActionType(),
      slotToElicit: json['slotToElicit'] as String?,
      suppressNextMessage: json['suppressNextMessage'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final slotToElicit = this.slotToElicit;
    final suppressNextMessage = this.suppressNextMessage;
    return {
      'type': type.toValue(),
      if (slotToElicit != null) 'slotToElicit': slotToElicit,
      if (suppressNextMessage != null)
        'suppressNextMessage': suppressNextMessage,
    };
  }
}

enum DialogActionType {
  elicitIntent,
  startIntent,
  elicitSlot,
  evaluateConditional,
  invokeDialogCodeHook,
  confirmIntent,
  fulfillIntent,
  closeIntent,
  endConversation,
}

extension DialogActionTypeValueExtension on DialogActionType {
  String toValue() {
    switch (this) {
      case DialogActionType.elicitIntent:
        return 'ElicitIntent';
      case DialogActionType.startIntent:
        return 'StartIntent';
      case DialogActionType.elicitSlot:
        return 'ElicitSlot';
      case DialogActionType.evaluateConditional:
        return 'EvaluateConditional';
      case DialogActionType.invokeDialogCodeHook:
        return 'InvokeDialogCodeHook';
      case DialogActionType.confirmIntent:
        return 'ConfirmIntent';
      case DialogActionType.fulfillIntent:
        return 'FulfillIntent';
      case DialogActionType.closeIntent:
        return 'CloseIntent';
      case DialogActionType.endConversation:
        return 'EndConversation';
    }
  }
}

extension DialogActionTypeFromString on String {
  DialogActionType toDialogActionType() {
    switch (this) {
      case 'ElicitIntent':
        return DialogActionType.elicitIntent;
      case 'StartIntent':
        return DialogActionType.startIntent;
      case 'ElicitSlot':
        return DialogActionType.elicitSlot;
      case 'EvaluateConditional':
        return DialogActionType.evaluateConditional;
      case 'InvokeDialogCodeHook':
        return DialogActionType.invokeDialogCodeHook;
      case 'ConfirmIntent':
        return DialogActionType.confirmIntent;
      case 'FulfillIntent':
        return DialogActionType.fulfillIntent;
      case 'CloseIntent':
        return DialogActionType.closeIntent;
      case 'EndConversation':
        return DialogActionType.endConversation;
    }
    throw Exception('$this is not known in enum DialogActionType');
  }
}

/// Settings that specify the dialog code hook that is called by Amazon Lex at a
/// step of the conversation.
class DialogCodeHookInvocationSetting {
  /// Determines whether a dialog code hook is used when the intent is activated.
  final bool active;

  /// Indicates whether a Lambda function should be invoked for the dialog.
  final bool enableCodeHookInvocation;

  /// Contains the responses and actions that Amazon Lex takes after the Lambda
  /// function is complete.
  final PostDialogCodeHookInvocationSpecification postCodeHookSpecification;

  /// A label that indicates the dialog step from which the dialog code hook is
  /// happening.
  final String? invocationLabel;

  DialogCodeHookInvocationSetting({
    required this.active,
    required this.enableCodeHookInvocation,
    required this.postCodeHookSpecification,
    this.invocationLabel,
  });

  factory DialogCodeHookInvocationSetting.fromJson(Map<String, dynamic> json) {
    return DialogCodeHookInvocationSetting(
      active: json['active'] as bool,
      enableCodeHookInvocation: json['enableCodeHookInvocation'] as bool,
      postCodeHookSpecification:
          PostDialogCodeHookInvocationSpecification.fromJson(
              json['postCodeHookSpecification'] as Map<String, dynamic>),
      invocationLabel: json['invocationLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final enableCodeHookInvocation = this.enableCodeHookInvocation;
    final postCodeHookSpecification = this.postCodeHookSpecification;
    final invocationLabel = this.invocationLabel;
    return {
      'active': active,
      'enableCodeHookInvocation': enableCodeHookInvocation,
      'postCodeHookSpecification': postCodeHookSpecification,
      if (invocationLabel != null) 'invocationLabel': invocationLabel,
    };
  }
}

/// Settings that determine the Lambda function that Amazon Lex uses for
/// processing user responses.
class DialogCodeHookSettings {
  /// Enables the dialog code hook so that it processes user requests.
  final bool enabled;

  DialogCodeHookSettings({
    required this.enabled,
  });

  factory DialogCodeHookSettings.fromJson(Map<String, dynamic> json) {
    return DialogCodeHookSettings(
      enabled: json['enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      'enabled': enabled,
    };
  }
}

/// The current state of the conversation with the user.
class DialogState {
  final DialogAction? dialogAction;
  final IntentOverride? intent;

  /// Map of key/value pairs representing session-specific context information. It
  /// contains application information passed between Amazon Lex and a client
  /// application.
  final Map<String, String>? sessionAttributes;

  DialogState({
    this.dialogAction,
    this.intent,
    this.sessionAttributes,
  });

  factory DialogState.fromJson(Map<String, dynamic> json) {
    return DialogState(
      dialogAction: json['dialogAction'] != null
          ? DialogAction.fromJson(json['dialogAction'] as Map<String, dynamic>)
          : null,
      intent: json['intent'] != null
          ? IntentOverride.fromJson(json['intent'] as Map<String, dynamic>)
          : null,
      sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final dialogAction = this.dialogAction;
    final intent = this.intent;
    final sessionAttributes = this.sessionAttributes;
    return {
      if (dialogAction != null) 'dialogAction': dialogAction,
      if (intent != null) 'intent': intent,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
  }
}

enum Effect {
  allow,
  deny,
}

extension EffectValueExtension on Effect {
  String toValue() {
    switch (this) {
      case Effect.allow:
        return 'Allow';
      case Effect.deny:
        return 'Deny';
    }
  }
}

extension EffectFromString on String {
  Effect toEffect() {
    switch (this) {
      case 'Allow':
        return Effect.allow;
      case 'Deny':
        return Effect.deny;
    }
    throw Exception('$this is not known in enum Effect');
  }
}

/// Settings that specify the dialog code hook that is called by Amazon Lex
/// between eliciting slot values.
class ElicitationCodeHookInvocationSetting {
  /// Indicates whether a Lambda function should be invoked for the dialog.
  final bool enableCodeHookInvocation;

  /// A label that indicates the dialog step from which the dialog code hook is
  /// happening.
  final String? invocationLabel;

  ElicitationCodeHookInvocationSetting({
    required this.enableCodeHookInvocation,
    this.invocationLabel,
  });

  factory ElicitationCodeHookInvocationSetting.fromJson(
      Map<String, dynamic> json) {
    return ElicitationCodeHookInvocationSetting(
      enableCodeHookInvocation: json['enableCodeHookInvocation'] as bool,
      invocationLabel: json['invocationLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableCodeHookInvocation = this.enableCodeHookInvocation;
    final invocationLabel = this.invocationLabel;
    return {
      'enableCodeHookInvocation': enableCodeHookInvocation,
      if (invocationLabel != null) 'invocationLabel': invocationLabel,
    };
  }
}

/// The object representing the passwords that were used to encrypt the data
/// related to the bot recommendation, as well as the KMS key ARN used to
/// encrypt the associated metadata.
class EncryptionSetting {
  /// The password used to encrypt the associated transcript file.
  final String? associatedTranscriptsPassword;

  /// The password used to encrypt the recommended bot recommendation file.
  final String? botLocaleExportPassword;

  /// The KMS key ARN used to encrypt the metadata associated with the bot
  /// recommendation.
  final String? kmsKeyArn;

  EncryptionSetting({
    this.associatedTranscriptsPassword,
    this.botLocaleExportPassword,
    this.kmsKeyArn,
  });

  factory EncryptionSetting.fromJson(Map<String, dynamic> json) {
    return EncryptionSetting(
      associatedTranscriptsPassword:
          json['associatedTranscriptsPassword'] as String?,
      botLocaleExportPassword: json['botLocaleExportPassword'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedTranscriptsPassword = this.associatedTranscriptsPassword;
    final botLocaleExportPassword = this.botLocaleExportPassword;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (associatedTranscriptsPassword != null)
        'associatedTranscriptsPassword': associatedTranscriptsPassword,
      if (botLocaleExportPassword != null)
        'botLocaleExportPassword': botLocaleExportPassword,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

enum ErrorCode {
  duplicateInput,
  resourceDoesNotExist,
  resourceAlreadyExists,
  internalServerFailure,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.duplicateInput:
        return 'DUPLICATE_INPUT';
      case ErrorCode.resourceDoesNotExist:
        return 'RESOURCE_DOES_NOT_EXIST';
      case ErrorCode.resourceAlreadyExists:
        return 'RESOURCE_ALREADY_EXISTS';
      case ErrorCode.internalServerFailure:
        return 'INTERNAL_SERVER_FAILURE';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'DUPLICATE_INPUT':
        return ErrorCode.duplicateInput;
      case 'RESOURCE_DOES_NOT_EXIST':
        return ErrorCode.resourceDoesNotExist;
      case 'RESOURCE_ALREADY_EXISTS':
        return ErrorCode.resourceAlreadyExists;
      case 'INTERNAL_SERVER_FAILURE':
        return ErrorCode.internalServerFailure;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Filters the response form the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListExports.html">ListExports</a>
/// operation
class ExportFilter {
  /// The name of the field to use for filtering.
  final ExportFilterName name;

  /// The operator to use for the filter. Specify EQ when the
  /// <code>ListExports</code> operation should return only resource types that
  /// equal the specified value. Specify CO when the <code>ListExports</code>
  /// operation should return resource types that contain the specified value.
  final ExportFilterOperator operator;

  /// The values to use to filter the response. The values must be
  /// <code>Bot</code>, <code>BotLocale</code>, or <code>CustomVocabulary</code>.
  final List<String> values;

  ExportFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum ExportFilterName {
  exportResourceType,
}

extension ExportFilterNameValueExtension on ExportFilterName {
  String toValue() {
    switch (this) {
      case ExportFilterName.exportResourceType:
        return 'ExportResourceType';
    }
  }
}

extension ExportFilterNameFromString on String {
  ExportFilterName toExportFilterName() {
    switch (this) {
      case 'ExportResourceType':
        return ExportFilterName.exportResourceType;
    }
    throw Exception('$this is not known in enum ExportFilterName');
  }
}

enum ExportFilterOperator {
  co,
  eq,
}

extension ExportFilterOperatorValueExtension on ExportFilterOperator {
  String toValue() {
    switch (this) {
      case ExportFilterOperator.co:
        return 'CO';
      case ExportFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension ExportFilterOperatorFromString on String {
  ExportFilterOperator toExportFilterOperator() {
    switch (this) {
      case 'CO':
        return ExportFilterOperator.co;
      case 'EQ':
        return ExportFilterOperator.eq;
    }
    throw Exception('$this is not known in enum ExportFilterOperator');
  }
}

/// Provides information about the bot or bot locale that you want to export.
/// You can specify the <code>botExportSpecification</code> or the
/// <code>botLocaleExportSpecification</code>, but not both.
class ExportResourceSpecification {
  /// Parameters for exporting a bot.
  final BotExportSpecification? botExportSpecification;

  /// Parameters for exporting a bot locale.
  final BotLocaleExportSpecification? botLocaleExportSpecification;

  /// The parameters required to export a custom vocabulary.
  final CustomVocabularyExportSpecification?
      customVocabularyExportSpecification;

  ExportResourceSpecification({
    this.botExportSpecification,
    this.botLocaleExportSpecification,
    this.customVocabularyExportSpecification,
  });

  factory ExportResourceSpecification.fromJson(Map<String, dynamic> json) {
    return ExportResourceSpecification(
      botExportSpecification: json['botExportSpecification'] != null
          ? BotExportSpecification.fromJson(
              json['botExportSpecification'] as Map<String, dynamic>)
          : null,
      botLocaleExportSpecification: json['botLocaleExportSpecification'] != null
          ? BotLocaleExportSpecification.fromJson(
              json['botLocaleExportSpecification'] as Map<String, dynamic>)
          : null,
      customVocabularyExportSpecification:
          json['customVocabularyExportSpecification'] != null
              ? CustomVocabularyExportSpecification.fromJson(
                  json['customVocabularyExportSpecification']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botExportSpecification = this.botExportSpecification;
    final botLocaleExportSpecification = this.botLocaleExportSpecification;
    final customVocabularyExportSpecification =
        this.customVocabularyExportSpecification;
    return {
      if (botExportSpecification != null)
        'botExportSpecification': botExportSpecification,
      if (botLocaleExportSpecification != null)
        'botLocaleExportSpecification': botLocaleExportSpecification,
      if (customVocabularyExportSpecification != null)
        'customVocabularyExportSpecification':
            customVocabularyExportSpecification,
    };
  }
}

enum ExportSortAttribute {
  lastUpdatedDateTime,
}

extension ExportSortAttributeValueExtension on ExportSortAttribute {
  String toValue() {
    switch (this) {
      case ExportSortAttribute.lastUpdatedDateTime:
        return 'LastUpdatedDateTime';
    }
  }
}

extension ExportSortAttributeFromString on String {
  ExportSortAttribute toExportSortAttribute() {
    switch (this) {
      case 'LastUpdatedDateTime':
        return ExportSortAttribute.lastUpdatedDateTime;
    }
    throw Exception('$this is not known in enum ExportSortAttribute');
  }
}

/// Provides information about sorting a list of exports.
class ExportSortBy {
  /// The export field to use for sorting.
  final ExportSortAttribute attribute;

  /// The order to sort the list.
  final SortOrder order;

  ExportSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

enum ExportStatus {
  inProgress,
  completed,
  failed,
  deleting,
}

extension ExportStatusValueExtension on ExportStatus {
  String toValue() {
    switch (this) {
      case ExportStatus.inProgress:
        return 'InProgress';
      case ExportStatus.completed:
        return 'Completed';
      case ExportStatus.failed:
        return 'Failed';
      case ExportStatus.deleting:
        return 'Deleting';
    }
  }
}

extension ExportStatusFromString on String {
  ExportStatus toExportStatus() {
    switch (this) {
      case 'InProgress':
        return ExportStatus.inProgress;
      case 'Completed':
        return ExportStatus.completed;
      case 'Failed':
        return ExportStatus.failed;
      case 'Deleting':
        return ExportStatus.deleting;
    }
    throw Exception('$this is not known in enum ExportStatus');
  }
}

/// Provides summary information about an export in an export list.
class ExportSummary {
  /// The date and time that the export was created.
  final DateTime? creationDateTime;

  /// The unique identifier that Amazon Lex assigned to the export.
  final String? exportId;

  /// The status of the export. When the status is <code>Completed</code> the
  /// export is ready to download.
  final ExportStatus? exportStatus;

  /// The file format used in the export files.
  final ImportExportFileFormat? fileFormat;

  /// The date and time that the export was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Information about the bot or bot locale that was exported.
  final ExportResourceSpecification? resourceSpecification;

  ExportSummary({
    this.creationDateTime,
    this.exportId,
    this.exportStatus,
    this.fileFormat,
    this.lastUpdatedDateTime,
    this.resourceSpecification,
  });

  factory ExportSummary.fromJson(Map<String, dynamic> json) {
    return ExportSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      exportId: json['exportId'] as String?,
      exportStatus: (json['exportStatus'] as String?)?.toExportStatus(),
      fileFormat: (json['fileFormat'] as String?)?.toImportExportFileFormat(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      resourceSpecification: json['resourceSpecification'] != null
          ? ExportResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final exportId = this.exportId;
    final exportStatus = this.exportStatus;
    final fileFormat = this.fileFormat;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final resourceSpecification = this.resourceSpecification;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (exportId != null) 'exportId': exportId,
      if (exportStatus != null) 'exportStatus': exportStatus.toValue(),
      if (fileFormat != null) 'fileFormat': fileFormat.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
    };
  }
}

/// Provides information about the external source of the slot type's
/// definition.
class ExternalSourceSetting {
  /// Settings required for a slot type based on a grammar that you provide.
  final GrammarSlotTypeSetting? grammarSlotTypeSetting;

  ExternalSourceSetting({
    this.grammarSlotTypeSetting,
  });

  factory ExternalSourceSetting.fromJson(Map<String, dynamic> json) {
    return ExternalSourceSetting(
      grammarSlotTypeSetting: json['grammarSlotTypeSetting'] != null
          ? GrammarSlotTypeSetting.fromJson(
              json['grammarSlotTypeSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grammarSlotTypeSetting = this.grammarSlotTypeSetting;
    return {
      if (grammarSlotTypeSetting != null)
        'grammarSlotTypeSetting': grammarSlotTypeSetting,
    };
  }
}

/// The unique failed custom vocabulary item from the custom vocabulary list.
class FailedCustomVocabularyItem {
  /// The unique error code for the failed custom vocabulary item from the custom
  /// vocabulary list.
  final ErrorCode? errorCode;

  /// The error message for the failed custom vocabulary item from the custom
  /// vocabulary list.
  final String? errorMessage;

  /// The unique item identifer for the failed custom vocabulary item from the
  /// custom vocabulary list.
  final String? itemId;

  FailedCustomVocabularyItem({
    this.errorCode,
    this.errorMessage,
    this.itemId,
  });

  factory FailedCustomVocabularyItem.fromJson(Map<String, dynamic> json) {
    return FailedCustomVocabularyItem(
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      itemId: json['itemId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final itemId = this.itemId;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (itemId != null) 'itemId': itemId,
    };
  }
}

/// Determines if a Lambda function should be invoked for a specific intent.
class FulfillmentCodeHookSettings {
  /// Indicates whether a Lambda function should be invoked to fulfill a specific
  /// intent.
  final bool enabled;

  /// Determines whether the fulfillment code hook is used. When
  /// <code>active</code> is false, the code hook doesn't run.
  final bool? active;

  /// Provides settings for update messages sent to the user for long-running
  /// Lambda fulfillment functions. Fulfillment updates can be used only with
  /// streaming conversations.
  final FulfillmentUpdatesSpecification? fulfillmentUpdatesSpecification;

  /// Provides settings for messages sent to the user for after the Lambda
  /// fulfillment function completes. Post-fulfillment messages can be sent for
  /// both streaming and non-streaming conversations.
  final PostFulfillmentStatusSpecification? postFulfillmentStatusSpecification;

  FulfillmentCodeHookSettings({
    required this.enabled,
    this.active,
    this.fulfillmentUpdatesSpecification,
    this.postFulfillmentStatusSpecification,
  });

  factory FulfillmentCodeHookSettings.fromJson(Map<String, dynamic> json) {
    return FulfillmentCodeHookSettings(
      enabled: json['enabled'] as bool,
      active: json['active'] as bool?,
      fulfillmentUpdatesSpecification:
          json['fulfillmentUpdatesSpecification'] != null
              ? FulfillmentUpdatesSpecification.fromJson(
                  json['fulfillmentUpdatesSpecification']
                      as Map<String, dynamic>)
              : null,
      postFulfillmentStatusSpecification:
          json['postFulfillmentStatusSpecification'] != null
              ? PostFulfillmentStatusSpecification.fromJson(
                  json['postFulfillmentStatusSpecification']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final active = this.active;
    final fulfillmentUpdatesSpecification =
        this.fulfillmentUpdatesSpecification;
    final postFulfillmentStatusSpecification =
        this.postFulfillmentStatusSpecification;
    return {
      'enabled': enabled,
      if (active != null) 'active': active,
      if (fulfillmentUpdatesSpecification != null)
        'fulfillmentUpdatesSpecification': fulfillmentUpdatesSpecification,
      if (postFulfillmentStatusSpecification != null)
        'postFulfillmentStatusSpecification':
            postFulfillmentStatusSpecification,
    };
  }
}

/// Provides settings for a message that is sent to the user when a fulfillment
/// Lambda function starts running.
class FulfillmentStartResponseSpecification {
  /// The delay between when the Lambda fulfillment function starts running and
  /// the start message is played. If the Lambda function returns before the delay
  /// is over, the start message isn't played.
  final int delayInSeconds;

  /// One to 5 message groups that contain start messages. Amazon Lex chooses one
  /// of the messages to play to the user.
  final List<MessageGroup> messageGroups;

  /// Determines whether the user can interrupt the start message while it is
  /// playing.
  final bool? allowInterrupt;

  FulfillmentStartResponseSpecification({
    required this.delayInSeconds,
    required this.messageGroups,
    this.allowInterrupt,
  });

  factory FulfillmentStartResponseSpecification.fromJson(
      Map<String, dynamic> json) {
    return FulfillmentStartResponseSpecification(
      delayInSeconds: json['delayInSeconds'] as int,
      messageGroups: (json['messageGroups'] as List)
          .whereNotNull()
          .map((e) => MessageGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowInterrupt: json['allowInterrupt'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final delayInSeconds = this.delayInSeconds;
    final messageGroups = this.messageGroups;
    final allowInterrupt = this.allowInterrupt;
    return {
      'delayInSeconds': delayInSeconds,
      'messageGroups': messageGroups,
      if (allowInterrupt != null) 'allowInterrupt': allowInterrupt,
    };
  }
}

/// Provides settings for a message that is sent periodically to the user while
/// a fulfillment Lambda function is running.
class FulfillmentUpdateResponseSpecification {
  /// The frequency that a message is sent to the user. When the period ends,
  /// Amazon Lex chooses a message from the message groups and plays it to the
  /// user. If the fulfillment Lambda returns before the first period ends, an
  /// update message is not played to the user.
  final int frequencyInSeconds;

  /// One to 5 message groups that contain update messages. Amazon Lex chooses one
  /// of the messages to play to the user.
  final List<MessageGroup> messageGroups;

  /// Determines whether the user can interrupt an update message while it is
  /// playing.
  final bool? allowInterrupt;

  FulfillmentUpdateResponseSpecification({
    required this.frequencyInSeconds,
    required this.messageGroups,
    this.allowInterrupt,
  });

  factory FulfillmentUpdateResponseSpecification.fromJson(
      Map<String, dynamic> json) {
    return FulfillmentUpdateResponseSpecification(
      frequencyInSeconds: json['frequencyInSeconds'] as int,
      messageGroups: (json['messageGroups'] as List)
          .whereNotNull()
          .map((e) => MessageGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowInterrupt: json['allowInterrupt'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final frequencyInSeconds = this.frequencyInSeconds;
    final messageGroups = this.messageGroups;
    final allowInterrupt = this.allowInterrupt;
    return {
      'frequencyInSeconds': frequencyInSeconds,
      'messageGroups': messageGroups,
      if (allowInterrupt != null) 'allowInterrupt': allowInterrupt,
    };
  }
}

/// Provides information for updating the user on the progress of fulfilling an
/// intent.
class FulfillmentUpdatesSpecification {
  /// Determines whether fulfillment updates are sent to the user. When this field
  /// is true, updates are sent.
  ///
  /// If the <code>active</code> field is set to true, the
  /// <code>startResponse</code>, <code>updateResponse</code>, and
  /// <code>timeoutInSeconds</code> fields are required.
  final bool active;

  /// Provides configuration information for the message sent to users when the
  /// fulfillment Lambda functions starts running.
  final FulfillmentStartResponseSpecification? startResponse;

  /// The length of time that the fulfillment Lambda function should run before it
  /// times out.
  final int? timeoutInSeconds;

  /// Provides configuration information for messages sent periodically to the
  /// user while the fulfillment Lambda function is running.
  final FulfillmentUpdateResponseSpecification? updateResponse;

  FulfillmentUpdatesSpecification({
    required this.active,
    this.startResponse,
    this.timeoutInSeconds,
    this.updateResponse,
  });

  factory FulfillmentUpdatesSpecification.fromJson(Map<String, dynamic> json) {
    return FulfillmentUpdatesSpecification(
      active: json['active'] as bool,
      startResponse: json['startResponse'] != null
          ? FulfillmentStartResponseSpecification.fromJson(
              json['startResponse'] as Map<String, dynamic>)
          : null,
      timeoutInSeconds: json['timeoutInSeconds'] as int?,
      updateResponse: json['updateResponse'] != null
          ? FulfillmentUpdateResponseSpecification.fromJson(
              json['updateResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final startResponse = this.startResponse;
    final timeoutInSeconds = this.timeoutInSeconds;
    final updateResponse = this.updateResponse;
    return {
      'active': active,
      if (startResponse != null) 'startResponse': startResponse,
      if (timeoutInSeconds != null) 'timeoutInSeconds': timeoutInSeconds,
      if (updateResponse != null) 'updateResponse': updateResponse,
    };
  }
}

/// Settings requried for a slot type based on a grammar that you provide.
class GrammarSlotTypeSetting {
  /// The source of the grammar used to create the slot type.
  final GrammarSlotTypeSource? source;

  GrammarSlotTypeSetting({
    this.source,
  });

  factory GrammarSlotTypeSetting.fromJson(Map<String, dynamic> json) {
    return GrammarSlotTypeSetting(
      source: json['source'] != null
          ? GrammarSlotTypeSource.fromJson(
              json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source,
    };
  }
}

/// Describes the Amazon S3 bucket name and location for the grammar that is the
/// source for the slot type.
class GrammarSlotTypeSource {
  /// The name of the S3 bucket that contains the grammar source.
  final String s3BucketName;

  /// The path to the grammar in the S3 bucket.
  final String s3ObjectKey;

  /// The Amazon KMS key required to decrypt the contents of the grammar, if any.
  final String? kmsKeyArn;

  GrammarSlotTypeSource({
    required this.s3BucketName,
    required this.s3ObjectKey,
    this.kmsKeyArn,
  });

  factory GrammarSlotTypeSource.fromJson(Map<String, dynamic> json) {
    return GrammarSlotTypeSource(
      s3BucketName: json['s3BucketName'] as String,
      s3ObjectKey: json['s3ObjectKey'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3ObjectKey = this.s3ObjectKey;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      's3BucketName': s3BucketName,
      's3ObjectKey': s3ObjectKey,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// A card that is shown to the user by a messaging platform. You define the
/// contents of the card, the card is displayed by the platform.
///
/// When you use a response card, the response from the user is constrained to
/// the text associated with a button on the card.
class ImageResponseCard {
  /// The title to display on the response card. The format of the title is
  /// determined by the platform displaying the response card.
  final String title;

  /// A list of buttons that should be displayed on the response card. The
  /// arrangement of the buttons is determined by the platform that displays the
  /// button.
  final List<Button>? buttons;

  /// The URL of an image to display on the response card. The image URL must be
  /// publicly available so that the platform displaying the response card has
  /// access to the image.
  final String? imageUrl;

  /// The subtitle to display on the response card. The format of the subtitle is
  /// determined by the platform displaying the response card.
  final String? subtitle;

  ImageResponseCard({
    required this.title,
    this.buttons,
    this.imageUrl,
    this.subtitle,
  });

  factory ImageResponseCard.fromJson(Map<String, dynamic> json) {
    return ImageResponseCard(
      title: json['title'] as String,
      buttons: (json['buttons'] as List?)
          ?.whereNotNull()
          .map((e) => Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
      subtitle: json['subtitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final title = this.title;
    final buttons = this.buttons;
    final imageUrl = this.imageUrl;
    final subtitle = this.subtitle;
    return {
      'title': title,
      if (buttons != null) 'buttons': buttons,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (subtitle != null) 'subtitle': subtitle,
    };
  }
}

enum ImportExportFileFormat {
  lexJson,
  tsv,
}

extension ImportExportFileFormatValueExtension on ImportExportFileFormat {
  String toValue() {
    switch (this) {
      case ImportExportFileFormat.lexJson:
        return 'LexJson';
      case ImportExportFileFormat.tsv:
        return 'TSV';
    }
  }
}

extension ImportExportFileFormatFromString on String {
  ImportExportFileFormat toImportExportFileFormat() {
    switch (this) {
      case 'LexJson':
        return ImportExportFileFormat.lexJson;
      case 'TSV':
        return ImportExportFileFormat.tsv;
    }
    throw Exception('$this is not known in enum ImportExportFileFormat');
  }
}

/// Filters the response from the <a
/// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListImports.html">ListImports</a>
/// operation.
class ImportFilter {
  /// The name of the field to use for filtering.
  final ImportFilterName name;

  /// The operator to use for the filter. Specify EQ when the
  /// <code>ListImports</code> operation should return only resource types that
  /// equal the specified value. Specify CO when the <code>ListImports</code>
  /// operation should return resource types that contain the specified value.
  final ImportFilterOperator operator;

  /// The values to use to filter the response. The values must be
  /// <code>Bot</code>, <code>BotLocale</code>, or <code>CustomVocabulary</code>.
  final List<String> values;

  ImportFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum ImportFilterName {
  importResourceType,
}

extension ImportFilterNameValueExtension on ImportFilterName {
  String toValue() {
    switch (this) {
      case ImportFilterName.importResourceType:
        return 'ImportResourceType';
    }
  }
}

extension ImportFilterNameFromString on String {
  ImportFilterName toImportFilterName() {
    switch (this) {
      case 'ImportResourceType':
        return ImportFilterName.importResourceType;
    }
    throw Exception('$this is not known in enum ImportFilterName');
  }
}

enum ImportFilterOperator {
  co,
  eq,
}

extension ImportFilterOperatorValueExtension on ImportFilterOperator {
  String toValue() {
    switch (this) {
      case ImportFilterOperator.co:
        return 'CO';
      case ImportFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension ImportFilterOperatorFromString on String {
  ImportFilterOperator toImportFilterOperator() {
    switch (this) {
      case 'CO':
        return ImportFilterOperator.co;
      case 'EQ':
        return ImportFilterOperator.eq;
    }
    throw Exception('$this is not known in enum ImportFilterOperator');
  }
}

/// Provides information about the bot or bot locale that you want to import.
/// You can specify the <code>botImportSpecification</code> or the
/// <code>botLocaleImportSpecification</code>, but not both.
class ImportResourceSpecification {
  /// Parameters for importing a bot.
  final BotImportSpecification? botImportSpecification;

  /// Parameters for importing a bot locale.
  final BotLocaleImportSpecification? botLocaleImportSpecification;
  final CustomVocabularyImportSpecification?
      customVocabularyImportSpecification;

  ImportResourceSpecification({
    this.botImportSpecification,
    this.botLocaleImportSpecification,
    this.customVocabularyImportSpecification,
  });

  factory ImportResourceSpecification.fromJson(Map<String, dynamic> json) {
    return ImportResourceSpecification(
      botImportSpecification: json['botImportSpecification'] != null
          ? BotImportSpecification.fromJson(
              json['botImportSpecification'] as Map<String, dynamic>)
          : null,
      botLocaleImportSpecification: json['botLocaleImportSpecification'] != null
          ? BotLocaleImportSpecification.fromJson(
              json['botLocaleImportSpecification'] as Map<String, dynamic>)
          : null,
      customVocabularyImportSpecification:
          json['customVocabularyImportSpecification'] != null
              ? CustomVocabularyImportSpecification.fromJson(
                  json['customVocabularyImportSpecification']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botImportSpecification = this.botImportSpecification;
    final botLocaleImportSpecification = this.botLocaleImportSpecification;
    final customVocabularyImportSpecification =
        this.customVocabularyImportSpecification;
    return {
      if (botImportSpecification != null)
        'botImportSpecification': botImportSpecification,
      if (botLocaleImportSpecification != null)
        'botLocaleImportSpecification': botLocaleImportSpecification,
      if (customVocabularyImportSpecification != null)
        'customVocabularyImportSpecification':
            customVocabularyImportSpecification,
    };
  }
}

enum ImportResourceType {
  bot,
  botLocale,
  customVocabulary,
}

extension ImportResourceTypeValueExtension on ImportResourceType {
  String toValue() {
    switch (this) {
      case ImportResourceType.bot:
        return 'Bot';
      case ImportResourceType.botLocale:
        return 'BotLocale';
      case ImportResourceType.customVocabulary:
        return 'CustomVocabulary';
    }
  }
}

extension ImportResourceTypeFromString on String {
  ImportResourceType toImportResourceType() {
    switch (this) {
      case 'Bot':
        return ImportResourceType.bot;
      case 'BotLocale':
        return ImportResourceType.botLocale;
      case 'CustomVocabulary':
        return ImportResourceType.customVocabulary;
    }
    throw Exception('$this is not known in enum ImportResourceType');
  }
}

enum ImportSortAttribute {
  lastUpdatedDateTime,
}

extension ImportSortAttributeValueExtension on ImportSortAttribute {
  String toValue() {
    switch (this) {
      case ImportSortAttribute.lastUpdatedDateTime:
        return 'LastUpdatedDateTime';
    }
  }
}

extension ImportSortAttributeFromString on String {
  ImportSortAttribute toImportSortAttribute() {
    switch (this) {
      case 'LastUpdatedDateTime':
        return ImportSortAttribute.lastUpdatedDateTime;
    }
    throw Exception('$this is not known in enum ImportSortAttribute');
  }
}

/// Provides information for sorting a list of imports.
class ImportSortBy {
  /// The export field to use for sorting.
  final ImportSortAttribute attribute;

  /// The order to sort the list.
  final SortOrder order;

  ImportSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

enum ImportStatus {
  inProgress,
  completed,
  failed,
  deleting,
}

extension ImportStatusValueExtension on ImportStatus {
  String toValue() {
    switch (this) {
      case ImportStatus.inProgress:
        return 'InProgress';
      case ImportStatus.completed:
        return 'Completed';
      case ImportStatus.failed:
        return 'Failed';
      case ImportStatus.deleting:
        return 'Deleting';
    }
  }
}

extension ImportStatusFromString on String {
  ImportStatus toImportStatus() {
    switch (this) {
      case 'InProgress':
        return ImportStatus.inProgress;
      case 'Completed':
        return ImportStatus.completed;
      case 'Failed':
        return ImportStatus.failed;
      case 'Deleting':
        return ImportStatus.deleting;
    }
    throw Exception('$this is not known in enum ImportStatus');
  }
}

/// Provides summary information about an import in an import list.
class ImportSummary {
  /// The date and time that the import was created.
  final DateTime? creationDateTime;

  /// The unique identifier that Amazon Lex assigned to the import.
  final String? importId;

  /// The status of the resource. When the status is <code>Completed</code> the
  /// resource is ready to build.
  final ImportStatus? importStatus;

  /// The unique identifier that Amazon Lex assigned to the imported resource.
  final String? importedResourceId;

  /// The name that you gave the imported resource.
  final String? importedResourceName;

  /// The type of resource that was imported.
  final ImportResourceType? importedResourceType;

  /// The date and time that the import was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The strategy used to merge existing bot or bot locale definitions with the
  /// imported definition.
  final MergeStrategy? mergeStrategy;

  ImportSummary({
    this.creationDateTime,
    this.importId,
    this.importStatus,
    this.importedResourceId,
    this.importedResourceName,
    this.importedResourceType,
    this.lastUpdatedDateTime,
    this.mergeStrategy,
  });

  factory ImportSummary.fromJson(Map<String, dynamic> json) {
    return ImportSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      importId: json['importId'] as String?,
      importStatus: (json['importStatus'] as String?)?.toImportStatus(),
      importedResourceId: json['importedResourceId'] as String?,
      importedResourceName: json['importedResourceName'] as String?,
      importedResourceType:
          (json['importedResourceType'] as String?)?.toImportResourceType(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      mergeStrategy: (json['mergeStrategy'] as String?)?.toMergeStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final importId = this.importId;
    final importStatus = this.importStatus;
    final importedResourceId = this.importedResourceId;
    final importedResourceName = this.importedResourceName;
    final importedResourceType = this.importedResourceType;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final mergeStrategy = this.mergeStrategy;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (importId != null) 'importId': importId,
      if (importStatus != null) 'importStatus': importStatus.toValue(),
      if (importedResourceId != null) 'importedResourceId': importedResourceId,
      if (importedResourceName != null)
        'importedResourceName': importedResourceName,
      if (importedResourceType != null)
        'importedResourceType': importedResourceType.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (mergeStrategy != null) 'mergeStrategy': mergeStrategy.toValue(),
    };
  }
}

/// Configuration setting for a response sent to the user before Amazon Lex
/// starts eliciting slots.
class InitialResponseSetting {
  final DialogCodeHookInvocationSetting? codeHook;
  final ConditionalSpecification? conditional;
  final ResponseSpecification? initialResponse;

  /// The next step in the conversation.
  final DialogState? nextStep;

  InitialResponseSetting({
    this.codeHook,
    this.conditional,
    this.initialResponse,
    this.nextStep,
  });

  factory InitialResponseSetting.fromJson(Map<String, dynamic> json) {
    return InitialResponseSetting(
      codeHook: json['codeHook'] != null
          ? DialogCodeHookInvocationSetting.fromJson(
              json['codeHook'] as Map<String, dynamic>)
          : null,
      conditional: json['conditional'] != null
          ? ConditionalSpecification.fromJson(
              json['conditional'] as Map<String, dynamic>)
          : null,
      initialResponse: json['initialResponse'] != null
          ? ResponseSpecification.fromJson(
              json['initialResponse'] as Map<String, dynamic>)
          : null,
      nextStep: json['nextStep'] != null
          ? DialogState.fromJson(json['nextStep'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final codeHook = this.codeHook;
    final conditional = this.conditional;
    final initialResponse = this.initialResponse;
    final nextStep = this.nextStep;
    return {
      if (codeHook != null) 'codeHook': codeHook,
      if (conditional != null) 'conditional': conditional,
      if (initialResponse != null) 'initialResponse': initialResponse,
      if (nextStep != null) 'nextStep': nextStep,
    };
  }
}

/// The name of a context that must be active for an intent to be selected by
/// Amazon Lex.
class InputContext {
  /// The name of the context.
  final String name;

  InputContext({
    required this.name,
  });

  factory InputContext.fromJson(Map<String, dynamic> json) {
    return InputContext(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Provides a statement the Amazon Lex conveys to the user when the intent is
/// successfully fulfilled.
class IntentClosingSetting {
  /// Specifies whether an intent's closing response is used. When this field is
  /// false, the closing response isn't sent to the user. If the
  /// <code>active</code> field isn't specified, the default is true.
  final bool? active;

  /// The response that Amazon Lex sends to the user when the intent is complete.
  final ResponseSpecification? closingResponse;

  /// A list of conditional branches associated with the intent's closing
  /// response. These branches are executed when the <code>nextStep</code>
  /// attribute is set to <code>EvalutateConditional</code>.
  final ConditionalSpecification? conditional;

  /// Specifies the next step that the bot executes after playing the intent's
  /// closing response.
  final DialogState? nextStep;

  IntentClosingSetting({
    this.active,
    this.closingResponse,
    this.conditional,
    this.nextStep,
  });

  factory IntentClosingSetting.fromJson(Map<String, dynamic> json) {
    return IntentClosingSetting(
      active: json['active'] as bool?,
      closingResponse: json['closingResponse'] != null
          ? ResponseSpecification.fromJson(
              json['closingResponse'] as Map<String, dynamic>)
          : null,
      conditional: json['conditional'] != null
          ? ConditionalSpecification.fromJson(
              json['conditional'] as Map<String, dynamic>)
          : null,
      nextStep: json['nextStep'] != null
          ? DialogState.fromJson(json['nextStep'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final closingResponse = this.closingResponse;
    final conditional = this.conditional;
    final nextStep = this.nextStep;
    return {
      if (active != null) 'active': active,
      if (closingResponse != null) 'closingResponse': closingResponse,
      if (conditional != null) 'conditional': conditional,
      if (nextStep != null) 'nextStep': nextStep,
    };
  }
}

/// Provides a prompt for making sure that the user is ready for the intent to
/// be fulfilled.
class IntentConfirmationSetting {
  /// Prompts the user to confirm the intent. This question should have a yes or
  /// no answer.
  ///
  /// Amazon Lex uses this prompt to ensure that the user acknowledges that the
  /// intent is ready for fulfillment. For example, with the
  /// <code>OrderPizza</code> intent, you might want to confirm that the order is
  /// correct before placing it. For other intents, such as intents that simply
  /// respond to user questions, you might not need to ask the user for
  /// confirmation before providing the information.
  final PromptSpecification promptSpecification;

  /// Specifies whether the intent's confirmation is sent to the user. When this
  /// field is false, confirmation and declination responses aren't sent. If the
  /// <code>active</code> field isn't specified, the default is true.
  final bool? active;

  /// The <code>DialogCodeHookInvocationSetting</code> object associated with
  /// intent's confirmation step. The dialog code hook is triggered based on these
  /// invocation settings when the confirmation next step or declination next step
  /// or failure next step is <code>InvokeDialogCodeHook</code>.
  final DialogCodeHookInvocationSetting? codeHook;

  /// A list of conditional branches to evaluate after the intent is closed.
  final ConditionalSpecification? confirmationConditional;

  /// Specifies the next step that the bot executes when the customer confirms the
  /// intent.
  final DialogState? confirmationNextStep;
  final ResponseSpecification? confirmationResponse;

  /// A list of conditional branches to evaluate after the intent is declined.
  final ConditionalSpecification? declinationConditional;

  /// Specifies the next step that the bot executes when the customer declines the
  /// intent.
  final DialogState? declinationNextStep;

  /// When the user answers "no" to the question defined in
  /// <code>promptSpecification</code>, Amazon Lex responds with this response to
  /// acknowledge that the intent was canceled.
  final ResponseSpecification? declinationResponse;

  /// The <code>DialogCodeHookInvocationSetting</code> used when the code hook is
  /// invoked during confirmation prompt retries.
  final ElicitationCodeHookInvocationSetting? elicitationCodeHook;
  final ConditionalSpecification? failureConditional;

  /// The next step to take in the conversation if the confirmation step fails.
  final DialogState? failureNextStep;
  final ResponseSpecification? failureResponse;

  IntentConfirmationSetting({
    required this.promptSpecification,
    this.active,
    this.codeHook,
    this.confirmationConditional,
    this.confirmationNextStep,
    this.confirmationResponse,
    this.declinationConditional,
    this.declinationNextStep,
    this.declinationResponse,
    this.elicitationCodeHook,
    this.failureConditional,
    this.failureNextStep,
    this.failureResponse,
  });

  factory IntentConfirmationSetting.fromJson(Map<String, dynamic> json) {
    return IntentConfirmationSetting(
      promptSpecification: PromptSpecification.fromJson(
          json['promptSpecification'] as Map<String, dynamic>),
      active: json['active'] as bool?,
      codeHook: json['codeHook'] != null
          ? DialogCodeHookInvocationSetting.fromJson(
              json['codeHook'] as Map<String, dynamic>)
          : null,
      confirmationConditional: json['confirmationConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['confirmationConditional'] as Map<String, dynamic>)
          : null,
      confirmationNextStep: json['confirmationNextStep'] != null
          ? DialogState.fromJson(
              json['confirmationNextStep'] as Map<String, dynamic>)
          : null,
      confirmationResponse: json['confirmationResponse'] != null
          ? ResponseSpecification.fromJson(
              json['confirmationResponse'] as Map<String, dynamic>)
          : null,
      declinationConditional: json['declinationConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['declinationConditional'] as Map<String, dynamic>)
          : null,
      declinationNextStep: json['declinationNextStep'] != null
          ? DialogState.fromJson(
              json['declinationNextStep'] as Map<String, dynamic>)
          : null,
      declinationResponse: json['declinationResponse'] != null
          ? ResponseSpecification.fromJson(
              json['declinationResponse'] as Map<String, dynamic>)
          : null,
      elicitationCodeHook: json['elicitationCodeHook'] != null
          ? ElicitationCodeHookInvocationSetting.fromJson(
              json['elicitationCodeHook'] as Map<String, dynamic>)
          : null,
      failureConditional: json['failureConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['failureConditional'] as Map<String, dynamic>)
          : null,
      failureNextStep: json['failureNextStep'] != null
          ? DialogState.fromJson(
              json['failureNextStep'] as Map<String, dynamic>)
          : null,
      failureResponse: json['failureResponse'] != null
          ? ResponseSpecification.fromJson(
              json['failureResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final promptSpecification = this.promptSpecification;
    final active = this.active;
    final codeHook = this.codeHook;
    final confirmationConditional = this.confirmationConditional;
    final confirmationNextStep = this.confirmationNextStep;
    final confirmationResponse = this.confirmationResponse;
    final declinationConditional = this.declinationConditional;
    final declinationNextStep = this.declinationNextStep;
    final declinationResponse = this.declinationResponse;
    final elicitationCodeHook = this.elicitationCodeHook;
    final failureConditional = this.failureConditional;
    final failureNextStep = this.failureNextStep;
    final failureResponse = this.failureResponse;
    return {
      'promptSpecification': promptSpecification,
      if (active != null) 'active': active,
      if (codeHook != null) 'codeHook': codeHook,
      if (confirmationConditional != null)
        'confirmationConditional': confirmationConditional,
      if (confirmationNextStep != null)
        'confirmationNextStep': confirmationNextStep,
      if (confirmationResponse != null)
        'confirmationResponse': confirmationResponse,
      if (declinationConditional != null)
        'declinationConditional': declinationConditional,
      if (declinationNextStep != null)
        'declinationNextStep': declinationNextStep,
      if (declinationResponse != null)
        'declinationResponse': declinationResponse,
      if (elicitationCodeHook != null)
        'elicitationCodeHook': elicitationCodeHook,
      if (failureConditional != null) 'failureConditional': failureConditional,
      if (failureNextStep != null) 'failureNextStep': failureNextStep,
      if (failureResponse != null) 'failureResponse': failureResponse,
    };
  }
}

/// Filters the response from the <code>ListIntents</code> operation.
class IntentFilter {
  /// The name of the field to use for the filter.
  final IntentFilterName name;

  /// The operator to use for the filter. Specify <code>EQ</code> when the
  /// <code>ListIntents</code> operation should return only aliases that equal the
  /// specified value. Specify <code>CO</code> when the <code>ListIntents</code>
  /// operation should return aliases that contain the specified value.
  final IntentFilterOperator operator;

  /// The value to use for the filter.
  final List<String> values;

  IntentFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum IntentFilterName {
  intentName,
}

extension IntentFilterNameValueExtension on IntentFilterName {
  String toValue() {
    switch (this) {
      case IntentFilterName.intentName:
        return 'IntentName';
    }
  }
}

extension IntentFilterNameFromString on String {
  IntentFilterName toIntentFilterName() {
    switch (this) {
      case 'IntentName':
        return IntentFilterName.intentName;
    }
    throw Exception('$this is not known in enum IntentFilterName');
  }
}

enum IntentFilterOperator {
  co,
  eq,
}

extension IntentFilterOperatorValueExtension on IntentFilterOperator {
  String toValue() {
    switch (this) {
      case IntentFilterOperator.co:
        return 'CO';
      case IntentFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension IntentFilterOperatorFromString on String {
  IntentFilterOperator toIntentFilterOperator() {
    switch (this) {
      case 'CO':
        return IntentFilterOperator.co;
      case 'EQ':
        return IntentFilterOperator.eq;
    }
    throw Exception('$this is not known in enum IntentFilterOperator');
  }
}

/// Override settings to configure the intent state.
class IntentOverride {
  /// The name of the intent. Only required when you're switching intents.
  final String? name;

  /// A map of all of the slot value overrides for the intent. The name of the
  /// slot maps to the value of the slot. Slots that are not included in the map
  /// aren't overridden.,
  final Map<String, SlotValueOverride>? slots;

  IntentOverride({
    this.name,
    this.slots,
  });

  factory IntentOverride.fromJson(Map<String, dynamic> json) {
    return IntentOverride(
      name: json['name'] as String?,
      slots: (json['slots'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, SlotValueOverride.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final slots = this.slots;
    return {
      if (name != null) 'name': name,
      if (slots != null) 'slots': slots,
    };
  }
}

enum IntentSortAttribute {
  intentName,
  lastUpdatedDateTime,
}

extension IntentSortAttributeValueExtension on IntentSortAttribute {
  String toValue() {
    switch (this) {
      case IntentSortAttribute.intentName:
        return 'IntentName';
      case IntentSortAttribute.lastUpdatedDateTime:
        return 'LastUpdatedDateTime';
    }
  }
}

extension IntentSortAttributeFromString on String {
  IntentSortAttribute toIntentSortAttribute() {
    switch (this) {
      case 'IntentName':
        return IntentSortAttribute.intentName;
      case 'LastUpdatedDateTime':
        return IntentSortAttribute.lastUpdatedDateTime;
    }
    throw Exception('$this is not known in enum IntentSortAttribute');
  }
}

/// Specifies attributes for sorting a list of intents.
class IntentSortBy {
  /// The attribute to use to sort the list of intents.
  final IntentSortAttribute attribute;

  /// The order to sort the list. You can choose ascending or descending.
  final SortOrder order;

  IntentSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

/// The object that contains the statistical summary of recommended intents
/// associated with the bot recommendation.
class IntentStatistics {
  /// The number of recommended intents associated with the bot recommendation.
  final int? discoveredIntentCount;

  IntentStatistics({
    this.discoveredIntentCount,
  });

  factory IntentStatistics.fromJson(Map<String, dynamic> json) {
    return IntentStatistics(
      discoveredIntentCount: json['discoveredIntentCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveredIntentCount = this.discoveredIntentCount;
    return {
      if (discoveredIntentCount != null)
        'discoveredIntentCount': discoveredIntentCount,
    };
  }
}

/// Summary information about an intent returned by the <code>ListIntents</code>
/// operation.
class IntentSummary {
  /// The description of the intent.
  final String? description;

  /// The input contexts that must be active for this intent to be considered for
  /// recognition.
  final List<InputContext>? inputContexts;

  /// The unique identifier assigned to the intent. Use this ID to get detailed
  /// information about the intent with the <code>DescribeIntent</code> operation.
  final String? intentId;

  /// The name of the intent.
  final String? intentName;

  /// The timestamp of the date and time that the intent was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The output contexts that are activated when this intent is fulfilled.
  final List<OutputContext>? outputContexts;

  /// If this intent is derived from a built-in intent, the name of the parent
  /// intent.
  final String? parentIntentSignature;

  IntentSummary({
    this.description,
    this.inputContexts,
    this.intentId,
    this.intentName,
    this.lastUpdatedDateTime,
    this.outputContexts,
    this.parentIntentSignature,
  });

  factory IntentSummary.fromJson(Map<String, dynamic> json) {
    return IntentSummary(
      description: json['description'] as String?,
      inputContexts: (json['inputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => InputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      intentId: json['intentId'] as String?,
      intentName: json['intentName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      outputContexts: (json['outputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentIntentSignature: json['parentIntentSignature'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final inputContexts = this.inputContexts;
    final intentId = this.intentId;
    final intentName = this.intentName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final outputContexts = this.outputContexts;
    final parentIntentSignature = this.parentIntentSignature;
    return {
      if (description != null) 'description': description,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (intentId != null) 'intentId': intentId,
      if (intentName != null) 'intentName': intentName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
    };
  }
}

/// Provides configuration information for the AMAZON.KendraSearchIntent intent.
/// When you use this intent, Amazon Lex searches the specified Amazon Kendra
/// index and returns documents from the index that match the user's utterance.
class KendraConfiguration {
  /// The Amazon Resource Name (ARN) of the Amazon Kendra index that you want the
  /// AMAZON.KendraSearchIntent intent to search. The index must be in the same
  /// account and Region as the Amazon Lex bot.
  final String kendraIndex;

  /// A query filter that Amazon Lex sends to Amazon Kendra to filter the response
  /// from a query. The filter is in the format defined by Amazon Kendra. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/filtering.html">Filtering
  /// queries</a>.
  final String? queryFilterString;

  /// Determines whether the AMAZON.KendraSearchIntent intent uses a custom query
  /// string to query the Amazon Kendra index.
  final bool? queryFilterStringEnabled;

  KendraConfiguration({
    required this.kendraIndex,
    this.queryFilterString,
    this.queryFilterStringEnabled,
  });

  factory KendraConfiguration.fromJson(Map<String, dynamic> json) {
    return KendraConfiguration(
      kendraIndex: json['kendraIndex'] as String,
      queryFilterString: json['queryFilterString'] as String?,
      queryFilterStringEnabled: json['queryFilterStringEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final kendraIndex = this.kendraIndex;
    final queryFilterString = this.queryFilterString;
    final queryFilterStringEnabled = this.queryFilterStringEnabled;
    return {
      'kendraIndex': kendraIndex,
      if (queryFilterString != null) 'queryFilterString': queryFilterString,
      if (queryFilterStringEnabled != null)
        'queryFilterStringEnabled': queryFilterStringEnabled,
    };
  }
}

/// Specifies a Lambda function that verifies requests to a bot or fulfills the
/// user's request to a bot.
class LambdaCodeHook {
  /// The version of the request-response that you want Amazon Lex to use to
  /// invoke your Lambda function.
  final String codeHookInterfaceVersion;

  /// The Amazon Resource Name (ARN) of the Lambda function.
  final String lambdaARN;

  LambdaCodeHook({
    required this.codeHookInterfaceVersion,
    required this.lambdaARN,
  });

  factory LambdaCodeHook.fromJson(Map<String, dynamic> json) {
    return LambdaCodeHook(
      codeHookInterfaceVersion: json['codeHookInterfaceVersion'] as String,
      lambdaARN: json['lambdaARN'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final codeHookInterfaceVersion = this.codeHookInterfaceVersion;
    final lambdaARN = this.lambdaARN;
    return {
      'codeHookInterfaceVersion': codeHookInterfaceVersion,
      'lambdaARN': lambdaARN,
    };
  }
}

/// The object that contains transcript filter details that are associated with
/// a bot recommendation.
class LexTranscriptFilter {
  /// The object that contains a date range filter that will be applied to the
  /// transcript. Specify this object if you want Amazon Lex to only read the
  /// files that are within the date range.
  final DateRangeFilter? dateRangeFilter;

  LexTranscriptFilter({
    this.dateRangeFilter,
  });

  factory LexTranscriptFilter.fromJson(Map<String, dynamic> json) {
    return LexTranscriptFilter(
      dateRangeFilter: json['dateRangeFilter'] != null
          ? DateRangeFilter.fromJson(
              json['dateRangeFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dateRangeFilter = this.dateRangeFilter;
    return {
      if (dateRangeFilter != null) 'dateRangeFilter': dateRangeFilter,
    };
  }
}

class ListAggregatedUtterancesResponse {
  /// Summaries of the aggregated utterance data. Each response contains
  /// information about the number of times that the utterance was seen during the
  /// time period, whether it was detected or missed, and when it was seen during
  /// the time period.
  final List<AggregatedUtterancesSummary>? aggregatedUtterancesSummaries;

  /// The time period used to aggregate the utterance data.
  final UtteranceAggregationDuration? aggregationDuration;

  /// The last date and time that the aggregated data was collected. The time
  /// period depends on the length of the aggregation window.
  ///
  /// <ul>
  /// <li>
  /// <b>Hours</b> - for 1 hour time window, every half hour; otherwise every
  /// hour.
  /// </li>
  /// <li>
  /// <b>Days</b> - every 6 hours
  /// </li>
  /// <li>
  /// <b>Weeks</b> - for a one week time window, every 12 hours; otherwise, every
  /// day
  /// </li>
  /// </ul>
  final DateTime? aggregationLastRefreshedDateTime;

  /// The date and time that the aggregation window ends. Only data collected
  /// between the start time and the end time are returned in the results.
  final DateTime? aggregationWindowEndTime;

  /// The date and time that the aggregation window begins. Only data collected
  /// after this time is returned in the results.
  final DateTime? aggregationWindowStartTime;

  /// The identifier of the bot alias that contains the utterances. If you
  /// specified the bot version, the bot alias ID isn't returned.
  final String? botAliasId;

  /// The identifier of the bot that contains the utterances.
  final String? botId;

  /// The identifier of the bot version that contains the utterances. If you
  /// specified the bot alias, the bot version isn't returned.
  final String? botVersion;

  /// The identifier of the language and locale that the utterances are in.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListAggregatedUtterances</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListAggregatedUtterances</code>
  /// operation request to get the next page of results.
  final String? nextToken;

  ListAggregatedUtterancesResponse({
    this.aggregatedUtterancesSummaries,
    this.aggregationDuration,
    this.aggregationLastRefreshedDateTime,
    this.aggregationWindowEndTime,
    this.aggregationWindowStartTime,
    this.botAliasId,
    this.botId,
    this.botVersion,
    this.localeId,
    this.nextToken,
  });

  factory ListAggregatedUtterancesResponse.fromJson(Map<String, dynamic> json) {
    return ListAggregatedUtterancesResponse(
      aggregatedUtterancesSummaries: (json['aggregatedUtterancesSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              AggregatedUtterancesSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      aggregationDuration: json['aggregationDuration'] != null
          ? UtteranceAggregationDuration.fromJson(
              json['aggregationDuration'] as Map<String, dynamic>)
          : null,
      aggregationLastRefreshedDateTime:
          timeStampFromJson(json['aggregationLastRefreshedDateTime']),
      aggregationWindowEndTime:
          timeStampFromJson(json['aggregationWindowEndTime']),
      aggregationWindowStartTime:
          timeStampFromJson(json['aggregationWindowStartTime']),
      botAliasId: json['botAliasId'] as String?,
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedUtterancesSummaries = this.aggregatedUtterancesSummaries;
    final aggregationDuration = this.aggregationDuration;
    final aggregationLastRefreshedDateTime =
        this.aggregationLastRefreshedDateTime;
    final aggregationWindowEndTime = this.aggregationWindowEndTime;
    final aggregationWindowStartTime = this.aggregationWindowStartTime;
    final botAliasId = this.botAliasId;
    final botId = this.botId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (aggregatedUtterancesSummaries != null)
        'aggregatedUtterancesSummaries': aggregatedUtterancesSummaries,
      if (aggregationDuration != null)
        'aggregationDuration': aggregationDuration,
      if (aggregationLastRefreshedDateTime != null)
        'aggregationLastRefreshedDateTime':
            unixTimestampToJson(aggregationLastRefreshedDateTime),
      if (aggregationWindowEndTime != null)
        'aggregationWindowEndTime':
            unixTimestampToJson(aggregationWindowEndTime),
      if (aggregationWindowStartTime != null)
        'aggregationWindowStartTime':
            unixTimestampToJson(aggregationWindowStartTime),
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBotAliasesResponse {
  /// Summary information for the bot aliases that meet the filter criteria
  /// specified in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more aliases
  /// available, the <code>nextToken</code> field contains a token to get the next
  /// page of results.
  final List<BotAliasSummary>? botAliasSummaries;

  /// The identifier of the bot associated with the aliases.
  final String? botId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListBotAliases</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListBotAliases</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListBotAliasesResponse({
    this.botAliasSummaries,
    this.botId,
    this.nextToken,
  });

  factory ListBotAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListBotAliasesResponse(
      botAliasSummaries: (json['botAliasSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BotAliasSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasSummaries = this.botAliasSummaries;
    final botId = this.botId;
    final nextToken = this.nextToken;
    return {
      if (botAliasSummaries != null) 'botAliasSummaries': botAliasSummaries,
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBotLocalesResponse {
  /// The identifier of the bot to list locales for.
  final String? botId;

  /// Summary information for the locales that meet the filter criteria specified
  /// in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more locales
  /// available, the <code>nextToken</code> field contains a token to get the next
  /// page of results.
  final List<BotLocaleSummary>? botLocaleSummaries;

  /// The version of the bot.
  final String? botVersion;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListBotLocales</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListBotLocales</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListBotLocalesResponse({
    this.botId,
    this.botLocaleSummaries,
    this.botVersion,
    this.nextToken,
  });

  factory ListBotLocalesResponse.fromJson(Map<String, dynamic> json) {
    return ListBotLocalesResponse(
      botId: json['botId'] as String?,
      botLocaleSummaries: (json['botLocaleSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BotLocaleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      botVersion: json['botVersion'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botLocaleSummaries = this.botLocaleSummaries;
    final botVersion = this.botVersion;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botLocaleSummaries != null) 'botLocaleSummaries': botLocaleSummaries,
      if (botVersion != null) 'botVersion': botVersion,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBotRecommendationsResponse {
  /// The unique identifier of the bot that contains the bot recommendation list.
  final String? botId;

  /// Summary information for the bot recommendations that meet the filter
  /// specified in this request. The length of the list is specified in the
  /// maxResults parameter of the request. If there are more bot recommendations
  /// available, the nextToken field contains a token to get the next page of
  /// results.
  final List<BotRecommendationSummary>? botRecommendationSummaries;

  /// The version of the bot that contains the bot recommendation list.
  final String? botVersion;

  /// The identifier of the language and locale of the bot recommendation list.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the ListBotRecommendations operation. If the nextToken field is
  /// present, you send the contents as the nextToken parameter of a
  /// ListBotRecommendations operation request to get the next page of results.
  final String? nextToken;

  ListBotRecommendationsResponse({
    this.botId,
    this.botRecommendationSummaries,
    this.botVersion,
    this.localeId,
    this.nextToken,
  });

  factory ListBotRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListBotRecommendationsResponse(
      botId: json['botId'] as String?,
      botRecommendationSummaries: (json['botRecommendationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BotRecommendationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      botVersion: json['botVersion'] as String?,
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botRecommendationSummaries = this.botRecommendationSummaries;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botRecommendationSummaries != null)
        'botRecommendationSummaries': botRecommendationSummaries,
      if (botVersion != null) 'botVersion': botVersion,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBotVersionsResponse {
  /// The identifier of the bot to list versions for.
  final String? botId;

  /// Summary information for the bot versions that meet the filter criteria
  /// specified in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more versions
  /// available, the <code>nextToken</code> field contains a token to get the next
  /// page of results.
  final List<BotVersionSummary>? botVersionSummaries;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListBotVersions</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListBotAliases</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListBotVersionsResponse({
    this.botId,
    this.botVersionSummaries,
    this.nextToken,
  });

  factory ListBotVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListBotVersionsResponse(
      botId: json['botId'] as String?,
      botVersionSummaries: (json['botVersionSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BotVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersionSummaries = this.botVersionSummaries;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botVersionSummaries != null)
        'botVersionSummaries': botVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBotsResponse {
  /// Summary information for the bots that meet the filter criteria specified in
  /// the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more bots
  /// available, the <code>nextToken</code> field contains a token to the next
  /// page of results.
  final List<BotSummary>? botSummaries;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListBots</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListBots</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListBotsResponse({
    this.botSummaries,
    this.nextToken,
  });

  factory ListBotsResponse.fromJson(Map<String, dynamic> json) {
    return ListBotsResponse(
      botSummaries: (json['botSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BotSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botSummaries = this.botSummaries;
    final nextToken = this.nextToken;
    return {
      if (botSummaries != null) 'botSummaries': botSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBuiltInIntentsResponse {
  /// Summary information for the built-in intents that meet the filter criteria
  /// specified in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more intents
  /// available, the <code>nextToken</code> field contains a token to get the next
  /// page of results.
  final List<BuiltInIntentSummary>? builtInIntentSummaries;

  /// The language and locale of the intents in the list.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListBuiltInIntents</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListBotAliases</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListBuiltInIntentsResponse({
    this.builtInIntentSummaries,
    this.localeId,
    this.nextToken,
  });

  factory ListBuiltInIntentsResponse.fromJson(Map<String, dynamic> json) {
    return ListBuiltInIntentsResponse(
      builtInIntentSummaries: (json['builtInIntentSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BuiltInIntentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final builtInIntentSummaries = this.builtInIntentSummaries;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (builtInIntentSummaries != null)
        'builtInIntentSummaries': builtInIntentSummaries,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBuiltInSlotTypesResponse {
  /// Summary information for the built-in slot types that meet the filter
  /// criteria specified in the request. The length of the list is specified in
  /// the <code>maxResults</code> parameter of the request. If there are more slot
  /// types available, the <code>nextToken</code> field contains a token to get
  /// the next page of results.
  final List<BuiltInSlotTypeSummary>? builtInSlotTypeSummaries;

  /// The language and locale of the slot types in the list.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListBuiltInSlotTypes</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>LIstBuiltInSlotTypes</code>
  /// operation request to get the next page of results.
  final String? nextToken;

  ListBuiltInSlotTypesResponse({
    this.builtInSlotTypeSummaries,
    this.localeId,
    this.nextToken,
  });

  factory ListBuiltInSlotTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListBuiltInSlotTypesResponse(
      builtInSlotTypeSummaries: (json['builtInSlotTypeSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BuiltInSlotTypeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final builtInSlotTypeSummaries = this.builtInSlotTypeSummaries;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (builtInSlotTypeSummaries != null)
        'builtInSlotTypeSummaries': builtInSlotTypeSummaries,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCustomVocabularyItemsResponse {
  /// The identifier of the bot associated with this custom vocabulary.
  final String? botId;

  /// The identifier of the version of the bot associated with this custom
  /// vocabulary.
  final String? botVersion;

  /// The custom vocabulary items from the list custom vocabulary response.
  final List<CustomVocabularyItem>? customVocabularyItems;

  /// The identifier of the language and locale where this custom vocabulary is
  /// used. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">
  /// Supported Languages </a>.
  final String? localeId;

  /// The nextToken identifier to the list custom vocabulary response.
  final String? nextToken;

  ListCustomVocabularyItemsResponse({
    this.botId,
    this.botVersion,
    this.customVocabularyItems,
    this.localeId,
    this.nextToken,
  });

  factory ListCustomVocabularyItemsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCustomVocabularyItemsResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      customVocabularyItems: (json['customVocabularyItems'] as List?)
          ?.whereNotNull()
          .map((e) => CustomVocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final customVocabularyItems = this.customVocabularyItems;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (customVocabularyItems != null)
        'customVocabularyItems': customVocabularyItems,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListExportsResponse {
  /// The unique identifier assigned to the bot by Amazon Lex.
  final String? botId;

  /// The version of the bot that was exported.
  final String? botVersion;

  /// Summary information for the exports that meet the filter criteria specified
  /// in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter. If there are more exports available, the
  /// <code>nextToken</code> field contains a token to get the next page of
  /// results.
  final List<ExportSummary>? exportSummaries;

  /// The locale specified in the request.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListExports</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListExports</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListExportsResponse({
    this.botId,
    this.botVersion,
    this.exportSummaries,
    this.localeId,
    this.nextToken,
  });

  factory ListExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportsResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      exportSummaries: (json['exportSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ExportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final exportSummaries = this.exportSummaries;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (exportSummaries != null) 'exportSummaries': exportSummaries,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListImportsResponse {
  /// The unique identifier assigned by Amazon Lex to the bot.
  final String? botId;

  /// The version of the bot that was imported. It will always be
  /// <code>DRAFT</code>.
  final String? botVersion;

  /// Summary information for the imports that meet the filter criteria specified
  /// in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter. If there are more imports available, the
  /// <code>nextToken</code> field contains a token to get the next page of
  /// results.
  final List<ImportSummary>? importSummaries;

  /// The locale specified in the request.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListImports</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListImports</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListImportsResponse({
    this.botId,
    this.botVersion,
    this.importSummaries,
    this.localeId,
    this.nextToken,
  });

  factory ListImportsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportsResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      importSummaries: (json['importSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ImportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final importSummaries = this.importSummaries;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (importSummaries != null) 'importSummaries': importSummaries,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIntentsResponse {
  /// The identifier of the bot that contains the intent.
  final String? botId;

  /// The version of the bot that contains the intent.
  final String? botVersion;

  /// Summary information for the intents that meet the filter criteria specified
  /// in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more intents
  /// available, the <code>nextToken</code> field contains a token to get the next
  /// page of results.
  final List<IntentSummary>? intentSummaries;

  /// The language and locale of the intents in the list.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListIntents</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListIntents</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  ListIntentsResponse({
    this.botId,
    this.botVersion,
    this.intentSummaries,
    this.localeId,
    this.nextToken,
  });

  factory ListIntentsResponse.fromJson(Map<String, dynamic> json) {
    return ListIntentsResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      intentSummaries: (json['intentSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => IntentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final intentSummaries = this.intentSummaries;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (intentSummaries != null) 'intentSummaries': intentSummaries,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRecommendedIntentsResponse {
  /// The unique identifier of the bot associated with the recommended intent.
  final String? botId;

  /// The identifier of the bot recommendation that contains the recommended
  /// intent.
  final String? botRecommendationId;

  /// The version of the bot that contains the intent.
  final String? botVersion;

  /// The identifier of the language and locale of the intents to list. The string
  /// must match one of the supported locales. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the ListRecommendedIntents operation. If the nextToken field is
  /// present, you send the contents as the nextToken parameter of a
  /// ListRecommendedIntents operation request to get the next page of results.
  final String? nextToken;

  /// Summary information for the intents that meet the filter criteria specified
  /// in the request. The length of the list is specified in the maxResults
  /// parameter of the request. If there are more intents available, the nextToken
  /// field contains a token to get the next page of results.
  final List<RecommendedIntentSummary>? summaryList;

  ListRecommendedIntentsResponse({
    this.botId,
    this.botRecommendationId,
    this.botVersion,
    this.localeId,
    this.nextToken,
    this.summaryList,
  });

  factory ListRecommendedIntentsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendedIntentsResponse(
      botId: json['botId'] as String?,
      botRecommendationId: json['botRecommendationId'] as String?,
      botVersion: json['botVersion'] as String?,
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
      summaryList: (json['summaryList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RecommendedIntentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botRecommendationId = this.botRecommendationId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    final summaryList = this.summaryList;
    return {
      if (botId != null) 'botId': botId,
      if (botRecommendationId != null)
        'botRecommendationId': botRecommendationId,
      if (botVersion != null) 'botVersion': botVersion,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
      if (summaryList != null) 'summaryList': summaryList,
    };
  }
}

class ListSlotTypesResponse {
  /// The identifier of the bot that contains the slot types.
  final String? botId;

  /// The version of the bot that contains the slot types.
  final String? botVersion;

  /// The language and local of the slot types in the list.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListSlotTypes</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListSlotTypes</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  /// Summary information for the slot types that meet the filter criteria
  /// specified in the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more slot
  /// types available, the <code>nextToken</code> field contains a token to get
  /// the next page of results.
  final List<SlotTypeSummary>? slotTypeSummaries;

  ListSlotTypesResponse({
    this.botId,
    this.botVersion,
    this.localeId,
    this.nextToken,
    this.slotTypeSummaries,
  });

  factory ListSlotTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListSlotTypesResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
      slotTypeSummaries: (json['slotTypeSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    final slotTypeSummaries = this.slotTypeSummaries;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
      if (slotTypeSummaries != null) 'slotTypeSummaries': slotTypeSummaries,
    };
  }
}

class ListSlotsResponse {
  /// The identifier of the bot that contains the slots.
  final String? botId;

  /// The version of the bot that contains the slots.
  final String? botVersion;

  /// The identifier of the intent that contains the slots.
  final String? intentId;

  /// The language and locale of the slots in the list.
  final String? localeId;

  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListSlots</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a <code>ListSlots</code> operation
  /// request to get the next page of results.
  final String? nextToken;

  /// Summary information for the slots that meet the filter criteria specified in
  /// the request. The length of the list is specified in the
  /// <code>maxResults</code> parameter of the request. If there are more slots
  /// available, the <code>nextToken</code> field contains a token to get the next
  /// page of results.
  final List<SlotSummary>? slotSummaries;

  ListSlotsResponse({
    this.botId,
    this.botVersion,
    this.intentId,
    this.localeId,
    this.nextToken,
    this.slotSummaries,
  });

  factory ListSlotsResponse.fromJson(Map<String, dynamic> json) {
    return ListSlotsResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      intentId: json['intentId'] as String?,
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
      slotSummaries: (json['slotSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => SlotSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final intentId = this.intentId;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    final slotSummaries = this.slotSummaries;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (intentId != null) 'intentId': intentId,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
      if (slotSummaries != null) 'slotSummaries': slotSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with a resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

enum MergeStrategy {
  overwrite,
  failOnConflict,
  append,
}

extension MergeStrategyValueExtension on MergeStrategy {
  String toValue() {
    switch (this) {
      case MergeStrategy.overwrite:
        return 'Overwrite';
      case MergeStrategy.failOnConflict:
        return 'FailOnConflict';
      case MergeStrategy.append:
        return 'Append';
    }
  }
}

extension MergeStrategyFromString on String {
  MergeStrategy toMergeStrategy() {
    switch (this) {
      case 'Overwrite':
        return MergeStrategy.overwrite;
      case 'FailOnConflict':
        return MergeStrategy.failOnConflict;
      case 'Append':
        return MergeStrategy.append;
    }
    throw Exception('$this is not known in enum MergeStrategy');
  }
}

/// The object that provides message text and it's type.
class Message {
  /// A message in a custom format defined by the client application.
  final CustomPayload? customPayload;

  /// A message that defines a response card that the client application can show
  /// to the user.
  final ImageResponseCard? imageResponseCard;

  /// A message in plain text format.
  final PlainTextMessage? plainTextMessage;

  /// A message in Speech Synthesis Markup Language (SSML).
  final SSMLMessage? ssmlMessage;

  Message({
    this.customPayload,
    this.imageResponseCard,
    this.plainTextMessage,
    this.ssmlMessage,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      customPayload: json['customPayload'] != null
          ? CustomPayload.fromJson(
              json['customPayload'] as Map<String, dynamic>)
          : null,
      imageResponseCard: json['imageResponseCard'] != null
          ? ImageResponseCard.fromJson(
              json['imageResponseCard'] as Map<String, dynamic>)
          : null,
      plainTextMessage: json['plainTextMessage'] != null
          ? PlainTextMessage.fromJson(
              json['plainTextMessage'] as Map<String, dynamic>)
          : null,
      ssmlMessage: json['ssmlMessage'] != null
          ? SSMLMessage.fromJson(json['ssmlMessage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customPayload = this.customPayload;
    final imageResponseCard = this.imageResponseCard;
    final plainTextMessage = this.plainTextMessage;
    final ssmlMessage = this.ssmlMessage;
    return {
      if (customPayload != null) 'customPayload': customPayload,
      if (imageResponseCard != null) 'imageResponseCard': imageResponseCard,
      if (plainTextMessage != null) 'plainTextMessage': plainTextMessage,
      if (ssmlMessage != null) 'ssmlMessage': ssmlMessage,
    };
  }
}

/// Provides one or more messages that Amazon Lex should send to the user.
class MessageGroup {
  /// The primary message that Amazon Lex should send to the user.
  final Message message;

  /// Message variations to send to the user. When variations are defined, Amazon
  /// Lex chooses the primary message or one of the variations to send to the
  /// user.
  final List<Message>? variations;

  MessageGroup({
    required this.message,
    this.variations,
  });

  factory MessageGroup.fromJson(Map<String, dynamic> json) {
    return MessageGroup(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      variations: (json['variations'] as List?)
          ?.whereNotNull()
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final variations = this.variations;
    return {
      'message': message,
      if (variations != null) 'variations': variations,
    };
  }
}

enum MessageSelectionStrategy {
  random,
  ordered,
}

extension MessageSelectionStrategyValueExtension on MessageSelectionStrategy {
  String toValue() {
    switch (this) {
      case MessageSelectionStrategy.random:
        return 'Random';
      case MessageSelectionStrategy.ordered:
        return 'Ordered';
    }
  }
}

extension MessageSelectionStrategyFromString on String {
  MessageSelectionStrategy toMessageSelectionStrategy() {
    switch (this) {
      case 'Random':
        return MessageSelectionStrategy.random;
      case 'Ordered':
        return MessageSelectionStrategy.ordered;
    }
    throw Exception('$this is not known in enum MessageSelectionStrategy');
  }
}

/// Indicates whether a slot can return multiple values.
class MultipleValuesSetting {
  /// Indicates whether a slot can return multiple values. When <code>true</code>,
  /// the slot may return more than one value in a response. When
  /// <code>false</code>, the slot returns only a single value.
  ///
  /// Multi-value slots are only available in the en-US locale. If you set this
  /// value to <code>true</code> in any other locale, Amazon Lex throws a
  /// <code>ValidationException</code>.
  ///
  /// If the <code>allowMutlipleValues</code> is not set, the default value is
  /// <code>false</code>.
  final bool? allowMultipleValues;

  MultipleValuesSetting({
    this.allowMultipleValues,
  });

  factory MultipleValuesSetting.fromJson(Map<String, dynamic> json) {
    return MultipleValuesSetting(
      allowMultipleValues: json['allowMultipleValues'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowMultipleValues = this.allowMultipleValues;
    return {
      if (allowMultipleValues != null)
        'allowMultipleValues': allowMultipleValues,
    };
  }
}

/// The new custom vocabulary item from the custom vocabulary list.
class NewCustomVocabularyItem {
  /// The unique phrase for the new custom vocabulary item from the custom
  /// vocabulary list.
  final String phrase;

  /// The display as value assigned to the new custom vocabulary item from the
  /// custom vocabulary list.
  final String? displayAs;

  /// The weight assigned to the new custom vocabulary item from the custom
  /// vocabulary list.
  final int? weight;

  NewCustomVocabularyItem({
    required this.phrase,
    this.displayAs,
    this.weight,
  });

  Map<String, dynamic> toJson() {
    final phrase = this.phrase;
    final displayAs = this.displayAs;
    final weight = this.weight;
    return {
      'phrase': phrase,
      if (displayAs != null) 'displayAs': displayAs,
      if (weight != null) 'weight': weight,
    };
  }
}

/// Determines whether Amazon Lex obscures slot values in conversation logs.
class ObfuscationSetting {
  /// Value that determines whether Amazon Lex obscures slot values in
  /// conversation logs. The default is to obscure the values.
  final ObfuscationSettingType obfuscationSettingType;

  ObfuscationSetting({
    required this.obfuscationSettingType,
  });

  factory ObfuscationSetting.fromJson(Map<String, dynamic> json) {
    return ObfuscationSetting(
      obfuscationSettingType:
          (json['obfuscationSettingType'] as String).toObfuscationSettingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final obfuscationSettingType = this.obfuscationSettingType;
    return {
      'obfuscationSettingType': obfuscationSettingType.toValue(),
    };
  }
}

enum ObfuscationSettingType {
  none,
  defaultObfuscation,
}

extension ObfuscationSettingTypeValueExtension on ObfuscationSettingType {
  String toValue() {
    switch (this) {
      case ObfuscationSettingType.none:
        return 'None';
      case ObfuscationSettingType.defaultObfuscation:
        return 'DefaultObfuscation';
    }
  }
}

extension ObfuscationSettingTypeFromString on String {
  ObfuscationSettingType toObfuscationSettingType() {
    switch (this) {
      case 'None':
        return ObfuscationSettingType.none;
      case 'DefaultObfuscation':
        return ObfuscationSettingType.defaultObfuscation;
    }
    throw Exception('$this is not known in enum ObfuscationSettingType');
  }
}

/// Describes a session context that is activated when an intent is fulfilled.
class OutputContext {
  /// The name of the output context.
  final String name;

  /// The amount of time, in seconds, that the output context should remain
  /// active. The time is figured from the first time the context is sent to the
  /// user.
  final int timeToLiveInSeconds;

  /// The number of conversation turns that the output context should remain
  /// active. The number of turns is counted from the first time that the context
  /// is sent to the user.
  final int turnsToLive;

  OutputContext({
    required this.name,
    required this.timeToLiveInSeconds,
    required this.turnsToLive,
  });

  factory OutputContext.fromJson(Map<String, dynamic> json) {
    return OutputContext(
      name: json['name'] as String,
      timeToLiveInSeconds: json['timeToLiveInSeconds'] as int,
      turnsToLive: json['turnsToLive'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final timeToLiveInSeconds = this.timeToLiveInSeconds;
    final turnsToLive = this.turnsToLive;
    return {
      'name': name,
      'timeToLiveInSeconds': timeToLiveInSeconds,
      'turnsToLive': turnsToLive,
    };
  }
}

/// A network of bots.
class ParentBotNetwork {
  /// The identifier of the network of bots assigned by Amazon Lex.
  final String botId;

  /// The version of the network of bots.
  final String botVersion;

  ParentBotNetwork({
    required this.botId,
    required this.botVersion,
  });

  factory ParentBotNetwork.fromJson(Map<String, dynamic> json) {
    return ParentBotNetwork(
      botId: json['botId'] as String,
      botVersion: json['botVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    return {
      'botId': botId,
      'botVersion': botVersion,
    };
  }
}

/// The object that contains a path format that will be applied when Amazon Lex
/// reads the transcript file in the bucket you provide. Specify this object if
/// you only want Lex to read a subset of files in your Amazon S3 bucket.
class PathFormat {
  /// A list of Amazon S3 prefixes that points to sub-folders in the Amazon S3
  /// bucket. Specify this list if you only want Lex to read the files under this
  /// set of sub-folders.
  final List<String>? objectPrefixes;

  PathFormat({
    this.objectPrefixes,
  });

  factory PathFormat.fromJson(Map<String, dynamic> json) {
    return PathFormat(
      objectPrefixes: (json['objectPrefixes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final objectPrefixes = this.objectPrefixes;
    return {
      if (objectPrefixes != null) 'objectPrefixes': objectPrefixes,
    };
  }
}

/// Defines an ASCII text message to send to the user.
class PlainTextMessage {
  /// The message to send to the user.
  final String value;

  PlainTextMessage({
    required this.value,
  });

  factory PlainTextMessage.fromJson(Map<String, dynamic> json) {
    return PlainTextMessage(
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// Specifies next steps to run after the dialog code hook finishes.
class PostDialogCodeHookInvocationSpecification {
  /// A list of conditional branches to evaluate after the dialog code hook throws
  /// an exception or returns with the <code>State</code> field of the
  /// <code>Intent</code> object set to <code>Failed</code>.
  final ConditionalSpecification? failureConditional;

  /// Specifies the next step the bot runs after the dialog code hook throws an
  /// exception or returns with the <code>State</code> field of the
  /// <code>Intent</code> object set to <code>Failed</code>.
  final DialogState? failureNextStep;
  final ResponseSpecification? failureResponse;

  /// A list of conditional branches to evaluate after the dialog code hook
  /// finishes successfully.
  final ConditionalSpecification? successConditional;

  /// Specifics the next step the bot runs after the dialog code hook finishes
  /// successfully.
  final DialogState? successNextStep;
  final ResponseSpecification? successResponse;

  /// A list of conditional branches to evaluate if the code hook times out.
  final ConditionalSpecification? timeoutConditional;

  /// Specifies the next step that the bot runs when the code hook times out.
  final DialogState? timeoutNextStep;
  final ResponseSpecification? timeoutResponse;

  PostDialogCodeHookInvocationSpecification({
    this.failureConditional,
    this.failureNextStep,
    this.failureResponse,
    this.successConditional,
    this.successNextStep,
    this.successResponse,
    this.timeoutConditional,
    this.timeoutNextStep,
    this.timeoutResponse,
  });

  factory PostDialogCodeHookInvocationSpecification.fromJson(
      Map<String, dynamic> json) {
    return PostDialogCodeHookInvocationSpecification(
      failureConditional: json['failureConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['failureConditional'] as Map<String, dynamic>)
          : null,
      failureNextStep: json['failureNextStep'] != null
          ? DialogState.fromJson(
              json['failureNextStep'] as Map<String, dynamic>)
          : null,
      failureResponse: json['failureResponse'] != null
          ? ResponseSpecification.fromJson(
              json['failureResponse'] as Map<String, dynamic>)
          : null,
      successConditional: json['successConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['successConditional'] as Map<String, dynamic>)
          : null,
      successNextStep: json['successNextStep'] != null
          ? DialogState.fromJson(
              json['successNextStep'] as Map<String, dynamic>)
          : null,
      successResponse: json['successResponse'] != null
          ? ResponseSpecification.fromJson(
              json['successResponse'] as Map<String, dynamic>)
          : null,
      timeoutConditional: json['timeoutConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['timeoutConditional'] as Map<String, dynamic>)
          : null,
      timeoutNextStep: json['timeoutNextStep'] != null
          ? DialogState.fromJson(
              json['timeoutNextStep'] as Map<String, dynamic>)
          : null,
      timeoutResponse: json['timeoutResponse'] != null
          ? ResponseSpecification.fromJson(
              json['timeoutResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failureConditional = this.failureConditional;
    final failureNextStep = this.failureNextStep;
    final failureResponse = this.failureResponse;
    final successConditional = this.successConditional;
    final successNextStep = this.successNextStep;
    final successResponse = this.successResponse;
    final timeoutConditional = this.timeoutConditional;
    final timeoutNextStep = this.timeoutNextStep;
    final timeoutResponse = this.timeoutResponse;
    return {
      if (failureConditional != null) 'failureConditional': failureConditional,
      if (failureNextStep != null) 'failureNextStep': failureNextStep,
      if (failureResponse != null) 'failureResponse': failureResponse,
      if (successConditional != null) 'successConditional': successConditional,
      if (successNextStep != null) 'successNextStep': successNextStep,
      if (successResponse != null) 'successResponse': successResponse,
      if (timeoutConditional != null) 'timeoutConditional': timeoutConditional,
      if (timeoutNextStep != null) 'timeoutNextStep': timeoutNextStep,
      if (timeoutResponse != null) 'timeoutResponse': timeoutResponse,
    };
  }
}

/// Provides a setting that determines whether the post-fulfillment response is
/// sent to the user. For more information, see <a
/// href="https://docs.aws.amazon.com/lexv2/latest/dg/streaming-progress.html#progress-complete">https://docs.aws.amazon.com/lexv2/latest/dg/streaming-progress.html#progress-complete</a>
class PostFulfillmentStatusSpecification {
  /// A list of conditional branches to evaluate after the fulfillment code hook
  /// throws an exception or returns with the <code>State</code> field of the
  /// <code>Intent</code> object set to <code>Failed</code>.
  final ConditionalSpecification? failureConditional;

  /// Specifies the next step the bot runs after the fulfillment code hook throws
  /// an exception or returns with the <code>State</code> field of the
  /// <code>Intent</code> object set to <code>Failed</code>.
  final DialogState? failureNextStep;
  final ResponseSpecification? failureResponse;

  /// A list of conditional branches to evaluate after the fulfillment code hook
  /// finishes successfully.
  final ConditionalSpecification? successConditional;

  /// Specifies the next step in the conversation that Amazon Lex invokes when the
  /// fulfillment code hook completes successfully.
  final DialogState? successNextStep;
  final ResponseSpecification? successResponse;

  /// A list of conditional branches to evaluate if the fulfillment code hook
  /// times out.
  final ConditionalSpecification? timeoutConditional;

  /// Specifies the next step that the bot runs when the fulfillment code hook
  /// times out.
  final DialogState? timeoutNextStep;
  final ResponseSpecification? timeoutResponse;

  PostFulfillmentStatusSpecification({
    this.failureConditional,
    this.failureNextStep,
    this.failureResponse,
    this.successConditional,
    this.successNextStep,
    this.successResponse,
    this.timeoutConditional,
    this.timeoutNextStep,
    this.timeoutResponse,
  });

  factory PostFulfillmentStatusSpecification.fromJson(
      Map<String, dynamic> json) {
    return PostFulfillmentStatusSpecification(
      failureConditional: json['failureConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['failureConditional'] as Map<String, dynamic>)
          : null,
      failureNextStep: json['failureNextStep'] != null
          ? DialogState.fromJson(
              json['failureNextStep'] as Map<String, dynamic>)
          : null,
      failureResponse: json['failureResponse'] != null
          ? ResponseSpecification.fromJson(
              json['failureResponse'] as Map<String, dynamic>)
          : null,
      successConditional: json['successConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['successConditional'] as Map<String, dynamic>)
          : null,
      successNextStep: json['successNextStep'] != null
          ? DialogState.fromJson(
              json['successNextStep'] as Map<String, dynamic>)
          : null,
      successResponse: json['successResponse'] != null
          ? ResponseSpecification.fromJson(
              json['successResponse'] as Map<String, dynamic>)
          : null,
      timeoutConditional: json['timeoutConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['timeoutConditional'] as Map<String, dynamic>)
          : null,
      timeoutNextStep: json['timeoutNextStep'] != null
          ? DialogState.fromJson(
              json['timeoutNextStep'] as Map<String, dynamic>)
          : null,
      timeoutResponse: json['timeoutResponse'] != null
          ? ResponseSpecification.fromJson(
              json['timeoutResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failureConditional = this.failureConditional;
    final failureNextStep = this.failureNextStep;
    final failureResponse = this.failureResponse;
    final successConditional = this.successConditional;
    final successNextStep = this.successNextStep;
    final successResponse = this.successResponse;
    final timeoutConditional = this.timeoutConditional;
    final timeoutNextStep = this.timeoutNextStep;
    final timeoutResponse = this.timeoutResponse;
    return {
      if (failureConditional != null) 'failureConditional': failureConditional,
      if (failureNextStep != null) 'failureNextStep': failureNextStep,
      if (failureResponse != null) 'failureResponse': failureResponse,
      if (successConditional != null) 'successConditional': successConditional,
      if (successNextStep != null) 'successNextStep': successNextStep,
      if (successResponse != null) 'successResponse': successResponse,
      if (timeoutConditional != null) 'timeoutConditional': timeoutConditional,
      if (timeoutNextStep != null) 'timeoutNextStep': timeoutNextStep,
      if (timeoutResponse != null) 'timeoutResponse': timeoutResponse,
    };
  }
}

/// The IAM principal that you allowing or denying access to an Amazon Lex
/// action. You must provide a <code>service</code> or an <code>arn</code>, but
/// not both in the same statement. For more information, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">
/// AWS JSON policy elements: Principal </a>.
class Principal {
  /// The Amazon Resource Name (ARN) of the principal.
  final String? arn;

  /// The name of the AWS service that should allowed or denied access to an
  /// Amazon Lex action.
  final String? service;

  Principal({
    this.arn,
    this.service,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final service = this.service;
    return {
      if (arn != null) 'arn': arn,
      if (service != null) 'service': service,
    };
  }
}

/// The attempt name of attempts of a prompt.
enum PromptAttempt {
  initial,
  retry1,
  retry2,
  retry3,
  retry4,
  retry5,
}

extension PromptAttemptValueExtension on PromptAttempt {
  String toValue() {
    switch (this) {
      case PromptAttempt.initial:
        return 'Initial';
      case PromptAttempt.retry1:
        return 'Retry1';
      case PromptAttempt.retry2:
        return 'Retry2';
      case PromptAttempt.retry3:
        return 'Retry3';
      case PromptAttempt.retry4:
        return 'Retry4';
      case PromptAttempt.retry5:
        return 'Retry5';
    }
  }
}

extension PromptAttemptFromString on String {
  PromptAttempt toPromptAttempt() {
    switch (this) {
      case 'Initial':
        return PromptAttempt.initial;
      case 'Retry1':
        return PromptAttempt.retry1;
      case 'Retry2':
        return PromptAttempt.retry2;
      case 'Retry3':
        return PromptAttempt.retry3;
      case 'Retry4':
        return PromptAttempt.retry4;
      case 'Retry5':
        return PromptAttempt.retry5;
    }
    throw Exception('$this is not known in enum PromptAttempt');
  }
}

/// Specifies the settings on a prompt attempt.
class PromptAttemptSpecification {
  /// Indicates the allowed input types of the prompt attempt.
  final AllowedInputTypes allowedInputTypes;

  /// Indicates whether the user can interrupt a speech prompt attempt from the
  /// bot.
  final bool? allowInterrupt;

  /// Specifies the settings on audio and DTMF input.
  final AudioAndDTMFInputSpecification? audioAndDTMFInputSpecification;

  /// Specifies the settings on text input.
  final TextInputSpecification? textInputSpecification;

  PromptAttemptSpecification({
    required this.allowedInputTypes,
    this.allowInterrupt,
    this.audioAndDTMFInputSpecification,
    this.textInputSpecification,
  });

  factory PromptAttemptSpecification.fromJson(Map<String, dynamic> json) {
    return PromptAttemptSpecification(
      allowedInputTypes: AllowedInputTypes.fromJson(
          json['allowedInputTypes'] as Map<String, dynamic>),
      allowInterrupt: json['allowInterrupt'] as bool?,
      audioAndDTMFInputSpecification: json['audioAndDTMFInputSpecification'] !=
              null
          ? AudioAndDTMFInputSpecification.fromJson(
              json['audioAndDTMFInputSpecification'] as Map<String, dynamic>)
          : null,
      textInputSpecification: json['textInputSpecification'] != null
          ? TextInputSpecification.fromJson(
              json['textInputSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedInputTypes = this.allowedInputTypes;
    final allowInterrupt = this.allowInterrupt;
    final audioAndDTMFInputSpecification = this.audioAndDTMFInputSpecification;
    final textInputSpecification = this.textInputSpecification;
    return {
      'allowedInputTypes': allowedInputTypes,
      if (allowInterrupt != null) 'allowInterrupt': allowInterrupt,
      if (audioAndDTMFInputSpecification != null)
        'audioAndDTMFInputSpecification': audioAndDTMFInputSpecification,
      if (textInputSpecification != null)
        'textInputSpecification': textInputSpecification,
    };
  }
}

/// Specifies a list of message groups that Amazon Lex sends to a user to elicit
/// a response.
class PromptSpecification {
  /// The maximum number of times the bot tries to elicit a response from the user
  /// using this prompt.
  final int maxRetries;

  /// A collection of messages that Amazon Lex can send to the user. Amazon Lex
  /// chooses the actual message to send at runtime.
  final List<MessageGroup> messageGroups;

  /// Indicates whether the user can interrupt a speech prompt from the bot.
  final bool? allowInterrupt;

  /// Indicates how a message is selected from a message group among retries.
  final MessageSelectionStrategy? messageSelectionStrategy;

  /// Specifies the advanced settings on each attempt of the prompt.
  final Map<PromptAttempt, PromptAttemptSpecification>?
      promptAttemptsSpecification;

  PromptSpecification({
    required this.maxRetries,
    required this.messageGroups,
    this.allowInterrupt,
    this.messageSelectionStrategy,
    this.promptAttemptsSpecification,
  });

  factory PromptSpecification.fromJson(Map<String, dynamic> json) {
    return PromptSpecification(
      maxRetries: json['maxRetries'] as int,
      messageGroups: (json['messageGroups'] as List)
          .whereNotNull()
          .map((e) => MessageGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowInterrupt: json['allowInterrupt'] as bool?,
      messageSelectionStrategy: (json['messageSelectionStrategy'] as String?)
          ?.toMessageSelectionStrategy(),
      promptAttemptsSpecification: (json['promptAttemptsSpecification']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toPromptAttempt(),
              PromptAttemptSpecification.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final maxRetries = this.maxRetries;
    final messageGroups = this.messageGroups;
    final allowInterrupt = this.allowInterrupt;
    final messageSelectionStrategy = this.messageSelectionStrategy;
    final promptAttemptsSpecification = this.promptAttemptsSpecification;
    return {
      'maxRetries': maxRetries,
      'messageGroups': messageGroups,
      if (allowInterrupt != null) 'allowInterrupt': allowInterrupt,
      if (messageSelectionStrategy != null)
        'messageSelectionStrategy': messageSelectionStrategy.toValue(),
      if (promptAttemptsSpecification != null)
        'promptAttemptsSpecification':
            promptAttemptsSpecification.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// An object that contains a summary of a recommended intent.
class RecommendedIntentSummary {
  /// The unique identifier of a recommended intent associated with the bot
  /// recommendation.
  final String? intentId;

  /// The name of a recommended intent associated with the bot recommendation.
  final String? intentName;

  /// The count of sample utterances of a recommended intent that is associated
  /// with a bot recommendation.
  final int? sampleUtterancesCount;

  RecommendedIntentSummary({
    this.intentId,
    this.intentName,
    this.sampleUtterancesCount,
  });

  factory RecommendedIntentSummary.fromJson(Map<String, dynamic> json) {
    return RecommendedIntentSummary(
      intentId: json['intentId'] as String?,
      intentName: json['intentName'] as String?,
      sampleUtterancesCount: json['sampleUtterancesCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final intentId = this.intentId;
    final intentName = this.intentName;
    final sampleUtterancesCount = this.sampleUtterancesCount;
    return {
      if (intentId != null) 'intentId': intentId,
      if (intentName != null) 'intentName': intentName,
      if (sampleUtterancesCount != null)
        'sampleUtterancesCount': sampleUtterancesCount,
    };
  }
}

/// Specifies the time window that utterance statistics are returned for. The
/// time window is always relative to the last time that the that utterances
/// were aggregated. For example, if the <code>ListAggregatedUtterances</code>
/// operation is called at 1600, the time window is set to 1 hour, and the last
/// refresh time was 1530, only utterances made between 1430 and 1530 are
/// returned.
///
/// You can choose the time window that statistics should be returned for.
///
/// <ul>
/// <li>
/// <b>Hours</b> - You can request utterance statistics for 1, 3, 6, 12, or 24
/// hour time windows. Statistics are refreshed every half hour for 1 hour time
/// windows, and hourly for the other time windows.
/// </li>
/// <li>
/// <b>Days</b> - You can request utterance statistics for 3 days. Statistics
/// are refreshed every 6 hours.
/// </li>
/// <li>
/// <b>Weeks</b> - You can see statistics for one or two weeks. Statistics are
/// refreshed every 12 hours for one week time windows, and once per day for two
/// week time windows.
/// </li>
/// </ul>
class RelativeAggregationDuration {
  /// The type of time period that the <code>timeValue</code> field represents.
  final TimeDimension timeDimension;

  /// The period of the time window to gather statistics for. The valid value
  /// depends on the setting of the <code>timeDimension</code> field.
  ///
  /// <ul>
  /// <li>
  /// <code>Hours</code> - 1/3/6/12/24
  /// </li>
  /// <li>
  /// <code>Days</code> - 3
  /// </li>
  /// <li>
  /// <code>Weeks</code> - 1/2
  /// </li>
  /// </ul>
  final int timeValue;

  RelativeAggregationDuration({
    required this.timeDimension,
    required this.timeValue,
  });

  factory RelativeAggregationDuration.fromJson(Map<String, dynamic> json) {
    return RelativeAggregationDuration(
      timeDimension: (json['timeDimension'] as String).toTimeDimension(),
      timeValue: json['timeValue'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final timeDimension = this.timeDimension;
    final timeValue = this.timeValue;
    return {
      'timeDimension': timeDimension.toValue(),
      'timeValue': timeValue,
    };
  }
}

/// Specifies a list of message groups that Amazon Lex uses to respond the user
/// input.
class ResponseSpecification {
  /// A collection of responses that Amazon Lex can send to the user. Amazon Lex
  /// chooses the actual response to send at runtime.
  final List<MessageGroup> messageGroups;

  /// Indicates whether the user can interrupt a speech response from Amazon Lex.
  final bool? allowInterrupt;

  ResponseSpecification({
    required this.messageGroups,
    this.allowInterrupt,
  });

  factory ResponseSpecification.fromJson(Map<String, dynamic> json) {
    return ResponseSpecification(
      messageGroups: (json['messageGroups'] as List)
          .whereNotNull()
          .map((e) => MessageGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowInterrupt: json['allowInterrupt'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageGroups = this.messageGroups;
    final allowInterrupt = this.allowInterrupt;
    return {
      'messageGroups': messageGroups,
      if (allowInterrupt != null) 'allowInterrupt': allowInterrupt,
    };
  }
}

/// Specifies an Amazon S3 bucket for logging audio conversations
class S3BucketLogDestination {
  /// The S3 prefix to assign to audio log files.
  final String logPrefix;

  /// The Amazon Resource Name (ARN) of an Amazon S3 bucket where audio log files
  /// are stored.
  final String s3BucketArn;

  /// The Amazon Resource Name (ARN) of an AWS Key Management Service (KMS) key
  /// for encrypting audio log files stored in an S3 bucket.
  final String? kmsKeyArn;

  S3BucketLogDestination({
    required this.logPrefix,
    required this.s3BucketArn,
    this.kmsKeyArn,
  });

  factory S3BucketLogDestination.fromJson(Map<String, dynamic> json) {
    return S3BucketLogDestination(
      logPrefix: json['logPrefix'] as String,
      s3BucketArn: json['s3BucketArn'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logPrefix = this.logPrefix;
    final s3BucketArn = this.s3BucketArn;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'logPrefix': logPrefix,
      's3BucketArn': s3BucketArn,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// The object representing the Amazon S3 bucket containing the transcript, as
/// well as the associated metadata.
class S3BucketTranscriptSource {
  /// The name of the bucket containing the transcript and the associated
  /// metadata.
  final String s3BucketName;

  /// The format of the transcript content. Currently, Genie only supports the
  /// Amazon Lex transcript format.
  final TranscriptFormat transcriptFormat;

  /// The ARN of the KMS key that customer use to encrypt their Amazon S3 bucket.
  /// Only use this field if your bucket is encrypted using a customer managed KMS
  /// key.
  final String? kmsKeyArn;

  /// The object that contains a path format that will be applied when Amazon Lex
  /// reads the transcript file in the bucket you provide. Specify this object if
  /// you only want Lex to read a subset of files in your Amazon S3 bucket.
  final PathFormat? pathFormat;

  /// The object that contains the filter which will be applied when Amazon Lex
  /// reads through the Amazon S3 bucket. Specify this object if you want Amazon
  /// Lex to read only a subset of the Amazon S3 bucket based on the filter you
  /// provide.
  final TranscriptFilter? transcriptFilter;

  S3BucketTranscriptSource({
    required this.s3BucketName,
    required this.transcriptFormat,
    this.kmsKeyArn,
    this.pathFormat,
    this.transcriptFilter,
  });

  factory S3BucketTranscriptSource.fromJson(Map<String, dynamic> json) {
    return S3BucketTranscriptSource(
      s3BucketName: json['s3BucketName'] as String,
      transcriptFormat:
          (json['transcriptFormat'] as String).toTranscriptFormat(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
      pathFormat: json['pathFormat'] != null
          ? PathFormat.fromJson(json['pathFormat'] as Map<String, dynamic>)
          : null,
      transcriptFilter: json['transcriptFilter'] != null
          ? TranscriptFilter.fromJson(
              json['transcriptFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final transcriptFormat = this.transcriptFormat;
    final kmsKeyArn = this.kmsKeyArn;
    final pathFormat = this.pathFormat;
    final transcriptFilter = this.transcriptFilter;
    return {
      's3BucketName': s3BucketName,
      'transcriptFormat': transcriptFormat.toValue(),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (pathFormat != null) 'pathFormat': pathFormat,
      if (transcriptFilter != null) 'transcriptFilter': transcriptFilter,
    };
  }
}

/// Defines a Speech Synthesis Markup Language (SSML) prompt.
class SSMLMessage {
  /// The SSML text that defines the prompt.
  final String value;

  SSMLMessage({
    required this.value,
  });

  factory SSMLMessage.fromJson(Map<String, dynamic> json) {
    return SSMLMessage(
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// A sample utterance that invokes an intent or respond to a slot elicitation
/// prompt.
class SampleUtterance {
  /// The sample utterance that Amazon Lex uses to build its machine-learning
  /// model to recognize intents.
  final String utterance;

  SampleUtterance({
    required this.utterance,
  });

  factory SampleUtterance.fromJson(Map<String, dynamic> json) {
    return SampleUtterance(
      utterance: json['utterance'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final utterance = this.utterance;
    return {
      'utterance': utterance,
    };
  }
}

/// Defines one of the values for a slot type.
class SampleValue {
  /// The value that can be used for a slot type.
  final String value;

  SampleValue({
    required this.value,
  });

  factory SampleValue.fromJson(Map<String, dynamic> json) {
    return SampleValue(
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

class SearchAssociatedTranscriptsResponse {
  /// The object that contains the associated transcript that meet the criteria
  /// you specified.
  final List<AssociatedTranscript>? associatedTranscripts;

  /// The unique identifier of the bot associated with the transcripts that you
  /// are searching.
  final String? botId;

  /// The unique identifier of the bot recommendation associated with the
  /// transcripts to search.
  final String? botRecommendationId;

  /// The version of the bot containing the transcripts that you are searching.
  final String? botVersion;

  /// The identifier of the language and locale of the transcripts to search. The
  /// string must match one of the supported locales. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  final String? localeId;

  /// A index that indicates whether there are more results to return in a
  /// response to the SearchAssociatedTranscripts operation. If the nextIndex
  /// field is present, you send the contents as the nextIndex parameter of a
  /// SearchAssociatedTranscriptsRequest operation to get the next page of
  /// results.
  final int? nextIndex;

  /// The total number of transcripts returned by the search.
  final int? totalResults;

  SearchAssociatedTranscriptsResponse({
    this.associatedTranscripts,
    this.botId,
    this.botRecommendationId,
    this.botVersion,
    this.localeId,
    this.nextIndex,
    this.totalResults,
  });

  factory SearchAssociatedTranscriptsResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchAssociatedTranscriptsResponse(
      associatedTranscripts: (json['associatedTranscripts'] as List?)
          ?.whereNotNull()
          .map((e) => AssociatedTranscript.fromJson(e as Map<String, dynamic>))
          .toList(),
      botId: json['botId'] as String?,
      botRecommendationId: json['botRecommendationId'] as String?,
      botVersion: json['botVersion'] as String?,
      localeId: json['localeId'] as String?,
      nextIndex: json['nextIndex'] as int?,
      totalResults: json['totalResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedTranscripts = this.associatedTranscripts;
    final botId = this.botId;
    final botRecommendationId = this.botRecommendationId;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    final nextIndex = this.nextIndex;
    final totalResults = this.totalResults;
    return {
      if (associatedTranscripts != null)
        'associatedTranscripts': associatedTranscripts,
      if (botId != null) 'botId': botId,
      if (botRecommendationId != null)
        'botRecommendationId': botRecommendationId,
      if (botVersion != null) 'botVersion': botVersion,
      if (localeId != null) 'localeId': localeId,
      if (nextIndex != null) 'nextIndex': nextIndex,
      if (totalResults != null) 'totalResults': totalResults,
    };
  }
}

enum SearchOrder {
  ascending,
  descending,
}

extension SearchOrderValueExtension on SearchOrder {
  String toValue() {
    switch (this) {
      case SearchOrder.ascending:
        return 'Ascending';
      case SearchOrder.descending:
        return 'Descending';
    }
  }
}

extension SearchOrderFromString on String {
  SearchOrder toSearchOrder() {
    switch (this) {
      case 'Ascending':
        return SearchOrder.ascending;
      case 'Descending':
        return SearchOrder.descending;
    }
    throw Exception('$this is not known in enum SearchOrder');
  }
}

/// Determines whether Amazon Lex will use Amazon Comprehend to detect the
/// sentiment of user utterances.
class SentimentAnalysisSettings {
  /// Sets whether Amazon Lex uses Amazon Comprehend to detect the sentiment of
  /// user utterances.
  final bool detectSentiment;

  SentimentAnalysisSettings({
    required this.detectSentiment,
  });

  factory SentimentAnalysisSettings.fromJson(Map<String, dynamic> json) {
    return SentimentAnalysisSettings(
      detectSentiment: json['detectSentiment'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final detectSentiment = this.detectSentiment;
    return {
      'detectSentiment': detectSentiment,
    };
  }
}

/// Settings used when Amazon Lex successfully captures a slot value from a
/// user.
class SlotCaptureSetting {
  /// A list of conditional branches to evaluate after the slot value is captured.
  final ConditionalSpecification? captureConditional;

  /// Specifies the next step that the bot runs when the slot value is captured
  /// before the code hook times out.
  final DialogState? captureNextStep;
  final ResponseSpecification? captureResponse;

  /// Code hook called after Amazon Lex successfully captures a slot value.
  final DialogCodeHookInvocationSetting? codeHook;

  /// Code hook called when Amazon Lex doesn't capture a slot value.
  final ElicitationCodeHookInvocationSetting? elicitationCodeHook;

  /// A list of conditional branches to evaluate when the slot value isn't
  /// captured.
  final ConditionalSpecification? failureConditional;

  /// Specifies the next step that the bot runs when the slot value code is not
  /// recognized.
  final DialogState? failureNextStep;
  final ResponseSpecification? failureResponse;

  SlotCaptureSetting({
    this.captureConditional,
    this.captureNextStep,
    this.captureResponse,
    this.codeHook,
    this.elicitationCodeHook,
    this.failureConditional,
    this.failureNextStep,
    this.failureResponse,
  });

  factory SlotCaptureSetting.fromJson(Map<String, dynamic> json) {
    return SlotCaptureSetting(
      captureConditional: json['captureConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['captureConditional'] as Map<String, dynamic>)
          : null,
      captureNextStep: json['captureNextStep'] != null
          ? DialogState.fromJson(
              json['captureNextStep'] as Map<String, dynamic>)
          : null,
      captureResponse: json['captureResponse'] != null
          ? ResponseSpecification.fromJson(
              json['captureResponse'] as Map<String, dynamic>)
          : null,
      codeHook: json['codeHook'] != null
          ? DialogCodeHookInvocationSetting.fromJson(
              json['codeHook'] as Map<String, dynamic>)
          : null,
      elicitationCodeHook: json['elicitationCodeHook'] != null
          ? ElicitationCodeHookInvocationSetting.fromJson(
              json['elicitationCodeHook'] as Map<String, dynamic>)
          : null,
      failureConditional: json['failureConditional'] != null
          ? ConditionalSpecification.fromJson(
              json['failureConditional'] as Map<String, dynamic>)
          : null,
      failureNextStep: json['failureNextStep'] != null
          ? DialogState.fromJson(
              json['failureNextStep'] as Map<String, dynamic>)
          : null,
      failureResponse: json['failureResponse'] != null
          ? ResponseSpecification.fromJson(
              json['failureResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final captureConditional = this.captureConditional;
    final captureNextStep = this.captureNextStep;
    final captureResponse = this.captureResponse;
    final codeHook = this.codeHook;
    final elicitationCodeHook = this.elicitationCodeHook;
    final failureConditional = this.failureConditional;
    final failureNextStep = this.failureNextStep;
    final failureResponse = this.failureResponse;
    return {
      if (captureConditional != null) 'captureConditional': captureConditional,
      if (captureNextStep != null) 'captureNextStep': captureNextStep,
      if (captureResponse != null) 'captureResponse': captureResponse,
      if (codeHook != null) 'codeHook': codeHook,
      if (elicitationCodeHook != null)
        'elicitationCodeHook': elicitationCodeHook,
      if (failureConditional != null) 'failureConditional': failureConditional,
      if (failureNextStep != null) 'failureNextStep': failureNextStep,
      if (failureResponse != null) 'failureResponse': failureResponse,
    };
  }
}

enum SlotConstraint {
  required,
  optional,
}

extension SlotConstraintValueExtension on SlotConstraint {
  String toValue() {
    switch (this) {
      case SlotConstraint.required:
        return 'Required';
      case SlotConstraint.optional:
        return 'Optional';
    }
  }
}

extension SlotConstraintFromString on String {
  SlotConstraint toSlotConstraint() {
    switch (this) {
      case 'Required':
        return SlotConstraint.required;
      case 'Optional':
        return SlotConstraint.optional;
    }
    throw Exception('$this is not known in enum SlotConstraint');
  }
}

/// Specifies the default value to use when a user doesn't provide a value for a
/// slot.
class SlotDefaultValue {
  /// The default value to use when a user doesn't provide a value for a slot.
  final String defaultValue;

  SlotDefaultValue({
    required this.defaultValue,
  });

  factory SlotDefaultValue.fromJson(Map<String, dynamic> json) {
    return SlotDefaultValue(
      defaultValue: json['defaultValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    return {
      'defaultValue': defaultValue,
    };
  }
}

/// Defines a list of values that Amazon Lex should use as the default value for
/// a slot.
class SlotDefaultValueSpecification {
  /// A list of default values. Amazon Lex chooses the default value to use in the
  /// order that they are presented in the list.
  final List<SlotDefaultValue> defaultValueList;

  SlotDefaultValueSpecification({
    required this.defaultValueList,
  });

  factory SlotDefaultValueSpecification.fromJson(Map<String, dynamic> json) {
    return SlotDefaultValueSpecification(
      defaultValueList: (json['defaultValueList'] as List)
          .whereNotNull()
          .map((e) => SlotDefaultValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValueList = this.defaultValueList;
    return {
      'defaultValueList': defaultValueList,
    };
  }
}

/// Filters the response from the <code>ListSlots</code> operation.
class SlotFilter {
  /// The name of the field to use for filtering.
  final SlotFilterName name;

  /// The operator to use for the filter. Specify <code>EQ</code> when the
  /// <code>ListSlots</code> operation should return only aliases that equal the
  /// specified value. Specify <code>CO</code> when the <code>ListSlots</code>
  /// operation should return aliases that contain the specified value.
  final SlotFilterOperator operator;

  /// The value to use to filter the response.
  final List<String> values;

  SlotFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum SlotFilterName {
  slotName,
}

extension SlotFilterNameValueExtension on SlotFilterName {
  String toValue() {
    switch (this) {
      case SlotFilterName.slotName:
        return 'SlotName';
    }
  }
}

extension SlotFilterNameFromString on String {
  SlotFilterName toSlotFilterName() {
    switch (this) {
      case 'SlotName':
        return SlotFilterName.slotName;
    }
    throw Exception('$this is not known in enum SlotFilterName');
  }
}

enum SlotFilterOperator {
  co,
  eq,
}

extension SlotFilterOperatorValueExtension on SlotFilterOperator {
  String toValue() {
    switch (this) {
      case SlotFilterOperator.co:
        return 'CO';
      case SlotFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension SlotFilterOperatorFromString on String {
  SlotFilterOperator toSlotFilterOperator() {
    switch (this) {
      case 'CO':
        return SlotFilterOperator.co;
      case 'EQ':
        return SlotFilterOperator.eq;
    }
    throw Exception('$this is not known in enum SlotFilterOperator');
  }
}

/// Sets the priority that Amazon Lex should use when eliciting slot values from
/// a user.
class SlotPriority {
  /// The priority that a slot should be elicited.
  final int priority;

  /// The unique identifier of the slot.
  final String slotId;

  SlotPriority({
    required this.priority,
    required this.slotId,
  });

  factory SlotPriority.fromJson(Map<String, dynamic> json) {
    return SlotPriority(
      priority: json['priority'] as int,
      slotId: json['slotId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final slotId = this.slotId;
    return {
      'priority': priority,
      'slotId': slotId,
    };
  }
}

enum SlotShape {
  scalar,
  list,
}

extension SlotShapeValueExtension on SlotShape {
  String toValue() {
    switch (this) {
      case SlotShape.scalar:
        return 'Scalar';
      case SlotShape.list:
        return 'List';
    }
  }
}

extension SlotShapeFromString on String {
  SlotShape toSlotShape() {
    switch (this) {
      case 'Scalar':
        return SlotShape.scalar;
      case 'List':
        return SlotShape.list;
    }
    throw Exception('$this is not known in enum SlotShape');
  }
}

enum SlotSortAttribute {
  slotName,
  lastUpdatedDateTime,
}

extension SlotSortAttributeValueExtension on SlotSortAttribute {
  String toValue() {
    switch (this) {
      case SlotSortAttribute.slotName:
        return 'SlotName';
      case SlotSortAttribute.lastUpdatedDateTime:
        return 'LastUpdatedDateTime';
    }
  }
}

extension SlotSortAttributeFromString on String {
  SlotSortAttribute toSlotSortAttribute() {
    switch (this) {
      case 'SlotName':
        return SlotSortAttribute.slotName;
      case 'LastUpdatedDateTime':
        return SlotSortAttribute.lastUpdatedDateTime;
    }
    throw Exception('$this is not known in enum SlotSortAttribute');
  }
}

/// Specifies attributes for sorting a list of bots.
class SlotSortBy {
  /// The attribute to use to sort the list.
  final SlotSortAttribute attribute;

  /// The order to sort the list. You can choose ascending or descending.
  final SortOrder order;

  SlotSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

/// Summary information about a slot, a value that the bot elicits from the
/// user.
class SlotSummary {
  /// The description of the slot.
  final String? description;

  /// The timestamp of the last date and time that the slot was updated.
  final DateTime? lastUpdatedDateTime;

  /// Whether the slot is required or optional. An intent is complete when all
  /// required slots are filled.
  final SlotConstraint? slotConstraint;

  /// The unique identifier of the slot.
  final String? slotId;

  /// The name given to the slot.
  final String? slotName;

  /// The unique identifier for the slot type that defines the values for the
  /// slot.
  final String? slotTypeId;

  /// Prompts that are sent to the user to elicit a value for the slot.
  final PromptSpecification? valueElicitationPromptSpecification;

  SlotSummary({
    this.description,
    this.lastUpdatedDateTime,
    this.slotConstraint,
    this.slotId,
    this.slotName,
    this.slotTypeId,
    this.valueElicitationPromptSpecification,
  });

  factory SlotSummary.fromJson(Map<String, dynamic> json) {
    return SlotSummary(
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      slotConstraint: (json['slotConstraint'] as String?)?.toSlotConstraint(),
      slotId: json['slotId'] as String?,
      slotName: json['slotName'] as String?,
      slotTypeId: json['slotTypeId'] as String?,
      valueElicitationPromptSpecification:
          json['valueElicitationPromptSpecification'] != null
              ? PromptSpecification.fromJson(
                  json['valueElicitationPromptSpecification']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final slotConstraint = this.slotConstraint;
    final slotId = this.slotId;
    final slotName = this.slotName;
    final slotTypeId = this.slotTypeId;
    final valueElicitationPromptSpecification =
        this.valueElicitationPromptSpecification;
    return {
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (slotConstraint != null) 'slotConstraint': slotConstraint.toValue(),
      if (slotId != null) 'slotId': slotId,
      if (slotName != null) 'slotName': slotName,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (valueElicitationPromptSpecification != null)
        'valueElicitationPromptSpecification':
            valueElicitationPromptSpecification,
    };
  }
}

enum SlotTypeCategory {
  custom,
  extended,
  externalGrammar,
  composite,
}

extension SlotTypeCategoryValueExtension on SlotTypeCategory {
  String toValue() {
    switch (this) {
      case SlotTypeCategory.custom:
        return 'Custom';
      case SlotTypeCategory.extended:
        return 'Extended';
      case SlotTypeCategory.externalGrammar:
        return 'ExternalGrammar';
      case SlotTypeCategory.composite:
        return 'Composite';
    }
  }
}

extension SlotTypeCategoryFromString on String {
  SlotTypeCategory toSlotTypeCategory() {
    switch (this) {
      case 'Custom':
        return SlotTypeCategory.custom;
      case 'Extended':
        return SlotTypeCategory.extended;
      case 'ExternalGrammar':
        return SlotTypeCategory.externalGrammar;
      case 'Composite':
        return SlotTypeCategory.composite;
    }
    throw Exception('$this is not known in enum SlotTypeCategory');
  }
}

/// Filters the response from the <code>ListSlotTypes</code> operation.
class SlotTypeFilter {
  /// The name of the field to use for filtering.
  final SlotTypeFilterName name;

  /// The operator to use for the filter. Specify <code>EQ</code> when the
  /// <code>ListSlotTypes</code> operation should return only aliases that equal
  /// the specified value. Specify <code>CO</code> when the
  /// <code>ListSlotTypes</code> operation should return aliases that contain the
  /// specified value.
  final SlotTypeFilterOperator operator;

  /// The value to use to filter the response.
  final List<String> values;

  SlotTypeFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum SlotTypeFilterName {
  slotTypeName,
  externalSourceType,
}

extension SlotTypeFilterNameValueExtension on SlotTypeFilterName {
  String toValue() {
    switch (this) {
      case SlotTypeFilterName.slotTypeName:
        return 'SlotTypeName';
      case SlotTypeFilterName.externalSourceType:
        return 'ExternalSourceType';
    }
  }
}

extension SlotTypeFilterNameFromString on String {
  SlotTypeFilterName toSlotTypeFilterName() {
    switch (this) {
      case 'SlotTypeName':
        return SlotTypeFilterName.slotTypeName;
      case 'ExternalSourceType':
        return SlotTypeFilterName.externalSourceType;
    }
    throw Exception('$this is not known in enum SlotTypeFilterName');
  }
}

enum SlotTypeFilterOperator {
  co,
  eq,
}

extension SlotTypeFilterOperatorValueExtension on SlotTypeFilterOperator {
  String toValue() {
    switch (this) {
      case SlotTypeFilterOperator.co:
        return 'CO';
      case SlotTypeFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension SlotTypeFilterOperatorFromString on String {
  SlotTypeFilterOperator toSlotTypeFilterOperator() {
    switch (this) {
      case 'CO':
        return SlotTypeFilterOperator.co;
      case 'EQ':
        return SlotTypeFilterOperator.eq;
    }
    throw Exception('$this is not known in enum SlotTypeFilterOperator');
  }
}

enum SlotTypeSortAttribute {
  slotTypeName,
  lastUpdatedDateTime,
}

extension SlotTypeSortAttributeValueExtension on SlotTypeSortAttribute {
  String toValue() {
    switch (this) {
      case SlotTypeSortAttribute.slotTypeName:
        return 'SlotTypeName';
      case SlotTypeSortAttribute.lastUpdatedDateTime:
        return 'LastUpdatedDateTime';
    }
  }
}

extension SlotTypeSortAttributeFromString on String {
  SlotTypeSortAttribute toSlotTypeSortAttribute() {
    switch (this) {
      case 'SlotTypeName':
        return SlotTypeSortAttribute.slotTypeName;
      case 'LastUpdatedDateTime':
        return SlotTypeSortAttribute.lastUpdatedDateTime;
    }
    throw Exception('$this is not known in enum SlotTypeSortAttribute');
  }
}

/// Specifies attributes for sorting a list of slot types.
class SlotTypeSortBy {
  /// The attribute to use to sort the list of slot types.
  final SlotTypeSortAttribute attribute;

  /// The order to sort the list. You can say ascending or descending.
  final SortOrder order;

  SlotTypeSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

/// The object that contains the statistical summary of the recommended slot
/// type associated with the bot recommendation.
class SlotTypeStatistics {
  /// The number of recommended slot types associated with the bot recommendation.
  final int? discoveredSlotTypeCount;

  SlotTypeStatistics({
    this.discoveredSlotTypeCount,
  });

  factory SlotTypeStatistics.fromJson(Map<String, dynamic> json) {
    return SlotTypeStatistics(
      discoveredSlotTypeCount: json['discoveredSlotTypeCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveredSlotTypeCount = this.discoveredSlotTypeCount;
    return {
      if (discoveredSlotTypeCount != null)
        'discoveredSlotTypeCount': discoveredSlotTypeCount,
    };
  }
}

/// Provides summary information about a slot type.
class SlotTypeSummary {
  /// The description of the slot type.
  final String? description;

  /// A timestamp of the date and time that the slot type was last updated.
  final DateTime? lastUpdatedDateTime;

  /// If the slot type is derived from a built-on slot type, the name of the
  /// parent slot type.
  final String? parentSlotTypeSignature;

  /// Indicates the type of the slot type.
  ///
  /// <ul>
  /// <li>
  /// <code>Custom</code> - A slot type that you created using custom values. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/custom-slot-types.html">Creating
  /// custom slot types</a>.
  /// </li>
  /// <li>
  /// <code>Extended</code> - A slot type created by extending the
  /// AMAZON.AlphaNumeric built-in slot type. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/built-in-slot-alphanumerice.html">AMAZON.AlphaNumeric</a>.
  /// </li>
  /// <li>
  /// <code>ExternalGrammar</code> - A slot type using a custom GRXML grammar to
  /// define values. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/building-grxml.html">Using
  /// a custom grammar slot type</a>.
  /// </li>
  /// </ul>
  final SlotTypeCategory? slotTypeCategory;

  /// The unique identifier assigned to the slot type.
  final String? slotTypeId;

  /// The name of the slot type.
  final String? slotTypeName;

  SlotTypeSummary({
    this.description,
    this.lastUpdatedDateTime,
    this.parentSlotTypeSignature,
    this.slotTypeCategory,
    this.slotTypeId,
    this.slotTypeName,
  });

  factory SlotTypeSummary.fromJson(Map<String, dynamic> json) {
    return SlotTypeSummary(
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
      slotTypeCategory:
          (json['slotTypeCategory'] as String?)?.toSlotTypeCategory(),
      slotTypeId: json['slotTypeId'] as String?,
      slotTypeName: json['slotTypeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final parentSlotTypeSignature = this.parentSlotTypeSignature;
    final slotTypeCategory = this.slotTypeCategory;
    final slotTypeId = this.slotTypeId;
    final slotTypeName = this.slotTypeName;
    return {
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeCategory != null)
        'slotTypeCategory': slotTypeCategory.toValue(),
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (slotTypeName != null) 'slotTypeName': slotTypeName,
    };
  }
}

/// Each slot type can have a set of values. Each <code>SlotTypeValue</code>
/// represents a value that the slot type can take.
class SlotTypeValue {
  /// The value of the slot type entry.
  final SampleValue? sampleValue;

  /// Additional values related to the slot type entry.
  final List<SampleValue>? synonyms;

  SlotTypeValue({
    this.sampleValue,
    this.synonyms,
  });

  factory SlotTypeValue.fromJson(Map<String, dynamic> json) {
    return SlotTypeValue(
      sampleValue: json['sampleValue'] != null
          ? SampleValue.fromJson(json['sampleValue'] as Map<String, dynamic>)
          : null,
      synonyms: (json['synonyms'] as List?)
          ?.whereNotNull()
          .map((e) => SampleValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sampleValue = this.sampleValue;
    final synonyms = this.synonyms;
    return {
      if (sampleValue != null) 'sampleValue': sampleValue,
      if (synonyms != null) 'synonyms': synonyms,
    };
  }
}

/// The value to set in a slot.
class SlotValue {
  /// The value that Amazon Lex determines for the slot. The actual value depends
  /// on the setting of the value selection strategy for the bot. You can choose
  /// to use the value entered by the user, or you can have Amazon Lex choose the
  /// first value in the <code>resolvedValues</code> list.
  final String? interpretedValue;

  SlotValue({
    this.interpretedValue,
  });

  factory SlotValue.fromJson(Map<String, dynamic> json) {
    return SlotValue(
      interpretedValue: json['interpretedValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final interpretedValue = this.interpretedValue;
    return {
      if (interpretedValue != null) 'interpretedValue': interpretedValue,
    };
  }
}

/// Specifies the elicitation setting details for constituent sub slots of a
/// composite slot.
class SlotValueElicitationSetting {
  /// Specifies whether the slot is required or optional.
  final SlotConstraint slotConstraint;

  /// A list of default values for a slot. Default values are used when Amazon Lex
  /// hasn't determined a value for a slot. You can specify default values from
  /// context variables, session attributes, and defined values.
  final SlotDefaultValueSpecification? defaultValueSpecification;

  /// The prompt that Amazon Lex uses to elicit the slot value from the user.
  final PromptSpecification? promptSpecification;

  /// If you know a specific pattern that users might respond to an Amazon Lex
  /// request for a slot value, you can provide those utterances to improve
  /// accuracy. This is optional. In most cases, Amazon Lex is capable of
  /// understanding user utterances.
  final List<SampleUtterance>? sampleUtterances;

  /// Specifies the settings that Amazon Lex uses when a slot value is
  /// successfully entered by a user.
  final SlotCaptureSetting? slotCaptureSetting;
  final WaitAndContinueSpecification? waitAndContinueSpecification;

  SlotValueElicitationSetting({
    required this.slotConstraint,
    this.defaultValueSpecification,
    this.promptSpecification,
    this.sampleUtterances,
    this.slotCaptureSetting,
    this.waitAndContinueSpecification,
  });

  factory SlotValueElicitationSetting.fromJson(Map<String, dynamic> json) {
    return SlotValueElicitationSetting(
      slotConstraint: (json['slotConstraint'] as String).toSlotConstraint(),
      defaultValueSpecification: json['defaultValueSpecification'] != null
          ? SlotDefaultValueSpecification.fromJson(
              json['defaultValueSpecification'] as Map<String, dynamic>)
          : null,
      promptSpecification: json['promptSpecification'] != null
          ? PromptSpecification.fromJson(
              json['promptSpecification'] as Map<String, dynamic>)
          : null,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => SampleUtterance.fromJson(e as Map<String, dynamic>))
          .toList(),
      slotCaptureSetting: json['slotCaptureSetting'] != null
          ? SlotCaptureSetting.fromJson(
              json['slotCaptureSetting'] as Map<String, dynamic>)
          : null,
      waitAndContinueSpecification: json['waitAndContinueSpecification'] != null
          ? WaitAndContinueSpecification.fromJson(
              json['waitAndContinueSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final slotConstraint = this.slotConstraint;
    final defaultValueSpecification = this.defaultValueSpecification;
    final promptSpecification = this.promptSpecification;
    final sampleUtterances = this.sampleUtterances;
    final slotCaptureSetting = this.slotCaptureSetting;
    final waitAndContinueSpecification = this.waitAndContinueSpecification;
    return {
      'slotConstraint': slotConstraint.toValue(),
      if (defaultValueSpecification != null)
        'defaultValueSpecification': defaultValueSpecification,
      if (promptSpecification != null)
        'promptSpecification': promptSpecification,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slotCaptureSetting != null) 'slotCaptureSetting': slotCaptureSetting,
      if (waitAndContinueSpecification != null)
        'waitAndContinueSpecification': waitAndContinueSpecification,
    };
  }
}

/// The slot values that Amazon Lex uses when it sets slot values in a dialog
/// step.
class SlotValueOverride {
  /// When the shape value is <code>List</code>, it indicates that the
  /// <code>values</code> field contains a list of slot values. When the value is
  /// <code>Scalar</code>, it indicates that the <code>value</code> field contains
  /// a single value.
  final SlotShape? shape;

  /// The current value of the slot.
  final SlotValue? value;

  /// A list of one or more values that the user provided for the slot. For
  /// example, for a slot that elicits pizza toppings, the values might be
  /// "pepperoni" and "pineapple."
  final List<SlotValueOverride>? values;

  SlotValueOverride({
    this.shape,
    this.value,
    this.values,
  });

  factory SlotValueOverride.fromJson(Map<String, dynamic> json) {
    return SlotValueOverride(
      shape: (json['shape'] as String?)?.toSlotShape(),
      value: json['value'] != null
          ? SlotValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => SlotValueOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final shape = this.shape;
    final value = this.value;
    final values = this.values;
    return {
      if (shape != null) 'shape': shape.toValue(),
      if (value != null) 'value': value,
      if (values != null) 'values': values,
    };
  }
}

/// Provides a regular expression used to validate the value of a slot.
class SlotValueRegexFilter {
  /// A regular expression used to validate the value of a slot.
  ///
  /// Use a standard regular expression. Amazon Lex supports the following
  /// characters in the regular expression:
  ///
  /// <ul>
  /// <li>
  /// A-Z, a-z
  /// </li>
  /// <li>
  /// 0-9
  /// </li>
  /// <li>
  /// Unicode characters ("\ u&lt;Unicode&gt;")
  /// </li>
  /// </ul>
  /// Represent Unicode characters with four digits, for example "\u0041" or
  /// "\u005A".
  ///
  /// The following regular expression operators are not supported:
  ///
  /// <ul>
  /// <li>
  /// Infinite repeaters: *, +, or {x,} with no upper bound.
  /// </li>
  /// <li>
  /// Wild card (.)
  /// </li>
  /// </ul>
  final String pattern;

  SlotValueRegexFilter({
    required this.pattern,
  });

  factory SlotValueRegexFilter.fromJson(Map<String, dynamic> json) {
    return SlotValueRegexFilter(
      pattern: json['pattern'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final pattern = this.pattern;
    return {
      'pattern': pattern,
    };
  }
}

enum SlotValueResolutionStrategy {
  originalValue,
  topResolution,
  concatenation,
}

extension SlotValueResolutionStrategyValueExtension
    on SlotValueResolutionStrategy {
  String toValue() {
    switch (this) {
      case SlotValueResolutionStrategy.originalValue:
        return 'OriginalValue';
      case SlotValueResolutionStrategy.topResolution:
        return 'TopResolution';
      case SlotValueResolutionStrategy.concatenation:
        return 'Concatenation';
    }
  }
}

extension SlotValueResolutionStrategyFromString on String {
  SlotValueResolutionStrategy toSlotValueResolutionStrategy() {
    switch (this) {
      case 'OriginalValue':
        return SlotValueResolutionStrategy.originalValue;
      case 'TopResolution':
        return SlotValueResolutionStrategy.topResolution;
      case 'Concatenation':
        return SlotValueResolutionStrategy.concatenation;
    }
    throw Exception('$this is not known in enum SlotValueResolutionStrategy');
  }
}

/// Contains settings used by Amazon Lex to select a slot value.
class SlotValueSelectionSetting {
  /// Determines the slot resolution strategy that Amazon Lex uses to return slot
  /// type values. The field can be set to one of the following values:
  ///
  /// <ul>
  /// <li>
  /// OriginalValue - Returns the value entered by the user, if the user value is
  /// similar to the slot value.
  /// </li>
  /// <li>
  /// TopResolution - If there is a resolution list for the slot, return the first
  /// value in the resolution list as the slot type value. If there is no
  /// resolution list, null is returned.
  /// </li>
  /// </ul>
  /// If you don't specify the valueSelectionStrategy, the default is
  /// OriginalValue.
  final SlotValueResolutionStrategy resolutionStrategy;

  /// Provides settings that enable advanced recognition settings for slot values.
  final AdvancedRecognitionSetting? advancedRecognitionSetting;

  /// A regular expression used to validate the value of a slot.
  final SlotValueRegexFilter? regexFilter;

  SlotValueSelectionSetting({
    required this.resolutionStrategy,
    this.advancedRecognitionSetting,
    this.regexFilter,
  });

  factory SlotValueSelectionSetting.fromJson(Map<String, dynamic> json) {
    return SlotValueSelectionSetting(
      resolutionStrategy: (json['resolutionStrategy'] as String)
          .toSlotValueResolutionStrategy(),
      advancedRecognitionSetting: json['advancedRecognitionSetting'] != null
          ? AdvancedRecognitionSetting.fromJson(
              json['advancedRecognitionSetting'] as Map<String, dynamic>)
          : null,
      regexFilter: json['regexFilter'] != null
          ? SlotValueRegexFilter.fromJson(
              json['regexFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolutionStrategy = this.resolutionStrategy;
    final advancedRecognitionSetting = this.advancedRecognitionSetting;
    final regexFilter = this.regexFilter;
    return {
      'resolutionStrategy': resolutionStrategy.toValue(),
      if (advancedRecognitionSetting != null)
        'advancedRecognitionSetting': advancedRecognitionSetting,
      if (regexFilter != null) 'regexFilter': regexFilter,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'Ascending';
      case SortOrder.descending:
        return 'Descending';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'Ascending':
        return SortOrder.ascending;
      case 'Descending':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// Subslot specifications.
class Specifications {
  /// The unique identifier assigned to the slot type.
  final String slotTypeId;

  /// Specifies the elicitation setting details for constituent sub slots of a
  /// composite slot.
  final SubSlotValueElicitationSetting valueElicitationSetting;

  Specifications({
    required this.slotTypeId,
    required this.valueElicitationSetting,
  });

  factory Specifications.fromJson(Map<String, dynamic> json) {
    return Specifications(
      slotTypeId: json['slotTypeId'] as String,
      valueElicitationSetting: SubSlotValueElicitationSetting.fromJson(
          json['valueElicitationSetting'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final slotTypeId = this.slotTypeId;
    final valueElicitationSetting = this.valueElicitationSetting;
    return {
      'slotTypeId': slotTypeId,
      'valueElicitationSetting': valueElicitationSetting,
    };
  }
}

class StartBotRecommendationResponse {
  /// The unique identifier of the bot containing the bot recommendation.
  final String? botId;

  /// The identifier of the bot recommendation that you have created.
  final String? botRecommendationId;

  /// The status of the bot recommendation.
  ///
  /// If the status is Failed, then the reasons for the failure are listed in the
  /// failureReasons field.
  final BotRecommendationStatus? botRecommendationStatus;

  /// The version of the bot containing the bot recommendation.
  final String? botVersion;

  /// A timestamp of the date and time that the bot recommendation was created.
  final DateTime? creationDateTime;

  /// The object representing the passwords that were used to encrypt the data
  /// related to the bot recommendation results, as well as the KMS key ARN used
  /// to encrypt the associated metadata.
  final EncryptionSetting? encryptionSetting;

  /// The identifier of the language and locale of the bot recommendation to
  /// start. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  final String? localeId;

  /// The object representing the Amazon S3 bucket containing the transcript, as
  /// well as the associated metadata.
  final TranscriptSourceSetting? transcriptSourceSetting;

  StartBotRecommendationResponse({
    this.botId,
    this.botRecommendationId,
    this.botRecommendationStatus,
    this.botVersion,
    this.creationDateTime,
    this.encryptionSetting,
    this.localeId,
    this.transcriptSourceSetting,
  });

  factory StartBotRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return StartBotRecommendationResponse(
      botId: json['botId'] as String?,
      botRecommendationId: json['botRecommendationId'] as String?,
      botRecommendationStatus: (json['botRecommendationStatus'] as String?)
          ?.toBotRecommendationStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      encryptionSetting: json['encryptionSetting'] != null
          ? EncryptionSetting.fromJson(
              json['encryptionSetting'] as Map<String, dynamic>)
          : null,
      localeId: json['localeId'] as String?,
      transcriptSourceSetting: json['transcriptSourceSetting'] != null
          ? TranscriptSourceSetting.fromJson(
              json['transcriptSourceSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botRecommendationId = this.botRecommendationId;
    final botRecommendationStatus = this.botRecommendationStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final encryptionSetting = this.encryptionSetting;
    final localeId = this.localeId;
    final transcriptSourceSetting = this.transcriptSourceSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botRecommendationId != null)
        'botRecommendationId': botRecommendationId,
      if (botRecommendationStatus != null)
        'botRecommendationStatus': botRecommendationStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (encryptionSetting != null) 'encryptionSetting': encryptionSetting,
      if (localeId != null) 'localeId': localeId,
      if (transcriptSourceSetting != null)
        'transcriptSourceSetting': transcriptSourceSetting,
    };
  }
}

class StartImportResponse {
  /// The date and time that the import request was created.
  final DateTime? creationDateTime;

  /// A unique identifier for the import.
  final String? importId;

  /// The current status of the import. When the status is <code>Complete</code>
  /// the bot, bot alias, or custom vocabulary is ready to use.
  final ImportStatus? importStatus;

  /// The strategy used when there was a name conflict between the imported
  /// resource and an existing resource. When the merge strategy is
  /// <code>FailOnConflict</code> existing resources are not overwritten and the
  /// import fails.
  final MergeStrategy? mergeStrategy;

  /// The parameters used when importing the resource.
  final ImportResourceSpecification? resourceSpecification;

  StartImportResponse({
    this.creationDateTime,
    this.importId,
    this.importStatus,
    this.mergeStrategy,
    this.resourceSpecification,
  });

  factory StartImportResponse.fromJson(Map<String, dynamic> json) {
    return StartImportResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      importId: json['importId'] as String?,
      importStatus: (json['importStatus'] as String?)?.toImportStatus(),
      mergeStrategy: (json['mergeStrategy'] as String?)?.toMergeStrategy(),
      resourceSpecification: json['resourceSpecification'] != null
          ? ImportResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final importId = this.importId;
    final importStatus = this.importStatus;
    final mergeStrategy = this.mergeStrategy;
    final resourceSpecification = this.resourceSpecification;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (importId != null) 'importId': importId,
      if (importStatus != null) 'importStatus': importStatus.toValue(),
      if (mergeStrategy != null) 'mergeStrategy': mergeStrategy.toValue(),
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
    };
  }
}

/// Defines the messages that Amazon Lex sends to a user to remind them that the
/// bot is waiting for a response.
class StillWaitingResponseSpecification {
  /// How often a message should be sent to the user. Minimum of 1 second, maximum
  /// of 5 minutes.
  final int frequencyInSeconds;

  /// One or more message groups, each containing one or more messages, that
  /// define the prompts that Amazon Lex sends to the user.
  final List<MessageGroup> messageGroups;

  /// If Amazon Lex waits longer than this length of time for a response, it will
  /// stop sending messages.
  final int timeoutInSeconds;

  /// Indicates that the user can interrupt the response by speaking while the
  /// message is being played.
  final bool? allowInterrupt;

  StillWaitingResponseSpecification({
    required this.frequencyInSeconds,
    required this.messageGroups,
    required this.timeoutInSeconds,
    this.allowInterrupt,
  });

  factory StillWaitingResponseSpecification.fromJson(
      Map<String, dynamic> json) {
    return StillWaitingResponseSpecification(
      frequencyInSeconds: json['frequencyInSeconds'] as int,
      messageGroups: (json['messageGroups'] as List)
          .whereNotNull()
          .map((e) => MessageGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeoutInSeconds: json['timeoutInSeconds'] as int,
      allowInterrupt: json['allowInterrupt'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final frequencyInSeconds = this.frequencyInSeconds;
    final messageGroups = this.messageGroups;
    final timeoutInSeconds = this.timeoutInSeconds;
    final allowInterrupt = this.allowInterrupt;
    return {
      'frequencyInSeconds': frequencyInSeconds,
      'messageGroups': messageGroups,
      'timeoutInSeconds': timeoutInSeconds,
      if (allowInterrupt != null) 'allowInterrupt': allowInterrupt,
    };
  }
}

class StopBotRecommendationResponse {
  /// The unique identifier of the bot containing the bot recommendation that is
  /// being stopped.
  final String? botId;

  /// The unique identifier of the bot recommendation that is being stopped.
  final String? botRecommendationId;

  /// The status of the bot recommendation. If the status is Failed, then the
  /// reasons for the failure are listed in the failureReasons field.
  final BotRecommendationStatus? botRecommendationStatus;

  /// The version of the bot containing the recommendation that is being stopped.
  final String? botVersion;

  /// The identifier of the language and locale of the bot response to stop. The
  /// string must match one of the supported locales. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  final String? localeId;

  StopBotRecommendationResponse({
    this.botId,
    this.botRecommendationId,
    this.botRecommendationStatus,
    this.botVersion,
    this.localeId,
  });

  factory StopBotRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return StopBotRecommendationResponse(
      botId: json['botId'] as String?,
      botRecommendationId: json['botRecommendationId'] as String?,
      botRecommendationStatus: (json['botRecommendationStatus'] as String?)
          ?.toBotRecommendationStatus(),
      botVersion: json['botVersion'] as String?,
      localeId: json['localeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botRecommendationId = this.botRecommendationId;
    final botRecommendationStatus = this.botRecommendationStatus;
    final botVersion = this.botVersion;
    final localeId = this.localeId;
    return {
      if (botId != null) 'botId': botId,
      if (botRecommendationId != null)
        'botRecommendationId': botRecommendationId,
      if (botRecommendationStatus != null)
        'botRecommendationStatus': botRecommendationStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (localeId != null) 'localeId': localeId,
    };
  }
}

/// Specifications for the constituent sub slots and the expression for the
/// composite slot.
class SubSlotSetting {
  /// The expression text for defining the constituent sub slots in the composite
  /// slot using logical AND and OR operators.
  final String? expression;

  /// Specifications for the constituent sub slots of a composite slot.
  final Map<String, Specifications>? slotSpecifications;

  SubSlotSetting({
    this.expression,
    this.slotSpecifications,
  });

  factory SubSlotSetting.fromJson(Map<String, dynamic> json) {
    return SubSlotSetting(
      expression: json['expression'] as String?,
      slotSpecifications: (json['slotSpecifications'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, Specifications.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final slotSpecifications = this.slotSpecifications;
    return {
      if (expression != null) 'expression': expression,
      if (slotSpecifications != null) 'slotSpecifications': slotSpecifications,
    };
  }
}

/// Subslot type composition.
class SubSlotTypeComposition {
  /// Name of a constituent sub slot inside a composite slot.
  final String name;

  /// The unique identifier assigned to a slot type. This refers to either a
  /// built-in slot type or the unique slotTypeId of a custom slot type.
  final String slotTypeId;

  SubSlotTypeComposition({
    required this.name,
    required this.slotTypeId,
  });

  factory SubSlotTypeComposition.fromJson(Map<String, dynamic> json) {
    return SubSlotTypeComposition(
      name: json['name'] as String,
      slotTypeId: json['slotTypeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final slotTypeId = this.slotTypeId;
    return {
      'name': name,
      'slotTypeId': slotTypeId,
    };
  }
}

/// Subslot elicitation settings.
///
/// <code>DefaultValueSpecification</code> is a list of default values for a
/// constituent sub slot in a composite slot. Default values are used when
/// Amazon Lex hasn't determined a value for a slot. You can specify default
/// values from context variables, session attributes, and defined values. This
/// is similar to <code>DefaultValueSpecification</code> for slots.
///
/// <code>PromptSpecification</code> is the prompt that Amazon Lex uses to
/// elicit the sub slot value from the user. This is similar to
/// <code>PromptSpecification</code> for slots.
class SubSlotValueElicitationSetting {
  final PromptSpecification promptSpecification;
  final SlotDefaultValueSpecification? defaultValueSpecification;

  /// If you know a specific pattern that users might respond to an Amazon Lex
  /// request for a sub slot value, you can provide those utterances to improve
  /// accuracy. This is optional. In most cases Amazon Lex is capable of
  /// understanding user utterances. This is similar to
  /// <code>SampleUtterances</code> for slots.
  final List<SampleUtterance>? sampleUtterances;
  final WaitAndContinueSpecification? waitAndContinueSpecification;

  SubSlotValueElicitationSetting({
    required this.promptSpecification,
    this.defaultValueSpecification,
    this.sampleUtterances,
    this.waitAndContinueSpecification,
  });

  factory SubSlotValueElicitationSetting.fromJson(Map<String, dynamic> json) {
    return SubSlotValueElicitationSetting(
      promptSpecification: PromptSpecification.fromJson(
          json['promptSpecification'] as Map<String, dynamic>),
      defaultValueSpecification: json['defaultValueSpecification'] != null
          ? SlotDefaultValueSpecification.fromJson(
              json['defaultValueSpecification'] as Map<String, dynamic>)
          : null,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => SampleUtterance.fromJson(e as Map<String, dynamic>))
          .toList(),
      waitAndContinueSpecification: json['waitAndContinueSpecification'] != null
          ? WaitAndContinueSpecification.fromJson(
              json['waitAndContinueSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final promptSpecification = this.promptSpecification;
    final defaultValueSpecification = this.defaultValueSpecification;
    final sampleUtterances = this.sampleUtterances;
    final waitAndContinueSpecification = this.waitAndContinueSpecification;
    return {
      'promptSpecification': promptSpecification,
      if (defaultValueSpecification != null)
        'defaultValueSpecification': defaultValueSpecification,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (waitAndContinueSpecification != null)
        'waitAndContinueSpecification': waitAndContinueSpecification,
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

/// Specifies the text input specifications.
class TextInputSpecification {
  /// Time for which a bot waits before re-prompting a customer for text input.
  final int startTimeoutMs;

  TextInputSpecification({
    required this.startTimeoutMs,
  });

  factory TextInputSpecification.fromJson(Map<String, dynamic> json) {
    return TextInputSpecification(
      startTimeoutMs: json['startTimeoutMs'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final startTimeoutMs = this.startTimeoutMs;
    return {
      'startTimeoutMs': startTimeoutMs,
    };
  }
}

/// Defines the Amazon CloudWatch Logs destination log group for conversation
/// text logs.
class TextLogDestination {
  /// Defines the Amazon CloudWatch Logs log group where text and metadata logs
  /// are delivered.
  final CloudWatchLogGroupLogDestination cloudWatch;

  TextLogDestination({
    required this.cloudWatch,
  });

  factory TextLogDestination.fromJson(Map<String, dynamic> json) {
    return TextLogDestination(
      cloudWatch: CloudWatchLogGroupLogDestination.fromJson(
          json['cloudWatch'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatch = this.cloudWatch;
    return {
      'cloudWatch': cloudWatch,
    };
  }
}

/// Defines settings to enable text conversation logs.
class TextLogSetting {
  final TextLogDestination destination;

  /// Determines whether conversation logs should be stored for an alias.
  final bool enabled;

  TextLogSetting({
    required this.destination,
    required this.enabled,
  });

  factory TextLogSetting.fromJson(Map<String, dynamic> json) {
    return TextLogSetting(
      destination: TextLogDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final enabled = this.enabled;
    return {
      'destination': destination,
      'enabled': enabled,
    };
  }
}

enum TimeDimension {
  hours,
  days,
  weeks,
}

extension TimeDimensionValueExtension on TimeDimension {
  String toValue() {
    switch (this) {
      case TimeDimension.hours:
        return 'Hours';
      case TimeDimension.days:
        return 'Days';
      case TimeDimension.weeks:
        return 'Weeks';
    }
  }
}

extension TimeDimensionFromString on String {
  TimeDimension toTimeDimension() {
    switch (this) {
      case 'Hours':
        return TimeDimension.hours;
      case 'Days':
        return TimeDimension.days;
      case 'Weeks':
        return TimeDimension.weeks;
    }
    throw Exception('$this is not known in enum TimeDimension');
  }
}

/// The object representing the filter that Amazon Lex will use to select the
/// appropriate transcript.
class TranscriptFilter {
  /// The object representing the filter that Amazon Lex will use to select the
  /// appropriate transcript when the transcript format is the Amazon Lex format.
  final LexTranscriptFilter? lexTranscriptFilter;

  TranscriptFilter({
    this.lexTranscriptFilter,
  });

  factory TranscriptFilter.fromJson(Map<String, dynamic> json) {
    return TranscriptFilter(
      lexTranscriptFilter: json['lexTranscriptFilter'] != null
          ? LexTranscriptFilter.fromJson(
              json['lexTranscriptFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lexTranscriptFilter = this.lexTranscriptFilter;
    return {
      if (lexTranscriptFilter != null)
        'lexTranscriptFilter': lexTranscriptFilter,
    };
  }
}

enum TranscriptFormat {
  lex,
}

extension TranscriptFormatValueExtension on TranscriptFormat {
  String toValue() {
    switch (this) {
      case TranscriptFormat.lex:
        return 'Lex';
    }
  }
}

extension TranscriptFormatFromString on String {
  TranscriptFormat toTranscriptFormat() {
    switch (this) {
      case 'Lex':
        return TranscriptFormat.lex;
    }
    throw Exception('$this is not known in enum TranscriptFormat');
  }
}

/// Indicates the setting of the location where the transcript is stored.
class TranscriptSourceSetting {
  /// Indicates the setting of the Amazon S3 bucket where the transcript is
  /// stored.
  final S3BucketTranscriptSource? s3BucketTranscriptSource;

  TranscriptSourceSetting({
    this.s3BucketTranscriptSource,
  });

  factory TranscriptSourceSetting.fromJson(Map<String, dynamic> json) {
    return TranscriptSourceSetting(
      s3BucketTranscriptSource: json['s3BucketTranscriptSource'] != null
          ? S3BucketTranscriptSource.fromJson(
              json['s3BucketTranscriptSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketTranscriptSource = this.s3BucketTranscriptSource;
    return {
      if (s3BucketTranscriptSource != null)
        's3BucketTranscriptSource': s3BucketTranscriptSource,
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

class UpdateBotAliasResponse {
  /// The identifier of the updated bot alias.
  final String? botAliasId;

  /// The updated Lambda functions to use in each locale for the bot alias.
  final Map<String, BotAliasLocaleSettings>? botAliasLocaleSettings;

  /// The updated name of the bot alias.
  final String? botAliasName;

  /// The current status of the bot alias. When the status is
  /// <code>Available</code> the alias is ready for use.
  final BotAliasStatus? botAliasStatus;

  /// The identifier of the bot with the updated alias.
  final String? botId;

  /// The updated version of the bot that the alias points to.
  final String? botVersion;

  /// The updated settings for storing conversation logs in Amazon CloudWatch Logs
  /// and Amazon S3 buckets.
  final ConversationLogSettings? conversationLogSettings;

  /// A timestamp of the date and time that the bot was created.
  final DateTime? creationDateTime;

  /// The updated description of the bot alias.
  final String? description;

  /// A timestamp of the date and time that the bot was last updated.
  final DateTime? lastUpdatedDateTime;
  final SentimentAnalysisSettings? sentimentAnalysisSettings;

  UpdateBotAliasResponse({
    this.botAliasId,
    this.botAliasLocaleSettings,
    this.botAliasName,
    this.botAliasStatus,
    this.botId,
    this.botVersion,
    this.conversationLogSettings,
    this.creationDateTime,
    this.description,
    this.lastUpdatedDateTime,
    this.sentimentAnalysisSettings,
  });

  factory UpdateBotAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBotAliasResponse(
      botAliasId: json['botAliasId'] as String?,
      botAliasLocaleSettings: (json['botAliasLocaleSettings']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, BotAliasLocaleSettings.fromJson(e as Map<String, dynamic>))),
      botAliasName: json['botAliasName'] as String?,
      botAliasStatus: (json['botAliasStatus'] as String?)?.toBotAliasStatus(),
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      conversationLogSettings: json['conversationLogSettings'] != null
          ? ConversationLogSettings.fromJson(
              json['conversationLogSettings'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      sentimentAnalysisSettings: json['sentimentAnalysisSettings'] != null
          ? SentimentAnalysisSettings.fromJson(
              json['sentimentAnalysisSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botAliasLocaleSettings = this.botAliasLocaleSettings;
    final botAliasName = this.botAliasName;
    final botAliasStatus = this.botAliasStatus;
    final botId = this.botId;
    final botVersion = this.botVersion;
    final conversationLogSettings = this.conversationLogSettings;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final sentimentAnalysisSettings = this.sentimentAnalysisSettings;
    return {
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botAliasLocaleSettings != null)
        'botAliasLocaleSettings': botAliasLocaleSettings,
      if (botAliasName != null) 'botAliasName': botAliasName,
      if (botAliasStatus != null) 'botAliasStatus': botAliasStatus.toValue(),
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (conversationLogSettings != null)
        'conversationLogSettings': conversationLogSettings,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (sentimentAnalysisSettings != null)
        'sentimentAnalysisSettings': sentimentAnalysisSettings,
    };
  }
}

class UpdateBotLocaleResponse {
  /// The identifier of the bot that contains the updated locale.
  final String? botId;

  /// The current status of the locale. When the bot status is <code>Built</code>
  /// the locale is ready for use.
  final BotLocaleStatus? botLocaleStatus;

  /// The version of the bot that contains the updated locale.
  final String? botVersion;

  /// A timestamp of the date and time that the locale was created.
  final DateTime? creationDateTime;

  /// The updated description of the locale.
  final String? description;

  /// If the <code>botLocaleStatus</code> is <code>Failed</code>, the
  /// <code>failureReasons</code> field lists the errors that occurred while
  /// building the bot.
  final List<String>? failureReasons;

  /// A timestamp of the date and time that the locale was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The language and locale of the updated bot locale.
  final String? localeId;

  /// The updated locale name for the locale.
  final String? localeName;

  /// The updated confidence threshold for inserting the
  /// <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> intents in the list of possible
  /// intents for an utterance.
  final double? nluIntentConfidenceThreshold;

  /// Recommended actions to take to resolve an error in the
  /// <code>failureReasons</code> field.
  final List<String>? recommendedActions;

  /// The updated Amazon Polly voice to use for voice interaction with the user.
  final VoiceSettings? voiceSettings;

  UpdateBotLocaleResponse({
    this.botId,
    this.botLocaleStatus,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.failureReasons,
    this.lastUpdatedDateTime,
    this.localeId,
    this.localeName,
    this.nluIntentConfidenceThreshold,
    this.recommendedActions,
    this.voiceSettings,
  });

  factory UpdateBotLocaleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBotLocaleResponse(
      botId: json['botId'] as String?,
      botLocaleStatus:
          (json['botLocaleStatus'] as String?)?.toBotLocaleStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      localeName: json['localeName'] as String?,
      nluIntentConfidenceThreshold:
          json['nluIntentConfidenceThreshold'] as double?,
      recommendedActions: (json['recommendedActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      voiceSettings: json['voiceSettings'] != null
          ? VoiceSettings.fromJson(
              json['voiceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botLocaleStatus = this.botLocaleStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final localeName = this.localeName;
    final nluIntentConfidenceThreshold = this.nluIntentConfidenceThreshold;
    final recommendedActions = this.recommendedActions;
    final voiceSettings = this.voiceSettings;
    return {
      if (botId != null) 'botId': botId,
      if (botLocaleStatus != null) 'botLocaleStatus': botLocaleStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (localeName != null) 'localeName': localeName,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (recommendedActions != null) 'recommendedActions': recommendedActions,
      if (voiceSettings != null) 'voiceSettings': voiceSettings,
    };
  }
}

class UpdateBotRecommendationResponse {
  /// The unique identifier of the bot containing the bot recommendation that has
  /// been updated.
  final String? botId;

  /// The unique identifier of the bot recommendation to be updated.
  final String? botRecommendationId;

  /// The status of the bot recommendation.
  ///
  /// If the status is Failed, then the reasons for the failure are listed in the
  /// failureReasons field.
  final BotRecommendationStatus? botRecommendationStatus;

  /// The version of the bot containing the bot recommendation that has been
  /// updated.
  final String? botVersion;

  /// A timestamp of the date and time that the bot recommendation was created.
  final DateTime? creationDateTime;

  /// The object representing the passwords that were used to encrypt the data
  /// related to the bot recommendation results, as well as the KMS key ARN used
  /// to encrypt the associated metadata.
  final EncryptionSetting? encryptionSetting;

  /// A timestamp of the date and time that the bot recommendation was last
  /// updated.
  final DateTime? lastUpdatedDateTime;

  /// The identifier of the language and locale of the bot recommendation to
  /// update. The string must match one of the supported locales. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a>
  final String? localeId;

  /// The object representing the Amazon S3 bucket containing the transcript, as
  /// well as the associated metadata.
  final TranscriptSourceSetting? transcriptSourceSetting;

  UpdateBotRecommendationResponse({
    this.botId,
    this.botRecommendationId,
    this.botRecommendationStatus,
    this.botVersion,
    this.creationDateTime,
    this.encryptionSetting,
    this.lastUpdatedDateTime,
    this.localeId,
    this.transcriptSourceSetting,
  });

  factory UpdateBotRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBotRecommendationResponse(
      botId: json['botId'] as String?,
      botRecommendationId: json['botRecommendationId'] as String?,
      botRecommendationStatus: (json['botRecommendationStatus'] as String?)
          ?.toBotRecommendationStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      encryptionSetting: json['encryptionSetting'] != null
          ? EncryptionSetting.fromJson(
              json['encryptionSetting'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      transcriptSourceSetting: json['transcriptSourceSetting'] != null
          ? TranscriptSourceSetting.fromJson(
              json['transcriptSourceSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botRecommendationId = this.botRecommendationId;
    final botRecommendationStatus = this.botRecommendationStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final encryptionSetting = this.encryptionSetting;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final transcriptSourceSetting = this.transcriptSourceSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botRecommendationId != null)
        'botRecommendationId': botRecommendationId,
      if (botRecommendationStatus != null)
        'botRecommendationStatus': botRecommendationStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (encryptionSetting != null) 'encryptionSetting': encryptionSetting,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (transcriptSourceSetting != null)
        'transcriptSourceSetting': transcriptSourceSetting,
    };
  }
}

class UpdateBotResponse {
  /// The unique identifier of the bot that was updated.
  final String? botId;

  /// The list of bot members in the network that was updated.
  final List<BotMember>? botMembers;

  /// The name of the bot after the update.
  final String? botName;

  /// Shows the current status of the bot. The bot is first in the
  /// <code>Creating</code> status. Once the bot is read for use, it changes to
  /// the <code>Available</code> status. After the bot is created, you can use the
  /// <code>DRAFT</code> version of the bot.
  final BotStatus? botStatus;

  /// The type of the bot that was updated.
  final BotType? botType;

  /// A timestamp of the date and time that the bot was created.
  final DateTime? creationDateTime;

  /// The data privacy settings for the bot after the update.
  final DataPrivacy? dataPrivacy;

  /// The description of the bot after the update.
  final String? description;

  /// The session timeout, in seconds, for the bot after the update.
  final int? idleSessionTTLInSeconds;

  /// A timestamp of the date and time that the bot was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of the IAM role used by the bot after the
  /// update.
  final String? roleArn;

  UpdateBotResponse({
    this.botId,
    this.botMembers,
    this.botName,
    this.botStatus,
    this.botType,
    this.creationDateTime,
    this.dataPrivacy,
    this.description,
    this.idleSessionTTLInSeconds,
    this.lastUpdatedDateTime,
    this.roleArn,
  });

  factory UpdateBotResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBotResponse(
      botId: json['botId'] as String?,
      botMembers: (json['botMembers'] as List?)
          ?.whereNotNull()
          .map((e) => BotMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      botName: json['botName'] as String?,
      botStatus: (json['botStatus'] as String?)?.toBotStatus(),
      botType: (json['botType'] as String?)?.toBotType(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      dataPrivacy: json['dataPrivacy'] != null
          ? DataPrivacy.fromJson(json['dataPrivacy'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botMembers = this.botMembers;
    final botName = this.botName;
    final botStatus = this.botStatus;
    final botType = this.botType;
    final creationDateTime = this.creationDateTime;
    final dataPrivacy = this.dataPrivacy;
    final description = this.description;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final roleArn = this.roleArn;
    return {
      if (botId != null) 'botId': botId,
      if (botMembers != null) 'botMembers': botMembers,
      if (botName != null) 'botName': botName,
      if (botStatus != null) 'botStatus': botStatus.toValue(),
      if (botType != null) 'botType': botType.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (dataPrivacy != null) 'dataPrivacy': dataPrivacy,
      if (description != null) 'description': description,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

class UpdateExportResponse {
  /// The date and time that the export was created.
  final DateTime? creationDateTime;

  /// The unique identifier Amazon Lex assigned to the export.
  final String? exportId;

  /// The status of the export. When the status is <code>Completed</code> the
  /// export archive is available for download.
  final ExportStatus? exportStatus;

  /// The file format used for the files that define the resource. The
  /// <code>TSV</code> format is required to export a custom vocabulary only;
  /// otherwise use <code>LexJson</code> format.
  final ImportExportFileFormat? fileFormat;

  /// The date and time that the export was last updated.
  final DateTime? lastUpdatedDateTime;

  /// A description of the type of resource that was exported, either a bot or a
  /// bot locale.
  final ExportResourceSpecification? resourceSpecification;

  UpdateExportResponse({
    this.creationDateTime,
    this.exportId,
    this.exportStatus,
    this.fileFormat,
    this.lastUpdatedDateTime,
    this.resourceSpecification,
  });

  factory UpdateExportResponse.fromJson(Map<String, dynamic> json) {
    return UpdateExportResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      exportId: json['exportId'] as String?,
      exportStatus: (json['exportStatus'] as String?)?.toExportStatus(),
      fileFormat: (json['fileFormat'] as String?)?.toImportExportFileFormat(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      resourceSpecification: json['resourceSpecification'] != null
          ? ExportResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final exportId = this.exportId;
    final exportStatus = this.exportStatus;
    final fileFormat = this.fileFormat;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final resourceSpecification = this.resourceSpecification;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (exportId != null) 'exportId': exportId,
      if (exportStatus != null) 'exportStatus': exportStatus.toValue(),
      if (fileFormat != null) 'fileFormat': fileFormat.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
    };
  }
}

class UpdateIntentResponse {
  /// The identifier of the bot that contains the intent.
  final String? botId;

  /// The version of the bot that contains the intent. Will always be
  /// <code>DRAFT</code>.
  final String? botVersion;

  /// A timestamp of when the intent was created.
  final DateTime? creationDateTime;

  /// The updated description of the intent.
  final String? description;

  /// The updated Lambda function called during each turn of the conversation with
  /// the user.
  final DialogCodeHookSettings? dialogCodeHook;

  /// The updated Lambda function called when the intent is ready for fulfillment.
  final FulfillmentCodeHookSettings? fulfillmentCodeHook;

  /// <p/>
  final InitialResponseSetting? initialResponseSetting;

  /// The updated list of contexts that must be active for the intent to be
  /// considered by Amazon Lex.
  final List<InputContext>? inputContexts;

  /// The updated response that Amazon Lex sends the user when the intent is
  /// closed.
  final IntentClosingSetting? intentClosingSetting;

  /// The updated prompts that Amazon Lex sends to the user to confirm the
  /// completion of an intent.
  final IntentConfirmationSetting? intentConfirmationSetting;

  /// The identifier of the intent that was updated.
  final String? intentId;

  /// The updated name of the intent.
  final String? intentName;

  /// The updated configuration for connecting to an Amazon Kendra index with the
  /// <code>AMAZON.KendraSearchIntent</code> intent.
  final KendraConfiguration? kendraConfiguration;

  /// A timestamp of the last time that the intent was modified.
  final DateTime? lastUpdatedDateTime;

  /// The updated language and locale of the intent.
  final String? localeId;

  /// The updated list of contexts that Amazon Lex activates when the intent is
  /// fulfilled.
  final List<OutputContext>? outputContexts;

  /// The updated built-in intent that is the parent of this intent.
  final String? parentIntentSignature;

  /// The updated list of sample utterances for the intent.
  final List<SampleUtterance>? sampleUtterances;

  /// The updated list of slots and their priorities that are elicited from the
  /// user for the intent.
  final List<SlotPriority>? slotPriorities;

  UpdateIntentResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.dialogCodeHook,
    this.fulfillmentCodeHook,
    this.initialResponseSetting,
    this.inputContexts,
    this.intentClosingSetting,
    this.intentConfirmationSetting,
    this.intentId,
    this.intentName,
    this.kendraConfiguration,
    this.lastUpdatedDateTime,
    this.localeId,
    this.outputContexts,
    this.parentIntentSignature,
    this.sampleUtterances,
    this.slotPriorities,
  });

  factory UpdateIntentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIntentResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      dialogCodeHook: json['dialogCodeHook'] != null
          ? DialogCodeHookSettings.fromJson(
              json['dialogCodeHook'] as Map<String, dynamic>)
          : null,
      fulfillmentCodeHook: json['fulfillmentCodeHook'] != null
          ? FulfillmentCodeHookSettings.fromJson(
              json['fulfillmentCodeHook'] as Map<String, dynamic>)
          : null,
      initialResponseSetting: json['initialResponseSetting'] != null
          ? InitialResponseSetting.fromJson(
              json['initialResponseSetting'] as Map<String, dynamic>)
          : null,
      inputContexts: (json['inputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => InputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      intentClosingSetting: json['intentClosingSetting'] != null
          ? IntentClosingSetting.fromJson(
              json['intentClosingSetting'] as Map<String, dynamic>)
          : null,
      intentConfirmationSetting: json['intentConfirmationSetting'] != null
          ? IntentConfirmationSetting.fromJson(
              json['intentConfirmationSetting'] as Map<String, dynamic>)
          : null,
      intentId: json['intentId'] as String?,
      intentName: json['intentName'] as String?,
      kendraConfiguration: json['kendraConfiguration'] != null
          ? KendraConfiguration.fromJson(
              json['kendraConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      outputContexts: (json['outputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentIntentSignature: json['parentIntentSignature'] as String?,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => SampleUtterance.fromJson(e as Map<String, dynamic>))
          .toList(),
      slotPriorities: (json['slotPriorities'] as List?)
          ?.whereNotNull()
          .map((e) => SlotPriority.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final dialogCodeHook = this.dialogCodeHook;
    final fulfillmentCodeHook = this.fulfillmentCodeHook;
    final initialResponseSetting = this.initialResponseSetting;
    final inputContexts = this.inputContexts;
    final intentClosingSetting = this.intentClosingSetting;
    final intentConfirmationSetting = this.intentConfirmationSetting;
    final intentId = this.intentId;
    final intentName = this.intentName;
    final kendraConfiguration = this.kendraConfiguration;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final outputContexts = this.outputContexts;
    final parentIntentSignature = this.parentIntentSignature;
    final sampleUtterances = this.sampleUtterances;
    final slotPriorities = this.slotPriorities;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (fulfillmentCodeHook != null)
        'fulfillmentCodeHook': fulfillmentCodeHook,
      if (initialResponseSetting != null)
        'initialResponseSetting': initialResponseSetting,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (intentClosingSetting != null)
        'intentClosingSetting': intentClosingSetting,
      if (intentConfirmationSetting != null)
        'intentConfirmationSetting': intentConfirmationSetting,
      if (intentId != null) 'intentId': intentId,
      if (intentName != null) 'intentName': intentName,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slotPriorities != null) 'slotPriorities': slotPriorities,
    };
  }
}

class UpdateResourcePolicyResponse {
  /// The Amazon Resource Name (ARN) of the bot or bot alias that the resource
  /// policy is attached to.
  final String? resourceArn;

  /// The current revision of the resource policy. Use the revision ID to make
  /// sure that you are updating the most current version of a resource policy
  /// when you add a policy statement to a resource, delete a resource, or update
  /// a resource.
  final String? revisionId;

  UpdateResourcePolicyResponse({
    this.resourceArn,
    this.revisionId,
  });

  factory UpdateResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResourcePolicyResponse(
      resourceArn: json['resourceArn'] as String?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final revisionId = this.revisionId;
    return {
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class UpdateSlotResponse {
  /// The identifier of the bot that contains the slot.
  final String? botId;

  /// The identifier of the slot version that contains the slot. Will always be
  /// <code>DRAFT</code>.
  final String? botVersion;

  /// The timestamp of the date and time that the slot was created.
  final DateTime? creationDateTime;

  /// The updated description of the bot.
  final String? description;

  /// The intent that contains the slot.
  final String? intentId;

  /// The timestamp of the date and time that the slot was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The locale that contains the slot.
  final String? localeId;

  /// Indicates whether the slot accepts multiple values in one response.
  final MultipleValuesSetting? multipleValuesSetting;

  /// The updated setting that determines whether the slot value is obfuscated in
  /// the Amazon CloudWatch logs.
  final ObfuscationSetting? obfuscationSetting;

  /// The unique identifier of the slot that was updated.
  final String? slotId;

  /// The updated name of the slot.
  final String? slotName;

  /// The updated identifier of the slot type that provides values for the slot.
  final String? slotTypeId;

  /// Specifications for the constituent sub slots and the expression for the
  /// composite slot.
  final SubSlotSetting? subSlotSetting;

  /// The updated prompts that Amazon Lex sends to the user to elicit a response
  /// that provides a value for the slot.
  final SlotValueElicitationSetting? valueElicitationSetting;

  UpdateSlotResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.description,
    this.intentId,
    this.lastUpdatedDateTime,
    this.localeId,
    this.multipleValuesSetting,
    this.obfuscationSetting,
    this.slotId,
    this.slotName,
    this.slotTypeId,
    this.subSlotSetting,
    this.valueElicitationSetting,
  });

  factory UpdateSlotResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSlotResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      intentId: json['intentId'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      multipleValuesSetting: json['multipleValuesSetting'] != null
          ? MultipleValuesSetting.fromJson(
              json['multipleValuesSetting'] as Map<String, dynamic>)
          : null,
      obfuscationSetting: json['obfuscationSetting'] != null
          ? ObfuscationSetting.fromJson(
              json['obfuscationSetting'] as Map<String, dynamic>)
          : null,
      slotId: json['slotId'] as String?,
      slotName: json['slotName'] as String?,
      slotTypeId: json['slotTypeId'] as String?,
      subSlotSetting: json['subSlotSetting'] != null
          ? SubSlotSetting.fromJson(
              json['subSlotSetting'] as Map<String, dynamic>)
          : null,
      valueElicitationSetting: json['valueElicitationSetting'] != null
          ? SlotValueElicitationSetting.fromJson(
              json['valueElicitationSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final intentId = this.intentId;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final multipleValuesSetting = this.multipleValuesSetting;
    final obfuscationSetting = this.obfuscationSetting;
    final slotId = this.slotId;
    final slotName = this.slotName;
    final slotTypeId = this.slotTypeId;
    final subSlotSetting = this.subSlotSetting;
    final valueElicitationSetting = this.valueElicitationSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (intentId != null) 'intentId': intentId,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (multipleValuesSetting != null)
        'multipleValuesSetting': multipleValuesSetting,
      if (obfuscationSetting != null) 'obfuscationSetting': obfuscationSetting,
      if (slotId != null) 'slotId': slotId,
      if (slotName != null) 'slotName': slotName,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (subSlotSetting != null) 'subSlotSetting': subSlotSetting,
      if (valueElicitationSetting != null)
        'valueElicitationSetting': valueElicitationSetting,
    };
  }
}

class UpdateSlotTypeResponse {
  /// The identifier of the bot that contains the slot type.
  final String? botId;

  /// The version of the bot that contains the slot type. This is always
  /// <code>DRAFT</code>.
  final String? botVersion;

  /// Specifications for a composite slot type.
  final CompositeSlotTypeSetting? compositeSlotTypeSetting;

  /// The timestamp of the date and time that the slot type was created.
  final DateTime? creationDateTime;

  /// The updated description of the slot type.
  final String? description;
  final ExternalSourceSetting? externalSourceSetting;

  /// A timestamp of the date and time that the slot type was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The language and locale of the updated slot type.
  final String? localeId;

  /// The updated signature of the built-in slot type that is the parent of this
  /// slot type.
  final String? parentSlotTypeSignature;

  /// The unique identifier of the updated slot type.
  final String? slotTypeId;

  /// The updated name of the slot type.
  final String? slotTypeName;

  /// The updated values that the slot type provides.
  final List<SlotTypeValue>? slotTypeValues;

  /// The updated strategy that Amazon Lex uses to determine which value to select
  /// from the slot type.
  final SlotValueSelectionSetting? valueSelectionSetting;

  UpdateSlotTypeResponse({
    this.botId,
    this.botVersion,
    this.compositeSlotTypeSetting,
    this.creationDateTime,
    this.description,
    this.externalSourceSetting,
    this.lastUpdatedDateTime,
    this.localeId,
    this.parentSlotTypeSignature,
    this.slotTypeId,
    this.slotTypeName,
    this.slotTypeValues,
    this.valueSelectionSetting,
  });

  factory UpdateSlotTypeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSlotTypeResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      compositeSlotTypeSetting: json['compositeSlotTypeSetting'] != null
          ? CompositeSlotTypeSetting.fromJson(
              json['compositeSlotTypeSetting'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      externalSourceSetting: json['externalSourceSetting'] != null
          ? ExternalSourceSetting.fromJson(
              json['externalSourceSetting'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
      slotTypeId: json['slotTypeId'] as String?,
      slotTypeName: json['slotTypeName'] as String?,
      slotTypeValues: (json['slotTypeValues'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueSelectionSetting: json['valueSelectionSetting'] != null
          ? SlotValueSelectionSetting.fromJson(
              json['valueSelectionSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final compositeSlotTypeSetting = this.compositeSlotTypeSetting;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final externalSourceSetting = this.externalSourceSetting;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final parentSlotTypeSignature = this.parentSlotTypeSignature;
    final slotTypeId = this.slotTypeId;
    final slotTypeName = this.slotTypeName;
    final slotTypeValues = this.slotTypeValues;
    final valueSelectionSetting = this.valueSelectionSetting;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (compositeSlotTypeSetting != null)
        'compositeSlotTypeSetting': compositeSlotTypeSetting,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (externalSourceSetting != null)
        'externalSourceSetting': externalSourceSetting,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeId != null) 'slotTypeId': slotTypeId,
      if (slotTypeName != null) 'slotTypeName': slotTypeName,
      if (slotTypeValues != null) 'slotTypeValues': slotTypeValues,
      if (valueSelectionSetting != null)
        'valueSelectionSetting': valueSelectionSetting,
    };
  }
}

/// Provides parameters for setting the time window and duration for aggregating
/// utterance data.
class UtteranceAggregationDuration {
  /// The desired time window for aggregating utterances.
  final RelativeAggregationDuration relativeAggregationDuration;

  UtteranceAggregationDuration({
    required this.relativeAggregationDuration,
  });

  factory UtteranceAggregationDuration.fromJson(Map<String, dynamic> json) {
    return UtteranceAggregationDuration(
      relativeAggregationDuration: RelativeAggregationDuration.fromJson(
          json['relativeAggregationDuration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final relativeAggregationDuration = this.relativeAggregationDuration;
    return {
      'relativeAggregationDuration': relativeAggregationDuration,
    };
  }
}

enum VoiceEngine {
  standard,
  neural,
}

extension VoiceEngineValueExtension on VoiceEngine {
  String toValue() {
    switch (this) {
      case VoiceEngine.standard:
        return 'standard';
      case VoiceEngine.neural:
        return 'neural';
    }
  }
}

extension VoiceEngineFromString on String {
  VoiceEngine toVoiceEngine() {
    switch (this) {
      case 'standard':
        return VoiceEngine.standard;
      case 'neural':
        return VoiceEngine.neural;
    }
    throw Exception('$this is not known in enum VoiceEngine');
  }
}

/// Defines settings for using an Amazon Polly voice to communicate with a user.
class VoiceSettings {
  /// The identifier of the Amazon Polly voice to use.
  final String voiceId;

  /// Indicates the type of Amazon Polly voice that Amazon Lex should use for
  /// voice interaction with the user. For more information, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/API_SynthesizeSpeech.html#polly-SynthesizeSpeech-request-Engine">
  /// <code>engine</code> parameter of the <code>SynthesizeSpeech</code>
  /// operation</a> in the <i>Amazon Polly developer guide</i>.
  ///
  /// If you do not specify a value, the default is <code>standard</code>.
  final VoiceEngine? engine;

  VoiceSettings({
    required this.voiceId,
    this.engine,
  });

  factory VoiceSettings.fromJson(Map<String, dynamic> json) {
    return VoiceSettings(
      voiceId: json['voiceId'] as String,
      engine: (json['engine'] as String?)?.toVoiceEngine(),
    );
  }

  Map<String, dynamic> toJson() {
    final voiceId = this.voiceId;
    final engine = this.engine;
    return {
      'voiceId': voiceId,
      if (engine != null) 'engine': engine.toValue(),
    };
  }
}

/// Specifies the prompts that Amazon Lex uses while a bot is waiting for
/// customer input.
class WaitAndContinueSpecification {
  /// The response that Amazon Lex sends to indicate that the bot is ready to
  /// continue the conversation.
  final ResponseSpecification continueResponse;

  /// The response that Amazon Lex sends to indicate that the bot is waiting for
  /// the conversation to continue.
  final ResponseSpecification waitingResponse;

  /// Specifies whether the bot will wait for a user to respond. When this field
  /// is false, wait and continue responses for a slot aren't used. If the
  /// <code>active</code> field isn't specified, the default is true.
  final bool? active;

  /// A response that Amazon Lex sends periodically to the user to indicate that
  /// the bot is still waiting for input from the user.
  final StillWaitingResponseSpecification? stillWaitingResponse;

  WaitAndContinueSpecification({
    required this.continueResponse,
    required this.waitingResponse,
    this.active,
    this.stillWaitingResponse,
  });

  factory WaitAndContinueSpecification.fromJson(Map<String, dynamic> json) {
    return WaitAndContinueSpecification(
      continueResponse: ResponseSpecification.fromJson(
          json['continueResponse'] as Map<String, dynamic>),
      waitingResponse: ResponseSpecification.fromJson(
          json['waitingResponse'] as Map<String, dynamic>),
      active: json['active'] as bool?,
      stillWaitingResponse: json['stillWaitingResponse'] != null
          ? StillWaitingResponseSpecification.fromJson(
              json['stillWaitingResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final continueResponse = this.continueResponse;
    final waitingResponse = this.waitingResponse;
    final active = this.active;
    final stillWaitingResponse = this.stillWaitingResponse;
    return {
      'continueResponse': continueResponse,
      'waitingResponse': waitingResponse,
      if (active != null) 'active': active,
      if (stillWaitingResponse != null)
        'stillWaitingResponse': stillWaitingResponse,
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
